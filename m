Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AE2EEAA45
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTUra0tlY/ay54IiK0T3ERwOy3egD+NX8ib2AgUUHFs=; b=M6AptmOiPerAq0PyFYly8SeEKs
	qgdOJPXJlg7ERnIRaebrsCjiWRwDXYZKU7EFw8ALvLv+gVIFU4aG8UAqf5ZlEbQ+0F+w/XadCv1c+
	zk4+Nb+cl4d3D7R3aCiCj1RRML6ypzE0j6NdVDIuNblckGHrxvayuIywf1GAbz65JuvwyxHLrYk89
	rqqJxwrtOqb0OCsmab/Wo/yHG8cB7/Qa64MctlWt+CN9bRf2VjaAMamXxTBhvfLJDrbRtaY9XmaBo
	pCI3hCVznBfg5u30c/yv6hrkr6TLSRSgLsWULABebKbFw27klg2XwO3M/+Wp0JhbjUt04m5ly+ZUL
	N7z9Dh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmX8-008W9i-0F;
	Thu, 14 Sep 2023 13:37:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTp-008SeE-34;
	Thu, 14 Sep 2023 13:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MTUra0tlY/ay54IiK0T3ERwOy3egD+NX8ib2AgUUHFs=; b=A4PNLoKDhfkV+VDg/2fvzR/nou
	BKXKiYNf5G76r+qEwm//QWO8bMap6PKDkk6XvpK3mINoV9SMKm0WaF/ZWtF21+2HC0dmHakcGbJBs
	5GZb7JwRmBpLLg5nks6ZCZ5mMm+gLM24JbvrKN4RIOUQhHv+sxWvrRsNEKqb1W5YY9G8/GTsIsJYl
	Fl/nHBIskbdph71EQDFqcdqY8xkdyXOFPxBb2MTt8Xx7NnC27PIEF/u5S+wlKmyEy67rKJqFZhRey
	kvebDu57XOZh7pCJiophZ7fMVB1kMzUFt9Ut4U6vmsmRADntRXghNBhHFGUtMx+JkaeEHW41jaIAj
	zEB/SsVw==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmTj-007umh-2V;
	Thu, 14 Sep 2023 13:34:00 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:36f2:37bd:ccbb:373f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30932660739B;
	Thu, 14 Sep 2023 14:33:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694698435;
	bh=toYAovS+izT0LEoEizCbJtlr0mGm+eGtkX0GLil3vcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oEps24M4VrGEsZjj534OIRuhGa5nrooJPEDbMc2XfeODZD/Snnj5GHpYmTeNJT9l+
	 CnU62Cjhug0VYXFFocoTcbn5nVVz7hP+auojoUhN8d0sz0+dt5wdAcgRJyGvIHOZxs
	 vCeZB7SShgrnW4lDf+dTiEik1PFHIThDnbFZMxPLLIB2BZR8K5+bOvZb955q3xuhx9
	 56BPeGqp7XnfORhXvIKRsrY76WVS7I/k5Hdjk17tOl2cmfSRKgNs76OfI3XYNjMm4l
	 xW6l0KS/HNEnfRoinzNpPeeTS9gcgrE2+B1lCiEu9EB4NTrO28oamIIUFNRIEB88yP
	 ZS19F/X5nC2aA==
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
Subject: [PATCH v7 46/49] media: core: Free range of buffers
Date: Thu, 14 Sep 2023 15:33:20 +0200
Message-Id: <20230914133323.198857-47-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
References: <20230914133323.198857-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_143357_359128_D6FB75B1 
X-CRM114-Status: GOOD (  14.49  )
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

Improve __vb2_queue_free() and __vb2_free_mem() to free
range of buffers and not only the last few buffers.
Intoduce starting index to be flexible on range and change the loops
according to this parameters.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 30 +++++++++----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index c5d4a388331b..88cdf4dcb07c 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -527,13 +527,12 @@ static int __vb2_queue_alloc(struct vb2_queue *q, enum vb2_memory memory,
 /*
  * __vb2_free_mem() - release all video buffer memory for a given queue
  */
-static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
+static void __vb2_free_mem(struct vb2_queue *q, unsigned int start, unsigned int count)
 {
-	unsigned int buffer = 0;
-	long i = q->max_allowed_buffers;
+	unsigned int i, buffer = 0;
 	struct vb2_buffer *vb;
 
-	for (i = q->max_allowed_buffers; i >= 0 && buffer < buffers; i--) {
+	for (i = start; i < q->max_allowed_buffers && buffer < count; i++) {
 		vb = vb2_get_buffer(q, i);
 		if (!vb)
 			continue;
@@ -550,19 +549,18 @@ static void __vb2_free_mem(struct vb2_queue *q, unsigned int buffers)
 }
 
 /*
- * __vb2_queue_free() - free buffers at the end of the queue - video memory and
+ * __vb2_queue_free() - free count buffers from start index of the queue - video memory and
  * related information, if no buffers are left return the queue to an
  * uninitialized state. Might be called even if the queue has already been freed.
  */
-static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
+static void __vb2_queue_free(struct vb2_queue *q, unsigned int start, unsigned int count)
 {
-	unsigned int buffer;
-	long i = q->max_allowed_buffers;
+	unsigned int i, buffer;
 
 	lockdep_assert_held(&q->mmap_lock);
 
 	/* Call driver-provided cleanup function for each buffer, if provided */
-	for (i = q->max_allowed_buffers, buffer = 0; i >= 0 && buffer < buffers; i--) {
+	for (i = start, buffer = 0; i < q->max_allowed_buffers && buffer < count; i++) {
 		struct vb2_buffer *vb = vb2_get_buffer(q, i);
 
 		if (!vb)
@@ -574,7 +572,7 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 	}
 
 	/* Release video buffer memory */
-	__vb2_free_mem(q, buffers);
+	__vb2_free_mem(q, start, count);
 
 #ifdef CONFIG_VIDEO_ADV_DEBUG
 	/*
@@ -659,8 +657,8 @@ static void __vb2_queue_free(struct vb2_queue *q, unsigned int buffers)
 #endif
 
 	/* Free vb2 buffers */
-	for (i = q->max_allowed_buffers, buffer = 0; i > 0 && buffer < buffers; i--) {
-		struct vb2_buffer *vb = vb2_get_buffer(q, buffer);
+	for (i = start, buffer = 0; i < q->max_allowed_buffers && buffer < count; i++) {
+		struct vb2_buffer *vb = vb2_get_buffer(q, i);
 
 		if (!vb)
 			continue;
@@ -884,7 +882,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		 * queued without ever calling STREAMON.
 		 */
 		__vb2_queue_cancel(q);
-		__vb2_queue_free(q, q_num_bufs);
+		__vb2_queue_free(q, 0, q_num_bufs);
 		mutex_unlock(&q->mmap_lock);
 
 		/*
@@ -995,7 +993,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 		 * from already queued buffers and it will reset q->memory to
 		 * VB2_MEMORY_UNKNOWN.
 		 */
-		__vb2_queue_free(q, allocated_buffers);
+		__vb2_queue_free(q, 0, allocated_buffers);
 		mutex_unlock(&q->mmap_lock);
 		return ret;
 	}
@@ -1135,7 +1133,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		 * from already queued buffers and it will reset q->memory to
 		 * VB2_MEMORY_UNKNOWN.
 		 */
-		__vb2_queue_free(q, allocated_buffers);
+		__vb2_queue_free(q, 0, allocated_buffers);
 		mutex_unlock(&q->mmap_lock);
 		return -ENOMEM;
 	}
@@ -2617,7 +2615,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
 	__vb2_cleanup_fileio(q);
 	__vb2_queue_cancel(q);
 	mutex_lock(&q->mmap_lock);
-	__vb2_queue_free(q, q->max_allowed_buffers);
+	__vb2_queue_free(q, 0, q->max_allowed_buffers);
 	kfree(q->bufs);
 	q->bufs = NULL;
 	bitmap_free(q->bufs_map);
-- 
2.39.2


