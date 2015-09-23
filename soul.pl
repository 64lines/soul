#!/usr/bin/perl
#################################################
# Application: Secuential wget downloader.      #
#################################################

# Loop for url ranges, it's very cool
sub url_range_loop {
    my ($url) = @_;

    print "(.) Initial range: ";
    $initial_range = <>;

    print "(.) Final range: ";
    $final_range = <>;

    foreach my $i ($initial_range..$final_range) {
        $url_download = $url;
        $url_download =~ s/iii/$i/g;
        print "(*) Downloading...  $url_download\n";
        system("wget $url_download");
    }

    print "\n(*) Ready!\n";
}

# Execute a simple downloader with 'wget' application.
sub execute_downloader {
    print "== SOUL ==\n\n";

    print "(*) Url: ";
    $url = <>;

    print "(*) Do you want to use numeric ranges? (replace the numeric value with 'iii') (Y/N): ";
    $is_range = <>; 
    $yes_condition = $is_range eq "Y\n";

    if ($yes_condition) { 
        url_range_loop($url); 
    } else { 
        system("wget $url"); 
    }  

    print "(*) Press enter to exit\n";
    <>;
}

execute_downloader;
