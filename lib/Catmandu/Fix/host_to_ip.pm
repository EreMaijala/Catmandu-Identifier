package Catmandu::Fix::host_to_ip;

use Catmandu::Sane;
use Socket;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::SimpleGetValue';

sub emit_value {
  my ($self, $var, $fixer) = @_;
  my $tmp_var = $fixer->generate_var;
  
  "if (is_value(${var}) && length(${var})) {" .
      "my ${tmp_var} = gethostbyname(${var});" .
      "${var} = Socket::inet_ntoa(${tmp_var}) if ${tmp_var};" .
  "}";
}

=head1 NAME

Catmandu::Fix::host_to_ip - translates hostname to one or more ip addresses

=head1 SYNOPSIS

  # Translate pages.github.com to an ip address
  # e.g. hostname => 'pages.github.com'

  ip_to_host(hostname) # ipaddr => '23.235.43.133'

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;
