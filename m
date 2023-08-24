Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D134C27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 09:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQC+/GmHVxT3VXRrwOmtSwRWnR0S6Q4AEp6aRDwL/n0=; b=mN3Ir2koepopgrw1lcfEm681il
	xvzQNHFmH1zMkoWyG70Fr2oBXtVEfzvykf7cGfXD2MnIU4UWtUdT22n4xeY04uIxen2c41G6o+Pwr
	AwseFjmV619m/EmD3q+wH6rOUkAlPxibysfwcXesqeaSx7eGt4ScsHsonWe7Zd/XM0ysP48BHUV8k
	nLFvFJOLcojc/SSxov4QHBMAM4fBZBEyqGByf3WX3K1p79WHNjqQSYyl0hvq1g4uwTupw0FsF0p+2
	qVzPoro1inZ3vWbIVd7THNOCsAM8bH62pr3TKx4KsIzF1bwlWEB9/V//Vrx7Dq/7XIRL3VFtgQ+2l
	cQDiTkFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6XH-002g8d-2a;
	Thu, 24 Aug 2023 09:21:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6XD-002g41-1X;
	Thu, 24 Aug 2023 09:21:49 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:c310:4c8a:3a97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 212A2660726A;
	Thu, 24 Aug 2023 10:21:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692868902;
	bh=cn8IhtAp7t/KmadvHHA388VFOzyoMeHQwyTqRoV/2lA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NLkGbF95bKcuL65/8uVA9VQvwHahygMS28IywoUqfH1UxvGLsDpMUOkUh6LE9pT/N
	 nrwyK2bx/d++LRCJ84DbsJzolb2pTfpQzigx0dqWD+qF1NPsctWQB1BBSzTcNLACCI
	 /Fc8lHDDRNtvp095Dt8F6u9fCN8ar4m7KQePKzM/b8PuMhhwbZdvfHMc+BKPg3KSNq
	 +agwmyVBnMXqZLG7kkfTIvLNVIUzeyDQPe7H+c5UU7nKprBxxTl8Trq7FNr2QvHOc3
	 +5p2RASI/s8THaLMfaFRjTbhRAtBg+pf5n+ErJO6wHcajmBL6m+z7l/7gvne5klc74
	 4xCkDPuQUnbnA==
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
Subject: [PATCH v5 01/10] media: videobuf2: Rework offset 'cookie' encoding pattern
Date: Thu, 24 Aug 2023 11:21:24 +0200
Message-Id: <20230824092133.39510-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
References: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_022147_682887_1975996F 
X-CRM114-Status: GOOD (  18.73  )
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
to use more buffers (up to 0xffff).
With this encoding pattern we know the maximum number that a queue
could store so we can check ing at queue init time.
It also make easier and faster to find buffer and plane from using
the offset field.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
v5:
- I haven't change DST_QUEUE_OFF_BASE definition because it used in
  v4l2-mem2mem and s5p_mfc driver with a shift.

 .../media/common/videobuf2/videobuf2-core.c   | 48 +++++++++----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index cf6727d9c81f..e06905533ef4 100644
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
 
@@ -358,21 +362,23 @@ static void __setup_offsets(struct vb2_buffer *vb)
 	unsigned int plane;
 	unsigned long off = 0;
 
-	if (vb->index) {
-		struct vb2_buffer *prev = q->bufs[vb->index - 1];
-		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
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
 
@@ -2209,21 +2215,15 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
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
+	buffer = (off >> (PLANE_INDEX_SHIFT + PAGE_SHIFT)) & MAX_BUFFERS;
+	plane = (off >> PAGE_SHIFT) & PLANE_INDEX_MASK;
 
-		for (plane = 0; plane < vb->num_planes; ++plane) {
-			if (vb->planes[plane].m.offset == off) {
-				*_buffer = buffer;
-				*_plane = plane;
-				return 0;
-			}
-		}
+	vb = q->bufs[buffer];
+	if (vb->planes[plane].m.offset == off) {
+		*_buffer = buffer;
+		*_plane = plane;
+		return 0;
 	}
 
 	return -EINVAL;
-- 
2.39.2


