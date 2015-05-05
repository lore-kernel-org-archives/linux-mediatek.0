From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [rtc-linux] [PATCH v3 2/3] rtc: mediatek: Add MT6397 RTC driver
Date: Tue, 5 May 2015 23:01:31 +0200
Message-ID: <20150505210131.GR4276@piout.net>
References: <1430206556-18254-1-git-send-email-eddie.huang@mediatek.com>
 <1430206556-18254-3-git-send-email-eddie.huang@mediatek.com>
 <20150505200010.GP4276@piout.net>
 <1430858661.9365.20.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430858661.9365.20.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Tomasz Figa <tfiga@google.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <kernel@pengutronix.de>, srv_heupstream@mediatek.com, Samuel Ortiz <sameo@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Tianping Fang <tianping.fang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On 05/05/2015 at 13:44:21 -0700, Joe Perches wrote :
> I suggest moving the time_after() test into the loop,
> use break; and remove the exit label too.
> 
> Maybe something like:
> 
> 	while (1) {
> 		ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_BBPU,
> 				  &data);
> 		if (ret < 0)
> 			break;
> 		if (!(data & RTC_BBPU_CBUSY))
> 			break;
> 		if (time_after(jiffies, timeout)) {
> 			ret = -ETIMEDOUT;
> 			break;
> 		}
> 		cpu_relax();
> 	}
> 
> 	return ret;

That certainly looks more readable.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
