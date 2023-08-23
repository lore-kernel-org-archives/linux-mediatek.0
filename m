Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65136EE49B6
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHrkZ/XQC+sbArt0Sl5RH/82zRMPUVzswRiB228gF4U=; b=Mblk6UaF3HMhfVVCTXlD/NmkAZ
	jJ7/6gZbVJHiiCvbsDHvf6brTzyobiPmmyla0DjugxOKTx4cu2ElSz0tUeZp7Hr4RFVLcyC+wC6wI
	MVd//+2v/u6Bwt2YJtPp9cAiJEBoUm4elG0mH9kkzt/DxxeI/gLNQuX2MhznOM/5U/K0DRpYX7Vxa
	aJY9ek8v6iTBm52HK4Q+hE32oK5mxm8y8ac5AvjWq84TYk1rN3qsjw6KDN/jyPxrI4onfn+0jVX6O
	VTovHVxdzlClwoQcw+Ob16GUgFP2sr32xQKHc0w8d5yH43nUx+epG4onCukBgM5L7OarAyKtoTqJ+
	McZGBOHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpZB-000wMR-0n;
	Wed, 23 Aug 2023 15:14:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpYc-000vxm-34;
	Wed, 23 Aug 2023 15:14:11 +0000
X-UUID: ad74d26c41c711ee912e1518a6540028-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uHrkZ/XQC+sbArt0Sl5RH/82zRMPUVzswRiB228gF4U=;
	b=Hv8LvjWt43LfCmIBTAJa8MnSNZjRNV2upISgRitiM1RqDJ9prtEPAAyzst/dhIzWQ5SYaXIEpKwMW2cZPnoqzge705zGMSY6HaeJG4TY3Yo/HZuAbOWrH9Yt+6d5y7VWPes/avQqIj0Ahe3J0PQCdXmAQC4I2n+HfDT/AJSjcDE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:44212033-de40-43ac-a7b7-af67d69b1200,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.31,REQID:44212033-de40-43ac-a7b7-af67d69b1200,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:0ad78a4,CLOUDID:9a04ab1f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:230823231356O6CNJAW2,BulkQuantity:0,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC
X-UUID: ad74d26c41c711ee912e1518a6540028-20230823
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1942120599; Wed, 23 Aug 2023 08:13:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 23:13:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Aug 2023 23:13:53 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jassi
 Brar <jassisinghbrar@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Jason-JH Lin
	<jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH 08/15] drm/mediatek: Move struct mtk_drm_crtc to the header file
Date: Wed, 23 Aug 2023 23:13:25 +0800
Message-ID: <20230823151332.28811-9-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230823151332.28811-1-shawn.sung@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_081406_991677_475C6A64 
X-CRM114-Status: GOOD (  16.94  )
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

Move the struct from mtk_drm_crtc.c to mtk_drm_crtc.h
so it can be referenced in other files.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 44 -------------------------
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h | 44 +++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index d40142842f85..e8313739b54d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -24,50 +24,6 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-/*
- * struct mtk_drm_crtc - MediaTek specific crtc structure.
- * @base: crtc object.
- * @enabled: records whether crtc_enable succeeded
- * @planes: array of 4 drm_plane structures, one for each overlay plane
- * @pending_planes: whether any plane has pending changes to be applied
- * @mmsys_dev: pointer to the mmsys device for configuration registers
- * @mutex: handle to one of the ten disp_mutex streams
- * @ddp_comp_nr: number of components in ddp_comp
- * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
- *
- * TODO: Needs update: this header is missing a bunch of member descriptions.
- */
-struct mtk_drm_crtc {
-	struct drm_crtc			base;
-	bool				enabled;
-
-	bool				pending_needs_vblank;
-	struct drm_pending_vblank_event	*event;
-
-	struct drm_plane		*planes;
-	unsigned int			layer_nr;
-	bool				pending_planes;
-	bool				pending_async_planes;
-
-#if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	struct cmdq_client		cmdq_client;
-	struct cmdq_pkt			cmdq_handle;
-	u32				cmdq_event;
-	u32				cmdq_vblank_cnt;
-	wait_queue_head_t		cb_blocking_queue;
-#endif
-
-	struct device			*mmsys_dev;
-	struct device			*dma_dev;
-	struct mtk_mutex		*mutex;
-	unsigned int			ddp_comp_nr;
-	struct mtk_ddp_comp		**ddp_comp;
-
-	/* lock for display hardware access */
-	struct mutex			hw_lock;
-	bool				config_updating;
-};
-
 struct mtk_crtc_state {
 	struct drm_crtc_state		base;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 3e9046993d09..34cd1bfed8b3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -14,6 +14,50 @@
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
+/*
+ * struct mtk_drm_crtc - MediaTek specific crtc structure.
+ * @base: crtc object.
+ * @enabled: records whether crtc_enable succeeded
+ * @planes: array of 4 drm_plane structures, one for each overlay plane
+ * @pending_planes: whether any plane has pending changes to be applied
+ * @mmsys_dev: pointer to the mmsys device for configuration registers
+ * @mutex: handle to one of the ten disp_mutex streams
+ * @ddp_comp_nr: number of components in ddp_comp
+ * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
+ *
+ * TODO: Needs update: this header is missing a bunch of member descriptions.
+ */
+struct mtk_drm_crtc {
+	struct drm_crtc			base;
+	bool				enabled;
+
+	bool				pending_needs_vblank;
+	struct drm_pending_vblank_event	*event;
+
+	struct drm_plane		*planes;
+	unsigned int			layer_nr;
+	bool				pending_planes;
+	bool				pending_async_planes;
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	struct cmdq_client		cmdq_client;
+	struct cmdq_pkt			cmdq_handle;
+	u32				cmdq_event;
+	u32				cmdq_vblank_cnt;
+	wait_queue_head_t		cb_blocking_queue;
+#endif
+
+	struct device			*mmsys_dev;
+	struct device			*dma_dev;
+	struct mtk_mutex		*mutex;
+	unsigned int			ddp_comp_nr;
+	struct mtk_ddp_comp		**ddp_comp;
+
+	/* lock for display hardware access */
+	struct mutex			hw_lock;
+	bool				config_updating;
+};
+
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
 int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			const unsigned int *path,
-- 
2.18.0


