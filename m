Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587CEC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyYLk4J5wJenlNfdE3zzgzIoo2MfAZOSGAd7XGSV7Ek=; b=VtyRZBeolshYGl613swTgLDbYi
	iqanclrJL2/8G0s/wcHDKCxf+iPMPlnlf/pnluJImbv/w80a2XFNa2yx5xdneQaXcxc3oSi3OpEWN
	XkrDZ1yXbU+Tv2/357upiJGy2ngb/XhhWo+IbNzM+rr37vcscicFm3iJdUnTPEfS2mPj8yGrGIuMw
	BpgsB4bHCcFQ//rMBGZAUGk/jsl5C+U8H6LTbjyco5vUM/55drsaZqrDuk3WAlyuP7txM44nn6Ptn
	kxgLFQmt+fbtEWCkNb7mbNA34Yqg3tVDjWLQup4aFPtX8sReozAF/rdQxfkmPWtuRBe1PdWI4xjjS
	YnXTqPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeOp-0047Pu-0F;
	Fri, 24 Mar 2023 10:11:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeOl-0047Nw-2I;
	Fri, 24 Mar 2023 10:11:53 +0000
X-UUID: 46ae11e6ca2c11edb7d8d11f642b8e78-20230324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OyYLk4J5wJenlNfdE3zzgzIoo2MfAZOSGAd7XGSV7Ek=;
	b=HV5/144yJu06LI/72t5o2Aj0XSVLRO9FsJK3umkUYezdJyQ3aK6WQQKjk+yttTJq1qZOXgxJAjLGVKkn3Udwd/caI8JamLk89n6yLwhpkDWIXLjB88+rxGrRwpgUrYDDPGT2ckskpeIel7c3HEC4Cpx/Kp5yXnQsNU4GsiWwQg0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:24daeab5-810a-4527-aab5-9fa14953e238,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:019343b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 46ae11e6ca2c11edb7d8d11f642b8e78-20230324
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 394894379; Fri, 24 Mar 2023 03:11:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 18:11:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 18:11:40 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kevin
 Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	Nick Hainke <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2 2/4] cpufreq: mediatek: fix KP caused by handler usage after regulator_put/clk_put
Date: Fri, 24 Mar 2023 18:11:28 +0800
Message-ID: <20230324101130.14053-3-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_031151_759063_01549C65 
X-CRM114-Status: GOOD (  13.00  )
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

From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>

Any kind of failure in mtk_cpu_dvfs_info_init() will lead to calling
regulator_put() or clk_put() and the KP will occur since the regulator/clk
handlers are used after released in mtk_cpu_dvfs_info_release().

To prevent the usage after regulator_put()/clk_put(), the regulator/clk
handlers are addressed in a way of "Free the Last Thing Style".

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Fixes: 4b9ceb757bbb ("cpufreq: mediatek: Enable clocks and regulators")
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/linux-arm-kernel/20220921071913.p7kwsjnnuad2jgvk@vireshk-i7/T/
Suggested-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/lkml/67024b47-f3c9-4764-9883-d52602cfefca@kili.mountain/
---
 drivers/cpufreq/mediatek-cpufreq.c | 62 +++++++++++++++---------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 01d949707c37..6dc225546a8d 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -420,7 +420,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		ret = PTR_ERR(info->inter_clk);
 		dev_err_probe(cpu_dev, ret,
 			      "cpu%d: failed to get intermediate clk\n", cpu);
-		goto out_free_resources;
+		goto out_free_mux_clock;
 	}
 
 	info->proc_reg = regulator_get_optional(cpu_dev, "proc");
@@ -428,13 +428,13 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		ret = PTR_ERR(info->proc_reg);
 		dev_err_probe(cpu_dev, ret,
 			      "cpu%d: failed to get proc regulator\n", cpu);
-		goto out_free_resources;
+		goto out_free_inter_clock;
 	}
 
 	ret = regulator_enable(info->proc_reg);
 	if (ret) {
 		dev_warn(cpu_dev, "cpu%d: failed to enable vproc\n", cpu);
-		goto out_free_resources;
+		goto out_free_proc_reg;
 	}
 
 	/* Both presence and absence of sram regulator are valid cases. */
@@ -442,14 +442,14 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	if (IS_ERR(info->sram_reg)) {
 		ret = PTR_ERR(info->sram_reg);
 		if (ret == -EPROBE_DEFER)
-			goto out_free_resources;
+			goto out_disable_proc_reg;
 
 		info->sram_reg = NULL;
 	} else {
 		ret = regulator_enable(info->sram_reg);
 		if (ret) {
 			dev_warn(cpu_dev, "cpu%d: failed to enable vsram\n", cpu);
-			goto out_free_resources;
+			goto out_free_sram_reg;
 		}
 	}
 
@@ -458,13 +458,13 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	if (ret) {
 		dev_err(cpu_dev,
 			"cpu%d: failed to get OPP-sharing information\n", cpu);
-		goto out_free_resources;
+		goto out_disable_sram_reg;
 	}
 
 	ret = dev_pm_opp_of_cpumask_add_table(&info->cpus);
 	if (ret) {
 		dev_warn(cpu_dev, "cpu%d: no OPP table\n", cpu);
-		goto out_free_resources;
+		goto out_disable_sram_reg;
 	}
 
 	ret = clk_prepare_enable(info->cpu_clk);
@@ -533,43 +533,41 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 out_free_opp_table:
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
-out_free_resources:
-	if (regulator_is_enabled(info->proc_reg))
-		regulator_disable(info->proc_reg);
-	if (info->sram_reg && regulator_is_enabled(info->sram_reg))
+out_disable_sram_reg:
+	if (info->sram_reg)
 		regulator_disable(info->sram_reg);
 
-	if (!IS_ERR(info->proc_reg))
-		regulator_put(info->proc_reg);
-	if (!IS_ERR(info->sram_reg))
+out_free_sram_reg:
+	if (info->sram_reg)
 		regulator_put(info->sram_reg);
-	if (!IS_ERR(info->cpu_clk))
-		clk_put(info->cpu_clk);
-	if (!IS_ERR(info->inter_clk))
-		clk_put(info->inter_clk);
+
+out_disable_proc_reg:
+	regulator_disable(info->proc_reg);
+
+out_free_proc_reg:
+	regulator_put(info->proc_reg);
+
+out_free_inter_clock:
+	clk_put(info->inter_clk);
+
+out_free_mux_clock:
+	clk_put(info->cpu_clk);
 
 	return ret;
 }
 
 static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 {
-	if (!IS_ERR(info->proc_reg)) {
-		regulator_disable(info->proc_reg);
-		regulator_put(info->proc_reg);
-	}
-	if (!IS_ERR(info->sram_reg)) {
+	regulator_disable(info->proc_reg);
+	regulator_put(info->proc_reg);
+	if (info->sram_reg) {
 		regulator_disable(info->sram_reg);
 		regulator_put(info->sram_reg);
 	}
-	if (!IS_ERR(info->cpu_clk)) {
-		clk_disable_unprepare(info->cpu_clk);
-		clk_put(info->cpu_clk);
-	}
-	if (!IS_ERR(info->inter_clk)) {
-		clk_disable_unprepare(info->inter_clk);
-		clk_put(info->inter_clk);
-	}
-
+	clk_disable_unprepare(info->cpu_clk);
+	clk_put(info->cpu_clk);
+	clk_disable_unprepare(info->inter_clk);
+	clk_put(info->inter_clk);
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 	dev_pm_opp_unregister_notifier(info->cpu_dev, &info->opp_nb);
 }
-- 
2.18.0


