Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF01C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tD4ST1GLkFfCdHd4u8ts0UQsGiLNPqXx0HKCsoNVuT4=; b=of1B2Ce+ul7lwed6xXzCnX4lFO
	aUANW/+EVVWSYxLjHW1T3+SA3OSre0WYIYbC0/tMSfIWkkShTnvFBI9SGfKZ60mXKnNn49KuIabTZ
	V6QBoKcM7Sf8IP8xRyFSdd1rSTkg7OCWFKEOgne1gKR9zmZQFfMf2cJotzXXOAUz+IW/vYubk1/c2
	Ouas+czLm8HwvDeA0OG1MNRDIh4u16mT8UtIxotUuJQQNbL7yqlZynIrQuEPHVMmG6EOtcWOsnyqw
	O7DJOGF4x5ZoXB3NTxpGiAfV4k3Wed+JyNr2olIS5IIn35oX0fNFVkHmJFMNetomCqi+ndxmHQur/
	3J9Nt/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK8h-00HA43-AQ; Tue, 26 Jul 2022 12:58:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK71-00H8dt-3f
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id k12so2299418wrm.13
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:cc;
        bh=tD4ST1GLkFfCdHd4u8ts0UQsGiLNPqXx0HKCsoNVuT4=;
        b=W3PAGeT94Vn3xX26lGfe1+Mze8r0I2iBziCUdIepLwzWyJcCogiZ1vOTm0eHPt5klL
         rk+K65pbpke7ZjTLRiJSZFeTSCqP1pXtcRFVHOUCGaXTCF6U1V5r1rrLbk11gAw3M42b
         lRdieESewrHcHaGkUS4QBvUd0j6rWb9aR6oIG0q4HH5r3RDCL0fpZS4eMnR+GO5pskrZ
         ldCnwO1Oi+XTVgQhz32OdRTwJORQJNeyil4llKTmwhrRBT9Aoo6nC+n6uKwDFiBDmn5d
         rtFhkaCCD7enY/2GIdh8vExjEntnpuY7TS2k/hqRFQoZGJvv3h2Anv9EGjjkydWvZY4J
         H31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:cc;
        bh=tD4ST1GLkFfCdHd4u8ts0UQsGiLNPqXx0HKCsoNVuT4=;
        b=kBsE1wn7gljMpJj83B7/IPSd7VLc752Szdgfh24Hog9QR7zLWEFyRmNGdH+hgdmI6n
         mALPdUcK5uKWJOP1loNtBVPe/YJ3uJQwY5Nq8rWZiZxHnjsVQtcuylDjLq2JkNJYrBKV
         TQaQYWFgE9yrgZY5FWLzsd88DB2roBiExxwmQTYVraeA3XcoqG44ZsI8OWDUpzrbS5Eo
         KRy8+RTnV0aisLFY6n8PPgZz7BpPT3Jh97GPxnvntv5a0Ms723cZhiYzhOogFNcBhXc5
         yMCCCgD9E0wmowE0fpN8+Q59q3bH8bawHF2Oma1tOZgyQQhGVNwD3i5r33KJKAwiNYYN
         exBw==
X-Gm-Message-State: AJIora8gyGMg/fB4S+SanBt02LhV5Diep+47hDqkx9AQ/ZfCKr0ciM7X
	jym4F97cdC6+UzwVY29fzcdXVA==
X-Google-Smtp-Source: AGRyM1vGYy9Kw+JfFrw9aIUXm7WvvvklWWEd28eEP4n/Z10dPqxoPZS1XDoRwK4BuI36L3XZc42XtQ==
X-Received: by 2002:a05:6000:1d89:b0:21d:5655:eb72 with SMTP id bk9-20020a0560001d8900b0021d5655eb72mr10702395wrb.110.1658840193779;
        Tue, 26 Jul 2022 05:56:33 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:33 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:10 +0200
Subject: [PATCH v2 5/7] Input: mt6779-keypad - support double keys matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v2-5-6d42c357cb76@baylibre.com>
References: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_055635_232961_316D6A63 
X-CRM114-Status: UNSURE (   9.92  )
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

MediaTek keypad has 2 modes of detecting key events:
- single key: each (row, column) can detect one key
- double key: each (row, column) is a group of 2 keys

Double key support exists to minimize cost, since it reduces the number
of pins required for physical keys.

Double key is configured by setting BIT(0) of the KP_SEL register.

Enable double key matrix support based on the mediatek,keys-per-group
device tree property.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 39c931974bde..f70b02396de4 100644
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
@@ -102,12 +103,21 @@ static void mt6779_keypad_calc_row_col_single(unsigned int key,
 	*col = key % 9;
 }
 
+static void mt6779_keypad_calc_row_col_double(unsigned int key,
+					      unsigned int *row,
+					      unsigned int *col)
+{
+	*row = key / 13;
+	*col = (key % 13) / 2;
+}
+
 static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 {
 	struct mt6779_keypad *keypad;
 	void __iomem *base;
 	int irq;
 	u32 debounce;
+	u32 keys_per_group;
 	bool wakeup;
 	int error;
 
@@ -156,7 +166,20 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	keypad->calc_row_col = mt6779_keypad_calc_row_col_single;
+	if (device_property_read_u32(&pdev->dev, "mediatek,keys-per-group", &keys_per_group))
+		keys_per_group = 1;
+
+	switch (keys_per_group) {
+	case 1:
+		keypad->calc_row_col = mt6779_keypad_calc_row_col_single;
+		break;
+	case 2:
+		keypad->calc_row_col = mt6779_keypad_calc_row_col_double;
+		break;
+	default:
+		dev_err(&pdev->dev, "Invalid keys-per-group: %d\n", keys_per_group);
+		return -EINVAL;
+	}
 
 	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
 
@@ -176,6 +199,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
+	if (keys_per_group == 2)
+		regmap_update_bits(keypad->regmap, MTK_KPD_SEL,
+				   MTK_KPD_SEL_DOUBLE_KP_MODE, MTK_KPD_SEL_DOUBLE_KP_MODE);
+
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
 			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,

-- 
b4 0.10.0-dev-78725

