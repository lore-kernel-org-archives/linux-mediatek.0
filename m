From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: Re: [PATCH] staging: mt7621-pinctrl: Remove space after cast
Date: Fri, 25 Jan 2019 20:47:53 +0530
Message-ID: <20190125151751.GA11257@nishad>
References: <20190123163122.GA4807@nishad>
 <b51b1d3071aec95915d48159c1dd6e0a336cd9f4.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b51b1d3071aec95915d48159c1dd6e0a336cd9f4.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: NeilBrown <neil@brown.name>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Kees Cook <keescook@chromium.org>, John Crispin <blogic@openwrt.org>, devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-mediatek@lists.infradead.org

On Wed, Jan 23, 2019 at 09:45:53AM -0800, Joe Perches wrote:
> On Wed, 2019-01-23 at 22:01 +0530, Nishad Kamdar wrote:
> > This patch removes space after a cast as it
> > is not needed.
> > Issue found by checkpatch.
> > 
> > Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> > ---
> >  drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> > index 80e7067cfb79..3e959fa73703 100644
> > --- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> > +++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> > @@ -363,7 +363,7 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
> >  		}
> >  
> >  		range = devm_kzalloc(p->dev, sizeof(*range) + 4, GFP_KERNEL);
> > -		range->name = name = (char *) &range[1];
> > +		range->name = name = (char *)&range[1];
> >  		sprintf(name, "pio");
> 
> I find this code unsightly and fragile.
> It doesn't test the return of devm_kzalloc for failure.
> 
> This might as well be
> ---
>  drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> index 80e7067cfb79..9b52d44abef1 100644
> --- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> +++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> @@ -350,7 +350,6 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
>  	for_each_compatible_node(np, NULL, "ralink,rt2880-gpio") {
>  		const __be32 *ngpio, *gpiobase;
>  		struct pinctrl_gpio_range *range;
> -		char *name;
>  
>  		if (!of_device_is_available(np))
>  			continue;
> @@ -362,9 +361,10 @@ static int rt2880_pinmux_probe(struct platform_device *pdev)
>  			return -EINVAL;
>  		}
>  
> -		range = devm_kzalloc(p->dev, sizeof(*range) + 4, GFP_KERNEL);
> -		range->name = name = (char *) &range[1];
> -		sprintf(name, "pio");
> +		range = devm_kzalloc(p->dev, sizeof(*range), GFP_KERNEL);
> +		if (!range)
> +			return -ENOMEM;
> +		range->name = "pio";
>  		range->npins = __be32_to_cpu(*ngpio);
>  		range->base = __be32_to_cpu(*gpiobase);
>  		range->pin_base = range->base;
> 	
> 	
> 

Ok, I'll include it as a new patch as I think this one has already been
accepted.

Thanks for the review.

Regards,
Nishad
