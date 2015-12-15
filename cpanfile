requires 'perl', 'v5.10.1';

on 'test', sub {
  requires 'Test::Deep', '0.112';
  requires 'Test::Exception', '0.32';
  requires 'Test::More', '1.001003';
  requires 'Test::Pod', 0;
  requires 'Log::Any::Test', '1.03';
  requires 'Test::LWP::UserAgent', '0';

};

requires 'Catmandu', '>=0.94';
requires 'Catmandu::OCLC', 0;
requires 'Catmandu::MARC', '>=0.211';
requires 'Business::ISSN', '0.91';
requires 'Business::ISBN', '2.09';
requires 'Business::ISBN10', 0;
requires 'Business::ISBN13', 0;
requires 'Data::UUID',0;
requires 'LWP::Simple',0;
requires 'WWW::ORCID',0;
requires 'Data::Validate::URI',0;
