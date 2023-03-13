Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136E1C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1Am/rFpJwjesGFXL1Fi2nT60tI5+XSKtzWvIeKwIUg=; b=nqxwV99WC+gYENQMlggW5O9Eae
	QZs7Dc4/1GuGzPZ/LXP1Z0Nehw2+p8LOoqLGNtCQhJAHZxe26uVy9jB0QB8jTeue8fvyfB/2UWZY0
	Xo9wszCfHePxm6q4+W6X1dqOQagnBjz6RYrdY/zbgUOy+J0F4EDAMAw/PT8p0A2HhehKNJpNCz/aU
	IuFTihHzhowNkQ9Gub8pB9/pleXVPFJTZ3pQBSWxwTM5wimfObD5Bh2Kaf0Uv2n0dVxOdV6ei2lO8
	sH2qXYfpMj3VpAv9IEwvtP2K0yNO3x++ux7vvO9pEbiBwW2j0Df7HY//ltwyDiQACbMD1lL48RXzB
	hx/uaRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbijk-0062hA-Rt; Mon, 13 Mar 2023 14:01:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbii2-0061el-TO; Mon, 13 Mar 2023 13:59:33 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7a7b:d0cc:67e9:4297])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B626660309C;
	Mon, 13 Mar 2023 13:59:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678715966;
	bh=fqWhcs4/GgMdLp8whmAet1ILuF0Z1TgMuHnhZmsdzWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B/nUDWbvXGP1nhnuaY+/zpVS6ko+1IReLDTzh5bY6HAcciS+Cu82iJBYTKbLCCIJY
	 Hl1gU1LyLOMdzaoIrAk1TuOZ2jmuuUgDqhQUeC4HjjujeJEWK3GRMM6zmsK7N3H0+u
	 DAY0qmXucvqPN0G0PDuRJ8iVmx4nvAiprZgDVG8BPEzmgE1VetFkbzjnFMOh50G1Vf
	 9mLFlURp50N6ZN/OompkgTF13b87ywg+2kEt1dTRrWuGvi5hOUrhFoq8KccgnUzr6O
	 OnmnuA9VSsG2ERu0Lgft+2gFEKy7IcTqRwTPgm9HiwL0omwDjsfkx30ySiNGGyEk5d
	 kowrlfWWytOuQ==
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
	jerbel@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Date: Mon, 13 Mar 2023 14:59:14 +0100
Message-Id: <20230313135916.862852-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_065931_219950_80822E53 
X-CRM114-Status: GOOD (  15.76  )
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

Replacing bufs array by a list allows to remove the 32 buffers
limit per queue.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 14 ++------------
 include/media/videobuf2-core.h                | 19 +++++++++++++------
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index b51152ace763..96597d339a07 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -412,10 +412,6 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 	struct vb2_buffer *vb;
 	int ret;
 
-	/* Ensure that q->num_buffers+num_buffers is below VB2_MAX_FRAME */
-	num_buffers = min_t(unsigned int, num_buffers,
-			    VB2_MAX_FRAME - q->num_buffers);
-
 	for (buffer = 0; buffer < num_buffers; ++buffer) {
 		/* Allocate vb2 buffer structures */
 		vb = kzalloc(q->buf_struct_size, GFP_KERNEL);
@@ -797,9 +793,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
-	WARN_ON(q->min_buffers_needed > VB2_MAX_FRAME);
 	num_buffers = max_t(unsigned int, *count, q->min_buffers_needed);
-	num_buffers = min_t(unsigned int, num_buffers, VB2_MAX_FRAME);
 	memset(q->alloc_devs, 0, sizeof(q->alloc_devs));
 	/*
 	 * Set this now to ensure that drivers see the correct q->memory value
@@ -915,11 +909,6 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 	bool no_previous_buffers = !q->num_buffers;
 	int ret;
 
-	if (q->num_buffers == VB2_MAX_FRAME) {
-		dprintk(q, 1, "maximum number of buffers already allocated\n");
-		return -ENOBUFS;
-	}
-
 	if (no_previous_buffers) {
 		if (q->waiting_in_dqbuf && *count) {
 			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
@@ -944,7 +933,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			return -EINVAL;
 	}
 
-	num_buffers = min(*count, VB2_MAX_FRAME - q->num_buffers);
+	num_buffers = *count;
 
 	if (requested_planes && requested_sizes) {
 		num_planes = requested_planes;
@@ -2444,6 +2433,7 @@ int vb2_core_queue_init(struct vb2_queue *q)
 
 	INIT_LIST_HEAD(&q->queued_list);
 	INIT_LIST_HEAD(&q->done_list);
+	INIT_LIST_HEAD(&q->allocated_bufs);
 	spin_lock_init(&q->done_lock);
 	mutex_init(&q->mmap_lock);
 	init_waitqueue_head(&q->done_wq);
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index d18c57e7aef0..47f1f35eb9cb 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -276,6 +276,8 @@ struct vb2_buffer {
 	 * done_entry:		entry on the list that stores all buffers ready
 	 *			to be dequeued to userspace
 	 * vb2_plane:		per-plane information; do not change
+	 * allocated_entry:	entry on the list that stores all buffers allocated
+	 *			for the queue.
 	 */
 	enum vb2_buffer_state	state;
 	unsigned int		synced:1;
@@ -287,6 +289,7 @@ struct vb2_buffer {
 	struct vb2_plane	planes[VB2_MAX_PLANES];
 	struct list_head	queued_entry;
 	struct list_head	done_entry;
+	struct list_head	allocated_entry;
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	/*
 	 * Counters for how often these buffer-related ops are
@@ -556,7 +559,7 @@ struct vb2_buf_ops {
  * @mmap_lock:	private mutex used when buffers are allocated/freed/mmapped
  * @memory:	current memory type used
  * @dma_dir:	DMA mapping direction.
- * @bufs:	videobuf2 buffer structures
+ * @allocated_bufs: list of buffer allocated for the queue.
  * @num_buffers: number of allocated/used buffers
  * @queued_list: list of buffers currently queued from userspace
  * @queued_count: number of buffers queued and ready for streaming.
@@ -619,7 +622,7 @@ struct vb2_queue {
 	struct mutex			mmap_lock;
 	unsigned int			memory;
 	enum dma_data_direction		dma_dir;
-	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
+	struct list_head		allocated_bufs;
 	unsigned int			num_buffers;
 
 	struct list_head		queued_list;
@@ -1239,8 +1242,12 @@ static inline void vb2_clear_last_buffer_dequeued(struct vb2_queue *q)
 static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
 						unsigned int index)
 {
-	if (index < q->num_buffers)
-		return q->bufs[index];
+	struct vb2_buffer *vb;
+
+	list_for_each_entry(vb, &q->allocated_bufs, allocated_entry)
+		if (vb->index == index)
+			return vb;
+
 	return NULL;
 }
 
@@ -1251,7 +1258,7 @@ static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
  */
 static inline void vb2_set_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
 {
-	q->bufs[vb->index] = vb;
+	list_add_tail(&vb->allocated_entry, &q->allocated_bufs);
 }
 
 /**
@@ -1261,7 +1268,7 @@ static inline void vb2_set_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
  */
 static inline void vb2_del_buffer(struct vb2_queue *q, struct vb2_buffer *vb)
 {
-	q->bufs[vb->index] = NULL;
+	list_del(&vb->allocated_entry);
 }
 
 /*
-- 
2.34.1


