Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01786ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJZ/oJ0LmKZrFDGAJdP7uLjsccIJ2kxypc2pDmCPi/o=; b=MJg5Q3EJyYPj6Qu4nkoC0IJllO
	CpF3fDNVx7mWoLJoQrao3XOIb87l0i1M9zsKeGd4D+sPX6nszft0I7GvlK2g3vV+pJfA/uWsdGxD4
	WQ8jb1ZqQm29chC9D0gxvXjedXz1J6UVNO9pD1bdq1fT/PmwvSVflFYPeSWqqdOKEECxp0jw/n+Bd
	EMD4BPJ9sa+p1J78B39AQ0Pd8KjJSJqjwgh3fnkA/5TW0UE6/R4g5yVSY3c2kgqbzBtXJJ5Nk7GYn
	jpq/Y6GfSooM7mXOuXQ65tQhFzzmYH0rQ/93WPHc7aoA/1ke/BuO7ITjiFQaP/osf+zKzX8+NJi4E
	FBEtz1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlV7-005j8Q-VG; Thu, 15 Sep 2022 09:49:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlUR-005iXB-0I; Thu, 15 Sep 2022 09:49:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id x1so17821615plv.5;
        Thu, 15 Sep 2022 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YJZ/oJ0LmKZrFDGAJdP7uLjsccIJ2kxypc2pDmCPi/o=;
        b=lV4OkWpt12wnKoW6s9O6R47dmV7GKJ+iG+pGU7p74u5q2X3CI8u2yC5cfNBZDr5xVk
         NhI0HVs8Rt1TNXdPbeMySKU/ke7pEumaRcZxVnglYXFtoip8JAzZ4yf8LfM2QcTcLAHN
         ntCsrvh6V5OfR20wilfrZ+U+1oq2EyL+QlKMvIwQqkKUdhUJPPGvSnS6kVNbVYvjqSf8
         3Dtwej4d347LB/nG58FmnvKfH61oTjTra2szZp4C+w2lzslZ6gwheua6khZrzyJcfoqS
         0PUxaO1VnEinq6vfAxm+v6EQI5NKdZ5a9TXfT5w3O9yyvdx+lYUuRnwCVDNXeSsmS1n5
         R+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YJZ/oJ0LmKZrFDGAJdP7uLjsccIJ2kxypc2pDmCPi/o=;
        b=sJarWMnrBZHAuXcTrc3hXSV/O/jOvrltOtgbmdNfl2z3Aq5xfZ/J0Fhqdk5gLEhVDw
         BsWwklOOrJoz0N8RBCgEynQQzNxeyf6rgd6A2EZSFBG73LXfEECeQd54FhGBCt5OQaJO
         2t/TZ36jJPeIHfLyE2P/8s6ZwJdvbCVHFmJnyYxf/FA/irMN2LPCLyYzFcw86tfhSuwB
         OBGLwAEszpRQ/g94S3zgNV7K7dtrTlabnq+aYkQYLeFNCmuvnKM0H5t8L0qTxMCQ8JBh
         U05/54MGgRAyGclb3/TJQpmNFnv+OCviA6iXSI9seKmCGhtTOR+++Z5A5WhfIMI1pV3B
         YVHg==
X-Gm-Message-State: ACrzQf228lluChnNUJlobO40gT3vHNm46pMNg3Pd0NeRL6TiS6PuwHPi
	BG2hanWAzqUj5LJI3xZCldz9kY3d2oI=
X-Google-Smtp-Source: AMsMyM7Km2Yy5YowQOjMN6xN5IT17fSs/eADlQaLVHxDP0xjYVs6KZ6Q/fgN4nx4cDUhd2TCHtu8Ng==
X-Received: by 2002:a17:90b:4f89:b0:202:8e4a:addd with SMTP id qe9-20020a17090b4f8900b002028e4aadddmr9622786pjb.131.1663235336027;
        Thu, 15 Sep 2022 02:48:56 -0700 (PDT)
Received: from RD-3580-24288.rt.l (114-137-177-189.emome-ip.hinet.net. [114.137.177.189])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b00176675adbe1sm12669010plh.208.2022.09.15.02.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:48:55 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 1/8] dt-bindings: power: supply: Add MediaTek MT6370 Charger
Date: Thu, 15 Sep 2022 17:47:29 +0800
Message-Id: <9382254831bb6ed8c228398a68896b0e8e61c7c4.1663254344.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663254344.git.chiaen_wu@richtek.com>
References: <cover.1663254344.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_024859_116566_E7476E46 
X-CRM114-Status: GOOD (  16.25  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add MediaTek MT6370 Charger binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
v11
- Add more detailed description of irqs.
- Adujust the order of irqs
---
 .../power/supply/mediatek,mt6370-charger.yaml      | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 0000000..fd491c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6370 Battery Charger
+
+maintainers:
+  - ChiaEn Wu <chiaen_wu@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
+
+properties:
+  compatible:
+    const: mediatek,mt6370-charger
+
+  interrupts:
+    description: |
+      Specify what irqs are needed to be handled by MT6370 Charger driver.
+      We need to use the IRQ "MT6370_IRQ_OVPCTRL_UVP_D" to know when USB
+      is plugged in, and then the driver will enable BC1.2 detection.
+      After the hardware of MT6370 completes the BC1.2 detection,
+      IRQ "MT6370_IRQ_ATTACH" will be triggered, and the driver will know
+      the result of BC1.2 detection.
+      When the IRQ "MT6370_IRQ_CHG_MIVR" is triggered, it means that the
+      hardware enters the "Minimum Input Voltage Regulation loop" and
+      a workaround needs to be applied at this time.
+      In summary, "MT6370_IRQ_OVPCTRL_UVP_D", "MT6370_IRQ_ATTACH" and
+      "MT6370_IRQ_CHG_MIVR" are required in this charger driver.
+    items:
+      - description: irq of "USB is plugged in"
+      - description: irq of "BC1.2 is done"
+      - description: irq of "Minimum Input Voltage Regulation loop is active"
+
+  interrupt-names:
+    items:
+      - const: uvp_d_evt
+      - const: attach_i
+      - const: mivr
+
+  io-channels:
+    description: |
+      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
+    minItems: 1
+    items:
+      - description: |
+          VBUS voltage with lower accuracy (+-75mV) but higher measure
+          range (1~22V)
+      - description: |
+          VBUS voltage with higher accuracy (+-30mV) but lower measure
+          range (1~9.76V)
+      - description: the main system input voltage
+      - description: battery voltage
+      - description: battery temperature-sense input voltage
+      - description: IBUS current (required)
+      - description: battery current
+      - description: |
+          regulated output voltage to supply for the PWM low-side gate driver
+          and the bootstrap capacitor
+      - description: IC junction temperature
+
+  io-channel-names:
+    minItems: 1
+    items:
+      - const: vbusdiv5
+      - const: vbusdiv2
+      - const: vsys
+      - const: vbat
+      - const: ts_bat
+      - const: ibus
+      - const: ibat
+      - const: chg_vddp
+      - const: temp_jc
+
+  usb-otg-vbus-regulator:
+    type: object
+    description: OTG boost regulator.
+    unevaluatedProperties: false
+    $ref: /schemas/regulator/regulator.yaml#
+
+    properties:
+      enable-gpios:
+        maxItems: 1
+
+required:
+  - compatible
+  - interrupts
+  - interrupt-names
+  - io-channels
+
+additionalProperties: false
+
+...
-- 
2.7.4


