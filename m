Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AF4E75439
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 08:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og4LlbJBiymUpAzpII335idKUT/YD2hVLoI7j+fK+Do=; b=0V93gHUsX9oBxvrGl9u9em3rZX
	M6CLonu33fMoBKlb429bi+dHbrrU2/+zBcZMZGv6CMScRhRigucuN8hhTBJlMyipcobjJckRhJDn1
	WEg+6B5JbGU06d5cUmFhLOdbQ7Ntxyl7wxC6jl68kxNzZB48486moEBuBVezunV9xkyM8T04HQ8Ur
	XBKarKAvn322M4lTlpg9poTS0L1qZP1vEbvmc6eTWo0Xgi7QDm22Azx/UJXtHN5i+T2zIDji8EV+6
	29uDx/MphLeRsbB32kJIvMyAXKp0qW207JxqjA9BJtkbldBXUwE3TrCC21WIIkpwACP8WRRtqEIhn
	v7g3ZG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaTm-00E6Xp-1t;
	Tue, 03 Oct 2023 08:10:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnaRT-00E3a4-23;
	Tue, 03 Oct 2023 08:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Og4LlbJBiymUpAzpII335idKUT/YD2hVLoI7j+fK+Do=; b=tY50eASRDFczuUqWsOyiDTjnr9
	ujnDTbK6g1IhBPyZc0krtlVwy9ApUyWc4c6jnQ4wiTCK1XDr7B1yBZ1DZY8RbYlv3Btza4uB3I6/L
	y+r3gyLPDgQi92UTrLSyapR7YUabhCWjGfF1d90GjQyXEYme+e2nqzihdr2IhdkGWXF9I9DDJSaS/
	3czxlsu9daNPTplNiwCXKgBkcfRwZsbS+2U34M/pieW3KAK2WpKuqHHi1mxtOE9s7CIaSDAcHCNNM
	N8zJaWmWavJvIMTk59zMOT94MIl/ZBerwEl4YZXzIEfbDMQjAx5sYZ8JvEXsvEcD+ldANyMAC/Y9u
	eGUIHDpg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qnaRQ-00DuHP-6L; Tue, 03 Oct 2023 08:07:42 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:b6df:b784:6a0f:8451])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73F44660735F;
	Tue,  3 Oct 2023 09:07:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696320458;
	bh=wB4sQiMR9YdZLlurPoJdXQiGaX0CoGGpXiBFK9+XFCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O2cJokiLRxG/YD7xdQKkS1vBqzB4psIO4k5MD3aEjjDk0Jh4oq75A77DkV8PChVC+
	 0ixtP0ze4Cyw99Alaby7ILg3eVsKBcQ8iuz0RhrMWC1RkTMoZ2SV+4vU1ZJhEQh2ZS
	 BSfHaRoDF8ROJuxk14DG+Jqm7ys3syfYpMKJ7pUFM0LPKCXNk5T5YhgdiCJMkUcIDu
	 6KrHXI66QTEpSiOrzOc+wTpf3DUbR2LYwLoUL8EywBAduEz6tK/vVhRorxA1cY2eWi
	 64aw7OcnNoJw4wo5IsmQ9vtjRL5+VmQ17XZVqUcrjn2r3fbM4MAkKLCBJxBplSN+c8
	 dlamxslWhVT7Q==
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
Subject: [PATCH v10 49/54] media: core: Rework how create_buf index returned value is computed
Date: Tue,  3 Oct 2023 10:06:58 +0200
Message-Id: <20231003080704.43911-50-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
References: <20231003080704.43911-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_090740_309230_4D4CEE41 
X-CRM114-Status: GOOD (  15.05  )
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

When DELETE_BUFS will be introduced holes could created in bufs array.
To be able to reuse these unused indices reworking how create->index
is set is mandatory.
Let __vb2_queue_alloc() decide which first index is correct and
forward this to the caller.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 21 ++++++++++++-------
 .../media/common/videobuf2/videobuf2-v4l2.c   | 20 +++++++++++-------
 include/media/videobuf2-core.h                |  5 ++++-
 3 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 62e987ad9b33..21ea096864a5 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -441,15 +441,21 @@ static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
  */
 static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			     unsigned int num_buffers, unsigned int num_planes,
-			     const unsigned plane_sizes[VB2_MAX_PLANES])
+			     const unsigned plane_sizes[VB2_MAX_PLANES],
+			     unsigned int *first_index)
 {
 	unsigned int buffer, plane;
 	struct vb2_buffer *vb;
+	unsigned long index;
 	int ret;
 
 	/* Ensure that the number of already queue + num_buffers is below q->max_num_buffers */
 	num_buffers = min_t(unsigned int, num_buffers,
-			    q->max_num_buffers - q->num_buffers);
+			    q->max_num_buffers - vb2_get_num_buffers(q));
+
+	index = vb2_get_num_buffers(q);
+
+	*first_index = index;
 
 	for (buffer = 0; buffer < num_buffers; ++buffer) {
 		/* Allocate vb2 buffer structures */
@@ -469,7 +475,7 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 			vb->planes[plane].min_length = plane_sizes[plane];
 		}
 
-		vb2_queue_add_buffer(q, vb, q->num_buffers + buffer);
+		vb2_queue_add_buffer(q, vb, index++);
 		call_void_bufop(q, init_buffer, vb);
 
 		/* Allocate video buffer memory for the MMAP type */
@@ -812,7 +818,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned int q_num_bufs = vb2_get_num_buffers(q);
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
 	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
-	unsigned int i;
+	unsigned int i, first_index;
 	int ret = 0;
 
 	if (q->streaming) {
@@ -898,7 +904,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 
 	/* Finally, allocate buffers and video memory */
 	allocated_buffers =
-		__vb2_queue_alloc(q, memory, num_buffers, num_planes, plane_sizes);
+		__vb2_queue_alloc(q, memory, num_buffers, num_planes, plane_sizes, &first_index);
 	if (allocated_buffers == 0) {
 		dprintk(q, 1, "memory allocation failed\n");
 		ret = -ENOMEM;
@@ -972,7 +978,8 @@ EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			 unsigned int flags, unsigned int *count,
 			 unsigned int requested_planes,
-			 const unsigned int requested_sizes[])
+			 const unsigned int requested_sizes[],
+			 unsigned int *first_index)
 {
 	unsigned int num_planes = 0, num_buffers, allocated_buffers;
 	unsigned plane_sizes[VB2_MAX_PLANES] = { };
@@ -1034,7 +1041,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 
 	/* Finally, allocate buffers and video memory */
 	allocated_buffers = __vb2_queue_alloc(q, memory, num_buffers,
-				num_planes, plane_sizes);
+				num_planes, plane_sizes, first_index);
 	if (allocated_buffers == 0) {
 		dprintk(q, 1, "memory allocation failed\n");
 		ret = -ENOMEM;
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index a4ebef82d94e..6d9f1be41a19 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -808,11 +808,16 @@ int vb2_create_bufs(struct vb2_queue *q, struct v4l2_create_buffers *create)
 	for (i = 0; i < requested_planes; i++)
 		if (requested_sizes[i] == 0)
 			return -EINVAL;
-	return ret ? ret : vb2_core_create_bufs(q, create->memory,
-						create->flags,
-						&create->count,
-						requested_planes,
-						requested_sizes);
+	if (ret)
+		return ret;
+
+	ret = vb2_core_create_bufs(q, create->memory,
+				   create->flags,
+				   &create->count,
+				   requested_planes,
+				   requested_sizes,
+				   &create->index);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(vb2_create_bufs);
 
@@ -1040,15 +1045,16 @@ int vb2_ioctl_create_bufs(struct file *file, void *priv,
 	int res = vb2_verify_memory_type(vdev->queue, p->memory,
 			p->format.type);
 
-	p->index = vdev->queue->num_buffers;
 	fill_buf_caps(vdev->queue, &p->capabilities);
 	validate_memory_flags(vdev->queue, p->memory, &p->flags);
 	/*
 	 * If count == 0, then just check if memory and type are valid.
 	 * Any -EBUSY result from vb2_verify_memory_type can be mapped to 0.
 	 */
-	if (p->count == 0)
+	if (p->count == 0) {
+		p->index = vb2_get_num_buffers(vdev->queue);
 		return res != -EBUSY ? res : 0;
+	}
 	if (res)
 		return res;
 	if (vb2_queue_is_busy(vdev->queue, file))
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index dffb9647d4d1..d433bf84e30c 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -803,6 +803,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
  * @count: requested buffer count.
  * @requested_planes: number of planes requested.
  * @requested_sizes: array with the size of the planes.
+ * @first_index: index of the first created buffer, all allocated buffers have
+ *		 indices in the range [first..first+count]
  *
  * Videobuf2 core helper to implement VIDIOC_CREATE_BUFS() operation. It is
  * called internally by VB2 by an API-specific handler, like
@@ -819,7 +821,8 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			 unsigned int flags, unsigned int *count,
 			 unsigned int requested_planes,
-			 const unsigned int requested_sizes[]);
+			 const unsigned int requested_sizes[],
+			 unsigned int *first_index);
 
 /**
  * vb2_core_prepare_buf() - Pass ownership of a buffer from userspace
-- 
2.39.2


