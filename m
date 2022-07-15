Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C074C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtO+yg7Wi4JSj3ZmHONhdPt1sUn6ZtFJMnIAL1+O4g0=; b=xCQ9KmCSLLmTil+MzpcGxViUgc
	gOdIFkGLRMUsdKak5Ypl/TKq5SQXxqJmpHGn3inIQmr3XkYTOz7f0Ox54l+QKLzOpiHM7nYKJULJQ
	8Q4GQ+/niWshqALg7fofXx6Yj2+0mbIGmLmWWvzx3k2mGdconN+c6up1uP9EHrKU8OmJRBXMJSPP5
	MXWnLFOHLF+kIhEdr+pm8UXeycXwqn0O+Mqb5xHndYj16KS2jxqDDFiU/EocTTsyuM3r87CevVr1M
	t2yvSpwer2aZxJf7PhOPRI/8zKTQNnZU5Y+k44LOxIhYS4tRscM1bRbCRAc8nKnwknbmZOFsCxoGW
	cYKqohtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJTJ-006Yvh-7m; Fri, 15 Jul 2022 11:27:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJSv-006Ygz-4S; Fri, 15 Jul 2022 11:26:38 +0000
Received: by mail-pj1-x102b.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so11253482pjl.5;
        Fri, 15 Jul 2022 04:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RtO+yg7Wi4JSj3ZmHONhdPt1sUn6ZtFJMnIAL1+O4g0=;
        b=MxhXhpk7Ks0RWEvd9kFA9v3SZ8AzSin2yjmbK6C1k369LpIP0hKZupdIq0qEl0dte5
         i9TBORRgmpb/z/CAyA8YHTgT91PSqkfn6wTbXD2mezNTndRRe79UQowzeMFniVFItM+d
         chN7ZH9k41k9o22X3/RxGomlrOdokzIkSq2INwkk4u4RFHm4XYZg4x3Ykj3f7h+njCMI
         hRfAdAvEZ1bAcCSf/NcKMoj6lE62CBTRW1sVW5vX3HUmztLYV8+cpI8QfkG1i/If0sSf
         h6gjbnkwrWsUGpaJvyfXFastJKJdEnkJG86eFBgFxOzpXYuxj7l5kp/MF4vwSlWGZGhk
         lP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtO+yg7Wi4JSj3ZmHONhdPt1sUn6ZtFJMnIAL1+O4g0=;
        b=lh6Qqkh1kLbvH4ncitmCMaRqnFk0ea7h0gMj8rbWg9/6WtboOLzs5/9KbZRWySJ6wc
         4FhF3mbWzD3ZXXEoEZ9/HbpN1Bw8iyti6fVB5dJqFdGvcMnoM/dAoGZ4VDdWn6r6zZ5+
         J72KREoakoxqjT5ozceB+jE99pJxkjmt5r7a4aRxyrV7qhiwNJfpyIyPhUPLiiWtiux3
         Ujxvuk4quFmNOEMLFIh2f220xZbY05W8JLFRxnHnolDq/jKDGk4LInO1e+tczso7hLuC
         xReh+pF9+92gycWSC1nryHGhWKZ3p+d6hD14YfXSDPVt6D65FKESRuG9c6cK2wVLDsWi
         0g8g==
X-Gm-Message-State: AJIora8njeoU+vu4gAfR/6FAtVY7FRm+yBeMmqW6sYI4hhtnaiOdNVAw
	jHWNs1XsYEriYdRWPc9Rbbk=
X-Google-Smtp-Source: AGRyM1sFeRtrbGN2hqRqxJUOt5WA81Ct6iRVr9pZJ5dkJiTPbuxUedwsmxzgqDnxutg/Gx+lwHQrUQ==
X-Received: by 2002:a17:903:1109:b0:16c:b5e7:652f with SMTP id n9-20020a170903110900b0016cb5e7652fmr6278114plh.142.1657884394006;
        Fri, 15 Jul 2022 04:26:34 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net. [42.72.159.86])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:26:33 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 02/13] dt-bindings: power: supply: Add MediaTek MT6370 Charger
Date: Fri, 15 Jul 2022 19:25:56 +0800
Message-Id: <20220715112607.591-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_042637_220328_C2BA24CC 
X-CRM114-Status: GOOD (  11.84  )
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

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../power/supply/mediatek,mt6370-charger.yaml      | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 0000000..bd09a0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,88 @@
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
+      Specify what irqs are needed to be handled by MT6370 Charger driver. IRQ
+      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCTRL_UVP_D"
+      are required.
+    items:
+      - description: BC1.2 done irq
+      - description: usb plug in irq
+      - description: mivr irq
+
+  interrupt-names:
+    items:
+      - const: attach_i
+      - const: uvp_d_evt
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


