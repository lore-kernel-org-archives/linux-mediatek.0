Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE26C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 05:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1MzFk8lc6/YUjSeWq3VDxRVMnzh0RDulImm4y8TsGY=; b=RYMWemhSEuj3o5
	erdOfORLNixm54XhLmhv60i6WSxTFP5LEuw+5LPDvyjBjpTxZVaixhh0x5isVTBvSTB9GPtrnrzR4
	LoH8N9/ji4sY8NPSfgzB9t37tWdOTNUkHMYVVDA84PQAAG087nRziSbbH1RhMvrb9UFlRSHlB0Stc
	lZo2rA3drsB5hVhGwTgQdYPV5IkS/+aX00ZUc0v55WUt8+A9LGjDhSsBbs5ZMWewW8vvjkTBj+hZe
	h0g32O+UH8ur5ScOWbo28Kh586oPu7BJUTUt+eQufWZISiChx+L9qna/dkBtpJQuJFswr4BmgmbnX
	ArfR9HRDpLRtqb2rcThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt1Nd-00ESnG-3s; Fri, 03 Dec 2021 05:45:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt1N6-00ESZM-O2; Fri, 03 Dec 2021 05:44:38 +0000
X-UUID: 0db70f52fa9c40b49b6bde7686fe7137-20211202
X-UUID: 0db70f52fa9c40b49b6bde7686fe7137-20211202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 326807570; Thu, 02 Dec 2021 22:44:34 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 21:34:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 3 Dec 2021 13:34:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 3 Dec 2021 13:34:29 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <kyrie.wu@mediatek.com>, <irui.wang@mediatek.com>
Subject: [PATCH V1, 6/6] media: mtk-jpegdec: refactor jpegdec func interface
Date: Fri, 3 Dec 2021 13:34:15 +0800
Message-ID: <1638509655-14296-7-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
References: <1638509655-14296-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_214436_803395_262B4EA1 
X-CRM114-Status: GOOD (  16.56  )
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

refactor the func interface of mtk_jpeg_dec_set_config
for decode

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 28 ++++++++++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  1 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  | 55 ++++++++++++----------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |  7 +--
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h |  1 +
 5 files changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 2518660..22b6a4c 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -296,6 +296,31 @@ static int mtk_jpeg_try_fmt_mplane(struct v4l2_pix_format_mplane *pix_mp,
 	return 0;
 }
 
+static int mtk_jpeg_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
+{
+	struct v4l2_fh *fh = file->private_data;
+	struct mtk_jpeg_ctx *ctx = mtk_jpeg_fh_to_ctx(priv);
+	struct vb2_queue *vq;
+	struct vb2_buffer *vb;
+	struct mtk_jpeg_src_buf *jpeg_src_buf;
+
+	if (buf->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+		goto end;
+
+	vq = v4l2_m2m_get_vq(fh->m2m_ctx, buf->type);
+	if (buf->index >= vq->num_buffers) {
+		dev_err(ctx->jpeg->dev, "buffer index out of range\n");
+		return -EINVAL;
+	}
+
+	vb = vq->bufs[buf->index];
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(vb);
+	jpeg_src_buf->bs_size = buf->m.planes[0].bytesused;
+
+end:
+	return v4l2_m2m_qbuf(file, fh->m2m_ctx, buf);
+}
+
 static int mtk_jpeg_g_fmt_vid_mplane(struct file *file, void *priv,
 				     struct v4l2_format *f)
 {
@@ -620,7 +645,7 @@ static const struct v4l2_ioctl_ops mtk_jpeg_dec_ioctl_ops = {
 	.vidioc_g_fmt_vid_out_mplane    = mtk_jpeg_g_fmt_vid_mplane,
 	.vidioc_s_fmt_vid_cap_mplane    = mtk_jpeg_s_fmt_vid_cap_mplane,
 	.vidioc_s_fmt_vid_out_mplane    = mtk_jpeg_s_fmt_vid_out_mplane,
-	.vidioc_qbuf                    = v4l2_m2m_ioctl_qbuf,
+	.vidioc_qbuf                    = mtk_jpeg_qbuf,
 	.vidioc_subscribe_event         = mtk_jpeg_subscribe_event,
 	.vidioc_g_selection		= mtk_jpeg_dec_g_selection,
 
@@ -1218,6 +1243,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_dec_set_config(jpeg->reg_base,
 		&jpeg_src_buf->dec_param,
+		jpeg_src_buf->bs_size,
 		&bs, &fb);
 	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index d67c49f..90cdb3c 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -79,6 +79,7 @@ struct mtk_jpeg_variant {
 struct mtk_jpeg_src_buf {
 	struct vb2_v4l2_buffer b;
 	struct list_head list;
+	u32 bs_size;
 	struct mtk_jpeg_dec_param dec_param;
 
 	struct mtk_jpeg_ctx *curr_ctx;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index fad5bf1c..ec23e61 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -334,12 +334,14 @@ static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, u32 ptr)
 	writel(ptr, base + JPGDEC_REG_FILE_BRP);
 }
 
-static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size)
+static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size,
+				     u32 bitstream_size)
 {
 	mtk_jpeg_verify_align(addr, 16, JPGDEC_REG_FILE_ADDR);
 	mtk_jpeg_verify_align(size, 128, JPGDEC_REG_FILE_TOTAL_SIZE);
 	writel(addr, base + JPGDEC_REG_FILE_ADDR);
 	writel(size, base + JPGDEC_REG_FILE_TOTAL_SIZE);
+	writel(bitstream_size, base + JPGDEC_REG_BIT_STREAM_SIZE);
 }
 
 static void mtk_jpeg_dec_set_comp_id(void __iomem *base, u32 id_y, u32 id_u,
@@ -408,39 +410,40 @@ static void mtk_jpeg_dec_set_sampling_factor(void __iomem *base, u32 comp_num,
 }
 
 void mtk_jpeg_dec_set_config(void __iomem *base,
-			     struct mtk_jpeg_dec_param *config,
+			     struct mtk_jpeg_dec_param *cfg,
+			      u32 bitstream_size,
 			     struct mtk_jpeg_bs *bs,
 			     struct mtk_jpeg_fb *fb)
 {
-	mtk_jpeg_dec_set_brz_factor(base, 0, 0, config->uv_brz_w, 0);
+	mtk_jpeg_dec_set_brz_factor(base, 0, 0, cfg->uv_brz_w, 0);
 	mtk_jpeg_dec_set_dec_mode(base, 0);
-	mtk_jpeg_dec_set_comp0_du(base, config->unit_num);
-	mtk_jpeg_dec_set_total_mcu(base, config->total_mcu);
-	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size);
+	mtk_jpeg_dec_set_comp0_du(base, cfg->unit_num);
+	mtk_jpeg_dec_set_total_mcu(base, cfg->total_mcu);
+	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size, bitstream_size);
 	mtk_jpeg_dec_set_bs_write_ptr(base, bs->end_addr);
-	mtk_jpeg_dec_set_du_membership(base, config->membership, 1,
-				       (config->comp_num == 1) ? 1 : 0);
-	mtk_jpeg_dec_set_comp_id(base, config->comp_id[0], config->comp_id[1],
-				 config->comp_id[2]);
-	mtk_jpeg_dec_set_q_table(base, config->qtbl_num[0],
-				 config->qtbl_num[1], config->qtbl_num[2]);
-	mtk_jpeg_dec_set_sampling_factor(base, config->comp_num,
-					 config->sampling_w[0],
-					 config->sampling_h[0],
-					 config->sampling_w[1],
-					 config->sampling_h[1],
-					 config->sampling_w[2],
-					 config->sampling_h[2]);
-	mtk_jpeg_dec_set_mem_stride(base, config->mem_stride[0],
-				    config->mem_stride[1]);
-	mtk_jpeg_dec_set_img_stride(base, config->img_stride[0],
-				    config->img_stride[1]);
+	mtk_jpeg_dec_set_du_membership(base, cfg->membership, 1,
+				       (cfg->comp_num == 1) ? 1 : 0);
+	mtk_jpeg_dec_set_comp_id(base, cfg->comp_id[0], cfg->comp_id[1],
+				 cfg->comp_id[2]);
+	mtk_jpeg_dec_set_q_table(base, cfg->qtbl_num[0],
+				 cfg->qtbl_num[1], cfg->qtbl_num[2]);
+	mtk_jpeg_dec_set_sampling_factor(base, cfg->comp_num,
+					 cfg->sampling_w[0],
+					 cfg->sampling_h[0],
+					 cfg->sampling_w[1],
+					 cfg->sampling_h[1],
+					 cfg->sampling_w[2],
+					 cfg->sampling_h[2]);
+	mtk_jpeg_dec_set_mem_stride(base, cfg->mem_stride[0],
+				    cfg->mem_stride[1]);
+	mtk_jpeg_dec_set_img_stride(base, cfg->img_stride[0],
+				    cfg->img_stride[1]);
 	mtk_jpeg_dec_set_dst_bank0(base, fb->plane_addr[0],
 				   fb->plane_addr[1], fb->plane_addr[2]);
 	mtk_jpeg_dec_set_dst_bank1(base, 0, 0, 0);
-	mtk_jpeg_dec_set_dma_group(base, config->dma_mcu, config->dma_group,
-				   config->dma_last_mcu);
-	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
+	mtk_jpeg_dec_set_dma_group(base, cfg->dma_mcu, cfg->dma_group,
+				   cfg->dma_last_mcu);
+	mtk_jpeg_dec_set_pause_mcu_idx(base, cfg->total_mcu);
 }
 
 void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
index 87aaa5c..e7a6c0b 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
@@ -71,9 +71,10 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param);
 u32 mtk_jpeg_dec_get_int_status(void __iomem *dec_reg_base);
 u32 mtk_jpeg_dec_enum_result(u32 irq_result);
 void mtk_jpeg_dec_set_config(void __iomem *base,
-			     struct mtk_jpeg_dec_param *config,
-			     struct mtk_jpeg_bs *bs,
-			     struct mtk_jpeg_fb *fb);
+			    struct mtk_jpeg_dec_param *cfg,
+			    u32 bitstream_size,
+			    struct mtk_jpeg_bs *bs,
+			    struct mtk_jpeg_fb *fb);
 void mtk_jpeg_dec_reset(void __iomem *dec_reg_base);
 void mtk_jpeg_dec_start(void __iomem *dec_reg_base);
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
index 21ec8f9..27b7711 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h
@@ -45,5 +45,6 @@
 #define JPGDEC_REG_QT_ID		0x0270
 #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
 #define JPGDEC_REG_STATUS		0x0278
+#define JPGDEC_REG_BIT_STREAM_SIZE	0x0344
 
 #endif /* _MTK_JPEG_REG_H */
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
