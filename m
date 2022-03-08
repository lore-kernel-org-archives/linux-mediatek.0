Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC731C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWgE3H8cCV6er7Yg5YT03t6rl+olQqLs4pCWSpf+UnA=; b=4XcnNIfQo1OJbB
	XitEuklczaR1ae8qPnWCTwHdNwmOHd8IU/INqj5mwOHqKKmSOcLCeERO9PEK/9a9GhRB87j1BWe4W
	Z2Ql7HZKMaQXuJGIC8YO0FcWNyLLzqQi3DcY480h+Rx+ZskWTfW0sTnhD3q5Xw2ODAKRfzoePenb9
	g36R0fkDWjlqyFJjXHTZ7de7sYoOEUKW8BjHp9+vOce9Z2gWjX3AW9vkiGs7h3tyQf3szTi9Yz7hi
	C+XwGqBV3q+gJwLHCfQRchkaXgjlbm9plOu8BIM0Db/ms+USi0rFpM1S6NGWxra/NRf9961FVC5Cy
	uYGDqWr7HYO9XPX6QMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRX0O-003pg0-El; Tue, 08 Mar 2022 10:23:48 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnM-003kAh-Ny
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:25 +0000
Received: by mail-pg1-x536.google.com with SMTP id bc27so16025104pgb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AN8AQlXUHY8dzoH7tRwXIxVaLJny20Q1qo/2QYSwxHk=;
 b=bvMT2jkFovcX32w1PT4TTZsspSO3e8SRTk4q/igiSkmk1cUsE98JgeoEY/AL+dcqqr
 jS34mDr+t3NiSxzysNh51S4J/5tPFK4zct+75oThi+ZUuqpucK6VNZsvlnz481UDatKe
 G827DuIdlh6BrRcFNn62siIpYzUjZpPJMfngo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AN8AQlXUHY8dzoH7tRwXIxVaLJny20Q1qo/2QYSwxHk=;
 b=S2pMY0lxMXdOXW7bUKqzFiFG/FLC5+/PsytodtPU+mQV16Gmdzs0L6RZIlydc+bpTi
 X+E0+Eg1u/XM6gGLai4nEkDjlhMMflyU2Zn8l/ucE5W8480rNzsDeo473Ovvad65ea5F
 1OytgSCIVdYy9mOoWSULVtVr3J/5XxXUd1gqF7yHhLp/UbvOtgxXS+9sDziVyQJ28hQO
 9q+Ye3OdN464XCyBr22hEleIJEmg/doHJRaeCOwzjuf1aK6PwGUPTo8YW/5ROc11xkDK
 FKdLBCbecr31UQGC/4GzDcdDXzLQn9QMmmYUpZdLeArX4byWkwRSR3haeWxG8iCIyOyL
 8X6w==
X-Gm-Message-State: AOAM531Re6uPsQ984cJOf21+R1qpk1sljj/6PFGjywfuvSzybq2rKeHd
 5EeVBml6X7ZlV3zUWjvUIwF/eA==
X-Google-Smtp-Source: ABdhPJwL9D+0SHRBS3XhC6nSpflTUI/0erBZkhgu01psg9Z8qe64mE6poyKANJlHUDzPcjgGtUO/Ag==
X-Received: by 2002:a63:2ccb:0:b0:37c:626c:d7e with SMTP id
 s194-20020a632ccb000000b0037c626c0d7emr13324616pgs.290.1646734218922; 
 Tue, 08 Mar 2022 02:10:18 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 07/11] pinctrl: mediatek: paris: Rework mtk_pinconf_{get,
 set} switch/case logic
Date: Tue,  8 Mar 2022 18:09:52 +0800
Message-Id: <20220308100956.2750295-8-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021020_855466_9BF3667C 
X-CRM114-Status: GOOD (  20.76  )
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

The current code deals with optional features by testing for the
function pointers and returning -ENOTSUPP if it is not valid. This is
done for multiple pin config settings and results in the code that
handles the supporting cases to get indented by one level. This is
aggrevated by the fact that some features require another level of
conditionals.

Instead of assigning the same error code in all unsupported optional
feature cases, simply have that error code as the default, and break
out of the switch/case block whenever a feature is unsupported, or an
error is returned. This reduces indentation by one level for the useful
code.

Also replace the goto statements with break statements. The result is
the same, as the gotos simply exit the switch/case block, which can
also be achieved with a break statement. With the latter the intent
is clear and easier to understand.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 144 ++++++++++-------------
 1 file changed, 61 insertions(+), 83 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 39487e0c2726..1ea3f3c54ef3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -79,37 +79,34 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	u32 param = pinconf_to_config_param(*config);
-	int pullup, err, reg, ret = 1;
+	int pullup, reg, err = -ENOTSUPP, ret = 1;
 	const struct mtk_pin_desc *desc;
 
-	if (pin >= hw->soc->npins) {
-		err = -EINVAL;
-		goto out;
-	}
+	if (pin >= hw->soc->npins)
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_UP:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (hw->soc->bias_get_combo) {
-			err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
-			if (err)
-				goto out;
-			if (ret == MTK_PUPD_SET_R1R0_00)
-				ret = MTK_DISABLE;
-			if (param == PIN_CONFIG_BIAS_DISABLE) {
-				if (ret != MTK_DISABLE)
-					err = -EINVAL;
-			} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
-				if (!pullup || ret == MTK_DISABLE)
-					err = -EINVAL;
-			} else if (param == PIN_CONFIG_BIAS_PULL_DOWN) {
-				if (pullup || ret == MTK_DISABLE)
-					err = -EINVAL;
-			}
-		} else {
-			err = -ENOTSUPP;
+		if (!hw->soc->bias_get_combo)
+			break;
+		err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
+		if (err)
+			break;
+		if (ret == MTK_PUPD_SET_R1R0_00)
+			ret = MTK_DISABLE;
+		if (param == PIN_CONFIG_BIAS_DISABLE) {
+			if (ret != MTK_DISABLE)
+				err = -EINVAL;
+		} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
+			if (!pullup || ret == MTK_DISABLE)
+				err = -EINVAL;
+		} else if (param == PIN_CONFIG_BIAS_PULL_DOWN) {
+			if (pullup || ret == MTK_DISABLE)
+				err = -EINVAL;
 		}
 		break;
 	case PIN_CONFIG_SLEW_RATE:
@@ -119,7 +116,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
-			goto out;
+			break;
 		/*     CONFIG     Current direction return value
 		 * -------------  ----------------- ----------------------
 		 * OUTPUT_ENABLE       output       1 (= HW value)
@@ -134,23 +131,21 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
-			goto out;
+			break;
 		/* return error when in output mode
 		 * because schmitt trigger only work in input mode
 		 */
 		if (ret) {
 			err = -EINVAL;
-			goto out;
+			break;
 		}
 
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SMT, &ret);
-
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
-		if (hw->soc->drive_get)
-			err = hw->soc->drive_get(hw, desc, &ret);
-		else
-			err = -ENOTSUPP;
+		if (!hw->soc->drive_get)
+			break;
+		err = hw->soc->drive_get(hw, desc, &ret);
 		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
@@ -160,23 +155,18 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		break;
 	case MTK_PIN_CONFIG_PU_ADV:
 	case MTK_PIN_CONFIG_PD_ADV:
-		if (hw->soc->adv_pull_get) {
-			pullup = param == MTK_PIN_CONFIG_PU_ADV;
-			err = hw->soc->adv_pull_get(hw, desc, pullup, &ret);
-		} else
-			err = -ENOTSUPP;
+		if (!hw->soc->adv_pull_get)
+			break;
+		pullup = param == MTK_PIN_CONFIG_PU_ADV;
+		err = hw->soc->adv_pull_get(hw, desc, pullup, &ret);
 		break;
 	case MTK_PIN_CONFIG_DRV_ADV:
-		if (hw->soc->adv_drive_get)
-			err = hw->soc->adv_drive_get(hw, desc, &ret);
-		else
-			err = -ENOTSUPP;
+		if (!hw->soc->adv_drive_get)
+			break;
+		err = hw->soc->adv_drive_get(hw, desc, &ret);
 		break;
-	default:
-		err = -ENOTSUPP;
 	}
 
-out:
 	if (!err)
 		*config = pinconf_to_config_packed(param, ret);
 
@@ -188,33 +178,29 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
-	int err = 0;
+	int err = -ENOTSUPP;
 	u32 reg;
 
-	if (pin >= hw->soc->npins) {
-		err = -EINVAL;
-		goto err;
-	}
+	if (pin >= hw->soc->npins)
+		return -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch ((u32)param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		if (hw->soc->bias_set_combo)
-			err = hw->soc->bias_set_combo(hw, desc, 0, MTK_DISABLE);
-		else
-			err = -ENOTSUPP;
+		if (!hw->soc->bias_set_combo)
+			break;
+		err = hw->soc->bias_set_combo(hw, desc, 0, MTK_DISABLE);
 		break;
 	case PIN_CONFIG_BIAS_PULL_UP:
-		if (hw->soc->bias_set_combo)
-			err = hw->soc->bias_set_combo(hw, desc, 1, arg);
-		else
-			err = -ENOTSUPP;
+		if (!hw->soc->bias_set_combo)
+			break;
+		err = hw->soc->bias_set_combo(hw, desc, 1, arg);
 		break;
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (hw->soc->bias_set_combo)
-			err = hw->soc->bias_set_combo(hw, desc, 0, arg);
-		else
-			err = -ENOTSUPP;
+		if (!hw->soc->bias_set_combo)
+			break;
+		err = hw->soc->bias_set_combo(hw, desc, 0, arg);
 		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
@@ -223,7 +209,7 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		 *  does not have SMT control
 		 */
 		if (err != -ENOTSUPP)
-			goto err;
+			break;
 
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
 				       MTK_OUTPUT);
@@ -232,7 +218,7 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		/* regard all non-zero value as enable */
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
 		if (err)
-			goto err;
+			break;
 
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
 				       MTK_INPUT);
@@ -245,7 +231,7 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO,
 				       arg);
 		if (err)
-			goto err;
+			break;
 
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
 				       MTK_OUTPUT);
@@ -257,15 +243,14 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		 */
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR, !arg);
 		if (err)
-			goto err;
+			break;
 
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT, !!arg);
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
-		if (hw->soc->drive_set)
-			err = hw->soc->drive_set(hw, desc, arg);
-		else
-			err = -ENOTSUPP;
+		if (!hw->soc->drive_set)
+			break;
+		err = hw->soc->drive_set(hw, desc, arg);
 		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
@@ -275,26 +260,19 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		break;
 	case MTK_PIN_CONFIG_PU_ADV:
 	case MTK_PIN_CONFIG_PD_ADV:
-		if (hw->soc->adv_pull_set) {
-			bool pullup;
-
-			pullup = param == MTK_PIN_CONFIG_PU_ADV;
-			err = hw->soc->adv_pull_set(hw, desc, pullup,
-						    arg);
-		} else
-			err = -ENOTSUPP;
+		if (!hw->soc->adv_pull_set)
+			break;
+		err = hw->soc->adv_pull_set(hw, desc,
+					    (param == MTK_PIN_CONFIG_PU_ADV),
+					    arg);
 		break;
 	case MTK_PIN_CONFIG_DRV_ADV:
-		if (hw->soc->adv_drive_set)
-			err = hw->soc->adv_drive_set(hw, desc, arg);
-		else
-			err = -ENOTSUPP;
+		if (!hw->soc->adv_drive_set)
+			break;
+		err = hw->soc->adv_drive_set(hw, desc, arg);
 		break;
-	default:
-		err = -ENOTSUPP;
 	}
 
-err:
 	return err;
 }
 
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
