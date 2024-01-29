Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A7CC47DDF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 06:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWJt5f3OFXku7W6faTUM0+bKsbswJle1HktQEF2gUcM=; b=QoA2IwGHmho1AFucSv7xDlQMNL
	aAaO2PGdDpqcZ94fF9NOiE0ZEoyU7H/AkNf7azofN85ssfldRuhk8rgYjZtpo8pMaaNmKqT4DPdc6
	OWqFQAxa/HT5SO7vFF7k+nwU1PgoBNRrUE0Q5ejB33Y3ZJX/qrmSO9utWqK1eQPQSIWB5bh0DRK9x
	tHZ89zqVTUmk8/znEZngH9IG0xx3vk0M0Fc8NOOPTeOPd3XjsFf/NVYNuHVHnKZQ6zk7EV1CNZOAn
	+0PmdFBaXaQUBaXTD2yKjztt2n/+59CbGN42uj2JfgglKt3RLIk2SAeCSvFHwDuRUEOy1dsgHNy5l
	y3FD25dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULD3-0000000BUp6-10wk;
	Mon, 29 Jan 2024 06:33:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULB5-0000000BTVL-2rTr;
	Mon, 29 Jan 2024 06:31:33 +0000
X-UUID: 06122f94be7011ee9a263b4415211400-20240128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JWJt5f3OFXku7W6faTUM0+bKsbswJle1HktQEF2gUcM=;
	b=GEmZUfsabgdW7N7fB5qxDZ472JDENF+98O5G8i9+TmpoyHZ1aqqMwEAFApkq8SymZipF9/4uaEUEg32R2AZh86RzTM1Pj1Thq7FHNihGty3p14JYo2zihSfNWiEp+NHwJSHs27F3CvByZ91L0i998+tCGYZzieSSrMEfx6suLqA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:09c10344-186a-4491-a00f-a97762971655,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6e16cf4,CLOUDID:c2d6dc7f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 06122f94be7011ee9a263b4415211400-20240128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 213374751; Sun, 28 Jan 2024 23:31:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:44 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,07/22] dma-heap: Provide accessors so that in-kernel drivers can allocate dmabufs from specific heaps
Date: Mon, 29 Jan 2024 14:30:10 +0800
Message-ID: <20240129063025.29251-8-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129063025.29251-1-yunfei.dong@mediatek.com>
References: <20240129063025.29251-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_223131_863430_393C0E62 
X-CRM114-Status: GOOD (  21.68  )
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

From: John Stultz <jstultz@google.com>

This allows drivers who don't want to create their own
DMA-BUF exporter to be able to allocate DMA-BUFs directly
from existing DMA-BUF Heaps.

There is some concern that the premise of DMA-BUF heaps is
that userland knows better about what type of heap memory
is needed for a pipeline, so it would likely be best for
drivers to import and fill DMA-BUFs allocated by userland
instead of allocating one themselves, but this is still
up for debate.

Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[Yong: Fix the checkpatch alignment warning]
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/dma-buf/dma-heap.c | 83 ++++++++++++++++++++++++++++++--------
 include/linux/dma-heap.h   |  6 +++
 2 files changed, 73 insertions(+), 16 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 97025ee8500f..6efe833a4b10 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -51,12 +51,24 @@ static dev_t dma_heap_devt;
 static struct class *dma_heap_class;
 static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
-static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
-				 unsigned int fd_flags,
-				 unsigned int heap_flags)
+/**
+ * dma_heap_buffer_alloc - Allocate dma-buf from a dma_heap
+ * @heap:	DMA-Heap to allocate from
+ * @len:	size to allocate in bytes
+ * @fd_flags:	flags to set on returned dma-buf fd
+ * @heap_flags: flags to pass to the dma heap
+ *
+ * This is for internal dma-buf allocations only. Free returned buffers with dma_buf_put().
+ */
+struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
+				      unsigned int fd_flags,
+				      unsigned int heap_flags)
 {
-	struct dma_buf *dmabuf;
-	int fd;
+	if (fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
+		return ERR_PTR(-EINVAL);
+
+	if (heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
+		return ERR_PTR(-EINVAL);
 
 	/*
 	 * Allocations from all heaps have to begin
@@ -64,9 +76,20 @@ static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 	 */
 	len = PAGE_ALIGN(len);
 	if (!len)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+
+	return heap->ops->allocate(heap, len, fd_flags, heap_flags);
+}
+EXPORT_SYMBOL_GPL(dma_heap_buffer_alloc);
 
-	dmabuf = heap->ops->allocate(heap, len, fd_flags, heap_flags);
+static int dma_heap_bufferfd_alloc(struct dma_heap *heap, size_t len,
+				   unsigned int fd_flags,
+				   unsigned int heap_flags)
+{
+	struct dma_buf *dmabuf;
+	int fd;
+
+	dmabuf = dma_heap_buffer_alloc(heap, len, fd_flags, heap_flags);
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
@@ -104,15 +127,9 @@ static long dma_heap_ioctl_allocate(struct file *file, void *data)
 	if (heap_allocation->fd)
 		return -EINVAL;
 
-	if (heap_allocation->fd_flags & ~DMA_HEAP_VALID_FD_FLAGS)
-		return -EINVAL;
-
-	if (heap_allocation->heap_flags & ~DMA_HEAP_VALID_HEAP_FLAGS)
-		return -EINVAL;
-
-	fd = dma_heap_buffer_alloc(heap, heap_allocation->len,
-				   heap_allocation->fd_flags,
-				   heap_allocation->heap_flags);
+	fd = dma_heap_bufferfd_alloc(heap, heap_allocation->len,
+				     heap_allocation->fd_flags,
+				     heap_allocation->heap_flags);
 	if (fd < 0)
 		return fd;
 
@@ -205,6 +222,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -217,6 +235,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL_GPL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -307,6 +326,37 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL_GPL(dma_heap_add);
+
+/**
+ * dma_heap_find - get the heap registered with the specified name
+ * @name: Name of the DMA-Heap to find
+ *
+ * Returns:
+ * The DMA-Heap with the provided name.
+ *
+ * NOTE: DMA-Heaps returned from this function MUST be released using
+ * dma_heap_put() when the user is done to enable the heap to be unloaded.
+ */
+struct dma_heap *dma_heap_find(const char *name)
+{
+	struct dma_heap *h;
+
+	mutex_lock(&heap_list_lock);
+	list_for_each_entry(h, &heap_list, list) {
+		if (!kref_get_unless_zero(&h->refcount))
+			continue;
+
+		if (!strcmp(h->name, name)) {
+			mutex_unlock(&heap_list_lock);
+			return h;
+		}
+		dma_heap_put(h);
+	}
+	mutex_unlock(&heap_list_lock);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(dma_heap_find);
 
 static void dma_heap_release(struct kref *ref)
 {
@@ -332,6 +382,7 @@ void dma_heap_put(struct dma_heap *heap)
 {
 	kref_put(&heap->refcount, dma_heap_release);
 }
+EXPORT_SYMBOL_GPL(dma_heap_put);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index d57593f8a1bc..3cbf9bff2346 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -46,6 +46,12 @@ const char *dma_heap_get_name(struct dma_heap *heap);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+struct dma_heap *dma_heap_find(const char *name);
+
 void dma_heap_put(struct dma_heap *heap);
 
+struct dma_buf *dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
+				      unsigned int fd_flags,
+				      unsigned int heap_flags);
+
 #endif /* _DMA_HEAPS_H */
-- 
2.18.0


