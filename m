Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FBAC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98FetI8lecQ4QxFR+4cFmSGANon+xMMzPnXD3ccvtcE=; b=R8hrIITM1O77av
	WM+HeMk9RNSo2a9vP6TKcDD07D62L8rXnO2p33Qn4C+pQLzJN48rq4LK0AO2vVG++Y+pZFWQebs5K
	/woul/2uvVnfpPt1rX7TUcDTrQKj28IaB4Y3hDew/Gso9bkWeu8fZLXzH8xZxFmty13bFtDDdvoyY
	MhdpDkdfEb/CUGatZeLc9Kpch9mlnJMKGPNFvMgg8Hf31/XF/ZJYhCM46RVuffqyck4grfA0b7is2
	F3noPORau5IixPrvoDeytTbN0388yfL9a2Y8B5GVMiljNufnlmbHWOu55xm83QwgAOAhAEdJl4alg
	f0f6Bni7qFRK9LAvpx3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFPO-008yds-Jv; Fri, 15 Apr 2022 06:26:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfF97-008tIx-CK; Fri, 15 Apr 2022 06:09:32 +0000
X-UUID: ab2fd4fb1c3b4b7cad2600de731a1d6a-20220414
X-UUID: ab2fd4fb1c3b4b7cad2600de731a1d6a-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1755753983; Thu, 14 Apr 2022 23:09:23 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 22:59:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
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
Subject: [PATCH V3 03/15] cpufreq: mediatek: Replace old_* with pre_*
Date: Fri, 15 Apr 2022 13:59:04 +0800
Message-ID: <20220415055916.28350-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_230929_494246_CCFD4457 
X-CRM114-Status: GOOD (  14.62  )
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

To make driver more readable, replace old_* with pre_*.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 84 +++++++++++++++---------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index e040f3574af9..ff27f77e8ee6 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -61,18 +61,18 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 {
 	struct regulator *proc_reg = info->proc_reg;
 	struct regulator *sram_reg = info->sram_reg;
-	int old_vproc, old_vsram, new_vsram, vsram, vproc, ret;
+	int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
 
-	old_vproc = regulator_get_voltage(proc_reg);
-	if (old_vproc < 0) {
+	pre_vproc = regulator_get_voltage(proc_reg);
+	if (pre_vproc < 0) {
 		dev_err(info->cpu_dev,
-			"invalid Vproc value: %d\n", old_vproc);
-		return old_vproc;
+			"invalid Vproc value: %d\n", pre_vproc);
+		return pre_vproc;
 	}
 	/* Vsram should not exceed the maximum allowed voltage of SoC. */
 	new_vsram = min(new_vproc + MIN_VOLT_SHIFT, MAX_VOLT_LIMIT);
 
-	if (old_vproc < new_vproc) {
+	if (pre_vproc < new_vproc) {
 		/*
 		 * When scaling up voltages, Vsram and Vproc scale up step
 		 * by step. At each step, set Vsram to (Vproc + 200mV) first,
@@ -80,20 +80,20 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 		 * Keep doing it until Vsram and Vproc hit target voltages.
 		 */
 		do {
-			old_vsram = regulator_get_voltage(sram_reg);
-			if (old_vsram < 0) {
+			pre_vsram = regulator_get_voltage(sram_reg);
+			if (pre_vsram < 0) {
 				dev_err(info->cpu_dev,
-					"invalid Vsram value: %d\n", old_vsram);
-				return old_vsram;
+					"invalid Vsram value: %d\n", pre_vsram);
+				return pre_vsram;
 			}
-			old_vproc = regulator_get_voltage(proc_reg);
-			if (old_vproc < 0) {
+			pre_vproc = regulator_get_voltage(proc_reg);
+			if (pre_vproc < 0) {
 				dev_err(info->cpu_dev,
-					"invalid Vproc value: %d\n", old_vproc);
-				return old_vproc;
+					"invalid Vproc value: %d\n", pre_vproc);
+				return pre_vproc;
 			}
 
-			vsram = min(new_vsram, old_vproc + MAX_VOLT_SHIFT);
+			vsram = min(new_vsram, pre_vproc + MAX_VOLT_SHIFT);
 
 			if (vsram + VOLT_TOL >= MAX_VOLT_LIMIT) {
 				vsram = MAX_VOLT_LIMIT;
@@ -122,12 +122,12 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 			ret = regulator_set_voltage(proc_reg, vproc,
 						    vproc + VOLT_TOL);
 			if (ret) {
-				regulator_set_voltage(sram_reg, old_vsram,
-						      old_vsram);
+				regulator_set_voltage(sram_reg, pre_vsram,
+						      pre_vsram);
 				return ret;
 			}
 		} while (vproc < new_vproc || vsram < new_vsram);
-	} else if (old_vproc > new_vproc) {
+	} else if (pre_vproc > new_vproc) {
 		/*
 		 * When scaling down voltages, Vsram and Vproc scale down step
 		 * by step. At each step, set Vproc to (Vsram - 200mV) first,
@@ -135,20 +135,20 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 		 * Keep doing it until Vsram and Vproc hit target voltages.
 		 */
 		do {
-			old_vproc = regulator_get_voltage(proc_reg);
-			if (old_vproc < 0) {
+			pre_vproc = regulator_get_voltage(proc_reg);
+			if (pre_vproc < 0) {
 				dev_err(info->cpu_dev,
-					"invalid Vproc value: %d\n", old_vproc);
-				return old_vproc;
+					"invalid Vproc value: %d\n", pre_vproc);
+				return pre_vproc;
 			}
-			old_vsram = regulator_get_voltage(sram_reg);
-			if (old_vsram < 0) {
+			pre_vsram = regulator_get_voltage(sram_reg);
+			if (pre_vsram < 0) {
 				dev_err(info->cpu_dev,
-					"invalid Vsram value: %d\n", old_vsram);
-				return old_vsram;
+					"invalid Vsram value: %d\n", pre_vsram);
+				return pre_vsram;
 			}
 
-			vproc = max(new_vproc, old_vsram - MAX_VOLT_SHIFT);
+			vproc = max(new_vproc, pre_vsram - MAX_VOLT_SHIFT);
 			ret = regulator_set_voltage(proc_reg, vproc,
 						    vproc + VOLT_TOL);
 			if (ret)
@@ -178,8 +178,8 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 			}
 
 			if (ret) {
-				regulator_set_voltage(proc_reg, old_vproc,
-						      old_vproc);
+				regulator_set_voltage(proc_reg, pre_vproc,
+						      pre_vproc);
 				return ret;
 			}
 		} while (vproc > new_vproc + VOLT_TOL ||
@@ -207,16 +207,16 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	struct mtk_cpu_dvfs_info *info = policy->driver_data;
 	struct device *cpu_dev = info->cpu_dev;
 	struct dev_pm_opp *opp;
-	long freq_hz, old_freq_hz;
-	int vproc, old_vproc, inter_vproc, target_vproc, ret;
+	long freq_hz, pre_freq_hz;
+	int vproc, pre_vproc, inter_vproc, target_vproc, ret;
 
 	inter_vproc = info->intermediate_voltage;
 
-	old_freq_hz = clk_get_rate(cpu_clk);
-	old_vproc = regulator_get_voltage(info->proc_reg);
-	if (old_vproc < 0) {
-		dev_err(cpu_dev, "invalid Vproc value: %d\n", old_vproc);
-		return old_vproc;
+	pre_freq_hz = clk_get_rate(cpu_clk);
+	pre_vproc = regulator_get_voltage(info->proc_reg);
+	if (pre_vproc < 0) {
+		dev_err(cpu_dev, "invalid Vproc value: %d\n", pre_vproc);
+		return pre_vproc;
 	}
 
 	freq_hz = freq_table[index].frequency * 1000;
@@ -235,12 +235,12 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	 * current voltage, scale up voltage first.
 	 */
 	target_vproc = (inter_vproc > vproc) ? inter_vproc : vproc;
-	if (old_vproc < target_vproc) {
+	if (pre_vproc < target_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, target_vproc);
 		if (ret) {
 			dev_err(cpu_dev,
 				"cpu%d: failed to scale up voltage!\n", policy->cpu);
-			mtk_cpufreq_set_voltage(info, old_vproc);
+			mtk_cpufreq_set_voltage(info, pre_vproc);
 			return ret;
 		}
 	}
@@ -250,7 +250,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	if (ret) {
 		dev_err(cpu_dev,
 			"cpu%d: failed to re-parent cpu clock!\n", policy->cpu);
-		mtk_cpufreq_set_voltage(info, old_vproc);
+		mtk_cpufreq_set_voltage(info, pre_vproc);
 		WARN_ON(1);
 		return ret;
 	}
@@ -261,7 +261,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 		dev_err(cpu_dev,
 			"cpu%d: failed to scale cpu clock rate!\n", policy->cpu);
 		clk_set_parent(cpu_clk, armpll);
-		mtk_cpufreq_set_voltage(info, old_vproc);
+		mtk_cpufreq_set_voltage(info, pre_vproc);
 		return ret;
 	}
 
@@ -279,13 +279,13 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	 * If the new voltage is lower than the intermediate voltage or the
 	 * original voltage, scale down to the new voltage.
 	 */
-	if (vproc < inter_vproc || vproc < old_vproc) {
+	if (vproc < inter_vproc || vproc < pre_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, vproc);
 		if (ret) {
 			dev_err(cpu_dev,
 				"cpu%d: failed to scale down voltage!\n", policy->cpu);
 			clk_set_parent(cpu_clk, info->inter_clk);
-			clk_set_rate(armpll, old_freq_hz);
+			clk_set_rate(armpll, pre_freq_hz);
 			clk_set_parent(cpu_clk, armpll);
 			return ret;
 		}
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
