Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F69C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGek62FSugSupE+AaTZXvE1/bAqZ7quJMN1CO525EdQ=; b=uoeIvq7dOauUy5
	82XSG1MiKIUiRMRsQmezF6MHISvJwDN1RKW0AhkOW2R6rlxin6I87eqrsyCewNXXhJgrBpMfEYgBn
	FzkjHRHqSoKJ/A5c8xmfPLF+FwLDZXCjx/CAOhtmjcmSgqB5jrpkKwUgxszwpm/LI88izo8KeHpWZ
	nd18G34G9FINnN6w2MukYusfmSZ/u/FNcTXr+fvaVEqpMYz4SeRpj1r3f9ZLw88WPjG8c2eSBFtnq
	x8h92mzXpHUx6JaT9gyd5KwyhXnOIdt79885Ks8+vb65NGAJ72st2KmN+l41g2FqlJlI10UEySrct
	a6kawo5KlNyAxQot7KNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntGMH-005zGj-M6; Mon, 23 May 2022 22:17:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntGME-005zF6-M0
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 22:17:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id n10so15200377pjh.5
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 15:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=pJTRgXjYxPKGivC1ddsBnyqDyotE4GS4vzjjb/S5WBE=;
 b=ESCC6/40VtCzAGtorsLZn0r0V2dBdWiAOt/cG6gTdpQvsDw+mGlgVg7Rk53aHsoQQp
 0+uIQkSr3+LV3ofNC3mJgx8gX9WwjMSSnmnZddXeQKgw56PdhYP6Dpkq7qNvcqOfJqdv
 T7SdjCVb57q7FlX/b0P0C7c5IJDFGC2tczw4YqAlFOIc7KvyWtLLtVdSccSr234CejTZ
 /zPS5dQ3UeU2+8yW1jlkkiuqf4goS0Lz/gAX8rZ5QdmW7/pF94+serdUK5wna9OzJ/gb
 /RRupefhXyaSG4Ep9gxcObKqnFHrT/5dS5XIwIukTLs3fzer6b5uHSKFz2pWYneFUqUa
 Wp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=pJTRgXjYxPKGivC1ddsBnyqDyotE4GS4vzjjb/S5WBE=;
 b=CNYYoxapiJPNmyTYKv8YIjfFBwSWJ7MRoSoDKcb0B6DQy1QKGBsqm3tKs6j89/p3Jj
 1d9uMnKgYhhJn/KPvomhmllj3ANKWIBPHO0JZVctGUzPk94vMuPntAqXdPwrLm7CeSX0
 9H2+z2RJ8XAsFFtvJhWAjkakz9hmT+/GRUXeMJNBXndn/VT87ISWr6mt6AH9IXtkzZaX
 miWUrr9truDRxY5vwOH+uO9b+r5u+RTqShQVy5ZlwPdoIG628DkVyruH31xksOoG4q9H
 Lfo9cF/b2NDV15IX9TMx74DKDR5i0CVP+XF/YJpdv0QMQORhG0f86x8MyDl6Exl4f9Vz
 mwWQ==
X-Gm-Message-State: AOAM532MOOzBdtar6VlvHx2k9NWioKYWBdXsCwEuBw/yE0HhQh8RRlm3
 xRVdonypQoQY0ilm8iUbdFJjvGDTN/Q=
X-Google-Smtp-Source: ABdhPJzOKCF/I42KUqWTL8cfnDA/0/qAdvt/GNLcSeZ9wgnwBO24anbaidWzuyLvAGG0ZvkiJfSv4A==
X-Received: by 2002:a17:90a:aa8c:b0:1df:359a:1452 with SMTP id
 l12-20020a17090aaa8c00b001df359a1452mr1170029pjq.75.1653344213190; 
 Mon, 23 May 2022 15:16:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:ce25:f34f:c90d:61fa])
 by smtp.gmail.com with ESMTPSA id
 ck18-20020a17090afe1200b001cb6527ca39sm214063pjb.0.2022.05.23.15.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 15:16:52 -0700 (PDT)
Date: Mon, 23 May 2022 15:16:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: mtk-pmic-keys - use single update when configuring
 long press behavior
Message-ID: <YowH0Q5HAGU7Grx2@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_151658_765033_F4D59329 
X-CRM114-Status: GOOD (  12.25  )
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

Instead of doing 3 read-modify-write operations when configuring behavior
of long-press, consolidate everything into one.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 71 ++++++++++----------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c31ab4368388..d2f0db245ff6 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -18,17 +18,11 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#define MTK_PMIC_PWRKEY_RST_EN_MASK	0x1
-#define MTK_PMIC_PWRKEY_RST_EN_SHIFT	6
-#define MTK_PMIC_HOMEKEY_RST_EN_MASK	0x1
-#define MTK_PMIC_HOMEKEY_RST_EN_SHIFT	5
-#define MTK_PMIC_RST_DU_MASK		0x3
-#define MTK_PMIC_RST_DU_SHIFT		8
-
-#define MTK_PMIC_PWRKEY_RST		\
-	(MTK_PMIC_PWRKEY_RST_EN_MASK << MTK_PMIC_PWRKEY_RST_EN_SHIFT)
-#define MTK_PMIC_HOMEKEY_RST		\
-	(MTK_PMIC_HOMEKEY_RST_EN_MASK << MTK_PMIC_HOMEKEY_RST_EN_SHIFT)
+#define MTK_PMIC_RST_DU_MASK	GENMASK(9, 8)
+#define MTK_PMIC_RST_DU_SHIFT	8
+#define MTK_PMIC_RST_KEY_MASK	GENMASK(6, 5)
+#define MTK_PMIC_PWRKEY_RST	BIT(6)
+#define MTK_PMIC_HOMEKEY_RST	BIT(5)
 
 #define MTK_PMIC_PWRKEY_INDEX	0
 #define MTK_PMIC_HOMEKEY_INDEX	1
@@ -108,53 +102,44 @@ enum mtk_pmic_keys_lp_mode {
 };
 
 static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
-		u32 pmic_rst_reg)
+					 u32 pmic_rst_reg)
 {
-	int ret;
 	u32 long_press_mode, long_press_debounce;
+	u32 value, mask;
+	int error;
 
-	ret = of_property_read_u32(keys->dev->of_node,
-		"power-off-time-sec", &long_press_debounce);
-	if (ret)
+	error = of_property_read_u32(keys->dev->of_node, "power-off-time-sec",
+				     &long_press_debounce);
+	if (error)
 		long_press_debounce = 0;
 
-	regmap_update_bits(keys->regmap, pmic_rst_reg,
-			   MTK_PMIC_RST_DU_MASK << MTK_PMIC_RST_DU_SHIFT,
-			   long_press_debounce << MTK_PMIC_RST_DU_SHIFT);
+	mask = MTK_PMIC_RST_DU_MASK;
+	value = long_press_debounce << MTK_PMIC_RST_DU_SHIFT;
 
-	ret = of_property_read_u32(keys->dev->of_node,
-		"mediatek,long-press-mode", &long_press_mode);
-	if (ret)
+	error  = of_property_read_u32(keys->dev->of_node,
+				      "mediatek,long-press-mode",
+				      &long_press_mode);
+	if (error)
 		long_press_mode = LP_DISABLE;
 
 	switch (long_press_mode) {
-	case LP_ONEKEY:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   MTK_PMIC_PWRKEY_RST);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   0);
-		break;
 	case LP_TWOKEY:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   MTK_PMIC_PWRKEY_RST);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   MTK_PMIC_HOMEKEY_RST);
-		break;
+		value |= MTK_PMIC_HOMEKEY_RST;
+		fallthrough;
+
+	case LP_ONEKEY:
+		value |= MTK_PMIC_PWRKEY_RST;
+		fallthrough;
+
 	case LP_DISABLE:
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_PWRKEY_RST,
-				   0);
-		regmap_update_bits(keys->regmap, pmic_rst_reg,
-				   MTK_PMIC_HOMEKEY_RST,
-				   0);
+		mask |= MTK_PMIC_RST_KEY_MASK;
 		break;
+
 	default:
 		break;
 	}
+
+	regmap_update_bits(keys->regmap, pmic_rst_reg, mask, value);
 }
 
 static irqreturn_t mtk_pmic_keys_irq_handler_thread(int irq, void *data)
-- 
2.36.1.124.g0e6072fb45-goog


-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
