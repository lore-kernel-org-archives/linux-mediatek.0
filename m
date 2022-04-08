Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2720CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtgP3EAtaA2oUtK1g1v0a1XpY2Iyb7XbVsjiJGs+TgM=; b=bSuMLYg5bYqrcv
	bfJe0hY3zAnYl8/PlB2k9utCjBdVS/3dPqG+rJ+TFaDp0eYtjG+vMnkv3Mrb0f8RKH+CAm+jHhrPO
	YUkXPg/gqzlyJs3M+SvwVF7J7aD6fZ1YWSQ00ci+ICjsHNKeDtUPzPRSkhnITmoJdquCpfNuHB0Me
	dYDupH1KK9ExEAPsP4l6TUbEH3fmZvzK/P3YXhRQxCCnFxvwKbkmIxsuCf3H//AqKCW+yKlaCf0eJ
	N1adhRzDjZ5o9dPByQ42+R6BpdRd6ZLRT8PF5MsSMx3xvOPKimo/0pBkvECLqejmOokUzjXhDIYSh
	SUvijYBFyb6D0+NUV68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgvv-00F3R4-7r; Fri, 08 Apr 2022 05:13:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs7-00F1B9-Uk; Fri, 08 Apr 2022 05:09:26 +0000
X-UUID: 51d7592d3f9e4fd89602c6a1d43e6814-20220407
X-UUID: 51d7592d3f9e4fd89602c6a1d43e6814-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 746807913; Thu, 07 Apr 2022 22:09:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 12:59:12 +0800
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
Subject: [PATCH V2 11/15] cpufreq: mediatek: Update logic of voltage_tracking()
Date: Fri, 8 Apr 2022 12:59:04 +0800
Message-ID: <20220408045908.21671-12-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220924_006442_E4E6C44C 
X-CRM114-Status: GOOD (  18.00  )
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

- Remove VOLT_TOL because CCI may share the same sram and vproc
  regulators with CPU. Therefore, set the max voltage in
  regulator_set_voltage() to the proc{sram}_max_volt.

- Move comparison of new and old voltages to
  mtk_cpufreq_voltage_tracking().

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 130 ++++++++---------------------
 1 file changed, 34 insertions(+), 96 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 8f688d47e64b..e69b16a6541e 100644
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
@@ -93,91 +92,44 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
 		return old_vproc;
 	}
-	/* Vsram should not exceed the maximum allowed voltage of SoC. */
-	new_vsram = min(new_vproc + soc_data->min_volt_shift,
-			soc_data->sram_max_volt);
-
-	if (old_vproc < new_vproc) {
-		/*
-		 * When scaling up voltages, Vsram and Vproc scale up step
-		 * by step. At each step, set Vsram to (Vproc + 200mV) first,
-		 * then set Vproc to (Vsram - 100mV).
-		 * Keep doing it until Vsram and Vproc hit target voltages.
-		 */
-		do {
-			old_vsram = regulator_get_voltage(sram_reg);
-			if (old_vsram < 0) {
-				pr_err("%s: invalid Vsram value: %d\n",
-				       __func__, old_vsram);
-				return old_vsram;
-			}
-			old_vproc = regulator_get_voltage(proc_reg);
-			if (old_vproc < 0) {
-				pr_err("%s: invalid Vproc value: %d\n",
-				       __func__, old_vproc);
-				return old_vproc;
-			}
 
-			vsram = min(new_vsram,
-				    old_vproc + soc_data->min_volt_shift);
-
-			if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
-				vsram = soc_data->sram_max_volt;
+	old_vsram = regulator_get_voltage(sram_reg);
+	if (old_vsram < 0) {
+		pr_err("%s: invalid Vsram value: %d\n", __func__, old_vsram);
+		return old_vsram;
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
+		if (old_vproc <= new_vproc) {
+			vsram = clamp(old_vproc + soc_data->max_volt_shift,
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
 				regulator_set_voltage(sram_reg, old_vsram,
-						      old_vsram);
+						      soc_data->sram_max_volt);
 				return ret;
 			}
-		} while (vproc < new_vproc || vsram < new_vsram);
-	} else if (old_vproc > new_vproc) {
-		/*
-		 * When scaling down voltages, Vsram and Vproc scale down step
-		 * by step. At each step, set Vproc to (Vsram - 200mV) first,
-		 * then set Vproc to (Vproc + 100mV).
-		 * Keep doing it until Vsram and Vproc hit target voltages.
-		 */
-		do {
-			old_vproc = regulator_get_voltage(proc_reg);
-			if (old_vproc < 0) {
-				pr_err("%s: invalid Vproc value: %d\n",
-				       __func__, old_vproc);
-				return old_vproc;
-			}
-			old_vsram = regulator_get_voltage(sram_reg);
-			if (old_vsram < 0) {
-				pr_err("%s: invalid Vsram value: %d\n",
-				       __func__, old_vsram);
-				return old_vsram;
-			}
-
+		} else if (old_vproc > new_vproc) {
 			vproc = max(new_vproc,
 				    old_vsram - soc_data->max_volt_shift);
 			ret = regulator_set_voltage(proc_reg, vproc,
-						    vproc + VOLT_TOL);
+						    soc_data->proc_max_volt);
 			if (ret)
 				return ret;
 
@@ -187,32 +139,18 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
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
 				regulator_set_voltage(proc_reg, old_vproc,
-						      old_vproc);
+						      soc_data->proc_max_volt);
 				return ret;
 			}
-		} while (vproc > new_vproc + VOLT_TOL ||
-			 vsram > new_vsram + VOLT_TOL);
-	}
+		}
+
+		old_vproc = vproc;
+		old_vsram = vsram;
+	} while (vproc != new_vproc || vsram != new_vsram);
 
 	return 0;
 }
@@ -272,8 +210,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	 * If the new voltage or the intermediate voltage is higher than the
 	 * current voltage, scale up voltage first.
 	 */
-	target_vproc = (inter_vproc > vproc) ? inter_vproc : vproc;
-	if (old_vproc < target_vproc) {
+	target_vproc = max(inter_vproc, vproc);
+	if (old_vproc <= target_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, target_vproc);
 		if (ret) {
 			pr_err("cpu%d: failed to scale up voltage!\n",
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
