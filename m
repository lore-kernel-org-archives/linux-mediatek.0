Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7995BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRJf5a9JulebIpDUZtzjc6AxmGAaWsckl0Q3W2PMhVU=; b=yTqzM6HRTx6IPz
	2x9+WkM32gvhhcFD5qbk37c8uokW7kOmCsdl2jS4SkAYg8uOaaYRoquxxpXa/FDoff+5gmojjAuEt
	1sq9QhZSNkZXeSBEPZs2Etf69MzjCrrszYuIAWSeWCOaqkH3wj+ta+e6bds7qz+5dumtzIlgGtZd/
	YVTD+FxPIvmEK4gQySDCHtJskt6ogfBOP71GxSAJsuHsIeZ/gWPh3M9x4TWC4NG0uEfAIgbpHZbu9
	8RzsaZLUNhQXeUahF+gK4+A7rScBmx2U8irVJYWCOv8dRFQz7FS9kYLyAZkPmVxgO7FJwigyE0ENW
	gfA9Be+Hy0hP7MH2Ll6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfF3K-008qS9-PZ; Fri, 15 Apr 2022 06:03:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEzU-008nsp-3u; Fri, 15 Apr 2022 05:59:34 +0000
X-UUID: 39612487173040dfadb920bb378e2c5a-20220414
X-UUID: 39612487173040dfadb920bb378e2c5a-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 587247548; Thu, 14 Apr 2022 22:59:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 22:59:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Apr 2022 13:59:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 13:59:19 +0800
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
Subject: [PATCH V3 09/15] cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()
Date: Fri, 15 Apr 2022 13:59:10 +0800
Message-ID: <20220415055916.28350-10-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_225932_278579_B5C457FB 
X-CRM114-Status: GOOD (  18.30  )
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

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 130 ++++++++---------------------
 1 file changed, 34 insertions(+), 96 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 559f4a383d30..cc44a7a9427a 100644
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
@@ -94,91 +93,44 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
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
 
@@ -188,32 +140,18 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
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
+	} while (vproc != new_vproc || vsram != new_vsram);
 
 	return 0;
 }
@@ -275,8 +213,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
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
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
