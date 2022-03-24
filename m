Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47451C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 12:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nm5awe/q6gc+SU1pI79IvW60rU8N7E+NhpziC04ZQJA=; b=cuD/WrYiyO94qp
	RfmITPs7kvVZNonAVA4AHeRNHz+HUkZ5VSORfRlkW03HxS4s6TGC5NFa/DRCJQHHRroYFiTe1c/t8
	KMbHriHnekYd4JI9kxmxNdJP/EssJy9hexwyWcV0t4isyNu7vn7VtiSlAd82TO4d1UYjTk6wHYKIZ
	i63/pfIoP08OMTFIAbU1f9tx4cABjGnNfwmM/HuljRhFfMXRKbCmuhyKmYg9fd9ZDhHed3I+DC3Pd
	ycEenJd9vwK9/3djO/78CjDLjyTVIRsu/gbt1P74iTBzpyBGcksBi1chdypGifDoNu9O0n6CYG/8g
	MiXqFuEWdoO3nPDPjx8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXMaV-00GXOu-EP; Thu, 24 Mar 2022 12:29:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXMZB-00GWpa-Bt; Thu, 24 Mar 2022 12:27:51 +0000
X-UUID: 7bf21c07b3654c399508f3a6c7da3e81-20220324
X-UUID: 7bf21c07b3654c399508f3a6c7da3e81-20220324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jia-wei.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 318467643; Thu, 24 Mar 2022 05:27:44 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 05:17:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 20:17:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 20:17:40 +0800
Message-ID: <6cc4aa1ffcc2b6e817cfa1f4ff19ebf5f071ebbc.camel@mediatek.com>
Subject: Re: [PATCH 2/3] devfreq: mediatek: add mt8183 cci devfreq driver
From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <fan.chen@mediatek.com>,
 <louis.yu@mediatek.com>, <roger.lu@mediatek.com>,
 <Allen-yy.Lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
Date: Thu, 24 Mar 2022 20:17:39 +0800
In-Reply-To: <8ee350be-b3a6-ce39-03bf-95d51fb8ff1b@canonical.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-3-jia-wei.chang@mediatek.com>
 <8ee350be-b3a6-ce39-03bf-95d51fb8ff1b@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_052749_451126_685C464E 
X-CRM114-Status: GOOD (  47.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-03-07 at 22:51 +0100, Krzysztof Kozlowski wrote:
> On 07/03/2022 13:25, Tim Chang wrote:
> > This adds a devfreq driver for the Cache Coherent Interconnect
> > (CCI) of
> > the Mediatek MT8183.
> > 
> > On mt8183 the cci is supplied by the same regulator as the little
> > cores.
> > The driver is notified when the regulator voltage changes (driven
> > by
> > cpufreq) and adjusts the cci frequency to the maximum possible
> > value.
> > 
> > Add need_voltage_tracking variable to platforma data. if true, it
> > indicates soc is required to realize the voltage tracking between
> > voltage of sram and voltage of cci by software approach. otherwise,
> > the
> > voltage tracking is realized by hardware appraoch.
> > 
> > Add the notifier to cci so that it could react after svs driver
> > changes
> > opp table of cci.
> > 
> > Signed-off-by: Jia-Wei Chang <
> > jia-wei.chang@mediatek.corp-partner.google.com>
> > ---
> >  drivers/devfreq/Kconfig           |  11 +-
> >  drivers/devfreq/Makefile          |   2 +-
> >  drivers/devfreq/mtk-cci-devfreq.c | 471
> > ++++++++++++++++++++++++++++++
> >  3 files changed, 482 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/devfreq/mtk-cci-devfreq.c
> > 
> > diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> > index 1ec36ae93f31..a6be3c6b5691 100644
> > --- a/drivers/devfreq/Kconfig
> > +++ b/drivers/devfreq/Kconfig
> > @@ -110,7 +110,7 @@ config ARM_IMX8M_DDRC_DEVFREQ
> >  
> >  config ARM_MT8183_CCI_DEVFREQ
> >  	tristate "MT8183 CCI DEVFREQ Driver"
> > -	depends on ARM_MEDIATEK_CPUFREQ
> > +	depends on OF && ARM_MEDIATEK_CPUFREQ
> 
> Why do you need that dependency? Isn't your arch already OF-only?

Yes, it is OF-only so far.
I will remove it and keep it as before.

> 
> >  	help
> >  		This adds a devfreq driver for Cache Coherent
> > Interconnect
> >  		of Mediatek MT8183, which is shared the same regulator
> > @@ -130,6 +130,15 @@ config ARM_TEGRA_DEVFREQ
> >  	  It reads ACTMON counters of memory controllers and adjusts
> > the
> >  	  operating frequencies and voltages with OPP support.
> >  
> > +config ARM_MEDIATEK_CCI_DEVFREQ
> > +	tristate "MEDIATEK CCI DEVFREQ Driver"
> > +	depends on OF && ARM_MEDIATEK_CPUFREQ
> > +	help
> > +	  This adds a devfreq driver for Mediatek Cache Coherent
> > Interconnect
> > +	  which is shared the same regulator with cpu cluster. It can
> > track
> > +	  buck voltage and update a proper CCI frequency. Use
> > notification
> > +	  to get regulator status.
> > +
> >  config ARM_RK3399_DMC_DEVFREQ
> >  	tristate "ARM RK3399 DMC DEVFREQ Driver"
> >  	depends on (ARCH_ROCKCHIP && HAVE_ARM_SMCCC) || \
> > diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> > index 991ef7740759..0493516a16f2 100644
> > --- a/drivers/devfreq/Makefile
> > +++ b/drivers/devfreq/Makefile
> > @@ -11,7 +11,7 @@ obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+=
> > governor_passive.o
> >  obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
> >  obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
> >  obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
> > -obj-$(CONFIG_ARM_MT8183_CCI_DEVFREQ)	+= mt8183-cci-devfreq.o
> > +obj-$(CONFIG_ARM_MEDIATEK_CCI_DEVFREQ)	+= mtk-cci-devfreq.o
> 
> How is this related? You say in commit subject and description that
> you
> add a devfreq driver. But here you remove some other file...

Sorry, this is my mistake.
There's no mt8183-cci-devfreq.c on the codebase of linux-next.
I will fix it after rebasing in the next version.

> 
> >  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
> >  obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
> >  
> > diff --git a/drivers/devfreq/mtk-cci-devfreq.c
> > b/drivers/devfreq/mtk-cci-devfreq.c
> > new file mode 100644
> > index 000000000000..986f34689f5c
> > --- /dev/null
> > +++ b/drivers/devfreq/mtk-cci-devfreq.c
> > @@ -0,0 +1,471 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/devfreq.h>
> > +#include <linux/minmax.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_opp.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +struct mtk_ccifreq_platform_data;
> 
> Move struct mtk_ccifreq_platform_data definition here. No need for
> forward declaration.

Sure, I will update it in the next version.

> 
> > +
> > +struct mtk_ccifreq_drv {
> > +	struct device *cci_dev;
> > +	struct devfreq *devfreq;
> > +	struct regulator *proc_reg;
> > +	struct regulator *sram_reg;
> > +	struct clk *cci_clk;
> > +	struct clk *inter_clk;
> > +	int inter_voltage;
> > +	int old_voltage;
> > +	unsigned long old_freq;
> > +	struct mutex lock;  /* avoid notify and policy race condition
> > */
> > +	struct notifier_block opp_nb;
> > +	const struct mtk_ccifreq_platform_data *soc_data;
> > +};
> > +
> > +struct mtk_ccifreq_platform_data {
> > +	int min_volt_shift;
> > +	int max_volt_shift;
> > +	int proc_max_volt;
> > +	int sram_min_volt;
> > +	int sram_max_volt;
> > +	bool need_voltage_tracking;
> > +};
> > +
> > +static int mtk_ccifreq_voltage_tracking(struct mtk_ccifreq_drv
> > *drv, int new_voltage)
> > +{
> > +	const struct mtk_ccifreq_platform_data *soc_data = drv-
> > >soc_data;
> > +	struct regulator *proc_reg = drv->proc_reg;
> > +	struct regulator *sram_reg = drv->sram_reg;
> > +	int old_voltage, old_vsram, new_vsram, vsram, voltage, ret;
> > +
> > +	old_voltage = regulator_get_voltage(proc_reg);
> > +	if (old_voltage < 0) {
> > +		pr_err("%s: invalid vproc value: %d\n", __func__,
> > old_voltage);
> > +		return old_voltage;
> > +	}
> > +
> > +	old_vsram = regulator_get_voltage(sram_reg);
> > +	if (old_vsram < 0) {
> > +		pr_err("%s: invalid vsram value: %d\n", __func__,
> > old_vsram);
> > +		return old_vsram;
> > +	}
> > +
> > +	new_vsram = clamp(new_voltage + soc_data->min_volt_shift,
> > +			  soc_data->sram_min_volt, soc_data-
> > >sram_max_volt);
> > +
> > +	do {
> > +		if (old_voltage <= new_voltage) {
> > +			vsram = clamp(old_voltage + soc_data-
> > >max_volt_shift,
> > +				      soc_data->sram_min_volt,
> > new_vsram);
> > +			ret = regulator_set_voltage(sram_reg, vsram,
> > +						    soc_data-
> > >sram_max_volt);
> > +			if (ret)
> > +				return ret;
> > +
> > +			if (vsram == soc_data->sram_max_volt ||
> > +			    new_vsram == soc_data->sram_min_volt)
> > +				voltage = new_voltage;
> > +			else
> > +				voltage = vsram - soc_data-
> > >min_volt_shift;
> > +
> > +			ret = regulator_set_voltage(proc_reg, voltage,
> > +						    soc_data-
> > >proc_max_volt);
> > +			if (ret) {
> > +				regulator_set_voltage(sram_reg,
> > old_vsram,
> > +						      soc_data-
> > >sram_max_volt);
> > +				return ret;
> > +			}
> > +		} else if (old_voltage > new_voltage) {
> > +			voltage = max(new_voltage,
> > +				    old_vsram - soc_data-
> > >max_volt_shift);
> > +			ret = regulator_set_voltage(proc_reg, voltage,
> > +						    soc_data-
> > >proc_max_volt);
> > +			if (ret)
> > +				return ret;
> > +
> > +			if (voltage == new_voltage)
> > +				vsram = new_vsram;
> > +			else
> > +				vsram = max(new_vsram,
> > +					    voltage + soc_data-
> > >min_volt_shift);
> > +
> > +			ret = regulator_set_voltage(sram_reg, vsram,
> > +						    soc_data-
> > >sram_max_volt);
> > +			if (ret) {
> > +				regulator_set_voltage(proc_reg,
> > old_voltage,
> > +						      soc_data-
> > >proc_max_volt);
> > +				return ret;
> > +			}
> > +		}
> > +
> > +		old_voltage = voltage;
> > +		old_vsram = vsram;
> > +	} while (voltage != new_voltage || vsram != new_vsram);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_ccifreq_set_voltage(struct mtk_ccifreq_drv *drv,
> > int voltage)
> > +{
> > +	int ret;
> > +
> > +	if (drv->soc_data->need_voltage_tracking)
> > +		ret = mtk_ccifreq_voltage_tracking(drv, voltage);
> > +	else
> > +		ret = regulator_set_voltage(drv->proc_reg, voltage,
> > +					    drv->soc_data-
> > >proc_max_volt);
> > +
> > +	if (!ret)
> > +		drv->old_voltage = voltage;
> > +
> > +	return ret;
> > +}
> > +
> > +static int mtk_ccifreq_target(struct device *dev, unsigned long
> > *freq,
> > +			      u32 flags)
> > +{
> > +	struct mtk_ccifreq_drv *drv = dev_get_drvdata(dev);
> > +	struct clk *cci_pll = clk_get_parent(drv->cci_clk);
> > +	struct dev_pm_opp *opp;
> > +	unsigned long opp_rate;
> > +	int voltage, old_voltage, inter_voltage, target_voltage, ret;
> > +
> > +	if (!drv)
> > +		return -EINVAL;
> > +
> > +	if (drv->old_freq == *freq)
> > +		return 0;
> > +
> > +	inter_voltage = drv->inter_voltage;
> > +
> > +	opp_rate = *freq;
> > +	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
> > +	if (IS_ERR(opp)) {
> > +		pr_err("cci: failed to find opp for freq: %ld\n",
> > opp_rate);
> 
> dev_err() everywhere.

Sure, I will update it in the next version.

> 
> > +		return PTR_ERR(opp);
> > +	}
> > +	voltage = dev_pm_opp_get_voltage(opp);
> > +	dev_pm_opp_put(opp);
> > +
> > +	old_voltage = drv->old_voltage;
> > +	if (old_voltage == 0)
> > +		old_voltage = regulator_get_voltage(drv->proc_reg);
> > +	if (old_voltage < 0) {
> > +		pr_err("cci: invalid vproc value: %d\n", old_voltage);
> > +		return old_voltage;
> > +	}
> > +
> > +	mutex_lock(&drv->lock);
> > +
> > +	/* scale up: set voltage first then freq. */
> > +	target_voltage = max(inter_voltage, voltage);
> > +	if (old_voltage <= target_voltage) {
> > +		ret = mtk_ccifreq_set_voltage(drv, target_voltage);
> > +		if (ret) {
> > +			pr_err("cci: failed to scale up voltage\n");
> > +			mtk_ccifreq_set_voltage(drv, old_voltage);
> > +			mutex_unlock(&drv->lock);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	/* switch the cci clock to intermediate clock source. */
> > +	ret = clk_set_parent(drv->cci_clk, drv->inter_clk);
> > +	if (ret) {
> > +		pr_err("cci: failed to re-parent cci clock\n");
> > +		mtk_ccifreq_set_voltage(drv, old_voltage);
> > +		WARN_ON(1);
> 
> Debug code... please clean up your driver.

Sure, I will update it in the next version.

> 
> > +		mutex_unlock(&drv->lock);
> > +		return ret;
> > +	}
> > +
> > +	/* set the original clock to target rate. */
> > +	ret = clk_set_rate(cci_pll, *freq);
> > +	if (ret) {
> > +		pr_err("cci: failed to set cci pll rate: %d\n", ret);
> > +		clk_set_parent(drv->cci_clk, cci_pll);
> > +		mtk_ccifreq_set_voltage(drv, old_voltage);
> > +		mutex_unlock(&drv->lock);
> > +		return ret;
> > +	}
> > +
> > +	/* switch the cci clock back to the original clock source. */
> > +	ret = clk_set_parent(drv->cci_clk, cci_pll);
> > +	if (ret) {
> > +		pr_err("cci: failed to re-parent cci clock\n");
> > +		mtk_ccifreq_set_voltage(drv, inter_voltage);
> > +		WARN_ON(1);
> > +		mutex_unlock(&drv->lock);
> 
> Use goto to error handling pattern.

Sure, I will use goto statement for error handling instead.

> 
> > +		return ret;
> > +	}
> > +
> > +	/*
> > +	 * If the new voltage is lower than the intermediate voltage or
> > the
> > +	 * original voltage, scale down to the new voltage.
> > +	 */
> > +	if (voltage < inter_voltage || voltage < old_voltage) {
> > +		ret = mtk_ccifreq_set_voltage(drv, voltage);
> > +		if (ret) {
> > +			pr_err("cci: failed to scale down voltage\n");
> > +			WARN_ON(1);
> > +			mutex_unlock(&drv->lock);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	drv->old_freq = *freq;
> > +	mutex_unlock(&drv->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_ccifreq_opp_notifier(struct notifier_block *nb,
> > +				    unsigned long event, void *data)
> > +{
> > +	struct dev_pm_opp *opp = data;
> > +	struct mtk_ccifreq_drv *drv;
> > +	unsigned long freq, volt;
> > +
> > +	drv = container_of(nb, struct mtk_ccifreq_drv, opp_nb);
> > +
> > +	if (event == OPP_EVENT_ADJUST_VOLTAGE) {
> > +		freq = dev_pm_opp_get_freq(opp);
> > +
> > +		mutex_lock(&drv->lock);
> > +		/* current opp item is changed */
> > +		if (freq == drv->old_freq) {
> > +			volt = dev_pm_opp_get_voltage(opp);
> > +			mtk_ccifreq_set_voltage(drv, volt);
> > +		}
> > +		mutex_unlock(&drv->lock);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static struct devfreq_dev_profile mtk_ccifreq_profile = {
> > +	.target = mtk_ccifreq_target,
> > +};
> > +
> > +static int mtk_ccifreq_probe(struct platform_device *pdev)
> > +{
> > +	struct device *cci_dev = &pdev->dev;
> > +	struct mtk_ccifreq_drv *drv;
> > +	struct devfreq_passive_data *passive_data;
> > +	struct dev_pm_opp *opp;
> > +	unsigned long rate, opp_volt;
> > +	int ret;
> > +
> > +	drv = devm_kzalloc(cci_dev, sizeof(*drv), GFP_KERNEL);
> > +	if (!drv)
> > +		return -ENOMEM;
> > +
> > +	drv->cci_dev = cci_dev;
> > +	drv->soc_data = (const struct mtk_ccifreq_platform_data *)
> > +				of_device_get_match_data(&pdev->dev);
> > +	mutex_init(&drv->lock);
> > +	platform_set_drvdata(pdev, drv);
> > +
> > +	drv->cci_clk = devm_clk_get(cci_dev, "cci");
> > +	if (IS_ERR(drv->cci_clk)) {
> > +		ret = PTR_ERR(drv->cci_clk);
> > +		return dev_err_probe(cci_dev, ret,
> > +				     "cci: failed to get cci clk:
> > %d\n",
> > +				     ret);
> > +	}
> > +
> > +	drv->inter_clk = devm_clk_get(cci_dev, "intermediate");
> > +	if (IS_ERR(drv->inter_clk)) {
> > +		ret = PTR_ERR(drv->inter_clk);
> > +		return dev_err_probe(cci_dev, ret,
> > +				     "cci: failed to get intermediate
> > clk: %d\n",
> > +				     ret);
> > +	}
> > +
> > +	if (drv->soc_data->need_voltage_tracking) {
> > +		drv->sram_reg = regulator_get_optional(cci_dev,
> > "sram");
> > +		if (IS_ERR_OR_NULL(drv->sram_reg)) {
> 
> NULL pointer cannot be returned.

Sure, I will replace it with IS_ERR() instead.

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
