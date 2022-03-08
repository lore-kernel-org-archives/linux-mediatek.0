Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD8CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4nlRl7jwDLr4GCWwW7+2yBq9GXYAlv9JmJluUj4lL0=; b=HNlSqoQw2u76TM
	fbEeM0gJ11M+MWbi4ytus+KLDABHWc7IAFLr4pES0GzYGFVyk2YSPv0FA2pFuJdGWzRfRfXhLRjiW
	L4Q075up2hlJuWlXeFHEp5teTYmi7IFGMy7ltsu6YkHRphERqOJhaJkr0lasBZy+D0N8WeSA9YSzh
	Byb5PpfGSlIBV/0gXrzO+DjfVbe1NXhlNT9k/ozxcv+3Fj3OHel4xX3Jat9jqHfTVZQGighNmoVNL
	fbr2cJI9kYVodQIfYOmqYOQTGmAD2EvkyQLN5bWWSVWtEe0n6tCuKhRvPZuazH/b0lrHRF+lXDuxC
	ydqyut4kjix90NLNJ2qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWzb-003pIx-L2; Tue, 08 Mar 2022 10:22:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnO-003kBW-Ao
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id z3so8132720plg.8
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1HzDn1y9bF4mL2TwPHFzwmvmpvjVc5+8wRjfSvBXPFs=;
 b=iX9EgdxUqNlM3gsr2/giz0GMRZ7bA8G6QFObBSKiSEpOkj2vpQRNOSg03hc6ae67fD
 2W+QPLh/2foXuuGGfi1XOmJyciVx+XHCljWyFIZihandnYlSuaMNn7faS/Bw9rSZRuyG
 yo0xpbSt3Y46GeTP+XGHuklHBz1XBxcsX5GE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HzDn1y9bF4mL2TwPHFzwmvmpvjVc5+8wRjfSvBXPFs=;
 b=HIqhYnbnOqF1RdQSUJliXxLv8ftlNeShHEqdRHWTRwJVmrdWCrB7QIjfPvRghRTSHz
 n19+b1ndmcysyoOwtaEAiosq7c0wUjffj8duKMS9avk3DzBG6KTE4wRTv4hwVMGHLVlT
 34Vyk2v/56gcIAAh2VJPdFxObYBkI51VqAYcbMKO3RcqARa1V0rBJpGQvMI9sak0mvrh
 fTswEXhNY4dcaHHZkWC/wBTs4Hj89YpcyBcHPqxsOpiPjUnKG+9SEgXuXAQbWwq2d5yN
 nqfkZBWQyG9WpVw0h/NjkCzbdQy/AKFxIGOS3FegAW7EUzbzX2CN+ZaKE2HCUJE5W36n
 ssIg==
X-Gm-Message-State: AOAM533rhKqcQRBmhJfS21aVSUO34eiPaW6V1sR6Y2inzy+g/bhvtW8l
 tEUS+1/VglAm+dH3hwHkEQ+0jg==
X-Google-Smtp-Source: ABdhPJyMrd0GH2X+Hm3rLZPvZtvquwQZkf1dabtzsGZyJ4pmxvqJFooM2QYqDOrllOdyMj2FrLUjmQ==
X-Received: by 2002:a17:90a:8987:b0:1be:dde1:c672 with SMTP id
 v7-20020a17090a898700b001bedde1c672mr3830895pjn.208.1646734220894; 
 Tue, 08 Mar 2022 02:10:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:20 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 08/11] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
Date: Tue,  8 Mar 2022 18:09:53 +0800
Message-Id: <20220308100956.2750295-9-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021022_501029_6746640A 
X-CRM114-Status: GOOD (  20.40  )
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

Some of the MediaTek chips that utilize the Paris pinctrl driver library
support a lower drive strength (<= 1mA) than the standard drive strength
settings (2~16 mA) on certain pins. This was previously supported by the
custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
"mediatek,drive-strength-adv" device tree property.

The drive strength values for this hardware are 125, 250, 500, and 1000 mA,
and can be readily described by the existing "drive-strength-microamp"
property, which then gets parsed by the generic pinconf library into the
parameter PIN_CONFIG_DRIVE_STRENGTH_UA.

Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
custom parameter around for backward compatibility.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 99 ++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 1ea3f3c54ef3..25d999848c2a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -48,6 +48,53 @@ static const char * const mtk_gpio_functions[] = {
 	"func12", "func13", "func14", "func15",
 };
 
+/*
+ * This section supports converting to/from custom MTK_PIN_CONFIG_DRV_ADV
+ * and standard PIN_CONFIG_DRIVE_STRENGTH_UA pin configs.
+ *
+ * The custom value encodes three hardware bits as follows:
+ *
+ *   |           Bits           |
+ *   | 2 (E1) | 1 (E0) | 0 (EN) | drive strength (uA)
+ *   ------------------------------------------------
+ *   |    x   |    x   |    0   | disabled, use standard drive strength
+ *   -------------------------------------
+ *   |    0   |    0   |    1   |  125 uA
+ *   |    0   |    1   |    1   |  250 uA
+ *   |    1   |    0   |    1   |  500 uA
+ *   |    1   |    1   |    1   | 1000 uA
+ */
+static const int mtk_drv_adv_uA[] = { 125, 250, 500, 1000 };
+
+static int mtk_drv_adv_to_uA(int val)
+{
+	/* This should never happen. */
+	if (WARN_ON_ONCE(val < 0 || val > 7))
+		return -EINVAL;
+
+	/* Bit 0 simply enables this hardware part */
+	if (!(val & BIT(0)))
+		return -EINVAL;
+
+	return mtk_drv_adv_uA[(val >> 1)];
+}
+
+static int mtk_drv_uA_to_adv(int val)
+{
+	switch (val) {
+	case 125:
+		return 0x1;
+	case 250:
+		return 0x3;
+	case 500:
+		return 0x5;
+	case 1000:
+		return 0x7;
+	}
+
+	return -EINVAL;
+}
+
 static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 					  struct pinctrl_gpio_range *range,
 					  unsigned int pin)
@@ -145,8 +192,35 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		if (!hw->soc->drive_get)
 			break;
+
+		if (hw->soc->adv_drive_get) {
+			err = hw->soc->adv_drive_get(hw, desc, &ret);
+			if (!err) {
+				err = mtk_drv_adv_to_uA(ret);
+				if (err > 0) {
+					/* PIN_CONFIG_DRIVE_STRENGTH_UA used */
+					err = -EINVAL;
+					break;
+				}
+			}
+		}
+
 		err = hw->soc->drive_get(hw, desc, &ret);
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		if (!hw->soc->adv_drive_get)
+			break;
+
+		err = hw->soc->adv_drive_get(hw, desc, &ret);
+		if (err)
+			break;
+		err = mtk_drv_adv_to_uA(ret);
+		if (err < 0)
+			break;
+
+		ret = err;
+		err = 0;
+		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
 		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
@@ -252,6 +326,15 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		err = hw->soc->drive_set(hw, desc, arg);
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		if (!hw->soc->adv_drive_set)
+			break;
+
+		err = mtk_drv_uA_to_adv(arg);
+		if (err < 0)
+			break;
+		err = hw->soc->adv_drive_set(hw, desc, err);
+		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
 		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
@@ -720,6 +803,8 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	struct mtk_pinctrl_group *grp = &hw->groups[group];
+	bool drive_strength_uA_found = false;
+	bool adv_drve_strength_found = false;
 	int i, ret;
 
 	for (i = 0; i < num_configs; i++) {
@@ -728,8 +813,22 @@ static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
 				      pinconf_to_config_argument(configs[i]));
 		if (ret < 0)
 			return ret;
+
+		if (pinconf_to_config_param(configs[i]) == PIN_CONFIG_DRIVE_STRENGTH_UA)
+			drive_strength_uA_found = true;
+		if (pinconf_to_config_param(configs[i]) == MTK_PIN_CONFIG_DRV_ADV)
+			adv_drve_strength_found = true;
 	}
 
+	/*
+	 * Disable advanced drive strength mode if drive-strength-microamp
+	 * is not set. However, mediatek,drive-strength-adv takes precedence
+	 * as its value can explicitly request the mode be enabled or not.
+	 */
+	if (hw->soc->adv_drive_set && !drive_strength_uA_found &&
+	    !adv_drve_strength_found)
+		hw->soc->adv_drive_set(hw, &hw->soc->pins[grp->pin], 0);
+
 	return 0;
 }
 
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
