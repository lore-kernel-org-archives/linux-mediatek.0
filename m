Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3829DEEAA42
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c65cPWzb/rGUIDWBxTTNQVYghy/Q4FEJyDB3E6oc0aI=; b=1yYl+fnK554ZU32ONG2JS4b+pg
	1ZBXKdLzWH5kzVPlxcEQbT+yzjUu7Y0YilVWOEDw2zNSiIbftA+NaZcsWl0m2/hnTtNEMcXDXxHM/
	aywEjXZSIxmZFAgOEvZ+K5/x4AskUdDseKyynGF8R82nsULy42ZNxsP4w9uqViUtclVOJjjeZUCfi
	M0UOogMWBx8rVtnFYL3UlDhd1PcfaT57XxzEkqgDzSQeuFMmocaZhOhAnizOxV8QjxsFTI/KCrc8W
	CZwnmFRXWKiw1Q9mi5n1Ivb1G41NAyCivRIxoKIBlPiTJ9qqKz747lQGEBFAVlm2vQB2O/yhm8Y4Z
	ZlJ1spSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmX9-008WBC-1P;
	Thu, 14 Sep 2023 13:37:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTr-008Sfz-0Q;
	Thu, 14 Sep 2023 13:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c65cPWzb/rGUIDWBxTTNQVYghy/Q4FEJyDB3E6oc0aI=; b=PMUi521kqIC9RFKYZU0bBH8sfg
	TsysYktThLof8e5RBa5Rc4wWfAzJKWfFepq0DZAveLzQpSEl+Nv/gnwWe+Wc6WOYVXCI4CS877XWE
	NNi5RlRRtgKHDM5OFl3fthEiiiQHA81gME473jZ6yV8KMcKRTP5A6KlWpuL5prJTm0AWUD8TfG3Jm
	Q2QkRoHeYfQ1HPmI7UM2Fj9umy//qTY/8qvjcBUDoUmV3BeF0iFQaFNbmMXafTO8LaUHYP+beN1Gj
	ITN4Wmz37VhEdoO2WrkbfX1CGYT1l0LvlP4/kzs10/boO/GoXTLpVozDWkg9SRci/7Ih9cC+/IUap
	pAOcfr8w==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qgmTm-003BHv-WC; Thu, 14 Sep 2023 13:34:01 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30B6D660739D;
	Thu, 14 Sep 2023 14:33:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698436;
	bh=pnW19QGFHas/i7g4P9JRpTYH72fRU9HVTUZzFWqPek8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S/frdpA8eHkZ0lhsb6OXaBYpSmudN8EVRpzSoC5DCuaFoMu4vkWO3UO30WMap3lhx
	 vlEIkg5EeJSc9xDMj78nC6kh+Bz3nHL3yjq0zCFAGiBEZSiSNP45IPDu39o7jbFWKh
	 cCgy2t7vPOG96yTnB8sFbtJZs+HBoXtBq2XHU6/yEz0YtWDZnf39nwO2K/3kivxSSO
	 W0TsANhosjjYHQ4+UyY2ytP1yKW71yRysB6IyV2TI7rvP9ilbajOUDDPXC1h+wv7Az
	 /yDh4VvFsUr5vS8fSpUdwarVm7GMvygsYN+4kstLKwMLqxL7wgiy4sxp3XCr5p7tLo
	 XFnuUK7BmSP5Q==
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
Subject: [PATCH v7 48/49] media: v4l2: Add mem2mem helpers for DELETE_BUFS ioctl
Date: Thu, 14 Sep 2023 15:33:22 +0200
Message-Id: <20230914133323.198857-49-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143359_189203_B45E8612 
X-CRM114-Status: GOOD (  10.69  )
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

Create v4l2-mem2mem helpers for VIDIOC_DELETE_BUFS ioctl.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/platform/verisilicon/hantro_v4l2.c  |  1 +
 drivers/media/test-drivers/vim2m.c            |  1 +
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 20 +++++++++++++++++++
 include/media/v4l2-mem2mem.h                  | 12 +++++++++++
 4 files changed, 34 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index 27a1e77cca38..0fd1c2fc78c8 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -756,6 +756,7 @@ const struct v4l2_ioctl_ops hantro_ioctl_ops = {
 	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
 	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
 	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_delete_bufs = v4l2_m2m_ioctl_delete_bufs,
 	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
 
 	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 3e3b424b4860..10bd8c92e340 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -960,6 +960,7 @@ static const struct v4l2_ioctl_ops vim2m_ioctl_ops = {
 	.vidioc_dqbuf		= v4l2_m2m_ioctl_dqbuf,
 	.vidioc_prepare_buf	= v4l2_m2m_ioctl_prepare_buf,
 	.vidioc_create_bufs	= v4l2_m2m_ioctl_create_bufs,
+	.vidioc_delete_bufs	= v4l2_m2m_ioctl_delete_bufs,
 	.vidioc_expbuf		= v4l2_m2m_ioctl_expbuf,
 
 	.vidioc_streamon	= v4l2_m2m_ioctl_streamon,
diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 0cc30397fbad..d1d59943680f 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -831,6 +831,17 @@ int v4l2_m2m_prepare_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_prepare_buf);
 
+int v4l2_m2m_delete_bufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_delete_buffers *d)
+{
+	struct vb2_queue *vq;
+
+	vq = v4l2_m2m_get_vq(m2m_ctx, d->type);
+
+	return vb2_delete_bufs(vq, d);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_delete_bufs);
+
 int v4l2_m2m_create_bufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			 struct v4l2_create_buffers *create)
 {
@@ -1377,6 +1388,15 @@ int v4l2_m2m_ioctl_create_bufs(struct file *file, void *priv,
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_create_bufs);
 
+int v4l2_m2m_ioctl_delete_bufs(struct file *file, void *priv,
+			       struct v4l2_delete_buffers *d)
+{
+	struct v4l2_fh *fh = file->private_data;
+
+	return v4l2_m2m_delete_bufs(file, fh->m2m_ctx, d);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_delete_bufs);
+
 int v4l2_m2m_ioctl_querybuf(struct file *file, void *priv,
 				struct v4l2_buffer *buf)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index d6c8eb2b5201..161f85c42dc8 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -381,6 +381,16 @@ int v4l2_m2m_dqbuf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_prepare_buf(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 			 struct v4l2_buffer *buf);
 
+/**
+ * v4l2_m2m_delete_bufs() - delete buffers from the queue
+ *
+ * @file: pointer to struct &file
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @d: pointer to struct &v4l2_delete_buffers
+ */
+int v4l2_m2m_delete_bufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
+			 struct v4l2_delete_buffers *d);
+
 /**
  * v4l2_m2m_create_bufs() - create a source or destination buffer, depending
  * on the type
@@ -860,6 +870,8 @@ int v4l2_m2m_ioctl_reqbufs(struct file *file, void *priv,
 				struct v4l2_requestbuffers *rb);
 int v4l2_m2m_ioctl_create_bufs(struct file *file, void *fh,
 				struct v4l2_create_buffers *create);
+int v4l2_m2m_ioctl_delete_bufs(struct file *file, void *priv,
+			       struct v4l2_delete_buffers *d);
 int v4l2_m2m_ioctl_querybuf(struct file *file, void *fh,
 				struct v4l2_buffer *buf);
 int v4l2_m2m_ioctl_expbuf(struct file *file, void *fh,
-- 
2.39.2


