Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A282C83F3F
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 14:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKmiMGdwozMXQrEhND7Pp+RULMgiMuqJIn4L7tuhh3g=; b=dZrswUk2hLZyF92VG2T+4yM4m/
	0EsqWk/H3DlvodM+pVKart5HZdcrN7vXc4HT7IP0rNxWyvEzwfj5iAy1CSPFAsnHnGQNJeDTA9ML1
	ilEvD/p0n/eb6Dj6JxQ6fsWAj3kEtd2Dg94VF85L/cVE1CYNFsD3ynlpgndWIoJb4TiLhxMPtM6v5
	CJjCsm28s8BCYHymITKaonAQ/k+7C0Y1lp8fnxlfknUkhrImas3kIE6Dre/jdLljF+M4F1AtdP9+/
	axMaoOLlzb2q9MOTeml7HIHGZ9YNLsDUgWzF4bx1VcNWZIoNjfOdNe32/6GZGmEnOZoZDf01Le8PO
	MAdAHTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAGV-004Eeg-37;
	Mon, 04 Sep 2023 14:09:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdAGR-004Ed5-1y;
	Mon, 04 Sep 2023 14:09:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D6F27CE0E0D;
	Mon,  4 Sep 2023 14:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9A6C433C8;
	Mon,  4 Sep 2023 14:09:05 +0000 (UTC)
Message-ID: <b3561832-b7e4-f612-4729-fd4ca8234602@xs4all.nl>
Date: Mon, 4 Sep 2023 16:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 11/18] media: videobuf2: Be more flexible on the number
 of queue stored buffers
Content-Language: en-US, nl
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 tfiga@chromium.org, m.szyprowski@samsung.com, ming.qian@nxp.com,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
References: <20230901124414.48497-1-benjamin.gaignard@collabora.com>
 <20230901124414.48497-12-benjamin.gaignard@collabora.com>
 <37e5e418-c38a-b863-ffdf-72ce300cf227@xs4all.nl>
 <319d6103-26c3-bc02-3f80-90e653c8ee37@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <319d6103-26c3-bc02-3f80-90e653c8ee37@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_070916_012156_78090DF1 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Benjamin,

This patch can be folded into 11/18 to make it work properly.

vb2_core_queue_release() is also called when the file handle of the video device is
closed and it is also the owner of the currently allocated buffers. This will free
q->bufs, but queue_init isn't called a second time for non-m2m devices. So move
the allocation of q->bufs from queue_init to reqbufs/create_buffers.

And when releasing the file handle we also check if there is no owner at all:
in that case vb2_queue_release() must still be called to free q->bufs.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/videobuf2/videobuf2-core.c | 15 +++++++++++++--
 drivers/media/common/videobuf2/videobuf2-v4l2.c |  4 ++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index dc7f6b59d237..202d7c80ffd2 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -859,6 +859,12 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
 			return 0;
 	}

+	if (!q->bufs) {
+		q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
+		if (!q->bufs)
+			return -ENOMEM;
+	}
+
 	/*
 	 * Make sure the requested values and current defaults are sane.
 	 */
@@ -985,6 +991,12 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		return -ENOBUFS;
 	}

+	if (!q->bufs) {
+		q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
+		if (!q->bufs)
+			return -ENOMEM;
+	}
+
 	if (no_previous_buffers) {
 		if (q->waiting_in_dqbuf && *count) {
 			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
@@ -2525,8 +2537,6 @@ int vb2_core_queue_init(struct vb2_queue *q)
 	/* The maximum is limited by offset cookie encoding pattern */
 	q->max_allowed_buffers = min_t(unsigned int, q->max_allowed_buffers, BUFFER_INDEX_MASK);

-	q->bufs = kcalloc(q->max_allowed_buffers, sizeof(*q->bufs), GFP_KERNEL);
-
 	if (q->buf_struct_size == 0)
 		q->buf_struct_size = sizeof(struct vb2_buffer);

@@ -2552,6 +2562,7 @@ void vb2_core_queue_release(struct vb2_queue *q)
 	mutex_lock(&q->mmap_lock);
 	__vb2_queue_free(q, q->num_buffers);
 	kfree(q->bufs);
+	q->bufs = NULL;
 	mutex_unlock(&q->mmap_lock);
 }
 EXPORT_SYMBOL_GPL(vb2_core_queue_release);
diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 8ba658ad9891..104fc5c4f574 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -1148,7 +1148,7 @@ int _vb2_fop_release(struct file *file, struct mutex *lock)

 	if (lock)
 		mutex_lock(lock);
-	if (file->private_data == vdev->queue->owner) {
+	if (!vdev->queue->owner || file->private_data == vdev->queue->owner) {
 		vb2_queue_release(vdev->queue);
 		vdev->queue->owner = NULL;
 	}
@@ -1276,7 +1276,7 @@ void vb2_video_unregister_device(struct video_device *vdev)
 	 */
 	get_device(&vdev->dev);
 	video_unregister_device(vdev);
-	if (vdev->queue && vdev->queue->owner) {
+	if (vdev->queue) {
 		struct mutex *lock = vdev->queue->lock ?
 			vdev->queue->lock : vdev->lock;

-- 
2.40.1



