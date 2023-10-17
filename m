Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56641CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P++PSUnKxA1FoBnWZtRCB7asB3D81oFP8RoeOwSpsrM=; b=22dGFIehhlfkvG6bU31ULJAyO8
	HifxqqIdyYk5eInLjClvxSvixwUla9N+JztjjbBf7hggwCFjSjX1sA0ZrEIMOyOg+1RoL3SM0ryBB
	MpncQd3ORJiGt36WuGsOEFtVC8CqKw0+fGT/n4t+mLzeok8bdRpQgoesZTyC0qhcOCbUyc00fXbQI
	lnDD7/nSBwdz1bs/zjihIeebrQZA/Aik2bboRfu03np8ML5o5ic5hVmvv4qE1rWFdG7TOQevsBesD
	u3pQdeyTA3Ldbq3ZfKtZg9VZj5cV2Maw+2IioNX0O1ehF7HytnPUS+DQ2fyfPfrbWCOyv+1sDpTA0
	DaN/8vlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsmUb-00CnVI-1Y;
	Tue, 17 Oct 2023 16:00:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslMc-00CYnL-2M;
	Tue, 17 Oct 2023 14:48:10 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7205:da49:a7e8:59f8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4396B66072F6;
	Tue, 17 Oct 2023 15:48:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697554084;
	bh=7foNNb6amO3+FMMwIl173lEOz6gYhJG/dA79F9jwpAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DnM+rhD/8S8duXjkkh8w5r/Lh6WgtvuO8T7PkO2j1MSfgB2TDFlKvv99zmEAhCu/v
	 o0Z7Oi0VHkw1I3uLV8fYzw5JVW5ltgX8D12pZ2Q7x2rxk60kWb7+anXwyMFrYrcPvm
	 v/oOv/D2Vts8ZUJYm1gVYHL4sDG/hwZVEA6QDUlJM02Xw26B6+O3fXN6UPha6cTuMP
	 S6toJW93MkTIyqOf59mHw0LNF/1SJXKfSPSjDBuSxIJ1mbn5/uzl0QQ+rcIBvSHVk2
	 aXmFIvZWyOG+94Tq6/1aFuPSsL1HrkEzpFB3gjnHyS4P9fkcab3VSl/HNBd4yFhzjS
	 bPXnYd3yOIRkg==
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
Subject: [PATCH v12 02/56] media: videobuf2: Rework offset 'cookie' encoding pattern
Date: Tue, 17 Oct 2023 16:47:02 +0200
Message-Id: <20231017144756.34719-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
References: <20231017144756.34719-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_074807_025629_2AE65F89 
X-CRM114-Status: GOOD (  20.90  )
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

Change how offset 'cookie' field value is computed to make possible
to use more buffers.
The maximum number of buffers depends of PAGE_SHIFT value and can
go up to 0x7fff when PAGE_SHIFT = 12.
With this encoding pattern we know the maximum number that a queue
could store so we can check it at  queue init time.
It also make easier and faster to find buffer and plane from using
the offset field.
Change __find_plane_by_offset() prototype to return the video buffer
itself rather than it index.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 73 +++++++++----------
 1 file changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index a5e57affeb30..09be8e026044 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -31,6 +31,11 @@
 
 #include <trace/events/vb2.h>
 
+#define PLANE_INDEX_SHIFT	(PAGE_SHIFT + 3)
+#define PLANE_INDEX_MASK	0x7
+#define MAX_BUFFER_INDEX	BIT_MASK(30 - PLANE_INDEX_SHIFT)
+#define BUFFER_INDEX_MASK	(MAX_BUFFER_INDEX - 1)
+
 static int debug;
 module_param(debug, int, 0644);
 
@@ -358,21 +363,27 @@ static void __setup_offsets(struct vb2_buffer *vb)
 	unsigned int plane;
 	unsigned long offset = 0;
 
-	if (vb->index) {
-		struct vb2_buffer *prev = q->bufs[vb->index - 1];
-		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
-
-		offset = PAGE_ALIGN(p->m.offset + p->length);
-	}
+	/*
+	 * The offset "cookie" value has the following constraints:
+	 * - a buffer can have up to 8 planes.
+	 * - v4l2 mem2mem uses bit 30 to distinguish between
+	 *   OUTPUT (aka "source", bit 30 is 0) and
+	 *   CAPTURE (aka "destination", bit 30 is 1) buffers.
+	 * - must be page aligned
+	 * That led to this bit mapping when PAGE_SHIFT = 12:
+	 * |30                |29        15|14       12|11 0|
+	 * |DST_QUEUE_OFF_BASE|buffer index|plane index| 0  |
+	 * where there are 15 bits to store the buffer index.
+	 * Depending on PAGE_SHIFT value we can have fewer bits
+	 * to store the buffer index.
+	 */
+	offset = vb->index << PLANE_INDEX_SHIFT;
 
 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		vb->planes[plane].m.offset = offset;
+		vb->planes[plane].m.offset = offset + (plane << PAGE_SHIFT);
 
 		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
 				vb->index, plane, offset);
-
-		offset += vb->planes[plane].length;
-		offset = PAGE_ALIGN(offset);
 	}
 }
 
@@ -2188,10 +2199,9 @@ EXPORT_SYMBOL_GPL(vb2_core_streamoff);
  * __find_plane_by_offset() - find plane associated with the given offset
  */
 static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
-			unsigned int *_buffer, unsigned int *_plane)
+			struct vb2_buffer **vb, unsigned int *plane)
 {
-	struct vb2_buffer *vb;
-	unsigned int buffer, plane;
+	unsigned int buffer;
 
 	/*
 	 * Sanity checks to ensure the lock is held, MEMORY_MMAP is
@@ -2209,24 +2219,15 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 		return -EBUSY;
 	}
 
-	/*
-	 * Go over all buffers and their planes, comparing the given offset
-	 * with an offset assigned to each plane. If a match is found,
-	 * return its buffer and plane numbers.
-	 */
-	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
-		vb = q->bufs[buffer];
+	/* Get buffer and plane from the offset */
+	buffer = (offset >> PLANE_INDEX_SHIFT) & BUFFER_INDEX_MASK;
+	*plane = (offset >> PAGE_SHIFT) & PLANE_INDEX_MASK;
 
-		for (plane = 0; plane < vb->num_planes; ++plane) {
-			if (vb->planes[plane].m.offset == offset) {
-				*_buffer = buffer;
-				*_plane = plane;
-				return 0;
-			}
-		}
-	}
+	if (buffer >= q->num_buffers || *plane >= q->bufs[buffer]->num_planes)
+		return -EINVAL;
 
-	return -EINVAL;
+	*vb = q->bufs[buffer];
+	return 0;
 }
 
 int vb2_core_expbuf(struct vb2_queue *q, int *fd, unsigned int type,
@@ -2306,7 +2307,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 {
 	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
-	unsigned int buffer = 0, plane = 0;
+	unsigned int plane = 0;
 	int ret;
 	unsigned long length;
 
@@ -2335,12 +2336,10 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &vb, &plane);
 	if (ret)
 		goto unlock;
 
-	vb = q->bufs[buffer];
-
 	/*
 	 * MMAP requires page_aligned buffers.
 	 * The buffer length was page_aligned at __vb2_buf_mem_alloc(),
@@ -2368,7 +2367,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 	if (ret)
 		return ret;
 
-	dprintk(q, 3, "buffer %d, plane %d successfully mapped\n", buffer, plane);
+	dprintk(q, 3, "buffer %u, plane %d successfully mapped\n", vb->index, plane);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vb2_mmap);
@@ -2382,7 +2381,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 {
 	unsigned long offset = pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
-	unsigned int buffer, plane;
+	unsigned int plane;
 	void *vaddr;
 	int ret;
 
@@ -2392,12 +2391,10 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &vb, &plane);
 	if (ret)
 		goto unlock;
 
-	vb = q->bufs[buffer];
-
 	vaddr = vb2_plane_vaddr(vb, plane);
 	mutex_unlock(&q->mmap_lock);
 	return vaddr ? (unsigned long)vaddr : -EINVAL;
-- 
2.39.2


