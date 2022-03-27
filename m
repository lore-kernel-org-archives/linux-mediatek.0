Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05044C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 22:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWrhMLE+Xd+h0pzdAPxq4HH4LCOm9EGuRjfyfCyOLUQ=; b=3vJKN3I8MyjECY
	gEXV3OcPXpmX+WhtR8k5TJMFNAK+Xt1XGea/oXTYOze6py370RlK/yjkKl3zqJwo8Y5Ka6tYuZPoa
	Rgtibm40Jk5CRK4wUGBu2rpR9dgnBQMhR2Hm1iV2VH9RyqVtUxWzM5WM/ZbkyWmY8UfhDHiZgEDMJ
	fRkSm8OSJ2YzS5aDoXQZMaPCEVTCMvov13hQwB2xeRlHIEFg4CAkkoUnm4g/a6VsTUzP2qeE1L/ar
	K3Dcn6VojdkOuBXe8yDCXI8V0oasNbcllbFnCTCz/WTzqFYFSAlvQB31ovg88ZHnBR2M5L/D4087z
	25kdbpYYy3d8C66zqFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYbdE-006XRl-OA; Sun, 27 Mar 2022 22:45:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYbZX-006V7g-Ol
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 22:41:24 +0000
Received: by mail-wr1-x42a.google.com with SMTP id a1so17889684wrh.10
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 15:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7cdghCtZILOuy6wyiUAMSm10nHZvUCEwy3CxnJnpQ3E=;
 b=a00oZ0zFt/UkLWjLbBa3/jFbCTFYwg2m9Y3FViz0Wi20dUXxoCDB9YnYyPfCd0MwNp
 gakNUrmY9+qo8B/AYoDZ3Ws+4zQFGZDCDugqpUOF9d80iibYqXPpuptpER2gMjOneA2s
 tGOM5g+3gOheKiGXA1hKtVT1fywSDX0ke7puAkmSD4/kVLbnAMh9m8hYtXG3PT3zHNhQ
 bs9vAKnqDF9CevtIhWXCNwiMCsNlFgbUCey6aCehtCNR1EhzicmE38C8VmVuIxa0vmjV
 G0ms8mP59Tq0tLaNQq7YU/7ICYwtTYczJ7leCPw22dzLxXNfLh/Ugo8NCn4wIwCSJUfV
 OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7cdghCtZILOuy6wyiUAMSm10nHZvUCEwy3CxnJnpQ3E=;
 b=v6S+/XF4gQR/Zn5zMrFt6dW3+nUjczVs+qRZ80f5Fjkt3PlOdSNKrUdkNkC6S46MVt
 sdtRe8HHBMlDUwpUlrhqSddhQXKhiykiEaF1yo+LZl6yuwz7nRM/tJ+oFMFtU3N3eD5H
 YRWzpOkRI6Uou3TCyyQw18hyctUZT69LuJromJLFDaJuOE1g8TC8HUIq038jhO7hpsbr
 FANPSzr1CoGQDCeMYTljP0JOeevgdnWV2dNgSjkRGWgq23j1i461XEILvKtaWPmrY8zp
 tTSZsJUslNL7A2pXrHP/Qsuk+F9uoUn1VS5/QamgDdVC2PUkLA6wM72A91OF93A5dsew
 H/tQ==
X-Gm-Message-State: AOAM530DnxmZfnoR5F/zlgh5jkkfhTnDUtHdYEKQ7PpE5/1kXG6RNAq7
 oDliWFKa994HqtsgN8lH9Qt71A==
X-Google-Smtp-Source: ABdhPJx0D/6eRjbTNpgctrBZBOznJL+XQ5R4taW1lDFAJyQP4uqZk0fMKVrOQi3TA5P25fvp/LidkA==
X-Received: by 2002:a05:6000:2ab:b0:204:f77:c1a with SMTP id
 l11-20020a05600002ab00b002040f770c1amr19889863wry.173.1648420878388; 
 Sun, 27 Mar 2022 15:41:18 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-357e-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:357e:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm10400867wrm.82.2022.03.27.15.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 15:41:18 -0700 (PDT)
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
Subject: [PATCH v9 12/22] drm/mediatek: dpi: move swap_shift to SoC config
Date: Mon, 28 Mar 2022 00:39:17 +0200
Message-Id: <20220327223927.20848-13-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220327223927.20848-1-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_154119_881623_A531C3F7 
X-CRM114-Status: GOOD (  10.71  )
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
