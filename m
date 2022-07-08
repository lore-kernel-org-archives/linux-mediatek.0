Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1A0CCA481
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YKU34GLEp41EDZn2kjkgQMLGLaO6pSs5EyA1lQO2E4=; b=mtyBr4ZkqolG1ToqAbSK1dotkN
	aZmqZRIbRNGjA4rta0k2GlxNXIamUabOlLNo8E/UJYSHvoN/IzCd2ZzdDw0YTShILLXWQ7ykBIUeT
	fyjaPTJcZxObqtCceca9Nf6opZAUmdRqRMH84ELkw4Uy2PjclAS4wpltjuIFYQb+yk99sgxUtvINM
	xP4HPPJxhWX4qheFqBM4OSWXq0ZyjIxyLC2q6ExjizV8SciEAJywUxXWET7fEUmXuHBZBizeH4vbI
	5VeYFy//9dgqiU283As/fdgi1yOYtn2Drxtm4ySf0xfFjCCRmQYyym78ZMWDiayPgEsEiE3aYMX/W
	WDVDUTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lUH-003FDy-3a; Fri, 08 Jul 2022 10:45:29 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lUE-003FAa-6j
	for linux-mediatek@lists.infradead.org; Fri, 08 Jul 2022 10:45:27 +0000
Received: by mail-pf1-x42e.google.com with SMTP id j3so10571745pfb.6
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Jul 2022 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9YKU34GLEp41EDZn2kjkgQMLGLaO6pSs5EyA1lQO2E4=;
        b=dqbnkEH5EoOPhrneF2bHotmJP/mn9F2++Fxt5LVJ29z+GMbvQWK6ebrdQzuHNmsHeV
         WIPR5StC33VoXXUqOaOlaeK0FtPaepWuD+0e9218tCVd8psm4CdKuUr5r1EyXwDPoc36
         m/XQg/0u3rcnxz1cTpUmqXV7llOPiA8ZGDIrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9YKU34GLEp41EDZn2kjkgQMLGLaO6pSs5EyA1lQO2E4=;
        b=bvy0YgdbXSS3gIMZc0yrpufHN47uD7C+u32yfA1bXwrkQwOYlO9OZxi/6HE2qOSrhq
         kS/Ykjf7nTQmu0QRa0g73hrw15YjyVzOFgtDf39NYTWd/M6wYIgeSQJgydnJgGMyRm2b
         cOuwByiIcZ7maot02tJaJ+jiuiPQ9GvQDSDLC0Y+5Ei9bRQ6Nbi9cBwhhjX/ir5trSIb
         68Ff0yNDudllKMJytEwr6We3Vr7DSAC1KyYNVCceUQTp3OjNiifiH1IwDHU5LybFob5d
         P33jcZE4B7eIFPqrtBE9cgbbvawG1nVkvm8xto0X3aLODzHJgi7GNdU9p7vhW98YF86m
         4QGg==
X-Gm-Message-State: AJIora96YzRyYLzYJ6W6yOQN2EtzHzA0ArXTPJLxarRJKAtHWW/dazEL
	woWU6MmGVyJ3Lv26KUb5YkSafg==
X-Google-Smtp-Source: AGRyM1v8Rsv6CDJhU/YyBCRySDcL9J8Fzw2nEIwQ5hE7WoNGbc8NMz0qBZ8qGhCMS99QTJ74qVZnAA==
X-Received: by 2002:a65:6048:0:b0:412:73c7:cca9 with SMTP id a8-20020a656048000000b0041273c7cca9mr2837658pgp.257.1657277123264;
        Fri, 08 Jul 2022 03:45:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:db98:ad5d:ca9:da58])
        by smtp.gmail.com with ESMTPSA id m6-20020a635806000000b0040c9213a414sm27216187pgb.46.2022.07.08.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 03:45:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 2/2] media: mediatek: vcodec: Make encoder capability fields fit requirements
Date: Fri,  8 Jul 2022 18:44:51 +0800
Message-Id: <20220708104451.3901064-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220708104451.3901064-1-wenst@chromium.org>
References: <20220708104451.3901064-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_034526_250978_897D61CE 
X-CRM114-Status: GOOD (  17.79  )
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

This partially reverts commit fd9f8050e355d7fd1e126cd207b06c96cde7f783,
and changes things so that the capability string fields of the encoder
conform to their requirements.

The driver name field should contain the actual driver name, not some
otherwise unused string macro from the driver. To make this clear,
copy the name from the driver's name field.

The card name for the video encoder previously held a static platform
name that was fixed to match MT8173. This obviously doesn't make sense
for newer chips. Since commit fd9f8050e355 ("media: mediatek: vcodec:
Change encoder v4l2 capability value"), this field was changed to hold
the driver's name, or "mtk-vcodec-dec". This doesn't make much sense
either, since this still doesn't reflect what chip this is.

Instead, fill in the card name with "MTxxxx video encoder" with the
proper chip number.

Since commit f2d8b6917f3b ("media: v4l: ioctl: Set bus_info in
v4l_querycap()"), the V4L2 core provides a default value for the
bus_info field for platform and PCI devices. This value will match
the default value for media devices added by commit cef699749f37
("media: mc: Set bus_info in media_device_init()"). These defaults
are stable and device-specific.

Drop the custom capability bus_info from the mtk-vcodec encoder
driver, and use the defaults.

As this patch removes the last usage of MTK_VCODEC_DRV_NAME, remove
the macro as well.

Fixes: fd9f8050e355 ("media: mediatek: vcodec: Change encoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 -
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 4140b4dd85bf..a8570a654561 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -19,7 +19,6 @@
 #include "mtk_vcodec_util.h"
 #include "vdec_msg_queue.h"
 
-#define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"
 #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
 #define MTK_VCODEC_ENC_NAME	"mtk-vcodec-enc"
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index ccc753074816..25e816863597 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -232,11 +232,12 @@ static int mtk_vcodec_enc_get_chip_name(void *priv)
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct device *dev = &ctx->dev->plat_dev->dev;
 	int platform_name = mtk_vcodec_enc_get_chip_name(priv);
 
-	strscpy(cap->driver, MTK_VCODEC_DRV_NAME, sizeof(cap->driver));
-	strscpy(cap->card, MTK_VCODEC_ENC_NAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-enc", platform_name);
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
+	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog


