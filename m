Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9450C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTvyRM1w+xlIVGlkGXlJGN6+I47wdzxmoXJn3NYvbOY=; b=zfYzm66VV3Tfo6
	Byx926jJXTu+OGm5QRdOLFw6XmsPhKz41ieNaZl7lK+eUOYu45FkkFha6GX+e8EE4m7tUY+gV4qtC
	GQgMfnvjxv375yGvz7ZfJjnUGygy3HrDSJ9DhuxBD68vEgSHtyP5th49gEFozVNWCjcnhBm/B7Hzj
	rUHWDwPNZBXA1EozAIvqQDCc5vOawXre1av/fLubMuMYHbLsxUho6VX2g8ZWiFQ1FKQTSt7O8TZ+z
	fRiYba1iour7mPF6gwpAc+HZqpQkgepaNqHku8GigbKAppb3/6LtS+PyEoxTbc2XZXzmxIgFhdSmz
	EK9c9wOy0BKfc9K0RltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEhw-00AuRY-QK; Wed, 04 May 2022 13:06:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEhO-00AuAa-S9; Wed, 04 May 2022 13:05:50 +0000
X-UUID: 70896fa675d640c0808199371302654b-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:631cf224-300e-48b7-b4ad-d03696ff47fe, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:005e8cb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 70896fa675d640c0808199371302654b-20220504
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 884810727; Wed, 04 May 2022 06:05:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 06:05:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 21:05:41 +0800
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
Subject: [PATCH v5 4/9] cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()
Date: Wed, 4 May 2022 21:05:35 +0800
Message-ID: <20220504130540.5902-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_060546_947356_0C66A000 
X-CRM114-Status: GOOD (  23.53  )
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

Because the difference of sram and proc should in a range of min_volt_shift
and max_volt_shift. We need to adjust the sram and proc step by step.

We replace VOLT_TOL (voltage tolerance) with the platform data and update the
logic to determine the voltage boundary and invoking regulator_set_voltage.

- Use 'sram_min_volt' and 'sram_max_volt' to determine the voltage boundary
  of sram regulator.
- Use (sram_min_volt - min_volt_shift) and 'proc_max_volt' to determine the
  voltage boundary of vproc regulator.

Moreover, to prevent infinite loop when tracking voltage, we calculate the
maximum value for each platform data.
We assume min voltage is 0 and tracking target voltage using
min_volt_shift for each iteration.
The retry_max is 3 times of expeted iteration count.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 147 ++++++++++-------------------
 1 file changed, 51 insertions(+), 96 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 80a3d4cd49ed..c9f09ddd4428 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -8,6 +8,7 @@
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -15,8 +16,6 @@
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
 
-#define VOLT_TOL		(10000)
-
 struct mtk_cpufreq_platform_data {
 	int min_volt_shift;
 	int max_volt_shift;
@@ -53,6 +52,7 @@ struct mtk_cpu_dvfs_info {
 	unsigned int opp_cpu;
 	unsigned long opp_freq;
 	const struct mtk_cpufreq_platform_data *soc_data;
+	int vtrack_max;
 };
 
 static struct platform_device *cpufreq_pdev;
@@ -78,6 +78,7 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 	struct regulator *proc_reg = info->proc_reg;
 	struct regulator *sram_reg = info->sram_reg;
 	int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
+	int retry = info->vtrack_max;
 
 	pre_vproc = regulator_get_voltage(proc_reg);
 	if (pre_vproc < 0) {
@@ -85,91 +86,44 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 			"invalid Vproc value: %d\n", pre_vproc);
 		return pre_vproc;
 	}
-	/* Vsram should not exceed the maximum allowed voltage of SoC. */
-	new_vsram = min(new_vproc + soc_data->min_volt_shift,
-			soc_data->sram_max_volt);
-
-	if (pre_vproc < new_vproc) {
-		/*
-		 * When scaling up voltages, Vsram and Vproc scale up step
-		 * by step. At each step, set Vsram to (Vproc + 200mV) first,
-		 * then set Vproc to (Vsram - 100mV).
-		 * Keep doing it until Vsram and Vproc hit target voltages.
-		 */
-		do {
-			pre_vsram = regulator_get_voltage(sram_reg);
-			if (pre_vsram < 0) {
-				dev_err(info->cpu_dev,
-					"invalid Vsram value: %d\n", pre_vsram);
-				return pre_vsram;
-			}
-			pre_vproc = regulator_get_voltage(proc_reg);
-			if (pre_vproc < 0) {
-				dev_err(info->cpu_dev,
-					"invalid Vproc value: %d\n", pre_vproc);
-				return pre_vproc;
-			}
-
-			vsram = min(new_vsram,
-				    pre_vproc + soc_data->min_volt_shift);
 
-			if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
-				vsram = soc_data->sram_max_volt;
+	pre_vsram = regulator_get_voltage(sram_reg);
+	if (pre_vsram < 0) {
+		dev_err(info->cpu_dev, "invalid Vsram value: %d\n", pre_vsram);
+		return pre_vsram;
+	}
 
-				/*
-				 * If the target Vsram hits the maximum voltage,
-				 * try to set the exact voltage value first.
-				 */
-				ret = regulator_set_voltage(sram_reg, vsram,
-							    vsram);
-				if (ret)
-					ret = regulator_set_voltage(sram_reg,
-							vsram - VOLT_TOL,
-							vsram);
+	new_vsram = clamp(new_vproc + soc_data->min_volt_shift,
+			  soc_data->sram_min_volt, soc_data->sram_max_volt);
 
-				vproc = new_vproc;
-			} else {
-				ret = regulator_set_voltage(sram_reg, vsram,
-							    vsram + VOLT_TOL);
+	do {
+		if (pre_vproc <= new_vproc) {
+			vsram = clamp(pre_vproc + soc_data->max_volt_shift,
+				      soc_data->sram_min_volt, new_vsram);
+			ret = regulator_set_voltage(sram_reg, vsram,
+						    soc_data->sram_max_volt);
 
-				vproc = vsram - soc_data->min_volt_shift;
-			}
 			if (ret)
 				return ret;
 
+			if (vsram == soc_data->sram_max_volt ||
+			    new_vsram == soc_data->sram_min_volt)
+				vproc = new_vproc;
+			else
+				vproc = vsram - soc_data->min_volt_shift;
+
 			ret = regulator_set_voltage(proc_reg, vproc,
-						    vproc + VOLT_TOL);
+						    soc_data->proc_max_volt);
 			if (ret) {
 				regulator_set_voltage(sram_reg, pre_vsram,
-						      pre_vsram);
+						      soc_data->sram_max_volt);
 				return ret;
 			}
-		} while (vproc < new_vproc || vsram < new_vsram);
-	} else if (pre_vproc > new_vproc) {
-		/*
-		 * When scaling down voltages, Vsram and Vproc scale down step
-		 * by step. At each step, set Vproc to (Vsram - 200mV) first,
-		 * then set Vproc to (Vproc + 100mV).
-		 * Keep doing it until Vsram and Vproc hit target voltages.
-		 */
-		do {
-			pre_vproc = regulator_get_voltage(proc_reg);
-			if (pre_vproc < 0) {
-				dev_err(info->cpu_dev,
-					"invalid Vproc value: %d\n", pre_vproc);
-				return pre_vproc;
-			}
-			pre_vsram = regulator_get_voltage(sram_reg);
-			if (pre_vsram < 0) {
-				dev_err(info->cpu_dev,
-					"invalid Vsram value: %d\n", pre_vsram);
-				return pre_vsram;
-			}
-
+		} else if (pre_vproc > new_vproc) {
 			vproc = max(new_vproc,
 				    pre_vsram - soc_data->max_volt_shift);
 			ret = regulator_set_voltage(proc_reg, vproc,
-						    vproc + VOLT_TOL);
+						    soc_data->proc_max_volt);
 			if (ret)
 				return ret;
 
@@ -179,32 +133,24 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 				vsram = max(new_vsram,
 					    vproc + soc_data->min_volt_shift);
 
-			if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
-				vsram = soc_data->sram_max_volt;
-
-				/*
-				 * If the target Vsram hits the maximum voltage,
-				 * try to set the exact voltage value first.
-				 */
-				ret = regulator_set_voltage(sram_reg, vsram,
-							    vsram);
-				if (ret)
-					ret = regulator_set_voltage(sram_reg,
-							vsram - VOLT_TOL,
-							vsram);
-			} else {
-				ret = regulator_set_voltage(sram_reg, vsram,
-							    vsram + VOLT_TOL);
-			}
-
+			ret = regulator_set_voltage(sram_reg, vsram,
+						    soc_data->sram_max_volt);
 			if (ret) {
 				regulator_set_voltage(proc_reg, pre_vproc,
-						      pre_vproc);
+						      soc_data->proc_max_volt);
 				return ret;
 			}
-		} while (vproc > new_vproc + VOLT_TOL ||
-			 vsram > new_vsram + VOLT_TOL);
-	}
+		}
+
+		pre_vproc = vproc;
+		pre_vsram = vsram;
+
+		if (--retry < 0) {
+			dev_err(info->cpu_dev,
+				"over loop count, failed to set voltage\n");
+			return -EINVAL;
+		}
+	} while (vproc != new_vproc || vsram != new_vsram);
 
 	return 0;
 }
@@ -268,8 +214,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	 * If the new voltage or the intermediate voltage is higher than the
 	 * current voltage, scale up voltage first.
 	 */
-	target_vproc = (inter_vproc > vproc) ? inter_vproc : vproc;
-	if (pre_vproc < target_vproc) {
+	target_vproc = max(inter_vproc, vproc);
+	if (pre_vproc <= target_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, target_vproc);
 		if (ret) {
 			dev_err(cpu_dev,
@@ -490,6 +436,15 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	 */
 	info->need_voltage_tracking = (info->sram_reg != NULL);
 
+	/*
+	 * We assume min voltage is 0 and tracking target voltage using
+	 * min_volt_shift for each iteration.
+	 * The vtrack_max is 3 times of expeted iteration count.
+	 */
+	info->vtrack_max = 3 * DIV_ROUND_UP(max(info->soc_data->sram_max_volt,
+						info->soc_data->proc_max_volt),
+					    info->soc_data->min_volt_shift);
+
 	return 0;
 
 out_disable_inter_clock:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
