Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA6CD3432
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 03:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RLDw7GW/vAflRKIDHmKnuIo5Umx5dhJsbVlDeutM/U=; b=KAoRZ2p5fVnGqYkA8VkBWsi00x
	tTvT/hFO/ryTEcxw7cz127BAAXXtIhyJ77/gHS6/gyntjkT9pOV2F4uNTDw4S8ZPgbPRo4dVf6wdF
	FPA2riICrahF9NXK2Y5gfkBv+Rj6AxPopPA5Mlx+R+N7Tc5e5kZ1VeTs/kYYBMfa1GE8GUF/axIii
	v7lcxiCL3l6Bar2EP0UM3gqewrCv46EwqR1ktSdyFddgItn4/9+effWPXrKvxV1w03PTIbmbLUpV7
	1wDet7SL3JJjuyNn4D5Z9dk4yh8XZT3+vqFbaGTBnJ/wKi1aKSRJ3TpXQcgbCsPfSM+xLlbP2wXIr
	NqyORvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiR2L-00GltF-2A;
	Tue, 19 Sep 2023 03:04:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiR2H-00Glpb-0z;
	Tue, 19 Sep 2023 03:04:27 +0000
X-UUID: 3bbf45d0569911ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3RLDw7GW/vAflRKIDHmKnuIo5Umx5dhJsbVlDeutM/U=;
	b=n22Bg9KNGzpA29OAKpi6+JSbfTvBztxTQ1xXEzIt6AiE+BQ6LBV8v1Jv1oKDYM+rBOByEHy0NyiBZmIJ5fHQPwGbD3njgjbMryET0Lu+qu6gaCT6bXS3Z+dPdPceMHipmCsi/CJrFdSQujaDyNbjyGzgR41LxjD05UHBfkQguTg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:5d7ffc28-f5fd-455c-a7ba-e342a4c44314,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:51b8daef-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3bbf45d0569911ee86758d4a7c00f3a0-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1735135000; Mon, 18 Sep 2023 20:04:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Sep 2023 11:03:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Sep 2023 11:03:47 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, Jason-ch
 Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 03/10] drm/mediatek: Add secure buffer control flow to mtk_drm_gem
Date: Tue, 19 Sep 2023 11:03:38 +0800
Message-ID: <20230919030345.8629-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_200425_365806_B3DBC440 
X-CRM114-Status: GOOD (  16.84  )
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

Add secure buffer control flow to mtk_drm_gem.

When user space takes DRM_MTK_GEM_CREATE_ENCRYPTED flag and size
to create a mtk_drm_gem object, mtk_drm_gem will find a matched size
dma buffer from secure dma-heap and bind it to mtk_drm_gem object.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 84 +++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h |  4 ++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index bcce723f257d..2064ccd7dde0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/dma-buf.h>
+#include <linux/dma-heap.h>
+#include <uapi/linux/dma-heap.h>
 #include <drm/mediatek_drm.h>
 
 #include <drm/drm.h>
@@ -55,6 +57,80 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 	return mtk_gem_obj;
 }
 
+struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
+						     const char *heap, size_t size)
+{
+	struct mtk_drm_private *priv = dev->dev_private;
+	struct mtk_drm_gem_obj *mtk_gem;
+	struct drm_gem_object *obj;
+	struct dma_heap *dma_heap;
+	struct dma_buf *dma_buf;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	struct iosys_map map = {};
+	int ret;
+
+	mtk_gem = mtk_drm_gem_init(dev, size);
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
+		mtk_gem->sec = true;
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
 struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev,
 					   size_t size, bool alloc_kmap)
 {
@@ -218,7 +294,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
 	if (IS_ERR(mtk_gem))
 		return ERR_CAST(mtk_gem);
 
+	mtk_gem->sec = !sg_page(sg->sgl);
 	mtk_gem->dma_addr = sg_dma_address(sg->sgl);
+	mtk_gem->size = attach->dmabuf->size;
 	mtk_gem->sg = sg;
 
 	return &mtk_gem->base;
@@ -290,7 +368,11 @@ int mtk_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_mtk_gem_create *args = data;
 	int ret;
 
-	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
+	if (args->flags & DRM_MTK_GEM_CREATE_ENCRYPTED)
+		mtk_gem = mtk_drm_gem_create_from_heap(dev, "mtk_svp_cma", args->size);
+	else
+		mtk_gem = mtk_drm_gem_create(dev, args->size, false);
+
 	if (IS_ERR(mtk_gem))
 		return PTR_ERR(mtk_gem);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
index 90f3d2916ec5..ed4d23e252e9 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
@@ -27,9 +27,11 @@ struct mtk_drm_gem_obj {
 	void			*cookie;
 	void			*kvaddr;
 	dma_addr_t		dma_addr;
+	size_t			size;
 	unsigned long		dma_attrs;
 	struct sg_table		*sg;
 	struct page		**pages;
+	bool			sec;
 };
 
 #define to_mtk_gem_obj(x)	container_of(x, struct mtk_drm_gem_obj, base)
@@ -37,6 +39,8 @@ struct mtk_drm_gem_obj {
 void mtk_drm_gem_free_object(struct drm_gem_object *gem);
 struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_device *dev, size_t size,
 					   bool alloc_kmap);
+struct mtk_drm_gem_obj *mtk_drm_gem_create_from_heap(struct drm_device *dev,
+						     const char *heap, size_t size);
 int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 			    struct drm_mode_create_dumb *args);
 struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
-- 
2.18.0


