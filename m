Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC18C00A5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQxS2k6R9a79exc9R9tQ/pzR9d+Sn5fum5boHGDRG4A=; b=uXzgkzIoVCZ0iiBJP+5IY7Mjpn
	/zFvY3qwjXAC/TnYCq6RiFa6TM7TB0EcSIJGrijLL4XYjA9EimJKuxnl4/o8ddvMtSdvmfQRGmeny
	nH2e30RHYH8gvZpz+3mYpJipzJSBPmggm+Cf+XOqkaVxVsG0dQ6JlmPL573KAURIRbksIVi9hazea
	j9cH+h+yltAanx2FerXALLt3fhz/RZY9QPaV4oxsNyCuLLzQMwK0ccn8oMAxK6noQNeMo1LXFixyg
	CaKqvcXO4ViBCWG6R+siD49CcSZGNPICLRzc8fCen1cmnKtWzJXkI2N6uUPGcw+F11ft1y6tbnMVi
	5yoKIXxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyvf-00GgbE-RX; Wed, 18 Jan 2023 03:15:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHyve-00GgaL-KN; Wed, 18 Jan 2023 03:15:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kQxS2k6R9a79exc9R9tQ/pzR9d+Sn5fum5boHGDRG4A=; b=bzsHKMrbNiu3IH98Q7Zp+WEQJ9
	fMQXvQNNOJjnxM8M0mbTtZKuIXzHzLazEShOBRzJTCtLGStsPlga0+//f/fxQAOpzBxrPS2Hkq6to
	yKeV+FtfzoRAVXBTjGCqQ/RM9jUsVhwQn0G9R9KDt10jdFWvc/NJqjtC4Vk2g5SzrM3lodowiuGqF
	uYf8vV8ttOir5Ya7sV9ZkYhs6Ay7ZdYqxExWTMaApd79o+MNaAybxMBF3oIRtZmTKSYWGHvlTtQXA
	zze2SKdnwZwFSMe18upVpzNeqot8PTWHCqCyd96amwfOOEQPHVXVGB1obuvNSe1MS3aVsWxx6CnAD
	VVUEKoQQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHyvL-0068dn-2d;
	Wed, 18 Jan 2023 03:15:44 +0000
X-UUID: 52cda1ca96de11eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kQxS2k6R9a79exc9R9tQ/pzR9d+Sn5fum5boHGDRG4A=;
	b=ZxOWr/Xpy1PNnOjFsP/mMiOdHGQBrnIRk1OD3rbkCYuJcPkx/H4bQYfcwdZk4Oxet+l9R+aSZ8itzE87KlNQTwJFPMPq3UXcrroqzxBzqLmRAv2k0B90EH/fM7N6cWRywK/4s+7d+1UdFOToOhx157sslPx0QgC1C86jIivvSCE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:df53565b-2192-448e-80d8-343b59cbc29e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:faeb1ff6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 52cda1ca96de11eda08d4d6090ec5a5c-20230117
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1298402329; Tue, 17 Jan 2023 20:15:13 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:15:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:15:10 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v6 4/4] soc: mediatek: mmsys: add support for MT8195 VPPSYS
Date: Wed, 18 Jan 2023 11:15:09 +0800
Message-ID: <20230118031509.29834-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118031509.29834-1-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_031541_572383_3FBB8C2B 
X-CRM114-Status: GOOD (  16.00  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add MT8195 VPPSYS0 and VPPSYS1 driver data.

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 22 ++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 38f1dd92e7c6..176fdc866e22 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -88,6 +88,16 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vppsys0_driver_data = {
+	.clk_driver = "clk-mt8195-vpp0",
+	.is_vppsys = true,
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
+	.clk_driver = "clk-mt8195-vpp1",
+	.is_vppsys = true,
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
@@ -264,6 +274,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
 
+	if (mmsys->data->is_vppsys)
+		goto out_probe_done;
+
 	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
 					    PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(drm)) {
@@ -271,6 +284,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(drm);
 	}
 
+out_probe_done:
 	return 0;
 }
 
@@ -323,6 +337,14 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-vppsys0",
+		.data = &mt8195_vppsys0_driver_data,
+	},
+	{
+		.compatible = "mediatek,mt8195-vppsys1",
+		.data = &mt8195_vppsys1_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
 		.data = &mt8365_mmsys_driver_data,
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 77f37f8c715b..54a96b83afb4 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -91,6 +91,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	const bool is_vppsys;
 };
 
 /*
-- 
2.18.0


