on 'build' => sub {
    requires 'Alien::Build'        => '1.19';
    requires 'ExtUtils::MakeMaker' => '6.52';
};

on 'test' => sub {
    requires 'Test2::Suite'       => '0.000122';
    requires 'ExtUtils::CppGuess' => '0.19';
    requires 'ExtUtils::Liblist'  => '6.52';
};

on 'configure' => sub {
    requires 'Alien::Build'                          => '1.19';
    requires 'Alien::Build::Plugin::Build::Premake5' => '0.002';
    requires 'ExtUtils::MakeMaker'                   => '6.52';
    requires 'File::chdir'                           => '0';
};

on 'develop' => sub {
    requires 'Test::Pod' => '1.41';
};
