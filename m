Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AC1C6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dtm8xbq2csvA98smfwgVuOSCs4BmphorbiFPeU6GbTg=; b=A604pze7oBvopoWjavrwHv7Ocd
	XIoEY3ev9o3rdI7SL4kY+E8kbkEbAUzLUvRw4lSEqIwU1iYlZ0Sjv0jixijawQWgzWLRWLgPEr69a
	Top2oBKhjWJvxcigP8aOiVoLub8HwH0WKlZ3IMYSWA58Y4jOIlw0O17AmIl93TKLY9mw9cSSCTPDD
	jLDy5Izp2i1AkO1WHra58r2ptF7vykEPehhaSTX0389XYVF5LOGdr36wJlHl+pVuKwSlSyWA1lnX2
	71Q0R0b2h3NZ+lsuqtidb4ZZQb2DWC0W8UHKjAcL73jYRRs+8xObOJFqgP2pJnoTKsw5WvbRFhMdz
	XRVXU1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paV9a-00D5rQ-D2; Fri, 10 Mar 2023 05:18:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paV9S-00D5lR-Pd; Fri, 10 Mar 2023 05:18:49 +0000
X-UUID: 0294213cbf0311eda799af78a38f2b8e-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Dtm8xbq2csvA98smfwgVuOSCs4BmphorbiFPeU6GbTg=;
	b=SMdB+dmhOg/zC0ZzrCZVi/mg2dxWYbCDGAzib+Ttus7SKuOtcTYDYiIxd3RfoaFrfYPlThuK4SK8uUJcVuvf72UX5loArOI04TlNpTYc+TANIloWagnVi3zETUHG+EGKlgxT22OQ2+8vvn22utR6wMea09lS5bo9NfvObm31mDs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:d7764597-6e07-4953-8db8-2f743adeaac6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:95
X-CID-INFO: VERSION:1.1.20,REQID:d7764597-6e07-4953-8db8-2f743adeaac6,IP:0,URL
	:0,TC:0,Content:-25,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:95
X-CID-META: VersionHash:25b5999,CLOUDID:894fef27-564d-42d9-9875-7c868ee415ec,B
	ulkID:230310131806WT2J9FMV,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:5,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,O
	SI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 0294213cbf0311eda799af78a38f2b8e-20230309
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 805227384; Thu, 09 Mar 2023 22:18:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 13:18:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 13:18:03 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kevin
 Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	Nick <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v1 2/3] cpufreq: mediatek: fix KP caused by handler usage after regulator_put/clk_put
Date: Fri, 10 Mar 2023 13:17:49 +0800
Message-ID: <20230310051750.4745-3-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
References: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_211846_900202_1E32B429 
X-CRM114-Status: GOOD (  12.80  )
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
handlers are reassigned to NULL value for validation check afterwards.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Fixes: 4b9ceb757bbb ("cpufreq: mediatek: Enable clocks and regulators")
Reported-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/linux-arm-kernel/20220921071913.p7kwsjnnuad2jgvk@vireshk-i7/T/
---
 drivers/cpufreq/mediatek-cpufreq.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 01d949707c37..cb8b76f9c2c3 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -539,35 +539,47 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	if (info->sram_reg && regulator_is_enabled(info->sram_reg))
 		regulator_disable(info->sram_reg);
 
-	if (!IS_ERR(info->proc_reg))
+	if (!IS_ERR(info->proc_reg)) {
 		regulator_put(info->proc_reg);
-	if (!IS_ERR(info->sram_reg))
+		info->proc_reg = NULL;
+	}
+	if (!IS_ERR(info->sram_reg)) {
 		regulator_put(info->sram_reg);
-	if (!IS_ERR(info->cpu_clk))
+		info->sram_reg = NULL;
+	}
+	if (!IS_ERR(info->cpu_clk)) {
 		clk_put(info->cpu_clk);
-	if (!IS_ERR(info->inter_clk))
+		info->cpu_clk = NULL;
+	}
+	if (!IS_ERR(info->inter_clk)) {
 		clk_put(info->inter_clk);
+		info->inter_clk = NULL;
+	}
 
 	return ret;
 }
 
 static void mtk_cpu_dvfs_info_release(struct mtk_cpu_dvfs_info *info)
 {
-	if (!IS_ERR(info->proc_reg)) {
+	if (!IS_ERR_OR_NULL(info->proc_reg)) {
 		regulator_disable(info->proc_reg);
 		regulator_put(info->proc_reg);
+		info->proc_reg = NULL;
 	}
-	if (!IS_ERR(info->sram_reg)) {
+	if (!IS_ERR_OR_NULL(info->sram_reg)) {
 		regulator_disable(info->sram_reg);
 		regulator_put(info->sram_reg);
+		info->sram_reg = NULL;
 	}
-	if (!IS_ERR(info->cpu_clk)) {
+	if (!IS_ERR_OR_NULL(info->cpu_clk)) {
 		clk_disable_unprepare(info->cpu_clk);
 		clk_put(info->cpu_clk);
+		info->cpu_clk = NULL;
 	}
-	if (!IS_ERR(info->inter_clk)) {
+	if (!IS_ERR_OR_NULL(info->inter_clk)) {
 		clk_disable_unprepare(info->inter_clk);
 		clk_put(info->inter_clk);
+		info->inter_clk = NULL;
 	}
 
 	dev_pm_opp_of_cpumask_remove_table(&info->cpus);
-- 
2.18.0


