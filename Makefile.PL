
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'resolve paths to HTML::Widget::Factory plugins',
  'AUTHOR' => 'Hans Dieter Pearcey, <hdp at pobox.com>',
  'BUILD_REQUIRES' => {
    'HTML::Mason::Resolver::File' => '0',
    'HTML::Mason::Tests' => '0',
    'MasonX::Resolver::Multiplex' => '0',
    'Test::More' => '0.96'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'MasonX-Resolver-WidgetFactory',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'MasonX::Resolver::WidgetFactory',
  'PREREQ_PM' => {
    'Digest::MD5' => '0',
    'File::Spec' => '0',
    'HTML::Mason::Resolver' => '0',
    'HTML::Mason::Tools' => '0',
    'HTML::Widget::Factory' => '0.067',
    'Moose' => '0',
    'Storable' => '0'
  },
  'VERSION' => '0.008',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



