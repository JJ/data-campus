#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use File::Slurper qw(read_lines);

my $file_name = shift || "series-históricas-nacionales-raw.csv"; # Archivo en formato raw sin líneas iniciales

my @file = read_lines($file_name, "latin1");

die "No se lee el fichero $file_name" if !@file;

my @years = grep(/\d/, split(/;/, shift @file));

shift @file; # Cabeceras
say "Universidad,Curso,Género,Valor";
while ( @file ) {
  my $uni_line = shift @file;
  my ($nombre_universidad, @foo) = split(";",$uni_line);
  $nombre_universidad =~ s/"//g;
  my $data_line = shift @file;
  $data_line =~ s/"//g;
  my @data = split(";",$data_line);
  for (my $d=1; $d <= $#data; $d++) {
    my ($data_number) = ($data[$d] =~ /(\d+)/);
    next if !$data_number;
    say "$nombre_universidad, $years[($d-1)/2], ", ($d % 2)?"Total":"Mujeres", ", $data_number";
  }
}


