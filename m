Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcODu+cHsHb+Ff5wKMJl7J+qcjwNgovIXRJvT/riIT0=; b=1BnYGyZ3E1xU+J
	lLVtfev9bNBR9NQKfXPMWjp0TF9QGdRTJp5bpFfnDby6fotpxMS9N7Lm9rdFTFoqoCmsGTTBjERrj
	GeteMhKg8S567iLKVjU3nAeNzy6SGQEGmiyaWThjy3yANtvk0MA4Fo2DlKQ6uckmVI/yy4+6PcaVb
	G3AyL9VenmLMIKCj8CJJ/yQZXcVMPLXB76sT4hoWeIRvvp6H6iK456cbNG80GMZyRoFezwFGtOXEh
	fM3yVtHWpbmXO9/rK00fdFHppd3CrU4stAQpSfv/p2hueO6hqSK25be5m/UDHAv770S/44XHY3doB
	Y2RwVIDQSqtRKILNtkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgtD-00F1lN-Qc; Fri, 08 Apr 2022 05:10:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs4-00F1Bt-FG; Fri, 08 Apr 2022 05:09:22 +0000
X-UUID: ac0eb0591b0e466090b18b1f0ed729fe-20220407
X-UUID: ac0eb0591b0e466090b18b1f0ed729fe-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1023126638; Thu, 07 Apr 2022 22:09:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
Date: Fri, 8 Apr 2022 12:59:06 +0800
Message-ID: <20220408045908.21671-14-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220920_526937_CD6CFA0C 
X-CRM114-Status: GOOD (  17.30  )
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

In some MediaTek SoCs, like MT8183, CPU and CCI share the same power
supplies. Cpufreq needs to check if CCI devfreq exists and wait until
CCI devfreq ready before scaling frequency.

- Add is_ccifreq_ready() to link CCI device to CPI, and CPU will start
  DVFS when CCI is ready.
- Add platform data for MT8183.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 69 +++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index b08ab7c14818..cebe5af2ef5d 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -22,6 +22,7 @@ struct mtk_cpufreq_platform_data {
 	int proc_max_volt;
 	int sram_min_volt;
 	int sram_max_volt;
+	bool is_ccifreq_support;
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
@@ -52,6 +54,7 @@ struct mtk_cpu_dvfs_info {
 	int opp_cpu;
 	unsigned long opp_freq;
 	const struct mtk_cpufreq_platform_data *soc_data;
+	bool is_ccifreq_bounded;
 };
 
 static struct platform_device *cpufreq_pdev;
@@ -171,6 +174,29 @@ static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
 	return ret;
 }
 
+static bool is_ccifreq_ready(struct mtk_cpu_dvfs_info *info)
+{
+	struct device_link *sup_link;
+
+	if (info->is_ccifreq_bounded)
+		return true;
+
+	sup_link = device_link_add(info->cpu_dev, info->cci_dev,
+				   DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!sup_link) {
+		dev_err(info->cpu_dev, "cpu%d: sup_link is NULL\n",
+			info->opp_cpu);
+		return false;
+	}
+
+	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
+		return false;
+
+	info->is_ccifreq_bounded = true;
+
+	return true;
+}
+
 static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 				  unsigned int index)
 {
@@ -183,6 +209,9 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	long freq_hz, old_freq_hz;
 	int vproc, old_vproc, inter_vproc, target_vproc, ret;
 
+	if (info->soc_data->is_ccifreq_support && !is_ccifreq_ready(info))
+		return 0;
+
 	inter_vproc = info->intermediate_voltage;
 
 	freq_hz = freq_table[index].frequency * 1000;
@@ -329,6 +358,23 @@ static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
 	return notifier_from_errno(ret);
 }
 
+static struct device *of_get_cci(struct device *cpu_dev)
+{
+	struct device_node *np;
+	struct platform_device *pdev;
+
+	np = of_parse_phandle(cpu_dev->of_node, "cci", 0);
+	if (IS_ERR(np))
+		return NULL;
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (IS_ERR(pdev))
+		return NULL;
+
+	return &pdev->dev;
+}
+
 static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 {
 	struct device *cpu_dev;
@@ -343,6 +389,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	}
 	info->cpu_dev = cpu_dev;
 
+	info->is_ccifreq_bounded = false;
+	if (info->soc_data->is_ccifreq_support) {
+		info->cci_dev = of_get_cci(info->cpu_dev);
+		if (IS_ERR_OR_NULL(info->cci_dev)) {
+			ret = PTR_ERR(info->cci_dev);
+			dev_err(cpu_dev, "cpu%d: failed to get cci device\n",
+				cpu);
+			return -ENODEV;
+		}
+	}
+
 	info->cpu_clk = clk_get(cpu_dev, "cpu");
 	if (IS_ERR(info->cpu_clk)) {
 		ret = PTR_ERR(info->cpu_clk);
@@ -620,6 +677,16 @@ static const struct mtk_cpufreq_platform_data mtk_platform_data = {
 	.proc_max_volt = 1150000,
 	.sram_min_volt = 0,
 	.sram_max_volt = 1150000,
+	.is_ccifreq_support = false,
+};
+
+static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1150000,
+	.sram_min_volt = 0,
+	.sram_max_volt = 1150000,
+	.is_ccifreq_support = true,
 };
 
 /* List of machines supported by this driver */
@@ -632,7 +699,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt817x", .data = &mtk_platform_data },
 	{ .compatible = "mediatek,mt8173", .data = &mtk_platform_data },
 	{ .compatible = "mediatek,mt8176", .data = &mtk_platform_data },
-	{ .compatible = "mediatek,mt8183", .data = &mtk_platform_data },
+	{ .compatible = "mediatek,mt8183", .data = &mt8183_platform_data },
 	{ .compatible = "mediatek,mt8365", .data = &mtk_platform_data },
 	{ .compatible = "mediatek,mt8516", .data = &mtk_platform_data },
 	{ }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
