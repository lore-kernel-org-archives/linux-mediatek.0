Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF547C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENu+p00VplmzFNNl3GsaexFgVk+QBuBfPjoiOsT7fgk=; b=AvyWzwyfbnjJPI
	DauYby04nNeQAdjzAwFtdvjygMQKcvpl34JNWTHxrix1/GO1nGXXSX+PDSFP4c56pVUum8LFW4iwD
	IM31dfhNPeovniEr8RNz6FgxVhfEU7T3HXiqSfUD/A9/gAbODQW3Cs94aqzO5rKaN196HtCyA63qk
	cxJMpGlfUu4Oey1JvKf5yY8arrABABAwKt0rgCHKxdT+q/XSvXgGe5G5OLVf+j3IfWqohvccLl8me
	VgkWdi6+BFhODnptmqHPJe1vdM0QclxUmK7nQFfr6ibAj0T++dnpn2/AYUiDmsiuOdo1n8Rl/BK+X
	+9tLTUx464pW4kLR72WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0YY-005kxF-NS; Thu, 28 Apr 2022 09:35:26 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0Wf-005k21-Bx; Thu, 28 Apr 2022 09:33:31 +0000
Received: by mail-pg1-x530.google.com with SMTP id s137so3533653pgs.5;
 Thu, 28 Apr 2022 02:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xAol5QruUmZ5P63tLTEq5XXd0IGdASrSG85VZ8UAHlI=;
 b=lYFnD9o6Fu/KxmPfhLdkQVUIHquoNV83EyB2bvo/yAyng6t8035r9ZRaHO/EDUbhDr
 GIzhEGfpvdkynLsaTT3W/M2RVKfmEvkP3GtbKOPCic0L8Bbw2CCFVOj9U41ojiIGsUY7
 8cnGZNjAOmeO4CA3nMcQFed9A1VdUuEWeJ2RTbkNjVqEVUMclNMGlffxLk/NKeQksK4v
 4Esa2bEUo7v01epTToF88KS/uCGRV7wIx07pxM8U/cY1rBfPFotEb1KyS7sT02OfGvfk
 xVgwkbRIQtNjY0JZo+Ik97LKGD1njnECB0L2W1SzHbP+MsQd4sU3s25Gr+IVfzRMJkt3
 tapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xAol5QruUmZ5P63tLTEq5XXd0IGdASrSG85VZ8UAHlI=;
 b=lkTACNuW5r//UukfV4rZ/+nwjlO+/6R4zz/BWp6XbNMsJRHO3vUKmZAPnE01KoHoN6
 fWAkVGY7DyRA1mB2qdr3GLB6lv0lBKG1jHR6kngoMBZJ8HTB/vBQc85a6NisqflzR/Ub
 VQl14XannciKaOMgmEc88u+HxxIQiDYRzo6ZLeDy3X5yx1urlc+SNuVug6DrZpGC4OOF
 Q/xqFdOTxCSPXnDTACm3zaBPA2wJaHLPWWLwOpzwRpPBJA65pykwJB97BRv6sdIAKsPE
 s3055Wk89v9xAekkYyKTg8j/tNsUr+QT/XSFoTo/kTB1IvNt96FlfxQY+xpinobTxmgZ
 uKbg==
X-Gm-Message-State: AOAM532l3mjmEC2dGcx/orBz499fgUcut5vewooL8BtJpp0FMhbABFlM
 U0MKJL+qJG51ZvRpR0KbAqk=
X-Google-Smtp-Source: ABdhPJxKCC/IUC9lzBFfGM+0qywfNnlKk+CMz8KkWBJm6kbeseVQM1NthVu3+iY3LR7DRgvCFa5m8g==
X-Received: by 2002:a05:6a00:238f:b0:4f6:b09a:4c63 with SMTP id
 f15-20020a056a00238f00b004f6b09a4c63mr33920186pfc.35.1651138407168; 
 Thu, 28 Apr 2022 02:33:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:2b1f:d169:337e:6359:8ff7])
 by smtp.gmail.com with ESMTPSA id
 i66-20020a628745000000b0050d36a5fe70sm15457932pfe.127.2022.04.28.02.33.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:33:26 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, jacek.anaszewski@gmail.com, gene_chen@richtek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] leds: flash: mt6360: Add mt6360 isnk channel hardwre
 breath mode support
Date: Thu, 28 Apr 2022 17:32:45 +0800
Message-Id: <1651138365-17362-5-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
References: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_023329_470746_138BB144 
X-CRM114-Status: GOOD (  23.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add mt6360 isnk channel hardware breath mode support.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/leds/flash/Kconfig       |   1 +
 drivers/leds/flash/leds-mt6360.c | 207 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 207 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 38b325c..039ff50 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -54,6 +54,7 @@ config LEDS_MT6360
 	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	depends on MFD_MT6360
+	select LINEAR_RANGE
 	help
 	  This option enables support for dual Flash LED drivers found on
 	  Mediatek MT6360 PMIC.
diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 8fe3dc4..b4a702c 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -7,6 +7,7 @@
 #include <linux/kernel.h>
 #include <linux/led-class-flash.h>
 #include <linux/led-class-multicolor.h>
+#include <linux/linear_range.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
@@ -24,7 +25,14 @@ enum {
 	MT6360_MAX_LEDS
 };
 
+enum mt6360_iled_range {
+	MT6360_ILED_RANGE_TRF12ON = 0, /* tr1, tr2, ton, tf1, tf2 */
+	MT6360_ILED_RANGE_TOFF,
+	MT6360_ILED_RANGE_MAX
+};
+
 #define MT6360_ISNK_PWM_MODE		0
+#define MT6360_ISNK_BREATH_MODE		1
 #define MT6360_ISNK_CC_MODE		2
 
 #define MT6360_REG_RGBEN		0x380
@@ -32,6 +40,7 @@ enum {
 #define MT6360_REG_DIM(_led_no)		(0x385 + (_led_no))
 #define MT6360_REG_FREQ1		0x389
 #define MT6360_REG_FREQ2		0x38A
+#define MT6360_REG_ISNK_BREATH(_ledno)	(0x38B + ((_ledno) * 3))
 #define MT6360_ISNK_ENMASK(_led_no)	BIT(7 - (_led_no))
 #define MT6360_FREQ13_MASK		GENMASK(7, 5)
 #define MT6360_FREQ2_MASK		GENMASK(4, 2)
@@ -39,6 +48,14 @@ enum {
 #define MT6360_ISNK_MODE_SHFT		6
 #define MT6360_ISNK_MASK		GENMASK(4, 0)
 #define MT6360_CHRINDSEL_MASK		BIT(3)
+#define MT6360_ISNK_TR1_MASK		GENMASK(7, 4)
+#define MT6360_ISNK_TR2_MASK		GENMASK(3, 0)
+#define MT6360_ISNK_TF1_MASK		GENMASK(7, 4)
+#define MT6360_ISNK_TF2_MASK		GENMASK(3, 0)
+#define MT6360_ISNK_TON_MASK		GENMASK(7, 4)
+#define MT6360_ISNK_TOFF_MASK		GENMASK(3, 0)
+#define MT6360_BREATH_PATTERN_CNT	6
+#define MT6360_BREATH_CFGRG_CNT		3
 
 /* Virtual definition for multicolor */
 #define MT6360_VIRTUAL_MULTICOLOR	(MT6360_MAX_LEDS + 1)
@@ -108,6 +125,46 @@ struct mt6360_priv {
 	struct mt6360_led leds[];
 };
 
+static int mt6360_gen_breath_reg_config(struct led_pattern *pattern, u32 len,
+					u8 *vals, int val_len)
+{
+	static const struct linear_range tranges[MT6360_ILED_RANGE_MAX] = {
+		{ 125, 0, 15, 250 }, /* tr/f12 and ton, unit: millisecond */
+		{ 250, 0, 15, 500 }, /* toff, unit: millisecond */
+	};
+	static const struct {
+		int rg_offset;
+		int mask;
+		enum mt6360_iled_range rid;
+	} params[MT6360_BREATH_PATTERN_CNT] = {
+		{ 0, MT6360_ISNK_TR1_MASK, MT6360_ILED_RANGE_TRF12ON },
+		{ 0, MT6360_ISNK_TR2_MASK, MT6360_ILED_RANGE_TRF12ON },
+		{ 2, MT6360_ISNK_TON_MASK, MT6360_ILED_RANGE_TRF12ON },
+		{ 1, MT6360_ISNK_TF1_MASK, MT6360_ILED_RANGE_TRF12ON },
+		{ 1, MT6360_ISNK_TF2_MASK, MT6360_ILED_RANGE_TRF12ON },
+		{ 2, MT6360_ISNK_TOFF_MASK, MT6360_ILED_RANGE_TOFF }
+	};
+	unsigned int sel;
+	int i, shift;
+
+	/* Must contain 6 tuples to configure tr1, tr2, ton, tf1, tf2, toff */
+	if (len != MT6360_BREATH_PATTERN_CNT ||
+	    val_len != MT6360_BREATH_CFGRG_CNT)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(params); i++) {
+		linear_range_get_selector_within(tranges + params[i].rid,
+						 pattern[i].delta_t, &sel);
+
+		shift = ffs(params[i].mask) - 1;
+
+		vals[params[i].rg_offset] &= ~params[i].mask;
+		vals[params[i].rg_offset] |= sel << shift;
+	}
+
+	return 0;
+}
+
 static int mt6360_get_selected_freq_duty(unsigned long on, unsigned long off,
 					 unsigned int *fsel, unsigned int *dsel)
 {
@@ -165,6 +222,95 @@ static int mt6360_set_pwm_dimming_param(struct mt6360_priv *priv,
 	return regmap_write(priv->regmap, MT6360_REG_DIM(led_no), dsel);
 }
 
+static int mt6360_mc_pattern_set(struct led_classdev *lcdev,
+				 struct led_pattern *pattern, u32 len,
+				 int repeat)
+{
+	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
+	struct mt6360_led *led = container_of(mccdev, struct mt6360_led, mc);
+	struct mt6360_priv *priv = led->priv;
+	unsigned int reg_base;
+	u8 cfg_vals[MT6360_BREATH_CFGRG_CNT] = {0};
+	u8 mc_reg[3];
+	int i, ret;
+
+	ret = mt6360_gen_breath_reg_config(pattern, len, cfg_vals,
+					   sizeof(cfg_vals));
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_raw_read(priv->regmap, MT6360_REG_ISNK(0), mc_reg, 3);
+	if (ret)
+		goto out;
+
+	/* Configure all subleds to CC mode first */
+	for (i = 0; i < mccdev->num_colors; i++) {
+		struct mc_subled *subled = mccdev->subled_info + i;
+		int ch_idx = subled->channel;
+
+		mc_reg[ch_idx] &= ~MT6360_ISNK_MODE_MASK;
+		mc_reg[ch_idx] |= MT6360_ISNK_CC_MODE << MT6360_ISNK_MODE_SHFT;
+	}
+
+	ret = regmap_raw_write(priv->regmap, MT6360_REG_ISNK(0), mc_reg, 3);
+	if (ret)
+		goto out;
+
+	for (i = 0; i < mccdev->num_colors; i++) {
+		struct mc_subled *subled = mccdev->subled_info + i;
+		int ch_idx = subled->channel;
+
+		reg_base = MT6360_REG_ISNK_BREATH(ch_idx);
+
+		ret = regmap_raw_write(priv->regmap, reg_base, cfg_vals,
+				       sizeof(cfg_vals));
+		if (ret)
+			goto out;
+
+		mc_reg[ch_idx] &= ~MT6360_ISNK_MODE_MASK;
+		mc_reg[ch_idx] |=
+			MT6360_ISNK_BREATH_MODE << MT6360_ISNK_MODE_SHFT;
+	}
+
+	ret = regmap_raw_write(priv->regmap, MT6360_REG_ISNK(0), mc_reg, 3);
+
+out:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
+static int mt6360_mc_pattern_clear(struct led_classdev *lcdev)
+{
+	struct led_classdev_mc *mccdev = lcdev_to_mccdev(lcdev);
+	struct mt6360_led *led = container_of(mccdev, struct mt6360_led, mc);
+	struct mt6360_priv *priv = led->priv;
+	u8 mc_reg[3];
+	int i, ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_raw_read(priv->regmap, MT6360_REG_ISNK(0), mc_reg, 3);
+	if (ret)
+		goto out;
+
+	/* Configure all subleds to CC mode first */
+	for (i = 0; i < mccdev->num_colors; i++) {
+		struct mc_subled *subled = mccdev->subled_info + i;
+		int ch_idx = subled->channel;
+
+		mc_reg[ch_idx] &= ~MT6360_ISNK_MODE_MASK;
+		mc_reg[ch_idx] |= MT6360_ISNK_CC_MODE << MT6360_ISNK_MODE_SHFT;
+	}
+
+	ret = regmap_raw_write(priv->regmap, MT6360_REG_ISNK(0), mc_reg, 3);
+
+out:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
 static int mt6360_mc_blink_set(struct led_classdev *lcdev, unsigned long *don,
 			       unsigned long *doff)
 {
@@ -273,6 +419,60 @@ static int mt6360_mc_brightness_set(struct led_classdev *lcdev,
 	return ret;
 }
 
+static int mt6360_isnk_pattern_set(struct led_classdev *lcdev,
+				   struct led_pattern *pattern, u32 len,
+				   int repeat)
+{
+	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, isnk);
+	struct mt6360_priv *priv = led->priv;
+	unsigned int reg_base = MT6360_REG_ISNK_BREATH(led->led_no);
+	u8 cfg_vals[MT6360_BREATH_CFGRG_CNT] = {0};
+	int ret;
+
+	ret = mt6360_gen_breath_reg_config(pattern, len, cfg_vals,
+					   sizeof(cfg_vals));
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_raw_write(priv->regmap, reg_base, cfg_vals,
+			       sizeof(cfg_vals));
+	if (ret)
+		goto out;
+
+	/* Toggle mode change to make new parameter applied */
+	ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led_no),
+				 MT6360_ISNK_MODE_MASK, MT6360_ISNK_CC_MODE
+				 << MT6360_ISNK_MODE_SHFT);
+	if (ret)
+		goto out;
+
+	ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led_no),
+				 MT6360_ISNK_MODE_MASK, MT6360_ISNK_BREATH_MODE
+				 << MT6360_ISNK_MODE_SHFT);
+
+out:
+	mutex_unlock(&priv->lock);
+	return 0;
+}
+
+static int mt6360_isnk_pattern_clear(struct led_classdev *lcdev)
+{
+	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, isnk);
+	struct mt6360_priv *priv = led->priv;
+	int ret;
+
+	mutex_lock(&priv->lock);
+
+	ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(led->led_no),
+				 MT6360_ISNK_MODE_MASK, MT6360_ISNK_CC_MODE
+				 << MT6360_ISNK_MODE_SHFT);
+
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+
 static int mt6360_isnk_blink_set(struct led_classdev *lcdev, unsigned long *don,
 				 unsigned long *doff)
 {
@@ -859,6 +1059,8 @@ static int mt6360_init_isnk_properties(struct mt6360_led *led,
 		lcdev = &led->mc.led_cdev;
 		lcdev->brightness_set_blocking = mt6360_mc_brightness_set;
 		lcdev->blink_set = mt6360_mc_blink_set;
+		lcdev->pattern_set = mt6360_mc_pattern_set;
+		lcdev->pattern_clear = mt6360_mc_pattern_clear;
 	} else {
 		if (led->led_no == MT6360_LED_ISNKML) {
 			step_uA = MT6360_ISNKML_STEPUA;
@@ -869,8 +1071,11 @@ static int mt6360_init_isnk_properties(struct mt6360_led *led,
 		lcdev->brightness_set_blocking = mt6360_isnk_brightness_set;
 
 		/* Suppose only ISNK1/2/3 support mode change */
-		if (led->led_no != MT6360_LED_ISNKML)
+		if (led->led_no != MT6360_LED_ISNKML) {
 			lcdev->blink_set = mt6360_isnk_blink_set;
+			lcdev->pattern_set = mt6360_isnk_pattern_set;
+			lcdev->pattern_clear = mt6360_isnk_pattern_clear;
+		}
 	}
 
 	ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp",
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
