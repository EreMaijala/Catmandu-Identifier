package Catmandu::Fix::ip_to_host;

use Catmandu::Sane;
use Socket;
use Moo;
use Catmandu::Fix::Has;

has path => (fix_arg => 1);

with 'Catmandu::Fix::SimpleGetValue';

sub emit_value {
  my ($self, $var) = @_;

  "if (is_value(${var}) && length(${var})) {" .
      "${var} =  gethostbyaddr(Socket::inet_aton(${var}),Socket::AF_INET) // ${var}; " .
  "}";
}

=head1 NAME

Catmandu::Fix::ip_to_host - translates an ip adress to a hostname

=head1 SYNOPSIS

  # Translate 192.30.252.154 to a hostname
  # e.g. ipaddr => '192.30.252.154'

  ip_to_host(ipaddr) # ipaddr => 'pages.github.com'

=head1 SEE ALSO

L<Catmandu::Fix>

=cut

1;
