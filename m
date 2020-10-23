Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3909FC55179
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:25:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA3320EDD
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UCTeVW1D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GxoWL/Kv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA3320EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UQK+uJPGXPc5C7Ludd5Cin+TcdzGys257iD/bFwzkus=; b=UCTeVW1D584U9Rfk1inGrbSxB
	1GiT8t7eXwPKGi5d3f2G+iUWSbnivGJMAXONrIK7IrK9cf25bUynfE6zzOHcitkdp0gUyD7emru3R
	vX2p6SnL8b1e4jXnUOcSwuqoAPhEKQNWcNnNaLrKViD4vgJ3+KYz+a3uh+5vbWiTqzd6xiiBbLZUt
	8iXbKe9MPGNNWwKwMrpZ8hR6xZlzPJojPf1Yhu5fVpjLheHUoqsWRCxTEL3pio77u/p+xjj0Kb+Is
	EQ03hhTSQDFx7WyNgvclp3bRMAckr/WOV/bcNQqZ8oQUaL1KIGS9uEh4+mObq+cZ/+hyXjlemYf6L
	i6G31i7SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsNy-0008BB-Tj; Fri, 23 Oct 2020 08:25:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsNv-00088K-Qr; Fri, 23 Oct 2020 08:25:17 +0000
X-UUID: f34a7a2f930548ae880044e46c58f6dd-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Pp2yMZzQPe4Sa/3E0kj2dbjDK6yen97nX3nJul0cmAY=; 
 b=GxoWL/KvZuxkZHu9DO6H2Dw4lYVLhRvYuR2JpvXH93xlYhMl3585LSWYSelxY37VzBEZfWibH/yTnaPem59Hvqt0CLa4vsVL1hkqlDB0c3wJOJQhdKJelUUv/AG4shmTSW6d4YoT2TO89RHG9Dp3+ppeuxeo7sKLphEc9WPzVKg=;
X-UUID: f34a7a2f930548ae880044e46c58f6dd-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 423551166; Fri, 23 Oct 2020 00:25:05 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 01:25:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 16:24:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 16:24:55 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Maxime Ripard <mripard@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Amit Kucheria
 <amit.kucheria@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson
 <ulf.hansson@linaro.org>, Dave Gerlach <d-gerlach@ti.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Robin Murphy <robin.murphy@arm.com>, "Lorenzo
 Pieralisi" <lorenzo.pieralisi@arm.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 1/6] cpufreq: mediatek-hw: Add support for CPUFREQ HW
Date: Fri, 23 Oct 2020 16:24:48 +0800
Message-ID: <1603441493-18554-2-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_042516_147771_379D2C2D 
X-CRM114-Status: GOOD (  28.76  )
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
Cc: hector.yuan@mediatek.com, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Hector.Yuan" <hector.yuan@mediatek.com>

Add cpufreq HW support.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 drivers/cpufreq/Kconfig.arm           |   12 ++
 drivers/cpufreq/Makefile              |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c |  276 +++++++++++++++++++++++++++++++++
 3 files changed, 289 insertions(+)
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index cb72fb5..b9d17c5 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -123,6 +123,18 @@ config ARM_MEDIATEK_CPUFREQ
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
index f1b7e3d..ffc61cd 100644
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
index 0000000..74449da
--- /dev/null
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -0,0 +1,276 @@
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
+#include <linux/slab.h>
+
+#define LUT_MAX_ENTRIES			32U
+#define LUT_FREQ			GENMASK(11, 0)
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
+	[REG_ENABLE]		= 0x84,
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
+
+	return 0;
+}
+
+static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
+{
+	struct cpufreq_mtk *c;
+	unsigned int index;
+
+	c = mtk_freq_domain_map[cpu];
+
+	index = readl_relaxed(c->reg_bases[REG_PERF_STATE]);
+	index = min(index, LUT_MAX_ENTRIES - 1);
+
+	return c->table[index].frequency;
+}
+
+static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
+{
+	struct cpufreq_mtk *c;
+
+	c = mtk_freq_domain_map[policy->cpu];
+	if (!c) {
+		pr_err("No scaling support for CPU%d\n", policy->cpu);
+		return -ENODEV;
+	}
+
+	cpumask_copy(policy->cpus, &c->related_cpus);
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
+static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+{
+	struct cpufreq_mtk *c;
+
+	c = mtk_freq_domain_map[policy->cpu];
+	if (!c) {
+		pr_err("No scaling support for CPU%d\n", policy->cpu);
+		return -ENODEV;
+	}
+
+	/* HW should be in paused state now */
+	writel_relaxed(0x0, c->reg_bases[REG_ENABLE]);
+
+	return 0;
+}
+
+static struct cpufreq_driver cpufreq_mtk_hw_driver = {
+	.flags		= CPUFREQ_STICKY | CPUFREQ_NEED_INITIAL_FREQ_CHECK |
+			  CPUFREQ_HAVE_GOVERNOR_PER_POLICY,
+	.verify		= cpufreq_generic_frequency_table_verify,
+	.target_index	= mtk_cpufreq_hw_target_index,
+	.get		= mtk_cpufreq_hw_get,
+	.init		= mtk_cpufreq_hw_cpu_init,
+	.exit		= mtk_cpufreq_hw_cpu_exit,
+	.name		= "mtk-cpufreq-hw",
+	.attr		= cpufreq_generic_attr,
+};
+
+static int mtk_cpu_create_freq_table(struct platform_device *pdev,
+				     struct cpufreq_mtk *c)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *base_table;
+	u32 data, i, freq, prev_freq = 0;
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
+
+		if (freq == prev_freq)
+			break;
+
+		c->table[i].frequency = freq;
+
+		dev_dbg(dev, "index=%d freq=%d\n",
+			i, c->table[i].frequency);
+
+		prev_freq = freq;
+	}
+
+	c->table[i].frequency = CPUFREQ_TABLE_END;
+
+	return 0;
+}
+
+static int mtk_get_related_cpus(int index, struct cpufreq_mtk *c)
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
+		if (index == args.args[0]) {
+			cpumask_set_cpu(cpu, &c->related_cpus);
+			mtk_freq_domain_map[cpu] = c;
+		}
+	}
+
+	return 0;
+}
+
+static int mtk_cpu_resources_init(struct platform_device *pdev,
+				  unsigned int cpu, int index,
+				  const u16 *offsets)
+{
+	struct cpufreq_mtk *c;
+	struct device *dev = &pdev->dev;
+	int ret, i;
+	void __iomem *base;
+
+	if (mtk_freq_domain_map[cpu])
+		return 0;
+
+	c = devm_kzalloc(dev, sizeof(*c), GFP_KERNEL);
+	if (!c)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, index);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	for (i = REG_LUT_TABLE; i < REG_ARRAY_SIZE; i++)
+		c->reg_bases[i] = base + offsets[i];
+
+	ret = mtk_get_related_cpus(index, c);
+	if (ret) {
+		dev_err(dev, "Domain-%d failed to get related CPUs\n", index);
+		return ret;
+	}
+
+	ret = mtk_cpu_create_freq_table(pdev, c);
+	if (ret) {
+		dev_err(dev, "Domain-%d failed to create freq table\n", index);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
+{
+	struct device_node *cpu_np;
+	struct of_phandle_args args;
+	const u16 *offsets;
+	unsigned int cpu;
+	int ret;
+
+	offsets = of_device_get_match_data(&pdev->dev);
+	if (!offsets)
+		return -EINVAL;
+
+	for_each_possible_cpu(cpu) {
+		cpu_np = of_cpu_device_node_get(cpu);
+		if (!cpu_np) {
+			dev_err(&pdev->dev, "Failed to get cpu %d device\n",
+				cpu);
+			return -ENODEV;
+		}
+
+		ret = of_parse_phandle_with_args(cpu_np, "mtk-freq-domain",
+						 "#freq-domain-cells", 0,
+						 &args);
+		if (ret < 0)
+			return ret;
+
+		/* Get the bases of cpufreq for domains */
+		ret = mtk_cpu_resources_init(pdev, cpu, args.args[0], offsets);
+		if (ret) {
+			dev_err(&pdev->dev, "CPUFreq resource init failed\n");
+			return ret;
+		}
+	}
+
+	ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);
+	if (ret) {
+		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
+{
+	return cpufreq_unregister_driver(&cpufreq_mtk_hw_driver);
+}
+
+static const struct of_device_id mtk_cpufreq_hw_match[] = {
+	{ .compatible = "mediatek,cpufreq-hw", .data = &cpufreq_mtk_offsets },
+	{}
+};
+
+static struct platform_driver mtk_cpufreq_hw_driver = {
+	.probe = mtk_cpufreq_hw_driver_probe,
+	.remove = mtk_cpufreq_hw_driver_remove,
+	.driver = {
+		.name = "mtk-cpufreq-hw",
+		.of_match_table = mtk_cpufreq_hw_match,
+	},
+};
+module_platform_driver(mtk_cpufreq_hw_driver);
+
+MODULE_DESCRIPTION("Mediatek cpufreq-hw driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
