From: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] checkpatch: support function pointers for unnamed
 function definition arguments
Date: Thu, 14 Sep 2017 18:09:04 +0800
Message-ID: <1505383744.21903.2.camel@mtkswgap22>
References: <1505358082-12997-1-git-send-email-miles.chen@mediatek.com>
         <1505367221.8969.25.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505367221.8969.25.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2017-09-13 at 22:33 -0700, Joe Perches wrote:
> On Thu, 2017-09-14 at 11:01 +0800, Miles Chen wrote:
> > Current unnamed function definition argument does not include function
> > pointer cases and it reports warnings like:
> > 
> > WARNING: function definition argument 'void' should also have an identifier name
> 
> > 
> > Support function pointers for unnamed function arguments.
> > 
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> >  scripts/checkpatch.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index dd2c262..dc6da15 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -5957,7 +5957,7 @@ sub process {
> >  
> >  # check for function declarations that have arguments without identifier names
> >  		if (defined $stat &&
> > -		    $stat =~ /^.\s*(?:extern\s+)?$Type\s*$Ident\s*\(\s*([^{]+)\s*\)\s*;/s &&
> > +		    $stat =~ /^.\s*(?:extern\s+)?$Type\s*\(?\s*\*?\s*$Ident\s*\)\s*\(\s*([^{]+)\s*\)\s*;/s &&
> 
> Better would be to specifically support function pointers like:
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 05dd72693621..7289c1eb0b19 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5957,7 +5957,7 @@ sub process {
>  
>  # check for function declarations that have arguments without identifier names
>  		if (defined $stat &&
> -		    $stat =~ /^.\s*(?:extern\s+)?$Type\s*$Ident\s*\(\s*([^{]+)\s*\)\s*;/s &&
> +		    $stat =~ /^.\s*(?:extern\s+)?$Type\s*(?:$Ident|\(\s*\*\s*$Ident\s*\))\s*\(\s*([^{]+)\s*\)\s*;/s &&

Hi Joe,

thanks for the advise, it looks better.
I'll verify this patch and submit it again

Miles
>  		    $1 ne "void") {
>  			my $args = trim($1);
>  			while ($args =~ m/\s*($Type\s*(?:$Ident|\(\s*\*\s*$Ident?\s*\)\s*$balanced_parens)?)/g) {
> 
