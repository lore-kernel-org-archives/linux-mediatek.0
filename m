Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0277C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/XYKCdoXeviLO0Rj7bxviYFFra6WVNN9WYJ3ZhhqYU=; b=QE91O9OP0WDSqm
	89TFExiJhaFDI6GijpRw4ajdM+1x1eUMSMrlOF3+ZQCLSIGs7CBbfCOSgPreV/lVh0KAUwE93AUyh
	XnIMJXChIqjrVVgWQv++HCG84dxmUA1UFWIxjj9kpt+2uVlsWMJcCxg+4dS/VGbGPN9wSS3X3p08g
	6gR/dP7aJrzdC9o5jK747j3K6Acp/eN56i+bN/8eToOJjRum4suFxSsLrMXj/IHNEYFUuy1AAXRh/
	kqaJGInv9EDZBhOjMFuRYKcg14Sk3+awAlMPVO+BqfpQK3zdzrQYXV/4BeKbe6ZA6jJC+L4YOyeIU
	AxBfDZKE5XF6bralMcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgvt-00F3QF-Hv; Fri, 08 Apr 2022 05:13:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs8-00F1BQ-0e; Fri, 08 Apr 2022 05:09:26 +0000
X-UUID: 8ab312971cf54807bfaa6cda75283698-20220407
X-UUID: 8ab312971cf54807bfaa6cda75283698-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 90495769; Thu, 07 Apr 2022 22:09:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 8 Apr 2022 12:59:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:11 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 03/15] cpufreq: mediatek: Cleanup variables and error
 handling in mtk_cpu_dvfs_info_init()
Date: Fri, 8 Apr 2022 12:58:56 +0800
Message-ID: <20220408045908.21671-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220924_103248_E47C21AF 
X-CRM114-Status: GOOD (  15.09  )
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

- Remove several unnecessary varaibles in mtk_cpu_dvfs_info_init().
- Unify error message format and use dev_err_probe() if possible.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 89 ++++++++++++------------------
 1 file changed, 34 insertions(+), 55 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 9d7d9c8dc184..e0545aca7e41 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -300,96 +300,75 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 {
 	struct device *cpu_dev;
-	struct regulator *proc_reg = ERR_PTR(-ENODEV);
-	struct regulator *sram_reg = ERR_PTR(-ENODEV);
-	struct clk *cpu_clk = ERR_PTR(-ENODEV);
-	struct clk *inter_clk = ERR_PTR(-ENODEV);
 	struct dev_pm_opp *opp;
 	unsigned long rate;
 	int ret;
 
 	cpu_dev = get_cpu_device(cpu);
 	if (!cpu_dev) {
-		pr_err("failed to get cpu%d device\n", cpu);
+		dev_err(cpu_dev, "failed to get cpu%d device\n", cpu);
 		return -ENODEV;
 	}
+	info->cpu_dev = cpu_dev;
 
-	cpu_clk = clk_get(cpu_dev, "cpu");
-	if (IS_ERR(cpu_clk)) {
-		if (PTR_ERR(cpu_clk) == -EPROBE_DEFER)
-			pr_warn("cpu clk for cpu%d not ready, retry.\n", cpu);
-		else
-			pr_err("failed to get cpu clk for cpu%d\n", cpu);
-
-		ret = PTR_ERR(cpu_clk);
-		return ret;
+	info->cpu_clk = clk_get(cpu_dev, "cpu");
+	if (IS_ERR(info->cpu_clk)) {
+		ret = PTR_ERR(info->cpu_clk);
+		return dev_err_probe(cpu_dev, ret,
+				     "cpu%d: failed to get cpu clk\n", cpu);
 	}
 
-	inter_clk = clk_get(cpu_dev, "intermediate");
-	if (IS_ERR(inter_clk)) {
-		if (PTR_ERR(inter_clk) == -EPROBE_DEFER)
-			pr_warn("intermediate clk for cpu%d not ready, retry.\n",
-				cpu);
-		else
-			pr_err("failed to get intermediate clk for cpu%d\n",
-			       cpu);
-
-		ret = PTR_ERR(inter_clk);
+	info->inter_clk = clk_get(cpu_dev, "intermediate");
+	if (IS_ERR(info->inter_clk)) {
+		ret = PTR_ERR(info->inter_clk);
+		dev_err_probe(cpu_dev, ret,
+			      "cpu%d: failed to get intermediate clk\n", cpu);
 		goto out_free_resources;
 	}
 
-	proc_reg = regulator_get_optional(cpu_dev, "proc");
-	if (IS_ERR(proc_reg)) {
-		if (PTR_ERR(proc_reg) == -EPROBE_DEFER)
-			pr_warn("proc regulator for cpu%d not ready, retry.\n",
-				cpu);
-		else
-			pr_err("failed to get proc regulator for cpu%d\n",
-			       cpu);
-
-		ret = PTR_ERR(proc_reg);
+	info->proc_reg = regulator_get_optional(cpu_dev, "proc");
+	if (IS_ERR(info->proc_reg)) {
+		ret = PTR_ERR(info->proc_reg);
+		dev_err_probe(cpu_dev, ret,
+			      "cpu%d: failed to get proc regulator\n", cpu);
 		goto out_free_resources;
 	}
 
 	/* Both presence and absence of sram regulator are valid cases. */
-	sram_reg = regulator_get_exclusive(cpu_dev, "sram");
+	info->sram_reg = regulator_get_exclusive(cpu_dev, "sram");
+	if (IS_ERR(info->sram_reg))
+		info->sram_reg = NULL;
 
 	/* Get OPP-sharing information from "operating-points-v2" bindings */
 	ret = dev_pm_opp_of_get_sharing_cpus(cpu_dev, &info->cpus);
 	if (ret) {
-		pr_err("failed to get OPP-sharing information for cpu%d\n",
-		       cpu);
+		dev_err(cpu_dev,
+			"cpu%d: failed to get OPP-sharing information\n", cpu);
 		goto out_free_resources;
 	}
 
 	ret = dev_pm_opp_of_cpumask_add_table(&info->cpus);
 	if (ret) {
-		pr_warn("no OPP table for cpu%d\n", cpu);
+		dev_warn(cpu_dev, "cpu%d: no OPP table\n", cpu);
 		goto out_free_resources;
 	}
 
 	/* Search a safe voltage for intermediate frequency. */
-	rate = clk_get_rate(inter_clk);
+	rate = clk_get_rate(info->inter_clk);
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
 	if (IS_ERR(opp)) {
-		pr_err("failed to get intermediate opp for cpu%d\n", cpu);
+		dev_err(cpu_dev, "cpu%d: failed to get intermediate opp\n", cpu);
 		ret = PTR_ERR(opp);
 		goto out_free_opp_table;
 	}
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
-	info->cpu_dev = cpu_dev;
-	info->proc_reg = proc_reg;
-	info->sram_reg = IS_ERR(sram_reg) ? NULL : sram_reg;
-	info->cpu_clk = cpu_clk;
-	info->inter_clk = inter_clk;
-
 	/*
 	 * If SRAM regulator is present, software "voltage tracking" is needed
 	 * for this CPU power domain.
 	 */
-	info->need_voltage_tracking = !IS_ERR(sram_reg);
+	info->need_voltage_tracking = (info->sram_reg != NULL);
 
 	return 0;
 
@@ -397,14 +376,14 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
 out_free_resources:
-	if (!IS_ERR(proc_reg))
-		regulator_put(proc_reg);
-	if (!IS_ERR(sram_reg))
-		regulator_put(sram_reg);
-	if (!IS_ERR(cpu_clk))
-		clk_put(cpu_clk);
-	if (!IS_ERR(inter_clk))
-		clk_put(inter_clk);
+	if (!IS_ERR(info->proc_reg))
+		regulator_put(info->proc_reg);
+	if (!IS_ERR(info->sram_reg))
+		regulator_put(info->sram_reg);
+	if (!IS_ERR(info->cpu_clk))
+		clk_put(info->cpu_clk);
+	if (!IS_ERR(info->inter_clk))
+		clk_put(info->inter_clk);
 
 	return ret;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
