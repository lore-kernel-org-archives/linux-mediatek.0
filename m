Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C89DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 05:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7CLY/cg5ojs9SWtTqzajbZDLdfKBEhfLiZf2rmzvKo=; b=WY4JT/1XcTxy5sGAT1iSVepzTP
	MoyXvTxfiyeVeELNJeUOdNsOxXz66A2t43qKKO7KZNMtM0LWUXozXoVvnMbHWFNkD8FK33VkCUrm5
	XYD3w07N+KMsQUKQxZxV+9KylOPXoCpD/xqUNxhSDZD+rXuo6njoyPfZkmZhlvjVKQA6dSRqXLa1u
	LMZothE8qIUwrkxOXOdCCf0zxI04QXGnCoepzmF2/i+Knnc8mUxTIjfyr8Vr2BgV4WjrZuOIHgBXK
	Emn591he19CqlnVnwYqjvrXtRoQdjtz25BFpytkD707y1F6OgBniQ5PxfiCW5fihzTwoMCLYCIfTv
	wuNo5bmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0yYz-00DV1Q-O9; Fri, 02 Dec 2022 05:26:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0yYw-00DUzM-J2
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 05:26:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id 136so3541690pga.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 21:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7CLY/cg5ojs9SWtTqzajbZDLdfKBEhfLiZf2rmzvKo=;
        b=lXKxGX6WE0PEpSZ3htACVAs0aK8M0kYePPgSv8PdJq6TPyHlZ+z54XkOZ2nITnpHzf
         qptpwXUsP7AcWoSyiHhoLn4Dl4yojBl99u3WehwDcbgZrO6B/pLb4eA89ur8UU3XuP7n
         9XkcBmDUiq1714lciG8O5wzArf4phIcYc0mLXI1MnX5yKfMeg2kbk5Ity/U+9Q6H03Nz
         ts9OK3esqBi3I0z67EqjQDb2N4HQ3xesjW3Bu0OXK5us05gOq5AogY2nmmf7meBekLZk
         VMhY1NMBYLtTwb0qeR4P4NWaUBRavI0G7Q7OwB2vUSIMrBq9GzzTxRFnKE3Iowy6mRfq
         8vnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7CLY/cg5ojs9SWtTqzajbZDLdfKBEhfLiZf2rmzvKo=;
        b=cL+fU9JjUyU4aVwR1Aq7hsgGWSNUJcrmoSDytXo5DmjvKEh07aGA2O4vQRG5txvjCl
         boN5rsHSOsuMJCrnI4pmMB2U6wsP9V6+bQukvsevQAsXtuOLXmGLWuNNkEen3435PE76
         gPzxA8HBNb3M7pTiaMjhj2wOYFET6U57sdc0gjUG3cME7zCqLDascBZ+X7kdKY5EiMQW
         yzWWK3jFcSGfnBD01K8DO80SiC4gSNqiKljNmI/sWcz/UvL/OiTtrxQPkLE8K0QQ6qKP
         Kgp7NNkZmhkaNPh0o0FyS77EaDNItuNA0Bad6H9jjwUWQCe0c63uYNUPGm1+PBq+h6fW
         3j3Q==
X-Gm-Message-State: ANoB5pnU0xTT8BJThEXTyBIERJ8ArGB47YuJjdzkjENJMEfek+O1yTb/
	ml5rpBLkxn9lo4yuSb7oNbkFhQ==
X-Google-Smtp-Source: AA0mqf4gLNzfw4IqDl++LKk9PBLXk4Rf0Xbt66bkQ6IAWTukB70GJgv1O47OinugE/tSm16nmV8uwA==
X-Received: by 2002:a63:5042:0:b0:46f:e658:a8ff with SMTP id q2-20020a635042000000b0046fe658a8ffmr47515928pgl.493.1669958771316;
        Thu, 01 Dec 2022 21:26:11 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902e54900b001898ca438fcsm4595052plf.282.2022.12.01.21.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 21:26:10 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	regressions@leemhuis.info,
	daniel@makrotopia.org,
	thomas.huehn@hs-nordhausen.de,
	"v5 . 19+" <stable@vger.kernel.org>,
	Nick <vincent@systemli.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Revert "cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()"
Date: Fri,  2 Dec 2022 10:56:07 +0530
Message-Id: <18947e09733a17935af9a123ccf9b6e92faeaf9b.1669958641.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_212614_655551_6C2EA442 
X-CRM114-Status: GOOD (  20.44  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 6a17b3876bc8303612d7ad59ecf7cbc0db418bcd.

This commit caused regression on Banana Pi R64 (MT7622), revert until
the problem is identified and fixed properly.

Link: https://lore.kernel.org/all/930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org/
Cc: v5.19+ <stable@vger.kernel.org> # v5.19+
Reported-by: Nick <vincent@systemli.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 147 +++++++++++++++++++----------
 1 file changed, 96 insertions(+), 51 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 7f2680bc9a0f..4466d0c91a6a 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -8,7 +8,6 @@
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask.h>
-#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -16,6 +15,8 @@
 #include <linux/pm_opp.h>
 #include <linux/regulator/consumer.h>
 
+#define VOLT_TOL		(10000)
+
 struct mtk_cpufreq_platform_data {
 	int min_volt_shift;
 	int max_volt_shift;
@@ -55,7 +56,6 @@ struct mtk_cpu_dvfs_info {
 	unsigned int opp_cpu;
 	unsigned long current_freq;
 	const struct mtk_cpufreq_platform_data *soc_data;
-	int vtrack_max;
 	bool ccifreq_bound;
 };
 
@@ -82,7 +82,6 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 	struct regulator *proc_reg = info->proc_reg;
 	struct regulator *sram_reg = info->sram_reg;
 	int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
-	int retry = info->vtrack_max;
 
 	pre_vproc = regulator_get_voltage(proc_reg);
 	if (pre_vproc < 0) {
@@ -90,44 +89,91 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 			"invalid Vproc value: %d\n", pre_vproc);
 		return pre_vproc;
 	}
+	/* Vsram should not exceed the maximum allowed voltage of SoC. */
+	new_vsram = min(new_vproc + soc_data->min_volt_shift,
+			soc_data->sram_max_volt);
+
+	if (pre_vproc < new_vproc) {
+		/*
+		 * When scaling up voltages, Vsram and Vproc scale up step
+		 * by step. At each step, set Vsram to (Vproc + 200mV) first,
+		 * then set Vproc to (Vsram - 100mV).
+		 * Keep doing it until Vsram and Vproc hit target voltages.
+		 */
+		do {
+			pre_vsram = regulator_get_voltage(sram_reg);
+			if (pre_vsram < 0) {
+				dev_err(info->cpu_dev,
+					"invalid Vsram value: %d\n", pre_vsram);
+				return pre_vsram;
+			}
+			pre_vproc = regulator_get_voltage(proc_reg);
+			if (pre_vproc < 0) {
+				dev_err(info->cpu_dev,
+					"invalid Vproc value: %d\n", pre_vproc);
+				return pre_vproc;
+			}
 
-	pre_vsram = regulator_get_voltage(sram_reg);
-	if (pre_vsram < 0) {
-		dev_err(info->cpu_dev, "invalid Vsram value: %d\n", pre_vsram);
-		return pre_vsram;
-	}
+			vsram = min(new_vsram,
+				    pre_vproc + soc_data->min_volt_shift);
 
-	new_vsram = clamp(new_vproc + soc_data->min_volt_shift,
-			  soc_data->sram_min_volt, soc_data->sram_max_volt);
+			if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
+				vsram = soc_data->sram_max_volt;
 
-	do {
-		if (pre_vproc <= new_vproc) {
-			vsram = clamp(pre_vproc + soc_data->max_volt_shift,
-				      soc_data->sram_min_volt, new_vsram);
-			ret = regulator_set_voltage(sram_reg, vsram,
-						    soc_data->sram_max_volt);
+				/*
+				 * If the target Vsram hits the maximum voltage,
+				 * try to set the exact voltage value first.
+				 */
+				ret = regulator_set_voltage(sram_reg, vsram,
+							    vsram);
+				if (ret)
+					ret = regulator_set_voltage(sram_reg,
+							vsram - VOLT_TOL,
+							vsram);
 
-			if (ret)
-				return ret;
-
-			if (vsram == soc_data->sram_max_volt ||
-			    new_vsram == soc_data->sram_min_volt)
 				vproc = new_vproc;
-			else
+			} else {
+				ret = regulator_set_voltage(sram_reg, vsram,
+							    vsram + VOLT_TOL);
+
 				vproc = vsram - soc_data->min_volt_shift;
+			}
+			if (ret)
+				return ret;
 
 			ret = regulator_set_voltage(proc_reg, vproc,
-						    soc_data->proc_max_volt);
+						    vproc + VOLT_TOL);
 			if (ret) {
 				regulator_set_voltage(sram_reg, pre_vsram,
-						      soc_data->sram_max_volt);
+						      pre_vsram);
 				return ret;
 			}
-		} else if (pre_vproc > new_vproc) {
+		} while (vproc < new_vproc || vsram < new_vsram);
+	} else if (pre_vproc > new_vproc) {
+		/*
+		 * When scaling down voltages, Vsram and Vproc scale down step
+		 * by step. At each step, set Vproc to (Vsram - 200mV) first,
+		 * then set Vproc to (Vproc + 100mV).
+		 * Keep doing it until Vsram and Vproc hit target voltages.
+		 */
+		do {
+			pre_vproc = regulator_get_voltage(proc_reg);
+			if (pre_vproc < 0) {
+				dev_err(info->cpu_dev,
+					"invalid Vproc value: %d\n", pre_vproc);
+				return pre_vproc;
+			}
+			pre_vsram = regulator_get_voltage(sram_reg);
+			if (pre_vsram < 0) {
+				dev_err(info->cpu_dev,
+					"invalid Vsram value: %d\n", pre_vsram);
+				return pre_vsram;
+			}
+
 			vproc = max(new_vproc,
 				    pre_vsram - soc_data->max_volt_shift);
 			ret = regulator_set_voltage(proc_reg, vproc,
-						    soc_data->proc_max_volt);
+						    vproc + VOLT_TOL);
 			if (ret)
 				return ret;
 
@@ -137,24 +183,32 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 				vsram = max(new_vsram,
 					    vproc + soc_data->min_volt_shift);
 
-			ret = regulator_set_voltage(sram_reg, vsram,
-						    soc_data->sram_max_volt);
+			if (vsram + VOLT_TOL >= soc_data->sram_max_volt) {
+				vsram = soc_data->sram_max_volt;
+
+				/*
+				 * If the target Vsram hits the maximum voltage,
+				 * try to set the exact voltage value first.
+				 */
+				ret = regulator_set_voltage(sram_reg, vsram,
+							    vsram);
+				if (ret)
+					ret = regulator_set_voltage(sram_reg,
+							vsram - VOLT_TOL,
+							vsram);
+			} else {
+				ret = regulator_set_voltage(sram_reg, vsram,
+							    vsram + VOLT_TOL);
+			}
+
 			if (ret) {
 				regulator_set_voltage(proc_reg, pre_vproc,
-						      soc_data->proc_max_volt);
+						      pre_vproc);
 				return ret;
 			}
-		}
-
-		pre_vproc = vproc;
-		pre_vsram = vsram;
-
-		if (--retry < 0) {
-			dev_err(info->cpu_dev,
-				"over loop count, failed to set voltage\n");
-			return -EINVAL;
-		}
-	} while (vproc != new_vproc || vsram != new_vsram);
+		} while (vproc > new_vproc + VOLT_TOL ||
+			 vsram > new_vsram + VOLT_TOL);
+	}
 
 	return 0;
 }
@@ -250,8 +304,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	 * If the new voltage or the intermediate voltage is higher than the
 	 * current voltage, scale up voltage first.
 	 */
-	target_vproc = max(inter_vproc, vproc);
-	if (pre_vproc <= target_vproc) {
+	target_vproc = (inter_vproc > vproc) ? inter_vproc : vproc;
+	if (pre_vproc < target_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, target_vproc);
 		if (ret) {
 			dev_err(cpu_dev,
@@ -513,15 +567,6 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	 */
 	info->need_voltage_tracking = (info->sram_reg != NULL);
 
-	/*
-	 * We assume min voltage is 0 and tracking target voltage using
-	 * min_volt_shift for each iteration.
-	 * The vtrack_max is 3 times of expeted iteration count.
-	 */
-	info->vtrack_max = 3 * DIV_ROUND_UP(max(info->soc_data->sram_max_volt,
-						info->soc_data->proc_max_volt),
-					    info->soc_data->min_volt_shift);
-
 	return 0;
 
 out_disable_inter_clock:
-- 
2.31.1.272.g89b43f80a514


