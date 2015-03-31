From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 2/3] rtc: mediatek: Add MT6397 RTC driver
Date: Tue, 31 Mar 2015 15:01:03 -0700
Message-ID: <20150331150103.c586821d4fddede12551c9ef@linux-foundation.org>
References: <1426657537-41414-1-git-send-email-eddie.huang@mediatek.com>
	<1426657537-41414-3-git-send-email-eddie.huang@mediatek.com>
	<CAKdAkRSRXZ=1T+2Mfvjc4DsCCt1rxqGZpEuOUkU5KfPD2__BnQ@mail.gmail.com>
	<1427703350.26464.15.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427703350.26464.15.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie Huang <eddie.huang@mediatek.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Jingoo Han <jg1.han@samsung.com>, lkml <linux-kernel@vger.kernel.org>, rtc-linux@googlegroups.com, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, Uwe =?ISO-8859-1?Q?Kleine-K=C3=B6ni?= =?ISO-8859-1?Q?g?= <kernel@pengutronix.de>, Tianping Fang <tianping.fang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, 30 Mar 2015 16:15:50 +0800 Eddie Huang <eddie.huang@mediatek.com> wrote:

> > > +out_rtc:
> > > +       rtc_device_unregister(rtc->rtc_dev);
> > 
> > This is wrong. Whenever you jump to this label the RTC device has not
> > been registered yet.
> 
> Oops, will fix in next round.

Please ensure that Uwe's review comments (starting at
https://lkml.org/lkml/2015/3/17/494) have been addressed.
