Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 07:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWI12b6ZCKC/poTKN72MRtrhvdDy8fAwuL3Jsn3gkqE=; b=MwZyEkRhg4auhc
	5V6kJUHXpa/b/sFbXKUeacKhWf9j3YAh5nqe5gnZFy/mTRqZWW37P+m6Xf1xECdv+f1fmUdOjvv8P
	FF9JZdgWCNhqq5hT6FxWWE6kCHb9GmY7jBOa1Nv9sN7KwFht/1WXNJqQvwA5/l3yMtB2Bo5pUYfZ9
	4OvwCE+Jl1M0oROD1Q/aQVIqxttKAnNNxF4uCpJvkEBoLRSbaFlu4wodPc1EstU4F+N9GRK78IFsC
	WR8m9Hr0uaXv9oIjh7DfOBr+NzlZnDcdlXFEpTROswq3LLCOpJGT20CmAWJx/ZqcU3eW56ns7ro+3
	ODAq5v8rRY3enTTQbpdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBBGO-00GkZh-QS; Sat, 22 Jan 2022 07:56:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBBG1-00GkQt-Q1; Sat, 22 Jan 2022 07:56:23 +0000
X-UUID: 065d725983994ea9be205b13cc10b26e-20220122
X-UUID: 065d725983994ea9be205b13cc10b26e-20220122
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 552257202; Sat, 22 Jan 2022 00:56:17 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 Jan 2022 23:56:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 22 Jan 2022 15:56:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 22 Jan 2022 15:56:12 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Steve Cho <stevecho@chromium.org>, 
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1, 3/3] mtk-vcodec: add h264 decoder driver for mt8186
Date: Sat, 22 Jan 2022 15:56:06 +0800
Message-ID: <20220122075606.19373-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122075606.19373-1-yunfei.dong@mediatek.com>
References: <20220122075606.19373-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_235621_884166_2114336A 
X-CRM114-Status: GOOD (  22.62  )
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

Add h264 decode driver to support mt8186. For the architecture
is single core, need to add new interface to decode.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mtk-vcodec/vdec/vdec_h264_req_multi_if.c  | 164 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   5 +-
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 3 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
index 1567dbc63e95..5541edbafed2 100644
--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_multi_if.c
@@ -137,6 +137,9 @@ struct vdec_h264_slice_share_info {
  * @vsi                 : vsi used for lat
  * @vsi_core            : vsi used for core
  *
+ * @vsi_ctx  : Local VSI data for this decoding context
+ * @h264_slice_param : the parameters that hardware use to decode
+ *
  * @resolution_changed  : resolution changed
  * @realloc_mv_buf      : reallocate mv buffer
  * @cap_num_planes      : number of capture queue plane
@@ -152,6 +155,9 @@ struct vdec_h264_slice_inst {
 	struct vdec_h264_slice_vsi *vsi;
 	struct vdec_h264_slice_vsi *vsi_core;
 
+	struct vdec_h264_slice_vsi vsi_ctx;
+	struct vdec_h264_slice_lat_dec_param h264_slice_param;
+
 	unsigned int resolution_changed;
 	unsigned int realloc_mv_buf;
 	unsigned int cap_num_planes;
@@ -196,6 +202,61 @@ static int vdec_h264_slice_fill_decode_parameters(struct vdec_h264_slice_inst *i
 	return 0;
 }
 
+static int get_vdec_sig_decode_parameters(struct vdec_h264_slice_inst *inst)
+{
+	const struct v4l2_ctrl_h264_decode_params *dec_params;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
+	struct vdec_h264_slice_lat_dec_param *slice_param = &inst->h264_slice_param;
+	struct v4l2_h264_reflist_builder reflist_builder;
+	u8 *p0_reflist = slice_param->decode_params.ref_pic_list_p0;
+	u8 *b0_reflist = slice_param->decode_params.ref_pic_list_b0;
+	u8 *b1_reflist = slice_param->decode_params.ref_pic_list_b1;
+
+	dec_params =
+		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_DECODE_PARAMS);
+	if (IS_ERR(dec_params))
+		return PTR_ERR(dec_params);
+
+	sps = mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SPS);
+	if (IS_ERR(sps))
+		return PTR_ERR(sps);
+
+	pps = mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_PPS);
+	if (IS_ERR(pps))
+		return PTR_ERR(pps);
+
+	scaling_matrix =
+		mtk_vdec_h264_get_ctrl_ptr(inst->ctx, V4L2_CID_STATELESS_H264_SCALING_MATRIX);
+	if (IS_ERR(scaling_matrix))
+		return PTR_ERR(scaling_matrix);
+
+	mtk_vdec_h264_update_dpb(dec_params, inst->dpb);
+
+	mtk_vdec_h264_copy_sps_params(&slice_param->sps, sps);
+	mtk_vdec_h264_copy_pps_params(&slice_param->pps, pps);
+	mtk_vdec_h264_copy_scaling_matrix(&slice_param->scaling_matrix, scaling_matrix);
+
+	mtk_vdec_h264_copy_decode_params(&slice_param->decode_params, dec_params, inst->dpb);
+	mtk_vdec_h264_fill_dpb_info(inst->ctx, &slice_param->decode_params,
+				    slice_param->h264_dpb_info);
+
+	/* Build the reference lists */
+	v4l2_h264_init_reflist_builder(&reflist_builder, dec_params, sps, inst->dpb);
+	v4l2_h264_build_p_ref_list(&reflist_builder, p0_reflist);
+
+	v4l2_h264_build_b_ref_lists(&reflist_builder, b0_reflist, b1_reflist);
+	/* Adapt the built lists to the firmware's expectations */
+	mtk_vdec_h264_fixup_ref_list(p0_reflist, reflist_builder.num_valid);
+	mtk_vdec_h264_fixup_ref_list(b0_reflist, reflist_builder.num_valid);
+	mtk_vdec_h264_fixup_ref_list(b1_reflist, reflist_builder.num_valid);
+	memcpy(&inst->vsi_ctx.h264_slice_params, slice_param,
+	       sizeof(inst->vsi_ctx.h264_slice_params));
+
+	return 0;
+}
+
 static void vdec_h264_slice_fill_decode_reflist(struct vdec_h264_slice_inst *inst,
 						struct vdec_h264_slice_lat_dec_param *slice_param,
 						struct vdec_h264_slice_share_info *share_info)
@@ -584,6 +645,102 @@ static int vdec_h264_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	return err;
 }
 
+static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
+					 struct vdec_fb *unused, bool *res_chg)
+{
+	struct vdec_h264_slice_inst *inst = (struct vdec_h264_slice_inst *)h_vdec;
+	struct vdec_vpu_inst *vpu = &inst->vpu;
+	struct mtk_video_dec_buf *src_buf_info, *dst_buf_info;
+	struct vdec_fb *fb;
+	unsigned char *buf;
+	unsigned int nal_start_idx, data[2], i;
+	u64 y_fb_dma, c_fb_dma;
+	struct mtk_vcodec_mem *mem;
+	int err;
+
+	/* bs NULL means flush decoder */
+	if (!bs)
+		return vpu_dec_reset(vpu);
+
+	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
+	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+
+	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+	mtk_vcodec_debug(inst, "+ [%d] FB y_dma=%llx c_dma=%llx va=0x%llx",
+			 inst->ctx->decoded_frame_cnt, y_fb_dma, c_fb_dma, (u64)fb);
+
+	inst->vsi_ctx.dec.bs_buf_addr = (u64)bs->dma_addr;
+	inst->vsi_ctx.dec.bs_buf_size = bs->size;
+	inst->vsi_ctx.dec.y_fb_dma = y_fb_dma;
+	inst->vsi_ctx.dec.c_fb_dma = c_fb_dma;
+	inst->vsi_ctx.dec.vdec_fb_va = (u64)(uintptr_t)fb;
+
+	v4l2_m2m_buf_copy_metadata(&src_buf_info->m2m_buf.vb,
+				   &dst_buf_info->m2m_buf.vb, true);
+	err = get_vdec_sig_decode_parameters(inst);
+	if (err)
+		goto err_free_fb_out;
+
+	buf = (unsigned char *)bs->va;
+	nal_start_idx = mtk_vdec_h264_find_start_code(buf, bs->size);
+	if (nal_start_idx < 0) {
+		err = -EINVAL;
+		goto err_free_fb_out;
+	}
+	inst->vsi_ctx.dec.nal_info = buf[nal_start_idx];
+
+	*res_chg = inst->resolution_changed;
+	if (inst->resolution_changed) {
+		mtk_vcodec_debug(inst, "- resolution changed -");
+		if (inst->realloc_mv_buf) {
+			err = vdec_h264_slice_alloc_mv_buf(inst, &inst->ctx->picinfo);
+			inst->realloc_mv_buf = false;
+			if (err)
+				goto err_free_fb_out;
+		}
+		inst->resolution_changed = false;
+
+		for (i = 0; i < H264_MAX_MV_NUM; i++) {
+			mem = &inst->mv_buf[i];
+			inst->vsi_ctx.mv_buf_dma[i] = mem->dma_addr;
+		}
+	}
+
+	memcpy(inst->vpu.vsi, &inst->vsi_ctx, sizeof(inst->vsi_ctx));
+	err = vpu_dec_start(vpu, data, 2);
+	if (err)
+		goto err_free_fb_out;
+
+	/* wait decoder done interrupt */
+	err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+	if (err)
+		mtk_vcodec_err(inst, "core decode timeout: pic_%d",
+			       inst->ctx->decoded_frame_cnt);
+
+	inst->vsi->dec.timeout = !!err;
+	err = vpu_dec_end(vpu);
+	if (err)
+		goto err_free_fb_out;
+
+	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
+	mtk_vcodec_debug(inst, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
+			 inst->ctx->decoded_frame_cnt,
+			 inst->vsi_ctx.dec.crc[0], inst->vsi_ctx.dec.crc[1],
+			 inst->vsi_ctx.dec.crc[2], inst->vsi_ctx.dec.crc[3],
+			 inst->vsi_ctx.dec.crc[4], inst->vsi_ctx.dec.crc[5],
+			 inst->vsi_ctx.dec.crc[6], inst->vsi_ctx.dec.crc[7]);
+err_free_fb_out:
+	inst->ctx->dev->vdec_pdata->cap_to_disp(inst->ctx, fb, err);
+	mtk_vcodec_debug(inst, "dec frame number: %d err: %d",
+			 inst->ctx->decoded_frame_cnt, err);
+	inst->ctx->decoded_frame_cnt++;
+
+	return err;
+}
+
 static int vdec_h264_slice_get_param(void *h_vdec, enum vdec_get_param_type type,
 				     void *out)
 {
@@ -612,3 +769,10 @@ const struct vdec_common_if vdec_h264_slice_lat_if = {
 	.get_param	= vdec_h264_slice_get_param,
 	.deinit		= vdec_h264_slice_deinit,
 };
+
+const struct vdec_common_if vdec_h264_slice_single_if = {
+	.init		= vdec_h264_slice_init,
+	.decode		= vdec_h264_slice_single_decode,
+	.get_param	= vdec_h264_slice_get_param,
+	.deinit		= vdec_h264_slice_deinit,
+};
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
index 2d3a45781359..e22b577d692a 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.c
@@ -21,7 +21,10 @@ int vdec_if_init(struct mtk_vcodec_ctx *ctx, unsigned int fourcc)
 	switch (fourcc) {
 	case V4L2_PIX_FMT_H264_SLICE:
 		if (ctx->dev->vdec_pdata->hw_arch == MTK_VDEC_PURE_SINGLE_CORE) {
-			ctx->dec_if = &vdec_h264_slice_if;
+			if (ctx->dev->vdec_pdata->is_subdev_supported)
+				ctx->dec_if = &vdec_h264_slice_single_if;
+			else
+				ctx->dec_if = &vdec_h264_slice_if;
 			ctx->hw_id = MTK_VDEC_CORE;
 		} else {
 			ctx->dec_if = &vdec_h264_slice_lat_if;
diff --git a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
index e383a04db7b8..991c04e65c79 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_drv_if.h
@@ -57,6 +57,7 @@ struct vdec_fb_node {
 extern const struct vdec_common_if vdec_h264_if;
 extern const struct vdec_common_if vdec_h264_slice_if;
 extern const struct vdec_common_if vdec_h264_slice_lat_if;
+extern const struct vdec_common_if vdec_h264_slice_single_if;
 extern const struct vdec_common_if vdec_vp8_if;
 extern const struct vdec_common_if vdec_vp8_slice_if;
 extern const struct vdec_common_if vdec_vp9_if;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
