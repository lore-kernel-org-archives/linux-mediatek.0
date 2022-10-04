Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE34C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+A8iA4h8rJySKgX0jdWcyO7mr15EHkeGDe/0sVL+uE=; b=kMdrTr153CHy+CQWD41zoT8E3J
	c5acNqvty5UT8saE/dNI2YRt6CkFe03UmmXuWURuRZXuo08W7oKarUttQKdh1G1sjJeO6DJAnYO4Z
	ZIL+0yjEmWcO3VrrUMQb2PeH0XHudY4YrW5aUBw+QZiFKl3VXxLbwF/Gxqz3XDsV0ydYFEobm+2Dh
	Djk+IqsWDJrRhAxdQsoAd6S77wrhVtOYRMXCknM/IXGTPXi6tcQ+0stqFZzXjBMAxdDCxTDYZr90A
	auo95A7d3SPxwFFYW89hq+c8v37l0UJFLzzO3HFsthcbK5NeogUeDKvmlQGYUTq+9OHprvJJtI02Y
	XuIvYbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofemx-009HYI-L4; Tue, 04 Oct 2022 10:04:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofemv-009HW5-9W; Tue, 04 Oct 2022 10:04:34 +0000
X-UUID: b8dfeb3e898343b1b1738bea885af2f5-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=n+A8iA4h8rJySKgX0jdWcyO7mr15EHkeGDe/0sVL+uE=;
	b=A3OMQR3iXHdtjIjhZ3/yle4gRtf2Cv4Fls9yiEhCuwKBnVpzZJAcM8VHmGHAMPHKuTrZwIdCKIbWnoxFVts8Ag6wvxI5RQrvfiYiurJgxEszbuLDMMXWAbskqPXq6/Q4Wg5RLvwOKYX58EIBk1pLQsVL7paJpBrn/TuShwgKHmA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:09fbe6b2-d9ae-4c08-920c-dad791875444,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:d3c430fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b8dfeb3e898343b1b1738bea885af2f5-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1496730412; Tue, 04 Oct 2022 03:04:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:33:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 4 Oct 2022 17:33:21 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 3/6] soc: mediatek: mmsys: add support for MT8195 VPPSYS
Date: Tue, 4 Oct 2022 17:33:16 +0800
Message-ID: <20221004093319.5069-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221004093319.5069-1-moudy.ho@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_030433_362089_97A7A1ED 
X-CRM114-Status: GOOD (  15.69  )
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
---
 drivers/soc/mediatek/mtk-mmsys.c | 20 +++++++++++++++++++-
 drivers/soc/mediatek/mtk-mmsys.h |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index d2c7a87aab87..c4d15f99f853 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -149,11 +149,25 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.clk_driver = "clk-mt8195-vdo1",
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vppsys0_driver_data = {
+	.io_start = 0x14000000,
+	.clk_driver = "clk-mt8195-vpp0",
+	.is_copies = true,
+};
+
+static const struct mtk_mmsys_driver_data mt8195_vppsys1_driver_data = {
+	.io_start = 0x14f00000,
+	.clk_driver = "clk-mt8195-vpp1",
+	.is_copies = true,
+};
+
 static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
-	.num_drv_data = 2,
+	.num_drv_data = 4,
 	.drv_data = {
 		&mt8195_vdosys0_driver_data,
 		&mt8195_vdosys1_driver_data,
+		&mt8195_vppsys0_driver_data,
+		&mt8195_vppsys1_driver_data,
 	},
 };
 
@@ -360,6 +374,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
 
+	if (mmsys->data->is_copies)
+		goto out_probe_done;
+
 	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
 					    PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(drm)) {
@@ -367,6 +384,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		return PTR_ERR(drm);
 	}
 
+out_probe_done:
 	return 0;
 }
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index f01ba206481d..d454b4a256af 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -92,6 +92,7 @@ struct mtk_mmsys_driver_data {
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
 	const u16 sw0_rst_offset;
+	bool is_copies;
 };
 
 struct mtk_mmsys_match_data {
-- 
2.18.0


