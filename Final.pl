#Perl script that takes list of hostnames from test.txt, when executed connect to all the servers via SSH and display the output

use strict;
use warnings;
use Net::Ping;
use Net::SSH::Expect;

# You can do SSH authentication with user-password or without it.

my @host_array;
read_file("test.txt")

foreach my $host (@host_array)
{
	my $ping_obj = Net::Ping->new();
	$rv1 = $ping_obj->ping($host);
	if($rv1){
		print "$host is alive.\n"
	    # construct the object
	    my $ssh = Net::SSH::Expect->new(host => $host , 
            port => $port ,
            protocol => 2 ,
            batchMode => 1 ,
            raw_pty => 1,
            debug => 0 );
		# logon to the SSH server.
        # test the login output to make sure we had success
	    my $login_output = $ssh->login();
        if ( $login_output =~ /Last/ ){
			print "The login was successful on $host \n";
        }
		else{
			die "Log in attempt failed with $! \n";
		}
	}
	else{
		print "$host is Not Reachable.\n"
	}
}
#host_array stores the host to connect.              
read_file{
my @host_array;
open(my $fh, "<", "test.txt")
    or die "Failed to open file: $!\n";
while(<$fh>) { 
    chomp; 
    push @host_array, $_;
}
close $fh;
} 







