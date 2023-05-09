Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B70C7EE22
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 May 2023 14:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1/xa42nik0zt26jT44GIBCwJZlsjd2xmitd+zLAJAY=; b=wJCVU6aNtNfW8hzReD1mPh42ZL
	64yj9MJmNtZB6FSx5wz/u9VmX55kUil1y5YZxMWDrDpHdaL5hUWs5r4n/mIJKxDN4A4GWFf0fmFfx
	6zuyyRmhAUacT8NnoC9XElsgQP1ulAhSXlLtiSabQCInDdHTSn5WbGoHCwWAd9Meiy5Ivy9zbHM3i
	DbnZqMG/Em7f8OS4Yb91ReO8LsUdDSIYG18AwIwsLpWi9nnJaNQPeaze63Iq51tJ14fHpiwK3J6ze
	bVGJD0WGF9mwnffaH7lx646oNBwkkkC6rISWgitMYE7eQj5if9VSE525X93upO3lFwP1l7Aqm68x/
	KJr7kDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwO8h-003Vil-0U;
	Tue, 09 May 2023 14:16:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwO8e-003Vhc-0W;
	Tue, 09 May 2023 14:16:25 +0000
X-UUID: f8a40180ee7111ed83ed1395ce914268-20230509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=q1/xa42nik0zt26jT44GIBCwJZlsjd2xmitd+zLAJAY=;
	b=Z4/1F2S+At9MmoOZpV3ZzYVB8GB867D7Ihg7/tM+3KXnWcjgI7mtmF96YPQR0mwf7oBGvOAm191z41ETabkHrb02qArEWjMhJ05hgPrZNpn+940z5hrVCAPmeL2ILWuitEbiYkKsPHJ8plPa+2kMhnhsgCFUomt+jYhJejNPREw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.24,REQID:293fb325-3d05-44ee-81fc-fbfa224abb2c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:178d4d4,CLOUDID:9f6748c0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: f8a40180ee7111ed83ed1395ce914268-20230509
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 143758303; Tue, 09 May 2023 07:01:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 22:01:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 9 May 2023 22:01:16 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>
Subject: [PATCH 2/2] drm/mediatek: Add DSI support for mt8188 vdosys0
Date: Tue, 9 May 2023 22:01:14 +0800
Message-ID: <20230509140114.6956-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230509140114.6956-1-jason-jh.lin@mediatek.com>
References: <20230509140114.6956-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_071624_350845_8B8FC680 
X-CRM114-Status: GOOD (  12.90  )
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

Add DSI as main display output for mt8188 vdosys0.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 5 +++++
 drivers/gpu/drm/mediatek/mtk_dsi.c          | 9 +++++++++
 4 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 72c57442f965..bf06ccb65652 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -48,6 +48,7 @@ int mtk_dpi_encoder_index(struct device *dev);
 
 void mtk_dsi_ddp_start(struct device *dev);
 void mtk_dsi_ddp_stop(struct device *dev);
+int mtk_dsi_encoder_index(struct device *dev);
 
 int mtk_gamma_clk_enable(struct device *dev);
 void mtk_gamma_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index fe20ce26b19f..214233d36487 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -318,6 +318,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
 static const struct mtk_ddp_comp_funcs ddp_dsi = {
 	.start = mtk_dsi_ddp_start,
 	.stop = mtk_dsi_ddp_stop,
+	.encoder_index = mtk_dsi_encoder_index,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d8c49614a107..7ea4dc87c558 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -191,8 +191,13 @@ static const unsigned int mt8188_mtk_ddp_main_routes_0[] = {
 	DDP_COMPONENT_DP_INTF0
 };
 
+static const unsigned int mt8188_mtk_ddp_main_routes_1[] = {
+	DDP_COMPONENT_DSI0
+};
+
 static const struct mtk_drm_route mt8188_mtk_ddp_main_routes[] = {
 	{0, ARRAY_SIZE(mt8188_mtk_ddp_main_routes_0), mt8188_mtk_ddp_main_routes_0},
+	{0, ARRAY_SIZE(mt8188_mtk_ddp_main_routes_1), mt8188_mtk_ddp_main_routes_1},
 };
 
 static const unsigned int mt8192_mtk_ddp_main[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..f9d2d5447e2e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -865,6 +865,15 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 	return ret;
 }
 
+int mtk_dsi_encoder_index(struct device *dev)
+{
+	struct mtk_dsi *dsi = dev_get_drvdata(dev);
+	int encoder_index = drm_encoder_index(&dsi->encoder);
+
+	dev_dbg(dev, "encoder index:%d", encoder_index);
+	return encoder_index;
+}
+
 static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 {
 	int ret;
-- 
2.18.0


