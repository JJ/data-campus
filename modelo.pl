#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

my $matriculas_mujeres = 30;
my $matriculas_hombres = 70;
my $mujeres= $matriculas_mujeres*4;
my $hombres= $matriculas_hombres*4;

my @mujeres=($mujeres);
my @hombres=($hombres);

for (my $i = 0; $i <40; $i++) {
    $mujeres=int($mujeres+0.5);
    $hombres=int($hombres+0.5);
    say "$mujeres,$hombres";
    my $egresadas = $mujeres*0.125;
    my $egresados = $hombres*0.1;

    $mujeres = $mujeres - $egresadas + $matriculas_mujeres;
    $hombres = $hombres - $egresados + $matriculas_hombres;
}
