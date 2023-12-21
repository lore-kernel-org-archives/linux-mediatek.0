Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B266C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 09:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZlHGzvCeyHzNr9SWDCy3oc9Vlh9aPeReD6PrS2OHo0=; b=eh5CD05W8ybJjk
	i4Hgc1dqgB/svFUTbAC5xhzK/EZfYj/pTvt/etttdJLez6LY3YfK+IhA7DmQbgzaF0m78mzC0oxE3
	bQImlXLwRzXpp89PMe573z7+824IYRqh4aFDCx4gLGUa5JiYke2bGL0z3Nji3OzAAJ2jBxT82mhOm
	s8dRZyHb+g6tLgTEmklD3gVCaSxCr8BSVOqqBLyQiIfunJYycsGcNJ1xBf85JRSqQ4lYtcSyasJKm
	25tbanFLySA4rXLj59mBMJTYb5au2MvIroLB/N9YAnl4Ry0x4ju8MbFOV8+s3i3HqvEdQuxeoKU4/
	VdUQeGjFjHdONKwhYIZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFHC-002FOm-07;
	Thu, 21 Dec 2023 09:23:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFH2-002FHM-2Z
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 09:23:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5cd8e2988ddso224500a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Dec 2023 01:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703150603; x=1703755403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZlHGzvCeyHzNr9SWDCy3oc9Vlh9aPeReD6PrS2OHo0=;
        b=GEmo4+iZBLu+uQRUQ0SLvVC5G0j5bc8AVlnym4gWwhAQFISPzrdzez1XDSOMT9RPwJ
         RcY7oZk+Ma4XIxZCOCvy/5/ovixA+rmqP+Ke8Kfj2u9pA3pUEbXI6ZgttK08vkfwTMHS
         EusfGf6feuvy7q7jML1OEEGcqX9fBqmjYk+z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150603; x=1703755403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZlHGzvCeyHzNr9SWDCy3oc9Vlh9aPeReD6PrS2OHo0=;
        b=xG9HYCEApwnPG46fhCHt243/HAkPLAdGfEa7M31FjA78cf0rsrBaDpbD7KWMd+L1Qh
         3KRh0HOmzGfyuoGcHZgMESqzaI7LPTFWUoqKRiYfB1bIfojlk+D4Zlm/B5M3B+SoWe39
         RZd+12lpB8tmKv4i3gKHTEHNbCZrYPN2JMMhhrShkv2i+WT783APv9LX1XEvY4xkfIYX
         YPpK0SHud3bF7fPOUS/wB/nl0OX/uSYN7udno+OZXzQjAKLDBFL5no5Qyy5vav8kx3Mz
         zBLDla/if/HxYMqaG0Xd1RUz7XPszm1jcbqKxjKOH9gQB2qOL3TZlunQP3bW5Ay25ySi
         z+Sw==
X-Gm-Message-State: AOJu0YxKiExRzz2wv6TNmPh5b8XCS9nTZ/eBqTIzlx2N9YeQl9dBEEQP
	MzBWdAQ/YpDS9YO5JPOOLaepcQ==
X-Google-Smtp-Source: AGHT+IEZGq7W1pkg/Rs+wEssdN9+RLN+vhyRsmtLnYaT0dUaoqH0eBHPkdGBNx3aVos33wTulXxRXQ==
X-Received: by 2002:a05:6a20:8c84:b0:18f:97c:5ba2 with SMTP id k4-20020a056a208c8400b0018f097c5ba2mr518290pzh.112.1703150603432;
        Thu, 21 Dec 2023 01:23:23 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:5d8a:fab1:933a:9ae9])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090add8600b00274b035246esm1001915pjv.1.2023.12.21.01.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:23:22 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/4] media: mediatek: vcodec: Drop unnecessary variable
Date: Thu, 21 Dec 2023 17:17:44 +0800
Message-ID: <20231221092226.1395427-2-fshao@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231221092226.1395427-1-fshao@chromium.org>
References: <20231221092226.1395427-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012324_835476_14D10C06 
X-CRM114-Status: GOOD (  12.11  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mtk_vcodec_mem_alloc() and mtk_vcodec_mem_free(), the value of
mem->size is not expected to change before and when using the DMA APIs
and debug print, so there's no point in keeping local copies of it.

Drop the local variable "size" in the mentioned functions, and update
printk format identifiers accordingly.

This makes the code slightly more visually consistent, and retrieve a
small amount of memory that is used for no real purpose.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
- revise commit message for clearer intention and rationale

 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index ea8c35c0e667..23bea2702c9a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -49,7 +49,6 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
-	unsigned long size = mem->size;
 	int id;
 
 	if (inst_type == MTK_INST_ENCODER) {
@@ -64,15 +63,15 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 		id = dec_ctx->id;
 	}
 
-	mem->va = dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GFP_KERNEL);
+	mem->va = dma_alloc_coherent(&plat_dev->dev, mem->size, &mem->dma_addr, GFP_KERNEL);
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_alloc size=%ld failed!",
-			     __func__, size);
+		mtk_v4l2_err(plat_dev, "%s dma_alloc size=0x%zx failed!",
+			     __func__, mem->size);
 		return -ENOMEM;
 	}
 
-	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%lx", id, mem->va,
-		       (unsigned long)mem->dma_addr, size);
+	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%zx", id, mem->va,
+		       (unsigned long)mem->dma_addr, mem->size);
 
 	return 0;
 }
@@ -82,7 +81,6 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
-	unsigned long size = mem->size;
 	int id;
 
 	if (inst_type == MTK_INST_ENCODER) {
@@ -98,15 +96,15 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	}
 
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_free size=%ld failed!",
-			     __func__, size);
+		mtk_v4l2_err(plat_dev, "%s dma_free size=0x%zx failed!",
+			     __func__, mem->size);
 		return;
 	}
 
-	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%lx", id, mem->va,
-		       (unsigned long)mem->dma_addr, size);
+	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%zx", id, mem->va,
+		       (unsigned long)mem->dma_addr, mem->size);
 
-	dma_free_coherent(&plat_dev->dev, size, mem->va, mem->dma_addr);
+	dma_free_coherent(&plat_dev->dev, mem->size, mem->va, mem->dma_addr);
 	mem->va = NULL;
 	mem->dma_addr = 0;
 	mem->size = 0;
-- 
2.43.0.472.g3155946c3a-goog


