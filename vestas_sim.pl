#!/usr/bin/env perl

use strict;
use warnings;
use Time::HiRes qw( time );

# TurbineID, Timestamp, SignalName, SignalValue

my $NumTurbines = 100;
my %SignalRange = (
    wind_speed          => [ 0.0, 35.0 ],   # m/sec
    power               => [ 0.0, 9.0 ],    # MW
    rpm_rotor           => [ 0.0, 20.0 ],   # 1/min
    rpm_generator       => [ 1400.0, 1800.0 ],   # 1/min
    torque_generator    => [ 0.0, 50.0 ],   # kN.m
    angle_blade         => [ 0.0, 90.0 ],   # deg
    v_angle_blade       => [ 0.0, 10.0 ],   # deg/sec            
    wind_direction      => [ -180.0, 180.0 ], # deg
    a_blade             => [ 0.0, 10.0 ],   # m/(sec^2)
    a_tower             => [ 0.0, 10.0 ],   # m/(sec^2)
    strain_blade_root   => [ 0.0, 0.1 ],    # mm
    strain_shaft        => [ 0.0, 0.1 ],    # mm
    strain_tower        => [ 0.0, 0.1 ]     # mm
);
my @SignalName = sort keys %SignalRange;

sub rrand {
    my( $min, $max ) = @{$_[0]};
    rand( $max - $min ) + $min;
}

while ( 1 ) {
    my $turbineID = int( rand( $NumTurbines ) );
    my $timestamp = time;
    my $signalName = $SignalName[ rand( $#SignalName ) ];
    my $signalValue = rrand( $SignalRange{ $signalName } );

    my $outstr = sprintf( "%d,%.3f,%s,%.2f\n", $turbineID, $timestamp, $signalName, $signalValue );
    print $outstr;
    # print join( ",", $turbineID, $timestamp, $signalName, $signalValue ) . "\n";
}
