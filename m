Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A50EE49A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm7g/thWykv57yF1g11/Vg9VGJO2JD1usyyb7N1oxFM=; b=Q5rkXOcY/p63YhRe4nLfN0rI1K
	ZHiIQM5o1KFU2Vc1edjupDDQFvv6FqlHIMpLKbKdPkm4FLzGgQIBoIiDRhmEQ3YD8ClOtCBnx5mOS
	xUg2i2l8dFFXFAF2UOBZczJqJwfWa7MLTKJRF726/B1ssBoMQel+jikqKmUJWEGdFQLzJhDnLbWOh
	HTs4IF400vOAJ2MJZ9i/1lfDLBnCoVoL3/PzZB8+osoPGbQ3ZNqkspOOpDEm4/p9Zuq6CEiaBtJeR
	D1Hqtdg3CS28NYFEuvo4hexCgFt2FPkQY2fL/sn6b3p+XvHAJ9OUEoMQfLcAv5wXH1bN1jxV/NSUx
	C9lYQaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpZ0-000wEa-2E;
	Wed, 23 Aug 2023 15:14:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpYc-000w0A-1M;
	Wed, 23 Aug 2023 15:14:09 +0000
X-UUID: ae1fdfa441c711ee912e1518a6540028-20230823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Lm7g/thWykv57yF1g11/Vg9VGJO2JD1usyyb7N1oxFM=;
	b=kmRkJ2ifXcKISIAyc9c+PbgKNVe+iipvqY8IUP9W5vNIBwcQRBkP6KeLBwJ7Pi6gCXtzBmfI5rIMIIXTFnWNpwlwNoqOdjv/nRnW9J6jo1AXnNxc145M0ClSgZQc7J/kqskOhvIaxVRrBC8fY1Pkyxf443rFwjvNoFkb+dtxU0U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:1fa25b8e-aadd-4539-a6c9-0208cffeded0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.31,REQID:1fa25b8e-aadd-4539-a6c9-0208cffeded0,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:0ad78a4,CLOUDID:2a6bddee-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:2308232313594RSAV9C8,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM,TF_CID_SPAM_ASC
X-UUID: ae1fdfa441c711ee912e1518a6540028-20230823
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 585881428; Wed, 23 Aug 2023 08:13:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Aug 2023 23:13:54 +0800
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
Subject: [PATCH 10/15] drm/mediatek: Support CRC in display driver
Date: Wed, 23 Aug 2023 23:13:27 +0800
Message-ID: <20230823151332.28811-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230823151332.28811-1-shawn.sung@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_081406_466055_C89832EB 
X-CRM114-Status: GOOD (  20.87  )
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

Register CRC related function pointers to support CRC
retrieval.

Skip the first CRC because when the first vblank triggered,
the frame buffer is not ready for CRC calculation yet.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 53 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     | 20 ++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  5 ++
 3 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index e8313739b54d..0fa713c550b1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -573,6 +573,17 @@ static void mtk_crtc_ddp_irq(void *data)
 	struct drm_crtc *crtc = data;
 	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
+	static int skip;
+
+	if (mtk_crtc->crc.cnt && crtc->crc.opened) {
+		if (++skip > 1) {
+			drm_crtc_add_crc_entry(crtc, true,
+					       drm_crtc_vblank_count(crtc),
+					       (u32 *)mtk_crtc->crc.va);
+		}
+	} else {
+		skip = 0;
+	}
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
@@ -605,6 +616,34 @@ static void mtk_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 	mtk_ddp_comp_disable_vblank(comp);
 }
 
+static int mtk_drm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src)
+{
+	if (src && strcmp(src, "auto") != 0) {
+		DRM_DEBUG_DRIVER("%s(crtc-%d): unknown source '%s'\n",
+				 __func__, drm_crtc_index(crtc), src);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mtk_drm_crtc_verify_crc_source(struct drm_crtc *crtc,
+					  const char *src,
+					  size_t *cnt)
+{
+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
+
+	if (src && strcmp(src, "auto") != 0) {
+		DRM_DEBUG_DRIVER("%s(crtc-%d): unknown source '%s'\n",
+				 __func__, drm_crtc_index(crtc), src);
+		return -EINVAL;
+	}
+
+	*cnt = (size_t)mtk_crtc->crc.cnt;
+
+	return 0;
+}
+
 int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
 			     struct mtk_plane_state *state)
 {
@@ -737,6 +776,8 @@ static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.atomic_destroy_state	= mtk_drm_crtc_destroy_state,
 	.enable_vblank		= mtk_drm_crtc_enable_vblank,
 	.disable_vblank		= mtk_drm_crtc_disable_vblank,
+	.set_crc_source		= mtk_drm_crtc_set_crc_source,
+	.verify_crc_source	= mtk_drm_crtc_verify_crc_source,
 };
 
 static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
@@ -919,6 +960,18 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 			if (comp->funcs->ctm_set)
 				has_ctm = true;
+
+			if (comp->funcs->crc_cnt) {
+				mtk_crtc->crc.cnt = comp->funcs->crc_cnt(comp->dev);
+				mtk_crtc->crc.va = dma_alloc_coherent(dev,
+								      mtk_crtc->crc.cnt * 4,
+								      &mtk_crtc->crc.pa,
+								      GFP_KERNEL);
+				if (!mtk_crtc->crc.va || !mtk_crtc->crc.pa) {
+					dev_err(dev, "failed to allocate CRC\n");
+					return -ENOMEM;
+				}
+			}
 		}
 
 		mtk_ddp_comp_register_vblank_cb(comp, mtk_crtc_ddp_irq,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 34cd1bfed8b3..8303464f494c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -14,6 +14,23 @@
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
+/*
+ * struct mtk_drm_crc - CRC info of the CRTC
+ * @cnt: how many CRCs the CRTC supports
+ * @va: virtual address for CPU to read the CRCs
+ * @pa: physical address for GCE to stored the CRCs
+ *
+ * Hardware components could generate more than one CRC,
+ * for example, one for odd lines, another for even lines of the frame buffer,
+ * and each CRC takes 4 bytes in memory, here we record how many CRC the
+ * generator supports, and access them as an array from the specified address.
+ */
+struct mtk_drm_crc {
+	u32 cnt;
+	void *va;
+	dma_addr_t pa;
+};
+
 /*
  * struct mtk_drm_crtc - MediaTek specific crtc structure.
  * @base: crtc object.
@@ -24,6 +41,7 @@
  * @mutex: handle to one of the ten disp_mutex streams
  * @ddp_comp_nr: number of components in ddp_comp
  * @ddp_comp: array of pointers the mtk_ddp_comp structures used by this crtc
+ * @crc: CRC info of the CRTC
  *
  * TODO: Needs update: this header is missing a bunch of member descriptions.
  */
@@ -56,6 +74,8 @@ struct mtk_drm_crtc {
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
+
+	struct mtk_drm_crc		crc;
 };
 
 void mtk_drm_crtc_commit(struct drm_crtc *crtc);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index febcaeef16a1..3b67c3dc0525 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -45,6 +45,10 @@ enum mtk_ddp_comp_type {
 
 struct mtk_ddp_comp;
 struct cmdq_pkt;
+
+/* struct mtk_ddp_comp_funcs - function pointers of the ddp components
+ * @crc_cnt: how many CRCs the component supports
+ */
 struct mtk_ddp_comp_funcs {
 	int (*clk_enable)(struct device *dev);
 	void (*clk_disable)(struct device *dev);
@@ -80,6 +84,7 @@ struct mtk_ddp_comp_funcs {
 	void (*disconnect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
 	void (*add)(struct device *dev, struct mtk_mutex *mutex);
 	void (*remove)(struct device *dev, struct mtk_mutex *mutex);
+	u32 (*crc_cnt)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
-- 
2.18.0


