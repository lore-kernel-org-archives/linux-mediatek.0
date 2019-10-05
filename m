From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v2 2/4] watchdog: mtk_wdt: mt8183: Add reset controller
Date: Sat, 5 Oct 2019 13:50:27 +0800
Message-ID: <1570254627.29077.15.camel@mtksdaap41>
References: <1569580317-21181-1-git-send-email-jiaxin.yu@mediatek.com>
 <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1569580317-21181-3-git-send-email-jiaxin.yu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, yong.liang@mediatek.com, robh+dt@kernel.org, lgirdwood@gmail.com, tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, eason.yen@mediatek.com, perex@perex.cz, wim@linux-watchdog.org, linux@roeck-us.net
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-09-27 at 18:31 +0800, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Provide assert/deassert/reset API in watchdog driver.
> Register reset controller for toprgu device in watchdog probe.

I think we could improve this commit message so it is easier to
understand what is provided by this patch. You could add something like
this:

Besides watchdog, MTK toprgu module also provide sub-system (eg, audio,
camera, codec and connectivity) software reset functionality.

> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
>  drivers/watchdog/Kconfig   |   1 +
>  drivers/watchdog/mtk_wdt.c | 110 ++++++++++++++++++++++++++++++++++++-
>  2 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 2e07caab9db2..629249fe5305 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -717,6 +717,7 @@ config MEDIATEK_WATCHDOG
>  	tristate "Mediatek SoCs watchdog support"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	select WATCHDOG_CORE
> +	select RESET_CONTROLLER
>  	help
>  	  Say Y here to include support for the watchdog timer
>  	  in Mediatek SoCs.
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 9c3d0033260d..660fb0e48d8e 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -20,6 +20,10 @@
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
>  #include <linux/delay.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +#include <linux/reset.h>
> +#include <linux/of_device.h>

sorting please.

>  
>  #define WDT_MAX_TIMEOUT		31
>  #define WDT_MIN_TIMEOUT		1
> @@ -44,17 +48,113 @@
>  #define WDT_SWRST		0x14
>  #define WDT_SWRST_KEY		0x1209
>  
> +#define WDT_SWSYSRST		0x18U
> +#define WDT_SWSYS_RST_KEY	0x88000000
> +
>  #define DRV_NAME		"mtk-wdt"
>  #define DRV_VERSION		"1.0"
>  
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  static unsigned int timeout;
>  
> +struct toprgu_reset {
> +	spinlock_t lock; /* Protects reset_controller access */
> +	void __iomem *toprgu_swrst_base;
> +	int regofs;
> +	struct reset_controller_dev rcdev;
> +};

I'm not sure we need a separate struct, especially when you need to
duplicate wdt_base into this struct.
After removing regofs/swrst_base, this struct only contain 2 members.
Maybe you should just merge this into mtk_wdt_dev.


> +
>  struct mtk_wdt_dev {
>  	struct watchdog_device wdt_dev;
>  	void __iomem *wdt_base;
> +	struct toprgu_reset reset_controller;
> +	const struct mtk_wdt_compatible *dev_comp;
> +};
> +
> +struct mtk_wdt_compatible {
> +	int sw_rst_num;
> +};
> +
> +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct toprgu_reset *data = container_of(rcdev,
> +				struct toprgu_reset, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> +	tmp |= BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct toprgu_reset *data = container_of(rcdev,
> +					struct toprgu_reset, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = __raw_readl(data->toprgu_swrst_base + data->regofs);
> +	tmp &= ~BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->toprgu_swrst_base + data->regofs);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int toprgu_reset(struct reset_controller_dev *rcdev,
> +			unsigned long id)
> +{
> +	int ret;
> +
> +	ret = toprgu_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return toprgu_reset_deassert(rcdev, id);
> +}
> +
> +static struct reset_control_ops toprgu_reset_ops = {

static const


> +	.assert = toprgu_reset_assert,
> +	.deassert = toprgu_reset_deassert,
> +	.reset = toprgu_reset,
>  };
>  
> +static void toprgu_register_reset_controller(struct platform_device *pdev,
> +					     int regofs)
> +{
> +	int ret;
> +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> +
> +	spin_lock_init(&mtk_wdt->reset_controller.lock);
> +
> +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
> +	mtk_wdt->reset_controller.toprgu_swrst_base = mtk_wdt->wdt_base;
> +	mtk_wdt->reset_controller.regofs = regofs;
> +	mtk_wdt->reset_controller.rcdev.owner = THIS_MODULE;
> +	mtk_wdt->reset_controller.rcdev.nr_resets =
> +				mtk_wdt->dev_comp->sw_rst_num;
> +	mtk_wdt->reset_controller.rcdev.ops = &toprgu_reset_ops;
> +	mtk_wdt->reset_controller.rcdev.of_node = pdev->dev.of_node;
> +	ret = reset_controller_register(&mtk_wdt->reset_controller.rcdev);
> +	if (ret != 0)
> +		dev_err(&pdev->dev,
> +			"couldn't register wdt reset controller: %d\n", ret);

If this fail, you should return it and make mtk_wdt_probe also return
fail.

> +}
> +
>  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>  			   unsigned long action, void *data)
>  {
> @@ -187,9 +287,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>  	if (unlikely(err))
>  		return err;
>  
> -	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
> +	dev_info(&pdev->dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>  		 mtk_wdt->wdt_dev.timeout, nowayout);
>  
> +	mtk_wdt->dev_comp = of_device_get_match_data(&pdev->dev);
> +	if (mtk_wdt->dev_comp)
> +		toprgu_register_reset_controller(pdev, WDT_SWSYSRST);

Is this register offset WDT_SWSYSRST identical in all chips?
If it is, you should hardcode it in assert/deassert, just like how we
access other watchdog registers.
If not, you should put it in mtk_wdt_compatible.

>  	return 0;
>  }
>  
> @@ -217,7 +320,12 @@ static int mtk_wdt_resume(struct device *dev)
>  }
>  #endif
>  
> +static const struct mtk_wdt_compatible mt8183_compat = {
> +	.sw_rst_num = 18,
> +};
> +
>  static const struct of_device_id mtk_wdt_dt_ids[] = {
> +	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_compat },
>  	{ .compatible = "mediatek,mt6589-wdt" },


sorting please

Joe.C


>  	{ /* sentinel */ }
>  };
