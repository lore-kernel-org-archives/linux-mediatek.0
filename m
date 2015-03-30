From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH v2 1/3] mfd: provide RTC resource in MT6397 MFD
Date: Mon, 30 Mar 2015 16:17:03 +0800
Message-ID: <1427703423.26464.16.camel@mtksdaap41>
References: <1426657537-41414-1-git-send-email-eddie.huang@mediatek.com>
	 <1426657537-41414-2-git-send-email-eddie.huang@mediatek.com>
	 <20150318073045.GE3318@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318073045.GE3318@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Jingoo Han <jg1.han@samsung.com>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Uwe =?ISO-8859-1?Q?Kleine-K=C3=B6nig?= <kernel@pengutronix.de>
List-Id: linux-mediatek@lists.infradead.org

Hi Lee,

On Wed, 2015-03-18 at 07:30 +0000, Lee Jones wrote:
> On Wed, 18 Mar 2015, Eddie Huang wrote:
> 
> > Provide MT6397 RTC interrupt, base address, and register in
> > MT6397 MFD.
> > 
> > Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> > ---
> >  drivers/mfd/mt6397-core.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index b61c4eb..ef431d8 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -21,9 +21,24 @@
> >  #include <linux/mfd/mt6397/core.h>
> >  #include <linux/mfd/mt6397/registers.h>
> >  
> > +static const struct resource mt6397_rtc_resources[] = {
> > +	{
> > +		.start = 0xe000,
> > +		.end   = 0xe03e,
> 
> I'd like to see these defined please.
> 
Sure, will change to use define next round.

Eddie
