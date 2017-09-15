#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use File::Slurper qw(read_lines);

my $file_name = shift || "mujeres-en-informática-desde-1986.csv"; # Archivo en formato raw sin líneas iniciales

my @file = read_lines($file_name, "latin1");

die "No se lee el fichero $file_name" if !@file;

shift @file;
my %data;

while (my $line = shift @file) {
  my ($uni,$curso,$genero,$valor) =split(", ", $line);
  push @{$data{$uni}}, [$curso,$genero,$valor];
}

#Quita de la pública la UNED
my ($latin_key) = grep(/Universidades P/, keys %data);
my ($latin_key_uned) = grep(/Nacional de/, keys %data);
for (my $i = 0; $i < @{$data{$latin_key}}; $i++) {
  my ($curso) = ($data{$latin_key}[$i][0] =~ /\"(\S+)\"/);
  my $diferencia = $data{$latin_key_uned}[$i]?($data{$latin_key}[$i][2]-$data{$latin_key_uned}[$i][2]):$data{$latin_key}[$i][2];
  push @{$data{"Unis sin UNED"}}, [$curso,
				   $data{$latin_key}[$i][1],
				   $diferencia];
}

delete $data{$latin_key};
delete $data{$latin_key_uned};


say "Universidad,Curso,Genero,Valor";

for my $u ( sort { $a cmp $b } keys %data ) {
  for (my $i = 0; $i < @{$data{$u}}; $i++) {
    say "$u, ", join( ", ", @{$data{$u}[$i]});
  }
}
