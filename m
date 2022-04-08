Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCA1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sE5ggvyIYT/3VEA9heRb6iv7cLGum1c3MMYpMiErlVc=; b=oUaZLXQxYYgSLp
	Dhj4P4uBKLIDbNZAlDWdU+ulTBo5cYXqt7Um4aojwUWyIUPzf31IuobaY7bq9fMF8DxDeqnHdaCtk
	o1UBiWBWUbsB8hiDQPV0TqlwwnFOQupbbsnVN9eUCMiAm02kHws6I0O1r7v0vC5Vp+XuBSP2RfhT2
	4y5QcEcIX+40pmaW43pxlORS/d+z6lGntH1finyoOewge9NtArnpZ/bRjN/RS4EdpoEnA+XI0h6u2
	rumNCObYzEiQBW1FWg3yrzCnnU17F+bgbgKLxi17QTFXW+1EYSysc/KRyhwKYKnvQfXyLdNe6ITx9
	FkxaJyS7U0njOHcrkTnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncguY-00F2c7-Dr; Fri, 08 Apr 2022 05:11:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs6-00F1Bt-QW; Fri, 08 Apr 2022 05:09:24 +0000
X-UUID: c15b72d28cd84998baef742c71772bcc-20220407
X-UUID: c15b72d28cd84998baef742c71772bcc-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1785457144; Thu, 07 Apr 2022 22:09:15 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 12:59:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:12 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 08/15] cpufreq: mediatek: Move voltage limits to platform
 data
Date: Fri, 8 Apr 2022 12:59:01 +0800
Message-ID: <20220408045908.21671-9-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220922_903236_7723DA24 
X-CRM114-Status: GOOD (  21.25  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

Voltages and shifts are defined as macros originally.
There are different requirements of these values for each MediaTek SoCs.
Therefore, we add the platform data and move these values into it.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 90 ++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 29 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 1369da62780a..0be5609ee82e 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -10,15 +10,21 @@
 #include <linux/cpumask.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
 
-#define MIN_VOLT_SHIFT		(100000)
-#define MAX_VOLT_SHIFT		(200000)
-#define MAX_VOLT_LIMIT		(1150000)
 #define VOLT_TOL		(10000)
 
+struct mtk_cpufreq_platform_data {
+	int min_volt_shift;
+	int max_volt_shift;
+	int proc_max_volt;
+	int sram_min_volt;
+	int sram_max_volt;
+};
+
 /*
  * The struct mtk_cpu_dvfs_info holds necessary information for doing CPU DVFS
  * on each CPU power/clock domain of Mediatek SoCs. Each CPU cluster in
@@ -46,8 +52,11 @@ struct mtk_cpu_dvfs_info {
 	struct notifier_block opp_nb;
 	int opp_cpu;
 	unsigned long opp_freq;
+	const struct mtk_cpufreq_platform_data *soc_data;
 };
 
+static struct platform_device *cpufreq_pdev;
+
 static LIST_HEAD(dvfs_info_list);
 
 static struct mtk_cpu_dvfs_info *mtk_cpu_dvfs_info_lookup(int cpu)
@@ -65,6 +74,7 @@ static struct mtk_cpu_dvfs_info *mtk_cpu_dvfs_info_lookup(int cpu)
 static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 					int new_vproc)
 {
+	const struct mtk_cpufreq_platform_data *soc_data = info->soc_data;
 	struct regulator *proc_reg = info->proc_reg;
 	struct regulator *sram_reg = info->sram_reg;
 	int old_vproc, old_vsram, new_vsram, vsram, vproc, ret;
@@ -75,7 +85,8 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 		return old_vproc;
 	}
 	/* Vsram should not exceed the maximum allowed voltage of SoC. */
-	new_vsram = min(new_vproc + MIN_VOLT_SHIFT, MAX_VOLT_LIMIT);
+	new_vsram = min(new_vproc + soc_data->min_volt_shift,
+			soc_data->sram_max_volt);
 
 	if (old_vproc < new_vproc) {
 		/*
@@ -98,10 +109,11 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 				return old_vproc;
 			}
 
-			vsram = min(new_vsram, old_vproc + MAX_VOLT_SHIFT);
+			vsram = min(new_vsram,
+				    old_vproc + soc_data->min_volt_shift);
 
-			if (vsram + VOLT_TOL >= MAX_VOLT_LIMIT) {
-				vsram = MAX_VOLT_LIMIT;
+			if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
+				vsram = soc_data->sram_max_volt;
 
 				/*
 				 * If the target Vsram hits the maximum voltage,
@@ -119,7 +131,7 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 				ret = regulator_set_voltage(sram_reg, vsram,
 							    vsram + VOLT_TOL);
 
-				vproc = vsram - MIN_VOLT_SHIFT;
+				vproc = vsram - soc_data->min_volt_shift;
 			}
 			if (ret)
 				return ret;
@@ -153,7 +165,8 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 				return old_vsram;
 			}
 
-			vproc = max(new_vproc, old_vsram - MAX_VOLT_SHIFT);
+			vproc = max(new_vproc,
+				    old_vsram - soc_data->max_volt_shift);
 			ret = regulator_set_voltage(proc_reg, vproc,
 						    vproc + VOLT_TOL);
 			if (ret)
@@ -162,10 +175,11 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 			if (vproc == new_vproc)
 				vsram = new_vsram;
 			else
-				vsram = max(new_vsram, vproc + MIN_VOLT_SHIFT);
+				vsram = max(new_vsram,
+					    vproc + soc_data->min_volt_shift);
 
-			if (vsram + VOLT_TOL >= MAX_VOLT_LIMIT) {
-				vsram = MAX_VOLT_LIMIT;
+			if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
+				vsram = soc_data->sram_max_volt;
 
 				/*
 				 * If the target Vsram hits the maximum voltage,
@@ -196,13 +210,14 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 
 static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
 {
+	const struct mtk_cpufreq_platform_data *soc_data = info->soc_data;
 	int ret;
 
 	if (info->need_voltage_tracking)
 		ret = mtk_cpufreq_voltage_tracking(info, vproc);
 	else
 		ret = regulator_set_voltage(info->proc_reg, vproc,
-					    MAX_VOLT_LIMIT);
+					    soc_data->proc_max_volt);
 	if (!ret)
 		info->old_vproc = vproc;
 
@@ -576,9 +591,17 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 
 static int mtk_cpufreq_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
 	struct mtk_cpu_dvfs_info *info, *tmp;
 	int cpu, ret;
 
+	match = dev_get_platdata(&pdev->dev);
+	if (!match || !match->data) {
+		dev_err(&pdev->dev,
+			"failed to get mtk cpufreq platform data\n");
+		return -ENODEV;
+	}
+
 	for_each_possible_cpu(cpu) {
 		info = mtk_cpu_dvfs_info_lookup(cpu);
 		if (info)
@@ -590,6 +613,7 @@ static int mtk_cpufreq_probe(struct platform_device *pdev)
 			goto release_dvfs_info_list;
 		}
 
+		info->soc_data = match->data;
 		ret = mtk_cpu_dvfs_info_init(info, cpu);
 		if (ret) {
 			dev_err(&pdev->dev,
@@ -625,20 +649,27 @@ static struct platform_driver mtk_cpufreq_platdrv = {
 	.probe		= mtk_cpufreq_probe,
 };
 
+static const struct mtk_cpufreq_platform_data mtk_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1150000,
+	.sram_min_volt = 0,
+	.sram_max_volt = 1150000,
+};
+
 /* List of machines supported by this driver */
 static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
-	{ .compatible = "mediatek,mt2701", },
-	{ .compatible = "mediatek,mt2712", },
-	{ .compatible = "mediatek,mt7622", },
-	{ .compatible = "mediatek,mt7623", },
-	{ .compatible = "mediatek,mt8167", },
-	{ .compatible = "mediatek,mt817x", },
-	{ .compatible = "mediatek,mt8173", },
-	{ .compatible = "mediatek,mt8176", },
-	{ .compatible = "mediatek,mt8183", },
-	{ .compatible = "mediatek,mt8365", },
-	{ .compatible = "mediatek,mt8516", },
-
+	{ .compatible = "mediatek,mt2701", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt2712", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt7622", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt7623", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8167", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt817x", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8173", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8176", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8183", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8365", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8516", .data = &mtk_platform_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);
@@ -647,7 +678,6 @@ static int __init mtk_cpufreq_driver_init(void)
 {
 	struct device_node *np;
 	const struct of_device_id *match;
-	struct platform_device *pdev;
 	int err;
 
 	np = of_find_node_by_path("/");
@@ -671,11 +701,12 @@ static int __init mtk_cpufreq_driver_init(void)
 	 * and the device registration codes are put here to handle defer
 	 * probing.
 	 */
-	pdev = platform_device_register_simple("mtk-cpufreq", -1, NULL, 0);
-	if (IS_ERR(pdev)) {
+	cpufreq_pdev = platform_device_register_data(NULL, "mtk-cpufreq", -1,
+						     match, sizeof(*match));
+	if (IS_ERR(cpufreq_pdev)) {
 		pr_err("failed to register mtk-cpufreq platform device\n");
 		platform_driver_unregister(&mtk_cpufreq_platdrv);
-		return PTR_ERR(pdev);
+		return PTR_ERR(cpufreq_pdev);
 	}
 
 	return 0;
@@ -684,6 +715,7 @@ module_init(mtk_cpufreq_driver_init)
 
 static void __exit mtk_cpufreq_driver_exit(void)
 {
+	platform_device_unregister(cpufreq_pdev);
 	platform_driver_unregister(&mtk_cpufreq_platdrv);
 }
 module_exit(mtk_cpufreq_driver_exit)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
