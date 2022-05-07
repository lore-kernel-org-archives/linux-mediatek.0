Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD93C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 02:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hItK5mwacF4oT3+ZobihjKc4bQmdN2t+S20ppcAO5zs=; b=rOM+dNuyASSZ22
	skBRjBs9asM1Vp8U4xNK5FfiU6RwVGpZNfVW6D1mEzSNz7WLZLA5KKQzLg+x1NRatuCShAzmnXDjR
	BF2M8qBFVwF4OB9YjPsdwqnYV3ObbMDUayVZuxagLVhDcIRnxkz1LfIV0QyGyKyRg8FcH7MrkvlXP
	7xVP3SezKXl6yoP68mtolgM4hRvdhzkIbRyZIEOh+BNuf1id1I7PM1Zpnc+lKIWqcZz4UhfGkiEqy
	UaSFo5OcIuXB6IanXEW2etfViODgWNGLeapsjwxRNw/5ks91XlAtIbxTETwoZpEspdvLk5AWdR8Yb
	xgiDni6J5jaC8PYYeKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnACp-005l4O-IM; Sat, 07 May 2022 02:30:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnACe-005l1a-C6; Sat, 07 May 2022 02:29:54 +0000
X-UUID: 4fc526a05826438fac88b60adbf8a20c-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a5609694-6d63-4419-b2d6-4bc7c5ec9701, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:39ef8516-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4fc526a05826438fac88b60adbf8a20c-20220506
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 413610186; Fri, 06 May 2022 19:29:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 19:29:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 7 May 2022 10:29:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 7 May 2022 10:29:41 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] media: mediatek: vcodec: add vp9 decoder driver for mt8186
Date: Sat, 7 May 2022 10:29:40 +0800
Message-ID: <20220507022940.30439-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_192952_462699_915E10C8 
X-CRM114-Status: GOOD (  20.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add vp9 single core decode driver to support mt8186.

Signed-off-by: Mingjia Zhang <mingjia.zhang@mediatek.com>
Signed-off-by: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
This patch depends on "support mt8195 decoder"[1]

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20220507014618.29412-1-yunfei.dong@mediatek.com/
---
changed with v1:
- fix sparse and smatch check fail.
---
 .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 197 +++++++++++++++++-
 .../platform/mediatek/vcodec/vdec_drv_if.c    |   2 +-
 2 files changed, 195 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index 3ebdb3c29e0e..f4de6951269f 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -439,6 +439,8 @@ struct vdec_vp9_slice_ref {
  * @init_vsi:		vsi used for initialized VP9 instance
  * @vsi:		vsi used for decoding/flush ...
  * @core_vsi:		vsi used for Core stage
+ *
+ * @sc_pfc:		per frame context single core
  * @counts_map:	used map to counts_helper
  * @counts_helper:	counts table according to newest kernel spec
  */
@@ -487,6 +489,7 @@ struct vdec_vp9_slice_instance {
 	};
 	struct vdec_vp9_slice_vsi *core_vsi;
 
+	struct vdec_vp9_slice_pfc sc_pfc;
 	struct vdec_vp9_slice_counts_map counts_map;
 	struct v4l2_vp9_frame_symbol_counts counts_helper;
 };
@@ -693,6 +696,25 @@ static int vdec_vp9_slice_tile_offset(int idx, int mi_num, int tile_log2)
 	return offset < mi_num ? offset : mi_num;
 }
 
+static
+int vdec_vp9_slice_setup_single_from_src_to_dst(struct vdec_vp9_slice_instance *instance)
+{
+	struct vb2_v4l2_buffer *src;
+	struct vb2_v4l2_buffer *dst;
+
+	src = v4l2_m2m_next_src_buf(instance->ctx->m2m_ctx);
+	if (!src)
+		return -EINVAL;
+
+	dst = v4l2_m2m_next_dst_buf(instance->ctx->m2m_ctx);
+	if (!dst)
+		return -EINVAL;
+
+	v4l2_m2m_buf_copy_metadata(src, dst, true);
+
+	return 0;
+}
+
 static int vdec_vp9_slice_setup_lat_from_src_buf(struct vdec_vp9_slice_instance *instance,
 						 struct vdec_lat_buf *lat_buf)
 {
@@ -1568,6 +1590,33 @@ static int vdec_vp9_slice_update_prob(struct vdec_vp9_slice_instance *instance,
 	return 0;
 }
 
+static int vdec_vp9_slice_update_single(struct vdec_vp9_slice_instance *instance,
+				        struct vdec_vp9_slice_pfc *pfc)
+{
+	struct vdec_vp9_slice_vsi *vsi;
+
+	vsi = &pfc->vsi;
+	memcpy(&pfc->state[0], &vsi->state, sizeof(vsi->state));
+
+	mtk_vcodec_debug(instance, "Frame %u Y_CRC %08x %08x %08x %08x\n",
+			 pfc->seq,
+			 vsi->state.crc[0], vsi->state.crc[1],
+			 vsi->state.crc[2], vsi->state.crc[3]);
+	mtk_vcodec_debug(instance, "Frame %u C_CRC %08x %08x %08x %08x\n",
+			 pfc->seq,
+			 vsi->state.crc[4], vsi->state.crc[5],
+			 vsi->state.crc[6], vsi->state.crc[7]);
+
+	vdec_vp9_slice_update_prob(instance, vsi);
+
+	instance->width = vsi->frame.uh.frame_width;
+	instance->height = vsi->frame.uh.frame_height;
+	instance->frame_type = vsi->frame.uh.frame_type;
+	instance->show_frame = vsi->frame.uh.show_frame;
+
+	return 0;
+}
+
 static int vdec_vp9_slice_update_lat(struct vdec_vp9_slice_instance *instance,
 				     struct vdec_lat_buf *lat_buf,
 				     struct vdec_vp9_slice_pfc *pfc)
@@ -1691,6 +1740,40 @@ static int vdec_vp9_slice_setup_core_buffer(struct vdec_vp9_slice_instance *inst
 	return 0;
 }
 
+static void vdec_vp9_slice_setup_single_buffer(struct vdec_vp9_slice_instance *instance,
+					       struct vdec_vp9_slice_pfc *pfc,
+					       struct vdec_vp9_slice_vsi *vsi,
+					       struct mtk_vcodec_mem *bs,
+					       struct vdec_fb *fb)
+{
+	int i;
+
+	vsi->bs.buf.dma_addr = bs->dma_addr;
+	vsi->bs.buf.size = bs->size;
+	vsi->bs.frame.dma_addr = bs->dma_addr;
+	vsi->bs.frame.size = bs->size;
+
+	for (i = 0; i < 2; i++) {
+		vsi->mv[i].dma_addr = instance->mv[i].dma_addr;
+		vsi->mv[i].size = instance->mv[i].size;
+	}
+	for (i = 0; i < 2; i++) {
+		vsi->seg[i].dma_addr = instance->seg[i].dma_addr;
+		vsi->seg[i].size = instance->seg[i].size;
+	}
+	vsi->tile.dma_addr = instance->tile.dma_addr;
+	vsi->tile.size = instance->tile.size;
+	vsi->prob.dma_addr = instance->prob.dma_addr;
+	vsi->prob.size = instance->prob.size;
+	vsi->counts.dma_addr = instance->counts.dma_addr;
+	vsi->counts.size = instance->counts.size;
+
+	vsi->row_info.buf = 0;
+	vsi->row_info.size = 0;
+
+	vdec_vp9_slice_setup_core_buffer(instance, pfc, vsi, fb, NULL);
+}
+
 static int vdec_vp9_slice_setup_core(struct vdec_vp9_slice_instance *instance,
 				     struct vdec_fb *fb,
 				     struct vdec_lat_buf *lat_buf,
@@ -1717,6 +1800,43 @@ static int vdec_vp9_slice_setup_core(struct vdec_vp9_slice_instance *instance,
 	return ret;
 }
 
+static int vdec_vp9_slice_setup_single(struct vdec_vp9_slice_instance *instance,
+				       struct mtk_vcodec_mem *bs,
+				       struct vdec_fb *fb,
+				       struct vdec_vp9_slice_pfc *pfc)
+{
+	struct vdec_vp9_slice_vsi *vsi = &pfc->vsi;
+	int ret;
+
+	ret = vdec_vp9_slice_setup_single_from_src_to_dst(instance);
+	if (ret)
+		goto err;
+
+	ret = vdec_vp9_slice_setup_pfc(instance, pfc);
+	if (ret)
+		goto err;
+
+	ret = vdec_vp9_slice_alloc_working_buffer(instance, vsi);
+	if (ret)
+		goto err;
+
+	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
+	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
+
+	ret = vdec_vp9_slice_setup_prob_buffer(instance, vsi);
+	if (ret)
+		goto err;
+
+	ret = vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
+	if (ret)
+		goto err;
+
+	return 0;
+
+err:
+	return ret;
+}
+
 static int vdec_vp9_slice_update_core(struct vdec_vp9_slice_instance *instance,
 				      struct vdec_lat_buf *lat_buf,
 				      struct vdec_vp9_slice_pfc *pfc)
@@ -1814,8 +1934,8 @@ static int vdec_vp9_slice_flush(void *h_vdec, struct mtk_vcodec_mem *bs,
 	struct vdec_vp9_slice_instance *instance = h_vdec;
 
 	mtk_vcodec_debug(instance, "flush ...\n");
-
-	vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
+	if (instance->ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
+		vdec_msg_queue_wait_lat_buf_full(&instance->ctx->msg_queue);
 	return vpu_dec_reset(&instance->vpu);
 }
 
@@ -1868,6 +1988,63 @@ static int vdec_vp9_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
 	return 0;
 }
 
+static int vdec_vp9_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				        struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_vp9_slice_instance *instance = h_vdec;
+	struct vdec_vp9_slice_pfc *pfc = &(instance->sc_pfc);
+	struct vdec_vp9_slice_vsi *vsi;
+	struct mtk_vcodec_ctx *ctx;
+	int ret;
+
+	if (!instance || !instance->ctx)
+		return -EINVAL;
+	ctx = instance->ctx;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vdec_vp9_slice_flush(h_vdec, bs, fb, res_chg);
+
+	fb = ctx->dev->vdec_pdata->get_cap_buffer(ctx);
+	if (!fb)
+		return -EBUSY;
+
+	vsi = &pfc->vsi;
+
+	ret = vdec_vp9_slice_setup_single(instance, bs, fb, pfc);
+	if (ret) {
+		mtk_vcodec_err(instance, "Failed to setup VP9 single ret %d\n", ret);
+		return ret;
+	}
+	vdec_vp9_slice_vsi_to_remote(vsi, (void __iomem *)instance->vsi);
+
+	ret = vpu_dec_start(&instance->vpu, NULL, 0);
+	if (ret) {
+		mtk_vcodec_err(instance, "Failed to dec VP9 ret %d\n", ret);
+		return ret;
+	}
+
+	ret = mtk_vcodec_wait_for_done_ctx(ctx,	MTK_INST_IRQ_RECEIVED,
+					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	/* update remote vsi if decode timeout */
+	if (ret) {
+		mtk_vcodec_err(instance, "VP9 decode timeout %d\n", ret);
+		writel(1, (void __iomem *)&instance->vsi->state.timeout);
+	}
+
+	vpu_dec_end(&instance->vpu);
+
+	vdec_vp9_slice_vsi_from_remote(vsi, (void __iomem *)instance->vsi, 0);
+	ret = vdec_vp9_slice_update_single(instance, pfc);
+	if (ret) {
+		mtk_vcodec_err(instance, "VP9 decode error: %d\n", ret);
+		return ret;
+	}
+
+	instance->ctx->decoded_frame_cnt++;
+	return 0;
+}
+
 static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 				     struct vdec_fb *fb, bool *res_chg)
 {
@@ -1947,6 +2124,20 @@ static int vdec_vp9_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	return 0;
 }
 
+static int vdec_vp9_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+				 struct vdec_fb *fb, bool *res_chg)
+{
+	struct vdec_vp9_slice_instance *instance = h_vdec;
+	int ret;
+
+	if (instance->ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE)
+		ret = vdec_vp9_slice_single_decode(h_vdec, bs, fb, res_chg);
+	else
+		ret = vdec_vp9_slice_lat_decode(h_vdec, bs, fb, res_chg);
+
+	return ret;
+}
+
 static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 {
 	struct vdec_vp9_slice_instance *instance;
@@ -2025,7 +2216,7 @@ static int vdec_vp9_slice_core_decode(struct vdec_lat_buf *lat_buf)
 
 const struct vdec_common_if vdec_vp9_slice_lat_if = {
 	.init		= vdec_vp9_slice_init,
-	.decode		= vdec_vp9_slice_lat_decode,
+	.decode		= vdec_vp9_slice_decode,
 	.get_param	= vdec_vp9_slice_get_param,
 	.deinit		= vdec_vp9_slice_deinit,
 };
diff --git a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
index 27b4b35039cf..f3807f03d880 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec_drv_if.c
@@ -47,7 +47,7 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 		break;
 	case V4L2_PIX_FMT_VP9_FRAME:
 		ctx->dec_if = &vdec_vp9_slice_lat_if;
-		ctx->hw_id = MTK_VDEC_LAT0;
+		ctx->hw_id = IS_VDEC_LAT_ARCH(hw_arch) ? MTK_VDEC_LAT0 : MTK_VDEC_CORE;
 		break;
 	default:
 		return -EINVAL;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
