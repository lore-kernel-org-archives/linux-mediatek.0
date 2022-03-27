Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C269C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsqoXRxhi9+jFvjfnxAD1HK9rLtvxeOP7whHCnCGrbo=; b=B/EqrcgAdRCYGb
	6abPcABF5srVIrm9+x2k7Poa9K2aku3aKnB/m9IH4hhAsPlvc9SOlFY1qY2hgWEKlLKVzZOlItnW2
	wyDqpKjAcNJwV6+OwCX3FyxHV8OnnpByIHDc901is2xLGJNd63ymoU38UQgGI2anKenzg0nNKA6CB
	V2sMPbhbTmiisJ4ZsoCAr6fX0n++/X/8GG0g3I2TMAjrj6cFSGWUBjosKSPtQRmg2UCqLlyAAFBoi
	H7tKQke7gDrQ96dpkfoECLiyQ6oyGpedZO41tRJkLTq/LV/OEToCh0gMTZAusBpdm0bOaetwmyq3o
	StE8m6rW3eeFb3K6gDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbdt-006Xqg-Nc; Sun, 27 Mar 2022 22:45:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZZ-006V9T-92
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id n35so7378462wms.5
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FaQcjw0Oe/ViCTTuFvcZ5DbpUtBdonZ5NoR4+x/b/mM=;
 b=qW2XxDUJbAS3r/UdSiVC1SUqqbo19IbwRzbd6eYE8QLRWXclC4MyMu5PP6s4nmi7wa
 S+uXzqwfhpFkc5h6RFYkTaLmN7WemillFnw9clcGHDhG8VEy5p18LJ6rH4GwGvW9q1Bz
 HTjdCkbRh0qlj498LM1uFTDOQlCT8ri1OnlsfeT3qZCsuqQS1N2wb5P075qAR5IBVhYO
 bkC8NIF0YCcJaQji7B2w9xdKQSANBOQwTZ0jVZxV6MJQ1tfn4mNYKO8evyPdiXkfccVx
 EF8z9VhvenBeN7MDHGqYOKS7IikyAEKadQyB8XwccUz92pe0ZbM2eK2UhGqfVjLaw6v9
 n1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaQcjw0Oe/ViCTTuFvcZ5DbpUtBdonZ5NoR4+x/b/mM=;
 b=sexfmta/pt3xLNmZGrePJ0SrK2+JdJ7DkMe+XXo29M/LnyFlM23Xj6VKQOhM6c6TUQ
 tBTiSrU95T+5awFkDpXzn1Sg1bKSjYii/Bd8n9NpKeE9xKsHkesnckRpCkgyIdA2nhmR
 Ji8CVK0jy4dK1+7HfhXDJ4XrASXvjJBHyq1wwHYl/X1zmwnVsqRjiok1RE9/aBsaD97a
 yXwyox3jQEuZA1OYMfKaFKamKEs19ZW53+x8uSQTPSYTO3u1o3vdX8hOUXW1NyOUS4UU
 bgVHzLN3jz6NQtmgWl0do4/OAgrVML6VJjwijbefE3br2PYG9VPGJGGXjcJzdcsWtWoZ
 9GQw==
X-Gm-Message-State: AOAM533PRAarYM7rmExr8dV1oqVHoVZGtgRhx2bEG+VigA04IxDOiAt9
 h3uKsVa6VQnR1QLJYaF3u7OxLA==
X-Google-Smtp-Source: ABdhPJxDwf6F+ENtKInRSb+MZ2nQMyNtshUEC8chEgc4PJTjVRZoRbjSGN3S8VWd2id0WbkzsUQobw==
X-Received: by 2002:a7b:c77a:0:b0:38c:2c33:d8f1 with SMTP id
 x26-20020a7bc77a000000b0038c2c33d8f1mr30933624wmk.115.1648420880088; 
 Sun, 27 Mar 2022 15:41:20 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:19 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, markyacoub@google.com
Subject: [PATCH v9 13/22] drm/mediatek: dpi: move the yuv422_en_bit to SoC
 config
Date: Mon, 28 Mar 2022 00:39:18 +0200
Message-Id: <20220327223927.20848-14-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154121_405686_5FA87ED3 
X-CRM114-Status: GOOD (  10.68  )
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
