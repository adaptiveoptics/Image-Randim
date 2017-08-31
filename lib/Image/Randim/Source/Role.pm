package Image::Randim::Source::Role;
use v5.20;
use warnings;
use Moose::Role;
use namespace::autoclean;

requires 'url', 'name';

1;
