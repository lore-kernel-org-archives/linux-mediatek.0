Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E6FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DA3vrhjtHczEnyT2vUfzyuZkQIQYPfca5IqlMdK//sY=; b=Dc1Eo//ASUdmgv
	nC9Jrd0YxHEdLiaArOwY/S0Y2H7kzIQP9AND8kyMywworzfA0elUrn3voiwwlgPDGKPhdFcd8N0ZF
	z5nWPbJJLDt0baB3IjfkbcSnZg43jTisTAHaOw176jAV9iq0HnCB+wA8bQqS7QI7ETSGu1y3DJ/Wa
	LYFpiFUteFXi/G28SNfvfq5GWkLSQFvqa/BzfriaP/xFf2hh1IZoW/AEwLa8ENqAH8mXuGn8je3K8
	E9Yej5XBkoKwH0AO3V22EC/Qeje8PxGT1PAxELqnpAevENPOWpY7h/kXu0bjGDDsQU9ABasIKFsyX
	E475bBdNAaJZ5/cKoY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W77-00Dxxb-0q;
	Mon, 13 Nov 2023 12:32:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W74-00Dxu1-0x
	for linux-mediatek@bombadil.infradead.org;
	Mon, 13 Nov 2023 12:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DA3vrhjtHczEnyT2vUfzyuZkQIQYPfca5IqlMdK//sY=; b=LFKZvrBsqKHqzHHQOy4oOkPkn7
	OaOhw4jxINz8NgVMQyvPhDxPGdcp6zVO74UWanjflLgipFrLg/v6MDH0jtgxOJt8Aq4ia4dzgY9bX
	GmxBTf0fgLVe3QWWbYWY2CNCf8/XrtApMVpuk51/+tUDaxi/64FH4Hdmfly0eQoiVqzgATvQ3sNBJ
	/Fxo+7XQj/A+9Ht38Lj9rp3FM2HPJ57NDQ946BCqu7uyCxQ5nCkSgiXGAMgf7JjZsoI/oGPB6siDu
	GUjxz81m9ON2Sz6TLi3hBAghjbF3hjjzDdYA+xpoP0Mp533XuBbstzwThvCq9KvFv3qgdOnLuSgST
	gX0Q37yg==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W6x-001VQo-25
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 12:32:20 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc2fc281cdso31068265ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Nov 2023 04:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878728; x=1700483528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DA3vrhjtHczEnyT2vUfzyuZkQIQYPfca5IqlMdK//sY=;
        b=cYLxqQ+9qfiLb6RUEZuIfmXLZixdk4gf+xlSOuui+3vaj9nTbV3e0kkPNogcNwnZGG
         24tMgtUn2s0oSU/j8feaPH1uJOcEZf5eykJlMpR0Qd2XNZ2RnUo2r5rpJw9LU28mz8WW
         IFWCa5SGdyRcnkFbZEJ1Yh2VgSkq/wr6mP+8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878728; x=1700483528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DA3vrhjtHczEnyT2vUfzyuZkQIQYPfca5IqlMdK//sY=;
        b=jHJYCvUZmWVWL/DYrcNEp1HbYkBZaSd7FgJOWxQcYcWom27nHaxKdmU6JexUO4OQmz
         GeqIUcYb7ZM7P3wKjg+CwJrYTWjfsJdFSpBOU62rjB6LtYyDjEr9lcnhpCxHCSyCiSis
         M8FI+rFRj7ggRaTKaMinVvIOQMEpRYvfEHIY0+MO2Q6+hDI+MD30y4gIO+OHZ7+lVg3P
         QLK7fedITzH4taHOHtf29kIoTEBxnw+ISVZs4IjiQ1Ryi5rINmMV57TnWiGeGFWOilVY
         B6dmOLEtDngWEhr9WtqYfTLygVXaPp163nrRJL0CN/w+v9gWTC9NnCX6XdQSa+f5N2GR
         kS2A==
X-Gm-Message-State: AOJu0Ywqqn6iDgrTBe35rzvjEBq9L1VK+2gE7fnBWTiBJQ8GTgdDgIxx
	kro9VIj0Wq53QactjjS/moerpA==
X-Google-Smtp-Source: AGHT+IEr5rZTDntYdnCbJXhkwHgXRSGpCEuLpk6rdQ6ZqC29tJK66Fgqa1UZM40bjEsYv6dxLGnGbg==
X-Received: by 2002:a17:903:1249:b0:1cc:5378:6a40 with SMTP id u9-20020a170903124900b001cc53786a40mr4502566plh.23.1699878728461;
        Mon, 13 Nov 2023 04:32:08 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:08 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/4] media: mediatek: vcodec: Drop unnecessary variable
Date: Mon, 13 Nov 2023 20:26:50 +0800
Message-ID: <20231113123049.4117280-3-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231113123049.4117280-1-fshao@chromium.org>
References: <20231113123049.4117280-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_123215_878144_75A3137B 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It's unclear why only mem->size has local copies without particular
usage in mtk_vcodec_mem_alloc() and mtk_vcodec_mem_free(), and they
seem removable.

Drop them to make the code visually consistent, and update printk format
identifier accordingly.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

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
2.42.0.869.gea05f2083d-goog


