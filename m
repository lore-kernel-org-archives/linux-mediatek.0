Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1937C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsqoXRxhi9+jFvjfnxAD1HK9rLtvxeOP7whHCnCGrbo=; b=ev2I2R0JKo+B0i
	upbsSDcT4eu4sxA6Dsxp/AC8Yef9t71RWX37lQ3PoaroTEX8xn2mK1S8QfvBrfW4m4cf4KIpoBMd4
	peC46QpN1evn3JI1M70vGATyaeyJGZ4KJ0P6S8DP1+r57ssX8xjCOIh0u6EGuZxN7bi0gsktJAk94
	63hK5JR3mWl1H+nvivCfNP8iPJKZ1J6mJiY4j46WvGpqd93rBVRuJelInIHiFzDm3DbZKt0Rhh8Sg
	Uro8e7A6Ra5xsvmG09cvAhZ/ZOF3HhOZG31ssa6pvEnI8E6WTOoND2jpNtkLOz7tzVhGPJ5JHysxk
	ir2detJx8TTiRqJXtF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXneO-002lFn-Fx; Fri, 25 Mar 2022 17:23:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnYl-002hjx-Qr
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:17:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so9366802wme.5
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FaQcjw0Oe/ViCTTuFvcZ5DbpUtBdonZ5NoR4+x/b/mM=;
 b=q02Yc/wGGHipHe+rqcIDczhkFTYBkCXNRcjEaizSrgSJSQk0FcBIVTvhOBAQ+15RPF
 15EnZCNGxO/rh/t5Bptvfr1UKzXfH3o68t/uFyTZbvYxkGCMctksAnUHZdxSj6Ssx5sb
 ZsWpd8V9SvZbYNVChxVyeCUJ1TvEnvNTUnKALgOwqoqKibmVvTN23VqehQN+Rnws1taU
 e6bjFfjYSBVPOjRfsB/M7W8aQ1HW6ebobxCF4cGm+oqbJb7cgl9u0ZJRn9I4Hx3sQou+
 pxi5mHjGkSf3wzIrzRLNklRbUzIyhq4YyxCGLnejv93i9TXyu3b5oP/AMswNQWByss5V
 sCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FaQcjw0Oe/ViCTTuFvcZ5DbpUtBdonZ5NoR4+x/b/mM=;
 b=FO6AT1BUejaJL9S70Rulxe0IVx8UL6jYXZKZ5Y/hZNz8eyKWW5Xq4SHUv6VAJoZe4S
 2415VdJuiC4+CFvwmrPH7o8oU/LaEotw7ADzM6kHT8gFzYiiqIgUInWBpWGmoRIaRx9C
 1wjsb7x/t11Ju/J8PMzgtdSXYSA9etozkS+/03169oruqNQe9s521TPxv9wPyUHBBNOM
 4C4McLbfzy6q8iCjmhuYRTSI8kjJddrbqph/XLTLa668/0/5OlMiKyGB5G7C+WQxtUxp
 5Zf24OJMnS2T4IrHQcaqTk75ELnIYctFnOGA+krIcMiDEAK00SOqexLN9bCgK6RMTgly
 a0Kg==
X-Gm-Message-State: AOAM530AXfNtbSyYwpvngKH+WM4qmb8HaDBaLsur5L6+VWoKQo1aE+9k
 L7cqATN+cNjACcvtKfyu/hzgKg==
X-Google-Smtp-Source: ABdhPJwePYYbDEL3jskId8G6Vh/wDKonckD8/zRMt2PuaJN41Er7Io1HePBcu1Tfj+Zb+ttXKPbZcw==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id
 d7-20020a05600c3ac700b0038bf9c627b8mr10822009wms.75.1648228630495; 
 Fri, 25 Mar 2022 10:17:10 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:10 -0700 (PDT)
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
 linux-fbdev@vger.kernel.org, markyacoub@google.com
Subject: [PATCH 13/22] drm/mediatek: dpi: move the yuv422_en_bit to SoC config
Date: Fri, 25 Mar 2022 18:15:02 +0100
Message-Id: <20220325171511.23493-14-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101711_963224_731383B5 
X-CRM114-Status: GOOD (  10.95  )
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
