From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH v4 2/3] rtc: mediatek: Add MT6397 RTC driver
Date: Thu, 7 May 2015 14:06:01 +0200
Message-ID: <20150507120601.GH3465@piout.net>
References: <1430897022-63357-1-git-send-email-eddie.huang@mediatek.com>
 <1430897022-63357-3-git-send-email-eddie.huang@mediatek.com>
 <1430898299.9365.74.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430898299.9365.74.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Tomasz Figa <tfiga@google.com>, Tianping Fang <tianping.fang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On 06/05/2015 at 00:44:59 -0700, Joe Perches wrote :
> On Wed, 2015-05-06 at 15:23 +0800, Eddie Huang wrote:
> > From: Tianping Fang <tianping.fang@mediatek.com>
> 
> trivia: no need to resend now, maybe in a future patch.
> 
> > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> []
> > +static int mtk_rtc_probe(struct platform_device *pdev)
> > +{
> []
> > +	ret = request_threaded_irq(rtc->irq, NULL,
> > +				   mtk_rtc_irq_handler_thread,
> > +				   IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> > +			"mt6397-rtc", rtc);
> 
> It'd be nicer to align all the statement lines
> to that open parenthesis
> 
> 

I'll fix it up when applying.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
