Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88412C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7JC9bWCD/RfR1XN828PrxYVSUh5fZyBM1HCnR6urqd0=; b=Z6BXOHGBxReLXs
	cB9Trv4yUSlN6b7UoNEB+jq8HGqzCQ+6O7ZiCi2UoyoAPehwaU/QekcSjA/XZZy0SZQhMqrDBcWkP
	OvhQJA0UTmiWAERT6nGH/kCA4MRpg8FXQ87Hchiy51SwApHma6GjgOc7fd7aTFdPbDkVqh/1DxD9K
	giuFrewSMhat2RxE/91g5QqQ0jkqzRgNYss4zHFsV8d0BqoIFFvmExcHoDzgKv3UYPxtAVGzcnELd
	85eWZc9ChYVTvggl2BcjPSJAXt54mqrIX18pAgjUM5Wdz9A5UIueVshWGVQixoC7W7FXNVcgy82vo
	pFQFdrfIaApYE/UbRW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9qFd-0023IB-B4; Tue, 18 Jan 2022 15:18:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9q52-0020DU-7A; Tue, 18 Jan 2022 15:07:29 +0000
Received: from benjamin-XPS-13-9310.. (unknown
 [IPv6:2a01:e0a:120:3210:5aac:9ca0:e459:1f09])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 094531F43FCF;
 Tue, 18 Jan 2022 15:07:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642518445;
 bh=kcrKD5Lb4gNWfTjfNnB/gFNCNh+zasxQp0W3HPwbaz0=;
 h=From:To:Cc:Subject:Date:From;
 b=DGAF/BR7fGDn8mG6BppEiTu3g4eO7nd/N7901D40JmjlHXP8s2AU804QYHmPXOSkc
 JsTU06IBE5hKL0L9Eb8T02BULIzirVylDOGndQg/H6/ZUWVfQFZk9GLBd8w3H1+wot
 fFRP1xDFK1R5ehrgfPeBS+W837CnWvlsjvWt9S/c2ZMyuxYCiDFpOPcrVYQzln2Tk7
 LIb2oH15UTwNTbTK4kulQOQMAToRMqrfiePaxEhwhMcNZcM7HbjYkMHE/IvJahSa08
 Cl37Z6HWc6kvWvt07UiMnZY+5Z//dShe02vWHyUKYpzIM1ow1DiPHp01gBjC/HNRO9
 +i25L23fssfMg==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.co.uk
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: platform: mtk-vcodec: Do not force /dev/videoX node
 number
Date: Tue, 18 Jan 2022 16:07:17 +0100
Message-Id: <20220118150717.706074-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_070728_449417_64223E57 
X-CRM114-Status: GOOD (  13.44  )
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

Let's v4l2 framework use a free /dev/videoX node for decode and encoder.
For the decoder call video_register_device() before register the media
controller device so the mapping between ins correctly done.
Since the registering sequence has changed rework exiting errors case too.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 27 +++++++++----------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  2 +-
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 86b639d82be8..a4a3f9631d04 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -374,7 +374,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (IS_ERR((__force void *)dev->m2m_dev_dec)) {
 		mtk_v4l2_err("Failed to init mem2mem dec device");
 		ret = PTR_ERR((__force void *)dev->m2m_dev_dec);
-		goto err_dec_mem_init;
+		goto err_dec_alloc;
 	}
 
 	dev->decode_workqueue =
@@ -391,10 +391,16 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 					   &pdev->dev);
 		if (ret) {
 			mtk_v4l2_err("Main device of_platform_populate failed.");
-			goto err_event_workq;
+			goto err_reg_cont;
 		}
 	}
 
+	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		mtk_v4l2_err("Failed to register video device");
+		goto err_reg_cont;
+	}
+
 	if (dev->vdec_pdata->uses_stateless_api) {
 		dev->mdev_dec.dev = &pdev->dev;
 		strscpy(dev->mdev_dec.model, MTK_VCODEC_DEC_NAME,
@@ -408,7 +414,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 							 MEDIA_ENT_F_PROC_VIDEO_DECODER);
 		if (ret) {
 			mtk_v4l2_err("Failed to register media controller");
-			goto err_reg_cont;
+			goto err_dec_mem_init;
 		}
 
 		ret = media_device_register(&dev->mdev_dec);
@@ -419,30 +425,21 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 		mtk_v4l2_debug(0, "media registered as /dev/media%d", vfd_dec->minor);
 	}
-	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, 0);
-	if (ret) {
-		mtk_v4l2_err("Failed to register video device");
-		goto err_dec_reg;
-	}
 
 	mtk_v4l2_debug(0, "decoder registered as /dev/video%d", vfd_dec->minor);
 
 	return 0;
 
-err_dec_reg:
-	if (dev->vdec_pdata->uses_stateless_api)
-		media_device_unregister(&dev->mdev_dec);
 err_media_reg:
-	if (dev->vdec_pdata->uses_stateless_api)
-		v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
+	v4l2_m2m_unregister_media_controller(dev->m2m_dev_dec);
+err_dec_mem_init:
+	video_unregister_device(vfd_dec);
 err_reg_cont:
 	if (dev->vdec_pdata->uses_stateless_api)
 		media_device_cleanup(&dev->mdev_dec);
 	destroy_workqueue(dev->decode_workqueue);
 err_event_workq:
 	v4l2_m2m_release(dev->m2m_dev_dec);
-err_dec_mem_init:
-	video_unregister_device(vfd_dec);
 err_dec_alloc:
 	v4l2_device_unregister(&dev->v4l2_dev);
 err_core_workq:
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 507ad1ea2104..3975613b75b3 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -350,7 +350,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
 		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
 
-	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, 1);
+	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
 		goto err_enc_reg;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
