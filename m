From: Nishad Kamdar <nishadkamdar@gmail.com>
Subject: Re: [PATCH] MIPS: Select PINCTRL_RT2880 when RALINK is enabled
Date: Wed, 30 Jan 2019 19:56:03 +0530
Message-ID: <20190130142601.GA26071@nishad>
References: <20190129152522.GA24872@nishad>
 <20190129200905.vnb3amouxq6o57fn@pburton-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129200905.vnb3amouxq6o57fn@pburton-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@mips.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, Joe Perches <joe@perches.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Kees Cook <keescook@chromium.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

On Tue, Jan 29, 2019 at 08:09:07PM +0000, Paul Burton wrote:
> Hi Nishad,
> 
> On Tue, Jan 29, 2019 at 08:55:27PM +0530, Nishad Kamdar wrote:
> > This patch selects config PINCTRL_RT2880 when config RALINK is
> > enabled as per drivers/staging/mt7621-pinctrl/TODO list. PINCTRL
> > is also selected when RALINK is enabled to avoid config dependency
> > warnings.
> > 
> > Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> > ---
> >  arch/mips/Kconfig | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > index e2fc88da0223..cea529cf6284 100644
> > --- a/arch/mips/Kconfig
> > +++ b/arch/mips/Kconfig
> > @@ -623,6 +623,8 @@ config RALINK
> >  	select CLKDEV_LOOKUP
> >  	select ARCH_HAS_RESET_CONTROLLER
> >  	select RESET_CONTROLLER
> > +	select PINCTRL
> > +	select PINCTRL_RT2880
> >  
> >  config SGI_IP22
> >  	bool "SGI IP22 (Indy/Indigo2)"
> 
> Wouldn't this also require selecting STAGING? Perhaps that's why it
> wasn't done in the first place?
> 
> Thanks,
>     Paul
Ok, got it.

Thanks for the review.

Regards,
Nishad
