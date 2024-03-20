Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761CECD11BF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 02:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZJix1J9Jpmh+i91OEHpGMGggBKx4tQWzIsRWzZa578=; b=N8HEWWlWOhSRH5BiREZKe69Q3H
	v9fKuVq8foOsEzpADxSuMmCSLX06JqhbqOqBiVGxwAE1io1uw9Ow//SdLaLJCO6+gLd5YojufRiA2
	0FzgoFuEWFjMxvBqIj/Z+ggVxIhUVNTEr9xPiCyy8sxAfEgqtFkGhdYsNjyCzdr8XyfFkzZGFrrIQ
	z8lDZZfPE0yBMMMH68DzoRs/8czlcxdFAq4pdcfHgLaEFEdC3wgeEtsUtUc66r5hkObeA8c3eO8BL
	53tJnp2inFrs6xr8N0SghOiBc+BPCGWCAAFC9a5vAdB1LvOEHDBeY8XNm+beAlWvbqgsy4A3QxqMr
	eX2rFaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlw3-0000000F6iC-1In0;
	Wed, 20 Mar 2024 02:44:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlv0-0000000F5xE-3yqB;
	Wed, 20 Mar 2024 02:43:11 +0000
X-UUID: 90888a22e66311eeacdb61a41848c7d2-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PZJix1J9Jpmh+i91OEHpGMGggBKx4tQWzIsRWzZa578=;
	b=ip1x+H3xoIVDqHk4i/J7SbOkaxB+SMrPC0ueCB/tRq4jTCOEVdGMmFYUxs1l8FNKnCCEIcHJgxMFZ59aDlYluplOLOpy0A5lU/V8x4CE+08dGMYbGNIx/sQbgeIcFNbse0v0ownUYjt0Jzp2n5x0NxLR8snGGgUVzGtFCCsirYI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:3924bc90-2013-4494-a315-637daed26294,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:15819a90-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 90888a22e66311eeacdb61a41848c7d2-20240319
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1663561260; Tue, 19 Mar 2024 19:42:59 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 10:42:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 10:42:26 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Hsiao Chien Sung
	<shawn.sung@mediatek.corp-partner.google.com>
Subject: [PATCH v3 14/14] drm/mediatek: Rename mtk_ddp_comp functions
Date: Wed, 20 Mar 2024 10:42:22 +0800
Message-ID: <20240320024222.14234-15-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320024222.14234-1-shawn.sung@mediatek.com>
References: <20240320024222.14234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_194307_125920_E2F08690 
X-CRM114-Status: GOOD (  15.51  )
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

From: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>

Rename functions of mtk_ddp_comp:
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 45 ++++++++++++++-----------
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  3 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c      |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c      |  2 +-
 4 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index c3441508f452f..17b0364112922 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -497,10 +497,10 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
 };

-static bool mtk_drm_find_comp_in_ddp(struct device *dev,
-				     const unsigned int *path,
-				     unsigned int path_len,
-				     struct mtk_ddp_comp *ddp_comp)
+static bool mtk_ddp_comp_find(struct device *dev,
+			      const unsigned int *path,
+			      unsigned int path_len,
+			      struct mtk_ddp_comp *ddp_comp)
 {
 	unsigned int i;

@@ -514,10 +514,10 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
 	return false;
 }

-static unsigned int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
-						       const struct mtk_drm_route *routes,
-						       unsigned int num_routes,
-						       struct mtk_ddp_comp *ddp_comp)
+static unsigned int mtk_ddp_comp_find_in_route(struct device *dev,
+					       const struct mtk_drm_route *routes,
+					       unsigned int num_routes,
+					       struct mtk_ddp_comp *ddp_comp)
 {
 	int ret;
 	unsigned int i;
@@ -554,26 +554,31 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }

-unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct device *dev)
+unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
 	unsigned int ret = 0;

-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
-				     private->ddp_comp))
+	if (mtk_ddp_comp_find(dev,
+			      private->data->main_path,
+			      private->data->main_len,
+			      private->ddp_comp))
 		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
+	else if (mtk_ddp_comp_find(dev,
+				   private->data->ext_path,
+				   private->data->ext_len,
+				   private->ddp_comp))
 		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
+	else if (mtk_ddp_comp_find(dev,
+				   private->data->third_path,
+				   private->data->third_len,
+				   private->ddp_comp))
 		ret = BIT(2);
 	else
-		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
-							 private->data->conn_routes,
-							 private->data->num_conn_routes,
-							 private->ddp_comp);
+		ret = mtk_ddp_comp_find_in_route(dev,
+						 private->data->conn_routes,
+						 private->data->num_conn_routes,
+						 private->ddp_comp);

 	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index ba985206fdd24..26236691ce4c2 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -326,8 +326,7 @@ static inline void mtk_ddp_comp_encoder_index_set(struct mtk_ddp_comp *comp)

 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
-unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
-						struct device *dev);
+unsigned int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev);
 int mtk_ddp_comp_init(struct device_node *comp_node, struct mtk_ddp_comp *comp,
 		      unsigned int comp_id);
 enum mtk_ddp_comp_type mtk_ddp_comp_get_type(unsigned int comp_id);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index fbf63e0441337..bfe8653005dbf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -805,7 +805,7 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}

-	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->dev);
+	dpi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm_dev, dpi->dev);

 	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e29c37fb5be09..67239606adbfc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -836,7 +836,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		return ret;
 	}

-	dsi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
+	dsi->encoder.possible_crtcs = mtk_find_possible_crtcs(drm, dsi->host.dev);

 	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
--
2.18.0


