Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32507C74A4B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQruPEvUWXea5iv6fg4nOA01GAuR/ZB8cLPDfAhHg6M=; b=G4qK6N2YrmXJuAYHELTUlbvLOk
	6DsKT3Vcg7XlW4XJk03L+e2grCzY0OyDXZXaO8tXkpKGqBvvS7P+Av3/keicc8LkFLSXL7RBK8dgI
	FUm4i/HLoamuB1Ta9Wtmvjg36Q5XhtwCP/enrHE1CnBnG192bo95IWOrZk4LULk5pTDqRNBykV6MO
	ClR95ALUmA0ABAtH7QPW5Q9pwiS/mHja0/U8ZUvaQKD29kfHi3xYf0abO/+zhqKFoQBneFp2RtSO5
	9XZM7qJ+q4oUAht09goS1PFq6IhVGmS2Xq1GhD5Y0ClDfbwt23jdmyAgZtmjihzO3iQbxXjaAd4xd
	dTWTk01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNSG-00BvOy-9D; Thu, 09 Mar 2023 21:05:40 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNSC-00BvMy-0F
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:05:37 +0000
Received: by mail-qt1-x832.google.com with SMTP id l13so3605983qtv.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678395934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQruPEvUWXea5iv6fg4nOA01GAuR/ZB8cLPDfAhHg6M=;
        b=Ps6exi3xpI87CzQUY4hXNPGVsjZaFoqg4HGL8a1MxAqCqKlL1H8+jHtFD2GpTj36e+
         rpmphds1pfv7T/WkSa8vwmH48RssfA7nSoRFejaypkRswaUN/+PtXflJ//zhRv3Zgp9t
         cqOaLThEboUnygyl80BCIcIaFtgsn3DGskeYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678395934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zQruPEvUWXea5iv6fg4nOA01GAuR/ZB8cLPDfAhHg6M=;
        b=GiMMk7xuMTjG8NnPXtnsJc5PJHpGg8j4gABIyd43JKb1ugScd2JdRzKYGg3l4pT3zn
         WliTUl+zdAtjOAJ05dnRXRAeOWkQJNidpMFYZZAQzgX4K6bvPeRxO8q9zWsksPaLvEQ/
         cM/YE0baDs6zr9eX40IsikmOlNpxrELxHcJ54Px5KDsNxPKSHfmEdqjr0ucPy8pyo2Xq
         bWPcShT5pR2bODLSCbzmYHJh2rXEbNWFa0vOO9nWt3APRgoQywMmc8XHVznzZBcblgyJ
         FyCfMHm8GxCQ5Q+6Aw9grR+kanMcVcwrR6lEX4krIhpsE4Ifp760Jqd2XpCkCzNiBr9J
         ddNA==
X-Gm-Message-State: AO0yUKXbH0BsPqMMu7pB6glPGYi+lje4z+vbLSv+fK4WUMJTRk0IAhm1
	rXwNUJySjdv48gkiOdOPKaLQFv4VB1nJVySB53FCBw==
X-Google-Smtp-Source: AK7set+TqWj6nJuKc1WVAKlRbKRPSQEHg026dY/owgOMx8qMZrSMaVkii4FshfhymFINPelDj02TzQ==
X-Received: by 2002:ac8:7f4a:0:b0:3bf:dae3:bde2 with SMTP id g10-20020ac87f4a000000b003bfdae3bde2mr41004683qtk.36.1678395933876;
        Thu, 09 Mar 2023 13:05:33 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:a575:2520:a8e1:989d])
        by smtp.gmail.com with ESMTPSA id 69-20020a370548000000b007426f115a4esm14302375qkf.129.2023.03.09.13.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:05:33 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	greenjustin@chromium.org
Subject: [PATCH v8 3/3] drm/mediatek: Enable AR30 and BA30 overlays on MT8195
Date: Thu,  9 Mar 2023 16:04:16 -0500
Message-Id: <20230309210416.1167020-4-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230309210416.1167020-1-greenjustin@chromium.org>
References: <20230309210416.1167020-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_130536_111034_F0696868 
X-CRM114-Status: GOOD (  12.01  )
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

Modify the overlay driver data for MT8195 to enable bit depth control and
enable support for AR30 and BA30 framebuffer formats. This patch in
combination with the previous two patches in the series will allow MT8195
devices to scanout AR30 and BA30 framebuffers.

Tested using "modetest -P" on an MT8195 device. The test pattern displays
correctly for both AR30 and BA30 formats.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index a6255e847104..7d26f7055751 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -85,6 +85,22 @@ static const u32 mt8173_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRA1010102,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.formats = mt8173_formats,
-	.num_formats = ARRAY_SIZE(mt8173_formats),
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
-- 
2.39.1.456.gfc5497dd1b-goog


