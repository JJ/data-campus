#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

use v5.14;

use File::Slurper qw(read_lines);

my @total_file = read_lines("mujeres-en-informática-desde-1986-sin-UNED.csv","latin1");
my @graduados_file = read_lines("graduados-en-informática.csv","latin1");

my %total;
shift @total_file;
shift @graduados_file;
for my $t (@total_file) {
  my ($uni,$curso,$genero,$valor)=split(",",$t);
  $total{$uni."_".$curso."_".$genero} = $valor;
}

say "Universidad,Curso,Genero,Graduados,Total";
for my $t (@graduados_file) {
  my ($uni,$curso,$genero,$valor)=split(/,\s+/,$t);
  next if !$total{$uni."_".$curso."_".$genero};
  say "$uni,$curso,$genero,$valor,", $total{$uni."_".$curso."_".$genero};
}


