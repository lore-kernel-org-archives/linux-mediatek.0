Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBB2C433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 05:48:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E9120758
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 05:48:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bp3wh/2L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="htj3lRqk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E9120758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MeduZhXcPWfB8NkIK3YzMtpZqoDOj3w/3V8WIewnQ/Q=; b=Bp3wh/2Lw6SvJ6aEuRL7WQtb80
	/PFo2T5LPVA6XULZfPUg0MP1sYrrQYkJZwta4eWyu0fs0MyYyamAEGyEgCGO1iOjYrkKe54/MlcfM
	vEo+bVguWjRkhgIlXKD7uZVBs30Xv/5UFaZS7wHYQxjyJ0KaiTujEI9bS0l7c9UIQ8EZKoLVpWd9m
	fY0RCmnwZom1rfRwH1yubOJ4GIbkGXY+/PzECf8JYAJxRakkiKO3NEmbrlbxZuyyrt0WZ3M0NxfRH
	gOU3im2u2YXi1vsH1FHELS+giBpfgN4tnGW75W1AREdgNIuBKxA80OR70XPNVgsOHmycJrKeDCsYF
	eyI1XtIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDi78-0002GO-8u; Thu, 03 Sep 2020 05:48:50 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDi75-0002FB-7X
 for linux-mediatek@lists.infradead.org; Thu, 03 Sep 2020 05:48:48 +0000
Received: by mail-pg1-x541.google.com with SMTP id d19so1194356pgl.10
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 22:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uxOUTu3Fn6s5agkJSuaeoytoVx0NNmaxRXLXydxOq+w=;
 b=htj3lRqkIgsh4c7IEbd0OmII1g4rHRRPYOwizSELlMizgLq1bPkB8rImlcFCoZKJVE
 03NUrgzKBL4KZEocOdzwfK5zpgqAqBsBI2zDsMWwNcYGgiybhcIlQur0qV0U6/0z5Tc9
 PJyJN3Ae9HfFWMc+5cOBsivktgGMh/wYlw2Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uxOUTu3Fn6s5agkJSuaeoytoVx0NNmaxRXLXydxOq+w=;
 b=opOcUSNOwWFQPXPA/iBUlLlr2mMq7z/R1TnDtPzTTzouKa7LZOq6opG5gxNrT1h5R5
 t2mW8TqOZnat+/UcP628fBOxp9VFGguDH2hfiWOxLQPivuMVNv/yXYQDtRGUHx0iO/gd
 Cd2trkbQneR/oGbBW0jFjQ6hUKWwFM0n4yb4bvank71CKlQ75EcusCPi4UvqnRPEwkIc
 JBXPjejSa83yPEsYI5nMWXzEwVGfdGuQ622n+6SUnlnKlYYGIY65FZiuPGD/clzxXX4t
 jKzz9cBuyMelSVkxac3Wk362Q9+t8KYkB/919Z0Nls7uuvzHdg9l9vzeSrcp5y8U1srd
 4KvQ==
X-Gm-Message-State: AOAM531EqL3kVEy0nJpoTF17FsN9DawoE6Ph9pgESxHeQ8sMzsXzciU5
 1Ai4MZnDfAOtjNwdKWunnJF5jw==
X-Google-Smtp-Source: ABdhPJxnvTUo3AQzDD/vyNULzOUhHkXHWGLFFwWLxxcbIpy/btsmC/T3RiZIgNFj//B5dc6sqis6/A==
X-Received: by 2002:a63:1052:: with SMTP id 18mr1525513pgq.311.1599112124849; 
 Wed, 02 Sep 2020 22:48:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id r2sm1099218pga.94.2020.09.02.22.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 22:48:44 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-media@vger.kernel.org
Subject: [PATCH] media: mtk-vcodec: remove allocated dma_parms
Date: Thu,  3 Sep 2020 13:48:33 +0800
Message-Id: <20200903054832.3743698-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_014847_292099_93EBBE59 
X-CRM114-Status: GOOD (  11.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

9495b7e92f71 ("driver core: platform: Initialize dma_parms for platform
devices") included dma_parms in platform_device. There's no need to
allocate again.

Fixes: 13483fc2f20f0e2db7ba9c39b095ac7ea46f8de8 ("media: mtk-vcodec: set dma max segment size")
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 9 +--------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 9 +--------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 3bbd0bac56d69..76ee0cb5a7094 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -242,14 +242,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_err("[VPU] vpu device in not ready");
 		return -EPROBE_DEFER;
 	}
-	if (!pdev->dev.dma_parms) {
-		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
-						sizeof(*pdev->dev.dma_parms),
-						GFP_KERNEL);
-		if (!pdev->dev.dma_parms)
-			return -ENOMEM;
-	}
-	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
 	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_dec_reset_handler,
 			dev, VPU_RST_DEC);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index ff4a87485d690..c18e58c71d4a4 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -249,14 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		mtk_v4l2_err("[VPU] vpu device in not ready");
 		return -EPROBE_DEFER;
 	}
-	if (!pdev->dev.dma_parms) {
-		pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
-						sizeof(*pdev->dev.dma_parms),
-						GFP_KERNEL);
-		if (!pdev->dev.dma_parms)
-			return -ENOMEM;
-	}
-	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
 
 	vpu_wdt_reg_handler(dev->vpu_plat_dev, mtk_vcodec_enc_reset_handler,
 				dev, VPU_RST_ENC);
-- 
2.28.0.402.g5ffc5be6b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
