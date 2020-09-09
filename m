Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B94C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 12:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14FC521D40
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 12:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hqLIXGoM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pp0VFzZg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14FC521D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=seKpHxaB8WGaZ2tAgfJPl3pf0lYINVzTgRWwvBG/T6M=; b=hqLIXGoMpnINJJrQpaWgQwcoX
	lIA7bw5e97A6FMyLIgH0SGa4R4pXbluwaWT3p+GdZKD0cuJP44eOY1zgLaPYXnrvjVyblOe1xazn9
	vS25OK1WfXEtwsK08Ad68n4nXBdIEpGcaJrZVQB79R7UiYjeVJfgbiqxV0SVtVvQPfJu1k/tDRBBI
	M4VNWA2k/aCbjHVf0ErotHZL/XJA4nK6DGfEbxr/M29p94JgOhQHGlC/BXX2i5XfgCr5qJlEzLjm8
	ZDv+/Q2u+ylIqhMrbfSK9BvWJ9Cs1isR/m1HU3UiMsisfPcEm2U534XJxPFjZwxqxG0aJVWwlUM/n
	baSEeSh/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFzLE-0005p7-OE; Wed, 09 Sep 2020 12:36:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFzLA-0005oe-4y; Wed, 09 Sep 2020 12:36:47 +0000
X-UUID: 2e1a88bcc16548d7969f6417560b793f-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2guDIT84rtpUaMUFhWADD5VNuK3neJxSfJO6MF34kNA=; 
 b=Pp0VFzZgWsk0719UETrMa4Cy+sMYz7h8ev2jPvl8sqXhQQzME++9itiEtZybqWZg3qviXYzJGhS1+QhjDG/Q7bCyFDdgDVTSS5OvBdhtvuHIB4T5uR4s5LNNOSmZZikfQP+5GepHCWh2k7jZLHw+4yCLijIqC+3D6M4wMJrp2Hk=;
X-UUID: 2e1a88bcc16548d7969f6417560b793f-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 937014817; Wed, 09 Sep 2020 04:36:40 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 05:26:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 20:26:34 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 20:26:35 +0800
Message-ID: <1599654396.2621.16.camel@mtkswgap22>
Subject: Re: [PATCH v5 1/2] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 9 Sep 2020 20:26:36 +0800
In-Reply-To: <20200909112955.5fm3mv2btr6wrcc7@vireshk-i7>
References: <1599645086-10169-1-git-send-email-hector.yuan@mediatek.com>
 <1599645086-10169-2-git-send-email-hector.yuan@mediatek.com>
 <20200909112955.5fm3mv2btr6wrcc7@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7BFCD0EC8248CFF5F9D9B4A26A53BE89755EEA30A661FC1A257714E2446C9F3E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_083644_442884_F8CE5631 
X-CRM114-Status: GOOD (  40.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-09 at 16:59 +0530, Viresh Kumar wrote:
> On 09-09-20, 17:51, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add MT6779 cpufreq HW support.
> > 
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  drivers/cpufreq/Kconfig.arm           |   12 ++
> >  drivers/cpufreq/Makefile              |    1 +
> >  drivers/cpufreq/mediatek-cpufreq-hw.c |  289 +++++++++++++++++++++++++++++++++
> >  3 files changed, 302 insertions(+)
> >  create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c
> > 
> > diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> > index c6cbfc8..8e58c12 100644
> > --- a/drivers/cpufreq/Kconfig.arm
> > +++ b/drivers/cpufreq/Kconfig.arm
> > @@ -121,6 +121,18 @@ config ARM_MEDIATEK_CPUFREQ
> >  	help
> >  	  This adds the CPUFreq driver support for MediaTek SoCs.
> >  
> > +config ARM_MEDIATEK_CPUFREQ_HW
> > +	tristate "MediaTek CPUFreq HW driver"
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	default m
> > +	help
> > +	  Support for the CPUFreq HW driver.
> > +	  Some MediaTek chipsets have a HW engine to offload the steps
> > +	  necessary for changing the frequency of the CPUs. Firmware loaded
> > +	  in this engine exposes a programming interface to the OS.
> > +	  The driver implements the cpufreq interface for this HW engine.
> > +	  Say Y if you want to support CPUFreq HW.
> > +
> >  config ARM_OMAP2PLUS_CPUFREQ
> >  	bool "TI OMAP2+"
> >  	depends on ARCH_OMAP2PLUS
> > diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
> > index f6670c4..dc1f371 100644
> > --- a/drivers/cpufreq/Makefile
> > +++ b/drivers/cpufreq/Makefile
> > @@ -57,6 +57,7 @@ obj-$(CONFIG_ARM_IMX6Q_CPUFREQ)		+= imx6q-cpufreq.o
> >  obj-$(CONFIG_ARM_IMX_CPUFREQ_DT)	+= imx-cpufreq-dt.o
> >  obj-$(CONFIG_ARM_KIRKWOOD_CPUFREQ)	+= kirkwood-cpufreq.o
> >  obj-$(CONFIG_ARM_MEDIATEK_CPUFREQ)	+= mediatek-cpufreq.o
> > +obj-$(CONFIG_ARM_MEDIATEK_CPUFREQ_HW)	+= mediatek-cpufreq-hw.o
> >  obj-$(CONFIG_MACH_MVEBU_V7)		+= mvebu-cpufreq.o
> >  obj-$(CONFIG_ARM_OMAP2PLUS_CPUFREQ)	+= omap-cpufreq.o
> >  obj-$(CONFIG_ARM_PXA2xx_CPUFREQ)	+= pxa2xx-cpufreq.o
> > diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> > new file mode 100644
> > index 0000000..ae4b38b
> > --- /dev/null
> > +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> > @@ -0,0 +1,289 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cpufreq.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/slab.h>
> > +
> > +#define LUT_MAX_ENTRIES			32U
> > +#define LUT_FREQ			GENMASK(11, 0)
> > +#define LUT_ROW_SIZE			0x4
> > +
> > +enum {
> > +	REG_LUT_TABLE,
> > +	REG_ENABLE,
> > +	REG_PERF_STATE,
> > +
> > +	REG_ARRAY_SIZE,
> > +};
> > +
> > +struct cpufreq_mtk {
> > +	struct cpufreq_frequency_table *table;
> > +	void __iomem *reg_bases[REG_ARRAY_SIZE];
> > +	cpumask_t related_cpus;
> > +};
> > +
> > +static const u16 cpufreq_mtk_offsets[REG_ARRAY_SIZE] = {
> > +	[REG_LUT_TABLE]		= 0x0,
> > +	[REG_ENABLE]		= 0x84,
> > +	[REG_PERF_STATE]	= 0x88,
> > +};
> > +
> > +static struct cpufreq_mtk *mtk_freq_domain_map[NR_CPUS];
> > +
> > +static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
> > +				       unsigned int index)
> > +{
> > +	struct cpufreq_mtk *c = policy->driver_data;
> > +
> > +	writel_relaxed(index, c->reg_bases[REG_PERF_STATE]);
> > +	arch_set_freq_scale(policy->related_cpus,
> > +			    policy->freq_table[index].frequency,
> > +			    policy->cpuinfo.max_freq);
> 
> Please drop the arch_set_freq_scale() stuff. This is getting moved to
> cpufreq core in another series and will be done by core code for
> everyone. Sorry I forgot to mention that earlier.
> 
OK, will remove it, Thank you.
> > +
> > +	return 0;
> > +}
> > +
> > +static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
> > +{
> > +	struct cpufreq_mtk *c;
> > +	struct cpufreq_policy *policy;
> > +	unsigned int index;
> > +
> > +	policy = cpufreq_cpu_get_raw(cpu);
> > +	if (!policy)
> > +		return 0;
> > +
> > +	c = policy->driver_data;
> 
> What about doing this instead ?
> 
>         c = mtk_freq_domain_map[cpu];
> 
> You won't require to get policy here, right ?
> 
Yes, will get c from platform data.
> > +
> > +	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
> > +	index = min(index, LUT_MAX_ENTRIES - 1);
> > +
> > +	return policy->freq_table[index].frequency;
> > +}
> > +
> > +static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
> > +{
> > +	struct cpufreq_mtk *c;
> > +	struct device *cpu_dev;
> > +
> > +	cpu_dev = get_cpu_device(policy->cpu);
> > +	if (!cpu_dev) {
> 
> Why do you need this here ? You don't use it.
> 
OK, will remove dummy code.
> > +		pr_err("%s: failed to get cpu%d device\n", __func__,
> > +		       policy->cpu);
> > +		return -ENODEV;
> > +	}
> > +
> > +	c = mtk_freq_domain_map[policy->cpu];
> > +	if (!c) {
> > +		pr_err("No scaling support for CPU%d\n", policy->cpu);
> > +		return -ENODEV;
> > +	}
> > +
> > +	cpumask_copy(policy->cpus, &c->related_cpus);
> > +
> > +	policy->freq_table = c->table;
> > +	policy->driver_data = c;
> > +
> > +	/* HW should be in enabled state to proceed now */
> > +	writel_relaxed(0x1, c->reg_bases[REG_ENABLE]);
> 
> Don't you need to do the opposite of this as well ?
> cpufreq_driver->exit ?
> 
OK, will define exit function.
> > +
> > +	return 0;
> > +}
> > +
> > +static struct cpufreq_driver cpufreq_mtk_hw_driver = {
> > +	.flags		= CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> > +			  CPUFREQ_HAVE_GOVERNOR_PER_POLICY,
> > +	.verify		= cpufreq_generic_frequency_table_verify,
> > +	.target_index	= mtk_cpufreq_hw_target_index,
> > +	.get		= mtk_cpufreq_hw_get,
> > +	.init		= mtk_cpufreq_hw_cpu_init,
> > +	.name		= "mtk-cpufreq-hw",
> > +	.attr		= cpufreq_generic_attr,
> > +};
> > +
> > +static int mtk_cpu_create_freq_table(struct platform_device *pdev,
> > +				     struct cpufreq_mtk *c)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	void __iomem *base_table;
> > +	u32 data, i, freq, prev_freq = 0;
> > +
> > +	c->table = devm_kcalloc(dev, LUT_MAX_ENTRIES + 1,
> > +				sizeof(*c->table), GFP_KERNEL);
> > +	if (!c->table)
> > +		return -ENOMEM;
> > +
> > +	base_table = c->reg_bases[REG_LUT_TABLE];
> > +
> > +	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
> > +		data = readl_relaxed(base_table + (i * LUT_ROW_SIZE));
> > +		freq = FIELD_GET(LUT_FREQ, data) * 1000;
> > +
> > +		if (freq == prev_freq)
> > +			break;
> > +
> > +		c->table[i].frequency = freq;
> > +
> > +		dev_dbg(dev, "index=%d freq=%d\n",
> > +			i, c->table[i].frequency);
> > +
> > +		prev_freq = freq;
> > +	}
> > +
> > +	c->table[i].frequency = CPUFREQ_TABLE_END;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_get_related_cpus(int index, struct cpumask *m)
> > +{
> > +	struct device_node *cpu_np;
> > +	struct of_phandle_args args;
> > +	int cpu, ret;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		cpu_np = of_cpu_device_node_get(cpu);
> > +		if (!cpu_np)
> > +			continue;
> > +
> > +		ret = of_parse_phandle_with_args(cpu_np, "mtk-freq-domain",
> > +						 "#freq-domain-cells", 0,
> > +						 &args);
> > +		of_node_put(cpu_np);
> > +		if (ret < 0)
> > +			continue;
> > +
> > +		if (index == args.args[0])
> > +			cpumask_set_cpu(cpu, m);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cpu_resources_init(struct platform_device *pdev,
> > +				  unsigned int cpu, int index,
> > +				  const u16 *offsets)
> > +{
> > +	struct cpufreq_mtk *c;
> > +	struct resource *res;
> > +	struct device *dev = &pdev->dev;
> > +	int ret, i, cpu_r;
> > +	void __iomem *base;
> > +
> > +	if (mtk_freq_domain_map[cpu])
> > +		return 0;
> > +
> > +	c = devm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
> > +	if (!c)
> > +		return -ENOMEM;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> > +	base = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> 
> Can you use devm_platform_ioremap_resource() here ?
> 
OK, will use that.
> > +
> > +	for (i = REG_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
> > +		c->reg_bases[i] = base + offsets[i];
> > +
> > +	ret = mtk_get_related_cpus(index, &c->related_cpus);
> > +	if (ret) {
> > +		dev_err(dev, "Domain-%d failed to get related CPUs\n", index);
> > +		return ret;
> > +	}
> > +
> > +	ret = mtk_cpu_create_freq_table(pdev, c);
> > +	if (ret) {
> > +		dev_err(dev, "Domain-%d failed to create OPP\n", index);
> 
> Still the wrong error. You didn't fail to create OPP here :)
> 
> Just search for OPP in the driver and see if you need to fix that.
> 
OK, will modify this error message.
> > +		return ret;
> > +	}
> > +
> > +	for_each_cpu(cpu_r, &c->related_cpus)
> > +		mtk_freq_domain_map[cpu_r] = c;
> 
> What about doing this from mtk_get_related_cpus() instead? We already
> run the loop there.
> 
OK, will merge this to mtk_get_related_cpus().
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *cpu_np;
> > +	struct of_phandle_args args;
> > +	const u16 *offsets;
> > +	unsigned int cpu;
> > +	int ret;
> > +
> > +	offsets = of_device_get_match_data(&pdev->dev);
> > +	if (!offsets)
> > +		return -EINVAL;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		cpu_np = of_cpu_device_node_get(cpu);
> > +		if (!cpu_np) {
> > +			dev_dbg(&pdev->dev, "Failed to get cpu %d device\n",
> > +				cpu);
> 
> This deserves dev_err and maybe you should error out completely ?
> Currently if of_cpu_device_node_get() fails for all CPUs, you will
> still try to register the cpufreq driver.
> 
OK, will use dev_err and return fail.
> > +			continue;
> > +		}
> > +
> > +		ret = of_parse_phandle_with_args(cpu_np, "mtk-freq-domain",
> > +						 "#freq-domain-cells", 0,
> > +						 &args);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		/* Get the bases of cpufreq for domains */
> > +		ret = mtk_cpu_resources_init(pdev, cpu, args.args[0], offsets);
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "CPUFreq resource init failed\n");
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
> > +{
> > +	return cpufreq_unregister_driver(&cpufreq_mtk_hw_driver);
> > +}
> > +
> > +static const struct of_device_id mtk_cpufreq_hw_match[] = {
> > +	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_offsets },
> > +	{}
> > +};
> > +
> > +static struct platform_driver mtk_cpufreq_hw_driver = {
> > +	.probe = mtk_cpufreq_hw_driver_probe,
> > +	.remove = mtk_cpufreq_hw_driver_remove,
> > +	.driver = {
> > +		.name = "mtk-cpufreq-hw",
> > +		.of_match_table = mtk_cpufreq_hw_match,
> > +	},
> > +};
> > +
> > +static int __init mtk_cpufreq_hw_init(void)
> > +{
> > +	return platform_driver_register(&mtk_cpufreq_hw_driver);
> > +}
> > +module_init(mtk_cpufreq_hw_init);
> > +
> > +static void __exit mtk_cpufreq_hw_exit(void)
> > +{
> > +	platform_driver_unregister(&mtk_cpufreq_hw_driver);
> > +}
> > +module_exit(mtk_cpufreq_hw_exit);
> 
> You can use this instead.
> 
> module_platform_driver(mtk_cpufreq_hw_driver);
> 
OK, will do that.
> > +
> > +MODULE_DESCRIPTION("mtk CPUFREQ HW Driver");
> > +MODULE_LICENSE("GPL v2");
> > -- 
> > 1.7.9.5
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
