Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821D6C48285
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 06:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t55MQIgMEx4p4MEJHDKfM0Ly5GklrK5skqp8MOiYDJY=; b=KH/ZSVCfMLa/Ngu4eUpgmisV2d
	97qTtUeVVrKorvRj+VHOthUAuhwFMZhABb6mZF/vL4r/4T6d1Q0lhsEB/Hhr3j+stdu57Q1FIl5J8
	skPTZPiOb6t1IdxH15oBWlAlpvAPzTnjdQlNbOUv94k1uUStq6gNrH4WZg3/ScjxPV+Bki/ddZOxV
	4UE775ZqloL2DiGzUJVpe22xYbJc1NMTRH6LLH+dbheLRFCkyZIIucsXLMPI0wgCLjjqhUeJKoG7e
	3cQO1saQb0Dc57yGL06Go03XVgGS/8wXtEHGnLs4jue+QsPM0LGHG6uVnH/rn8SKWMnXvqwqw2AZu
	1nOUgFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULAa-0000000BT5C-0BdT;
	Mon, 29 Jan 2024 06:31:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rULAO-0000000BT06-38lp;
	Mon, 29 Jan 2024 06:30:50 +0000
X-UUID: ef46da12be6f11eea0bf134e88e6c2dc-20240128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t55MQIgMEx4p4MEJHDKfM0Ly5GklrK5skqp8MOiYDJY=;
	b=nsMAojc3zvfX8AWckFbQEgNGexLQRSeqkTU9sR2rwM9+6g4bLb7cnqgEh8sCj1SdqZ8Isvqg2nhgXPyKWIXJncVa1ACwaIdq8neaKUyUInDHUfoXmJYfcEEZg0uymtlQIJToc7akjfi4FYyRNFY9X7FSpAYYtakyesWCZ6rf/hs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:3732cf7a-d888-48a8-b5b2-2ab986e1df3f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:e7b5c38e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ef46da12be6f11eea0bf134e88e6c2dc-20240128
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1639792138; Sun, 28 Jan 2024 23:30:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 14:30:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 14:30:41 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,05/22] dma-buf: heaps: Deduplicate docs and adopt common format
Date: Mon, 29 Jan 2024 14:30:08 +0800
Message-ID: <20240129063025.29251-6-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129063025.29251-1-yunfei.dong@mediatek.com>
References: <20240129063025.29251-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.731800-8.000000
X-TMASE-MatchedRID: GYgQ58L2uffwUuSygkLx9JD6BbDN9+jOQKuv8uQBDjpU4V1pMvNQR62r
	pHsK32BkBMhVYRT3oC/ANNz/A2ARw8VLWPBZNJvOhK8o4aoss8pKPIx+MJF9o99RlPzeVuQQOAX
	Ig5vwe9o0ULOv9iNOM/3selkw4oOREKA/i6/8kSnJ1E/nrJFED+rRJDUyDHkImyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1QGS24C8okcg0UY6Al+suVXSZFwtvGzSUYEcjocHIsGbUhAPo58/N5Abir
	iIhLLAmJFn06LXnxqMiuXMsUHSiaoBc61l++Ol20ADcYxDUMBTzYaPZALfIbSyZdUr8fx4fMbuy
	vvGhtICw8QUP6tkDzUMMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.731800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2AD739A2F45B7AC91481DBC1F64F2FB2F11C0453C01E071DB8E9D62C2158336F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_223048_864914_5966713E 
X-CRM114-Status: GOOD (  17.60  )
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
duplicated in the header they were wrong there too.

The docs formatting was inconsistent so I tried to make it more
consistent across functions since I'm already in here doing cleanup.

Remove multiple unused includes and alphabetize.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[Yong: Just add a comment for "priv" to mute build warning]
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/dma-buf/dma-heap.c | 27 +++++++++++++++------------
 include/linux/dma-heap.h   | 21 +--------------------
 2 files changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 84ae708fafe7..22f6c193db0d 100644
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
@@ -193,11 +192,11 @@ static const struct file_operations dma_heap_fops = {
 };
 
 /**
- * dma_heap_get_drvdata() - get per-subdriver data for the heap
+ * dma_heap_get_drvdata - get per-heap driver data
  * @heap: DMA-Heap to retrieve private data for
  *
  * Returns:
- * The per-subdriver data for the heap.
+ * The per-heap data for the heap.
  */
 void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
@@ -205,8 +204,8 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 }
 
 /**
- * dma_heap_get_name() - get heap name
- * @heap: DMA-Heap to retrieve private data for
+ * dma_heap_get_name - get heap name
+ * @heap: DMA-Heap to retrieve the name of
  *
  * Returns:
  * The char* for the heap name.
@@ -216,6 +215,10 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 	return heap->name;
 }
 
+/**
+ * dma_heap_add - adds a heap to dmabuf heaps
+ * @exp_info: information needed to register this heap
+ */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 {
 	struct dma_heap *heap, *h, *err_ret;
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 0c05561cad6e..fbe86ec889a8 100644
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
+ * @allocate:	allocate dmabuf and return struct dma_buf ptr
  *
  * allocate returns dmabuf on success, ERR_PTR(-errno) on error.
  */
@@ -41,28 +40,10 @@ struct dma_heap_export_info {
 	void *priv;
 };
 
-/**
- * dma_heap_get_drvdata() - get per-heap driver data
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The per-heap data for the heap.
- */
 void *dma_heap_get_drvdata(struct dma_heap *heap);
 
-/**
- * dma_heap_get_name() - get heap name
- * @heap: DMA-Heap to retrieve private data for
- *
- * Returns:
- * The char* for the heap name.
- */
 const char *dma_heap_get_name(struct dma_heap *heap);
 
-/**
- * dma_heap_add - adds a heap to dmabuf heaps
- * @exp_info:		information needed to register this heap
- */
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
 #endif /* _DMA_HEAPS_H */
-- 
2.18.0


