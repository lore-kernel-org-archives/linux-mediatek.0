Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC519C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 07:18:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA6720781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 07:18:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NgE0wNEO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LvIknnF7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA6720781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=diT9qAuYWaFFSeItNnboAUxtW0uya7X1fZ8YaNvsLVg=; b=NgE0wNEOyhMRUIymbeImQpngr
	JotRcUaHivA2itwCMSUKxL51eEWAiARQsx6yq1aC3DJj+0uvuAe0iz/dsAY9cK7xiSTVH33D+YDAy
	SzhU59eLjEm8Klm3bcVez/qpNASDOwrzMZH4SEm3B0vt++4rdU/YxECx9ZWabCMdZL8YThQ5GK2Oo
	eice9HoRJZYIt80+mEaKn0ZMoWMKoLwo3q7quY1Mz8i9ULMPeBAtZ7wG5MnSJuaDcjzcGbb8y13nt
	c1wG7fo4UdhuPcCtP+YSmOpPIj5boAUL38ZK7CG5mjC79KVJFz/govfECFLXn3cyllAhWvfmymRgm
	IfJA5NTlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k67VG-0001Ik-BQ; Thu, 13 Aug 2020 07:18:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k67VC-0001IG-Fz; Thu, 13 Aug 2020 07:18:20 +0000
X-UUID: e5556e7c94a445788bf6d4e20796e2a9-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8Io88ZrwIqbKPQHMirxwcd5IeXcfhcyJIWuEIEVMjNY=; 
 b=LvIknnF7MGMLXMTGMscCj/YpTUpMXjiUQW6IrtdhB7ARi97vCCj74+bObVvQmu7OGANb7YB0/Zx4MtixGXsemcL+IeL1XLDol5BmyeFJ4VDqllGxvKaEYREqeoYAYy4NW6WN9BPLrF4oQuE+1jK4tLCTS6o7i+bFtqo/iaBHOd8=;
X-UUID: e5556e7c94a445788bf6d4e20796e2a9-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 156962237; Wed, 12 Aug 2020 23:18:16 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 00:08:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 15:08:05 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Aug 2020 15:07:59 +0800
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
Subject: [PATCH v2 1/2] cpufreq: mediatek-hw: Add support for Mediatek cpufreq
 HW driver
Date: Thu, 13 Aug 2020 15:07:54 +0800
Message-ID: <1597302475-15484-2-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1597302475-15484-1-git-send-email-hector.yuan@mediatek.com>
References: <1597302475-15484-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_031818_805128_CAFA87FF 
X-CRM114-Status: GOOD (  32.14  )
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

Add MT6779 cpufreq HW support.

Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
---
 arch/arm64/configs/defconfig          |    1 +
 drivers/cpufreq/Kconfig.arm           |   11 ++
 drivers/cpufreq/Makefile              |    1 +
 drivers/cpufreq/mediatek-cpufreq-hw.c |  255 +++++++++++++++++++++++++++++++++
 4 files changed, 268 insertions(+)
 create mode 100644 drivers/cpufreq/mediatek-cpufreq-hw.c

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 883e8ba..866a1bf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -86,6 +86,7 @@ CONFIG_CPUFREQ_DT=y
 CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=m
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
+CONFIG_ARM_MEDIATEK_CPUFREQ_HW=m
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_ARM_IMX_CPUFREQ_DT=m
 CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index c6cbfc8..81f1cc1 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -121,6 +121,17 @@ config ARM_MEDIATEK_CPUFREQ
 	help
 	  This adds the CPUFreq driver support for MediaTek SoCs.
 
+config ARM_MEDIATEK_CPUFREQ_HW
+	tristate "MediaTek CPUFreq HW driver"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
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
index 0000000..6752db9
--- /dev/null
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -0,0 +1,255 @@
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
+/* Register offsets */
+#define REG_ENABLE			0x84
+#define REG_PERF_STATE		0x88
+
+static struct platform_device *global_pdev;
+static int mtk_cpufreq_hw_target_index(struct cpufreq_policy *policy,
+				       unsigned int index)
+{
+	void __iomem *perf_state_reg = policy->driver_data;
+	unsigned long freq = policy->freq_table[index].frequency;
+
+	writel_relaxed(index, perf_state_reg);
+	arch_set_freq_scale(policy->related_cpus, freq,
+			    policy->cpuinfo.max_freq);
+	return 0;
+}
+
+static unsigned int mtk_cpufreq_hw_get(unsigned int cpu)
+{
+	void __iomem *perf_state_reg;
+	struct cpufreq_policy *policy;
+	unsigned int index;
+
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (!policy)
+		return 0;
+
+	perf_state_reg = policy->driver_data;
+
+	index = readl_relaxed(perf_state_reg);
+	index = min(index, LUT_MAX_ENTRIES - 1);
+
+	return policy->freq_table[index].frequency;
+}
+
+static int mtk_cpufreq_hw_read_lut(struct device *cpu_dev,
+				   struct cpufreq_policy *policy,
+				   void __iomem *base)
+{
+	u32 data;
+	u32 freq, volt, prev_freq = 0;
+	int i = 0;
+	struct cpufreq_frequency_table	*table;
+
+	table = kcalloc(LUT_MAX_ENTRIES + 1, sizeof(*table), GFP_KERNEL);
+	if (!table)
+		return -ENOMEM;
+
+	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
+		data = readl_relaxed(base + (i * LUT_ROW_SIZE));
+		freq = FIELD_GET(LUT_FREQ, data) * 1000;
+		volt = FIELD_GET(LUT_VOLT, data);
+		if (freq != prev_freq) {
+			table[i].frequency = freq;
+			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
+			dev_dbg(cpu_dev, "index=%d freq=%d, volt=%d\n", i,
+				freq, volt);
+		} else {
+			break;
+		}
+		prev_freq = freq;
+	}
+	table[i].frequency = CPUFREQ_TABLE_END;
+	policy->freq_table = table;
+	dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
+
+	return 0;
+}
+
+static void mtk_get_related_cpus(int index, struct cpumask *m)
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
+		ret = of_parse_phandle_with_args(cpu_np, "mtk,freq-domain",
+						 "#freq-domain-cells", 0,
+						 &args);
+		of_node_put(cpu_np);
+		if (ret < 0)
+			continue;
+
+		if (index == args.args[0])
+			cpumask_set_cpu(cpu, m);
+	}
+}
+
+static int mtk_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
+{
+	struct device *dev = &global_pdev->dev;
+	struct of_phandle_args args;
+	struct device_node *cpu_np;
+	struct device *cpu_dev;
+	struct resource *res;
+	void __iomem *base;
+	int ret, index;
+
+	cpu_dev = get_cpu_device(policy->cpu);
+	if (!cpu_dev) {
+		pr_err("%s: failed to get cpu%d device\n", __func__,
+		       policy->cpu);
+		return -ENODEV;
+	}
+
+	cpu_np = of_cpu_device_node_get(policy->cpu);
+	if (!cpu_np)
+		return -EINVAL;
+
+	ret = of_parse_phandle_with_args(cpu_np, "mtk,freq-domain",
+					 "#freq-domain-cells", 0, &args);
+	of_node_put(cpu_np);
+	if (ret)
+		return ret;
+
+	index = args.args[0];
+	res = platform_get_resource(global_pdev, IORESOURCE_MEM, index);
+	if (!res)
+		return -ENODEV;
+	base = devm_ioremap(dev, res->start, resource_size(res));
+	if (!base)
+		return -ENOMEM;
+
+	mtk_get_related_cpus(index, policy->cpus);
+	if (!cpumask_weight(policy->cpus)) {
+		dev_err(dev, "Domain-%d failed to get related CPUs\n", index);
+		ret = -ENOENT;
+		goto error;
+	}
+
+	policy->driver_data = base + REG_PERF_STATE;
+	ret = mtk_cpufreq_hw_read_lut(cpu_dev, policy, base);
+	if (ret) {
+		dev_err(dev, "Domain-%d failed to read LUT\n", index);
+		goto error;
+	}
+
+	ret = dev_pm_opp_get_opp_count(cpu_dev);
+	if (ret <= 0) {
+		dev_err(cpu_dev, "Failed to add OPPs\n");
+		ret = -ENODEV;
+		goto error;
+	}
+
+	dev_pm_opp_of_register_em(policy->cpus);
+
+	/* HW should be in enabled state to proceed now */
+	writel_relaxed(0x1, (base + REG_ENABLE));
+	return 0;
+error:
+	devm_iounmap(dev, base);
+	return ret;
+}
+
+static int mtk_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
+{
+	struct device *cpu_dev = get_cpu_device(policy->cpu);
+	void __iomem *base = policy->driver_data - REG_PERF_STATE;
+
+	dev_pm_opp_remove_all_dynamic(cpu_dev);
+	kfree(policy->freq_table);
+	devm_iounmap(&global_pdev->dev, base);
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
+	.exit		= mtk_cpufreq_hw_cpu_exit,
+	.name		= "mtk-cpufreq-hw",
+	.attr		= mtk_cpufreq_hw_attr,
+};
+
+static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	global_pdev = pdev;
+	ret = cpufreq_register_driver(&cpufreq_mtk_hw_driver);
+	if (ret)
+		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
+	else
+		dev_dbg(&pdev->dev, "mtk CPUFreq HW driver initialized\n");
+
+	return ret;
+}
+
+static int mtk_cpufreq_hw_driver_remove(struct platform_device *pdev)
+{
+	return cpufreq_unregister_driver(&cpufreq_mtk_hw_driver);
+}
+
+static const struct of_device_id mtk_cpufreq_hw_match[] = {
+	{ .compatible = "mediatek,cpufreq-hw" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_cpufreq_hw_match);
+
+static struct platform_driver mtk_cpufreq_hw_driver = {
+	.probe = mtk_cpufreq_hw_driver_probe,
+	.remove = mtk_cpufreq_hw_driver_remove,
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
+postcore_initcall(mtk_cpufreq_hw_init);
+
+static void __exit mtk_cpufreq_hw_exit(void)
+{
+	platform_driver_unregister(&mtk_cpufreq_hw_driver);
+}
+module_exit(mtk_cpufreq_hw_exit);
+
+MODULE_DESCRIPTION("mtk CPUFREQ HW Driver");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
