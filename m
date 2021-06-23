Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9F3C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6093361186
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6093361186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12/p0yPu7aFClaV6+mfClz6eRfNr4ox1xC8eZk0iehY=; b=Sz9FjxV2VoPkp8
	OtYgLAUlCKI8Lb4GMkD3Y+EshD+NRnFI3UlcpeVuX3ZQpzGyqz7Ghc3T1E3r55Gw1EK1Dnlx/sil1
	VNSUzw7lZd5/Xhc2ijI6EgpybdD1M8gs4eeDqZgISdWkWGONImw/kE5gaGCLIEzV6EehbvDtdouOT
	W2W0KBDymDxfaY0QyiVTs0gfyNIaAIMLkpwskLWLdHDUBYTTKyRBwMhwVyG8rWQxi2y8cHGmzlHGB
	crqhD64ThlFADyu14aCEBdBns/y16WL1tYg55wJut2nPaT58gdqLI9ucmCA4UdaktjU2Zvysfw+Ac
	zisbqJkKuosOA4lSR3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvw2S-009Uhs-Tf; Wed, 23 Jun 2021 06:07:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvw24-009UZv-Gc; Wed, 23 Jun 2021 06:06:43 +0000
X-UUID: 0cd01e5e872646a5a4423b979fef55c9-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WkoeYiLFskLDg0TJEylD3QWhIAXRG/aPGCJbAbJaasg=; 
 b=Zf5fQM5rJLsOehqLlsPrHuG2o1cqZYO5rLV4QaPAFRQO0aMHffD8FATl9zvB+tl+pIuA7DYzNYkf2c0Ep85+bY71n3sNgsF5yh0sJrqUqM7ZG/MH3qs583h5ygrpQY60ufAAyHNZ6Fx1doQwgjW4JWKr8JVwkg4yROQJPvR9URQ=;
X-UUID: 0cd01e5e872646a5a4423b979fef55c9-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 961641740; Tue, 22 Jun 2021 23:06:38 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 23:06:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 14:06:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 14:06:33 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Rick Chang
 <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH 2/3] media: mtk-jpegenc: use component framework to manage jpg
 HW
Date: Wed, 23 Jun 2021 14:05:49 +0800
Message-ID: <1624428350-1424-3-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
References: <1624428350-1424-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_230640_632829_778F103C 
X-CRM114-Status: GOOD (  21.45  )
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

Mtk jpeg encoder has several hardware, one HW may register a device
node; use component framework to manage jpg HW device node,
in this case, one device node could represent all jpg HW.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 467 ++++++++++++++++++----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  80 +++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 209 ++++++++++
 3 files changed, 670 insertions(+), 86 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bc..c84815a 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -23,6 +23,7 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 #include <soc/mediatek/smi.h>
+#include <linux/component.h>
 
 #include "mtk_jpeg_enc_hw.h"
 #include "mtk_jpeg_dec_hw.h"
@@ -106,10 +107,45 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 #define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
 #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
 
+/*
+ * mtk_jpeg_enc_param:  General jpeg encoding parameters
+ * @enc_w:		image width
+ * @enc_h:		image height
+ * @enable_exif:	EXIF enable for jpeg encode mode
+ * @enc_quality:	destination image quality in encode mode
+ * @enc_format:		input image format
+ * @restart_interval:	JPEG restart interval for JPEG encoding
+ * @img_stride:		jpeg encoder image stride
+ * @mem_stride:		jpeg encoder memory stride
+ * @total_encdu:	total 8x8 block number
+ */
+struct mtk_jpeg_enc_param {
+	u32 enc_w;
+	u32 enc_h;
+	u32 enable_exif;
+	u32 enc_quality;
+	u32 enc_format;
+	u32 restart_interval;
+	u32 img_stride;
+	u32 mem_stride;
+	u32 total_encdu;
+};
+
 struct mtk_jpeg_src_buf {
 	struct vb2_v4l2_buffer b;
 	struct list_head list;
+	u32 frame_num;
+	u32 bs_size;
+	int flags;
 	struct mtk_jpeg_dec_param dec_param;
+
+	struct mtk_jpeg_enc_param enc_param;
+	struct mtk_jpeg_ctx *curr_ctx;
+};
+
+enum {
+	MTK_JPEG_BUF_FLAGS_INIT	= 0,
+	MTK_JPEG_BUF_FLAGS_LAST_FRAME = 1,
 };
 
 static int debug;
@@ -1053,8 +1089,32 @@ static int mtk_jpeg_queue_init(void *priv, struct vb2_queue *src_vq,
 
 static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 {
-	int ret;
-
+	struct mtk_jpeg_dev *comp_dev;
+	struct mtk_jpegenc_pm *pm;
+	struct mtk_jpegenc_clk *jpegclk;
+	struct mtk_jpegenc_clk_info *clk_info;
+	int ret, i;
+
+	if (jpeg->variant->is_encoder) {
+		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+			comp_dev = jpeg->hw_dev[i];
+			if (!comp_dev) {
+				pr_err("Failed to get hw dev\n");
+				return;
+			}
+
+			pm = &comp_dev->pm;
+			jpegclk = &pm->venc_clk;
+			clk_info = jpegclk->clk_info;
+			ret = clk_prepare_enable(clk_info->jpegenc_clk);
+			if (ret) {
+				pr_err("jpegenc clk_prepare_enable %d %s fail\n",
+				       i, jpegclk->clk_info->clk_name);
+				return;
+			}
+		}
+		return;
+	}
 	ret = mtk_smi_larb_get(jpeg->larb);
 	if (ret)
 		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
@@ -1067,59 +1127,30 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
+	struct mtk_jpeg_dev *comp_dev;
+	struct mtk_jpegenc_pm *pm;
+	struct mtk_jpegenc_clk *jpegclk;
+	int i;
+
+	if (jpeg->variant->is_encoder) {
+		for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+			comp_dev = jpeg->hw_dev[i];
+			if (!comp_dev) {
+				pr_err("Failed to get hw dev\n");
+				return;
+			}
+
+			pm = &comp_dev->pm;
+			jpegclk = &pm->venc_clk;
+			clk_disable_unprepare(jpegclk->clk_info->jpegenc_clk);
+		}
+		return;
+	}
 	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
 				   jpeg->variant->clks);
 	mtk_smi_larb_put(jpeg->larb);
 }
 
-static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
-{
-	struct mtk_jpeg_ctx *ctx;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
-	u32 result_size;
-
-	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
-	if (!ctx) {
-		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
-		return IRQ_HANDLED;
-	}
-
-	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
-	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
-	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
-
-	buf_state = VB2_BUF_STATE_DONE;
-
-	v4l2_m2m_buf_done(src_buf, buf_state);
-	v4l2_m2m_buf_done(dst_buf, buf_state);
-	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t mtk_jpeg_enc_irq(int irq, void *priv)
-{
-	struct mtk_jpeg_dev *jpeg = priv;
-	u32 irq_status;
-	irqreturn_t ret = IRQ_NONE;
-
-	cancel_delayed_work(&jpeg->job_timeout_work);
-
-	irq_status = readl(jpeg->reg_base + JPEG_ENC_INT_STS) &
-		     JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
-	if (irq_status)
-		writel(0, jpeg->reg_base + JPEG_ENC_INT_STS);
-
-	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
-		return ret;
-
-	ret = mtk_jpeg_enc_done(jpeg);
-	return ret;
-}
-
 static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 {
 	struct mtk_jpeg_dev *jpeg = priv;
@@ -1313,6 +1344,138 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
 	return 0;
 }
 
+void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
+{
+	struct mtk_jpeg_ctx *ctx = NULL;
+	struct vb2_v4l2_buffer *dst_buffer = NULL;
+	struct list_head *temp_entry = NULL;
+	struct list_head *pos = NULL;
+	struct mtk_jpeg_src_buf *dst_done_buf = NULL, *tmp_dst_done_buf = NULL;
+	unsigned long flags;
+
+	ctx = jpeg->hw_param.curr_ctx;
+	if (!ctx) {
+		pr_err("%s : %d, comp_jpeg ctx fail !!!\n", __func__, __LINE__);
+		return;
+	}
+
+	dst_buffer = jpeg->hw_param.dst_buffer;
+	if (!dst_buffer) {
+		pr_err("%s : %d, comp_jpeg dst_buffer fail !!!\n",
+		       __func__, __LINE__);
+		return;
+	}
+
+	dst_done_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buffer->vb2_buf);
+
+	spin_lock_irqsave(&ctx->done_queue_lock, flags);
+	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
+	while (!list_empty(&ctx->dst_done_queue) &&
+	       (pos != &ctx->dst_done_queue)) {
+		list_for_each_prev_safe(pos, temp_entry,
+					(&ctx->dst_done_queue)) {
+			tmp_dst_done_buf = list_entry(pos,
+						      struct mtk_jpeg_src_buf,
+						      list);
+			if (tmp_dst_done_buf->frame_num ==
+				ctx->last_done_frame_num) {
+				list_del(&tmp_dst_done_buf->list);
+				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
+						  VB2_BUF_STATE_DONE);
+				ctx->last_done_frame_num++;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
+}
+
+irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
+{
+	struct mtk_jpeg_dev *jpeg = priv;
+	struct mtk_jpeg_ctx *ctx;
+	struct mtk_jpeg_dev *master_jpeg;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_src_buf *jpeg_dst_buf;
+
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+	u32 result_size;
+	u32 irq_status;
+
+	cancel_delayed_work(&jpeg->job_timeout_work);
+
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	ctx = jpeg->hw_param.curr_ctx;
+	master_jpeg = ctx->jpeg;
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+	irq_status = readl(jpeg->reg_base[MTK_JPEGENC_HW0] + JPEG_ENC_INT_STS) &
+		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
+	if (irq_status)
+		writel(0, jpeg->reg_base[MTK_JPEGENC_HW0] + JPEG_ENC_INT_STS);
+	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE)) {
+		pr_err("%s : %d, jpeg encode failed\n", __func__, __LINE__);
+		goto irq_end;
+	}
+
+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base[0]);
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
+
+	buf_state = VB2_BUF_STATE_DONE;
+
+irq_end:
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpeg_put_buf(jpeg);
+	pm_runtime_put(jpeg->pm.dev);
+	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
+	if (ctx->fh.m2m_ctx &&
+	    (!list_empty(&ctx->fh.m2m_ctx->out_q_ctx.rdy_queue) ||
+	    !list_empty(&ctx->fh.m2m_ctx->cap_q_ctx.rdy_queue))) {
+		queue_work(master_jpeg->workqueue, &ctx->jpeg_work);
+	}
+
+	jpeg->hw_state = MTK_JPEG_HW_IDLE;
+	wake_up(&master_jpeg->hw_wq);
+	atomic_inc(&jpeg->hw_rdy);
+	return IRQ_HANDLED;
+}
+
+void mtk_jpegenc_timeout_work(struct work_struct *work)
+{
+	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
+		job_timeout_work.work);
+	struct mtk_jpeg_ctx *ctx = NULL;
+	struct mtk_jpeg_dev *master_jpeg;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_src_buf *jpeg_src_buf, *jpeg_dst_buf;
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	ctx = jpeg->hw_param.curr_ctx;
+	if (!ctx) {
+		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
+		return;
+	}
+
+	master_jpeg = ctx->jpeg;
+	if (!master_jpeg) {
+		v4l2_err(&jpeg->v4l2_dev, "master_jpeg is NULL\n");
+		return;
+	}
+
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
+	jpeg_dst_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buf->vb2_buf);
+
+	mtk_jpeg_enc_reset(jpeg->reg_base[MTK_JPEGENC_HW0]);
+	pm_runtime_put(jpeg->pm.dev);
+	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
+	jpeg->hw_state = MTK_JPEG_HW_IDLE;
+	atomic_inc(&jpeg->hw_rdy);
+	wake_up(&master_jpeg->hw_wq);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpeg_put_buf(jpeg);
+}
+
 static void mtk_jpeg_job_timeout_work(struct work_struct *work)
 {
 	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
@@ -1338,12 +1501,99 @@ static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
 	put_device(jpeg->larb);
 }
 
+static  const struct of_device_id mtk_jpegenc_drv_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgenc0",
+		.data = (void *)MTK_JPEGENC_HW0,
+	},
+	{
+		.compatible = "mediatek,mt8195-jpgenc1",
+		.data = (void *)MTK_JPEGENC_HW1,
+	},
+	{},
+};
+
+static inline int mtk_vdec_compare_of(struct device *dev, void *data)
+{
+	return dev->of_node == data;
+}
+
+static inline void mtk_vdec_release_of(struct device *dev, void *data)
+{
+	of_node_put(data);
+}
+
+static inline int mtk_jpegenc_bind(struct device *dev)
+{
+	struct mtk_jpeg_dev *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, data);
+}
+
+static inline void mtk_jpegenc_unbind(struct device *dev)
+{
+	struct mtk_jpeg_dev *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, data);
+}
+
+static const struct component_master_ops mtk_jpegenc_ops = {
+	.bind = mtk_jpegenc_bind,
+	.unbind = mtk_jpegenc_unbind,
+};
+
+struct component_match *mtk_jpegenc_match_add(struct mtk_jpeg_dev *jpeg)
+{
+	struct device *dev = jpeg->dev;
+	struct component_match *match = NULL;
+	int i;
+	char compatible[128] = {0};
+
+	for (i = 0; i < ARRAY_SIZE(mtk_jpegenc_drv_ids); i++) {
+		struct device_node *comp_node;
+		enum mtk_jpegenc_hw_id comp_idx;
+		const struct of_device_id *of_id;
+
+		memcpy(compatible, mtk_jpegenc_drv_ids[i].compatible,
+		       sizeof(mtk_jpegenc_drv_ids[i].compatible));
+
+		comp_node = of_find_compatible_node(NULL, NULL,
+						    compatible);
+		if (!comp_node)
+			continue;
+
+		if (!of_device_is_available(comp_node)) {
+			of_node_put(comp_node);
+			v4l2_err(&jpeg->v4l2_dev, "Fail to get jpeg enc HW node\n");
+			continue;
+		}
+
+		of_id = of_match_node(mtk_jpegenc_drv_ids, comp_node);
+		if (!of_id) {
+			v4l2_err(&jpeg->v4l2_dev, "Failed to get match node\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		comp_idx = (enum mtk_jpegenc_hw_id)of_id->data;
+		v4l2_info(&jpeg->v4l2_dev, "Get component:hw_id(%d),jpeg_dev(0x%p),comp_node(0x%p)\n",
+			  comp_idx, jpeg, comp_node);
+
+		jpeg->component_node[comp_idx] = comp_node;
+
+		component_match_add_release(dev, &match, mtk_vdec_release_of,
+					    mtk_vdec_compare_of, comp_node);
+	}
+
+	return match;
+}
+
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
 	struct resource *res;
 	int jpeg_irq;
 	int ret;
+	struct component_match *match;
 
 	jpeg = devm_kzalloc(&pdev->dev, sizeof(*jpeg), GFP_KERNEL);
 	if (!jpeg)
@@ -1355,31 +1605,47 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
 	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(jpeg->reg_base)) {
-		ret = PTR_ERR(jpeg->reg_base);
-		return ret;
-	}
+	if (!jpeg->variant->is_encoder) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		jpeg->reg_base[MTK_JPEGENC_HW0] =
+			devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(jpeg->reg_base[MTK_JPEGENC_HW0])) {
+			ret = PTR_ERR(jpeg->reg_base[MTK_JPEGENC_HW0]);
+			return ret;
+		}
 
-	jpeg_irq = platform_get_irq(pdev, 0);
-	if (jpeg_irq < 0) {
-		dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n", jpeg_irq);
-		return jpeg_irq;
-	}
+		jpeg_irq = platform_get_irq(pdev, 0);
+		if (jpeg_irq < 0) {
+			dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n",
+				jpeg_irq);
+			return jpeg_irq;
+		}
 
-	ret = devm_request_irq(&pdev->dev, jpeg_irq,
-			       jpeg->variant->irq_handler, 0, pdev->name, jpeg);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
-			jpeg_irq, ret);
-		goto err_req_irq;
-	}
+		ret = devm_request_irq(&pdev->dev, jpeg_irq,
+				       jpeg->variant->irq_handler,
+				       0, pdev->name, jpeg);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
+				jpeg_irq, ret);
+			goto err_req_irq;
+		}
 
-	ret = mtk_jpeg_clk_init(jpeg);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to init clk, err %d\n", ret);
-		goto err_clk_init;
+		ret = mtk_jpeg_clk_init(jpeg);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to init clk\n");
+			goto err_clk_init;
+		}
+	} else {
+		init_waitqueue_head(&jpeg->hw_wq);
+
+		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+							  WQ_MEM_RECLAIM |
+							  WQ_FREEZABLE);
+		if (!jpeg->workqueue) {
+			dev_err(&pdev->dev, "Failed to create jpeg workqueue!\n");
+			ret = -EINVAL;
+			goto err_alloc_workqueue;
+		}
 	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
@@ -1390,7 +1656,6 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	}
 
 	jpeg->m2m_dev = v4l2_m2m_init(jpeg->variant->m2m_ops);
-
 	if (IS_ERR(jpeg->m2m_dev)) {
 		v4l2_err(&jpeg->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(jpeg->m2m_dev);
@@ -1422,13 +1687,26 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 	video_set_drvdata(jpeg->vdev, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
-		  "%s device registered as /dev/video%d (%d,%d)\n",
-		  jpeg->variant->dev_name, jpeg->vdev->num,
-		  VIDEO_MAJOR, jpeg->vdev->minor);
+			  "%s device registered as /dev/video%d (%d,%d)\n",
+			  jpeg->variant->dev_name, jpeg->vdev->num,
+			  VIDEO_MAJOR, jpeg->vdev->minor);
 
 	platform_set_drvdata(pdev, jpeg);
 
-	pm_runtime_enable(&pdev->dev);
+	if (jpeg->variant->is_encoder) {
+		match = mtk_jpegenc_match_add(jpeg);
+		if (IS_ERR_OR_NULL(match))
+			goto err_vfd_jpeg_register;
+
+		video_set_drvdata(jpeg->vdev, jpeg);
+		platform_set_drvdata(pdev, jpeg);
+		ret = component_master_add_with_match(&pdev->dev,
+						      &mtk_jpegenc_ops, match);
+		if (ret < 0)
+			goto err_vfd_jpeg_register;
+	} else {
+		pm_runtime_enable(&pdev->dev);
+	}
 
 	return 0;
 
@@ -1446,6 +1724,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 
 err_clk_init:
 
+err_alloc_workqueue:
+
 err_req_irq:
 
 	return ret;
@@ -1461,6 +1741,8 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 	mtk_jpeg_clk_release(jpeg);
+	flush_workqueue(jpeg->workqueue);
+	destroy_workqueue(jpeg->workqueue);
 
 	return 0;
 }
@@ -1524,13 +1806,13 @@ static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 };
 
-static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
+static const struct mtk_jpeg_variant mtk_jpegenc_drvdata = {
+	.is_encoder	= true,
 	.clks = mtk_jpeg_clocks,
 	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
 	.formats = mtk_jpeg_enc_formats,
 	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
 	.qops = &mtk_jpeg_enc_qops,
-	.irq_handler = mtk_jpeg_enc_irq,
 	.hw_reset = mtk_jpeg_enc_reset,
 	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
 	.dev_name = "mtk-jpeg-enc",
@@ -1540,6 +1822,9 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 };
 
 static const struct of_device_id mtk_jpeg_match[] = {
+	{	.compatible = "mediatek,mt8195-jpgenc",
+		.data = &mtk_jpegenc_drvdata,
+	},
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
 		.data = &mt8173_jpeg_drvdata,
@@ -1548,10 +1833,6 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt2701-jpgdec",
 		.data = &mt8173_jpeg_drvdata,
 	},
-	{
-		.compatible = "mediatek,mtk-jpgenc",
-		.data = &mtk_jpeg_drvdata,
-	},
 	{},
 };
 
@@ -1567,7 +1848,25 @@ static struct platform_driver mtk_jpeg_driver = {
 	},
 };
 
-module_platform_driver(mtk_jpeg_driver);
+static struct platform_driver * const mtk_jpeg_source_drivers[] = {
+	&mtk_jpegenc_hw_driver,
+	&mtk_jpeg_driver,
+};
+
+static int __init mtk_jpeg_init(void)
+{
+	return platform_register_drivers(mtk_jpeg_source_drivers,
+					 ARRAY_SIZE(mtk_jpeg_source_drivers));
+}
+
+static void __exit mtk_jpeg_exit(void)
+{
+	platform_unregister_drivers(mtk_jpeg_source_drivers,
+				    ARRAY_SIZE(mtk_jpeg_source_drivers));
+}
+
+module_init(mtk_jpeg_init);
+module_exit(mtk_jpeg_exit);
 
 MODULE_DESCRIPTION("MediaTek JPEG codec driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 595f7f1..d4259f9 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -60,6 +60,7 @@ enum mtk_jpeg_ctx_state {
  * @cap_q_default_fourcc:	capture queue default fourcc
  */
 struct mtk_jpeg_variant {
+	bool is_encoder;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	struct mtk_jpeg_fmt *formats;
@@ -74,6 +75,52 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+struct mtk_jpeg_hw_param {
+	struct vb2_v4l2_buffer *src_buffer;
+	struct vb2_v4l2_buffer *dst_buffer;
+	struct mtk_jpeg_ctx *curr_ctx;
+};
+
+enum mtk_jpeg_hw_state {
+	MTK_JPEG_HW_IDLE = 0,
+	MTK_JPEG_HW_BUSY = 1,
+};
+
+enum mtk_jpegenc_hw_id {
+	MTK_JPEGENC_HW0,
+	MTK_JPEGENC_HW1,
+	MTK_JPEGENC_HW_MAX,
+};
+
+/** * enum mtk_hw_idx - MTK hw index */
+enum mtk_jpeghw_idx {
+	JPEGENC_HW0,
+	JPEGENC_HW1,
+	JPEGDEC_HW0,
+	JPEGDEC_HW1,
+	JPEGDEC_HW2,
+	NUM_MAX_JPEG_HW,
+};
+
+/** * struct mtk_jpegenc_clk_info - Structure used to store clock name */
+struct mtk_jpegenc_clk_info {
+	const char	*clk_name;
+	struct clk	*jpegenc_clk;
+};
+
+/* struct mtk_vcodec_clk - Structure used to store vcodec clock information */
+struct mtk_jpegenc_clk {
+	struct mtk_jpegenc_clk_info	*clk_info;
+	int	clk_num;
+};
+
+/** * struct mtk_vcodec_pm - Power management data structure */
+struct mtk_jpegenc_pm {
+	struct mtk_jpegenc_clk	venc_clk;
+	struct device	*dev;
+	struct mtk_jpeg_dev	*mtkdev;
+};
+
 /**
  * struct mtk_jpeg_dev - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
@@ -88,6 +135,8 @@ struct mtk_jpeg_variant {
  * @larb:		SMI device
  * @job_timeout_work:	IRQ timeout structure
  * @variant:		driver variant to be used
+ * @irqlock:		spinlock protecting for irq
+ * @dev_mutex:		the mutex protecting for device
  */
 struct mtk_jpeg_dev {
 	struct mutex		lock;
@@ -98,12 +147,29 @@ struct mtk_jpeg_dev {
 	struct v4l2_m2m_dev	*m2m_dev;
 	void			*alloc_ctx;
 	struct video_device	*vdev;
-	void __iomem		*reg_base;
 	struct device		*larb;
-	struct delayed_work job_timeout_work;
 	const struct mtk_jpeg_variant *variant;
+
+	struct clk		*clk_jpeg;
+	struct delayed_work job_timeout_work;
+	struct platform_device *plat_dev;
+	spinlock_t irqlock;	/* spinlock protecting for irq */
+	struct mutex dev_mutex;	/* the mutex protecting for device */
+	void __iomem *reg_base[NUM_MAX_JPEG_HW];
+	int jpegenc_irq;
+	struct mtk_jpeg_dev *hw_dev[NUM_MAX_JPEG_HW];
+	struct device_node *component_node[NUM_MAX_JPEG_HW];
+	int comp_idx;
+	struct mtk_jpegenc_pm pm;
+	struct mtk_jpeg_ctx *curr_ctx;
+	enum mtk_jpeg_hw_state hw_state;
+	struct mtk_jpeg_hw_param hw_param;
+	wait_queue_head_t hw_wq;
+	atomic_t hw_rdy;
 };
 
+extern struct platform_driver mtk_jpegenc_hw_driver;
+
 /**
  * struct mtk_jpeg_fmt - driver's internal color format data
  * @fourcc:	the fourcc code, 0 if not applicable
@@ -149,6 +215,7 @@ struct mtk_jpeg_q_data {
  * @enc_quality:	jpeg encoder quality
  * @restart_interval:	jpeg encoder restart interval
  * @ctrl_hdl:		controls handler
+ * @done_queue_lock:	spinlock protecting for buffer done queue
  */
 struct mtk_jpeg_ctx {
 	struct mtk_jpeg_dev		*jpeg;
@@ -160,6 +227,15 @@ struct mtk_jpeg_ctx {
 	u8 enc_quality;
 	u8 restart_interval;
 	struct v4l2_ctrl_handler ctrl_hdl;
+
+	struct list_head dst_done_queue;
+	spinlock_t done_queue_lock;	/* spinlock protecting done queue */
+	u32 total_frame_num;
+	u32 last_done_frame_num;
+	struct work_struct jpeg_work;
 };
 
+void mtk_jpegenc_timeout_work(struct work_struct *work);
+irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv);
+
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index 1cf037b..d44101e 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -9,8 +9,20 @@
 #include <linux/kernel.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <linux/component.h>
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+
 
 #include "mtk_jpeg_enc_hw.h"
+#include "mtk_jpeg_core.h"
+
 
 static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
 	{.quality_param = 34, .hardware_value = JPEG_ENC_QUALITY_Q34},
@@ -30,6 +42,99 @@ static const struct mtk_jpeg_enc_qlt mtk_jpeg_enc_quality[] = {
 	{.quality_param = 97, .hardware_value = JPEG_ENC_QUALITY_Q97},
 };
 
+typedef irqreturn_t (*jpegenc_irq_handler)(int irq, void *priv);
+
+static int mtk_jpegenc_hw_bind(struct device *dev,
+			       struct device *master, void *data)
+{
+	struct mtk_jpeg_dev *comp_priv = dev_get_drvdata(dev);
+	struct mtk_jpeg_dev *master_priv = data;
+	int i;
+
+	for (i = 0; i < MTK_JPEGENC_HW_MAX; i++) {
+		if (dev->of_node != master_priv->component_node[i])
+			continue;
+		master_priv->hw_dev[i] = comp_priv;
+		comp_priv->comp_idx = i;
+		master_priv->reg_base[i] = comp_priv->reg_base[MTK_JPEGENC_HW0];
+		break;
+	}
+	if (i == MTK_JPEGENC_HW_MAX) {
+		dev_err(dev, "Failed to get component node\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void mtk_jpegenc_hw_unbind(struct device *dev,
+				  struct device *master, void *data)
+{
+	struct mtk_jpeg_dev *comp_priv = dev_get_drvdata(dev);
+
+	comp_priv->reg_base[MTK_JPEGENC_HW0] = 0;
+}
+
+static const struct component_ops mtk_jpegenc_hw_component_ops = {
+	.bind = mtk_jpegenc_hw_bind,
+	.unbind = mtk_jpegenc_hw_unbind,
+};
+
+int mtk_jpegenc_init_pm(struct mtk_jpeg_dev *mtkdev)
+{
+	struct platform_device *pdev;
+	struct mtk_jpegenc_pm *pm;
+	struct mtk_jpegenc_clk *jpegenc_clk;
+	struct mtk_jpegenc_clk_info *clk_info;
+	int i = 0, ret = 0;
+
+	pdev = mtkdev->plat_dev;
+	pm = &mtkdev->pm;
+	pm->mtkdev = mtkdev;
+
+	jpegenc_clk = &pm->venc_clk;
+	pm->dev = &pdev->dev;
+	jpegenc_clk->clk_num =
+		of_property_count_strings(pdev->dev.of_node, "clock-names");
+	if (jpegenc_clk->clk_num > 0) {
+		jpegenc_clk->clk_info = devm_kcalloc(&pdev->dev,
+						     jpegenc_clk->clk_num,
+						     sizeof(*clk_info),
+						     GFP_KERNEL);
+		if (!jpegenc_clk->clk_info)
+			return -ENOMEM;
+	} else {
+		pr_err("Failed to get jpegenc clock count\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < jpegenc_clk->clk_num; i++) {
+		clk_info = &jpegenc_clk->clk_info[i];
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "clock-names", i,
+						    &clk_info->clk_name);
+		if (ret) {
+			pr_err("Failed to get jpegenc clock name id = %d", i);
+			return ret;
+		}
+
+		clk_info->jpegenc_clk = devm_clk_get(&pdev->dev,
+						     clk_info->clk_name);
+		if (IS_ERR(clk_info->jpegenc_clk)) {
+			pr_err("devm_clk_get (%d)%s fail",
+			       i, clk_info->clk_name);
+			return PTR_ERR(clk_info->jpegenc_clk);
+		}
+	}
+
+	pm_runtime_enable(&pdev->dev);
+	return ret;
+}
+
+void mtk_jpegenc_release_pm(struct mtk_jpeg_dev *dev)
+{
+	pm_runtime_disable(dev->pm.dev);
+}
+
 void mtk_jpeg_enc_reset(void __iomem *base)
 {
 	writel(0, base + JPEG_ENC_RSTB);
@@ -152,3 +257,107 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 
 	writel(ctx->restart_interval, base + JPEG_ENC_RST_MCU_NUM);
 }
+
+static int mtk_jpegenc_hw_init_irq(struct mtk_jpeg_dev *dev,
+				   jpegenc_irq_handler irq_handler)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	dev->jpegenc_irq = platform_get_irq(pdev, 0);
+	if (dev->jpegenc_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		return dev->jpegenc_irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, dev->jpegenc_irq,
+			       irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to install dev->jpegenc_irq %d (%d)",
+			dev->jpegenc_irq, ret);
+
+		return -ENOENT;
+	}
+
+	//disable_irq(dev->jpegenc_irq);
+	return 0;
+}
+
+static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
+{
+	struct mtk_jpeg_dev *dev;
+	jpegenc_irq_handler irq_handler;
+	int ret;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+	dev->plat_dev = pdev;
+	spin_lock_init(&dev->irqlock);
+	mutex_init(&dev->dev_mutex);
+	atomic_set(&dev->hw_rdy, 1U);
+	spin_lock_init(&dev->hw_lock);
+
+	dev->hw_state = MTK_JPEG_HW_IDLE;
+	INIT_DELAYED_WORK(&dev->job_timeout_work, mtk_jpegenc_timeout_work);
+
+	ret = mtk_jpegenc_init_pm(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get jpeg enc clock source");
+		return ret;
+	}
+
+	dev->reg_base[MTK_JPEGENC_HW0] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR((__force void *)dev->reg_base[MTK_JPEGENC_HW0])) {
+		ret = PTR_ERR((__force void *)dev->reg_base[MTK_JPEGENC_HW0]);
+		goto err;
+	}
+
+	irq_handler = of_device_get_match_data(&pdev->dev);
+	if (!irq_handler) {
+		dev_err(&pdev->dev, "Failed to get match data.\n");
+		goto err;
+	}
+
+	ret = mtk_jpegenc_hw_init_irq(dev, irq_handler);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register JPEGENC irq handler.\n");
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	ret = component_add(&pdev->dev, &mtk_jpegenc_hw_component_ops);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to component_add: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	mtk_jpegenc_release_pm(dev);
+	return ret;
+}
+
+static const struct of_device_id mtk_jpegenc_hw_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgenc0",
+		.data = mtk_jpegenc_hw_irq_handler,
+	},
+	{	.compatible = "mediatek,mt8195-jpgenc1",
+		.data = mtk_jpegenc_hw_irq_handler,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_jpegenc_hw_ids);
+
+struct platform_driver mtk_jpegenc_hw_driver = {
+	.probe	= mtk_jpegenc_hw_probe,
+	.driver	= {
+		.name	= "mtk-jpegenc-hw",
+		.of_match_table = mtk_jpegenc_hw_ids,
+	},
+};
+
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
