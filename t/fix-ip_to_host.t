#!/usr/bin/env perl

use strict;
use Test::More;
use Test::Exception;

my $pkg;
BEGIN {
  $pkg = 'Catmandu::Fix::ip_to_host';
  use_ok $pkg;
}
require_ok $pkg;

dies_ok {$pkg->new()->fix({id => '216.58.208.46'})} "path required";

lives_ok {$pkg->new('id')->fix({id => '216.58.208.46'})} "path required";

is_deeply
  $pkg->new('id')->fix({id => '157.193.231.64'}),
  {id => 'borges.ugent.be'},
  "lookup borges.ugent.be";

is_deeply
  $pkg->new('id.*')->fix(
    {id => [
    	'157.193.231.64' ,
    	'157.193.230.39' ,
      ]} ),
  {id => ["borges.ugent.be","cela.ugent.be"]},
  "lookup many ip addresses";

is_deeply
  $pkg->new('id')->fix({id => ''}),
  { id => ''},
  "empty ip address";

is_deeply
  $pkg->new('id')->fix({}),
  {},
  "missing ip address";

done_testing;