#!/usr/bin/env perl

use strict;
use warnings;
use DateTime;

# TurbineID, Timestamp, SignalName, SignalValue

my $NumTurbines = 1;
my $NumData = 100000;
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

my $timestamp = DateTime->now;
$timestamp->subtract( days => 2 );

for (0 .. $NumData-1) {
    my $turbineID = int( rand( $NumTurbines ) );
    $timestamp->add( nanoseconds => rand( 2000000000 ) );
    my $signalName = $SignalName[ rand( $#SignalName ) ];
    my $signalValue = rrand( $SignalRange{ $signalName } );

    my $outstr = sprintf( "%d,%s,%s,%.2f\n", $turbineID, $timestamp, $signalName, $signalValue );
    print $outstr;
}
