Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119EACD1294
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 11:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lDY757TvdhBdVweLL8R40AiQq0CLs4BkWdV/XOzqqI=; b=dC1xPW79J+lLPjHHMN5kQOdYHp
	W2Y19Ir40tPnPNGm1VnAxLdr6FqJjsaVIx8tbCGJJXGKl+XexYT9JIHWvoyT9njmfexCd+s4lzjvS
	8WVCVQb00Fh0bKBr5oyZ6MjuGaNuvLCy4n6LsSVHlXMAjR9/VFoQMaVlvrshPHxpudNCcMfBOiw9M
	SgKlub6GXK1qUabDiI9y7ZbdTaAqYULhz7i0NBdV3BWT9RewIDHw8zp2CV8uB+92BG3cpg195Zddg
	JtuMhHP1e8pepmi5MSozZ+jFS+Nq7sE/MiPjJBUnn7eRDi1/x9vj+8TztIMWkhtUWnRAj+CEQMqcT
	Ul1kBrLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrysl-0000000FnFK-2Nz7;
	Wed, 03 Apr 2024 11:34:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxpp-0000000FUTD-2ZgE;
	Wed, 03 Apr 2024 10:27:23 +0000
X-UUID: b7be5576f1a411eeac1957ae9f99f617-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4lDY757TvdhBdVweLL8R40AiQq0CLs4BkWdV/XOzqqI=;
	b=epcyXjzPJfI/mY+uBYKH6a/B7ttU3kv9efhqBNtQb9qcM0sHQ1lJnZ6ys7rU1W+SJ+u+EcdRZO6dhBOTds1NN7MTKrUCw4wR0qeUubRTVxBvJgdS2t87f0W9+LGw0As5a9amh775LOeQO46mOyhmx/Y+R9hhTUQF8N7JrzJ0gSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b9fb4934-b3dd-4b81-addf-563c604a0e38,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:9e9d2c91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b7be5576f1a411eeac1957ae9f99f617-20240403
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 841703798; Wed, 03 Apr 2024 03:27:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:27:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:27:02 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
	<sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 2/9] drm/mediatek: Add secure buffer control flow to mtk_drm_gem
Date: Wed, 3 Apr 2024 18:26:54 +0800
Message-ID: <20240403102701.369-3-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102701.369-1-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_032714_124632_77D020D6 
X-CRM114-Status: GOOD (  16.20  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add secure buffer control flow to mtk_drm_gem.

When user space takes DRM_MTK_GEM_CREATE_ENCRYPTED flag and size
to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
dma buffer from secure dma-heap and bind it to mtk_drm_gem object.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_gem.c | 85 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_gem.h |  4 ++
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index e59e0727717b7..ec34d02c14377 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <uapi/linux/dma-heap.h>
 #include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
@@ -102,6 +104,81 @@ struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev,
 	return ERR_PTR(ret);
 }
 
+struct mtk_gem_obj *mtk_gem_create_from_heap(struct drm_device *dev,
+					     const char *heap, size_t size)
+{
+	struct mtk_drm_private *priv = dev->dev_private;
+	struct mtk_gem_obj *mtk_gem;
+	struct drm_gem_object *obj;
+	struct dma_heap *dma_heap;
+	struct dma_buf *dma_buf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	struct iosys_map map = {};
+	int ret;
+
+	mtk_gem = mtk_gem_init(dev, size);
+	if (IS_ERR(mtk_gem))
+		return ERR_CAST(mtk_gem);
+
+	obj = &mtk_gem->base;
+
+	dma_heap = dma_heap_find(heap);
+	if (!dma_heap) {
+		DRM_ERROR("heap find fail\n");
+		goto err_gem_free;
+	}
+	dma_buf = dma_heap_buffer_alloc(dma_heap, size,
+					O_RDWR | O_CLOEXEC, DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR(dma_buf)) {
+		DRM_ERROR("buffer alloc fail\n");
+		dma_heap_put(dma_heap);
+		goto err_gem_free;
+	}
+	dma_heap_put(dma_heap);
+
+	attach = dma_buf_attach(dma_buf, priv->dma_dev);
+	if (IS_ERR(attach)) {
+		DRM_ERROR("attach fail, return\n");
+		dma_buf_put(dma_buf);
+		goto err_gem_free;
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt)) {
+		DRM_ERROR("map failed, detach and return\n");
+		dma_buf_detach(dma_buf, attach);
+		dma_buf_put(dma_buf);
+		goto err_gem_free;
+	}
+	obj->import_attach = attach;
+	mtk_gem->dma_addr = sg_dma_address(sgt->sgl);
+	mtk_gem->sg = sgt;
+	mtk_gem->size = dma_buf->size;
+
+	if (!strcmp(heap, "mtk_svp") || !strcmp(heap, "mtk_svp_cma")) {
+		/* secure buffer can not be mapped */
+		mtk_gem->secure = true;
+	} else {
+		ret = dma_buf_vmap(dma_buf, &map);
+		mtk_gem->kvaddr = map.vaddr;
+		if (ret) {
+			DRM_ERROR("map failed, ret=%d\n", ret);
+			dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+			dma_buf_detach(dma_buf, attach);
+			dma_buf_put(dma_buf);
+			mtk_gem->kvaddr = NULL;
+		}
+	}
+
+	return mtk_gem;
+
+err_gem_free:
+	drm_gem_object_release(obj);
+	kfree(mtk_gem);
+	return ERR_PTR(-ENOMEM);
+}
+
 void mtk_gem_free_object(struct drm_gem_object *obj)
 {
 	struct mtk_gem_obj *mtk_gem = to_mtk_gem_obj(obj);
@@ -229,7 +306,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
+	mtk_gem->secure = !sg_page(sg->sgl);
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
+	mtk_gem->size = attach->dmabuf->size;
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
@@ -304,7 +383,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_mtk_gem_create *args = data;
 	int ret;
 
-	mtk_gem = mtk_gem_create(dev, args->size, false);
+	if (args->flags & DRM_MTK_GEM_CREATE_ENCRYPTED)
+		mtk_gem = mtk_gem_create_from_heap(dev, "mtk_svp_cma", args->size);
+	else
+		mtk_gem = mtk_gem_create(dev, args->size, false);
+
 	if (IS_ERR(mtk_gem))
 		return PTR_ERR(mtk_gem);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
index 4d7598220ca8f..75cf50495abe0 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_gem.h
@@ -27,9 +27,11 @@ struct mtk_gem_obj {
 	void			*cookie;
 	void			*kvaddr;
 	dma_addr_t		dma_addr;
+	size_t			size;
 	unsigned long		dma_attrs;
 	struct sg_table		*sg;
 	struct page		**pages;
+	bool			secure;
 };
 
 #define to_mtk_gem_obj(x) container_of(x, struct mtk_gem_obj, base)
@@ -37,6 +39,8 @@ struct mtk_gem_obj {
 void mtk_gem_free_object(struct drm_gem_object *gem);
 struct mtk_gem_obj *mtk_gem_create(struct drm_device *dev, size_t size,
 				   bool alloc_kmap);
+struct mtk_gem_obj *mtk_gem_create_from_heap(struct drm_device *dev,
+					     const char *heap, size_t size);
 int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
-- 
2.18.0


