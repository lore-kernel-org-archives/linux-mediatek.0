Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC12AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 02:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6kS2xybjWEXGhmkdT7MwEra4D5lvvtQFEPepc/e8KM=; b=q6Y5ZTSjJMGRa8GWwyiUUaPPmb
	r2qlg+1ACimDUz8x3CVK5ZfJV5hV15P+wHvNHN3X4rUm5mJWx6krwhYzyLrDWSE0WFv2cFlTbkrOQ
	jwpRmndRwmOToqrdpU9uazUsi3yejc+3s3D2WMBvqswG3JHnTT6qHcl+rVr0Sll0JDc/ql362gdX9
	WcpFHMtz4JslF/0N0Q0TEUwzfCf9FPwncowo9wPq5Ss41rPX1k6GTGoEiF/YVn876Z0UhdVJ32QEK
	FpO4zzgiKarekbruR9IVwdG+0HGubQn1m0qt2ellRyu5daV8bl9PXAgI6ZEmMUVYqWIxZvQY5w6op
	7txdg3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oing2-00AGI2-F9; Thu, 13 Oct 2022 02:10:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oinfC-00AFsc-JO; Thu, 13 Oct 2022 02:09:37 +0000
X-UUID: 9cb347dba1c545eda497b099d3441b66-20221012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f6kS2xybjWEXGhmkdT7MwEra4D5lvvtQFEPepc/e8KM=;
	b=Bp7bAdY0ulY0rG2S6aj/5+GPfelIFTkDInSiJlOi+pvHj6zjEpV5AZfj2rlz6GfOnx8PG+TXzBsN6tXny4+cZloH7YPN5Ilo0zSSzU8pZk5otys5+PYROTdVt/sJBAVGu2jc1xRj4tTcfpNYGyE9O6Ut5A8no1kjrB+3FEdjQuE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b9e04c76-25ec-4b0a-8fdb-e11d79098699,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:75
X-CID-INFO: VERSION:1.1.11,REQID:b9e04c76-25ec-4b0a-8fdb-e11d79098699,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACT
	ION:quarantine,TS:75
X-CID-META: VersionHash:39a5ff1,CLOUDID:1adac2e1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:2210131003351DSQVOVB,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9cb347dba1c545eda497b099d3441b66-20221012
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 759843911; Wed, 12 Oct 2022 19:03:34 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 13 Oct 2022 10:03:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 13 Oct 2022 10:03:30 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v3 5/8] soc: mediatek: mmsys: add support for MT8195 VPPSYS
Date: Thu, 13 Oct 2022 10:03:26 +0800
Message-ID: <20221013020329.8800-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221013020329.8800-1-moudy.ho@mediatek.com>
References: <20221013020329.8800-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_190934_691343_6DEE8C0F 
X-CRM114-Status: GOOD (  14.00  )
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
---
 drivers/soc/mediatek/mtk-mmsys.c | 22 ++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 146a78ba06c1..86454c0812b1 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -80,6 +80,16 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
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
@@ -241,6 +251,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
 
+	if (mmsys->data->is_vppsys)
+		goto out_probe_done;
+
 	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
 					    PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(drm)) {
@@ -248,6 +261,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(drm);
 	}
 
+out_probe_done:
 	return 0;
 }
 
@@ -292,6 +306,14 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
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


