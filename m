Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20895C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1hioZgJTm7Xxj69B/XiKd/Sia3NwnEOoBVLAY7nn/o=; b=zQf7zYUVPeHHOr
	OCDJKcX6S/gQXHdcg33g/a8Y/Is6+T5MOH2cGCUkoX5k9ihb9+nT+Hr2U1NPdibNg0bV8y/tssEBE
	LpEEms9dGoPUzGxwNfK0FzA+tJv/pRQ2y2F8iWRl3mqMbzz4AbpAm41Vr3AOpyPO9W6g+mFAuX4Qp
	IcU8mdqhRXGrorsgoioHdAZtln0ORTkbsXq5IiAKwWv/Tbxjwq92MW9b75Y2HDkA7oPsLa/f5pz4J
	huqUadI0U+97QCBVHJOiVZZi6YMya+++VpQ+TtLdQCiEUt/zCOI/R2UBshGIrbq86w2B9ZR422DRc
	2b5kTj6TKKJ9eEOBZ/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL4r6-00EyGS-Ao; Fri, 18 Feb 2022 15:07:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL4g8-00Es6G-72
 for linux-mediatek@lists.infradead.org; Fri, 18 Feb 2022 14:56:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id v12so15068401wrv.2
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Feb 2022 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74eAjite1YksdGIU0aBC39Xndc2WIe2LazK2htC4zfk=;
 b=HoHQ/qui2T0BIpjk7uFcqqXA+59MESDkpbd4jX3EgaODmxpm8DiFx/ESXwZGyAm7RE
 +1bDYwDbtRQvInmytiZG0dsjPa/vfLvQs5U0w4A6CEGcMhHpe6uzZ3Z9WYSOwdDEaAXU
 Mm9G3C9lRiGVfEZ1jPX8BOq7Ja0JI7eqCXiURCVkjJ0au1AaTH1Pw2rxE/iVn4LA/yUw
 LK9M/DKvTdp/QUh+o/X0uigtfJ5viGx5t4yWya9hNiGWRmnkP8EWfwQ/SQKai9Nv3KQO
 dnDCiiHMZlTp1gMZC6jXc+5E/BKtvoaERTnqf+OUCAEUXWSMC+D2HYRqWaVuQw6YgWrO
 lDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74eAjite1YksdGIU0aBC39Xndc2WIe2LazK2htC4zfk=;
 b=rAIIZuVwNU25VfbuOS+n37tv02s6sDbRBCy/Pz+zCp21ut5QvDogbFB0GGnjyV4YC3
 LC69t5s9vo+JxbCS3lvbNKRwZECXM8qXOeHsKTdZBB16woCdH1iAapPqGmH9MYG78+M+
 EBHmCNMY/UiPOApp50qslX42k+5S1EmWF9dlFgy4Qm4ySbsvw/2iyQcRWMlNUDp6xD0X
 jwkSZAmOU6QzlVYRJnQNWEcI3E8Mx6UxpmhWV60jTj0pReJzr2R4Rdj8f/xwOIx8UnIP
 tEBXAJFtPEMyr/mq5dretsLBr0Cw6/L5PUIdLm/cHcqZ9BKNdjooBnXU4nbjxAhJdQxW
 Sl+g==
X-Gm-Message-State: AOAM5334umNC6S3A0O77bWrE4WfKV6u2q0+FZBBy9+kJqomG5Ch7IeIN
 jwCowSgzysaZoTpxr8LVuqTzjA==
X-Google-Smtp-Source: ABdhPJykBR0WcjKdOJgGeDVbCzSmsQ2DzFr1mKmqIp5hyqDnSRTrae+KtQ1kIOkfZyByjJW30hC/7g==
X-Received: by 2002:adf:9f45:0:b0:1e3:20e8:489a with SMTP id
 f5-20020adf9f45000000b001e320e8489amr6109613wrg.602.1645196170187; 
 Fri, 18 Feb 2022 06:56:10 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:09 -0800 (PST)
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
Subject: [PATCH v8 06/19] drm/mediatek: dpi: implement a CK/DE pol toggle in
 board config
Date: Fri, 18 Feb 2022 15:54:24 +0100
Message-Id: <20220218145437.18563-7-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_065612_310114_6587C995 
X-CRM114-Status: GOOD (  12.24  )
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

Adds a bit of flexibility to support boards without CK/DE pol support

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4746eb3425674..545a1337cc899 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -125,6 +125,7 @@ struct mtk_dpi_conf {
 	bool edge_sel_en;
 	const u32 *output_fmts;
 	u32 num_output_fmts;
+	bool is_ck_de_pol;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -211,13 +212,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi *dpi,
 			       struct mtk_dpi_polarities *dpi_pol)
 {
 	unsigned int pol;
+	unsigned int mask;
 
-	pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL) |
-	      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL) |
-	      (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
+	mask = HSYNC_POL | VSYNC_POL;
+	pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
 	      (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 : VSYNC_POL);
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
-		     CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
+	if (dpi->conf->is_ck_de_pol) {
+		mask |= CK_POL | DE_POL;
+		pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
+			0 : CK_POL) |
+		       (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
+			0 : DE_POL);
+	}
+
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
 }
 
 static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
@@ -799,6 +807,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.max_clock_khz = 300000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -809,6 +818,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -818,6 +828,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.max_clock_khz = 100000,
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -827,6 +838,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.max_clock_khz = 150000,
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
+	.is_ck_de_pol = true,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
