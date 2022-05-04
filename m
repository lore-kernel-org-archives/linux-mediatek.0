Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64322C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2aaQBj/HsGzoovOG9lVK9Gk8naoYeOgtAvbk2jFm6g=; b=3+A05fkoO68fyR
	ED7JGnJl8zNwlBO6LSH68AyIOhAxWOkh2AeiLmkBxS4Q3Gr2gKOGawZLV6HN5f0c9GN3fKfUZpl6l
	tA0T0iuErFv8qRltnzq8d4UtN74uFJXe7RaEOzV/lwHRcZd/ErSmLOhFVFadY/EcXA/Xh8WjQ6l0R
	WtUmAhTqVKTlW0FgOBTBv0ljOy2v9Vi14nMA21slDIx97RY/cBKD0LvRp23KEOXFJf6kI4TlQozAw
	p0jnw/LGWiowpOrE34GlPARVMrKKebAtFbDtXsFPpBc/teFvBFrbEa1QmkDAmwLHjgjfuhlOLZt8v
	wPy4XcyMw+/lTq2e8MQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEjN-00AvUk-QB; Wed, 04 May 2022 13:07:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEhT-00AuAN-Tf; Wed, 04 May 2022 13:05:53 +0000
X-UUID: 1f64ea0091794186a7f205fec46c299d-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:afa02109-68eb-433b-8933-6b303a4e151e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:70b32c16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1f64ea0091794186a7f205fec46c299d-20220504
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 451153739; Wed, 04 May 2022 06:05:44 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 06:05:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 21:05:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 4 May 2022 21:05:41 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v5 5/9] cpufreq: mediatek: Link CCI device to CPU
Date: Wed, 4 May 2022 21:05:36 +0800
Message-ID: <20220504130540.5902-6-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_060552_019283_DBDDA8C2 
X-CRM114-Status: GOOD (  24.19  )
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

In some MediaTek SoCs, like MT8183, CPU and CCI share the same power
supplies. Cpufreq needs to check if CCI devfreq exists and wait until
CCI devfreq ready before scaling frequency.

Before CCI devfreq is ready, we record the voltage when booting to
kernel and use the max(cpu target voltage, booting voltage) to
prevent cpufreq adjust to the lower voltage which will cause the CCI
crash because of high frequency and low voltage.

- Add is_ccifreq_ready() to link CCI device to CPI, and CPU will start
  DVFS when CCI is ready.
- Add platform data for MT8183.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 82 +++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index c9f09ddd4428..1a4c95e06b0e 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -22,6 +22,7 @@ struct mtk_cpufreq_platform_data {
 	int proc_max_volt;
 	int sram_min_volt;
 	int sram_max_volt;
+	bool ccifreq_supported;
 };
 
 /*
@@ -38,6 +39,7 @@ struct mtk_cpufreq_platform_data {
 struct mtk_cpu_dvfs_info {
 	struct cpumask cpus;
 	struct device *cpu_dev;
+	struct device *cci_dev;
 	struct regulator *proc_reg;
 	struct regulator *sram_reg;
 	struct clk *cpu_clk;
@@ -45,6 +47,7 @@ struct mtk_cpu_dvfs_info {
 	struct list_head list_head;
 	int intermediate_voltage;
 	bool need_voltage_tracking;
+	int vproc_on_boot;
 	int pre_vproc;
 	/* Avoid race condition for regulators between notify and policy */
 	struct mutex reg_lock;
@@ -53,6 +56,7 @@ struct mtk_cpu_dvfs_info {
 	unsigned long opp_freq;
 	const struct mtk_cpufreq_platform_data *soc_data;
 	int vtrack_max;
+	bool ccifreq_bound;
 };
 
 static struct platform_device *cpufreq_pdev;
@@ -171,6 +175,28 @@ static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
 	return ret;
 }
 
+static bool is_ccifreq_ready(struct mtk_cpu_dvfs_info *info)
+{
+	struct device_link *sup_link;
+
+	if (info->ccifreq_bound)
+		return true;
+
+	sup_link = device_link_add(info->cpu_dev, info->cci_dev,
+				   DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!sup_link) {
+		dev_err(info->cpu_dev, "cpu%d: sup_link is NULL\n", info->opp_cpu);
+		return false;
+	}
+
+	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
+		return false;
+
+	info->ccifreq_bound = true;
+
+	return true;
+}
+
 static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 				  unsigned int index)
 {
@@ -210,6 +236,14 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	vproc = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
+	/*
+	 * If MediaTek cci is supported but is not ready, we will use the value
+	 * of max(target cpu voltage, booting voltage) to prevent high freqeuncy
+	 * low voltage crash.
+	 */
+	if (info->soc_data->ccifreq_supported && !is_ccifreq_ready(info))
+		vproc = max(vproc, info->vproc_on_boot);
+
 	/*
 	 * If the new voltage or the intermediate voltage is higher than the
 	 * current voltage, scale up voltage first.
@@ -331,6 +365,23 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
 	return notifier_from_errno(ret);
 }
 
+static struct device *of_get_cci(struct device *cpu_dev)
+{
+	struct device_node *np;
+	struct platform_device *pdev;
+
+	np = of_parse_phandle(cpu_dev->of_node, "mediatek,cci", 0);
+	if (IS_ERR_OR_NULL(np))
+		return NULL;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (IS_ERR_OR_NULL(pdev))
+		return NULL;
+
+	return &pdev->dev;
+}
+
 static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 {
 	struct device *cpu_dev;
@@ -345,6 +396,16 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	}
 	info->cpu_dev = cpu_dev;
 
+	info->ccifreq_bound = false;
+	if (info->soc_data->ccifreq_supported) {
+		info->cci_dev = of_get_cci(info->cpu_dev);
+		if (IS_ERR_OR_NULL(info->cci_dev)) {
+			ret = PTR_ERR(info->cci_dev);
+			dev_err(cpu_dev, "cpu%d: failed to get cci device\n", cpu);
+			return -ENODEV;
+		}
+	}
+
 	info->cpu_clk = clk_get(cpu_dev, "cpu");
 	if (IS_ERR(info->cpu_clk)) {
 		ret = PTR_ERR(info->cpu_clk);
@@ -408,6 +469,15 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	if (ret)
 		goto out_disable_mux_clock;
 
+	if (info->soc_data->ccifreq_supported) {
+		info->vproc_on_boot = regulator_get_voltage(info->proc_reg);
+		if (info->vproc_on_boot < 0) {
+			dev_err(info->cpu_dev,
+				"invalid Vproc value: %d\n", info->vproc_on_boot);
+			goto out_disable_inter_clock;
+		}
+	}
+
 	/* Search a safe voltage for intermediate frequency. */
 	rate = clk_get_rate(info->inter_clk);
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
@@ -617,6 +687,16 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
 	.proc_max_volt = 1150000,
 	.sram_min_volt = 0,
 	.sram_max_volt = 1150000,
+	.ccifreq_supported = false,
+};
+
+static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1150000,
+	.sram_min_volt = 0,
+	.sram_max_volt = 1150000,
+	.ccifreq_supported = true,
 };
 
 /* List of machines supported by this driver */
@@ -629,7 +709,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8176", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt8183", .data = &mt2701_platform_data },
+	{ .compatible = "mediatek,mt8183", .data = &mt8183_platform_data },
 	{ .compatible = "mediatek,mt8365", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8516", .data = &mt2701_platform_data },
 	{ }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
