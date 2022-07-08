Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93B0CCA480
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 10:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLbLav8l8KNdtyThB58u5SXfgbP0TLoaQoo90nnZjIw=; b=vUaj4Mny6fcoM2qNWrumR42Kuv
	sUxuShGClN0fhbFzxiUM1icvD/O0Vo3yO3QMb+o1NFNC4t2GusHYjfeGYoL3IU0AJK8uotJbxyMnL
	AME+YvYZy9oji9L9P+qglX5Z5Gg+CqozT5JPjRKlOzAyRdxFzVs5gi1Edis9yc6q+pK29RIFEveuM
	3gLOKysBbFCBanjs679f2ySTLmc8YaBUgO5XNqGpwXIiDzJlfgcbScIg1liVFL2clwFzl+pXOmd4O
	YsQlB9706f5kPaGtLabOH+f7uT0II9Iz/Skf0aCDRTd1ZDDtV0LtDLZj6ugm2aQDQex5d8dwOMStH
	69V2/Szw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lUE-003FCY-BK; Fri, 08 Jul 2022 10:45:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9lUB-003F9E-Qy
	for linux-mediatek@lists.infradead.org; Fri, 08 Jul 2022 10:45:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id b2so16027955plx.7
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Jul 2022 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WLbLav8l8KNdtyThB58u5SXfgbP0TLoaQoo90nnZjIw=;
        b=H6/aHv6DkkKB7cF5JsVlhpayBbZOXG0Cvl2/XYn64znFK/MtS4mC8I+s8YOK2HZeNh
         vMd9G+Wj5czYkhTnCdL+qqshd9r7aQ8bymOl+Fnj+kQlPGsJf44BDjJ6c7KKXX0NhIVe
         TevhgQUDyNHbPllQFobkTv9YW3fA2KaAxYBsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WLbLav8l8KNdtyThB58u5SXfgbP0TLoaQoo90nnZjIw=;
        b=hCPKC7wfwDTJgKbenB79uVPINlvPwIf2dpL4CLDmI3/N5fAHhGKqGQfHuzjdv7d2+b
         M4wUTGw/WYsddNu0o53v+lo3MEAi6lRGz0rjEknkLnN8WRhRhaBOAgBjKjZEgQF/ArLD
         NuzG0nerUeEg9NJKo2fciVuyiwOIbfAOv2q7GFTkhL/VgamVtyCeewXZn+ESPhCiT2SJ
         0fXXI/CXqrcoTv4bF2ctQosN+YBis0HRkiLqWuRy2IrPFAwdiiuxdQbon3CZ88eH8E9z
         QAIpemxLmgJ56sE3s0Jym1oZJ5o7fTBwwfCbBg604l/iAWwySKGdLq7Qr89fB5Cz6OKP
         Q4uQ==
X-Gm-Message-State: AJIora/CoD4QvhUcbm4aF6DYXdmyn7c6Tvg/V59Qftq53RZcop73TYNs
	51Wh2hW2PyHaqGIKYvIrXump+A==
X-Google-Smtp-Source: AGRyM1t7zh3BjpjgCpMwcYmLHbsBzl4/5XcKIXOUoFXqM0owdePl7ODco0/D1d+2ouSx2TTV0ocSHw==
X-Received: by 2002:a17:902:a589:b0:16b:c227:d7f9 with SMTP id az9-20020a170902a58900b0016bc227d7f9mr2892816plb.29.1657277120859;
        Fri, 08 Jul 2022 03:45:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:db98:ad5d:ca9:da58])
        by smtp.gmail.com with ESMTPSA id m6-20020a635806000000b0040c9213a414sm27216187pgb.46.2022.07.08.03.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 03:45:20 -0700 (PDT)
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
Subject: [PATCH v2 1/2] media: mediatek: vcodec: Make decoder capability fields fit requirements
Date: Fri,  8 Jul 2022 18:44:50 +0800
Message-Id: <20220708104451.3901064-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220708104451.3901064-1-wenst@chromium.org>
References: <20220708104451.3901064-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_034523_896415_C3CADDBC 
X-CRM114-Status: GOOD (  17.24  )
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

This partially reverts commit a8a7a278c56ad3b4ddd4db9a960e0537d032b0b3,
and changes things so that the capability string fields of the decoder
conform to their requirements.

This recent change caused ChromeOS's decoder to no longer function. This
is due to ChromeOS using the driver name field to match the video device
with its accompanying media device. After the change, they no longer
matched.

The driver name field should contain the actual driver name, not some
otherwise unused string macro from the driver. To make this clear,
copy the name from the driver's name field.

The card name for the video decoder previously held a static platform
name that was fixed to match MT8173. This obviously doesn't make sense
for newer chips. Since commit a8a7a278c56a ("media: mediatek: vcodec:
Change decoder v4l2 capability value"), this field was changed to hold
the driver's name, or "mtk-vcodec-dec". This doesn't make much sense
either, since this still doesn't reflect what chip this is.

Instead, fill in the card name with "MTxxxx video decoder" with the
proper chip number.

Since commit f2d8b6917f3b ("media: v4l: ioctl: Set bus_info in
v4l_querycap()"), the V4L2 core provides a default value for the
bus_info field for platform and PCI devices. This value will match
the default value for media devices added by commit cef699749f37
("media: mc: Set bus_info in media_device_init()"). These defaults
are stable and device-specific.

Drop the custom capability bus_info from the mtk-vcodec decoder
driver, and use the defaults. This also fixes the long standing
issue where the media device used for the stateless decoder didn't
have its bus_info set, and would never match its accompanying video
device.

Fixes: a8a7a278c56a ("media: mediatek: vcodec: Change decoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 5d6fdf18c3a6..209de1ec02e4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -243,11 +243,12 @@ static int mtk_vcodec_dec_get_chip_name(void *priv)
 static int vidioc_vdec_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct device *dev = &ctx->dev->plat_dev->dev;
 	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
 
-	strscpy(cap->driver, MTK_VCODEC_DRV_NAME, sizeof(cap->driver));
-	strscpy(cap->card, MTK_VCODEC_DEC_NAME, sizeof(cap->card));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
+	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", platform_name);
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog


