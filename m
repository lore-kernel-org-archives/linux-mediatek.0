Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB02C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4eCt1fJx49RrJ8okxF94bNoypf3Q+NvR/+ekxd39pM=; b=fJ8JTXLQHuluLn
	WBh4XHmp450/HPx+8IW+OMdjnbQYGILiInDpAOrnBQI0dfHfV22HxtZ1SfKdpYFMispwpUatZeX7r
	OxFtPc+P1zCK5SKoBNm9p8Dt12fblV+3y4kn3msZ527yWvYzioe5AZMxs23+6OBF6uKYwetU2Stj4
	gIcT84ouTBaO1KskWDI02xKpEU68/Rd/oj+w9rPbo7cr3BhlD6nlC0IzpOUT3yfOgVf4q7gF+6MIk
	cm6qzYiHk6OeI9HuO3ZtjcbtoD7RXUzrigi18wMGfsuNhm6RuOzxVXbfYVdySZ+CdJGqtDXVR2P4q
	VAJDfnjjjBTxfcYxj79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfF23-008pdO-C3; Fri, 15 Apr 2022 06:02:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEzR-008nsp-S2; Fri, 15 Apr 2022 05:59:32 +0000
X-UUID: 33822f7d7dd24caab553adbbd8382cb7-20220414
X-UUID: 33822f7d7dd24caab553adbbd8382cb7-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 663965082; Thu, 14 Apr 2022 22:59:21 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 22:59:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 15 Apr 2022 13:59:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 13:59:18 +0800
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
Subject: [PATCH V3 02/15] cpufreq: mediatek: Use device print to show logs
Date: Fri, 15 Apr 2022 13:59:03 +0800
Message-ID: <20220415055916.28350-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_225929_957154_1BF55837 
X-CRM114-Status: GOOD (  12.14  )
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

- Replace pr_* with dev_* to show logs.
- Remove usage of __func__.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 54 ++++++++++++++++--------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index dc4a87e68940..e040f3574af9 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -65,7 +65,8 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 
 	old_vproc = regulator_get_voltage(proc_reg);
 	if (old_vproc < 0) {
-		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
+		dev_err(info->cpu_dev,
+			"invalid Vproc value: %d\n", old_vproc);
 		return old_vproc;
 	}
 	/* Vsram should not exceed the maximum allowed voltage of SoC. */
@@ -81,14 +82,14 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 		do {
 			old_vsram = regulator_get_voltage(sram_reg);
 			if (old_vsram < 0) {
-				pr_err("%s: invalid Vsram value: %d\n",
-				       __func__, old_vsram);
+				dev_err(info->cpu_dev,
+					"invalid Vsram value: %d\n", old_vsram);
 				return old_vsram;
 			}
 			old_vproc = regulator_get_voltage(proc_reg);
 			if (old_vproc < 0) {
-				pr_err("%s: invalid Vproc value: %d\n",
-				       __func__, old_vproc);
+				dev_err(info->cpu_dev,
+					"invalid Vproc value: %d\n", old_vproc);
 				return old_vproc;
 			}
 
@@ -136,14 +137,14 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 		do {
 			old_vproc = regulator_get_voltage(proc_reg);
 			if (old_vproc < 0) {
-				pr_err("%s: invalid Vproc value: %d\n",
-				       __func__, old_vproc);
+				dev_err(info->cpu_dev,
+					"invalid Vproc value: %d\n", old_vproc);
 				return old_vproc;
 			}
 			old_vsram = regulator_get_voltage(sram_reg);
 			if (old_vsram < 0) {
-				pr_err("%s: invalid Vsram value: %d\n",
-				       __func__, old_vsram);
+				dev_err(info->cpu_dev,
+					"invalid Vsram value: %d\n", old_vsram);
 				return old_vsram;
 			}
 
@@ -214,7 +215,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	old_freq_hz = clk_get_rate(cpu_clk);
 	old_vproc = regulator_get_voltage(info->proc_reg);
 	if (old_vproc < 0) {
-		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
+		dev_err(cpu_dev, "invalid Vproc value: %d\n", old_vproc);
 		return old_vproc;
 	}
 
@@ -222,8 +223,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &freq_hz);
 	if (IS_ERR(opp)) {
-		pr_err("cpu%d: failed to find OPP for %ld\n",
-		       policy->cpu, freq_hz);
+		dev_err(cpu_dev, "cpu%d: failed to find OPP for %ld\n",
+			policy->cpu, freq_hz);
 		return PTR_ERR(opp);
 	}
 	vproc = dev_pm_opp_get_voltage(opp);
@@ -237,8 +238,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	if (old_vproc < target_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, target_vproc);
 		if (ret) {
-			pr_err("cpu%d: failed to scale up voltage!\n",
-			       policy->cpu);
+			dev_err(cpu_dev,
+				"cpu%d: failed to scale up voltage!\n", policy->cpu);
 			mtk_cpufreq_set_voltage(info, old_vproc);
 			return ret;
 		}
@@ -247,8 +248,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	/* Reparent the CPU clock to intermediate clock. */
 	ret = clk_set_parent(cpu_clk, info->inter_clk);
 	if (ret) {
-		pr_err("cpu%d: failed to re-parent cpu clock!\n",
-		       policy->cpu);
+		dev_err(cpu_dev,
+			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
 		mtk_cpufreq_set_voltage(info, old_vproc);
 		WARN_ON(1);
 		return ret;
@@ -257,8 +258,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	/* Set the original PLL to target rate. */
 	ret = clk_set_rate(armpll, freq_hz);
 	if (ret) {
-		pr_err("cpu%d: failed to scale cpu clock rate!\n",
-		       policy->cpu);
+		dev_err(cpu_dev,
+			"cpu%d: failed to scale cpu clock rate!\n", policy->cpu);
 		clk_set_parent(cpu_clk, armpll);
 		mtk_cpufreq_set_voltage(info, old_vproc);
 		return ret;
@@ -267,8 +268,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	/* Set parent of CPU clock back to the original PLL. */
 	ret = clk_set_parent(cpu_clk, armpll);
 	if (ret) {
-		pr_err("cpu%d: failed to re-parent cpu clock!\n",
-		       policy->cpu);
+		dev_err(cpu_dev,
+			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
 		mtk_cpufreq_set_voltage(info, inter_vproc);
 		WARN_ON(1);
 		return ret;
@@ -281,8 +282,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	if (vproc < inter_vproc || vproc < old_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, vproc);
 		if (ret) {
-			pr_err("cpu%d: failed to scale down voltage!\n",
-			       policy->cpu);
+			dev_err(cpu_dev,
+				"cpu%d: failed to scale down voltage!\n", policy->cpu);
 			clk_set_parent(cpu_clk, info->inter_clk);
 			clk_set_rate(armpll, old_freq_hz);
 			clk_set_parent(cpu_clk, armpll);
@@ -448,15 +449,16 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 
 	info = mtk_cpu_dvfs_info_lookup(policy->cpu);
 	if (!info) {
-		pr_err("dvfs info for cpu%d is not initialized.\n",
-		       policy->cpu);
+		dev_err(info->cpu_dev,
+			"dvfs info for cpu%d is not initialized.\n", policy->cpu);
 		return -EINVAL;
 	}
 
 	ret = dev_pm_opp_init_cpufreq_table(info->cpu_dev, &freq_table);
 	if (ret) {
-		pr_err("failed to init cpufreq table for cpu%d: %d\n",
-		       policy->cpu, ret);
+		dev_err(info->cpu_dev,
+			"failed to init cpufreq table for cpu%d: %d\n",
+			policy->cpu, ret);
 		return ret;
 	}
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
