Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4139BC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 01:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6qlv/T9mCY/kRP7L6PBaKUMXvMuRth9oyIwujiopfI=; b=Rqv9DPMNKOLSm+j5Ozs822rtjT
	2QMQFPAopYNvqAVmavCpmpNeUXs1NkPyXMSle1CvvPSQsnkaeY/Tbh5MycdQGrFG6V1s62kpSDQEC
	LYgq05asMtM/71JeyUWOvOjV7OMbcbURmzabb55JrLwtTgbOrj6EWB2eDqbTPFD8UcSmolz3DfzSq
	tr8mK7XRDOJBmirwmtZ1kNVJjPZDa6I+S2yilUOzwgweCexXQ09ulDSCsLXxxjaAyb+I3v5PXO2Ov
	IUMGl798K6/rl4qnY8H+AIV3/GyYxTVLw3i2LNTHOobVJ6NphIuMvVvc+fcKgDLru8J3AG+jzEr4g
	aM4nkc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnTrx-00000005QJw-1eeS;
	Fri, 22 Mar 2024 01:38:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnTru-00000005QJ4-1UQA;
	Fri, 22 Mar 2024 01:38:51 +0000
X-UUID: ebccec0ee7ec11ee9aa9374d6d45775a-20240321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=i6qlv/T9mCY/kRP7L6PBaKUMXvMuRth9oyIwujiopfI=;
	b=RYqwjLzKVhRTzfuBjx1iF4zRgd12NboLKtkmFLUCd/6robS5TmNkR+eY3GJUlLaiajlMA0ZEXu+RykUdDuzhfsEqhBz0ib6cyWKHC4UttvTwcY8X5vs2M1dJxxHGa8dLjxJDX6Zzm4rFRkiwjjvWE43BELbbkt+lVcvVCONcWvA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:582e0959-9068-4c01-a96b-f523aadc865b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:a9cbc981-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ebccec0ee7ec11ee9aa9374d6d45775a-20240321
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 116853317; Thu, 21 Mar 2024 18:38:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Mar 2024 09:28:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Mar 2024 09:28:09 +0800
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
Subject: [PATCH v4 02/14] drm/mediatek: Rename "mtk_drm_ddp_comp" to "mtk_ddp_comp"
Date: Fri, 22 Mar 2024 09:27:56 +0800
Message-ID: <20240322012808.26234-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240322012808.26234-1-shawn.sung@mediatek.com>
References: <20240322012808.26234-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_183850_513609_DE468F0A 
X-CRM114-Status: GOOD (  13.21  )
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
index 71e20e8fc4ab8..0f2e1be4ee1cb 100644
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


