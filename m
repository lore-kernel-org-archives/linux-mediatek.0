Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCB0C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQDJGZNgsqUtHpgMiFLZZA7/paFhPF+yVUYXcvVHSs4=; b=wnxoArRNwyzLrFCHbCo71X9jLz
	ac++NJRBIj6yuCr0WQk4c91nHKwgfze15FpWSX6c1N0mAqz8PEkLRAWbrTgS/ptP+lKgxUneEorTj
	NDmSaJd8xeWfWjmQRTP6L1aiuxLLOClYkILc5pMrGk09ei5MndJlApjPmrPTnLW/Bm6nofLCa/uZm
	mt0pNnqQ2zzI+z9pZVgU8Xuezn8+LCVkM1RH+KplxuVh8FK3qP/+1nDEzLb2NVGszUomNpXK00qra
	0R76rS/4IAuxWhvrpnPXPjSMao5bzMT3PfYt3MphWXhhccbpMSxe+j8KHfJhO/HGaM0WIIbiGrlfR
	bs+pBbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB1Q-0075kd-3h; Wed, 20 Jul 2022 14:49:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0I-0074hP-HW
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 14:48:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bv24so2589008wrb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 07:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:to:cc;
        bh=gQDJGZNgsqUtHpgMiFLZZA7/paFhPF+yVUYXcvVHSs4=;
        b=jWvb+ECCiickXJZCiLpfv+eAtXoL6RKmAzIinxV0NAV2ZFpFUzjSQMTGWH/ioJk54c
         WM+yJ0qYotLbZ7Ab3S4p4q5VPrOKdDw0IPyh6RKGkePFugxfcSfoLCKKVrhhZdLIbHYA
         YuKYzPBjY3Mo/28Q0U8+5FNBFkMy9YFyHVaDl+wjUAR267zKJlGW7I0dpgzcvYvvaQz6
         hKNBJz+CjbSJIp08nXtstVcxHE9BbQoA0WHlxZ9RWMEnCJlNY1tEMvAlfQIIJs31Khos
         witQDQ4775d0nxnh1BEviyI9PFhUz0t+fYPBaaO8a3avTfMXnpfMB0fvNGG5w2/id6yg
         JkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:to:cc;
        bh=gQDJGZNgsqUtHpgMiFLZZA7/paFhPF+yVUYXcvVHSs4=;
        b=ji1HnP0exQsKIDiWlJjNcVz49toCL1B2yr/3iMhctDSnv8FUCGPeF9j5asLWZQ5tND
         veju0SKJ3mTyTgucX+Vj6cTueOT+B0feqJkmMdgshBdNvD2E6zYtCnPnxNWgNUX0WBdL
         q2uiJJXgFEYhWE+vYXMuqXxjiLUvt8PyI7GSUP4vCTZRjssc1usFEn2P3fQU2yvjyiyM
         ttwXJkgz2pSMHtiIVm3Ul7v/0bdCcBzI34v8CvcmM1KCmjndEF6CDJkacB67FGOGLvAG
         JK5z0Y8XfB4FQgS7p1k7SE3f1XqXHqaA/p91QFvCTobxlxOkLuHiX9/xt/QEgzsuwbK/
         q6bw==
X-Gm-Message-State: AJIora95KXRhfd4+1QWW4bgwU2ful+RISQeI4/Y9uXt/o0POBsbMAW/m
	dPg7jeaWPddWFltK1CSDI5fTSw==
X-Google-Smtp-Source: AGRyM1vhz6wly+GUBEO58Zqu+ASDQ0cB1MEncpppa77b4G7K6pbiuEC/CLbU03zVZ2Y8w2dFJns6HA==
X-Received: by 2002:a5d:64e2:0:b0:21d:38e8:2497 with SMTP id g2-20020a5d64e2000000b0021d38e82497mr29420012wri.142.1658328522069;
        Wed, 20 Jul 2022 07:48:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:41 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 20 Jul 2022 16:48:40 +0200
Subject: [PATCH v1 4/6] Input: mt6779-keypad - support double keys matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074846_621488_8B945EAF 
X-CRM114-Status: GOOD (  10.04  )
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

MediaTek keypad has 2 modes of detecting key events:
- single key: each (row, column) can detect one key
- double key: each (row, column) is a group of 2 keys

Double key support exists to minimize cost, since it reduces the number
of pins required for physical keys.

Double key is configured by setting BIT(0) of the KP_SEL register.

Enable double key matrix support based on the mediatek,double-keys
device tree property.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index bf447bf598fb..9a5dbd415dac 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -18,6 +18,7 @@
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
 #define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_DOUBLE_KP_MODE	BIT(0)
 #define MTK_KPD_SEL_COL	GENMASK(15, 10)
 #define MTK_KPD_SEL_ROW	GENMASK(9, 4)
 #define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
@@ -31,6 +32,7 @@ struct mt6779_keypad {
 	struct clk *clk;
 	u32 n_rows;
 	u32 n_cols;
+	bool double_keys;
 	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
 };
 
@@ -67,8 +69,13 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 			continue;
 
 		key = bit_nr / 32 * 16 + bit_nr % 32;
-		row = key / 9;
-		col = key % 9;
+		if (keypad->double_keys) {
+			row = key / 13;
+			col = (key % 13) / 2;
+		} else {
+			row = key / 9;
+			col = key % 9;
+		}
 
 		scancode = MATRIX_SCAN_CODE(row, col, row_shift);
 		/* 1: not pressed, 0: pressed */
@@ -150,6 +157,8 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 
 	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
 
+	keypad->double_keys = device_property_read_bool(&pdev->dev, "mediatek,double-keys");
+
 	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
 		keypad->n_rows, keypad->n_cols, debounce);
 
@@ -166,6 +175,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
+	if (keypad->double_keys)
+		regmap_update_bits(keypad->regmap, MTK_KPD_SEL,
+				   MTK_KPD_SEL_DOUBLE_KP_MODE, MTK_KPD_SEL_DOUBLE_KP_MODE);
+
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
 			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,

-- 
b4 0.10.0-dev-54fef

