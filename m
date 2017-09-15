From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] checkpatch: support function pointers for unnamed
 function definition arguments
Date: Thu, 14 Sep 2017 23:01:08 -0700
Message-ID: <1505455268.27581.3.camel@perches.com>
References: <1505389925-31087-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505389925-31087-1-git-send-email-miles.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Miles Chen <miles.chen@mediatek.com>, Andy Whitcroft <apw@canonical.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2017-09-14 at 19:52 +0800, Miles Chen wrote:
> Current unnamed function definition argument does not include function
> pointer cases and it reports something like:
> 
> WARNING: function definition argument 'void' should also have an identifier name
> +unsigned int (*dummy)(void);
> 
> Support function pointers for unnamed function arguments
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

Acked-by: Joe Perches <joe@perches.com>

> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index dd2c262..03eb255 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -5957,7 +5957,7 @@ sub process {
>  
>  # check for function declarations that have arguments without identifier names
>  		if (defined $stat &&
> -		    $stat =~ /^.\s*(?:extern\s+)?$Type\s*$Ident\s*\(\s*([^{]+)\s*\)\s*;/s &&
> +		    $stat =~ /^.\s*(?:extern\s+)?$Type\s*(?:$Ident|\(\s*\*\s*$Ident\s*\))\s*\(\s*([^{]+)\s*\)\s*;/s &&
>  		    $1 ne "void") {
>  			my $args = trim($1);
>  			while ($args =~ m/\s*($Type\s*(?:$Ident|\(\s*\*\s*$Ident?\s*\)\s*$balanced_parens)?)/g) {
