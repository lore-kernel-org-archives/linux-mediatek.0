Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9243FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/mDrYs9/PtFAi6kJ4fxxEf9XpH9LSc1QYyhpkvpZUPA=; b=PrEVa8Ck5AkZIt
	Icun4rCgBTT06A4bP4Kl26XlqKfI9ZKTdl/hfBwzHyriC0f573WI9gSFy5rr3rq0tL1+FFmdMfRBN
	nGVrqKaIkKv9aFGSQ6/xQm8Nddn2v83ZzBb5SygVtaj9C8CnuFC4FcD6LYz2DBbBpKI4yP2h3bk7d
	hh/rRLLfqJ9p7cLXBSBQjbtNkB5mo3FXTK3R1laa3aVdDZqDY5C4P6zP2cj7mgby+L+Cb2M2+BACH
	IKS+1f4iZIg+htPAVAIwPOz3hU9P3qLG/ve0noFfStHiZdZK07VWffMnN/nrnk0YPgZqd5OqaoBSb
	63HFfA+uxzSNJ/gi6wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgtD-00F1kt-2M; Fri, 08 Apr 2022 05:10:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs4-00F1BV-My; Fri, 08 Apr 2022 05:09:22 +0000
X-UUID: 25cfc930c6004d52a6e988ca7c89d6d0-20220407
X-UUID: 25cfc930c6004d52a6e988ca7c89d6d0-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 83522002; Thu, 07 Apr 2022 22:09:14 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 12:59:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:13 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 15/15] cpufreq: mediatek: Use device print to show logs
Date: Fri, 8 Apr 2022 12:59:08 +0800
Message-ID: <20220408045908.21671-16-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220920_798160_3B91D30D 
X-CRM114-Status: GOOD (  11.59  )
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

Replace pr_* with dev_* to show logs.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 41 +++++++++++++++++-------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 07d3b31e3ee0..34e3baa4927f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -92,13 +92,15 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 
 	old_vproc = regulator_get_voltage(proc_reg);
 	if (old_vproc < 0) {
-		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
+		dev_err(info->cpu_dev,
+			"%s: invalid Vproc value: %d\n", __func__, old_vproc);
 		return old_vproc;
 	}
 
 	old_vsram = regulator_get_voltage(sram_reg);
 	if (old_vsram < 0) {
-		pr_err("%s: invalid Vsram value: %d\n", __func__, old_vsram);
+		dev_err(info->cpu_dev,
+			"%s: invalid Vsram value: %d\n", __func__, old_vsram);
 		return old_vsram;
 	}
 
@@ -217,8 +219,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	freq_hz = freq_table[index].frequency * 1000;
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &freq_hz);
 	if (IS_ERR(opp)) {
-		pr_err("cpu%d: failed to find OPP for %ld\n",
-		       policy->cpu, freq_hz);
+		dev_err(cpu_dev, "cpu%d: failed to find OPP for %ld\n",
+			policy->cpu, freq_hz);
 		return PTR_ERR(opp);
 	}
 	vproc = dev_pm_opp_get_voltage(opp);
@@ -243,8 +245,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	if (old_vproc <= target_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, target_vproc);
 		if (ret) {
-			pr_err("cpu%d: failed to scale up voltage!\n",
-			       policy->cpu);
+			dev_err(cpu_dev, "cpu%d: failed to scale up voltage!\n",
+				policy->cpu);
 			mtk_cpufreq_set_voltage(info, old_vproc);
 			goto out;
 		}
@@ -253,8 +255,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	/* Reparent the CPU clock to intermediate clock. */
 	ret = clk_set_parent(cpu_clk, info->inter_clk);
 	if (ret) {
-		pr_err("cpu%d: failed to re-parent cpu clock!\n",
-		       policy->cpu);
+		dev_err(cpu_dev, "cpu%d: failed to re-parent cpu clock!\n",
+			policy->cpu);
 		mtk_cpufreq_set_voltage(info, old_vproc);
 		goto out;
 	}
@@ -262,8 +264,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	/* Set the original PLL to target rate. */
 	ret = clk_set_rate(armpll, freq_hz);
 	if (ret) {
-		pr_err("cpu%d: failed to scale cpu clock rate!\n",
-		       policy->cpu);
+		dev_err(cpu_dev, "cpu%d: failed to scale cpu clock rate!\n",
+			policy->cpu);
 		clk_set_parent(cpu_clk, armpll);
 		mtk_cpufreq_set_voltage(info, old_vproc);
 		goto out;
@@ -272,8 +274,8 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	/* Set parent of CPU clock back to the original PLL. */
 	ret = clk_set_parent(cpu_clk, armpll);
 	if (ret) {
-		pr_err("cpu%d: failed to re-parent cpu clock!\n",
-		       policy->cpu);
+		dev_err(cpu_dev, "cpu%d: failed to re-parent cpu clock!\n",
+			policy->cpu);
 		mtk_cpufreq_set_voltage(info, inter_vproc);
 		goto out;
 	}
@@ -285,8 +287,9 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	if (vproc < inter_vproc || vproc < old_vproc) {
 		ret = mtk_cpufreq_set_voltage(info, vproc);
 		if (ret) {
-			pr_err("cpu%d: failed to scale down voltage!\n",
-			       policy->cpu);
+			dev_err(cpu_dev,
+				"cpu%d: failed to scale down voltage!\n",
+				policy->cpu);
 			clk_set_parent(cpu_clk, info->inter_clk);
 			clk_set_rate(armpll, old_freq_hz);
 			clk_set_parent(cpu_clk, armpll);
@@ -568,15 +571,17 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 
 	info = mtk_cpu_dvfs_info_lookup(policy->cpu);
 	if (!info) {
-		pr_err("dvfs info for cpu%d is not initialized.\n",
-		       policy->cpu);
+		dev_err(info->cpu_dev,
+			"dvfs info for cpu%d is not initialized.\n",
+			policy->cpu);
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
