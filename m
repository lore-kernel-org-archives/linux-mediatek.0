Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665A8C3DA78
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnntDb2wSxyksznyUK9vORluc24yy6XtA4jjRHLcBuk=; b=E3Y09a1RuQP2ybRS96ast5yoWN
	k+1ALcjcI6fpUZWfzDJgJoNl8Cn8pGg8RcZVdcTOC5m8Sp1oP9ly+t+3u9j1ApRTWY/Hk/qmAYpc4
	bWUFRlFiCk0YKIrtMuI7VtEkGypz1HMEkk71DP7Z/9dcpMUJFsA1pJPvNY6bLUm0nJth5hhe63Tue
	L0d6e+QybTpqDCdjcbqCHDFv5HnY2ovoiUHSlydAbZLUuWMF8IIYVSoy7U+sXbQuuhIhGs+fy2SkN
	OPgjO+ZLIbRsxzLf0WOguNqxxuXi37m/1dvZFT5y4iFnLdXAicYLyc4vJL6OOkJoKJuA2du+aaiKT
	0t6eRYrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhgj-00DOUE-43; Tue, 17 Jan 2023 08:51:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhfL-00DNmD-Ti
	for linux-mediatek@lists.infradead.org; Tue, 17 Jan 2023 08:50:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1797865wmq.5
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jan 2023 00:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnntDb2wSxyksznyUK9vORluc24yy6XtA4jjRHLcBuk=;
        b=LYUV60VqALvvzk6MilzChbMVqyD/B0GIA7z7QQD9RC9k/FTRraa9aq3o9DhdmmF3iq
         bEZxLJ/EPaEukjPDguwckMzwT4iZWzklaDDCcm8uvmRbfgEzQZ6BypnK+5qR13RDCnuo
         g/NoNBxqzf6YLnbLdMwkvsPYPgpfMg1IVWEfSQM4dsbIHLnsghP853ZEx8x80OXMesKO
         Gu6CisBcCKzX5DE471QmgAykmNMIdj+swGJPBP7wSz0pf8//+a8SQFDGZUzGW+MnbWQ+
         84Q0DSLD8KCf7zQKe08zeZA1GxLvcYKM7P0/3YWWTFKmdYhwcXPB8+J9/t/YfUwb6Dp9
         NQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnntDb2wSxyksznyUK9vORluc24yy6XtA4jjRHLcBuk=;
        b=I6bCEah73TZ/PNT3Q0cL+iBpmzh7R+9zezhBTRoMtH+EA+Zol7Ejdqh3mY8KakGQHj
         B+cEtoqk419kNZy2liHutMjhGItydc75dRqaCeKDVIdPhqqYx0dTNCjEYn9aM8eveYQa
         Ncb+YQ9qHzcXfoPRT+qzSW3okK/vNN1mhCOqy//fxrWZdTcfPK8OcVuiT5Mjp6KLoJzV
         dKO7ODQoFW4gVHXM2gJMox2UT5GD2ou+Fj28fenG7MVyUTgqEJ+Gd7aSoLah6zgXWNby
         80l6xAvl0EgGBhty2X7GkTKYtbyb7kC8EQR169rOo15NH3SSoIGhJGLi70CpQN7tWNvj
         IIYQ==
X-Gm-Message-State: AFqh2krQtu7h5fjM0njlPJxTwTM+uKFs7uIwlqx+nGnGdiuRqwbaZD/y
	bOR212CepZ8JC89DscrEUKuXfQ==
X-Google-Smtp-Source: AMrXdXvVghYU3f6f4pnX+urBDdE5Tc0O9C8WHHbtOL7Y9xI3DWYl8EiIm5gXNSp4H0aKqqrXqdqEMg==
X-Received: by 2002:a05:600c:920:b0:3da:22a6:7b6b with SMTP id m32-20020a05600c092000b003da22a67b6bmr2225151wmp.13.1673945396215;
        Tue, 17 Jan 2023 00:49:56 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id i14-20020a05600c354e00b003d1d5a83b2esm45040928wmq.35.2023.01.17.00.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:49:55 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 17 Jan 2023 09:49:42 +0100
Subject: [PATCH 4/4] i2c: i2c-mt65xx: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221122-mt8365-i2c-support-v1-4-4aeb7c54c67b@baylibre.com>
References: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
In-Reply-To: <20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Qii Wang <qii.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1454; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=TWV0BAft8RkOG5xbYhjbDPUS/3D2IDzrN9QH/A7cKxU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjxmEuVzYMtofJIUJ5oFTa3W0oKUDkqaKLoTvfJXnh
 0IBK/E2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8ZhLgAKCRArRkmdfjHURcOQEA
 DBqTEdZxCLimcj4ODKJJMfctwwdA7ZiAVFTtdGMWA71M/U79w8cFUVxFHSXnTn47gSHeFVcpiyFjaI
 DM0uhFv5NDrZdV3SvNjHSaHSCDFeQE+N5c9Uzhc431ttuJryYIry72+ioFiUOTnA+U/JDGaD1M7a9m
 7tL5AJP/pd6FzUpK/mV+KL/oRcSU45dHzjB2WbXsafsVh0yoMAoH2ONYHbYsE9VACpkQs8w11L7I6f
 MgM+zhIRh9TzyVGZ4uL9mRIOgiVqSkRJgNyPnFKCVgpa89Dv+rxu0+Uc7ZJ9OaOXnAAw6+GIvFrF7B
 FMDPiQ89s5gm9KpDwc9Mq/QcKfGm6J9gpPGiMo8mMOx6Jjwl2Pe4PFrbj/CH7lGxINvxSdbUcOkZTL
 1kUybTF+GoV300oW3Vfqd36rJNPg5T4A2obypuNuBiZ3UTueo+NATNKkWnJc+MxMy92nY4enQJ4TP2
 JKVX1z0A1FPrgtwj1B9IsKKaaK30kPyFuVZSIgLNpXQ5FqeHn9VQAypE9CUnNJdzDZBnOCaLYMeRmu
 XVLDdGgM/IsiHN6asVJvJMCpLe2H9voep8GpiI6rPdNcDDd9IQkkdOMROkZRyRto73sWYT2RlbZTwD
 GFFhgWu5qafDgyJWt1h1f8uSQDUo7fjIA0XyiyGP/zssH+KUXbMKkrEWIf/A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_005000_007767_B117F58C 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

From: Fabien Parent <fparent@baylibre.com>

Add support for I2C on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index d80e59340d97..2c9dbb42861a 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -511,6 +511,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8365_compat = {
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.apdma_sync = 0,
+	.max_dma_support = 33,
+};
+
 static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
@@ -523,6 +536,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8186-i2c", .data = &mt8186_compat },
 	{ .compatible = "mediatek,mt8188-i2c", .data = &mt8188_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
+	{ .compatible = "mediatek,mt8365-i2c", .data = &mt8365_compat },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_i2c_of_match);

-- 
b4 0.10.1

