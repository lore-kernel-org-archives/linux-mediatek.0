Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88C5CDB48B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sj9zEzSQKjeWdQkuGM7i4Hrn4i7fVVdzvjJAu2+KTlA=; b=V0CJdfDUURXVWd5mWsCBBWDQ+J
	1vsrDrUu3OOqXrG5NMOf5OkTap7lj5+QN6Ntqf8Jp2Ad3lSMOYgjcD2TXf6djkHauUu2yzr9XXZ8y
	Kob+d0bcPeBsF7Xtt+pebI2/Y0VvD0dXynmFlqtTTpl2QXNKZj9MiT87zUyxlRKfnpnXQJsRKtbWe
	IbOD8Z7HZLqwpcIAWBlYZsvHCX0NopbJ1bqnWv+2fkh1Gtx+0SHzZ6Xm128q/7xVoxUrAnFvZUcs6
	sJDHXqqopkJ8+CZR6mRo2L+4uaKiZRAI7IMJR6TMtvOCSqF+lW5g7H1jDCnIsWSuzifktE23b/I3X
	dyOhOmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSWA-00HNX7-0U;
	Thu, 19 Oct 2023 12:52:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSVy-00HNG2-0x;
	Thu, 19 Oct 2023 12:52:41 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ccea:1fb5:34eb:239b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 248FF660732E;
	Thu, 19 Oct 2023 13:52:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697719951;
	bh=cMzVFA9/TUVo9VWr/5JcyqG4OOKgwWqTUUieq9IONwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ox5lQuLLysKewwxPRZbQsn/epHlYzy4PIi+wApDlBwGmeMRMjVO0DCzBRKwT/pNTE
	 dFUyZHj7QVU51rzcfgGPYEoSDv7xxD7cHMpzOAZNEccLgG7aERRCR7XjG/XAMZEx5t
	 x8EKEXHiINd46X0O66ExvFmciPDrGMydvwrx7/GD0E8folAbE3Sa/kLqqLhUwG1Sxg
	 +4chB4EZf1OpBGwmcqhDuuZINPxaPIq/55KsLNVP72l5g/Nhz9rJoRCFNXvKQtaJSc
	 xiW+Bt69y+XufPHlVlc1G2IlEu2V828w2OQVWqabEnYk758n8jSqMtTQDmOXilI2B9
	 fEPHA9VEaP6BQ==
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
Subject: [PATCH v13 01/56] media: videobuf2: Rename offset parameter
Date: Thu, 19 Oct 2023 14:51:27 +0200
Message-Id: <20231019125222.21370-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_055238_489751_98021AD0 
X-CRM114-Status: GOOD (  13.71  )
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

Rename 'off' parameter to 'offset' to clarify the code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 27aee92f3eea..a5e57affeb30 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -356,23 +356,23 @@ static void __setup_offsets(struct vb2_buffer *vb)
 {
 	struct vb2_queue *q = vb->vb2_queue;
 	unsigned int plane;
-	unsigned long off = 0;
+	unsigned long offset = 0;
 
 	if (vb->index) {
 		struct vb2_buffer *prev = q->bufs[vb->index - 1];
 		struct vb2_plane *p = &prev->planes[prev->num_planes - 1];
 
-		off = PAGE_ALIGN(p->m.offset + p->length);
+		offset = PAGE_ALIGN(p->m.offset + p->length);
 	}
 
 	for (plane = 0; plane < vb->num_planes; ++plane) {
-		vb->planes[plane].m.offset = off;
+		vb->planes[plane].m.offset = offset;
 
 		dprintk(q, 3, "buffer %d, plane %d offset 0x%08lx\n",
-				vb->index, plane, off);
+				vb->index, plane, offset);
 
-		off += vb->planes[plane].length;
-		off = PAGE_ALIGN(off);
+		offset += vb->planes[plane].length;
+		offset = PAGE_ALIGN(offset);
 	}
 }
 
@@ -2185,9 +2185,9 @@ int vb2_core_streamoff(struct vb2_queue *q, unsigned int type)
 EXPORT_SYMBOL_GPL(vb2_core_streamoff);
 
 /*
- * __find_plane_by_offset() - find plane associated with the given offset off
+ * __find_plane_by_offset() - find plane associated with the given offset
  */
-static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
+static int __find_plane_by_offset(struct vb2_queue *q, unsigned long offset,
 			unsigned int *_buffer, unsigned int *_plane)
 {
 	struct vb2_buffer *vb;
@@ -2218,7 +2218,7 @@ static int __find_plane_by_offset(struct vb2_queue *q, unsigned long off,
 		vb = q->bufs[buffer];
 
 		for (plane = 0; plane < vb->num_planes; ++plane) {
-			if (vb->planes[plane].m.offset == off) {
+			if (vb->planes[plane].m.offset == offset) {
 				*_buffer = buffer;
 				*_plane = plane;
 				return 0;
@@ -2304,7 +2304,7 @@ EXPORT_SYMBOL_GPL(vb2_core_expbuf);
 
 int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 {
-	unsigned long off = vma->vm_pgoff << PAGE_SHIFT;
+	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
 	unsigned int buffer = 0, plane = 0;
 	int ret;
@@ -2335,7 +2335,7 @@ int vb2_mmap(struct vb2_queue *q, struct vm_area_struct *vma)
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, off, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
 	if (ret)
 		goto unlock;
 
@@ -2380,7 +2380,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 				    unsigned long pgoff,
 				    unsigned long flags)
 {
-	unsigned long off = pgoff << PAGE_SHIFT;
+	unsigned long offset = pgoff << PAGE_SHIFT;
 	struct vb2_buffer *vb;
 	unsigned int buffer, plane;
 	void *vaddr;
@@ -2392,7 +2392,7 @@ unsigned long vb2_get_unmapped_area(struct vb2_queue *q,
 	 * Find the plane corresponding to the offset passed by userspace. This
 	 * will return an error if not MEMORY_MMAP or file I/O is in progress.
 	 */
-	ret = __find_plane_by_offset(q, off, &buffer, &plane);
+	ret = __find_plane_by_offset(q, offset, &buffer, &plane);
 	if (ret)
 		goto unlock;
 
-- 
2.39.2


