Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D84C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 05:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQxS2k6R9a79exc9R9tQ/pzR9d+Sn5fum5boHGDRG4A=; b=d2RhSW3hRfzlwFciR/GMN8+pd4
	aeUOMXswW8hDNamcZkbQsimUh+vOmOfa+jkvUm/fKA/Mcxu5ETVvsPsovr0YsKNm6H7p/YkTOs9sr
	VaDvlfqUCcFfgBKA6u6o42+tMxO67/XlHVm0i/FeOuWN+/SBK+0RPlWq6xhG/O1QEJIo3uTsk60L4
	9QUHuslBA5OsAWXyw+SB+HTlreDntLPPg3d6M1jOY0tVTd5WjSNpB0L4xjUauEX049mtgVSMRMx5h
	pE/yAXmktNeY57jjPw8qEBOBCdUHioPpZuPvC/61z6ue0prYFWdjl17utzNcTUNq9BRbfBrpAd6vU
	RIeiggWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGCs8-000ZP2-JU; Fri, 13 Jan 2023 05:45:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGCrX-000ZC2-Uo; Fri, 13 Jan 2023 05:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kQxS2k6R9a79exc9R9tQ/pzR9d+Sn5fum5boHGDRG4A=; b=KTBmSKl70YyhFoxSWMjazzshqO
	dSbVNdjykWJZjfmIO705YyX+OIcd4ZKp4KAkOmDQ5zHsAn8k93Yli+O1KI5JsuZfCKZ83zfdj19kv
	eV8fkPLXQ+Ok1HF1JS15xhn5ENXKYVd9rwuNpGz3fHYX4jkRv1LoPpidBqMUxti6HTv4v871L14wM
	fiB9oGMJu+p5zigb1W7w+BLdY0rCD7IPqFrziA2TUNxh90ao7TxewilCyrG47/gns1QzW+LE92UbY
	ec/8dJVJ9aycLx2iRqEf0Ty1TS6Hyxv3edPw63gnAzppGDBwDnoG9VSecLGkIspoaKfTi7pUQqfcz
	niqSOdXw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pGCrJ-004F6y-1b;
	Fri, 13 Jan 2023 05:44:13 +0000
X-UUID: 3afc433a930511eda08d4d6090ec5a5c-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kQxS2k6R9a79exc9R9tQ/pzR9d+Sn5fum5boHGDRG4A=;
	b=Zq7SHF7grjx7hipyNwQdyOcvd/tNBFmaZQ13lrz032jLPt+KjrpFkSx0lZNz+FTrboqK2IZtuEMuMDgRQ4wkGihjHGMUADsI8sleQH43hvzPr4v7WsXn6JL+lZN8grqBs9IYQkBb9ek+/xuWO+PWHQ3MKgmFBePJlN2DC1gfwCU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:60f7a443-a712-42e7-8bc7-15c072df76bb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:41648a54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 3afc433a930511eda08d4d6090ec5a5c-20230112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1794858222; Thu, 12 Jan 2023 22:43:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 13 Jan 2023 13:43:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 13 Jan 2023 13:43:06 +0800
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
Subject: [PATCH v5 07/10] soc: mediatek: mmsys: add support for MT8195 VPPSYS
Date: Fri, 13 Jan 2023 13:43:01 +0800
Message-ID: <20230113054304.21841-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230113054304.21841-1-moudy.ho@mediatek.com>
References: <20230113054304.21841-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_054410_606260_6FCED638 
X-CRM114-Status: GOOD (  14.64  )
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


