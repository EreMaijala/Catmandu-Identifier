#!/usr/bin/env perl

use strict;
use Test::More;
use Test::Exception;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Fix::host_to_ip';
  use_ok $pkg;
}
require_ok $pkg;

dies_ok {$pkg->new()->fix({id => 'borges.ugent.be'})} "path required";

lives_ok {$pkg->new('id')->fix({id => 'borges.ugent.be'})} "path required";

is_deeply
  $pkg->new('id')->fix({id => 'borges.ugent.be'}),
  {id => '157.193.231.64'},
  "lookup 157.193.231.64";

is_deeply
  $pkg->new('id.*')->fix(
    {id => [
    	'borges.ugent.be' ,
    	'cela.ugent.be' ,
      ]} ),
  {id => ["157.193.231.64","157.193.230.39"]},
  "lookup many host addresses";

is_deeply
  $pkg->new('id')->fix({id => ''}),
  { id => ''},
  "empty host address";

is_deeply
  $pkg->new('id')->fix({}),
  {},
  "missing host address";

done_testing;