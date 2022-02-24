Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38E5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 09:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbRynp+pPa38V93mb6fEzFO2QHqtOD90BVECDZddWG8=; b=qRxczaH17xUzPT
	zjRuYruYfdPRiIXdk75/HRv/j8WiFpIOTHluShXYxP/RLXVeegHUzZ5IjH5egQbPh88qhzUO1VLEJ
	K820vTc7aBXiTOkmkWuaqVKxfUgE6mG9T6KEc2tudVIdXO/P4fLutCK0bJ8snFpVqpgO4F7qPUfsr
	Q1l/JrCAZqo6DfHaCuqJhGLXvb0+TZqK5+WrV3FyHSj7hns00PwU/eximk1xhOQYJbha8h02UOJ7H
	wJIpYbjctXQBhp2JhS8QXmcR46dpaaoBL//iKC/l2yFHYnRzexzn44PcM2q1vLzlzSJXq7jG1dT+v
	FG1UpKKPzqPV/ohXERCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAM1-00024U-By; Thu, 24 Feb 2022 09:24:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNA8J-00HWN0-9T; Thu, 24 Feb 2022 09:09:57 +0000
X-UUID: 512b5785ee0b41b8a51e5b7a08278bb7-20220224
X-UUID: 512b5785ee0b41b8a51e5b7a08278bb7-20220224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1633413273; Thu, 24 Feb 2022 02:09:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 01:07:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 24 Feb 2022 17:07:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 17:07:24 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, kyrie wu
 <kyrie.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: [RESEND,V7,6/6] media: mtk-jpegenc: add output pic reorder interface
Date: Thu, 24 Feb 2022 17:07:17 +0800
Message-ID: <1645693637-627-7-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645693637-627-1-git-send-email-kyrie.wu@mediatek.com>
References: <1645693637-627-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_010955_381327_F87354C5 
X-CRM114-Status: GOOD (  19.42  )
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

From: kyrie wu <kyrie.wu@mediatek.com>

There are two HWs in mt8195. Since the two HWs run
in parallel, it is necessary to reorder the output images
to ensure that the order is consistent with the input images.

Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 10 +---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 18 ++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |  1 +
 .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |  3 +-
 .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 49 ++++++++++++++++++-
 5 files changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 6f161a3d9935..77d303e8bdea 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -105,15 +105,6 @@ static struct mtk_jpeg_fmt mtk_jpeg_dec_formats[] = {
 #define MTK_JPEG_ENC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_enc_formats)
 #define MTK_JPEG_DEC_NUM_FORMATS ARRAY_SIZE(mtk_jpeg_dec_formats)
 
-struct mtk_jpeg_src_buf {
-	struct vb2_v4l2_buffer b;
-	struct list_head list;
-	struct mtk_jpeg_dec_param dec_param;
-
-	struct mtk_jpeg_ctx *curr_ctx;
-	u32 frame_num;
-};
-
 static int debug;
 module_param(debug, int, 0644);
 
@@ -1372,6 +1363,7 @@ static int mtk_jpeg_open(struct file *file)
 	if (jpeg->variant->is_multihw)
 		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
 
+	INIT_LIST_HEAD(&ctx->dst_done_queue);
 	v4l2_fh_init(&ctx->fh, vfd);
 	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index aab0e23d1db9..8eb21f0e7124 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -14,10 +14,11 @@
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fh.h>
+#include <media/videobuf2-v4l2.h>
 
-#define MTK_JPEG_NAME		"mtk-jpeg"
+#include "mtk_jpeg_dec_hw.h"
 
-#define MTK_JPEG_COMP_MAX		3
+#define MTK_JPEG_NAME		"mtk-jpeg"
 
 #define MTK_JPEG_FMT_FLAG_OUTPUT	BIT(0)
 #define MTK_JPEG_FMT_FLAG_CAPTURE	BIT(1)
@@ -76,6 +77,15 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 };
 
+struct mtk_jpeg_src_buf {
+	struct vb2_v4l2_buffer b;
+	struct list_head list;
+	struct mtk_jpeg_dec_param dec_param;
+
+	struct mtk_jpeg_ctx *curr_ctx;
+	u32 frame_num;
+};
+
 enum mtk_jpeg_hw_state {
 	MTK_JPEG_HW_IDLE = 0,
 	MTK_JPEG_HW_BUSY = 1,
@@ -221,6 +231,10 @@ struct mtk_jpeg_ctx {
 
 	struct work_struct jpeg_work;
 	u32 total_frame_num;
+	struct list_head dst_done_queue;
+	//spinlock protecting the encode done buffer
+	spinlock_t done_queue_lock;
+	u32 last_done_frame_num;
 };
 
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index afbbfd5d02bc..1e3852295f2f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <media/videobuf2-core.h>
 
+#include "mtk_jpeg_core.h"
 #include "mtk_jpeg_dec_hw.h"
 
 #define MTK_JPEG_DUNUM_MASK(val)	(((val) - 1) & 0x3)
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
index fa0d45fd7c34..87aaa5c9082b 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h
@@ -11,9 +11,10 @@
 
 #include <media/videobuf2-core.h>
 
-#include "mtk_jpeg_core.h"
 #include "mtk_jpeg_dec_reg.h"
 
+#define MTK_JPEG_COMP_MAX		3
+
 enum {
 	MTK_JPEG_DEC_RESULT_EOF_DONE		= 0,
 	MTK_JPEG_DEC_RESULT_PAUSE		= 1,
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index 88ababf1a059..d4ded3def1bf 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -190,6 +190,51 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_params);
 
+void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	struct mtk_jpeg_ctx *ctx;
+	struct vb2_v4l2_buffer *dst_buffer;
+	struct list_head *temp_entry;
+	struct list_head *pos = NULL;
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
+	dst_done_buf = container_of(dst_buffer,
+				    struct mtk_jpeg_src_buf, b);
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
 static void mtk_jpegenc_timeout_work(struct work_struct *work)
 {
 	struct delayed_work *dly_work = to_delayed_work(work);
@@ -210,6 +255,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	atomic_inc(&cjpeg->hw_rdy);
 	wake_up(&master_jpeg->enc_hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpegenc_put_buf(cjpeg);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -244,8 +290,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
-	v4l2_m2m_buf_done(dst_buf, buf_state);
-	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	mtk_jpegenc_put_buf(jpeg);
 	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 	pm_runtime_put(ctx->jpeg->dev);
 	if (ctx->fh.m2m_ctx &&
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
