Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A084C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BZ9mr19+QPA9jUdzs0xuiBDlBo5kmNCVEXZZ8zEwBMM=; b=hCGXATPBrjP7qIhVh2O9zal+Qf
	SK7PqUurYU5b4OpK2p1pS3uzy8l6AhhDIPp+WvuBpYyvjmc+kkC6rKFywkxZGWJsib1x8eUM8VYyJ
	v+nxuzi0TFHdAN8iafbmGQq6YyTFzSCM9gJzwwOQlEV+N36a6cjrmRWHMxLNIW3hWGAlKPva7mSzR
	MwwyQVIw5GsZeuFNfu4eoij/VVE0i2bWEkmnoWZTWbUJYAtSv1ABkQykd8bh0Io7AjF9Lc0NnN7+5
	O+X7mF0+UI3R4d4o0Zd5koc74I+q6zkzih/zIfOVyFBMN3HJ3Q1Gd2wJ1buNW5HNXdOc3pjcvnFhd
	1XcQ5Ayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZFZ-00C27g-2G;
	Tue, 21 Mar 2023 10:29:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZEw-00C1ht-0N;
	Tue, 21 Mar 2023 10:29:16 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f5ef:1040:e3c1:3d00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E27B666030E9;
	Tue, 21 Mar 2023 10:29:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679394552;
	bh=B0Rfbtcd7Lj6Gt4LwrxhZy0EbZHQ5j8h6KrandWni6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7ybreOdVzDSiHTzKZh1y3KSBMBFwimkHYkkSq/PYEu0qP70tXr1PdbsOoPEhW08E
	 kmw3KFdN7WwfDalciAutik2Q9MFIgEV1NQjlMXlZHzuhAyAo6gV4ShLd7mWg6yeaup
	 6UETgFv2/3RzfMQLjjAbvlG+AT8E+hRBLjKjiDlSAielO9/FuAtP2bO5wfcBltixR8
	 SdNTY2r/6XhkgpE9msAKGD0zYVu2+PTelJ9U7tDefT0uw2xhOl4LDfjWyu596D5HwH
	 cDVPmRoAxZuuWFGu2KO/PMoXC7aGxYj0qBzN1lAKFerJkURxEIzJRYJNQbwVmMt+PW
	 wdP9KV3p8RI0Q==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	ming.qian@nxp.com,
	shijie.qin@nxp.com,
	eagle.zhou@nxp.com,
	bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	daniel.almeida@collabora.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	jernel@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 6/8] media: v4l2: Add mem2mem helpers for DELETE_BUF ioctl
Date: Tue, 21 Mar 2023 11:28:53 +0100
Message-Id: <20230321102855.346732-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_032914_297240_11C1445A 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

Create v4l2-mem2mem helpers for VIDIOC_DELETE_BUF ioctl.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 20 ++++++++++++++++++++
 include/media/v4l2-mem2mem.h           | 12 ++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 0cc30397fbad..42f51ca25379 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -831,6 +831,17 @@ int v4l2_m2m_prepare_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_prepare_buf);
 
+int v4l2_m2m_delete_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			struct v4l2_buffer *buf)
+{
+	struct vb2_queue *vq;
+
+	vq = v4l2_m2m_get_vq(m2m_ctx, buf->type);
+
+	return vb2_delete_buf(vq, buf);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_delete_buf);
+
 int v4l2_m2m_create_bufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			 struct v4l2_create_buffers *create)
 {
@@ -1377,6 +1388,15 @@ int v4l2_m2m_ioctl_create_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_create_bufs);
 
+int v4l2_m2m_ioctl_delete_buf(struct file *file, void *priv,
+			      struct v4l2_buffer *buf)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_delete_buf(file, fh->m2m_ctx, buf);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_delete_buf);
+
 int v4l2_m2m_ioctl_querybuf(struct file *file, void *priv,
 				struct v4l2_buffer *buf)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index bb9de6a899e0..96f1b1f3b840 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -381,6 +381,16 @@ int v4l2_m2m_dqbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_prepare_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			 struct v4l2_buffer *buf);
 
+/**
+ * v4l2_m2m_delete_buf() - delete buffer from the queue
+ *
+ * @file: pointer to struct &file
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @buf: pointer to struct &v4l2_buffer
+ */
+int v4l2_m2m_delete_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			struct v4l2_buffer *buf);
+
 /**
  * v4l2_m2m_create_bufs() - create a source or destination buffer, depending
  * on the type
@@ -846,6 +856,8 @@ int v4l2_m2m_ioctl_reqbufs(struct file *file, void *priv,
 				struct v4l2_requestbuffers *rb);
 int v4l2_m2m_ioctl_create_bufs(struct file *file, void *fh,
 				struct v4l2_create_buffers *create);
+int v4l2_m2m_ioctl_delete_buf(struct file *file, void *priv,
+				struct v4l2_buffer *buf);
 int v4l2_m2m_ioctl_querybuf(struct file *file, void *fh,
 				struct v4l2_buffer *buf);
 int v4l2_m2m_ioctl_expbuf(struct file *file, void *fh,
-- 
2.34.1


