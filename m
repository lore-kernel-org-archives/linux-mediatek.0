Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18FFC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 10:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bH+RfDWIyiYP8glHw0xwaL9U+3PUHPMSJIqqmcOnGyo=; b=qyvmIVDYU8YogEHoRlGXsPTXUV
	CqPIi1c3fT0aAzd+xTdMFUCJ9Nm8ImD/FP8mZ4i2PK3IhROIZUri87F1dzcjei8OEsTTeYtKA3WR6
	ZvNLfVhYC14GCgBSgTtq+tS/tsKt7FCCtCtp0GAGrUOiMracG1FkGvNGQ73P//jJw9zhrTXO5Vbb0
	uNZnOT7Lyxw/CTmgRbLWibdC0SWCWl4duA9AcVOQy+gCtsP419Rxl9pVGyPUEkooSkVO/YTJA5+7g
	23scyjX5PKohTqD7f7NXmJjHRGRqmk9m6Cp2hSwWSdDbt3E96aOKMSQtl0UdSnmnSoN/0UjQwkzkY
	3jAbiQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfePT-0047ge-03;
	Fri, 24 Mar 2023 10:12:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfePG-0047aa-2j;
	Fri, 24 Mar 2023 10:12:24 +0000
X-UUID: 5bfaca1cca2c11edb7d8d11f642b8e78-20230324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bH+RfDWIyiYP8glHw0xwaL9U+3PUHPMSJIqqmcOnGyo=;
	b=BgqrFreryj6ArhfFIAwREaWAXL2+XkgN/aooTV8/dpabAB/zs8Dl9AWaQYDMGem71oNdeuTc/X1LKuxskyYqqGc0GqEXTrGilcIvWYxzmpI0vh9beIKmDs/rcz68HpeBPZm7CUyQ8eatIu5p0c3Qbie2pjIZqj1AA4ooXTl5OV8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:02780920-15f9-4362-8a28-8480ce2b31e0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:d9896229-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5bfaca1cca2c11edb7d8d11f642b8e78-20230324
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jia-wei.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 597934448; Fri, 24 Mar 2023 03:12:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 18:11:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 18:11:42 +0800
From: jia-wei.chang <jia-wei.chang@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
	Nick Hainke <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2 3/4] cpufreq: mediatek: raise proc/sram max voltage for MT8516
Date: Fri, 24 Mar 2023 18:11:29 +0800
Message-ID: <20230324101130.14053-4-jia-wei.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_031222_950441_A031079B 
X-CRM114-Status: GOOD (  13.03  )
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

Since the upper boundary of proc/sram voltage of MT8516 is 1300 mV,
which is greater than the value of MT2701 1150 mV, we fix it by adding
the corresponding platform data and specify proc/sram_max_volt to
support MT8516.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
Reported-by: Nick Hainke <vincent@systemli.org>
Link: https://lore.kernel.org/lkml/75216e0c-9d36-7ada-1507-1bb4a91a3326@systemli.org/T/
---
 drivers/cpufreq/mediatek-cpufreq.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 6dc225546a8d..764e4fbdd536 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -711,20 +711,29 @@ static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
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
 	{ .compatible = "mediatek,mt7622", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt7623", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt8167", .data = &mt2701_platform_data },
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


