Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4341AC54E71
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 02:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCgNnMs+fUma9AIr1NWht5+HBXZQppX/+/24NA0cvIs=; b=pMdev5bhg8KFh2DIQywFMfwDJH
	Ol0CYJlrBHpBetH8NcigN/Wf2szl34oqAQC/o9BsiaLyjBphJvobSpvBZVZA0yM0z3fZQWIIFuWS/
	9nw0nz7imCImB1i9W7EcgxnVbZ1qumKk491e88SVOi++m9DGaNRLVhX5/QvksNoO2/cub7TpYD3bP
	rZ0XBJmA73oddQYucxJ4KDHCQGiTnNsLEHL7KfjL8PShBBZiM13HvjP3kf+JTra5BEiyy2UW3iSoC
	lyzXVi/vLQT/k2SjMXjsVJAAo3hLV3BqSdDt4JPxelUzTqdHJTn3nUH4bQKQISZQx0IhvGBoxInnl
	wZzx5DqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlvQ-0000000F6HK-48nc;
	Wed, 20 Mar 2024 02:43:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlux-0000000F5sI-0Bnh;
	Wed, 20 Mar 2024 02:43:05 +0000
X-UUID: 900683a6e66311ee9aa9374d6d45775a-20240319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GCgNnMs+fUma9AIr1NWht5+HBXZQppX/+/24NA0cvIs=;
	b=SmLU4PEwEpNZJaJr97L/+YLxwOYk+A6iPshSoA2iCzDn1342AQ0TN3TJKexNQCA3/vs1TKff0YDbaNFfmPO/wIFtCA64FAgauz02NdivhI4uabuV9Bmku5XMPzFWaYBa8dP5CdvWrs0tXP7ITwHV8lnFex4yr6QynBhI5JiaB+E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:02858409-dbee-47cf-b0a0-f6d352df2ce0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:30501800-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 900683a6e66311ee9aa9374d6d45775a-20240319
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1786256778; Tue, 19 Mar 2024 19:42:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 10:42:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 10:42:24 +0800
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
Subject: [PATCH v3 02/14] drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
Date: Wed, 20 Mar 2024 10:42:10 +0800
Message-ID: <20240320024222.14234-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320024222.14234-1-shawn.sung@mediatek.com>
References: <20240320024222.14234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_194303_279028_018E1E2A 
X-CRM114-Status: GOOD (  13.55  )
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

Rename all "mtk_drm_ddp_comp" to "mtk_ddp_comp":
- To align the naming rule
- To reduce the code size

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 16 +++++++---------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  6 +++---
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 8a4b68898c601..16a6fc0bbdc9e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -278,9 +278,9 @@ static void mtk_crtc_ddp_clk_disable(struct mtk_crtc *mtk_crtc)
 }
 
 static
-struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
-						struct drm_plane *plane,
-						unsigned int *local_layer)
+struct mtk_ddp_comp *mtk_ddp_comp_for_plane(struct drm_crtc *crtc,
+					    struct drm_plane *plane,
+					    unsigned int *local_layer)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_ddp_comp *comp;
@@ -430,7 +430,7 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk_crtc)
 
 		/* should not enable layer before crtc enabled */
 		plane_state->pending.enable = false;
-		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
+		comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 		if (comp)
 			mtk_ddp_comp_layer_config(comp, local_layer,
 						  plane_state, NULL);
@@ -521,8 +521,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 			if (!plane_state->pending.config)
 				continue;
 
-			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
-							  &local_layer);
+			comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
@@ -546,8 +545,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 			if (!plane_state->pending.async_config)
 				continue;
 
-			comp = mtk_drm_ddp_comp_for_plane(crtc, plane,
-							  &local_layer);
+			comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 
 			if (comp)
 				mtk_ddp_comp_layer_config(comp, local_layer,
@@ -711,7 +709,7 @@ int mtk_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 	unsigned int local_layer;
 	struct mtk_ddp_comp *comp;
 
-	comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
+	comp = mtk_ddp_comp_for_plane(crtc, plane, &local_layer);
 	if (comp)
 		return mtk_ddp_comp_layer_check(comp, local_layer, state);
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 93d79a1366e91..ba985206fdd24 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
-#ifndef MTK_DRM_DDP_COMP_H
-#define MTK_DRM_DDP_COMP_H
+#ifndef MTK_DDP_COMP_H
+#define MTK_DDP_COMP_H
 
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
@@ -340,4 +340,4 @@ void mtk_ddp_write_relaxed(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
 			struct cmdq_client_reg *cmdq_reg, void __iomem *regs,
 			unsigned int offset, unsigned int mask);
-#endif /* MTK_DRM_DDP_COMP_H */
+#endif /* MTK_DDP_COMP_H */
-- 
2.18.0


