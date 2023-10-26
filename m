Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18A9C25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wo872voDsFvxOhW+pfe6nqHSn3LC/SGGi0ujYhncnzI=; b=3/RPspqlCcwSnzWCDnpAoIXxCb
	NO/Z8JQm/h63zVwGbGGpUVTG0TfsZK0coJKhcMZAOyVtmNNeKVt3A4/RCSA2+vIi5wr6mysNeGkc6
	aJYyhlg9trgaKcxzRBo4sVwxU26dZx29+aa0LOPe+W6JdkiSrDU60wrzywcnCLO41b5RPdiTJT+az
	0/6uKlLNlxgWj0uYIsVRZpM+hasuu9dvV4eIxXf904NTuFX8kAqimlpOJ06YaNKFmULh8kfGtS0Rh
	lG9QbfkWNWInkAaQmQBJNamFSGNUt4jXk04Fdq7CGXFRh9jZCosETpjWOcMuWP5mV74AFmTPURlev
	YvrJ8wqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyi8-00ENaB-1y;
	Thu, 26 Oct 2023 11:39:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyi5-00ENZQ-1r;
	Thu, 26 Oct 2023 11:39:34 +0000
X-UUID: 4aab338873f411ee9b7791016c24628a-20231026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Wo872voDsFvxOhW+pfe6nqHSn3LC/SGGi0ujYhncnzI=;
	b=CRD1x9wTOiKIa1QcxxiA/5O+2tn4iFpUF1r92IxDaUcBzjKQtbWknFctBDh2zkKtHfev19IKuZwG24n08kYjg8tQ+hsdG/3pYyLv7QxWv5ahZf8d6kJixE1j0IUHWteQkQuEW0ZdiEhrQUzXCHbfIY7kyEDERNT3jFNi/jfdFLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:689e1c78-c1d8-434b-82d0-d4b049466c51,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:4972cefb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4aab338873f411ee9b7791016c24628a-20231026
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1744108289; Thu, 26 Oct 2023 04:39:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Oct 2023 19:38:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Oct 2023 19:38:38 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Moudy Ho <moudy.ho@mediatek.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH] clk: mediatek: mt8188: probe vpp with mtk_clk_simple_probe()
Date: Thu, 26 Oct 2023 19:38:30 +0800
Message-ID: <20231026113830.29215-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_043933_640198_065D3BDF 
X-CRM114-Status: GOOD (  13.64  )
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

switch to the common mtk_clk_simple_probe() function for all of the
clock drivers that are registering as platform drivers.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8188-vpp0.c | 14 +++++++++++---
 drivers/clk/mediatek/clk-mt8188-vpp1.c | 14 +++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8188-vpp0.c b/drivers/clk/mediatek/clk-mt8188-vpp0.c
index e7b02b26fefb..18fffa191ee1 100644
--- a/drivers/clk/mediatek/clk-mt8188-vpp0.c
+++ b/drivers/clk/mediatek/clk-mt8188-vpp0.c
@@ -96,6 +96,15 @@ static const struct mtk_clk_desc vpp0_desc = {
 	.num_clks = ARRAY_SIZE(vpp0_clks),
 };
 
+static const struct of_device_id of_match_clk_mt8188_vpp0[] = {
+	{
+		.compatible = "mediatek,mt8188-vppsys0",
+		.data = &vpp0_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
 static const struct platform_device_id clk_mt8188_vpp0_id_table[] = {
 	{ .name = "clk-mt8188-vpp0", .driver_data = (kernel_ulong_t)&vpp0_desc },
 	{ /* sentinel */ }
@@ -103,12 +112,11 @@ static const struct platform_device_id clk_mt8188_vpp0_id_table[] = {
 MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp0_id_table);
 
 static struct platform_driver clk_mt8188_vpp0_drv = {
-	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.probe = mtk_clk_simple_probe,
 	.driver = {
 		.name = "clk-mt8188-vpp0",
+		.of_match_table = of_match_clk_mt8188_vpp0,
 	},
-	.id_table = clk_mt8188_vpp0_id_table,
 };
 module_platform_driver(clk_mt8188_vpp0_drv);
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt8188-vpp1.c b/drivers/clk/mediatek/clk-mt8188-vpp1.c
index e8f0f7eca097..f4b35336d427 100644
--- a/drivers/clk/mediatek/clk-mt8188-vpp1.c
+++ b/drivers/clk/mediatek/clk-mt8188-vpp1.c
@@ -91,6 +91,15 @@ static const struct mtk_clk_desc vpp1_desc = {
 	.num_clks = ARRAY_SIZE(vpp1_clks),
 };
 
+static const struct of_device_id of_match_clk_mt8188_vpp1[] = {
+	{
+		.compatible = "mediatek,mt8188-vppsys1",
+		.data = &vpp1_desc,
+	}, {
+		/* sentinel */
+	}
+};
+
 static const struct platform_device_id clk_mt8188_vpp1_id_table[] = {
 	{ .name = "clk-mt8188-vpp1", .driver_data = (kernel_ulong_t)&vpp1_desc },
 	{ /* sentinel */ }
@@ -98,12 +107,11 @@ static const struct platform_device_id clk_mt8188_vpp1_id_table[] = {
 MODULE_DEVICE_TABLE(platform, clk_mt8188_vpp1_id_table);
 
 static struct platform_driver clk_mt8188_vpp1_drv = {
-	.probe = mtk_clk_pdev_probe,
-	.remove_new = mtk_clk_pdev_remove,
+	.probe = mtk_clk_simple_probe,
 	.driver = {
 		.name = "clk-mt8188-vpp1",
+		.of_match_table = of_match_clk_mt8188_vpp1,
 	},
-	.id_table = clk_mt8188_vpp1_id_table,
 };
 module_platform_driver(clk_mt8188_vpp1_drv);
 MODULE_LICENSE("GPL");
-- 
2.18.0


