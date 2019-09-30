From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add reset controller
Date: Mon, 30 Sep 2019 16:17:19 +0800
Message-ID: <1569831439.15728.9.camel@mtksdaap41>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
 <20190928174923.GA25512@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190928174923.GA25512@roeck-us.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, wim@linux-watchdog.org, broonie@kernel.org, yong.liang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, eason.yen@mediatek.com, perex@perex.cz, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, 2019-09-28 at 10:49 -0700, Guenter Roeck wrote:
> On Fri, Sep 27, 2019 at 06:31:55PM +0800, Jiaxin Yu wrote:
> > From: "yong.liang" <yong.liang@mediatek.com>
> > 
> > Provide assert/deassert/reset API in watchdog driver.
> > Register reset controller for toprgu device in watchdog probe.
> > 
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > ---
> >  drivers/watchdog/Kconfig   |   1 +
> >  drivers/watchdog/mtk_wdt.c | 110 ++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 110 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index 2e07caab9db2..629249fe5305 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
> >  	tristate "Mediatek SoCs watchdog support"
> >  	depends on ARCH_MEDIATEK || COMPILE_TEST
> >  	select WATCHDOG_CORE
> > +	select RESET_CONTROLLER
> >  	help
> >  	  Say Y here to include support for the watchdog timer
> >  	  in Mediatek SoCs.

<...snip...> 

> > +static void toprgu_register_reset_controller(struct platform_device *pdev,
> > +					     int regofs)
> > +{
> > +	int ret;
> > +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> > +
> > +	spin_lock_init(&mtk_wdt->reset_controller.lock);
> > +
> > +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
> > +	mtk_wdt->reset_controller.toprgu_swrst_base = mtk_wdt->wdt_base;
> > +	mtk_wdt->reset_controller.regofs = regofs;
> > +	mtk_wdt->reset_controller.rcdev.owner = THIS_MODULE;
> > +	mtk_wdt->reset_controller.rcdev.nr_resets =
> > +				mtk_wdt->dev_comp->sw_rst_num;
> > +	mtk_wdt->reset_controller.rcdev.ops = &toprgu_reset_ops;
> > +	mtk_wdt->reset_controller.rcdev.of_node = pdev->dev.of_node;
> > +	ret = reset_controller_register(&mtk_wdt->reset_controller.rcdev);
> > +	if (ret != 0)
> > +		dev_err(&pdev->dev,
> > +			"couldn't register wdt reset controller: %d\n", ret);
> > +}
> > +
> >  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
> >  			   unsigned long action, void *data)
> >  {
> > @@ -187,9 +287,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >  	if (unlikely(err))
> >  		return err;
> >  
> > -	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> > +	dev_info(&pdev->dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> >  		 mtk_wdt->wdt_dev.timeout, nowayout);
> >  
> > +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
> > +	if (mtk_wdt->dev_comp)
> > +		toprgu_register_reset_controller(pdev, WDT_SWSYSRST);
> 
> Please explain why you can not use the watchdog device built-in support
> for handling system resets.

Guenter,

This is not about system reset.
Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
camera, codec and connectivity) software reset functionality. Software
can use this to reset specific sub-system.

This patch add support for this using reset controller framework. We
follow the case of drivers/clk/mediatek/reset.c to add this
functionality in watchdog driver.

Joe.C
