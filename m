Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE280C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 May 2024 12:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xKPtK+eSyCFTpdeW0Z+gbZ1CA9J+Sm7RjZuCyigMlY=; b=4AT83Z8NZE2Kn+baFOomj1bHHu
	ahogj+ibFJKeC/bAG29O530kEg4bZZe1SIshRmZCn01c16yyNuSahoyCGHvi6lEbbqgdLDsJj4QnI
	8dFWccrDNe+AF+jK7ICQ14pSWESO96gaPaYvLdgnAO/oThbPUxYXjWgp+ddorohAdnUq290NSjng/
	LJq1KPlrOxZGuolH/4oyuaC6VXJ1TeTCerxyl4vMrh7OUMIQlPCR2JQ0+YpZUXU0Om5YQ97ZHFFJZ
	bh27Kv0TjPIfWH6KYp2xA/CwA2uh4nH0NkAsANlEV2KAHaIBWWVq5WLrI+kTSmeIwDI22n4q8MqpV
	8mPUknfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7a8Q-00000004lqu-2QAi;
	Thu, 16 May 2024 12:22:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7a7c-00000004lHp-01dc;
	Thu, 16 May 2024 12:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/xKPtK+eSyCFTpdeW0Z+gbZ1CA9J+Sm7RjZuCyigMlY=; b=B3QdI+irFfmq8iKv1QaLiVxCE1
	MPd+GWzWrBC6tbGomEzOtVUB6HynItdY6/qdeFFdYqWYy5MYP7Z35BgHVCN5ImK12GrPHnd+DDDNo
	wa5oWuHFi97jkJWBseI7/xUgRX2j26R0aQOSsIitCa28Uc/0achSKnk0VXCAvaF4GiY/Ke4CqeFeB
	Yp4WKGaOyog7dOfTZE9gCyXbLPN1bd6ey/En1yyqNP38qS1//cxIDI2/XX9rkhwJnVxRkVx8dNcrg
	EepovjuV2Ki7u/eT8cXFh1G/wJ0/I2Wha57P1raDRmg526RKKMjAeO/05482f24peAMv2hz0tV6Wc
	Fe+HiNYg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7a7X-00000005QTl-3NMf;
	Thu, 16 May 2024 12:22:06 +0000
X-UUID: e365b3da137e11efa8f1cd58ee6c2400-20240516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/xKPtK+eSyCFTpdeW0Z+gbZ1CA9J+Sm7RjZuCyigMlY=;
	b=G93Y/p7Uz8mHj1SMTz34tROjm2IrR2rwKkLpRtxMacf2PSs9gaD2hWHjwbKpdBNKl9OV1dbhMEPXHBfULEn2XMCDnpCvKQd39DRB8hgDLI2TxnooCoUQ1OK290VVKl4KLPbtGSzDuMSniQaU51w9QVk90QlH7FpPanX1QcHKGXw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:e67606e9-2d4e-4710-bd5e-94182a9591dd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:db547087-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e365b3da137e11efa8f1cd58ee6c2400-20240516
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 841794567; Thu, 16 May 2024 05:21:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 May 2024 20:21:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 May 2024 20:21:23 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6,12/24] media: mediatek: vcodec: add interface to allocate/free secure memory
Date: Thu, 16 May 2024 20:20:50 +0800
Message-ID: <20240516122102.16379-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240516122102.16379-1-yunfei.dong@mediatek.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.939000-8.000000
X-TMASE-MatchedRID: zw7qKAGHZJaVUgVEUxWI0M36paW7ZnFoqQ9UezeTkTjK99fyOVK2z8Rr
	vjvFKTaxvl8gwRzU3uXUaxsqcNeOOm8aeniRmKw1oMfp2vHck9W7nrAU9KQxUbXvDHySC+eUd/f
	gGgoXNwfBfR/WU+6YOCtvlgVfOuhgVo9xxUteKStEtgfzRzMa1+WNJG9Iamrch5Q1ArtCPlyu01
	fPRCxAIkGUQBmB+AgBkDfm1zFLejyR9GF2J2xqMxRFJJyf5BJe3QfwsVk0UbvWxQsAIHSpEkz29
	EGOOh8zNZJDhfepoARgMZrm/uWkK33YvSZTn/tqleXDE6E+NjKUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.939000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 730FA7EDCD17DC9FE1E4D47EF8D3412BFA3083AD50317C2B294A9CF2025C8FCF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_132204_401685_078C8711 
X-CRM114-Status: GOOD (  17.80  )
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

Need to call dma heap interface to allocate/free secure memory when playing
secure video.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/Kconfig    |   1 +
 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 122 +++++++++++++++++-
 .../mediatek/vcodec/common/mtk_vcodec_util.h  |   3 +
 3 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/Kconfig b/drivers/media/platform/mediatek/vcodec/Kconfig
index bc8292232530..707865703e61 100644
--- a/drivers/media/platform/mediatek/vcodec/Kconfig
+++ b/drivers/media/platform/mediatek/vcodec/Kconfig
@@ -17,6 +17,7 @@ config VIDEO_MEDIATEK_VCODEC
 	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
 	depends on MTK_SCP || !MTK_SCP
 	depends on MTK_SMI || (COMPILE_TEST && MTK_SMI=n)
+	depends on DMABUF_HEAPS
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
 	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index c60e4c193b25..5958dcd7965a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -5,9 +5,11 @@
 *	Tiffany Lin <tiffany.lin@mediatek.com>
 */
 
+#include <linux/dma-heap.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
+#include <uapi/linux/dma-heap.h>
 
 #include "../decoder/mtk_vcodec_dec_drv.h"
 #include "../encoder/mtk_vcodec_enc_drv.h"
@@ -45,7 +47,7 @@ int mtk_vcodec_write_vdecsys(struct mtk_vcodec_dec_ctx *ctx, unsigned int reg,
 }
 EXPORT_SYMBOL(mtk_vcodec_write_vdecsys);
 
-int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -75,9 +77,71 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 
 	return 0;
 }
-EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
 
-void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+static int mtk_vcodec_mem_alloc_sec(struct mtk_vcodec_dec_ctx *ctx, struct mtk_vcodec_mem *mem)
+{
+	struct device *dev = &ctx->dev->plat_dev->dev;
+	struct dma_buf *dma_buffer;
+	struct dma_heap *vdec_heap;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	unsigned long size = mem->size;
+	int ret = 0;
+
+	if (!size)
+		return -EINVAL;
+
+	vdec_heap = dma_heap_find("restricted_mtk_cma");
+	if (!vdec_heap) {
+		mtk_v4l2_vdec_err(ctx, "dma heap find failed!");
+		return -EPERM;
+	}
+
+	dma_buffer = dma_heap_buffer_alloc(vdec_heap, size, DMA_HEAP_VALID_FD_FLAGS,
+					   DMA_HEAP_VALID_HEAP_FLAGS);
+	if (IS_ERR_OR_NULL(dma_buffer)) {
+		mtk_v4l2_vdec_err(ctx, "dma heap alloc size=0x%lx failed!", size);
+		return PTR_ERR(dma_buffer);
+	}
+
+	attach = dma_buf_attach(dma_buffer, dev);
+	if (IS_ERR_OR_NULL(attach)) {
+		mtk_v4l2_vdec_err(ctx, "dma attach size=0x%lx failed!", size);
+		ret = PTR_ERR(attach);
+		goto err_attach;
+	}
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR_OR_NULL(sgt)) {
+		mtk_v4l2_vdec_err(ctx, "dma map attach size=0x%lx failed!", size);
+		ret = PTR_ERR(sgt);
+		goto err_sgt;
+	}
+
+	mem->va = dma_buffer;
+	mem->dma_addr = (dma_addr_t)sg_dma_address((sgt)->sgl);
+
+	if (!mem->va || !mem->dma_addr) {
+		mtk_v4l2_vdec_err(ctx, "dma buffer size=0x%lx failed!", size);
+		ret = -EPERM;
+		goto err_addr;
+	}
+
+	mem->attach = attach;
+	mem->sgt = sgt;
+
+	return 0;
+err_addr:
+	dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+err_sgt:
+	dma_buf_detach(dma_buffer, attach);
+err_attach:
+	dma_buf_put(dma_buffer);
+
+	return ret;
+}
+
+static void mtk_vcodec_mem_free_nor(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
@@ -110,6 +174,57 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	mem->dma_addr = 0;
 	mem->size = 0;
 }
+
+static void mtk_vcodec_mem_free_sec(struct mtk_vcodec_mem *mem)
+{
+	if (mem->sgt)
+		dma_buf_unmap_attachment(mem->attach, mem->sgt, DMA_BIDIRECTIONAL);
+	dma_buf_detach((struct dma_buf *)mem->va, mem->attach);
+	dma_buf_put((struct dma_buf *)mem->va);
+
+	mem->attach = NULL;
+	mem->sgt = NULL;
+	mem->va = NULL;
+	mem->dma_addr = 0;
+	mem->size = 0;
+}
+
+int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+	int ret;
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback) {
+			ret = mtk_vcodec_mem_alloc_sec(dec_ctx, mem);
+			goto alloc_end;
+		}
+	}
+
+	ret = mtk_vcodec_mem_alloc_nor(priv, mem);
+alloc_end:
+
+	return ret;
+}
+EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
+
+void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
+{
+	enum mtk_instance_type inst_type = *((unsigned int *)priv);
+
+	if (inst_type == MTK_INST_DECODER) {
+		struct mtk_vcodec_dec_ctx *dec_ctx = priv;
+
+		if (dec_ctx->is_secure_playback) {
+			mtk_vcodec_mem_free_sec(mem);
+			return;
+		}
+	}
+
+	mtk_vcodec_mem_free_nor(priv, mem);
+}
 EXPORT_SYMBOL(mtk_vcodec_mem_free);
 
 void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dec_dev *dev, int hw_idx)
@@ -171,3 +286,4 @@ EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Mediatek video codec driver");
+MODULE_IMPORT_NS(DMA_BUF);
diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
index 85f615cdd4d3..22078e757ed0 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.h
@@ -18,6 +18,9 @@ struct mtk_vcodec_mem {
 	size_t size;
 	void *va;
 	dma_addr_t dma_addr;
+
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
 };
 
 struct mtk_vcodec_fb {
-- 
2.25.1


