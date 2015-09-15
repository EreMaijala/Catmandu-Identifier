package Catmandu::Fix::Condition::is_valid_isbn;

use Catmandu::Sane;
use Moo;
use Business::ISBN;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::Condition::SimpleAllTest';

sub emit_test {
    my ($self, $var) = @_;
    "(is_value(${var}) && Business::ISBN->new(${var}) && Business::ISBN->new(${var})->is_valid)";
}

=head1 NAME

Catmandu::Fix::Condition::is_valid_isbn - condition on validity of isbn numbers

=head1 SYNOPSIS

   if is_valid_isbn(isbn_field)
     ...
   else
     ...
   end

   # Example how this can be used to check the validity of ISBN numbers in a MARC file
   # Run as: catmandu convert MARC TO MARC --fix marc.fix  < data.mrc
   do marc_each()
      marc_map(020a,isbn)

      if is_valid_isbn(isbn)
      	marc_set(020x,"ok")
      else
        marc_set(020x,"not ok")
      end

      remove_field(isbn)
   end

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;
