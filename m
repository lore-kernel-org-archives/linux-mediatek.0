Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFA0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB6420829
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 03:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TB7ACB1n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qdojNEn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB6420829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuBHEp90qVKiQyRRtF2Dp2i/ICSIgdC84kHOcEbzslw=; b=TB7ACB1nhn1aVJ
	FaY3g+aTuogy3dhROVHcwXcvZIw3r4p5yV9029mFTeMmmRYRwLv6iubICya97GY9Jq8f6BjFT50yE
	mWG+ocZq5qdMWO1+KOIxrHpeOa9jv0s1Q1Uf/GEDFV7bIrPrnwODWXHSIj3n1gsQGbhQo/olhIU1C
	ELklG+zSzQHTsNRn8/n6kh0Re1yA+pufpKrtt5SwQpan0qFUo80uSDYy/M2wIHc6FIBtUTd56XEuC
	Xl796R/1/5jsbn5O7nCVQHuIxfQucQ/TR44PnqY6zs1k01Op531Grfvhzc6xjhjN88+9t81WL8VcS
	GzPFevXtrup51yEwSG3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbFpV-0004MR-E9; Wed, 20 May 2020 03:55:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbFnc-00009p-D8; Wed, 20 May 2020 03:53:46 +0000
X-UUID: 815236b3903d4ee89a3fe3b84caed062-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dB4ezOVqjw7nFt3bSRpwmYCfaISL414oEtCEhCSjM0U=; 
 b=qdojNEn9v4evZFRQ0BC2pBod7tq1vEzcp649ktI18Qe4OftmNa3VxwEqGxMp43Whxs5w21oZyPxdc5EA0lU/AJ5MYfwhc0UFHLB6yM+MwCnnHcUiZCMXYyP9B8eEKOX2+hkURM4c7EIdNUsB5MJUXoQGfTbgu6pxDE98Q4ad82k=;
X-UUID: 815236b3903d4ee89a3fe3b84caed062-20200519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 36839835; Tue, 19 May 2020 19:53:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 20:43:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 May 2020 11:43:31 +0800
Received: from mtkslt209.mediatek.inc (10.21.15.96) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 11:43:31 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH 07/12] cpufreq: mediatek: Enable clock and regulator
Date: Wed, 20 May 2020 11:43:02 +0800
Message-ID: <20200520034307.20435-8-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
References: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_205344_737638_0836285F 
X-CRM114-Status: GOOD (  13.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>, srv_heupstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Need to enable regulator,
so that the max/min requested value will be recorded
even it is not applied right away.

Intermediate clock is not always enabled by ccf in different projects,
so cpufreq should always enable used clock by itself.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 0c98dd08273d..4b479c110cc9 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -350,6 +350,11 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		ret = PTR_ERR(proc_reg);
 		goto out_free_resources;
 	}
+	ret = regulator_enable(proc_reg);
+	if (ret) {
+		pr_warn("enable vproc for cpu%d fail\n", cpu);
+		goto out_free_resources;
+	}
 
 	/* Both presence and absence of sram regulator are valid cases. */
 	sram_reg = regulator_get_exclusive(cpu_dev, "sram");
@@ -368,13 +373,21 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 		goto out_free_resources;
 	}
 
+	ret = clk_prepare_enable(cpu_clk);
+	if (ret)
+		goto out_free_opp_table;
+
+	ret = clk_prepare_enable(inter_clk);
+	if (ret)
+		goto out_disable_mux_clock;
+
 	/* Search a safe voltage for intermediate frequency. */
 	rate = clk_get_rate(inter_clk);
 	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
 	if (IS_ERR(opp)) {
 		pr_err("failed to get intermediate opp for cpu%d\n", cpu);
 		ret = PTR_ERR(opp);
-		goto out_free_opp_table;
+		goto out_disable_inter_clock;
 	}
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
@@ -393,6 +406,12 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 	return 0;
 
+out_disable_inter_clock:
+	clk_disable_unprepare(inter_clk);
+
+out_disable_mux_clock:
+	clk_disable_unprepare(cpu_clk);
+
 out_free_opp_table:
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
 
@@ -411,14 +430,20 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 {
-	if (!IS_ERR(info->proc_reg))
+	if (!IS_ERR(info->proc_reg)) {
+		regulator_disable(info->proc_reg);
 		regulator_put(info->proc_reg);
+	}
 	if (!IS_ERR(info->sram_reg))
 		regulator_put(info->sram_reg);
-	if (!IS_ERR(info->cpu_clk))
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
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
