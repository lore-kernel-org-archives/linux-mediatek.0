Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC41C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpAS2sHSGcAPImSLyCgVjeM7GkzUVuL7/YD69fBSME0=; b=X5/d5mQ/x2HMbC
	uJTCUEamTta5mkcHjC81G9Ctk9aCEphv8ldf+ESfPTl2XKoLZiPjo4kyPGgyq9fra+c73a6G7MlN8
	ZwDuoqCnnyA5T1lsMQ34rsQM7gYBrjC0anNsQ0dEXpz4ovRKanEVxfFb9bgdTdTIvtkso9nAs6rye
	rRyiSHiTH8K9m9n+6Gh+AhtlYK0HL4ENIducCztSm9IACeDFnBqrVPIrJxstaR7c9V7qIPGj4mUBd
	3Wo5xkW/H2KHunANDn8bjROkgWj7QKhrKNvPU9ctYW/FLV8H7sh4Hr2BhAX0bWQ1DJHR0WWUzpjNs
	6W3vH7Bpvo3A8CACaEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnfo-002m17-48; Fri, 25 Mar 2022 17:24:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnYo-002hm5-4E
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:17:16 +0000
Received: by mail-wr1-x429.google.com with SMTP id r7so10641212wrc.0
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=p/bzvqcoe7xmjeGx0bzZZKr3QkGpvN1OffJqFUZIQSXRwAILqcf+RcRhigcNIVuytf
 gdMEjPWkXeWQUCajFWsp/Aue26OZT25LAtjITkO/AbC7JId1qwsj5MMxiZobBbJXcGBA
 XxelquKvDUapJkpBpWzf6hj7DWbR/IkirEcEat0Tcvi6e7sL8jfWN/dm9iVMQlYhEj1t
 dJTdtiFJv/lWnkTJ9S++ymuxEz5s8t4NoGCrjK3oSoDoFNwFQSnpE+l6ExBubJ1I/2OA
 jbh+S2ZhgOPMjLJ9Bbx4HrkzcNbX3QXmv795tI/LYBkxXIzIvObYQGo/LdNRhdXcgzE9
 xEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMvfz+B/fO4XaHRDT9xBCSiSBmXbtSzCBQeXFCLeYNU=;
 b=X2YDxT/AjGAbTb9r9QXtYekVdToT9nnZsIkO49doNqFzpbnNo/86ze+xNELMh/RSkw
 eUXPrkGIIdITuZjXglP4NK0IcBOLhXzA+8MzzC7eP3ga4Bgl/bxvmYMcfA3r9+XsCEZI
 RpRq6UMlpIEvUEUOU6yC/8sw0NnQ/pFasGUeXaU6Il+MuzXPJXFw4bjt1D+KwTuGW3tb
 xdPUgdZtrBQYv1mNxTli06zrYW3EOEklI3Mfb3sdecnAA2MeVDGO2Vobz7hid6EHevid
 AdsBGIb+4gnmG8gjLCKS+pnXGGCUj+nTECIIyzmF3QH78/Iiq6v5CERLxIgcrkib0Bnq
 h7FQ==
X-Gm-Message-State: AOAM530NmKdshGcAz3wEDQ81NAg1a96WbuWQm+sxLlgluAba1VKY0XXB
 pZfXF97L8xachw/Ggih9TRA8hA==
X-Google-Smtp-Source: ABdhPJx6jyzSTLucPsEMVBbYsGniaNIpeoyfEh/lkHKnA/tWkx4gSFEuQudHfuWGo39hyWySDlHC0A==
X-Received: by 2002:a5d:4d43:0:b0:205:9376:5d8 with SMTP id
 a3-20020a5d4d43000000b00205937605d8mr8887728wru.193.1648228632808; 
 Fri, 25 Mar 2022 10:17:12 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:12 -0700 (PDT)
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
Subject: [PATCH 14/22] drm/mediatek: dpi: move the csc_enable bit to SoC config
Date: Fri, 25 Mar 2022 18:15:03 +0100
Message-Id: <20220325171511.23493-15-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101714_302488_6A55F75C 
X-CRM114-Status: GOOD (  11.13  )
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
