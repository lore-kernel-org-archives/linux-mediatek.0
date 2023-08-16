Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8A4C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 12:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Cc:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JAdmFYFeG8As1m+iBdx6Fsc2Py9iLqxOSiKVwPIux70=; b=bRjdo8iW9AKqfQz7usjgDGm0U1
	O7AOjP/JZSKg+zOBYLv6RWSW74CXslJCxA/uCSNRfZRNHik/35PuF31sgReHA+7fn7Nv+dmDI4dxx
	WoH67gwnjBhsQy0bSfKutiD0Lzj7yeSzT7mrd8tqND9cF0ikbEH1/9/gZTp18WwJxYEZomSflx8mZ
	Xm60p++7RL24ptTh2YNq5scRA2wcNXIaok8oU04sCmAAZoZuggFwCrL5fBo0gxdhKt/GmtjkFYEbK
	vdl2a5qgKAWoS+C5heYZAgn3lUJP5pqVZOVjFzupsgklxWclgDiMDI1uNCCuLUl5jbjru/DvmoWS5
	daKWZHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFw4-004BDK-1H;
	Wed, 16 Aug 2023 12:47:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFw1-004BCg-38
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 12:47:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CFDC26496E;
	Wed, 16 Aug 2023 12:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5A6C433C8;
	Wed, 16 Aug 2023 12:47:34 +0000 (UTC)
Message-ID: <e75ff985-2499-9a16-21fe-ee2e81547e6f@xs4all.nl>
Date: Wed, 16 Aug 2023 14:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: videobuf2-core.c: check if all buffers have the same
 number of planes
Cc: andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com,
 Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_054738_074679_38C880CD 
X-CRM114-Status: GOOD (  16.15  )
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

Currently if VIDIOC_CREATE_BUFS is called to add new buffers, then the requested
number of planes per buffer might be different from the already allocated buffers.

However, this does not make a lot of sense and there are no drivers that allow
for variable number of planes in the allocated buffers.

While it is possible do this today, when such a buffer is queued it will fail
in the buf_prepare() callback where the plane sizes are checked if those are
large enough. If fewer planes were allocated, then the size for the missing
planes are 0 and the check will return -EINVAL.

But it is much better to do this check in VIDIOC_CREATE_BUFS.

This patch adds the check to videobuf2-core.c

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
With this patch the mediatek vcodec patch would no longer be needed:
https://patchwork.linuxtv.org/project/linux-media/patch/20230810082333.972165-1-harperchen1110@gmail.com/
---
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index cf6727d9c81f..b88c08319bbe 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -938,6 +938,10 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 			dprintk(q, 1, "memory model mismatch\n");
 			return -EINVAL;
 		}
+		if (requested_planes != q->num_planes) {
+			dprintk(q, 1, "num_planes mismatch\n");
+			return -EINVAL;
+		}
 		if (!verify_coherency_flags(q, non_coherent_mem))
 			return -EINVAL;
 	}
@@ -1002,6 +1006,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
 		mutex_unlock(&q->mmap_lock);
 		return -ENOMEM;
 	}
+	if (no_previous_buffers)
+		q->num_planes = num_planes;
 	mutex_unlock(&q->mmap_lock);

 	/*
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 4b6a9d2ea372..799a285447b7 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -558,6 +558,7 @@ struct vb2_buf_ops {
  * @dma_dir:	DMA mapping direction.
  * @bufs:	videobuf2 buffer structures
  * @num_buffers: number of allocated/used buffers
+ * @num_planes: number of planes in each buffer
  * @queued_list: list of buffers currently queued from userspace
  * @queued_count: number of buffers queued and ready for streaming.
  * @owned_by_drv_count: number of buffers owned by the driver
@@ -621,6 +622,7 @@ struct vb2_queue {
 	enum dma_data_direction		dma_dir;
 	struct vb2_buffer		*bufs[VB2_MAX_FRAME];
 	unsigned int			num_buffers;
+	unsigned int			num_planes;

 	struct list_head		queued_list;
 	unsigned int			queued_count;

