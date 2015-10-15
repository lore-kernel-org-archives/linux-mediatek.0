From: Chaotian Jing <chaotian.jing-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 3/4] mmc: mediatek: Add tune support
Date: Thu, 15 Oct 2015 16:40:02 +0800
Message-ID: <1444898402.8751.21.camel@mhfsdcap03>
References: <1444729078-26585-1-git-send-email-chaotian.jing@mediatek.com>
 <1444729078-26585-4-git-send-email-chaotian.jing@mediatek.com>
 <20151015062958.GG7825@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20151015062958.GG7825-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, 2015-10-15 at 08:29 +0200, Sascha Hauer wrote:
> Hi,
> 
> On Tue, Oct 13, 2015 at 05:37:57PM +0800, Chaotian Jing wrote:
> > @@ -1260,6 +1547,16 @@ static int msdc_drv_probe(struct platform_device *pdev)
> >  		goto host_free;
> >  	}
> >  
> > +	host->src_clk_parent = clk_get_parent(host->src_clk);
> > +	host->hs400_src = devm_clk_get(&pdev->dev, "400mhz");
> > +	if (IS_ERR(host->hs400_src)) {
> > +		dev_dbg(&pdev->dev, "Cannot find 400mhz at dts!\n");
> > +	} else if (clk_set_parent(host->src_clk_parent, host->hs400_src) < 0) {
> > +		dev_err(host->dev, "Failed to set 400mhz source clock!\n");
> > +		ret = -EINVAL;
> > +		goto host_free;
> > +	}
> 
> This is a static setup. We have device tree bindings for doing this.
> Please look for assigned-clocks and assigned-clock-parents. Doing stuff
> like this in the driver almost certainly leads to problems because the
> next SoC will have different requirements here.
> 

Sorry, I cannot understand it, could you help to give some sample code
about this ?

note the "host->src_clk" is only a clock gate, so must get its
parent(PLL), And, I tried to use clk_set_rate, but it will fail
in our platform, because may be more than one parent have the same clock
frequency. So, use the clk_set_parent to specify it's parent.

> Sascha
> 
