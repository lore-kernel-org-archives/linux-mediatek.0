Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB098E82CA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQ5F4xfO7mIkMqtItWWZDGjXEjnB/2LPnEMxgf06HOQ=; b=urCfX2Y7xrDLZv5uLhHk+TG2e/
	XpWWKKaHDMTCuybkGeIsIGFr5ei6tJ6GJ7Xl/j/3+BMJLp0nL8kgZiypuQtY0VRcbf1PThlIFsDm+
	kR24VsFzWNnAxID+SeQbhXb4vQ/m/JBniXSxhZJnCQftZot4uzgT+QtIcSlqIHJrCL6aeg2ZC9tkU
	X62/kOye06YNWMnKK7ISYgN5fOj+nUjopEuie7EG7A/OAZiixA/Ncz1doZZJ+xerXNEaEMNrv5aX3
	P/eCI92MyIJaYilP5vSQPm+nY/7gSPVfJtkLH3aakp8UuC5iXwZq8SR8RIuNCxL+HUeGFRDERLLMG
	ajfRfG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWd1-001JKi-1D;
	Wed, 27 Sep 2023 15:39:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaN-001GST-2w;
	Wed, 27 Sep 2023 15:36:28 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F29926607335;
	Wed, 27 Sep 2023 16:36:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828982;
	bh=r/+dARFgLlqIYPCNsTNg9ylalWpmLzdptnRKI8OWLEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aSOimQXMIW+49l31wI1KQgm0XsBtCBVTU5B8sqwye2iIIC4QZl/wREklsOInZCmf0
	 xCRFy99PlxcuWJjoa+5G08fmEyWRBZ/B5VoxGT1VPc7y+W7n01POEpuFrXOQPg4Nxf
	 mq3LpJXbP99W+yT6/qjak2BeVmIbEMfe0NWPAg65YaQthEpXuM0+uu80D2K/EdJ2X6
	 p+riyyTMIfh7ImGrRkTijyzZbzes8lBvQKvIxp2uuF7f/pN8ofclzmOED4d6ZjAI/k
	 RDUZCrb0S7veF0oJq9upFuMXy+026Oq01T1dzOnGzMonsiQNDErHKhQ9OeV5aR49oA
	 LP9nz/52kba+Q==
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 30/53] media: amphion: Stop direct calls to queue num_buffers field
Date: Wed, 27 Sep 2023 17:35:35 +0200
Message-Id: <20230927153558.159278-31-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_083624_110226_79B3337B 
X-CRM114-Status: GOOD (  12.58  )
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/amphion/vpu_dbg.c  | 8 ++++----
 drivers/media/platform/amphion/vpu_v4l2.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
index a462d6fe4ea9..61530ef92ff0 100644
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
+	for (i = 0; i < vq->max_allowed_buffers; i++) {
 		struct vb2_buffer *vb;
 		struct vb2_v4l2_buffer *vbuf;
 
@@ -161,7 +161,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
 	}
 
 	vq = v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx);
-	for (i = 0; i < vq->num_buffers; i++) {
+	for (i = 0; i < vq->max_allowed_buffers; i++) {
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


