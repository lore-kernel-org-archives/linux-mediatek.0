Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E483CDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+c+3bBG0Loc5m/wumdZQqbip4N9vBsSkrZrjukLCJ4=; b=cY3jVSipXtdIn0GYPidAgqBt+E
	ArROcls6LSPissHGTGU6TmzR9y6GGBT6NgaUEB+FpmKBfb49sfac8NVV3Hw566w8fRWkQLO1aRcl9
	xQxVluFglghFbuyshRWbS2WkgOXow4I0z7QoJf/bDJVtyOupiaXhoNybEqkSsonxOarrp6ubDaZRB
	l+3BnZHbyt/VYH2INmL+CUSlBZqJYp+KLkrglxTBgT1fZRv3F304DtKtDf9Y5bpN1UyAT4bnN+5yQ
	kr2LQvVfuKiF2e7Qv3uT7FH7Ml9v7QAyt0ndF6qAC/RHjDMZyOZod8F2keimSQTyrwP4NhgUwSvth
	LBayfK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qquE4-000sRA-1V;
	Thu, 12 Oct 2023 11:51:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9u-000oKP-2P;
	Thu, 12 Oct 2023 11:47:22 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05C2066073B3;
	Thu, 12 Oct 2023 12:47:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111237;
	bh=kEJbLQU/NWfSXI9ifPCtTAsM2xXQaDo8JrJIN+UqWGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KdEIiVzs7WcM6jKxcsMd28hY9EBCXnvofp/+PFHNz7M2IBfEES0NAZag8RsnGBYSM
	 jJ3x2TAY2JEgQrhieeCrGG2ZMv/gjfb2hmfi0qTEPosL1W1oidTNfnEY1CdziGxAta
	 BJoDjFzYQzeXBMPAdHKbRI/hq1eHZuSlmhOSP3bZObHwKPsc5q32YfAcq9rwv435GI
	 wL9tcowCXE6PMOzFcToK7Okj0gejNU2yBG5YWTFo7xZZP42BDzE9nNoDmnktiTSB6n
	 6p+xakIWFK9T76jerUBiyGnh/fzbvpTxhSFIAXaOA+LYBLKShBSW3ahVO/1ndCUF13
	 qVQTeuk5kdmag==
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
Subject: [PATCH v11 52/56] media: core: Add bitmap manage bufs array entries
Date: Thu, 12 Oct 2023 13:46:38 +0200
Message-Id: <20231012114642.19040-53-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044719_084296_1E650954 
X-CRM114-Status: GOOD (  19.70  )
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

Add a bitmap field to know which of bufs array entries are
used or not.
Remove no more used num_buffers field from queue structure.
Use bitmap_find_next_zero_area() to find the first possible
range when creating new buffers to fill the gaps.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 42 +++++++++++++++----
 include/media/videobuf2-core.h                | 19 ++++++---
 2 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b666b7d09807..29d46c5be705 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -416,11 +416,12 @@ static void init_buffer_cache_hints(struct vb2_queue *q, struct vb2_buffer *vb)
  */
 static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, unsigned int index)
 {
-	WARN_ON(index >= q->max_num_buffers || q->bufs[index]);
+	WARN_ON(index >= q->max_num_buffers || test_bit(index, q->bufs_bitmap));
 
 	q->bufs[index] = vb;
 	vb->index = index;
 	vb->vb2_queue = q;
+	set_bit(index, q->bufs_bitmap);
 }
 
 /**
@@ -429,8 +430,7 @@ static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buffer *vb, uns
  */
 static void vb2_queue_remove_buffer(struct vb2_buffer *vb)
 {
-	if (vb->vb2_queue->num_buffers)
-		vb->vb2_queue->num_buffers--;
+	clear_bit(vb->index, vb->vb2_queue->bufs_bitmap);
 	vb->vb2_queue->bufs[vb->index] = NULL;
 	vb->vb2_queue = NULL;
 }
@@ -452,11 +452,12 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 	unsigned long index;
 	int ret;
 
-	/* Ensure that the number of already queue + num_buffers is below q->max_num_buffers */
+	/* Ensure that vb2_get_num_buffers(q) + num_buffers is no more than q->max_num_buffers */
 	num_buffers = min_t(unsigned int, num_buffers,
 			    q->max_num_buffers - vb2_get_num_buffers(q));
 
-	index = vb2_get_num_buffers(q);
+	index = bitmap_find_next_zero_area(q->bufs_bitmap, q->max_num_buffers,
+					   0, num_buffers, 0);
 
 	*first_index = index;
 
@@ -878,6 +879,14 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		q->bufs = kcalloc(q->max_num_buffers, sizeof(*q->bufs), GFP_KERNEL);
 	if (!q->bufs)
 		ret = -ENOMEM;
+
+	if (!q->bufs_bitmap)
+		q->bufs_bitmap = bitmap_zalloc(q->max_num_buffers, GFP_KERNEL);
+	if (!q->bufs_bitmap) {
+		ret = -ENOMEM;
+		kfree(q->bufs);
+		q->bufs = NULL;
+	}
 	q->memory = memory;
 	mutex_unlock(&q->mmap_lock);
 	if (ret)
@@ -947,7 +956,6 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	mutex_lock(&q->mmap_lock);
-	q->num_buffers = allocated_buffers;
 
 	if (ret < 0) {
 		/*
@@ -974,6 +982,10 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	mutex_lock(&q->mmap_lock);
 	q->memory = VB2_MEMORY_UNKNOWN;
 	mutex_unlock(&q->mmap_lock);
+	kfree(q->bufs);
+	q->bufs = NULL;
+	bitmap_free(q->bufs_bitmap);
+	q->bufs_bitmap = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vb2_core_reqbufs);
@@ -1010,9 +1022,19 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		q->memory = memory;
 		if (!q->bufs)
 			q->bufs = kcalloc(q->max_num_buffers, sizeof(*q->bufs), GFP_KERNEL);
-		if (!q->bufs)
+		if (!q->bufs) {
 			ret = -ENOMEM;
+			goto unlock;
+		}
+		if (!q->bufs_bitmap)
+			q->bufs_bitmap = bitmap_zalloc(q->max_num_buffers, GFP_KERNEL);
+		if (!q->bufs_bitmap) {
+			ret = -ENOMEM;
+			kfree(q->bufs);
+			q->bufs = NULL;
+		}
 		mutex_unlock(&q->mmap_lock);
+unlock:
 		if (ret)
 			return ret;
 		q->waiting_for_buffers = !q->is_output;
@@ -1074,7 +1096,6 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	}
 
 	mutex_lock(&q->mmap_lock);
-	q->num_buffers += allocated_buffers;
 
 	if (ret < 0) {
 		/*
@@ -2551,6 +2572,9 @@ void vb2_core_queue_release(struct vb2_queue *q)
 	__vb2_queue_free(q, q->max_num_buffers);
 	kfree(q->bufs);
 	q->bufs = NULL;
+	bitmap_free(q->bufs_bitmap);
+	q->bufs_bitmap = NULL;
+
 	mutex_unlock(&q->mmap_lock);
 }
 EXPORT_SYMBOL_GPL(vb2_core_queue_release);
@@ -2905,7 +2929,7 @@ static size_t __vb2_perform_fileio(struct vb2_queue *q, char __user *data, size_
 	 * Check if we need to dequeue the buffer.
 	 */
 	index = fileio->cur_index;
-	if (index >= q->num_buffers) {
+	if (!test_bit(index, q->bufs_bitmap)) {
 		struct vb2_buffer *b;
 
 		/*
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index a3a051276972..288477075a0e 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -346,7 +346,7 @@ struct vb2_buffer {
  *			describes the requested number of planes and sizes\[\]
  *			contains the requested plane sizes. In this case
  *			\*num_buffers are being allocated additionally to
- *			q->num_buffers. If either \*num_planes or the requested
+ *			queue buffers. If either \*num_planes or the requested
  *			sizes are invalid callback must return %-EINVAL.
  * @wait_prepare:	release any locks taken while calling vb2 functions;
  *			it is called before an ioctl needs to wait for a new
@@ -557,7 +557,7 @@ struct vb2_buf_ops {
  * @memory:	current memory type used
  * @dma_dir:	DMA mapping direction.
  * @bufs:	videobuf2 buffer structures
- * @num_buffers: number of allocated/used buffers
+ * @bufs_bitmap: bitmap to manage bufs entries.
  * @max_num_buffers: upper limit of number of allocated/used buffers
  * @queued_list: list of buffers currently queued from userspace
  * @queued_count: number of buffers queued and ready for streaming.
@@ -621,7 +621,7 @@ struct vb2_queue {
 	unsigned int			memory;
 	enum dma_data_direction		dma_dir;
 	struct vb2_buffer		**bufs;
-	unsigned int			num_buffers;
+	unsigned long			*bufs_bitmap;
 	unsigned int			max_num_buffers;
 
 	struct list_head		queued_list;
@@ -1150,7 +1150,10 @@ static inline bool vb2_fileio_is_active(struct vb2_queue *q)
  */
 static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
 {
-	return q->num_buffers;
+	if (!q->bufs_bitmap)
+		return 0;
+
+	return bitmap_weight(q->bufs_bitmap, q->max_num_buffers);
 }
 
 /**
@@ -1253,7 +1256,13 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
 static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
 						unsigned int index)
 {
-	if (index < q->num_buffers)
+	if (!q->bufs_bitmap)
+		return NULL;
+
+	if (index >= q->max_num_buffers)
+		return NULL;
+
+	if (test_bit(index, q->bufs_bitmap))
 		return q->bufs[index];
 	return NULL;
 }
-- 
2.39.2


