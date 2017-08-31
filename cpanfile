requires 'ExtUtils::MakeMaker' => '6.17';
#requires 'Try::Tiny' => '0.22';
#requires 'Config::Tiny' => '2.23';
requires 'namespace::autoclean' => '0.20';
requires 'Moose' => '2.12';
requires 'REST::Client' => '273';
requires 'LWP::Protocol::https' => '6.06';
requires 'IO::Prompter' => '0.004014';
requires 'Module::Find' => '0.13';
on test => sub {
    requires 'Test::More' => '0.88';
    requires 'Test::Exception' => '0.35';
}
