Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2464C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgVTR0Ck/QcqPZwMJF7LT1yeQxQdlTxh2bKYfbrBHSI=; b=ECn6rBlD0XXeEj
	cGJokVSVmlC4N5RYbdBMsgnw2Fu24z0bMViHTtcKu06YK5vJhcCIfXeJ4D1YBE353e4BCuk5k10vd
	paf4RX/7a8vxBU6aCEl4ptMNa8RvKQ+K05H9asvslwIBrGhgrciskUxN4o68QEbsCa2RzXhAeVqqg
	+wEE2G/hOPfm/JjI7aRCNshJVsQCBsqdJqKd9NGmxxzv3oqDLF2FaPYvjJ08mYWeecr+H2qKGQjOM
	h67RzrNBju3H3k82JNQUoLAlHT1ES++d/rH2n7IewOpI0Nx1N808DmcV/wz9slUuGNEcGe/GX6N+6
	LP6wGhv25+8gGOi9ivPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6O3-003lpS-2H; Mon, 23 May 2022 11:38:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5es-003Pu5-E6
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:51:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id s28so20622673wrb.7
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JGvhVV4JqPNXk+p5F/0CMZDfiaz8h8RwYuVglR+Hdfg=;
 b=SSKJwV3dhXlND8s9/ZiSdxc7iQkclv7sEeQvp7zakKPDyj/A5NxLyj/8NxDKainYsZ
 66XRu7ieISGUu3vhVKtVxx2psktGaF7/gSBqnOdTK2U8Jil0Jl/KKe4qfsA4kW4tZF1m
 r5otL/wEBNRALQlcdG0qNzyuVqJK0l2zU8WbjDqxutAObwUA7Qn3DryKlBsEox8FuH5X
 t8kqrsI2tDL7+xTsF+ifFgq/UkscxL6yNBR/R/h7PdHdKrZk9p0geJs2s76EVFYKRTxt
 ISr80sfHjfhqug2M/MI+VRXzC2M9PBoiVntGVHxAhJXAcDUgzs0+Rh9ku8IA7bpwU3lP
 WbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JGvhVV4JqPNXk+p5F/0CMZDfiaz8h8RwYuVglR+Hdfg=;
 b=u5T4ueVfPLBbsBfANGC0ZOUHz95FQFuVgIxJJ+yeETodVmYu5/G4CXSCw9CUS2ytki
 NTIhB33dlYPl+ctllpsP1YwS2lR7wxyQeoeiaPu9kX+9dDr2AAPjQbclKGWY8PwDJcUb
 t5GOpXD4HIQ/5hof2ZLReSxQELb7LkwVqq5mVf0SAlYBRH/Ugo82c1RRVjzyYMLF+JNt
 jBGTl2dn4fkQjxPz5Tx+WEGfQlaovqqBObNmHW6IVE3t7DAMY427VofGcXoWfbcKsGa2
 VAe4Gd21cMOqcu9cmbeo3EFG3fNH7d2c4czTEHarqwaytTMIW+QICx7ovQenGD7kIWA3
 mDbA==
X-Gm-Message-State: AOAM530hgkq/DSp7+Q3K6HnSQXDt3jnfulHwuXrempJFgVmcBBBD+43S
 cFHFzsLUlJChkK8QSQ6c37kmAQ==
X-Google-Smtp-Source: ABdhPJzI1cZH2vxHZeGJbkrpsiAZ+QGY1J5LlXZuKh30WZu+XMTP0w16zzNcwHcU73Y9iru6sVfBIw==
X-Received: by 2002:a5d:674b:0:b0:20e:6164:d86f with SMTP id
 l11-20020a5d674b000000b0020e6164d86fmr18179608wrw.297.1653303089880; 
 Mon, 23 May 2022 03:51:29 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:29 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v10 13/21] drm/mediatek: dpi: move the csc_enable bit to SoC
 config
Date: Mon, 23 May 2022 12:47:46 +0200
Message-Id: <20220523104758.29531-14-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035130_569252_00BA66D9 
X-CRM114-Status: GOOD (  12.29  )
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

Add flexibility by moving the csc_enable bit to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 40254cd9d168..eb969c5c5c2e 100644
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
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
