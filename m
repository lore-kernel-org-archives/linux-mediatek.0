Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80393C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWrhMLE+Xd+h0pzdAPxq4HH4LCOm9EGuRjfyfCyOLUQ=; b=kxqQEV9+oVFQhk
	VJhZpGBNYJUsg7QCTPfZ3fARF1pFS+8eVZMjuM1Q5teuLxRdY17qGZNUv8RrI2QdYKYNdTh19gIOv
	O5cLJ3s+cMB2LjNVCywIiUSboJGAH2aV+bhpV/uRpZwC5yBHUQkoyJJUhEdK0G5iVdtAExBVxPSD2
	2HHYIeL9lJRkqyAnN36lwcdPAEu6PFslTXpueQEUryNlGskDjFT2RJ51oIaGd8YD9kCip4PaidoqR
	6Lv2+WpyK8yqUIMQcXbiW6qse5McoilktUVbZXG1iBtlXaTxKHIASkfkNhcPt9+CW4Fp82U/Ar2j7
	eHCdtAI+2byEvT+Gl5+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXndh-002koZ-0P; Fri, 25 Mar 2022 17:22:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnYj-002hhI-R4
 for linux-mediatek@lists.infradead.org; Fri, 25 Mar 2022 17:17:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so9425268wmj.0
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Mar 2022 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cdghCtZILOuy6wyiUAMSm10nHZvUCEwy3CxnJnpQ3E=;
 b=Ekml532Q4VM1H61d92wIWfxKoSe5qC68hUPuRiJ3utWbOHHL5xxnrBy7NlgYLLrxXF
 NTu3kCRSo859RS36c8hHfLfzjM0xwpTLhkPCnp58ejKXGViwoaxLpTlORp9RmiUAifXW
 OwZRIkinfqA7QR0sTfS5bnOASfOR8QYtWpOkcbfZ1+9sJKESfv4H5HAe3tiQjVmoDouF
 y4KTvE10pO1b1l1AhbRfA29ayxjlNJgR1gWpgJR2b5g0lUazF4lpIfMOVUOew1v2xhAD
 SzmwIQUFGVVbFSDYENnz6Thfe+BR9R/UmkE3pNJDxt90WUP63GrBqY8PbscluUB9Gn86
 wAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cdghCtZILOuy6wyiUAMSm10nHZvUCEwy3CxnJnpQ3E=;
 b=dUwsLXrOWumv8iy6ae2X65kKZGveFzF/7m9RkIIN7QHU/s1g1KhfVXfJKLrKPPrMSD
 Ic1Xyk9Ady0tYJb5aa5R12Y3n4WnwaE/6SsM7d9ozJ+FmJjfmeZ0eX5Ezi8qySULcyQ5
 vNhoa6KSV6J5UP9lqWVfaD58pu0Qxcbv7CnShe2e0CF/5BCHmnmUFKXp2nhya1EgMqlN
 mG9xixWOp41CsCKqcqUDsbUFwa9cJestxhfgURzqxX5O6xZnHFY2ABF1/s8zhk+DSGH9
 gM6WwknVVKJ2t2WZhrDM45zk3U4JwQoN3lw8JIyMs2XhPLUmECrR9WN4HUHUWhNErWyE
 TE6g==
X-Gm-Message-State: AOAM533ZxLgux2HfmvUoDVZw5jfZQzUkEiAru3uQf+gMg2cUwz11nFsJ
 jGU7k6rxCWaSSlEFT2g7riv94g==
X-Google-Smtp-Source: ABdhPJygjHdeyF3kmbF552zf4Ig1oFkDJy8o4evJu6in/pkAYt6kS4J5LF/XYpeLn+lvNZV9cbY90Q==
X-Received: by 2002:a1c:cc11:0:b0:389:e8aa:ad4b with SMTP id
 h17-20020a1ccc11000000b00389e8aaad4bmr10622380wmb.79.1648228628310; 
 Fri, 25 Mar 2022 10:17:08 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-cc41-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6240:cc41:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a5d6390000000b00203ffebddf3sm7547464wru.99.2022.03.25.10.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 10:17:07 -0700 (PDT)
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
Subject: [PATCH 12/22] drm/mediatek: dpi: move swap_shift to SoC config
Date: Fri, 25 Mar 2022 18:15:01 +0100
Message-Id: <20220325171511.23493-13-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220325171511.23493-1-granquet@baylibre.com>
References: <20220325171511.23493-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_101709_974277_410F2C8B 
X-CRM114-Status: GOOD (  10.98  )
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

Add flexibility by moving the swap shift value to SoC specific config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 6eeda222a973..6d4d8c6ec47d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -131,6 +131,7 @@ struct mtk_dpi_conf {
 	u32 dimension_mask;
 	/* HSIZE and VSIZE mask (no shift) */
 	u32 hvsize_mask;
+	u32 channel_swap_shift;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 		break;
 	}
 
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf->channel_swap_shift,
+		     CH_SWAP_MASK);
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
