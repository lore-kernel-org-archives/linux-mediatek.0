Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477BAC38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=; b=AIUzsCeOfPSSaA6Lmf1upbZIcW
	S6G0xPCcu84fK4eV5EIeOgmtaWV3lrJF6WqNP6ANE14MOZkpa88sAribX4BN43JK/ZkXhuXFyeKXQ
	bNHy3FYvksh9Sd73Sv0az35BNzvXLU9QXMiJbFLUuo8eBconAs78bUJB2yVNfcyWhi8NTyT6r94MM
	3kt5JPiPbjaT3HfXe3Sb2aJRyORSvxUBFFeYL9GyIqsufXHEHE3cvxWjoTJzCjuu99GIgDcHknmRU
	2bGVIgYbAj6Nt0SPbe8BS9Nxj0Uy4kjO/NpRS6hjx1YWFOxLzkVTh5UEAunAPh3BM5onesvthDEgV
	89xNniaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGVG-00Cwr2-N9; Wed, 01 Feb 2023 17:02:34 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNGVD-00CwlW-BW
	for linux-mediatek@lists.infradead.org; Wed, 01 Feb 2023 17:02:32 +0000
Received: by mail-qt1-x835.google.com with SMTP id g7so1777703qto.11
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Feb 2023 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
        b=nT67bw8rr56CM1gJrp7X+DVshgnEKa/ljhXldr+SD384iSPkj35RP2X96fvOeQnsgm
         T14b9hW8ntxRYCEpR8GsxRX+9r/UCUhnVOF2MAuPq1dJ/DyHInDPNZJk18PxtOhMd24s
         2r9N9Mx3zTN478qLt3UhkKbfNoV6h8c1mPRHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rd0pXPWFNXejSLhEyKT2rFb5IqInkH4mtznmiVegFkA=;
        b=wLjoMncqdSdAQt+t7dP2RDmzS2YQjkYEdB9gxwR4vUq0frIH1BSMNDige3qNcSQk09
         skSyluc9PT6cc1gKmJvI2r32TwulngAaLSbHpqE3hnqLqu3t07gO/tnobfm7lddvbQ5u
         h3iQpRTzIX5R4OUA5Seew2v6ssFqW3Qt77r0oF2IkezE9X+wqKEKNwaJZRgDXcSP32ix
         R1MzHbze93RiRSjO7pSCZ9sODkq0UeCqhKgT5mgcrTw6uaLuo/opwLKdzgQKFz/sagJp
         G+/kwDEWtCBSYXMFBemThcpHMPxOkNppKHwH1s2cB3zWzTDOKb7opDGYOexbweoEv0up
         8fBA==
X-Gm-Message-State: AO0yUKWUbHpviELHjOeodmpP0Sjc8lPq2kM2vCju5G/gsFvCz2vYm0Gu
	Lb2xddQ0CqH/KXe6Ew+DV3KKuIq4ASb3M6h5
X-Google-Smtp-Source: AK7set+eO7ODvJ08hC6MTpYiPVvqg1nPK4IXKW7BUiehW11cQYcoERJgOYb16hSR0vDxX1XFqa0lEg==
X-Received: by 2002:ac8:7fc3:0:b0:3b0:98c3:217c with SMTP id b3-20020ac87fc3000000b003b098c3217cmr6229659qtk.6.1675270946173;
        Wed, 01 Feb 2023 09:02:26 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:9334:99d8:1f91:70a])
        by smtp.gmail.com with ESMTPSA id z15-20020ac8430f000000b003b646a99aa6sm5549543qtm.77.2023.02.01.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 09:02:25 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	Justin Green <greenjustin@chromium.org>
Subject: [PATCH 3/3] drm/mediatek: Enable AR30 and BA30 overlays on MT8195
Date: Wed,  1 Feb 2023 12:02:10 -0500
Message-Id: <20230201170210.1253505-4-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230201170210.1253505-1-greenjustin@chromium.org>
References: <20230201170210.1253505-1-greenjustin@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_090231_419822_7853BAF7 
X-CRM114-Status: GOOD (  10.55  )
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

Tested using "modetest -P" on an MT8195 device.

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


