package Catmandu::Fix::Condition::is_valid_issn;

use Catmandu::Sane;
use Moo;
use Business::ISSN;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::Condition::SimpleAllTest';

sub emit_test {
    my ($self, $var, $parser) = @_;
    "(is_value(${var}) && Business::ISSN->new(${var}) && Business::ISSN->new(${var})->is_valid)";
}

=head1 NAME

Catmandu::Fix::Condition::is_valid_issn - condition on validity of issn numbers

=head1 SYNOPSIS

   if is_valid_issn(issn_field)
     ...
   else
     ...
   end


   # Example how this can be used to check the validity of ISBN numbers in a MARC file
   # Run as: catmandu convert MARC TO MARC --fix marc.fix  < data.mrc
   do marc_each()
      marc_map(022a,issn)

      if is_valid_issn(issn)
        marc_set(022x,"ok")
      else
        marc_set(022x,"not ok")
      end

      remove_field(issn)
   end

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;
