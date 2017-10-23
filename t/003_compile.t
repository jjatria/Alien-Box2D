# t/002_config.t - test config() functionality

use Class::Load qw( try_load_class );
use Test::More;
use Alien::Box2D;
use ExtUtils::CppGuess;
use ExtUtils::Liblist;
use Config;

plan skip_all => 'ExtUtils::CBuilder 0.2703 required for this test'
  unless try_load_class 'ExtUtils::CBuilder', { -version => 0.2703 };

my $cppguess = ExtUtils::CppGuess->new;
my %cppflags = $cppguess->module_build_options;

# Ugly MSVC compiler hack
my $libs = Alien::Box2D->libs;
$libs = ExtUtils::Liblist->ext($libs) if $Config{cc} =~ /cl/;

my $cflags = Alien::Box2D->cflags . ' ' . $cppflags{extra_compiler_flags} . ' ' . $Config{ccflags};
my $lflags = $libs . ' ' . $cppflags{extra_linker_flags} . ' ' . $Config{ldflags};

my $lflags = join q{ }, $libs, $cppflags{extra_linker_flags}, $Config{ldflags};

plan tests => 3;

my $cb = ExtUtils::CBuilder->new(quiet => 0);

my $obj = $cb->compile( source => 't/test1.c', 'C++' => 1, extra_compiler_flags => $cflags );
is( defined $obj, 1, "Compiling test1.c" );

my $exe = $cb->link_executable( objects => [ $obj ], extra_linker_flags => $lflags );
is( defined $exe, 1, "Linking test1.c" );

my $rv = system($exe);
is( $rv, 0, "Executing test1" );

unlink $exe;
