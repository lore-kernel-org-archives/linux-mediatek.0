Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB932C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:31:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61532073A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 02:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2vlBKtY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Uh2uoKY2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61532073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u3HA/AufiddGbV8vOZJFzTJhy1rf1O56aF6jnRmWGFs=; b=u2vlBKtYOCybsgFpvivoCOSNb
	6as2LBIR+yuNCg3rC7z5oJqrvaQgU5aHapUbZlhjLpzCtiRFF13QU/VysbMcfGGl14SwKGRs/Dzi1
	jpzWniihKFbJz9HBTVs8M/cFtZcQ2BW53eaV/rDBZFT71n1x3JbSwcMkVEOWyOx1lA0YlZzjFKAN7
	Lc4qT3d5K+7XoXrBbhx+qQ7wa1d4x1tGgDok93Y1zeprAyVOTrXLcMLjLlzKLzUoADe1cLG04jhKH
	dfWRvBNkLuATLVX8bc4CXuwdAXj95eaZjQpfr9v5Z0stNa8uUQxdMNapR7JBNc0u/gje1DgnRffd9
	uNV1fdq0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtip9-0004KM-Ti; Fri, 10 Jul 2020 02:31:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtip7-0004J9-Q3; Fri, 10 Jul 2020 02:31:38 +0000
X-UUID: f29d2bd53f4a4c8ba45e9dda559af588-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gBV5bEL9fzMZNK7XWAXfbgDGhaZmJEcF1/1TMNfjzJc=; 
 b=Uh2uoKY25DKejtm9Z4kv5bymzUpEosIplzP5lkbkg8+hzb57s5gvJVy9WnlBb8eGwV/VyRM5+jVzanMN40TbaaU/NID4rZnnywF3nX5V4ghvyU8dtaSJE/CTYjlrE2lt6rnNPo78CyQrOdR1GzGeUgbLGgKNmrPKKLKBgLeo+Hk=;
X-UUID: f29d2bd53f4a4c8ba45e9dda559af588-20200709
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 797057750; Thu, 09 Jul 2020 18:31:28 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 19:31:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 10:31:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Jul 2020 10:31:28 +0800
From: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH v7 2/8] cpufreq: mediatek: Enable clock and regulator
Date: Fri, 10 Jul 2020 10:31:18 +0800
Message-ID: <1594348284-14199-3-git-send-email-andrew-sh.cheng@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_223138_024260_600A476B 
X-CRM114-Status: GOOD (  15.49  )
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

From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>

Need to enable regulator,
so that the max/min requested value will be recorded
even it is not applied right away.

Intermediate clock is not always enabled by ccf in different projects,
so cpufreq should enable it by itself.

Change-Id: I9f4c8b1ea793794f5f9cdc65427daad1393f5df8
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
