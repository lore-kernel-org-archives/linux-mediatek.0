Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D419EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4liXeyUcS4ig76FN7CJh65Npfs12ddAxtcolP6jBqM=; b=h0b6KJ0PYz0JUg
	rb0XlBh2MBIZUX6HXIrrI4jm/Qdu0DOIlef4bQczOOrAGgW1L45K4c14pwFOZjKBy8kJF8tIZrqRx
	Vi7QzCVh7UB/CirTc7LkRl+8IdQ6A7e4+cKuaFt5fXQZhe/HHJpG8ohNAqZdN0nDqV6FEt2R4mH+m
	vLm9LRm/PPShxCSo6qQmZixKt9ObIdU5QUB9fTYP6p3rGysAyUvKDLft9PARf1ofVjDnAyK3/heUY
	Y/4TiFRISIshpwWkFpTMxlG5l/zDcG2t5cfcxlUVipAJLG4/E1fknfn0eBADUUGtYKAKAPoBg9giv
	b1BmLzC2tOoCUvT6AptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6NG-003lTW-KH; Mon, 23 May 2022 11:37:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5el-003Pxn-Kx
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 10:51:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id k30so20742271wrd.5
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWgqk9KhFkOffkb3OEMTrNnAfqhM77Ox4JDvfW/o1S8=;
 b=JdEhccv00JjYKHfLCeZR4SBq3r1mpyIzHgvk2jWMBa66ocy5zkNG+dqpG02U2B2q2h
 Tjkw4VDmRWqGKrSi9mU5AagmMOybaI/eIkEkeE09PZHVg979ODz5Jjp/v5dI4f/3hJWU
 WRMWTbgCLTkeVezqAa360Eus1As226/OURVlVyn+52XT6QfeGjrUuZUi9MDK33Pq6nqB
 ZVBc96O81UYVu/wJS9JCyqra8bVi6dWW651erb9THLCb/zMJycaLyCMJcvj3W3MBdExS
 zi8hR5nIJAmtFB9zOxjMsTc3HlNcX6vTR6r79xtjeziCBr6IltidQMFpXz0YxO3cNNuv
 SPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWgqk9KhFkOffkb3OEMTrNnAfqhM77Ox4JDvfW/o1S8=;
 b=QS84kXGXgpoYrZueyEdnSAatqvp1iBmjr0jWxPXExGaY/scdRD7JA9j3ZQ3hGUCRc5
 shInqS21vn8ii/2OmAZoFUt4bzJigCiGynvtlmdswS650xf0GLW6HMMcsYmBDRmzAphc
 DCzeZVCHptwr/f4f55kViVz3VQN9QwCs8jw689PMvpPOkvWb+E5Jv7LzPaJx5w+dRcdl
 qBVItZfC1TuKVu7vibjMWuwdez5A7B/T3dYuL5dcnZMrOd4WEIMU5hHN3hUKU5t9bDMW
 uJ365ukWNx07ngEOfrcjryNgQ+iaXzITEwlSKKGjSuEkODB7yqDh7AoDjLEFpzJg76L9
 HUdQ==
X-Gm-Message-State: AOAM533PXXVlKAaQ+wgDa7J1dH2TGAI30L0BMtnY+8MYiQnrlceOaSRJ
 wDom8TZT3uxGEuO1eda6UPGx4w==
X-Google-Smtp-Source: ABdhPJw2E7On4Oju2hfmLb0SDCcJA1GzQfEtMNUlIfdbD/oZpt27PE8H5IfsS//agrMc544Csh+BrA==
X-Received: by 2002:a5d:4207:0:b0:20e:63c3:e398 with SMTP id
 n7-20020a5d4207000000b0020e63c3e398mr18892329wrq.642.1653303083160; 
 Mon, 23 May 2022 03:51:23 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-9d1b-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6141:9d1b:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a7bc5cb000000b003942a244f38sm8453607wmk.17.2022.05.23.03.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 03:51:22 -0700 (PDT)
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
Subject: [PATCH v10 12/21] drm/mediatek: dpi: move the yuv422_en_bit to SoC
 config
Date: Mon, 23 May 2022 12:47:45 +0200
Message-Id: <20220523104758.29531-13-granquet@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_035123_764961_171CCA09 
X-CRM114-Status: GOOD (  12.31  )
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

Add flexibility by moving the yuv422 en bit to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6d4d8c6ec47d..40254cd9d168 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -132,6 +132,7 @@ struct mtk_dpi_conf {
 	/* HSIZE and VSIZE mask (no shift) */
 	u32 hvsize_mask;
 	u32 channel_swap_shift;
+	u32 yuv422_en_bit;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -356,7 +357,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
 {
-	mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
+	mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->yuv422_en_bit : 0,
+		     dpi->conf->yuv422_en_bit);
 }
 
 static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
@@ -824,6 +826,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -839,6 +842,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +857,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -867,6 +872,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
 	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
