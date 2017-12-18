From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [net-next] phylib: Add device reset GPIO support causes DSA
 MT7530 acquires reset-gpios fails
Date: Mon, 18 Dec 2017 09:01:20 +0100
Message-ID: <20171218080120.GD30815@lunn.ch>
References: <1513320903.28444.65.camel@mtkswgap22>
 <20171215101014.GB4213@lunn.ch>
 <1513569684.24235.12.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1513569684.24235.12.camel@mtkswgap22>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi Sean

> It probably can't. Because before the GPIO line is manipulated to reset,
> certain power control should be handled such as power sources from
> external PMIC to let devices actually enter the proper state.
> 
> So, I thought the kind of reset should be better controlled by the
> specific driver, not by generic core.

Yes, the driver should do it in that case.

So we have a few choices:

1) Change the name of one of the properties

2) Make the new code look at the compatible string, any only apply a
   reset if it is a PHY.

3) Make the new code only hold the gpio when it needs it. Same for the
   driver, so that they both can reset the device.

Any other ideas? Any preferences? 2) and 3) are probably simpler to
do, less backwards compatibility issues. 3) potentially could cause
issues when a device is reset in the wrong context, because of
external PMIC etc. So i'm thinking 2).

	 Andrew
