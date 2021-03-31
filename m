Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76946C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 06:30:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBEB1619BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 06:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBEB1619BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H3E2rlTrSa+hG5E9eQIJa1uPIup1cfKkXvq5BEAZ5qo=; b=mRI3590WjAocgZI3VgFIGVSBu
	lzjVdVLmgBd+9Y4QfHNl84kEo6vOSixVqvYsrq3rKZVNX7qCa4igu3hR0tGKmxxJMghgH7A2HCyq5
	jywFGOGRtwQxAEERkx4imWCMDbjM1NdXxuDEELMByBP+BNGe1UN3Ly83/b7RvGmUDTmuR0XlWHfH/
	0uIWKs4JZ2qCg2c72/5xjmeFam5zYUEWNqlDz9lHXjEVbAlOVgAyxOyZhxFyexvCjondMtFDVQb+Q
	X+3YfQAQ7+FLCMFoVR11CYtR6K+cw+XkMqvzy+Da7KtWfWRARoeYkz7uThYuQRYz1fKU+F9rWqXUB
	mo9x3rf9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRUMy-005dkt-F2; Wed, 31 Mar 2021 06:30:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRUMn-005dgl-8a; Wed, 31 Mar 2021 06:30:21 +0000
X-UUID: 12c735b590f64eac8e97b71721d85eff-20210330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yRiXHiL/mGBHCKDHtp8uw7mU+mx0Od5x8cCje3tTsRE=; 
 b=hNOB27oQnp4/Y5vsd5kYI31WhB1bih/eKPovbVagOKC4DTJprPy4FcSC3IENPy654Yi8nRQQssAaBARfQ4r8yhOV3wFu8A4UTy4+wnF1SrfHRDbpjIHTkREzXlsqCKfZl/7S4OcF+lxlVILWPIWqdFmEeYrhHBkfuUSSS4OOBbM=;
X-UUID: 12c735b590f64eac8e97b71721d85eff-20210330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 770404610; Tue, 30 Mar 2021 23:30:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 23:21:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 14:21:05 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 14:21:05 +0800
Message-ID: <1617171665.5133.2.camel@mtksdaap41>
Subject: Re: [PATCH V8 4/8] devfreq: add mediatek cci devfreq
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
CC: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>
Date: Wed, 31 Mar 2021 14:21:05 +0800
In-Reply-To: <58938ccf-d115-d52a-1260-eb29729e6bbd@samsung.com>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <CGME20210323113411epcas1p3dcc8649a2e3bed66866e3470d7aab447@epcas1p3.samsung.com>
 <1616499241-4906-5-git-send-email-andrew-sh.cheng@mediatek.com>
 <58938ccf-d115-d52a-1260-eb29729e6bbd@samsung.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_073016_874498_3202AF73 
X-CRM114-Status: GOOD (  43.39  )
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

On Thu, 2021-03-25 at 16:04 +0800, Chanwoo Choi wrote:
> Hi,
> 
> On 3/23/21 8:33 PM, Andrew-sh.Cheng wrote:
> > From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> > 
> > This adds a devfreq driver for the Cache Coherent Interconnect (CCI)
> > of the Mediatek MT8183.
> > 
> > On the MT8183 the CCI is supplied by the same regulator as the LITTLE
> > cores. The driver is notified when the regulator voltage changes
> > (driven by cpufreq) and adjusts the CCI frequency to the maximum
> > possible value.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  drivers/devfreq/Kconfig              |  10 ++
> >  drivers/devfreq/Makefile             |   1 +
> >  drivers/devfreq/mt8183-cci-devfreq.c | 198 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 209 insertions(+)
> >  create mode 100644 drivers/devfreq/mt8183-cci-devfreq.c
> > 
> > diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> > index f56132b0ae64..2538255ac2c1 100644
> > --- a/drivers/devfreq/Kconfig
> > +++ b/drivers/devfreq/Kconfig
> > @@ -111,6 +111,16 @@ config ARM_IMX8M_DDRC_DEVFREQ
> >  	  This adds the DEVFREQ driver for the i.MX8M DDR Controller. It allows
> >  	  adjusting DRAM frequency.
> >  
> > +config ARM_MT8183_CCI_DEVFREQ
> > +	tristate "MT8183 CCI DEVFREQ Driver"
> > +	depends on ARM_MEDIATEK_CPUFREQ
> > +	help
> > +		This adds a devfreq driver for Cache Coherent Interconnect
> > +		of Mediatek MT8183, which is shared the same regulator
> > +		with cpu cluster.
> > +		It can track buck voltage and update a proper CCI frequency.
> > +		Use notification to get regulator status.
> > +
> >  config ARM_TEGRA_DEVFREQ
> >  	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
> >  	depends on ARCH_TEGRA_3x_SOC || ARCH_TEGRA_114_SOC || \
> > diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> > index a16333ea7034..991ef7740759 100644
> > --- a/drivers/devfreq/Makefile
> > +++ b/drivers/devfreq/Makefile
> > @@ -11,6 +11,7 @@ obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
> >  obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
> >  obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
> >  obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
> > +obj-$(CONFIG_ARM_MT8183_CCI_DEVFREQ)	+= mt8183-cci-devfreq.o
> >  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
> >  obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
> >  
> > diff --git a/drivers/devfreq/mt8183-cci-devfreq.c b/drivers/devfreq/mt8183-cci-devfreq.c
> > new file mode 100644
> > index 000000000000..018543db7bae
> > --- /dev/null
> > +++ b/drivers/devfreq/mt8183-cci-devfreq.c
> > @@ -0,0 +1,198 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > +
> > + * Author: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/devfreq.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/time.h>
> > +
> > +#define MAX_VOLT_LIMIT		(1150000)
> > +
> > +struct cci_devfreq {
> > +	struct devfreq *devfreq;
> > +	struct regulator *cpu_reg;
> > +	struct clk *cci_clk;
> > +	int old_vproc;
> 
> nitpick. how about using 'old_voltage'?
> because 'vproc' is not easy for understanding.
I will modify it on next patch version.

> 
> > +	unsigned long old_freq;
> > +};
> > +
> > +static int mtk_cci_set_voltage(struct cci_devfreq *cci_df, int vproc)
> 
> nitpick: how about changing 'vproc -> voltage'?
I will modify it on next patch version.

> 
> > +{
> > +	int ret;
> > +
> > +	ret = regulator_set_voltage(cci_df->cpu_reg, vproc,
> > +				    MAX_VOLT_LIMIT);
> > +	if (!ret)
> > +		cci_df->old_vproc = vproc;
> > +	return ret;
> > +}
> > +
> > +static int mtk_cci_devfreq_target(struct device *dev, unsigned long *freq,
> > +				  u32 flags)
> > +{
> > +	int ret;
> > +	struct cci_devfreq *cci_df = dev_get_drvdata(dev);
> > +	struct dev_pm_opp *opp;
> > +	unsigned long opp_rate, opp_voltage, old_voltage;
> > +
> > +	if (!cci_df)
> > +		return -EINVAL;
> > +
> > +	if (cci_df->old_freq == *freq)
> > +		return 0;
> > +
> > +	opp_rate = *freq;
> > +	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
> > +	opp_voltage = dev_pm_opp_get_voltage(opp);
> > +	dev_pm_opp_put(opp);
> > +
> > +	old_voltage = cci_df->old_vproc;
> > +	if (old_voltage == 0)
> > +		old_voltage = regulator_get_voltage(cci_df->cpu_reg);
> > +
> > +	// scale up: set voltage first then freq
> > +	if (opp_voltage > old_voltage) {
> > +		ret = mtk_cci_set_voltage(cci_df, opp_voltage);
> > +		if (ret) {
> > +			pr_err("cci: failed to scale up voltage\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	ret = clk_set_rate(cci_df->cci_clk, *freq);
> > +	if (ret) {
> > +		pr_err("%s: failed cci to set rate: %d\n", __func__,
> > +		       ret);
> > +		mtk_cci_set_voltage(cci_df, old_voltage);
> > +		return ret;
> > +	}
> > +
> > +	// scale down: set freq first then voltage
> > +	if (opp_voltage < old_voltage) {
> > +		ret = mtk_cci_set_voltage(cci_df, opp_voltage);
> > +		if (ret) {
> > +			pr_err("cci: failed to scale down voltage\n");
> > +			clk_set_rate(cci_df->cci_clk, cci_df->old_freq);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	cci_df->old_freq = *freq;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct devfreq_dev_profile cci_devfreq_profile = {
> > +	.target = mtk_cci_devfreq_target,
> > +};
> > +
> > +static int mtk_cci_devfreq_probe(struct platform_device *pdev)
> > +{
> > +	struct device *cci_dev = &pdev->dev;
> > +	struct cci_devfreq *cci_df;
> > +	struct devfreq_passive_data *passive_data;
> > +	int ret;
> > +
> > +	cci_df = devm_kzalloc(cci_dev, sizeof(*cci_df), GFP_KERNEL);
> > +	if (!cci_df)
> > +		return -ENOMEM;
> > +
> > +	cci_df->cci_clk = devm_clk_get(cci_dev, "cci_clock");
> > +	ret = PTR_ERR_OR_ZERO(cci_df->cci_clk);
> > +	if (ret) {
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(cci_dev, "failed to get clock for CCI: %d\n",
> > +				ret);
> 
> Use dev_err_probe() to handle EPROBE_DEFER case. It makes code more simple.
I will modify it on next patch version.

> 
> > +		return ret;
> > +	}
> > +	cci_df->cpu_reg = devm_regulator_get_optional(cci_dev, "proc");
> > +	ret = PTR_ERR_OR_ZERO(cci_df->cpu_reg);
> > +	if (ret) {
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(cci_dev, "failed to get regulator for CCI: %d\n",
> > +				ret);
> 
> ditto. Use dev_err_probe()
I will modify it on next patch version.

> 
> > +		return ret;
> > +	}
> > +	ret = regulator_enable(cci_df->cpu_reg);
> > +	if (ret) {
> > +		dev_err(cci_dev, "enable buck for cci fail\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = dev_pm_opp_of_add_table(cci_dev);
> > +	if (ret) {
> > +		dev_err(cci_dev, "Fail to get OPP table for CCI: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	platform_set_drvdata(pdev, cci_df);
> > +
> > +	passive_data = devm_kzalloc(cci_dev, sizeof(*passive_data), GFP_KERNEL);
> > +	if (!passive_data) {
> > +		ret = -ENOMEM;
> > +		goto err_opp;
> > +	}
> > +
> > +	passive_data->parent_type = CPUFREQ_PARENT_DEV;
> > +
> > +	cci_df->devfreq = devm_devfreq_add_device(cci_dev,
> > +						  &cci_devfreq_profile,
> > +						  DEVFREQ_GOV_PASSIVE,
> > +						  passive_data);
> > +	if (IS_ERR(cci_df->devfreq)) {
> > +		ret = PTR_ERR(cci_df->devfreq);
> > +		dev_err(cci_dev, "cannot create cci devfreq device:%d\n", ret);
> > +		goto err_opp;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_opp:
> > +	dev_pm_opp_of_remove_table(cci_dev);
> > +	return ret;
> > +}
> > +
> > +static int mtk_cci_devfreq_remove(struct platform_device *pdev)
> > +{
> > +	struct device *cci_dev = &pdev->dev;
> > +	struct cci_devfreq *cci_df;
> > +	struct notifier_block *opp_nb;
> > +
> > +	cci_df = platform_get_drvdata(pdev);
> > +	opp_nb = &cci_df->opp_nb;
> > +
> > +	dev_pm_opp_unregister_notifier(cci_dev, opp_nb);
> 
> Why do you call this function without registration?
> If you want to catch the OPP changes of devfreq,
> you can use devfreq_register_opp_notifier/devfreq_unregister_opp_notifier
> functions.
Yes, I will move it to 
[V8,7/8] devfreq: mediatek: cci devfreq register opp notification for
SVS support

> 
> > +	dev_pm_opp_of_remove_table(cci_dev);
> > +	regulator_disable(cci_df->cpu_reg);
> > +
> > +	return 0;
> > +}
> > +
> > +static const __maybe_unused struct of_device_id
> > +	mediatek_cci_of_match[] = {
> 
> Need to change it as following at same line:
> static const __maybe_unused struct of_device_idmediatek_cci_of_match[] = {

Hi Chanwoo,
I don't quite understand when to us __maybe_unused
This is a suggestion from patch version 2.
https://patchwork.kernel.org/patch/10876449/
Please give me some advice.
Thank you.


> 
> 
> > +	{ .compatible = "mediatek,mt8183-cci" },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mediatek_cci_of_match);
> > +
> > +static struct platform_driver cci_devfreq_driver = {
> > +	.probe	= mtk_cci_devfreq_probe,
> > +	.remove	= mtk_cci_devfreq_remove,
> > +	.driver = {
> > +		.name = "mediatek-cci-devfreq",
> > +		.of_match_table = of_match_ptr(mediatek_cci_of_match),
> > +	},
> > +};
> > +
> > +module_platform_driver(cci_devfreq_driver);
> > +
> > +MODULE_DESCRIPTION("Mediatek CCI devfreq driver");
> > +MODULE_AUTHOR("Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>");
> > +MODULE_LICENSE("GPL v2");
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
