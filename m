Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59656C05021
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwUqa5HdF8CXo9llbsa9/qBISHufFoE9to4waBbzjLM=; b=O6txgtTt+dzedQSi7sQvTxD4Yy
	2lr5gl/63k18ey3ICwilwenXF2UtPaXDH3dCyhhn4xxqWshsNyFUWgUZD8JoyyHyxUqTbHTc2soaF
	yWueNukfAxpOMHppUtwi6VZl9w0uaE6+69fZR6hRQJSDBBi0LTy9qKO145dbvZG2eJ/HlaWxDAKXI
	I6EwjKteE9f5ALS4Bk+KkUJtXS+u8nJ7/k/r+YlHY8rkaJOxzP6Tx1dLdT5uIrZfiPVwM6ju5RtGL
	nCjtnNhRabv/vd5/cyjQ8rMI2qHyzdesXYxIVYGSBKIVZ2mY5Qgojrco/CEK9+/e0OrK6bIscGwtY
	SqDff+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r17xy-006jx6-0f;
	Thu, 09 Nov 2023 16:33:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r17xX-006jXM-30;
	Thu, 09 Nov 2023 16:32:52 +0000
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B59066076AC;
	Thu,  9 Nov 2023 16:32:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547566;
	bh=HIlfDDc1yt0AkEeBwOv0mebU/q9oPujB/yaRxbJKFEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fb4PLgLzYiJkPvCBtHHF8dH8qT8cEJHNQvf8/8aa9TTftdKdATmuxa9tIIyLGKVHB
	 15c8Dig7sOncURHuDW+o7X9HGNRPAhrvhZ5B3yurwe6lyfrJKiJL/OL0zdLfTL4l2w
	 Fc1UU/1HeyFbTP7ZPhQXHILHNY/R6K4dm2K99z4WxjJJwHAPL8n54kGjNlnVSH0BqH
	 SsEbwN4wwkWFO+VaaQfJU7FwzSnmc+NHongcNY18/UcK17tYtCYUnwiMMnXhfGvq2G
	 liZpxpRAPCA50qeVQ0Hd7Clan8L/SX4sUMmsHtp3IfFT+ZVOYahEcv2ZMnttGWfE11
	 /isYB6WRIHaOA==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Zhou Peng <eagle.zhou@nxp.com>
Subject: [PATCH v15 10/56] media: amphion: Stop direct calls to queue num_buffers field
Date: Thu,  9 Nov 2023 17:29:22 +0100
Message-Id: <20231109163008.179152-11-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
References: <20231109163008.179152-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083248_213701_7D19D99C 
X-CRM114-Status: GOOD (  13.00  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
This allows us to change how the number of buffers is computed in the
future.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Ming Qian <ming.qian@nxp.com>
CC: Zhou Peng <eagle.zhou@nxp.com>
---
 drivers/media/platform/amphion/vpu_dbg.c  | 8 ++++----
 drivers/media/platform/amphion/vpu_v4l2.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index a462d6fe4ea9..940e5bda5fa3 100644
--- a/drivers/media/platform/amphion/vpu_dbg.c
+++ b/drivers/media/platform/amphion/vpu_dbg.c
@@ -87,7 +87,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	num = scnprintf(str, sizeof(str),
 			"output (%2d, %2d): fmt = %c%c%c%c %d x %d, %d;",
 			vb2_is_streaming(vq),
-			vq->num_buffers,
+			vb2_get_num_buffers(vq),
 			inst->out_format.pixfmt,
 			inst->out_format.pixfmt >> 8,
 			inst->out_format.pixfmt >> 16,
@@ -111,7 +111,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	num = scnprintf(str, sizeof(str),
 			"capture(%2d, %2d): fmt = %c%c%c%c %d x %d, %d;",
 			vb2_is_streaming(vq),
-			vq->num_buffers,
+			vb2_get_num_buffers(vq),
 			inst->cap_format.pixfmt,
 			inst->cap_format.pixfmt >> 8,
 			inst->cap_format.pixfmt >> 16,
@@ -139,7 +139,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 		return 0;
 
 	vq = v4l2_m2m_get_src_vq(inst->fh.m2m_ctx);
-	for (i = 0; i < vq->num_buffers; i++) {
+	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
 
@@ -161,7 +161,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	}
 
 	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
-	for (i = 0; i < vq->num_buffers; i++) {
+	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
 
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 0f6e4c666440..87afb4a18d5d 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -439,7 +439,7 @@ int vpu_get_num_buffers(struct vpu_inst *inst, u32 type)
 	else
 		q = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
 
-	return q->num_buffers;
+	return vb2_get_num_buffers(q);
 }
 
 static void vpu_m2m_device_run(void *priv)
@@ -587,7 +587,7 @@ static int vpu_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		  fmt->sizeimage[0], fmt->bytesperline[0],
 		  fmt->sizeimage[1], fmt->bytesperline[1],
 		  fmt->sizeimage[2], fmt->bytesperline[2],
-		  q->num_buffers);
+		  vb2_get_num_buffers(q));
 	vb2_clear_last_buffer_dequeued(q);
 	ret = call_vop(inst, start, q->type);
 	if (ret)
-- 
2.39.2


