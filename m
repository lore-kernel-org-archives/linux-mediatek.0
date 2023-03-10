Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A6DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9omEC3n509RaVFWjZiPfG0Mv8O5GJ/+wxH/Bs3M2C0=; b=DpN4+YMDcOf4h9DT2A4jRpsB4/
	RxNdz00Sp9lsT5cdTtHUwYETEYKLT0WyYd64x0SxBAhtRNrBcqdUZgGenC8DvJdxfbF1FtTUs+DdG
	D8Bc+HHMw2u+OSEfFFdSQLQbNM1Q2E+gHQyjDVpvBg6Oqm5WHTDlLt29sRpBw4lABNMhIWHFDmH9l
	VLnISmBHgI5sP7INY+72w+PY8ukuSEDx07rbWwwmFAzbIGezz1Dj8zNRdOQc6oTi2UAd8dv/dB1t3
	Za0ejrL+UH1hl9XZredUQsADCfupFUrqpLAiQV+9bpjiKSotS8PurikAMEtY90/YpR7QX4GBAh+pU
	lwFMTcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paV9b-00D5rj-5G; Fri, 10 Mar 2023 05:18:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paV9S-00D5mM-Qi; Fri, 10 Mar 2023 05:18:49 +0000
X-UUID: 031e02c6bf0311eda799af78a38f2b8e-20230309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=w9omEC3n509RaVFWjZiPfG0Mv8O5GJ/+wxH/Bs3M2C0=;
	b=EHErLOTYoUiiYwfG6tiHpvln6mfYgjZDMCtamitEPacZFKb1wamcSnPhTA6AG+6+z4DgPYQuq2ENAYjVP0y3vOKlxRQcy3n9VBzY3FvUZKcJln7BcDN+gLc9BclOMaJzwXz2C0oYIKAvlgtQYTvEgA6D19X/9rgpD722HSiV/2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:81f7d3dd-b2e2-48bd-b34e-dce6901004d2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.20,REQID:81f7d3dd-b2e2-48bd-b34e-dce6901004d2,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:25b5999,CLOUDID:b84fef27-564d-42d9-9875-7c868ee415ec,B
	ulkID:230310131809DD3RI5HN,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 031e02c6bf0311eda799af78a38f2b8e-20230309
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1345400714; Thu, 09 Mar 2023 22:18:37 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 10 Mar 2023 13:18:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 10 Mar 2023 13:18:06 +0800
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
Subject: [PATCH v1 3/3] cpufreq: mediatek: raise proc/sram max voltage for MT7622 and MT8516
Date: Fri, 10 Mar 2023 13:17:50 +0800
Message-ID: <20230310051750.4745-4-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
References: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_211846_941279_1E5375E7 
X-CRM114-Status: GOOD (  12.95  )
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

Since the upper boundary of proc/sram voltage of MT7622 and MT8516 are
1350 mV and 1300 mV respectively, both are greater than the value of
MT2701 1150 mV, we fix it by adding the corresponding platform data and
specify proc/sram_max_volt to support MT7622 and MT8516 individually.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
Reported-by: Nick Hainke <vincent@systemli.org>
Link: https://lore.kernel.org/lkml/75216e0c-9d36-7ada-1507-1bb4a91a3326@systemli.org/T/
---
 drivers/cpufreq/mediatek-cpufreq.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index cb8b76f9c2c3..f6824d4bf85d 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -707,6 +707,15 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
 	.ccifreq_supported = false,
 };
 
+static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1360000,
+	.sram_min_volt = 0,
+	.sram_max_volt = 1360000,
+	.ccifreq_supported = false,
+};
+
 static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
 	.min_volt_shift = 100000,
 	.max_volt_shift = 200000,
@@ -725,20 +734,29 @@ static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
 	.ccifreq_supported = true,
 };
 
+static const struct mtk_cpufreq_platform_data mt8516_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1310000,
+	.sram_min_volt = 0,
+	.sram_max_volt = 1310000,
+	.ccifreq_supported = false,
+};
+
 /* List of machines supported by this driver */
 static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt7622", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt7623", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt8167", .data = &mt2701_platform_data },
+	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
+	{ .compatible = "mediatek,mt7623", .data = &mt7622_platform_data },
+	{ .compatible = "mediatek,mt8167", .data = &mt8516_platform_data },
 	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8176", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8183", .data = &mt8183_platform_data },
 	{ .compatible = "mediatek,mt8186", .data = &mt8186_platform_data },
 	{ .compatible = "mediatek,mt8365", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt8516", .data = &mt2701_platform_data },
+	{ .compatible = "mediatek,mt8516", .data = &mt8516_platform_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_cpufreq_machines);
-- 
2.18.0


