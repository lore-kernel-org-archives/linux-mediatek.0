Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56443C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i1rQ3nsbXXEqMy9K9dgCOTqPuDlu+KloaPolNtLFHBo=; b=35bjQ0WUb/aOIU
	eKX/80qmZHXl3fPboIBs13j33UUPn96kCum+p3OqTeq26joIRMq4qx0YgUsY6ag+NG/fhyy+V6SVI
	3JFSsV1dMNBd31BhYDJ/g8GkA0xKJ0ACXCtCZ/MnG5T5O2751XN5uxtwxPrhfWtCpaBl9iXJAh0mX
	0B5Isw+NR/Iuz3P1WsRiPLJSPm/dqgisjg2AU+2LPXDrmQaDLtAG0WYxDD0f+Ujjbg1474CXLVcyH
	o3riKa7vGYG8Qfg6bKppJc0gDZctt/7smiYRkagV/iTdWsOAZN2rrGLWWjIB1E2DGkUeMPO0rOAZj
	jgcm1hzo0oLF4hF2HITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4xA-00F0vR-88; Fri, 18 Feb 2022 15:13:48 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4gL-00EsIg-U3
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:35 +0000
Received: by mail-wr1-f43.google.com with SMTP id d27so15050141wrb.5
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4n+TZK7KbEUWOxLwDOr/TfxysKvgpkHmktiIGYd/K7I=;
 b=AYIJhoYSI/uBVyX7bKr0EN1LMOI9DxVA+XSltqNaOrt2mARRYDaY5J64JbYiCTP7IZ
 VKDnRnXSySg9ti8q2Gdd3ZT0Wyy7ynM+UAAvTdKD8U0Tlw/rdFU0Ax+Bl31KHyQvR6J+
 ApEGo756/YXVILQcaJjKh6mpjgrnE6hH2BcxMa0PSZfAbZ1ii4qMye2ff32XGm+aMqWW
 I4JiP+ajubHk33IS1IZ3S8JjYTWhjCMn2KKcc8E9C8JUJwyz2G0tABN5GfQXUKJTkUEx
 lSLU6qH/VrjTJXGL8HJZcnUdu8gPP2xdjRyeQv76DPON8zKmYDxfu3kR4iYgimxYtDmD
 9uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4n+TZK7KbEUWOxLwDOr/TfxysKvgpkHmktiIGYd/K7I=;
 b=q9QTXGX9Ge7XZwTYs5S5ZuAXYVOGgdNbgj4Sbm4J7nep8E3IdBxXQBHHGtr5frRo9J
 1KCr6w6R9+CiptU4YhhOED81rW/tm+B9k+/qvT7H1q0M4//EO2eFhtKkKJye8E23TZ0R
 zJObT5kO2Sdys1xhVyTyMdrJ/Q93XiXKJ4BSCSVC5ckJo7S4IdDawtmxC8nltocK5BF2
 luMUgFBIAXr6mSf/JuxV7NyUAedvmz9w39xm6k74IqPLCgp3hnJUbcB2qWZjX2i/xcLu
 5/rgxrp/HHjVZBbahL8ISPgDlzOBk1tsV6H7A3CwHN6Z6rxcCFPo6nXaFNmrOs7JUOy6
 yAuw==
X-Gm-Message-State: AOAM5301mVwspkk9QJ20aQt4g8TvGPb7OYy3YgltGVoxyhLpgt68EZBv
 6xExT9lvQyKXpIJKTd3eFQIWyg==
X-Google-Smtp-Source: ABdhPJxA3E5twbEB2QJP6JHl07PRCaBz7TlkWHIbHPK96lIV8OG5te3hJNfKAZY7HiAKl5ltEPTi9Q==
X-Received: by 2002:a05:6000:1a8c:b0:1e8:88ae:f908 with SMTP id
 f12-20020a0560001a8c00b001e888aef908mr6354423wry.532.1645196183454; 
 Fri, 18 Feb 2022 06:56:23 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:23 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
Subject: [PATCH v8 12/19] drm/mediatek: dpi: move the csc_enable bit to board
 config
Date: Fri, 18 Feb 2022 15:54:30 +0100
Message-Id: <20220218145437.18563-13-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065626_032199_0C5F5619 
X-CRM114-Status: GOOD (  10.91  )
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

Add flexibility by moving the csc_enable bit to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index fcf88dcd8b89d..be99399faf1bb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -133,6 +133,7 @@ struct mtk_dpi_conf {
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
 	u32 yuv422_en_bit;
+	u32 csc_enable_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -363,7 +364,8 @@ static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit : 0,
+		     dpi->conf->csc_enable_bit);
 }
 
 static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
@@ -827,6 +829,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -843,6 +846,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -858,6 +862,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -873,6 +878,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
