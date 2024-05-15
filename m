Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D5AC25B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 11:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99yDZfI0Js1lTRhQwhKsEvFeH9oWtTeH78nbVnrbyNg=; b=bkE6cApTRJUqvFOTmMdiMT2S5H
	o6mRyrzAX6eoXZFG073qukzGc/snbjCyufJQ5wD7sS9Bkp8ZnxxJWZaOoVFKU8yz215pNHCGCMeyX
	m5XjlL6WI0VUdNEtZSBQPDJV46Vu0lzRmp28S9dSS1HSBcUztnIJ9Acg9UOGPCiBucaPtReBQrV9B
	KMREQn3+++cAgMO6WKyUH21T4HyfWM0PG96WCDiQAHcCtjA52kcocHnhdgz3630HTlmwwWCs/O0wJ
	n4E4TsI7Ni0Kb0AtBZJOpIh9Y4VsoqoYTfbe/WMt7u31QyqzYfbEpK5orjr0G8dSrl0pLpKZN1cpI
	oYFgTRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ClE-00000001NCr-4BLx;
	Wed, 15 May 2024 11:25:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ckh-00000001MoX-1Oem;
	Wed, 15 May 2024 11:25:04 +0000
X-UUID: bddc5d7a12ad11efa8f1cd58ee6c2400-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=99yDZfI0Js1lTRhQwhKsEvFeH9oWtTeH78nbVnrbyNg=;
	b=IIFLdnlonqyJNu0RCA01LMs0YCz8YYHgC7AU4Eecg4V5y8WIUsljC7PJsjQbXVxYk7LzwduZaVGhwWapwRy+IaaUZOcQ844CDpBJqpwFZi2k5DZfl85VOZ0e71RXbi5C0tC+7mTtZIJKcBniMWmLtp1xRfkMc/1s9PwbPMVqBbk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:ec8ac358-3b83-44dd-a2a7-85adde3c84a2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:82c5f88,CLOUDID:b12be383-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bddc5d7a12ad11efa8f1cd58ee6c2400-20240515
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 897463764; Wed, 15 May 2024 04:24:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:24:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:24:45 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <christian.koenig@amd.com>, Sumit Semwal
	<sumit.semwal@linaro.org>, Andrew Morton <akpm@linux-foundation.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Vijayanand Jitta <quic_vjitta@quicinc.com>, Joakim Bech
	<joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, Pavel
 Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, Pekka Paalanen
	<ppaalanen@gmail.com>, <willy@infradead.org>, Logan Gunthorpe
	<logang@deltatee.com>, Daniel Vetter <daniel@ffwll.ch>,
	<jianjiao.zeng@mediatek.com>, <kuohong.wang@mediatek.com>,
	<youlin.pei@mediatek.com>
Subject: [PATCH v5 6/9] dma-buf: heaps: restricted_heap: Add dma_ops
Date: Wed, 15 May 2024 19:23:05 +0800
Message-ID: <20240515112308.10171-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_042455_700562_7E6CB4B9 
X-CRM114-Status: GOOD (  16.06  )
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

Add the dma_ops for this restricted heap. For restricted buffer,
1) cache_ops/mmap are not allowed, thus return EPERM for them.
2) In map_dma_buf, use DMA_ATTR_SKIP_CPU_SYNC to skip cache sync since
   the buffer is protected.
This type buffers are marked by sg_dma_mark_restricted, the user could
check if this is a restricted buffer by sg_dma_is_restricted.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/restricted_heap.c | 102 ++++++++++++++++++++++++
 drivers/dma-buf/heaps/restricted_heap.h |   2 +
 2 files changed, 104 insertions(+)

diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index 8bb3c1876a69..4e45d46a6467 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -8,10 +8,16 @@
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
 #include <linux/err.h>
+#include <linux/scatterlist.h>
 #include <linux/slab.h>
 
 #include "restricted_heap.h"
 
+struct restricted_heap_attachment {
+	struct sg_table			*table;
+	struct device			*dev;
+};
+
 static int
 restricted_heap_memory_allocate(struct restricted_heap *rheap, struct restricted_buffer *buf)
 {
@@ -45,6 +51,101 @@ restricted_heap_memory_free(struct restricted_heap *rheap, struct restricted_buf
 	ops->free(rheap, buf);
 }
 
+static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct restricted_buffer *restricted_buf = dmabuf->priv;
+	struct restricted_heap_attachment *a;
+	struct sg_table *table;
+
+	a = kzalloc(sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	table = sg_dup_table(&restricted_buf->sg_table);
+	if (!table) {
+		kfree(a);
+		return -ENOMEM;
+	}
+
+	sg_dma_mark_restricted(table->sgl);
+	a->table = table;
+	a->dev = attachment->dev;
+	attachment->priv = a;
+
+	return 0;
+}
+
+static void restricted_heap_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
+{
+	struct restricted_heap_attachment *a = attachment->priv;
+
+	sg_free_table(a->table);
+	kfree(a->table);
+	kfree(a);
+}
+
+static struct sg_table *
+restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment,
+			    enum dma_data_direction direction)
+{
+	struct restricted_heap_attachment *a = attachment->priv;
+	struct sg_table *table = a->table;
+	int ret;
+
+	ret = dma_map_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
+	if (ret)
+		return ERR_PTR(ret);
+	return table;
+}
+
+static void
+restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_table *table,
+			      enum dma_data_direction direction)
+{
+	struct restricted_heap_attachment *a = attachment->priv;
+
+	WARN_ON(a->table != table);
+
+	dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static int
+restricted_heap_dma_buf_begin_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int
+restricted_heap_dma_buf_end_cpu_access(struct dma_buf *dmabuf, enum dma_data_direction direction)
+{
+	return -EPERM;
+}
+
+static int restricted_heap_dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	return -EPERM;
+}
+
+static void restricted_heap_free(struct dma_buf *dmabuf)
+{
+	struct restricted_buffer *restricted_buf = dmabuf->priv;
+	struct restricted_heap *rheap = dma_heap_get_drvdata(restricted_buf->heap);
+
+	restricted_heap_memory_free(rheap, restricted_buf);
+	kfree(restricted_buf);
+}
+
+static const struct dma_buf_ops restricted_heap_buf_ops = {
+	.attach		= restricted_heap_attach,
+	.detach		= restricted_heap_detach,
+	.map_dma_buf	= restricted_heap_map_dma_buf,
+	.unmap_dma_buf	= restricted_heap_unmap_dma_buf,
+	.begin_cpu_access = restricted_heap_dma_buf_begin_cpu_access,
+	.end_cpu_access	= restricted_heap_dma_buf_end_cpu_access,
+	.mmap		= restricted_heap_dma_buf_mmap,
+	.release	= restricted_heap_free,
+};
+
 static struct dma_buf *
 restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 			 unsigned long fd_flags, unsigned long heap_flags)
@@ -66,6 +167,7 @@ restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
 	if (ret)
 		goto err_free_buf;
 	exp_info.exp_name = dma_heap_get_name(heap);
+	exp_info.ops = &restricted_heap_buf_ops;
 	exp_info.size = restricted_buf->size;
 	exp_info.flags = fd_flags;
 	exp_info.priv = restricted_buf;
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 5783275d5714..6d9599a4a34e 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -11,6 +11,8 @@
 struct restricted_buffer {
 	struct dma_heap		*heap;
 	size_t			size;
+
+	struct sg_table		sg_table;
 };
 
 struct restricted_heap {
-- 
2.25.1


