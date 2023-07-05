Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4555FC3DA40
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgwEy5lbthAozdgPIhNrXbphzCeGWZhjt4alVNZTI2E=; b=DnJasb9gALeezOW2JwzJ5y/1xm
	C5PJfojSb1iQKoiNt/9sS3qJXAW+oErlXIDaMk4/nM3mdm34smNQ+EesX/AmOaupYfNKn6TqJnBjT
	LYQopxMhnIZmd8UvQ7Hxnv9f3kBLdFVhhvXqKreUuf+++1cMuRcnuAfKDBc/OV42dnRUzCFR73QNj
	xcrA1spCBzybjYLChgEsDLF1b6QwxwvkaZcKzZfFenxr3tpTEwcd+SQXqvySuUlWnNwMMugE4nyM9
	RQ4F3Tz25tixPM6VuRQgiIrEg/oo/0M7OmBAtKBKInAY2o2MGZKnVvIvvR9cH/CoC+PUwFIvl7JHu
	nEP7QrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Lo-00FpYx-0I;
	Wed, 05 Jul 2023 12:11:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH1Lj-00FpSU-0b;
	Wed, 05 Jul 2023 12:11:13 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:cbfb:e358:222c:d8c1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C70E46606FB9;
	Wed,  5 Jul 2023 13:11:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688559065;
	bh=4t2lobqp8kQ9itIXbwNWZqHC/Q0azCKlo/t/UJDorIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEmEAehcgOitfNWcWRYVJdfGx0pc0f9BhQazshQG/W/yVdfKm8mY07DYOmxDvHn5g
	 M/o/fM5CvcYF7g2eQcXnM6XeEc1Y/sQ6xlqJMT3zQqwo1aBznc8naFV1RncX9rksll
	 I0BtfV0GXwdeWJFtN+yqzBu5TA5v/ujd+ZELX2QZpF8o2fksvWBPJD9Zo9BT/kg9/E
	 WplfMLY2z3eJ+jvrIr4YhOZfJdBT/MkhcqXedsMpsVS5cfkq6F+OnzB1O0ufQUYBkA
	 Q8JEMF2MtqJhJRqE38Ie5DBPFN/vW0QdgFLW4I+B7BQ89F1n+LSvT94gqN7Y9iZWMu
	 o/aphTAaI+fxQ==
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
Subject: [PATCH v4 03/10] media: videobuf2: Rework offset 'cookie' encoding pattern
Date: Wed,  5 Jul 2023 14:10:49 +0200
Message-Id: <20230705121056.37017-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
References: <20230705121056.37017-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_051111_360028_66B4DBF9 
X-CRM114-Status: GOOD (  18.86  )
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
With this encoding pattern we know the maximum number that a queue
could store so we can check ing at queue init time.
It also make easier and faster to find buffer and plane from using
the offset field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 63 +++++++++----------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 77e69b01d88d..70e36389b704 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -31,6 +31,10 @@
 
 #include <trace/events/vb2.h>
 
+#define PLANE_INDEX_SHIFT	3
+#define PLANE_INDEX_MASK	0x7
+#define MAX_BUFFERS		0xffff
+
 static int debug;
 module_param(debug, int, 0644);
 
@@ -358,29 +362,23 @@ static void __setup_offsets(struct vb2_buffer *vb)
 	unsigned int plane;
 	unsigned long off = 0;
 
-	if (vb->index) {
-		struct vb2_buffer *prev;
-		struct vb2_plane *p;
-
-		prev = vb2_get_buffer(q, vb->index - 1);
-		if (!prev) {
-			dprintk(q, 1, "can't find the requested buffer\n");
-			return;
-		}
-
-		p = &prev->planes[prev->num_planes - 1];
-
-		off = PAGE_ALIGN(p->m.offset + p->length);
-	}
+	/*
+	 * Offsets cookies value have the following constraints:
+	 * - a buffer could have up to 8 planes.
+	 * - v4l2 mem2mem use bit 30 to distinguish between source and destination buffers.
+	 * - must be page aligned
+	 * That led to this bit mapping:
+	 * |30                |29        15|14       12|11 0|
+	 * |DST_QUEUE_OFF_BASE|buffer index|plane index| 0  |
+	 * where there is 16 bits to store buffer index.
+	 */
+	off = vb->index << (PLANE_INDEX_SHIFT + PAGE_SHIFT);
 
 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		vb->planes[plane].m.offset = off;
+		vb->planes[plane].m.offset = off + (plane << PAGE_SHIFT);
 
 		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
 				vb->index, plane, off);
-
-		off += vb->planes[plane].length;
-		off = PAGE_ALIGN(off);
 	}
 }
 
@@ -2294,24 +2292,18 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
 		return -EBUSY;
 	}
 
-	/*
-	 * Go over all buffers and their planes, comparing the given offset
-	 * with an offset assigned to each plane. If a match is found,
-	 * return its buffer and plane numbers.
-	 */
-	for (buffer = 0; buffer < q->num_buffers; ++buffer) {
-		vb = vb2_get_buffer(q, buffer);
+	/* Get buffer and plane from the offset */
+	buffer = (off >> (PLANE_INDEX_SHIFT + PAGE_SHIFT)) & MAX_BUFFERS;
+	plane = (off >> PAGE_SHIFT) & PLANE_INDEX_MASK;
 
-		if (!vb)
-			continue;
+	vb = vb2_get_buffer(q, buffer);
+	if (!vb)
+		return -EINVAL;
 
-		for (plane = 0; plane < vb->num_planes; ++plane) {
-			if (vb->planes[plane].m.offset == off) {
-				*_buffer = buffer;
-				*_plane = plane;
-				return 0;
-			}
-		}
+	if (vb->planes[plane].m.offset == off) {
+		*_buffer = buffer;
+		*_plane = plane;
+		return 0;
 	}
 
 	return -EINVAL;
@@ -2552,6 +2544,9 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	if (!q->max_allowed_buffers)
 		q->max_allowed_buffers = VB2_MAX_FRAME;
 
+	/* The maximum is limited by offset cookie encoding pattern */
+	q->max_allowed_buffers = min_t(unsigned int, q->max_allowed_buffers, MAX_BUFFERS);
+
 	q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
 
 	if (q->buf_struct_size == 0)
-- 
2.39.2


