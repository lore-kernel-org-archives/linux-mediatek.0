Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9E5C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:12:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0ADA20707
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 13:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAtMeOb2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="lWnRofbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0ADA20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kPZckHj4HpeFYTqPsh1y2QiYCMjM8Avtscf9MJCo/C0=; b=eAtMeOb26ATtQaERH20c9QSnu
	/33i7t4rlr1LIS2I9FPNToOkdtxOoEVjtL+fc5/M0LC6B3/aRkvWI6fdOe1iWNJHDyhG43NpdJIpO
	/yZfP43mYGTCwGPGa+z1i3EY4S3K3Nd4L6K1NTUbkW8kfnsetOpIJpkGbwtJLt3xBSO1BmzD+aYPN
	7oDeXjUIrC81SdH6QZuttkd00J0yENtMOpDg4Q5OHNrdmae8AVG0iSn0+RaH4z046ljTggK7vub1x
	3vkLv6q9m1yiBdr3hlL5TH3K42bkmR2xj8DQGD4uvnLsliHYClC4ionG4QWKgV6D6hjkhQBNQ9JPR
	ZX5nQsUwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAvDx-0003r6-91; Wed, 26 Aug 2020 13:12:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAvDk-0003lH-K7; Wed, 26 Aug 2020 13:12:09 +0000
X-UUID: 02adc8e247c3406bb5c38a0aca577c1e-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=q+YqZIg/PDK9Io6p3eN7H4lQSTi+FeEESntXUiBV/o8=; 
 b=lWnRofbmxN6zbTWHE0XFpxw4zCThnVQ6yWDQbtj2ULpEQ6HeyDKouAXmnAz3/qOQMwgmQ+FyUClBKaNlwef+wi9fnkFg+YKIbH+hXjc+xV6jxM4KybX+rUgml9Spwy37F6JUoSqkQ7NeWvl/IGcvKoiYC6hzFCaIgwak7hedJ2I=;
X-UUID: 02adc8e247c3406bb5c38a0aca577c1e-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1269246089; Wed, 26 Aug 2020 05:12:03 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 06:02:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 21:01:57 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Aug 2020 21:01:57 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Anson Huang <Anson.Huang@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>
Subject: [PATCH v3 1/2] cpufreq: mediatek-hw: Add support for Mediatek cpufreq
 HW driver
Date: Wed, 26 Aug 2020 21:01:52 +0800
Message-ID: <1598446913-24325-2-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
References: <1598446913-24325-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_091208_890305_6A01CE43 
X-CRM114-Status: GOOD (  30.80  )
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
Cc: hector.yuan@mediatek.com, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add MT6779 cpufreq HW support.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 drivers/cpufreq/Kconfig.arm           |   12 ++
 drivers/cpufreq/Makefile              |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c |  305 +++++++++++++++++++++++++++++++++
 3 files changed, 318 insertions(+)
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index c6cbfc8..8e58c12 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -121,6 +121,18 @@ config ARM_MEDIATEK_CPUFREQ
 	help
 	  This adds the CPUFreq driver support for MediaTek SoCs.
 
+config ARM_MEDIATEK_CPUFREQ_HW
+	tristate "MediaTek CPUFreq HW driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	default m
+	help
+	  Support for the CPUFreq HW driver.
+	  Some MediaTek chipsets have a HW engine to offload the steps
+	  necessary for changing the frequency of the CPUs. Firmware loaded
+	  in this engine exposes a programming interface to the OS.
+	  The driver implements the cpufreq interface for this HW engine.
+	  Say Y if you want to support CPUFreq HW.
+
 config ARM_OMAP2PLUS_CPUFREQ
 	bool "TI OMAP2+"
 	depends on ARCH_OMAP2PLUS
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index f6670c4..dc1f371 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_ARM_IMX6Q_CPUFREQ)		+= imx6q-cpufreq.o
 obj-$(CONFIG_ARM_IMX_CPUFREQ_DT)	+= imx-cpufreq-dt.o
 obj-$(CONFIG_ARM_KIRKWOOD_CPUFREQ)	+= kirkwood-cpufreq.o
 obj-$(CONFIG_ARM_MEDIATEK_CPUFREQ)	+= mediatek-cpufreq.o
+obj-$(CONFIG_ARM_MEDIATEK_CPUFREQ_HW)	+= mediatek-cpufreq-hw.o
 obj-$(CONFIG_MACH_MVEBU_V7)		+= mvebu-cpufreq.o
 obj-$(CONFIG_ARM_OMAP2PLUS_CPUFREQ)	+= omap-cpufreq.o
 obj-$(CONFIG_ARM_PXA2xx_CPUFREQ)	+= pxa2xx-cpufreq.o
diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
new file mode 100644
index 0000000..86ce7f0
--- /dev/null
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cpufreq.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/pm_opp.h>
+#include <linux/slab.h>
+
+#define LUT_MAX_ENTRIES			32U
+#define LUT_FREQ			GENMASK(11, 0)
+#define LUT_VOLT			GENMASK(28, 12)
+#define LUT_ROW_SIZE			0x4
+
+enum {
+	REG_LUT_TABLE,
+	REG_ENABLE,
+	REG_PERF_STATE,
+
+	REG_ARRAY_SIZE,
+};
+
+struct cpufreq_mtk {
+	struct cpufreq_frequency_table *table;
+	void __iomem *reg_bases[REG_ARRAY_SIZE];
+	cpumask_t related_cpus;
+};
+
+static const u16 cpufreq_mtk_offsets[REG_ARRAY_SIZE] = {
+	[REG_LUT_TABLE]		= 0x0,
+	[REG_ENABLE]	= 0x84,
+	[REG_PERF_STATE]	= 0x88,
+};
+
+static struct cpufreq_mtk *mtk_freq_domain_map[NR_CPUS];
+
+static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
+				       unsigned int index)
+{
+	struct cpufreq_mtk *c = policy->driver_data;
+
+	writel_relaxed(index, c->reg_bases[REG_PERF_STATE]);
+	arch_set_freq_scale(policy->related_cpus,
+			    policy->freq_table[index].frequency,
+			    policy->cpuinfo.max_freq);
+
+	return 0;
+}
+
+static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
+{
+	struct cpufreq_mtk *c;
+	struct cpufreq_policy *policy;
+	unsigned int index;
+
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (!policy)
+		return 0;
+
+	c = policy->driver_data;
+
+	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
+	index = min(index, LUT_MAX_ENTRIES - 1);
+
+	return policy->freq_table[index].frequency;
+}
+
+static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
+{
+	struct cpufreq_mtk *c;
+	struct device *cpu_dev;
+	int ret;
+
+	cpu_dev = get_cpu_device(policy->cpu);
+	if (!cpu_dev) {
+		pr_err("%s: failed to get cpu%d device\n", __func__,
+		       policy->cpu);
+		return -ENODEV;
+	}
+
+	c = mtk_freq_domain_map[policy->cpu];
+	if (!c) {
+		pr_err("No scaling support for CPU%d\n", policy->cpu);
+		return -ENODEV;
+	}
+
+	cpumask_copy(policy->cpus, &c->related_cpus);
+
+	ret = dev_pm_opp_get_opp_count(cpu_dev);
+	if (ret <= 0)
+		dev_err(cpu_dev, "OPP table is not ready\n");
+
+	policy->freq_table = c->table;
+	policy->driver_data = c;
+
+	/* HW should be in enabled state to proceed now */
+	writel_relaxed(0x1, c->reg_bases[REG_ENABLE]);
+
+	return 0;
+}
+
+static struct freq_attr *mtk_cpufreq_hw_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL
+};
+
+static struct cpufreq_driver cpufreq_mtk_hw_driver = {
+	.flags		= CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
+			  CPUFREQ_HAVE_GOVERNOR_PER_POLICY,
+	.verify		= cpufreq_generic_frequency_table_verify,
+	.target_index	= mtk_cpufreq_hw_target_index,
+	.get		= mtk_cpufreq_hw_get,
+	.init		= mtk_cpufreq_hw_cpu_init,
+	.name		= "mtk-cpufreq-hw",
+	.attr		= mtk_cpufreq_hw_attr,
+};
+
+static int mtk_cpufreq_hw_opp_create(struct platform_device *pdev,
+				     struct cpufreq_mtk *c)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *base_table;
+	u32 data, i, freq, volt, prev_freq = 0;
+	unsigned long cpu;
+
+	c->table = devm_kcalloc(dev, LUT_MAX_ENTRIES + 1,
+				sizeof(*c->table), GFP_KERNEL);
+	if (!c->table)
+		return -ENOMEM;
+
+	base_table = c->reg_bases[REG_LUT_TABLE];
+
+	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
+		data = readl_relaxed(base_table + (i * LUT_ROW_SIZE));
+		freq = FIELD_GET(LUT_FREQ, data) * 1000;
+		volt = FIELD_GET(LUT_VOLT, data) * 10;
+		c->table[i].frequency = freq;
+
+		dev_dbg(dev, "index=%d freq=%d\n",
+			i, c->table[i].frequency);
+
+		if (freq == prev_freq)
+			break;
+
+		prev_freq = freq;
+
+		for_each_cpu(cpu, &c->related_cpus)
+			dev_pm_opp_add(get_cpu_device(cpu), freq, volt);
+	}
+
+	c->table[i].frequency = CPUFREQ_TABLE_END;
+
+	return 0;
+}
+
+static int mtk_get_related_cpus(int index, struct cpumask *m)
+{
+	struct device_node *cpu_np;
+	struct of_phandle_args args;
+	int cpu, ret;
+
+	for_each_possible_cpu(cpu) {
+		cpu_np = of_cpu_device_node_get(cpu);
+		if (!cpu_np)
+			continue;
+
+		ret = of_parse_phandle_with_args(cpu_np, "mtk-freq-domain",
+						 "#freq-domain-cells", 0,
+						 &args);
+		of_node_put(cpu_np);
+		if (ret < 0)
+			continue;
+
+		if (index == args.args[0])
+			cpumask_set_cpu(cpu, m);
+	}
+
+	return 0;
+}
+
+static int mtk_cpu_resources_init(struct platform_device *pdev,
+				  unsigned int cpu, int index)
+{
+	struct cpufreq_mtk *c;
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+	const u16 *offsets;
+	int ret, i, cpu_r;
+	void __iomem *base;
+
+	if (mtk_freq_domain_map[cpu])
+		return 0;
+
+	c = devm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return -ENOMEM;
+
+	offsets = of_device_get_match_data(&pdev->dev);
+	if (!offsets)
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	for (i = REG_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
+		c->reg_bases[i] = base + offsets[i];
+
+	ret = mtk_get_related_cpus(index, &c->related_cpus);
+	if (ret) {
+		dev_err(dev, "Domain-%d failed to get related CPUs\n", index);
+		return ret;
+	}
+
+	ret = mtk_cpufreq_hw_opp_create(pdev, c);
+	if (ret) {
+		dev_err(dev, "Domain-%d failed to create OPP\n", index);
+		return ret;
+	}
+
+	for_each_cpu(cpu_r, &c->related_cpus)
+		mtk_freq_domain_map[cpu_r] = c;
+
+	return 0;
+}
+
+static int mtk_resources_init(struct platform_device *pdev)
+{
+	struct device_node *cpu_np;
+	struct of_phandle_args args;
+	unsigned int cpu;
+	int ret;
+
+	for_each_possible_cpu(cpu) {
+		cpu_np = of_cpu_device_node_get(cpu);
+		if (!cpu_np) {
+			dev_dbg(&pdev->dev, "Failed to get cpu %d device\n",
+				cpu);
+			continue;
+		}
+
+		ret = of_parse_phandle_with_args(cpu_np, "mtk-freq-domain",
+						 "#freq-domain-cells", 0, &args);
+		if (ret < 0)
+			return ret;
+
+		ret = mtk_cpu_resources_init(pdev, cpu, args.args[0]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	/* Get the bases of cpufreq for domains */
+	ret = mtk_resources_init(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "CPUFreq resource init failed\n");
+		return ret;
+	}
+
+	ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);
+	if (ret) {
+		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
+		return ret;
+	}
+
+	dev_dbg(&pdev->dev, "Mediatek CPUFreq HW driver initialized\n");
+	of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_cpufreq_hw_match[] = {
+	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_offsets },
+	{}
+};
+
+static struct platform_driver mtk_cpufreq_hw_driver = {
+	.probe = mtk_cpufreq_hw_driver_probe,
+	.driver = {
+		.name = "mtk-cpufreq-hw",
+		.of_match_table = mtk_cpufreq_hw_match,
+	},
+};
+
+static int __init mtk_cpufreq_hw_init(void)
+{
+	return platform_driver_register(&mtk_cpufreq_hw_driver);
+}
+subsys_initcall(mtk_cpufreq_hw_init);
+
+MODULE_DESCRIPTION("mtk CPUFREQ HW Driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
