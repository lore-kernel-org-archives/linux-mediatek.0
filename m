Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13A0C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 02:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqaOGRS+JQDIuzzt0M0qRpuYeYNUeGNZRFNvhFxjdJw=; b=l9YNls2L01y1xNEJ9/BZg3y02Y
	5OzftFYZCLKz/EoLcn4n15/lb5bFn0Ld7ZSKBq3qfoiRlMe1h9iZGpKnLZ+X35fXh7a9YRtBBBW+Q
	JFJCrIH8IXdiq/P133cvD3Fc1YmiWrK8FzScBgX/Ssd45uaJ6HLyDC6h8QGd1OsinecAQcXdLg5W9
	2jgfcBxfvgFWBh5YQpTuz0mOCpFQ4HfuF8BMw85oyTYNI0CxvPCbWhpa8bBvWRp3nwhXvLN2Z5qEo
	wP5WOB919Mad7MWP9295owJ4i2SUVzuDrlgd/yFDMHSyxIutZ2VscqTAs+bMy/myEJqxH9QlrG0WK
	+D57BQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWiC-00H60I-2j;
	Mon, 11 Sep 2023 02:31:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfWi9-00H5xm-2X;
	Mon, 11 Sep 2023 02:31:39 +0000
X-UUID: 507955d2504b11ee9b7791016c24628a-20230910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tqaOGRS+JQDIuzzt0M0qRpuYeYNUeGNZRFNvhFxjdJw=;
	b=nUXzSvGdq6T/Rj9WO7iIU/0Qc95BVuwXr17RkGtAc5bdVZez7s36q5alIau7iGM5+23IOO+S7Rw+el2D6tEQtc+93ime0FUOpBwd/WmEBjDT2Zu7hej0KoyUW8oCwPFfBT5t5kOhItRUIIYicEfcg1lVqJ5JW1kKfL1XYQQtOH0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:47ce6825-8215-47a0-b5b9-3a47017c8169,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:115cadbe-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 507955d2504b11ee9b7791016c24628a-20230910
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 472372377; Sun, 10 Sep 2023 19:31:29 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Sep 2023 10:30:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Sep 2023 10:30:54 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>
Subject: [PATCH 1/9] dma-buf: heaps: Deduplicate docs and adopt common format
Date: Mon, 11 Sep 2023 10:30:30 +0800
Message-ID: <20230911023038.30649-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911023038.30649-1-yong.wu@mediatek.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_193137_830852_6C35781A 
X-CRM114-Status: GOOD (  15.74  )
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

From: "T.J. Mercier" <tjmercier@google.com>

The docs for dma_heap_get_name were incorrect, and since they were
duplicated in the implementation file they were wrong there too.

The docs formatting was inconsistent so I tried to make it more
consistent across functions since I'm already in here doing cleanup.

Remove multiple unused includes.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[Yong: Just add a comment for "priv" to mute build warning]
---
 drivers/dma-buf/dma-heap.c | 29 +++++++----------------------
 include/linux/dma-heap.h   | 11 +++++------
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..51030f6c9d6e 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -7,17 +7,15 @@
  */
 
 #include <linux/cdev.h>
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
 #include <linux/err.h>
-#include <linux/xarray.h>
 #include <linux/list.h>
-#include <linux/slab.h>
 #include <linux/nospec.h>
-#include <linux/uaccess.h>
 #include <linux/syscalls.h>
-#include <linux/dma-heap.h>
+#include <linux/uaccess.h>
+#include <linux/xarray.h>
 #include <uapi/linux/dma-heap.h>
 
 #define DEVNAME "dma_heap"
@@ -28,9 +26,10 @@
  * struct dma_heap - represents a dmabuf heap in the system
  * @name:		used for debugging/device-node name
  * @ops:		ops struct for this heap
- * @heap_devt		heap device node
- * @list		list head connecting to list of heaps
- * @heap_cdev		heap char device
+ * @priv:		private data for this heap
+ * @heap_devt:		heap device node
+ * @list:		list head connecting to list of heaps
+ * @heap_cdev:		heap char device
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -192,25 +191,11 @@ static const struct file_operations dma_heap_fops = {
 #endif
 };
 
-/**
- * dma_heap_get_drvdata() - get per-subdriver data for the heap
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The per-subdriver data for the heap.
- */
 void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
 
-/**
- * dma_heap_get_name() - get heap name
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The char* for the heap name.
- */
 const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..c7c29b724ad6 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -9,14 +9,13 @@
 #ifndef _DMA_HEAPS_H
 #define _DMA_HEAPS_H
 
-#include <linux/cdev.h>
 #include <linux/types.h>
 
 struct dma_heap;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
- * @allocate:		allocate dmabuf and return struct dma_buf ptr
+ * @allocate: allocate dmabuf and return struct dma_buf ptr
  *
  * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
  */
@@ -42,7 +41,7 @@ struct dma_heap_export_info {
 };
 
 /**
- * dma_heap_get_drvdata() - get per-heap driver data
+ * dma_heap_get_drvdata - get per-heap driver data
  * @heap: DMA-Heap to retrieve private data for
  *
  * Returns:
@@ -51,8 +50,8 @@ struct dma_heap_export_info {
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
 /**
- * dma_heap_get_name() - get heap name
- * @heap: DMA-Heap to retrieve private data for
+ * dma_heap_get_name - get heap name
+ * @heap: DMA-Heap to retrieve the name of
  *
  * Returns:
  * The char* for the heap name.
@@ -61,7 +60,7 @@ const char *dma_heap_get_name(struct dma_heap *heap);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
- * @exp_info:		information needed to register this heap
+ * @exp_info: information needed to register this heap
  */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
-- 
2.25.1


