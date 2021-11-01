Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E3D260FE8
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E3D260FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ecpY6Zvr3hmMNCnmTS7PbdmeBSJ5+JaOqKb84VMa8g=; b=NjHjm5kPl4xbd4
	8/m56m6jRQD/sHH7F45fcSJLLoEyabjHywuPTMAqukJtI0PKM08BtUUyrPZnDN+caBV4YsY3mvbJ3
	NS0ABdn+vQ7HpoxY2T9O3Hb7lrUjLz+dCnglOzWVfCR6cpiWobf08BQ5jYfyLn6pVBzZzkwVi2mCm
	5y2CcVqU7fP6nUJCeK8y3V/BxBe8EskyRMcvqjX7Od1ZrsocxVbM1W/2CCdWoT45iRJIsv51G/rxO
	JxE2CM60Zq2TmObqMQ6gbbu7zgxfdr/XQ/vQbOtsO/IKxAOzYskUmth8V/hpcDv6u9e0ntomWJKd5
	XYBG+idCAjV6t0GxXThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhW7i-00GJR9-Br; Mon, 01 Nov 2021 12:09:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhW6n-00GJ0s-Dk; Mon, 01 Nov 2021 12:08:15 +0000
X-UUID: 12d024a9867047e0b036382f15148c17-20211101
X-UUID: 12d024a9867047e0b036382f15148c17-20211101
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1383789084; Mon, 01 Nov 2021 05:08:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 05:08:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 1 Nov 2021 20:08:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Nov 2021 20:08:05 +0800
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
Subject: [PATCH V5,5/5] media: mtk-jpegenc: add output pic reorder interface
Date: Mon, 1 Nov 2021 20:07:50 +0800
Message-ID: <1635768470-24178-6-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1635768470-24178-1-git-send-email-kyrie.wu@mediatek.com>
References: <1635768470-24178-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_050813_481672_D11F96B5 
X-CRM114-Status: GOOD (  17.12  )
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

There are two HWs in mt8195. Since the two HWs run
in parallel, it is necessary to reorder the output images
to ensure that the order is consistent with the input images.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
V5: no change
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 46 ++++++++++++++++++++++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  4 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c |  4 +-
 3 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 64353c9..0ed962d 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -912,6 +912,48 @@ static int mtk_jpeg_set_dec_dst(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
+void mtk_jpeg_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
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
+	dst_buffer = jpeg->hw_param.dst_buffer;
+	if (!dst_buffer) {
+		dev_err(jpeg->dev, "comp_jpeg dst_buffer fail !!!\n");
+		return;
+	}
+
+	dst_done_buf = mtk_jpeg_vb2_to_srcbuf(&dst_buffer->vb2_buf);
+	spin_lock_irqsave(&ctx->done_queue_lock, flags);
+	list_add_tail(&dst_done_buf->list, &ctx->dst_done_queue);
+
+	while (!list_empty(&ctx->dst_done_queue) &&
+		(pos != &ctx->dst_done_queue)) {
+		list_for_each_prev_safe(pos, temp_entry,
+			(&ctx->dst_done_queue)) {
+			tmp_dst_done_buf = list_entry(pos,
+				struct mtk_jpeg_src_buf, list);
+			if (tmp_dst_done_buf->frame_num ==
+				ctx->last_done_frame_num) {
+				list_del(&tmp_dst_done_buf->list);
+				v4l2_m2m_buf_done(&tmp_dst_done_buf->b,
+					VB2_BUF_STATE_DONE);
+				ctx->last_done_frame_num++;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
+}
+
 static int mtk_jpeg_select_hw(struct mtk_jpeg_ctx *ctx)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg;
@@ -1339,8 +1381,10 @@ static int mtk_jpeg_open(struct file *file)
 		goto free;
 	}
 
-	if (jpeg->variant->is_encoder)
+	if (jpeg->variant->is_encoder) {
 		INIT_WORK(&ctx->jpeg_work, mtk_jpegenc_worker);
+		INIT_LIST_HEAD(&ctx->dst_done_queue);
+	}
 
 	v4l2_fh_init(&ctx->fh, vfd);
 	file->private_data = &ctx->fh;
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index a9000da..a3046f8 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -233,8 +233,12 @@ struct mtk_jpeg_ctx {
 
 	struct work_struct jpeg_work;
 	u32 total_frame_num;
+	struct list_head dst_done_queue;
+	spinlock_t done_queue_lock;
+	u32 last_done_frame_num;
 };
 
 extern struct platform_driver mtk_jpegenc_hw_driver;
+void mtk_jpeg_put_buf(struct mtk_jpegenc_comp_dev *jpeg);
 
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
index 7b758fe..6474aba 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
@@ -292,6 +292,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	wake_up(&master_jpeg->hw_wq);
 
 	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpeg_put_buf(cjpeg);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -329,8 +330,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 
 	v4l2_m2m_buf_done(src_buf, buf_state);
-	v4l2_m2m_buf_done(dst_buf, buf_state);
-	v4l2_m2m_job_finish(master_jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	mtk_jpeg_put_buf(jpeg);
 	clk_disable_unprepare(jpeg->pm.venc_clk.clk_info->jpegenc_clk);
 	pm_runtime_put(ctx->jpeg->dev);
 	if (ctx->fh.m2m_ctx &&
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
