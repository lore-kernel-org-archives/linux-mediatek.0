Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99929C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 14:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5c/af9QCBFMiDlWNe3+XdyiaycfC7VtxgDVcRUis0Nw=; b=Fi/3SSbfPgyOB2
	acoD6CgONDBwXuWmkLrNEYzZx0Q2vkadMPwmpQlJ7FengGDDQo0c9I4wzjJ4xo09uI0Rw0MZUsstq
	IrNkL9D6qqheex6eH2tZsyHe7O3BJqmRSbHjlLoa/48ezvueSokwdGRAcPR5eFVeChBuSPTesKuq6
	iDhFN89uVa1wmSC4jFo9jrajKnIr0K13ec/ExmaoiUTzKQDCgiepnRqGhucxQEkU35gi6A0iCmIXy
	6HZxyVHkitOEj0MDU+v0es2eZB+4doyJ42zZX+dcdfUCJTZz1GTYxxKBveu7MAyCg9EUVAT5th4Rp
	EauYV5fzUGowZKM3Yyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgad-007JYA-Ez; Mon, 30 May 2022 14:41:51 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgJe-007BQw-68
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 14:24:20 +0000
Received: by mail-wr1-x432.google.com with SMTP id k16so10530298wrg.7
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUAWdJ1Rf6hO8ecNBUpnATX0ltMJMJR8PSAH4KO8bJM=;
        b=LXAGdGTLAayi/VD6RlJh8cDSac2FGSYcJt/uGESSMobfyQL1XbIq81Ywa+yllK/x2E
         sJAS1Rtf5zCjVFmHW4pfy9Tm5dcA5ZVlkEAgvw2NGpz9WZyyL1fOivsSvW9ytr3I57tI
         +6fjo5tQhXgr2qaexjNggNiuq6T69aTHW9odw2YHwZzw+W6m95HcY+q9sBmorz9c0xYk
         bA0W/CuhgZRg2uQS5Mkr9/Y/bZpmCfybLP6mrXZw7koQ3b+VufvplHhXB5NVUCdaMUoW
         TCkVYinu9AA7khJHktcQJTHSDsPEUzbWColgtl13bs4lm9K4PQIRKfICpI7XOPwBSQPj
         1kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rUAWdJ1Rf6hO8ecNBUpnATX0ltMJMJR8PSAH4KO8bJM=;
        b=uI/AqaQF0iEBtFwc6xVw3wI/VJhv0l+mAmw0SCprrexoUgMIxjpvFoIkbGSKLXerJc
         EYkf1bGNxUef1itU7l339m8D45utUn7PVFUdpyjqzphSmk74PeZMLEmABbpr5Q8Jjs6F
         Sr9aOoJa56FP0GXj7Ld2Jh4D3knnIsId547WSCfPOweLIdY94oUzm2y6lxqFPZGadLqY
         q8JWEOL+mexCBYhCk/et4I7lFa3ykyFCWKje/FweILZ94ai2eyJkdLJI75EUHozI0X6v
         7ZYKAdyi34+hLONd/kFKOjOziNB3VkORjloXhgKWnau2a8Bk1ZiTMQSG9225/lZldP5e
         I/Bw==
X-Gm-Message-State: AOAM531ZQOR/6lLUmPr9qd/FbhWWXOTtyGk9j0tBCqnPloPVcH8o3KSP
	019gspDDM1K32iRkdr7xEUr/dw==
X-Google-Smtp-Source: ABdhPJwUdn2UEohzLhlkvTp89uivSBFAQcrCfQrdg/myp0CdGWHmaAJLOG8f0NAC612sXpmZ9kB+sw==
X-Received: by 2002:a05:6000:1288:b0:210:154:ea50 with SMTP id f8-20020a056000128800b002100154ea50mr21132673wrx.213.1653920656629;
        Mon, 30 May 2022 07:24:16 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id y4-20020a056000168400b0020d10a249eesm9134310wrd.13.2022.05.30.07.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 07:24:15 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: fix crtc index computation
Date: Mon, 30 May 2022 16:24:07 +0200
Message-Id: <20220530142407.781187-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_072418_302084_6C4CDF3B 
X-CRM114-Status: GOOD (  13.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The code always assume that the main path is enabled, which is not
always the case. When the main path is not enabled, the CRTC index
of the ext path is incorrect which makes the secondary path
not usable. Fix the CRTC index calculation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 46 +++++++++++++++------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5d7504a72b11..6f2abfc608fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -430,25 +430,47 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
+static bool mtk_drm_comp_is_enabled(struct drm_device *drm,
+				    const enum mtk_ddp_comp_id *path,
+				    unsigned int path_len)
+{
+	struct mtk_drm_private *priv = drm->dev_private;
+
+	return path && path_len && !!priv->comp_node[path[path_len - 1]];
+}
+
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
-	unsigned int ret = 0;
+	unsigned int index = 0;
 
-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
+				     private->data->main_len,
 				     private->ddp_comp))
-		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
-		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
-		ret = BIT(2);
-	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+		return BIT(index);
+
+	if (mtk_drm_comp_is_enabled(drm, private->data->main_path,
+				    private->data->main_len))
+		index++;
 
-	return ret;
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
+				     private->data->ext_len,
+				     private->ddp_comp))
+		return BIT(index);
+
+	if (mtk_drm_comp_is_enabled(drm, private->data->ext_path,
+				    private->data->ext_len))
+		index++;
+
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
+					  private->data->third_len,
+					  private->ddp_comp))
+		return BIT(index);
+
+	DRM_INFO("Failed to find comp in ddp table\n");
+
+	return 0;
 }
 
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
