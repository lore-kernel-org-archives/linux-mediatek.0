From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [rtc-linux] [PATCH v3 3/3] MAINTAINERS: add Mediatek RTC driver
Date: Wed, 6 May 2015 11:36:47 +0800
Message-ID: <1430883407.28521.4.camel@mtksdaap41>
References: <1430206556-18254-1-git-send-email-eddie.huang@mediatek.com>
	 <1430206556-18254-4-git-send-email-eddie.huang@mediatek.com>
	 <20150505200352.GQ4276@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150505200352.GQ4276@piout.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Samuel Ortiz <sameo@linux.intel.com>, srv_heupstream@mediatek.com, rtc-linux@googlegroups.com, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@google.com>, linux-mediatek@lists.infradead.org, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Alexandre,

On Tue, 2015-05-05 at 22:03 +0200, Alexandre Belloni wrote:
> Hi,
> 
> On 28/04/2015 at 15:35:56 +0800, Eddie Huang wrote :
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2e5bbc0..eb80610 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1223,6 +1223,13 @@ W:	http://www.digriz.org.uk/ts78xx/kernel
> >  S:	Maintained
> >  F:	arch/arm/mach-orion5x/ts78xx-*
> >  
> > +ARM/Mediatek RTC DRIVER
> > +M:	Eddie Huang <eddie.huang@mediatek.com>
> > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> > +S:	Maintained
> > +F:	drivers/rtc/rtc-mt*
> 
> I feel like this is a bit broad. Unless you want to really maintain
> rtc-mt* which I guess may not be only Mediatek in the future, I would
> use the full filename here. You will probably remember to update it if
> you add more, that may not be the case for other developers.
> 
Yes, you are right, the rtc-mt* is too broad, use full filename is a
better choice right now.

Eddie
