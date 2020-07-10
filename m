Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92241C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6215A2073A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SOS5NnBJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gtyBdGrf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6215A2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nIb8YTThrANu9O7lG0t63FVcfG5/B9BT0NrMHETlqHE=; b=SOS5NnBJ1tk7ENfBlMsCZK+Wy
	un51gYuo97+vlwKYbyi/nvUf7WhRjQqhsrcq1DFgMM5f5ZK5M7O1SafzkQBYX3PjV2GPyQ4G/D9p5
	1kuHw/UvIsjd4B46Hzpp3d6wrbjVaB2cRcbnLZTd8VzthWZSWF7QSH3W9b/GgGFPrx1d8TFOZ1yeq
	AzfO9d9XWBd7UerLwbTSwQkFn3jWu4KtMQShcTB9J/tlgzOSHwKI5QZ9XM4gnVI5+LQlK5G1GK4PK
	iMcbrrdPKY9u1+DzpNUCYMh7pogjSX09GVl0VJPEa8wZD6YRjRZ8BojhnX33fbGLhxFMG2BudOdXW
	1m+Zxl1ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtipN-0004PH-HT; Fri, 10 Jul 2020 02:31:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtipH-0004LR-0I; Fri, 10 Jul 2020 02:31:48 +0000
X-UUID: 233f27548a7a4f46b9fd83ec7cdc4708-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BbPf2fRa+f9oRvFxM99uxgLnrwRKMFDtDBjiYxbvQO0=; 
 b=gtyBdGrfo1aTbKBxUzR+88GxRZtFR37qNm7FYNcV0AJeVFTroQQPL8af9ZZMf+pBfJYudwsh8OK6wAh/2QaooVcknQmsTnyS28babvsoVw2aHldawagi59g2PMg46exNfvX4HupFvxWFv30zMxlS/UC9YM+0E62Kpi0cIiXuRsc=;
X-UUID: 233f27548a7a4f46b9fd83ec7cdc4708-20200709
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 309042679; Thu, 09 Jul 2020 18:31:32 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 19:31:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 10:31:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Jul 2020 10:31:32 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v7 4/8] devfreq: add mediatek cci devfreq
Date: Fri, 10 Jul 2020 10:31:20 +0800
Message-ID: <1594348284-14199-5-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_223147_327210_9BB86C7D 
X-CRM114-Status: GOOD (  27.39  )
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
Cc: devicetree@vger.kernel.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

This adds a devfreq driver for the Cache Coherent Interconnect (CCI)
of the Mediatek MT8183.

On the MT8183 the CCI is supplied by the same regulator as the LITTLE
cores. The driver is notified when the regulator voltage changes
(driven by cpufreq) and adjusts the CCI frequency to the maximum
possible value.

Change-Id: I3d54ede336418e76df5d316064b6c3857a9f1075
Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/devfreq/Kconfig              |  10 ++
 drivers/devfreq/Makefile             |   1 +
 drivers/devfreq/mt8183-cci-devfreq.c | 198 +++++++++++++++++++++++++++++++++++
 3 files changed, 209 insertions(+)
 create mode 100644 drivers/devfreq/mt8183-cci-devfreq.c

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index 42b1286e98e6..109aab7ea45b 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -111,6 +111,16 @@ config ARM_IMX8M_DDRC_DEVFREQ
 	  This adds the DEVFREQ driver for the i.MX8M DDR Controller. It allows
 	  adjusting DRAM frequency.
 
+config ARM_MT8183_CCI_DEVFREQ
+	tristate "MT8183 CCI DEVFREQ Driver"
+	depends on ARM_MEDIATEK_CPUFREQ
+	help
+		This adds a devfreq driver for Cache Coherent Interconnect
+		of Mediatek MT8183, which is shared the same regulator
+		with cpu cluster.
+		It can track buck voltage and update a proper CCI frequency.
+		Use notification to get regulator status.
+
 config ARM_TEGRA_DEVFREQ
 	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
 	depends on ARCH_TEGRA_3x_SOC || ARCH_TEGRA_114_SOC || \
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 3ca1ad0ecb97..78733ff6fa5d 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
 obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
 obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
+obj-$(CONFIG_ARM_MT8183_CCI_DEVFREQ)	+= mt8183-cci-devfreq.o
 obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
 obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
 obj-$(CONFIG_ARM_TEGRA20_DEVFREQ)	+= tegra20-devfreq.o
diff --git a/drivers/devfreq/mt8183-cci-devfreq.c b/drivers/devfreq/mt8183-cci-devfreq.c
new file mode 100644
index 000000000000..62d02464a34b
--- /dev/null
+++ b/drivers/devfreq/mt8183-cci-devfreq.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+
+ * Author: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/devfreq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/time.h>
+
+#define MAX_VOLT_LIMIT		(1150000)
+
+struct cci_devfreq {
+	struct devfreq *devfreq;
+	struct regulator *cpu_reg;
+	struct clk *cci_clk;
+	int old_vproc;
+	unsigned long old_freq;
+};
+
+static int mtk_cci_set_voltage(struct cci_devfreq *cci_df, int vproc)
+{
+	int ret;
+
+	ret = regulator_set_voltage(cci_df->cpu_reg, vproc,
+				    MAX_VOLT_LIMIT);
+	if (!ret)
+		cci_df->old_vproc = vproc;
+	return ret;
+}
+
+static int mtk_cci_devfreq_target(struct device *dev, unsigned long *freq,
+				  u32 flags)
+{
+	int ret;
+	struct cci_devfreq *cci_df = dev_get_drvdata(dev);
+	struct dev_pm_opp *opp;
+	unsigned long opp_rate, opp_voltage, old_voltage;
+
+	if (!cci_df)
+		return -EINVAL;
+
+	if (cci_df->old_freq == *freq)
+		return 0;
+
+	opp_rate = *freq;
+	opp = devfreq_recommended_opp(dev, &opp_rate, 1);
+	opp_voltage = dev_pm_opp_get_voltage(opp);
+	dev_pm_opp_put(opp);
+
+	old_voltage = cci_df->old_vproc;
+	if (old_voltage == 0)
+		old_voltage = regulator_get_voltage(cci_df->cpu_reg);
+
+	// scale up: set voltage first then freq
+	if (opp_voltage > old_voltage) {
+		ret = mtk_cci_set_voltage(cci_df, opp_voltage);
+		if (ret) {
+			pr_err("cci: failed to scale up voltage\n");
+			return ret;
+		}
+	}
+
+	ret = clk_set_rate(cci_df->cci_clk, *freq);
+	if (ret) {
+		pr_err("%s: failed cci to set rate: %d\n", __func__,
+		       ret);
+		mtk_cci_set_voltage(cci_df, old_voltage);
+		return ret;
+	}
+
+	// scale down: set freq first then voltage
+	if (opp_voltage < old_voltage) {
+		ret = mtk_cci_set_voltage(cci_df, opp_voltage);
+		if (ret) {
+			pr_err("cci: failed to scale down voltage\n");
+			clk_set_rate(cci_df->cci_clk, cci_df->old_freq);
+			return ret;
+		}
+	}
+
+	cci_df->old_freq = *freq;
+
+	return 0;
+}
+
+static struct devfreq_dev_profile cci_devfreq_profile = {
+	.target = mtk_cci_devfreq_target,
+};
+
+static int mtk_cci_devfreq_probe(struct platform_device *pdev)
+{
+	struct device *cci_dev = &pdev->dev;
+	struct cci_devfreq *cci_df;
+	struct devfreq_passive_data *passive_data;
+	int ret;
+
+	cci_df = devm_kzalloc(cci_dev, sizeof(*cci_df), GFP_KERNEL);
+	if (!cci_df)
+		return -ENOMEM;
+
+	cci_df->cci_clk = devm_clk_get(cci_dev, "cci_clock");
+	ret = PTR_ERR_OR_ZERO(cci_df->cci_clk);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(cci_dev, "failed to get clock for CCI: %d\n",
+				ret);
+		return ret;
+	}
+	cci_df->cpu_reg = devm_regulator_get_optional(cci_dev, "proc");
+	ret = PTR_ERR_OR_ZERO(cci_df->cpu_reg);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(cci_dev, "failed to get regulator for CCI: %d\n",
+				ret);
+		return ret;
+	}
+	ret = regulator_enable(cci_df->cpu_reg);
+	if (ret) {
+		dev_err(cci_dev, "enable buck for cci fail\n");
+		return ret;
+	}
+
+	ret = dev_pm_opp_of_add_table(cci_dev);
+	if (ret) {
+		dev_err(cci_dev, "Fail to get OPP table for CCI: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, cci_df);
+
+	passive_data = devm_kzalloc(cci_dev, sizeof(*passive_data), GFP_KERNEL);
+	if (!passive_data) {
+		ret = -ENOMEM;
+		goto err_opp;
+	}
+
+	passive_data->parent_type = CPUFREQ_PARENT_DEV;
+
+	cci_df->devfreq = devm_devfreq_add_device(cci_dev,
+						  &cci_devfreq_profile,
+						  DEVFREQ_GOV_PASSIVE,
+						  passive_data);
+	if (IS_ERR(cci_df->devfreq)) {
+		ret = PTR_ERR(cci_df->devfreq);
+		dev_err(cci_dev, "cannot create cci devfreq device:%d\n", ret);
+		goto err_opp;
+	}
+
+	return 0;
+
+err_opp:
+	dev_pm_opp_of_remove_table(cci_dev);
+	return ret;
+}
+
+static int mtk_cci_devfreq_remove(struct platform_device *pdev)
+{
+	struct device *cci_dev = &pdev->dev;
+	struct cci_devfreq *cci_df;
+	struct notifier_block *opp_nb;
+
+	cci_df = platform_get_drvdata(pdev);
+	opp_nb = &cci_df->opp_nb;
+
+	dev_pm_opp_unregister_notifier(cci_dev, opp_nb);
+	dev_pm_opp_of_remove_table(cci_dev);
+	regulator_disable(cci_df->cpu_reg);
+
+	return 0;
+}
+
+static const __maybe_unused struct of_device_id
+	mediatek_cci_of_match[] = {
+	{ .compatible = "mediatek,mt8183-cci" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mediatek_cci_of_match);
+
+static struct platform_driver cci_devfreq_driver = {
+	.probe	= mtk_cci_devfreq_probe,
+	.remove	= mtk_cci_devfreq_remove,
+	.driver = {
+		.name = "mediatek-cci-devfreq",
+		.of_match_table = of_match_ptr(mediatek_cci_of_match),
+	},
+};
+
+module_platform_driver(cci_devfreq_driver);
+
+MODULE_DESCRIPTION("Mediatek CCI devfreq driver");
+MODULE_AUTHOR("Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
