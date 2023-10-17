Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE3FCDB484
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qohW5pmmQh0DWsrapHLKSsqZ2JpkpStWo3TKTuHP/Jg=; b=B3PvoVgx7EmHS6kppP6WtFclE1
	NyrNyU/PgJhW8eoicsLBvT0f3nMM44pSLFBo5ZX46n8GF0jHnwz/vpZ/ANaAT0O1eMomDuMEZBRQU
	i2E3yGGeCWrBGK5m+QnsLy+rZ3IshDnW2wyWrkbyt7YydHLZfUyWQPCqfPWXJ2VZCmdRDq2WIbohK
	7P07k0/u2Y4uoyc0uWRVv5Hst06SGswjJ1uP3ihAot+1SortqW2n6Tr1LT4dpT7J4rYotR0DDSq/y
	DkkykMdKcKDVKJF6/9ewtJa8uJP2hXeA1BmHtTuIT6J8gogle47eDSNy2tXRqr+OBTY9ExmDvZ4OZ
	nMKD7U/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslQm-00CdPN-3D;
	Tue, 17 Oct 2023 14:52:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslN4-00CZLp-2V;
	Tue, 17 Oct 2023 14:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qohW5pmmQh0DWsrapHLKSsqZ2JpkpStWo3TKTuHP/Jg=; b=Q1zleLz6SoPGhkht4sUpLANGBU
	vvasrf+2Pud6TvDZycePEugOA99OBawrmY2DdgQCFt8SE6kuSuYvuvSLYIMYWbu8tHuBL2VZb4pqP
	hsKa2iFQv3u9iCYRF8zElq8uHLNYOxw0pLVaJ4qT6D6GEIpqnzM1uiWIVJltTlprDgzdGT0loDfeA
	2EoYC547+p6FznEIX9oXW8BPMOGlZ9y0uzfZ4wshY5hucOTUzCA5kaiE26mxnrhrQZqd0J2C59P7q
	glNWv3EOXFwmb8h1uKC3Op53WQ93T2t9+Vq+cMyPw9Iq+DYZtsoIcMZ8Ca9/WekxvnyOruvY0n6MQ
	je9KO0+A==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMy-007A4W-0E;
	Tue, 17 Oct 2023 14:48:33 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7ED6866073AB;
	Tue, 17 Oct 2023 15:48:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554106;
	bh=YFENQbVmLTiysDWwPdN981HVDtJ6GVsM6HkpZqvi5ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LLSxVJpTzkgnjFsQNV+YUzMM5fPEIjlNyOdQaQ9se5UAGTDb5WWW/5hAEPROA/E8V
	 9AV83aagWAUOc1QHbvoPtTLxGY5XxSsCKv8jN7Z0LTmFDK+TtdDo5fmYVwBzpVn6gD
	 DMMgNx8bd14B/dqhMG1IuEfb2/pyVTmcjzzUjpc5FEDJFHVP9eZPbLumPIKMvcvRWI
	 Pe7O4Gp08cPzJxF1Q8qdWEfQKxqwNVP5zXABvdYoGakO8RgB3L+jau/eBc5wT6UWO9
	 D+t77GUuk7xad2CAP5BftO49hQkYwlE+IQeuQ/JY5qThCsLCxZjvlnz9R6zf9GJ1gg
	 4ZRj/Re0Y3CIA==
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
Subject: [PATCH v12 44/56] media: core: Report the maximum possible number of buffers for the queue
Date: Tue, 17 Oct 2023 16:47:44 +0200
Message-Id: <20231017144756.34719-45-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_154828_571674_AAC72CD6 
X-CRM114-Status: GOOD (  14.27  )
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

Use one of the struct v4l2_create_buffers reserved bytes to report
the maximum possible number of buffers for the queue.
V4l2 framework set V4L2_BUF_CAP_SUPPORTS_SET_MAX_BUFS flags in queue
capabilities so userland can know when the field is valid.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../userspace-api/media/v4l/vidioc-create-bufs.rst        | 8 ++++++--
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst  | 1 +
 drivers/media/common/videobuf2/videobuf2-v4l2.c           | 2 ++
 drivers/media/v4l2-core/v4l2-ioctl.c                      | 4 ++--
 include/uapi/linux/videodev2.h                            | 7 ++++++-
 5 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
index a048a9f6b7b6..380195c2a00a 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-create-bufs.rst
@@ -116,9 +116,13 @@ than the number requested.
       - ``flags``
       - Specifies additional buffer management attributes.
 	See :ref:`memory-flags`.
-
     * - __u32
-      - ``reserved``\ [6]
+      - ``max_num_buffers``
+      - If V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability flag is set
+        this field indicate the maximum possible number of buffers
+        for this queue.
+    * - __u32
+      - ``reserved``\ [5]
       - A place holder for future extensions. Drivers and applications
 	must set the array to zero.
 
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index 099fa6695167..0b3a41a45d05 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -120,6 +120,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
+.. _V4L2-BUF-CAP-SUPPORTS-MAX-NUM-BUFFERS:
 
 .. raw:: latex
 
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index f3cf4b235c1f..201438ffd13f 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -680,6 +680,7 @@ EXPORT_SYMBOL(vb2_querybuf);
 static void fill_buf_caps(struct vb2_queue *q, u32 *caps)
 {
 	*caps = V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
+	*caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;
 	if (q->io_modes & VB2_MMAP)
 		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP;
 	if (q->io_modes & VB2_USERPTR)
@@ -762,6 +763,7 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	fill_buf_caps(q, &create->capabilities);
 	validate_memory_flags(q, create->memory, &create->flags);
 	create->index = vb2_get_num_buffers(q);
+	create->max_num_buffers = q->max_num_buffers;
 	if (create->count == 0)
 		return ret != -EBUSY ? ret : 0;
 
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9b1de54ce379..628b013ca0c4 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -483,9 +483,9 @@ static void v4l_print_create_buffers(const void *arg, bool write_only)
 {
 	const struct v4l2_create_buffers *p = arg;
 
-	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, ",
+	pr_cont("index=%d, count=%d, memory=%s, capabilities=0x%08x, max buffers=%u",
 		p->index, p->count, prt_names(p->memory, v4l2_memory_names),
-		p->capabilities);
+		p->capabilities, p->max_num_buffers);
 	v4l_print_format(&p->format, write_only);
 }
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3d4e490ce7c..13ddb5abf584 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1035,6 +1035,7 @@ struct v4l2_requestbuffers {
 #define V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS		(1 << 4)
 #define V4L2_BUF_CAP_SUPPORTS_M2M_HOLD_CAPTURE_BUF	(1 << 5)
 #define V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS		(1 << 6)
+#define V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS		(1 << 7)
 
 /**
  * struct v4l2_plane - plane info for multi-planar buffers
@@ -2605,6 +2606,9 @@ struct v4l2_dbg_chip_info {
  * @flags:	additional buffer management attributes (ignored unless the
  *		queue has V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS capability
  *		and configured for MMAP streaming I/O).
+ * @max_num_buffers: if V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS capability flag is set
+ *		this field indicate the maximum possible number of buffers
+ *		for this queue.
  * @reserved:	future extensions
  */
 struct v4l2_create_buffers {
@@ -2614,7 +2618,8 @@ struct v4l2_create_buffers {
 	struct v4l2_format	format;
 	__u32			capabilities;
 	__u32			flags;
-	__u32			reserved[6];
+	__u32			max_num_buffers;
+	__u32			reserved[5];
 };
 
 /*
-- 
2.39.2


