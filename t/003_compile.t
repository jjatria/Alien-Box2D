# t/002_config.t - test config() functionality

use Test2::V0;

use Class::Load qw( try_load_class );
use Alien::Box2D;
use ExtUtils::CppGuess;
use ExtUtils::Liblist;
use Config;

plan skip_all => 'ExtUtils::CBuilder 0.2703 required for this test'
    unless try_load_class 'ExtUtils::CBuilder', { -version => 0.2703 };

my %cppflags = ExtUtils::CppGuess->new->module_build_options;

# Ugly MSVC compiler hack
my $libs = Alien::Box2D->libs;
$libs = ExtUtils::Liblist->ext($libs) if $Config{cc} =~ /cl/;

my $cb = ExtUtils::CBuilder->new( quiet => 0 );

my $obj = $cb->compile(
    source => 't/test1.c',
    'C++' => 1,
    extra_compiler_flags => join( ' ',
        Alien::Box2D->cflags,
        $cppflags{extra_compiler_flags},
        $Config{ccflags},
    ),
);

is $obj, T, 'Compiling test1.c';

my $exe = $cb->link_executable(
    objects => [ $obj ],
    extra_linker_flags => join( ' ',
        $libs,
        $cppflags{extra_linker_flags},
        $Config{ldflags},
    ),
);

is $exe, T, 'Linking test1.c';

is system($exe), 0, 'Executing test1';

unlink $exe if $exe;
unlink $obj if $obj;

done_testing;
