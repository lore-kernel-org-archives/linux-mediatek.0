Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcQfmxU2PqUccgoWzsUpeZYx5wy34CJCGPmYMMZEM8Q=; b=RbUK1J+603R4ca
	8hnMMlAnDk6QYFjFw8FsRJLzhdvd5YeZmNBZTMN0BQJcWc3+p/0vyTTJP+nTUdBDVkpX4MJSDGENn
	E4kZXBUO4GDOhPLRIkWC4FDAHNo5A8Xx2JnIgKw/RzNBsTsrTq9bUJgSfNJhKXJC4xYlkH6ivPmZl
	aHg9piLakzG7CYKgFX9phQB9jWoELuLgNxKu6mlL1mW1Q4ptFEdO3c4sLoY3BKAjMq0oA9Hew8ONU
	1+8PvxX77/gWwvYdW6jS9D5OIK2zdZazE2ebdldaj08oJSFYK03ySxbLFoZbmWUw7pa+LYx32DIau
	CKCKJZx+petX4OoYEo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgwS-00F3kF-FE; Fri, 08 Apr 2022 05:13:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs8-00F1Bt-TL; Fri, 08 Apr 2022 05:09:26 +0000
X-UUID: 98f5da81019f4e8497c9faea0530dc27-20220407
X-UUID: 98f5da81019f4e8497c9faea0530dc27-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 385851706; Thu, 07 Apr 2022 22:09:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 12:59:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:11 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 05/15] cpufreq: mediatek: Enable clocks and regulators
Date: Fri, 8 Apr 2022 12:58:58 +0800
Message-ID: <20220408045908.21671-6-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220924_988118_ADE08C7F 
X-CRM114-Status: GOOD (  15.07  )
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

We need to enable regulators so that the max and min requested values will
be recorded.
The intermediate clock is not always enabled by CCF in different projects,
so we should enable it in the cpufreq driver.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 50 +++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 2a2859dbc5e0..dc4a87e68940 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -332,10 +332,23 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		goto out_free_resources;
 	}
 
+	ret = regulator_enable(info->proc_reg);
+	if (ret) {
+		dev_warn(cpu_dev, "cpu%d: failed to enable vproc\n", cpu);
+		goto out_free_resources;
+	}
+
 	/* Both presence and absence of sram regulator are valid cases. */
 	info->sram_reg = regulator_get_exclusive(cpu_dev, "sram");
 	if (IS_ERR(info->sram_reg))
 		info->sram_reg = NULL;
+	else {
+		ret = regulator_enable(info->sram_reg);
+		if (ret) {
+			dev_warn(cpu_dev, "cpu%d: failed to enable vsram\n", cpu);
+			goto out_free_resources;
+		}
+	}
 
 	/* Get OPP-sharing information from "operating-points-v2" bindings */
 	ret = dev_pm_opp_of_get_sharing_cpus(cpu_dev, &info->cpus);
@@ -351,13 +364,21 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		goto out_free_resources;
 	}
 
+	ret = clk_prepare_enable(info->cpu_clk);
+	if (ret)
+		goto out_free_opp_table;
+
+	ret = clk_prepare_enable(info->inter_clk);
+	if (ret)
+		goto out_disable_mux_clock;
+
 	/* Search a safe voltage for intermediate frequency. */
 	rate = clk_get_rate(info->inter_clk);
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
 	if (IS_ERR(opp)) {
 		dev_err(cpu_dev, "cpu%d: failed to get intermediate opp\n", cpu);
 		ret = PTR_ERR(opp);
-		goto out_free_opp_table;
+		goto out_disable_inter_clock;
 	}
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
@@ -370,10 +391,21 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 	return 0;
 
+out_disable_inter_clock:
+	clk_disable_unprepare(info->inter_clk);
+
+out_disable_mux_clock:
+	clk_disable_unprepare(info->cpu_clk);
+
 out_free_opp_table:
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
 out_free_resources:
+	if (regulator_is_enabled(info->proc_reg))
+		regulator_disable(info->proc_reg);
+	if (info->sram_reg && regulator_is_enabled(info->sram_reg))
+		regulator_disable(info->sram_reg);
+
 	if (!IS_ERR(info->proc_reg))
 		regulator_put(info->proc_reg);
 	if (!IS_ERR(info->sram_reg))
@@ -388,14 +420,22 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 {
-	if (!IS_ERR(info->proc_reg))
+	if (!IS_ERR(info->proc_reg)) {
+		regulator_disable(info->proc_reg);
 		regulator_put(info->proc_reg);
-	if (!IS_ERR(info->sram_reg))
+	}
+	if (!IS_ERR(info->sram_reg)) {
+		regulator_disable(info->sram_reg);
 		regulator_put(info->sram_reg);
-	if (!IS_ERR(info->cpu_clk))
+	}
+	if (!IS_ERR(info->cpu_clk)) {
+		clk_disable_unprepare(info->cpu_clk);
 		clk_put(info->cpu_clk);
-	if (!IS_ERR(info->inter_clk))
+	}
+	if (!IS_ERR(info->inter_clk)) {
+		clk_disable_unprepare(info->inter_clk);
 		clk_put(info->inter_clk);
+	}
 
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
