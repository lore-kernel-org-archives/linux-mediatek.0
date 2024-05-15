Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0779DC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 11:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRII+MwEMjc7IBIb7T65bLDNnOYGy8L1r5/7E1ySfEk=; b=2WrBVyH0AT/V8MY2zlvWLvrIDY
	t4dAUMmEk3Xlnnv7KM2ibeUcvnpdvkgtfvkMQniZcz3V/+eYmZawLBhpb9QtN+hydLmDX3sJWmPeb
	0Rw/7z6IyHunkCRgLQvPTBwWCToEPGYy4MNvmcvyPRnzAGMz3MjESrZvLOYYa25ntSwiMd631X33w
	0zYGYDU37YjRJg9cZQFcBiIa9347kFmh2Lb6svh0lQd5dlbEAwHPbPzWalUb69sd5MPX+yVPKQTAC
	odxf6IFJ7Sjrk0vGi8sSDzWjGA49OgM6YNaj6c+r+PCt1aIRy6584RlzXQ+wPYCA3LURufj+ldjiM
	CEKPD17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Clu-00000001NdM-0SMA;
	Wed, 15 May 2024 11:26:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Clm-00000001NYQ-1T4H;
	Wed, 15 May 2024 11:26:05 +0000
X-UUID: e581cfea12ad11efa8f1cd58ee6c2400-20240515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pRII+MwEMjc7IBIb7T65bLDNnOYGy8L1r5/7E1ySfEk=;
	b=XTraS+Ia6U18kmDn890Uqw9sPEXJ3+G4x6Z4OJ9YFg2lLlvgPEoe4++0PR+c03dyKyqhMYz+VY56NyruHhFskQFY42k1jFiHTACtCglSm/Ws38y9HGTZcz3mLa3px67WfHumiqlHs6HYMJq8Z8NBDsplHWxfc/o9ZcI+EkdHJSk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:2b68eaf9-74dc-4289-900d-50307ec365c6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:cc41ca92-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e581cfea12ad11efa8f1cd58ee6c2400-20240515
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1053493483; Wed, 15 May 2024 04:25:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 May 2024 19:25:20 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 May 2024 19:25:19 +0800
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
Subject: [PATCH v5 9/9] dma_buf: heaps: restricted_heap_mtk: Add a new CMA heap
Date: Wed, 15 May 2024 19:23:08 +0800
Message-ID: <20240515112308.10171-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240515112308.10171-1-yong.wu@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_042602_524263_3D9144C5 
X-CRM114-Status: GOOD (  27.74  )
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

Create a new MediaTek CMA heap from the CMA reserved buffer.

In this heap, When the first allocating buffer, use cma_alloc to prepare
whole the CMA range, then send its range to TEE to protect and manage.
For the later allocating, we just adds the cma_used_size.

When SVP done, cma_release will release the buffer, then kernel may
reuse it.

For the "CMA" restricted heap, "struct cma *cma" is a common property,
not just for MediaTek, so put it into "struct restricted_heap" instead of
our private data.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/dma-buf/heaps/Kconfig               |   2 +-
 drivers/dma-buf/heaps/restricted_heap.h     |   4 +
 drivers/dma-buf/heaps/restricted_heap_mtk.c | 121 +++++++++++++++++++-
 3 files changed, 123 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
index 84f748fb2856..58903bc62ac8 100644
--- a/drivers/dma-buf/heaps/Kconfig
+++ b/drivers/dma-buf/heaps/Kconfig
@@ -24,7 +24,7 @@ config DMABUF_HEAPS_RESTRICTED
 
 config DMABUF_HEAPS_RESTRICTED_MTK
 	bool "MediaTek DMA-BUF Restricted Heap"
-	depends on DMABUF_HEAPS_RESTRICTED && TEE=y
+	depends on DMABUF_HEAPS_RESTRICTED && DMA_CMA && TEE=y
 	help
 	  Enable restricted dma-buf heaps for MediaTek platform. This heap is backed by
 	  TEE client interfaces. If in doubt, say N.
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 8cb9211093c5..7dec4b8a471b 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -23,6 +23,10 @@ struct restricted_heap {
 
 	const struct restricted_heap_ops *ops;
 
+	struct cma		*cma;
+	unsigned long		cma_paddr;
+	unsigned long		cma_size;
+
 	void			*priv_data;
 };
 
diff --git a/drivers/dma-buf/heaps/restricted_heap_mtk.c b/drivers/dma-buf/heaps/restricted_heap_mtk.c
index e571eae719e0..6d8119828485 100644
--- a/drivers/dma-buf/heaps/restricted_heap_mtk.c
+++ b/drivers/dma-buf/heaps/restricted_heap_mtk.c
@@ -6,9 +6,11 @@
  */
 #define pr_fmt(fmt)     "rheap_mtk: " fmt
 
+#include <linux/cma.h>
 #include <linux/dma-buf.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
@@ -25,6 +27,13 @@ enum mtk_secure_mem_type {
 	 * management is inside the TEE.
 	 */
 	MTK_SECURE_MEMORY_TYPE_CM_TZ	= 1,
+	/*
+	 * MediaTek dynamic chunk memory carved out from CMA.
+	 * In normal case, the CMA could be used in kernel; When SVP start, we will
+	 * allocate whole this CMA and pass whole the CMA PA and size into TEE to
+	 * protect it, then the detail memory management also is inside the TEE.
+	 */
+	MTK_SECURE_MEMORY_TYPE_CM_CMA	= 2,
 };
 
 /* This structure also is synchronized with tee, thus not use the phys_addr_t */
@@ -40,7 +49,8 @@ enum mtk_secure_buffer_tee_cmd {
 	 * [in]  value[0].a: The buffer size.
 	 *       value[0].b: alignment.
 	 * [in]  value[1].a: enum mtk_secure_mem_type.
-	 * [inout]
+	 * [inout] [in]  value[2].a: pa base in cma case.
+	 *               value[2].b: The buffer size in cma case.
 	 *         [out] value[2].a: entry number of memory block.
 	 *                           If this is 1, it means the memory is continuous.
 	 *               value[2].b: buffer PA base.
@@ -73,6 +83,9 @@ struct mtk_restricted_heap_data {
 
 	const enum mtk_secure_mem_type mem_type;
 
+	struct page		*cma_page;
+	unsigned long		cma_used_size;
+	struct mutex		lock; /* lock for cma_used_size */
 };
 
 static int mtk_tee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
@@ -173,6 +186,10 @@ static int mtk_tee_restrict_memory(struct restricted_heap *rheap, struct restric
 	params[1].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
 	params[1].u.value.a = data->mem_type;
 	params[2].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT;
+	if (rheap->cma && data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
+		params[2].u.value.a = rheap->cma_paddr;
+		params[2].u.value.b = rheap->cma_size;
+	}
 	params[3].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT;
 	ret = mtk_tee_service_call(data->tee_ctx, data->tee_session,
 				   MTK_TZCMD_SECMEM_ZALLOC, params);
@@ -265,6 +282,48 @@ mtk_restricted_memory_free(struct restricted_heap *rheap, struct restricted_buff
 {
 }
 
+static int mtk_restricted_memory_cma_allocate(struct restricted_heap *rheap,
+					      struct restricted_buffer *buf)
+{
+	struct mtk_restricted_heap_data *data = rheap->priv_data;
+	int ret = 0;
+	/*
+	 * Allocate CMA only when allocating buffer for the first time, and just
+	 * increase cma_used_size at the other time, Actually the memory
+	 * allocating is within the TEE.
+	 */
+	mutex_lock(&data->lock);
+	if (!data->cma_used_size) {
+		data->cma_page = cma_alloc(rheap->cma, rheap->cma_size >> PAGE_SHIFT,
+					   get_order(PAGE_SIZE), false);
+		if (!data->cma_page) {
+			ret = -ENOMEM;
+			goto out_unlock;
+		}
+	} else if (data->cma_used_size + buf->size > rheap->cma_size) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	data->cma_used_size += buf->size;
+
+out_unlock:
+	mutex_unlock(&data->lock);
+	return ret;
+}
+
+static void mtk_restricted_memory_cma_free(struct restricted_heap *rheap,
+					   struct restricted_buffer *buf)
+{
+	struct mtk_restricted_heap_data *data = rheap->priv_data;
+
+	mutex_lock(&data->lock);
+	data->cma_used_size -= buf->size;
+	if (!data->cma_used_size)
+		cma_release(rheap->cma, data->cma_page,
+			    rheap->cma_size >> PAGE_SHIFT);
+	mutex_unlock(&data->lock);
+}
+
 static int mtk_restricted_heap_init(struct restricted_heap *rheap)
 {
 	struct mtk_restricted_heap_data *data = rheap->priv_data;
@@ -286,21 +345,77 @@ static struct mtk_restricted_heap_data mtk_restricted_heap_data = {
 	.mem_type		= MTK_SECURE_MEMORY_TYPE_CM_TZ,
 };
 
+static const struct restricted_heap_ops mtk_restricted_heap_ops_cma = {
+	.heap_init		= mtk_restricted_heap_init,
+	.alloc			= mtk_restricted_memory_cma_allocate,
+	.free			= mtk_restricted_memory_cma_free,
+	.restrict_buf		= mtk_tee_restrict_memory,
+	.unrestrict_buf		= mtk_tee_unrestrict_memory,
+};
+
+static struct mtk_restricted_heap_data mtk_restricted_heap_data_cma = {
+	.mem_type		= MTK_SECURE_MEMORY_TYPE_CM_CMA,
+};
+
 static struct restricted_heap mtk_restricted_heaps[] = {
 	{
 		.name		= "restricted_mtk_cm",
 		.ops		= &mtk_restricted_heap_ops,
 		.priv_data	= &mtk_restricted_heap_data,
 	},
+	{
+		.name		= "restricted_mtk_cma",
+		.ops		= &mtk_restricted_heap_ops_cma,
+		.priv_data	= &mtk_restricted_heap_data_cma,
+	},
 };
 
+static int __init mtk_restricted_cma_init(struct reserved_mem *rmem)
+{
+	struct restricted_heap *rheap = mtk_restricted_heaps, *rheap_cma = NULL;
+	struct mtk_restricted_heap_data *data;
+	struct cma *cma;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++) {
+		data = rheap->priv_data;
+		if (data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA) {
+			rheap_cma = rheap;
+			break;
+		}
+	}
+	if (!rheap_cma)
+		return -EINVAL;
+
+	ret = cma_init_reserved_mem(rmem->base, rmem->size, 0, rmem->name,
+				    &cma);
+	if (ret) {
+		pr_err("%s: %s set up CMA fail. ret %d.\n", __func__, rmem->name, ret);
+		return ret;
+	}
+
+	rheap_cma->cma = cma;
+	rheap_cma->cma_paddr = rmem->base;
+	rheap_cma->cma_size = rmem->size;
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(restricted_cma, "mediatek,dynamic-restricted-region",
+		       mtk_restricted_cma_init);
+
 static int mtk_restricted_heap_initialize(void)
 {
 	struct restricted_heap *rheap = mtk_restricted_heaps;
+	struct mtk_restricted_heap_data *data;
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++)
-		restricted_heap_add(rheap);
+	for (i = 0; i < ARRAY_SIZE(mtk_restricted_heaps); i++, rheap++) {
+		data = rheap->priv_data;
+		if (data->mem_type == MTK_SECURE_MEMORY_TYPE_CM_CMA && !rheap->cma)
+			continue;
+		if (!restricted_heap_add(rheap))
+			mutex_init(&data->lock);
+	}
 	return 0;
 }
 module_init(mtk_restricted_heap_initialize);
-- 
2.25.1


