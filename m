Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9126CCDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sj9zEzSQKjeWdQkuGM7i4Hrn4i7fVVdzvjJAu2+KTlA=; b=t2g281lfeCk6LW5Z0lO21wrQBn
	MaTGPA2iqCTZr9MGdIrhYcnuSoPY/i6olgiMBbxu5EWbLNCh7m9tegfQlmci6D8Dk6FgEjxSX0gPR
	IPid+0hQmm2SKySY1/QvvoPfZCmW/SQEkOu13V8RWxLFU//J1i+HFms455TH/Rt1sWR8hgmkz+AH/
	kcOHbU0u5uMGFgka6vxvAvGwEJvYdeC9hj7MWDNdR7iHq7cBooEGzOlFFjEyQoVTX833kP+CaqqPn
	NhBcCfSd1jn+dEyhLLbqBVaxgHEpSy/CBB5V4QpNYbBz4GqpbGGm9nsPMPuIsQuP/w0rA+fsS4atT
	thhcbzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvIz-0011gg-0k;
	Thu, 12 Oct 2023 13:00:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu9V-000nse-2s;
	Thu, 12 Oct 2023 11:46:55 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:7ae7:b86d:c19a:877e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C82406607346;
	Thu, 12 Oct 2023 12:46:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697111210;
	bh=cMzVFA9/TUVo9VWr/5JcyqG4OOKgwWqTUUieq9IONwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d5VYelndvKS9apDVWUIKnJDTC/LhhIBeTGDA9MCyEcBjx8JxmZG44Z+KRW1iKezgx
	 hT+0k31ZtmSB4GRp4XSVomidcSrV7svZFsWD9NWOU4WBgCJWkYaiy8d8flhPlgcfnD
	 lpZKNSO0qxOfHGdufAUHhmQ2jIA+62ZbInopNcSyJVVSGWAov6DU/W2UZrBJsKn5Zb
	 eQJ4sfBNWXAUzGS4gGpxnlFXBQC6f8ePTaDhghtE6sCwOB7nafEcvKftOkLoLaMv7H
	 OKGeCmxpiwDqKmiR1+UvwPu3ZgIgIIQyfwJnD7Gmb4V4/1pyx5HJqa+WBBaNy0zRWA
	 VeRQ5lAdZU/hA==
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
Subject: [PATCH v11 01/56] media: videobuf2: Rename offset parameter
Date: Thu, 12 Oct 2023 13:45:47 +0200
Message-Id: <20231012114642.19040-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
References: <20231012114642.19040-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_044654_109881_752AD7F3 
X-CRM114-Status: GOOD (  13.31  )
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


