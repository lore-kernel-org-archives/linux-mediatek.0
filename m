Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB948C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 13:02:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A1DF63290
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 13:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A1DF63290
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBa8EeZwM2cA4vCuL2JTZ5q1DEcwn2wt9d9pPiZn8MI=; b=xuz1/d65mT8Jo6
	KR68wlvADKgmvbPtofypJCBV36CmGiItnivDWr4Wj5QRMO7rH/px9gZDB0cWeWjzF0ui1jypCthK2
	ZBQZYdNjz/tW7jbXiqObY1lnfSjAnndqx60e9D1uDOz3s3Pr8p1gU50vIsIVy61sP3LzOcr0WY3dU
	cS0bCh76yjvVRNujlm2X7fb1dEtC0OMOb0pr0W/kXQNF7RatHwNGvCehr9t7hmpGVavdhnJNdEI38
	pNjaOrGuysTtpamf4naHUtY9qmU8HQjt8ZC4oMgj85HB+3I9Ye+yHThtj0WwQK4eA7uR4AO7h7sQB
	MCEzrFQhuBNrffxhRnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFcFg-00H0uj-Cc; Mon, 16 Aug 2021 13:02:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFcFa-00H0px-26; Mon, 16 Aug 2021 13:02:02 +0000
X-UUID: 429be09f2ce44f5da17557c444a19e24-20210816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JiUWHQhw3d/c8if14OCuLpHPMoZZhOFQBgPIahZNMuE=; 
 b=OFjMW6op+2zwuImOItFOr6TUMVAQammj9xfTOEn5GxrkKdL8ooiKKBJvBVZH5nE2oPdYyfE/FDPeOK5LcFwV1mqwW95xpKTLgO2MZN9Z57bF4M57Y74IoMdDCnKO3IAetX012eJXmyKte8U0x0DNrYOqyHTptN5fCnEyv7nnDbk=;
X-UUID: 429be09f2ce44f5da17557c444a19e24-20210816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1259682483; Mon, 16 Aug 2021 06:01:52 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 05:56:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 20:56:34 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 20:56:34 +0800
Message-ID: <1629118594.3246.13.camel@mtkswgap22>
Subject: Re: [PATCH v13 2/2] cpufreq: mediatek-hw: Add support for CPUFREQ HW
From: Hector Yuan <hector.yuan@mediatek.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <wsd_upstream@mediatek.com>
Date: Mon, 16 Aug 2021 20:56:34 +0800
In-Reply-To: <20210803071302.b4ttoqgqdq4dfmwe@vireshk-i7>
References: <1627574891-26514-1-git-send-email-hector.yuan@mediatek.com>
 <1627574891-26514-3-git-send-email-hector.yuan@mediatek.com>
 <20210803071302.b4ttoqgqdq4dfmwe@vireshk-i7>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_060158_164643_322A88B8 
X-CRM114-Status: GOOD (  38.57  )
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

On Tue, 2021-08-03 at 12:43 +0530, Viresh Kumar wrote:
> On 30-07-21, 00:08, Hector Yuan wrote:
> > From: "Hector.Yuan" <hector.yuan@mediatek.com>
> > 
> > Add cpufreq HW support
> 
> Please write a proper commit log, what you are adding and which SoCs
> it will apply to. Also add a full stop (.) at the end.
> 
OK, I will write down more details
> > Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> > ---
> >  drivers/cpufreq/Kconfig.arm           |   12 ++
> >  drivers/cpufreq/Makefile              |    1 +
> >  drivers/cpufreq/mediatek-cpufreq-hw.c |  357 +++++++++++++++++++++++++++++++++
> >  include/linux/cpufreq.h               |   39 ++++
> 
> The changes to cpufreq.h should be done in a separate patch.
> 
OK, will separate .h to another patch
> > diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> > new file mode 100644
> > index 0000000..ca50a3a
> > --- /dev/null
> > +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> > @@ -0,0 +1,357 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cpufreq.h>
> > +#include <linux/energy_model.h>
> > +#include <linux/init.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/pm_qos.h>
> > +#include <linux/slab.h>
> > +
> > +#define LUT_MAX_ENTRIES			32U
> > +#define LUT_FREQ			GENMASK(11, 0)
> > +#define LUT_ROW_SIZE			0x4
> > +#define CPUFREQ_HW_STATUS		BIT(0)
> > +#define SVS_HW_STATUS			BIT(1)
> > +#define POLL_USEC			1000
> > +#define TIMEOUT_USEC			300000
> > +
> > +enum {
> > +	REG_FREQ_LUT_TABLE,
> > +	REG_FREQ_ENABLE,
> > +	REG_FREQ_PERF_STATE,
> > +	REG_FREQ_HW_STATE,
> > +	REG_EM_POWER_TBL,
> > +	REG_FREQ_LATENCY,
> > +
> > +	REG_ARRAY_SIZE,
> > +};
> > +
> > +struct cpufreq_mtk {
> > +	struct cpufreq_frequency_table *table;
> > +	void __iomem *reg_bases[REG_ARRAY_SIZE];
> > +	int nr_opp;
> > +	cpumask_t related_cpus;
> > +};
> > +
> > +static const u16 cpufreq_mtk_offsets[REG_ARRAY_SIZE] = {
> > +	[REG_FREQ_LUT_TABLE]	= 0x0,
> > +	[REG_FREQ_ENABLE]	= 0x84,
> > +	[REG_FREQ_PERF_STATE]	= 0x88,
> > +	[REG_FREQ_HW_STATE]	= 0x8c,
> > +	[REG_EM_POWER_TBL]	= 0x90,
> > +	[REG_FREQ_LATENCY]	= 0x110,
> > +};
> > +
> > +static struct cpufreq_mtk *mtk_freq_domain_map[NR_CPUS];
> > +
> > +static int __maybe_unused
> > +mtk_cpufreq_get_cpu_power(unsigned long *mW,
> > +			  unsigned long *KHz, struct device *cpu_dev)
> > +{
> > +	struct cpufreq_mtk *c;
> > +	struct cpufreq_policy *policy;
> > +	int i;
> > +
> > +	policy = cpufreq_cpu_get_raw(cpu_dev->id);
> > +	if (!policy)
> > +		return 0;
> > +
> > +	c = mtk_freq_domain_map[policy->cpu];
> > +
> > +	for (i = 0; i < c->nr_opp; i++) {
> > +		if (c->table[i].frequency < *KHz)
> > +			break;
> > +	}
> > +	i--;
> > +
> > +	*KHz = c->table[i].frequency;
> > +	*mW = readl_relaxed(c->reg_bases[REG_EM_POWER_TBL] +
> > +			    i * LUT_ROW_SIZE) / 1000;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
> > +				       unsigned int index)
> > +{
> > +	struct cpufreq_mtk *c = policy->driver_data;
> > +
> > +	writel_relaxed(index, c->reg_bases[REG_FREQ_PERF_STATE]);
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
> > +	c = mtk_freq_domain_map[policy->cpu];
> > +
> > +	index = readl_relaxed(c->reg_bases[REG_FREQ_PERF_STATE]);
> > +	index = min(index, LUT_MAX_ENTRIES - 1);
> > +
> > +	return c->table[index].frequency;
> > +}
> > +
> > +static unsigned int mtk_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
> > +					       unsigned int target_freq)
> > +{
> > +	struct cpufreq_mtk *c = policy->driver_data;
> > +	unsigned int index;
> > +
> > +	index = cpufreq_table_find_index_dl(policy, target_freq);
> > +
> > +	writel_relaxed(index, c->reg_bases[REG_FREQ_PERF_STATE]);
> > +
> > +	return policy->freq_table[index].frequency;
> > +}
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
> > +	base_table = c->reg_bases[REG_FREQ_LUT_TABLE];
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
> 
> Won't this fit in a single line ?
> 
OK, will modify to single line
> > +
> > +		prev_freq = freq;
> > +	}
> > +
> > +	c->table[i].frequency = CPUFREQ_TABLE_END;
> > +	c->nr_opp = i;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cpu_resources_init(struct platform_device *pdev,
> > +				  unsigned int cpu, int index,
> > +				  const u16 *offsets)
> > +{
> > +	struct cpufreq_mtk *c;
> > +	struct device *dev = &pdev->dev;
> > +	int ret, i;
> > +	void __iomem *base;
> > +
> > +	if (mtk_freq_domain_map[cpu])
> 
> This should not happen anymore, isn't it ?
> 
Will remove cpu map.
> > +		return 0;
> > +
> > +	c = devm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
> > +	if (!c)
> > +		return -ENOMEM;
> > +
> > +	base = devm_platform_ioremap_resource(pdev, index);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	for (i = REG_FREQ_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
> > +		c->reg_bases[i] = base + offsets[i];
> > +
> > +	ret = of_perf_domain_get_sharing_cpumask(index, "performance-domains",
> 
> Instead of parsing parsing "performance-domains" twice, I would rather
> pass a CPU number here instead of index.
> 
Sorry, could you give me more details? For now, will use index to parse
per-cpu to related cpus.You mean pass policy->cpu or? Thanks.
> > +						 "#performance-domain-cells",
> > +						 &c->related_cpus);
> 
> You could have directly passed policy->cpus here instead.
> 
will replace it.
> > +	if (ret) {
> > +		dev_info(dev, "Domain-%d failed to get related CPUs\n", index);
> > +		return ret;
> > +	}
> > +
> > +	ret = mtk_cpu_create_freq_table(pdev, c);
> > +	if (ret) {
> > +		dev_info(dev, "Domain-%d failed to create freq table\n", index);
> > +		return ret;
> > +	}
> > +
> > +	mtk_freq_domain_map[cpu] = c;
> 
> I will rather use policy->driver_data to store this now.
> 
OK
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
> > +{
> > +	struct platform_device *pdev = cpufreq_get_driver_data();
> > +	struct cpufreq_mtk *c;
> > +	struct device *cpu_dev;
> > +	struct em_data_callback em_cb = EM_DATA_CB(mtk_cpufreq_get_cpu_power);
> > +	struct pm_qos_request *qos_request;
> > +	struct device_node *cpu_np;
> > +	struct of_phandle_args args;
> > +	const u16 *offsets;
> > +	unsigned int latency;
> > +	int sig, pwr_hw = CPUFREQ_HW_STATUS | SVS_HW_STATUS;
> > +	int ret;
> 
> It looks much more organized when the variable definitions are in
> decreasing order of their length, instead of the random order as it is
> right now.
> 
OK, will sort it.
> > +
> > +	offsets = of_device_get_match_data(&pdev->dev);
> > +	if (!offsets)
> > +		return -EINVAL;
> > +
> > +	cpu_np = of_cpu_device_node_get(policy->cpu);
> > +	if (!cpu_np) {
> > +		dev_info(&pdev->dev, "Failed to get cpu %d device\n",
> > +			 policy->cpu);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = of_parse_phandle_with_args(cpu_np, "performance-domains",
> > +					 "#performance-domain-cells", 0,
> > +					 &args);
> > +	if (ret < 0)
> 
> What about dropping cpu_np and same later in the code as well ?
> 
OK, Will add it.
> > +		return ret;
> > +
> > +	/* Get the bases of cpufreq for domains */
> > +	ret = mtk_cpu_resources_init(pdev, policy->cpu, args.args[0], offsets);
> > +	if (ret) {
> > +		dev_info(&pdev->dev, "CPUFreq resource init failed\n");
> > +		return ret;
> > +	}
> > +
> > +	cpu_dev = get_cpu_device(policy->cpu);
> > +	if (!cpu_dev) {
> > +		pr_err("failed to get cpu%d device\n", policy->cpu);
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
> 
> Oh you already do this, you can remove mtk_freq_domain_map array now.
> 
OK, will remove map.
> > +
> > +	latency = readl_relaxed(c->reg_bases[REG_FREQ_LATENCY]);
> > +	if (!latency)
> > +		latency = CPUFREQ_ETERNAL;
> > +
> > +	/* us convert to ns */
> > +	policy->cpuinfo.transition_latency = latency * 1000;
> 
> You want to multiple CPUFREQ_ETERNAL too ?
> 
Yes, may be different power domain with different transition latency.
> > +
> > +	policy->fast_switch_possible = true;
> > +
> > +	qos_request = kzalloc(sizeof(*qos_request), GFP_KERNEL);
> 
> This is a small structure, why not allocate it on stack instead ?
> 
For qos part, we'd like to take more time to re-consider the SW flow and
put this to another patch set.Is this okay to you?
> > +	if (!qos_request)
> > +		return -ENOMEM;
> > +
> > +	/* Let CPUs leave idle-off state for SVS CPU initializing */
> > +	cpu_latency_qos_add_request(qos_request, 0);
> > +
> > +	/* HW should be in enabled state to proceed now */
> > +	writel_relaxed(0x1, c->reg_bases[REG_FREQ_ENABLE]);
> > +
> > +	if (readl_poll_timeout(c->reg_bases[REG_FREQ_HW_STATE], sig,
> > +			       (sig & pwr_hw) == pwr_hw, POLL_USEC,
> > +			       TIMEOUT_USEC)) {
> > +		if (!(sig & CPUFREQ_HW_STATUS)) {
> > +			pr_info("cpufreq hardware of CPU%d is not enabled\n",
> > +				policy->cpu);
> > +			return -ENODEV;
> > +		}
> > +
> > +		pr_info("SVS of CPU%d is not enabled\n", policy->cpu);
> > +	}
> > +
> > +	cpu_latency_qos_remove_request(qos_request);
> > +
> > +	em_dev_register_perf_domain(cpu_dev, c->nr_opp, &em_cb, policy->cpus, true);
> > +
> > +	kfree(qos_request);
> 
> Why free after registering for em ? And also move the entire qos thing
> into a separate routine instead of adding it to ->init().
> 
If you agree, we'll consider to put it in another patch set.
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
> > +{
> > +	struct cpufreq_mtk *c;
> > +
> > +	c = mtk_freq_domain_map[policy->cpu];
> > +
> > +	/* HW should be in paused state now */
> > +	writel_relaxed(0x0, c->reg_bases[REG_FREQ_ENABLE]);
> 
> Please make sure each and every resource is freed here and in probe on
> failures.
> 
OK, will free all resources as probe.
> > +
> > +	return 0;
> > +}
> > +
> > +static struct cpufreq_driver cpufreq_mtk_hw_driver = {
> > +	.flags		= CPUFREQ_NEED_INITIAL_FREQ_CHECK |
> > +			  CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
> > +			  CPUFREQ_IS_COOLING_DEV,
> > +	.verify		= cpufreq_generic_frequency_table_verify,
> > +	.target_index	= mtk_cpufreq_hw_target_index,
> > +	.get		= mtk_cpufreq_hw_get,
> > +	.init		= mtk_cpufreq_hw_cpu_init,
> > +	.exit		= mtk_cpufreq_hw_cpu_exit,
> > +	.fast_switch	= mtk_cpufreq_hw_fast_switch,
> > +	.name		= "mtk-cpufreq-hw",
> > +	.attr		= cpufreq_generic_attr,
> > +};
> > +
> > +static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
> > +{
> > +	int ret;
> > +
> > +	cpufreq_mtk_hw_driver.driver_data = pdev;
> > +
> > +	ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> 
> You can do return ret here and drop the earlier return and its {}.
> 
okay.
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
> > +module_platform_driver(mtk_cpufreq_hw_driver);
> > +
> > +MODULE_DESCRIPTION("Mediatek cpufreq-hw driver");
> > +MODULE_LICENSE("GPL v2");
> 
> You can add Module-author as well here if you want.
> 
OK.
> > diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> > index 9fd7194..4916d70 100644
> > --- a/include/linux/cpufreq.h
> > +++ b/include/linux/cpufreq.h
> > @@ -13,6 +13,8 @@
> >  #include <linux/completion.h>
> >  #include <linux/kobject.h>
> >  #include <linux/notifier.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/pm_qos.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/sysfs.h>
> > @@ -1036,6 +1038,43 @@ void arch_set_freq_scale(const struct cpumask *cpus,
> >  }
> >  #endif
> >  
> > +#ifdef CONFIG_CPU_FREQ
> 
> There is another CONFIG_CPU_FREQ a few lines above, please use the
> same block for this routine as well.
> 
OK, will move it to the above.
> > +static inline int of_perf_domain_get_sharing_cpumask(int index, const char *list_name,
> > +						     const char *cell_name,
> > +						     struct cpumask *cpumask)
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
> > +		ret = of_parse_phandle_with_args(cpu_np, list_name,
> > +						 cell_name, 0,
> > +						 &args);
> > +
> > +		of_node_put(cpu_np);
> > +		if (ret < 0)
> > +			continue;
> > +
> > +		if (index == args.args[0])
> > +			cpumask_set_cpu(cpu, cpumask);
> > +	}
> > +
> > +	return 0;
> > +}
> > +#else
> > +static inline int of_perf_domain_get_sharing_cpumask(int index, const char *list_name,
> > +						     const char *cell_name,
> > +						     struct cpumask *cpumask)
> > +{
> > +	return 0;
> 
> 	return -EOPNOTSUPP;
> 
> > +}
> > +#endif
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
