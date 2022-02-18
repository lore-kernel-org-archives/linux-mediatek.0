Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC80C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHH9Uh6qzO9w7sp9kZaiTYT9Y200Zy4nUdg4QFBX5oY=; b=kY8kA4f5cqnN1i
	+IiUUJosZNV6dNYAXhWoRSq52vLNtPTZRs+/xP4tpJXMGXgficExRpH7EllMXp3QeAy+4GOXotsJi
	u4+XFEc7OVM+KgsjwpWCF4IgqLn7Vi0SRAiciWbtcB+J/qeRQ3JQRI14mp5aqedzbl0ZxXf2o3b9S
	AtHyL5WeqgwbXh1bMsaEzbcLRXZWkvp0PqQT4MqWXRK2DB31wgsq3SgTjNNwhw3eFnuWwCIVeg7Cu
	3I+1U3bYFsSTuThtEZ/oW8NY46t+9bZXztBc+BItbUN9llNmJ+cXfG5fNGMx1cOZGPA29GCykt+xB
	ZaFXgy9bKo6apWNQuN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4to-00EzTw-Nn; Fri, 18 Feb 2022 15:10:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4gG-00EsDl-Rg
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so6629667wmb.0
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsBWqhdlaWb1gMEMCTy+xVO70hKJt7Vn6RQJImIvis0=;
 b=7+JO8GgDz4eLqZqGL8gwXCKx3NMB4p8Wwn1xYLk69tPcCPx4ZZCHeT2egR0aCOFzB3
 5plooVjc/uxWNVgjnYd/iz55rnCbwVFW1oZzJqY9FMA/kZ2lMHqhv+nw4/fzrbSl888o
 +pJ+UmsFn7LNXUxlgJV3l21O6IRlAn5q034XeSze0dJXlywxtBuTY9GbCbDmIt8Gp7hG
 yDfy8Vf247TlM2ydggvBl1+jh9aKkMNTxJZeAHaGCaEUm8bcM1VqDkMtn4rwTPSeG81O
 B9zdgBvg9OXJjnqT70Mq1uscokETupfm+oflpZzO0oC/Mh4DqnYIEcgw1XaTuDF52lj7
 s7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsBWqhdlaWb1gMEMCTy+xVO70hKJt7Vn6RQJImIvis0=;
 b=LlyrwFGEYWw1jRQMaAIrhs8nJxJJm4WOnnqXz3s2fFs/u0TDJg2BoOCK/adpm4Jd45
 4yTbLJUitSCqkl4E5Ej01lM9vmgehk4Lq+8u0TbjtD/c/WdIOA3kgS2r7Bwyvwj34sbV
 Lo21mhN4deyPnqODNGPgvdRJE2Z8ooG+5KZQ1n1NdPOMxT20p+6YFvgybZ+Mp+wL8ZAQ
 TTOjEmNBJWr0B2TeA7P+GsOiy7fwj7uRYvXm3ufLVLzPGxIvij6YT3hZJAC8V88F1lSt
 G8K0hXbebEd5nAa2eVZ0N9oyyJGmmkOeAI6wTu9MpBDKBSP0yO4oSdhrdODaILQ9n/uZ
 4osA==
X-Gm-Message-State: AOAM533NOvEcT4qc8+7iEMkD287W/5g3eQ97HxvqtE4x+nji3+Is7tjV
 zVhHxiAfSRgadjs/VzvhM1UOXA==
X-Google-Smtp-Source: ABdhPJyFvD28f6eULBjPuAD0GLrHqccrZfmLJsTsBWJtRo1FCRC+AL4xjZn1NWK7NCcpJLwQblQYQQ==
X-Received: by 2002:a05:600c:2d41:b0:354:24d2:8e13 with SMTP id
 a1-20020a05600c2d4100b0035424d28e13mr11133608wmg.138.1645196178651; 
 Fri, 18 Feb 2022 06:56:18 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:18 -0800 (PST)
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
Subject: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board config
Date: Fri, 18 Feb 2022 15:54:28 +0100
Message-Id: <20220218145437.18563-11-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065620_939785_36C1E6A3 
X-CRM114-Status: GOOD (  11.08  )
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

Add flexibility by moving the swap shift value to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0d3acd08ea358..ec221e24e0fee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -131,6 +131,7 @@ struct mtk_dpi_conf {
 	u32 dimension_mask;
 	// Mask used for HSIZE and VSIZE (no shift)
 	u32 hvsize_mask;
+	u32 channel_swap_shift;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 		break;
 	}
 
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
+		     CH_SWAP_MASK << dpi->conf->channel_swap_shift);
 }
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
@@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
