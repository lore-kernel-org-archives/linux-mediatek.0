Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DBFC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B5D61CD5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B5D61CD5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDfeD+6yWqD5c/Oez1/Bcl7YHkZhQq8kc6bd6ne5x+w=; b=ZFmxTQryGyBTKo
	t7M8LeN+QbLqDOA7+jg9rYt3u5t7a1Lku4IswJ9LDngqEQngLSU1PuONlxfZ0Lm6I8IPTI3VpKlzd
	2DfG0LU5xBa4WMjxEOaf2RN8Fq4IG4pmZAbZFW8WgUwaHfkSYT9Y+rlSb7qKnGKayUeMFTpHR7xR8
	4kMWpgKHeCDK1A1C6h+ePYFDA7WeyZpjmhGcYt6NEwTwk4Q6StUVVJOpoz4EwceU+wfLF/ehuMfmz
	iNh1SqBnWnlFuF+a9wgoXDiqc5+gbEzaMI7qqX75xvNR2ShYKGWh5CKFC0pkJtB2ZdPNug8loO7co
	ZBnJDUDRmIW+LBwACUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUeJ-00D2ql-Mt; Wed, 30 Jun 2021 07:28:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUdx-00D2iv-83; Wed, 30 Jun 2021 07:28:23 +0000
X-UUID: f7d0cd5cd5cd4a1f9bf7e5907d4090dd-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x7rvrQTabmZ/ehlw9TCDKjiUMiZjMP4mWbART+Rco90=; 
 b=HgXUG/Jq62K5iYMj9nFFSqsbpQMvdAN/ZMVsvKNO9H9CvYVYIL83QImWL8R3zijM/CSSwkL7ss+19JmBZzBQxspf+svi8baXVo8+OHOEQmmpMhtsWDupzpfSFBdJp6ejF5jcrkIMTU83HP47RktutCPPGNu5LGkXXQFmvfT5wa4=;
X-UUID: f7d0cd5cd5cd4a1f9bf7e5907d4090dd-20210630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 540479770; Wed, 30 Jun 2021 00:28:18 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:28:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 15:28:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:28:13 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2,
 5/9] media: mtk-jpegenc: Generalize jpeg encode irq interfaces
Date: Wed, 30 Jun 2021 15:27:55 +0800
Message-ID: <1625038079-25815-6-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_002821_384625_98299975 
X-CRM114-Status: GOOD (  19.18  )
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

Generalizes jpeg encode irq interfaces to support different hardware.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 124 +++++++++++++++++++++++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h |  24 ++++-
 2 files changed, 146 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 7c053e3..062feab 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -106,10 +106,40 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
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
 };
 
 static int debug;
@@ -1163,6 +1193,98 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+void mtk_jpeg_put_buf(struct mtk_jpeg_dev *jpeg)
+{
+	struct mtk_jpeg_ctx *ctx;
+	struct vb2_v4l2_buffer *dst_buffer;
+	struct list_head *temp_entry;
+	struct list_head *pos;
+	struct mtk_jpeg_src_buf *dst_done_buf, *tmp_dst_done_buf;
+	unsigned long flags;
+
+	ctx = jpeg->hw_param.curr_ctx;
+	if (!ctx) {
+		dev_err(jpeg->dev, "comp_jpeg ctx fail !!!\n");
+		return;
+	}
+
+	dst_buffer = jpeg->hw_param.dst_buffer;
+	if (!dst_buffer) {
+		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
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
+	irq_status = readl(jpeg->reg_base[MTK_JPEGENC_HW0] + JPEG_ENC_INT_STS) &
+		JPEG_ENC_INT_STATUS_MASK_ALLIRQ;
+	if (irq_status)
+		writel(0, jpeg->reg_base[MTK_JPEGENC_HW0] + JPEG_ENC_INT_STS);
+	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE)) {
+		dev_err(jpeg->dev, "jpeg encode failed !!!\n");
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
 static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
 {
 	struct mtk_jpeg_q_data *q = &ctx->out_q;
@@ -1352,7 +1474,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	jpeg->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	jpeg->reg_base[0] = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(jpeg->reg_base)) {
 		ret = PTR_ERR(jpeg->reg_base);
 		return ret;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 93ea71c..03ff060 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -75,6 +75,17 @@ struct mtk_jpeg_variant {
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
 enum mtk_jpegenc_hw_id {
 	MTK_JPEGENC_HW0,
 	MTK_JPEGENC_HW1,
@@ -124,13 +135,18 @@ struct mtk_jpeg_dev {
 	struct v4l2_m2m_dev	*m2m_dev;
 	void			*alloc_ctx;
 	struct video_device	*vdev;
-	void __iomem		*reg_base;
 	struct device		*larb;
 	struct delayed_work job_timeout_work;
 	const struct mtk_jpeg_variant *variant;
 
+	void __iomem *reg_base[MTK_JPEGENC_HW_MAX];
+	int jpegenc_irq;
 	struct mtk_jpeg_dev *hw_dev[MTK_JPEGENC_HW_MAX];
 	struct mtk_jpegenc_pm pm;
+	enum mtk_jpeg_hw_state hw_state;
+	struct mtk_jpeg_hw_param hw_param;
+	wait_queue_head_t hw_wq;
+	atomic_t hw_rdy;
 };
 
 /**
@@ -189,6 +205,12 @@ struct mtk_jpeg_ctx {
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
 
 #endif /* _MTK_JPEG_CORE_H */
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
