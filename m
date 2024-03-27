Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD99C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iOYt4zJ+o1C7+SnoOb0q+ySfizskDZk97tdK1KywqY=; b=4/WAkuaylfnsbPOCo4XBtmBt1d
	ptJLbf5Hhc9ZuKoFkWUIXbDw4eeYZ4rxBeL62kDo/+oKPzJTmEpBId8uIWLVQzlkiY66f0dRY/6bI
	N9m1bbnPiBkyrJGviVgH22/Kb0l8f/777CnulpRzjJ1gokPFhYvygt/Z6W6Gnnpj6rsnYAr7Tvz95
	Cd5zRGbkjSW1aWm5CXj+JxYlSWI7CBoWEZwZlg7mvvVLQxeP/t1pPPXs6vnQx8VxQm6xdl2kAbif5
	DUyac4VyP1PfxxbQ+VYyqv3jsPyc+d6Kn2un4Lr+sFg8KK0KWld+JQWcva73KD+41DvSEKfhIuOUL
	5047C3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPM4-00000008Acq-2iRP;
	Wed, 27 Mar 2024 09:13:56 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpPLv-00000008AXJ-1PoX
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Mar 2024 09:13:48 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c3d404225dso1388124b6e.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Mar 2024 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711530825; x=1712135625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iOYt4zJ+o1C7+SnoOb0q+ySfizskDZk97tdK1KywqY=;
        b=WXf8TixmJEm+H4bfal3eWYuQBm7glhEfsnNx90AxXimHVznEfXuMa7+l8eNtB7t/JB
         pMTLi07V43lsZ9OeQKuHLIuLBwj4ZXQW+6O6IhldIx1NsElfhy29LtqW7zijwhAB0sry
         zlDuHBeMo7FBiBnHI4f+itoEYxnVyICtksQoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530825; x=1712135625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iOYt4zJ+o1C7+SnoOb0q+ySfizskDZk97tdK1KywqY=;
        b=b7HgAS9NAkQahjDi5jlP3r8U6J93nB8rxImYuQh2Y/110cBe29806S3l5m3vJZjnGj
         8VKvMCDBOILFEbFAFkRnZINowDSYaoj1kKRHhetZUlVAIw9VZA4h2xGipJjfEiZU75jk
         cMGw8WAupXnqzfTdPTPrTLDCPxTyn6Lwn2FU0zDwekeeyPXaQNuKhzwRIZBgTJtghyj4
         dts4pY3U8HDn3BN9fNlUXFut+ffPKBGgH3hAOliZYtKiAtSb5ILBk1mb6k2F8CjiIRse
         aiaoXxWq8wRwcM5z3ou4nAW5HBkqE5so1RWFbYIVTgWgvl1KYYAhnFX+qvlvL2C0t/k6
         03Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUNl5t7uvHGk8vulcb8AX0xBjk9XBsLPACYBZGgdKScoy6B0ipvxMlhgsgHOwPn4BXcKPu699jUCzeq5kY0TtB+Pyvjonug2dXyvSEXQ4LpqjDC
X-Gm-Message-State: AOJu0YwwXbNlNPJmbZIIQsUNMPHieYj/xkBd/xeB5zUzakTRTzua/MZ5
	/Y/Oh4uXSXpJ9Q7zJq/b2RdcA9fNu2Vdx99XeSYiYeltyPbUjmHkvYdgQ0vV/w==
X-Google-Smtp-Source: AGHT+IF3aqIva/K4jRimDmX4/NLQURpL14i8+mvF0x7rMtjQj5U78MiIs6pbbKkfU3lhicktx6j8iA==
X-Received: by 2002:a05:6808:319a:b0:3c3:878e:a43b with SMTP id cd26-20020a056808319a00b003c3878ea43bmr772486oib.44.1711530825181;
        Wed, 27 Mar 2024 02:13:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74c2:3606:170b:52f3])
        by smtp.gmail.com with ESMTPSA id fa31-20020a056a002d1f00b006e69cb93585sm7342911pfb.83.2024.03.27.02.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:13:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: mediatek: paris: Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE
Date: Wed, 27 Mar 2024 17:13:34 +0800
Message-ID: <20240327091336.3434141-3-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240327091336.3434141-1-wenst@chromium.org>
References: <20240327091336.3434141-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_021347_443535_B601D680 
X-CRM114-Status: GOOD (  19.62  )
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

There is a misinterpretation of some of the PIN_CONFIG_* options in this
driver library. PIN_CONFIG_OUTPUT_ENABLE should refer to a buffer or
switch in the output direction of the electrical path. The MediaTek
hardware does not have such a thing. The driver incorrectly maps this
option to the GPIO function's direction.

Likewise, PIN_CONFIG_INPUT_ENABLE should refer to a buffer or switch in
the input direction. The hardware does have such a mechanism, and is
mapped to the IES bit. The driver however sets the direction in addition
to the IES bit, which is incorrect. On readback, the IES bit isn't even
considered.

Ironically, the driver does not support readback for PIN_CONFIG_OUTPUT,
while its readback of PIN_CONFIG_{INPUT,OUTPUT}_ENABLE is what it should
be doing for PIN_CONFIG_OUTPUT.

Rework support for these three options, so that PIN_CONFIG_OUTPUT_ENABLE
is completely removed, PIN_CONFIG_INPUT_ENABLE is only linked to the IES
bit, and PIN_CONFIG_OUTPUT is linked to the GPIO function's direction
and output level.

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++-----------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 9353f78a52f0..b19bc391705e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -165,20 +165,21 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
 		break;
 	case PIN_CONFIG_INPUT_ENABLE:
-	case PIN_CONFIG_OUTPUT_ENABLE:
+		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_IES, &ret);
+		if (!ret)
+			err = -EINVAL;
+		break;
+	case PIN_CONFIG_OUTPUT:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
 		if (err)
 			break;
-		/*     CONFIG     Current direction return value
-		 * -------------  ----------------- ----------------------
-		 * OUTPUT_ENABLE       output       1 (= HW value)
-		 *                     input        0 (= HW value)
-		 * INPUT_ENABLE        output       0 (= reverse HW value)
-		 *                     input        1 (= reverse HW value)
-		 */
-		if (param == PIN_CONFIG_INPUT_ENABLE)
-			ret = !ret;
 
+		if (!ret) {
+			err = -EINVAL;
+			break;
+		}
+
+		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DO, &ret);
 		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
@@ -283,26 +284,9 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		err = hw->soc->bias_set_combo(hw, desc, 0, arg);
 		break;
-	case PIN_CONFIG_OUTPUT_ENABLE:
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
-				       MTK_DISABLE);
-		/* Keep set direction to consider the case that a GPIO pin
-		 *  does not have SMT control
-		 */
-		if (err != -ENOTSUPP)
-			break;
-
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-				       MTK_OUTPUT);
-		break;
 	case PIN_CONFIG_INPUT_ENABLE:
 		/* regard all non-zero value as enable */
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
-		if (err)
-			break;
-
-		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
-				       MTK_INPUT);
 		break;
 	case PIN_CONFIG_SLEW_RATE:
 		/* regard all non-zero value as enable */
-- 
2.44.0.396.g6e790dbe36-goog


