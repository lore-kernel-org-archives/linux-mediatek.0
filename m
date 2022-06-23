Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A062C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUBtsagIsVkX8Y3XaZ3P+E6UwRwPnXULrf1i7+CDAYk=; b=WMs6ZJDrbbHAWo7CddXPdc0/GF
	zS8n6s5fxS8kv5qkAawYsOk7QLGP25fYiu+rXWulh+jlEQ9Fj+5srF6jrV30T7jAzfVkFcuu0GlN6
	8DxT3fdpghatelW6Djrpa/p9Er1RTomcZE6+yJTYL+nTqXViZRnaJQT9PTYr/TLrh1USmm7ZyMpAY
	5NWY7GfhJAt7b+aHPUEROqt0zKiVBOq0vZ2xJnyXZPQ+3LtWtPo447ytGPRmj4Y8BuhNYfJy4uMbx
	y+UMLbyQbJoicfjq9gFxd+zhaM0BjRlDGRh0jL6uAEfT0tGA+mVmB0bLtmK32FvGJ3e9gNYZUyUju
	rsTJKC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LTA-00Eo86-7p; Thu, 23 Jun 2022 11:57:56 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LSb-00Enjg-Tl; Thu, 23 Jun 2022 11:57:23 +0000
Received: by mail-pj1-x102a.google.com with SMTP id n16-20020a17090ade9000b001ed15b37424so451473pjv.3;
        Thu, 23 Jun 2022 04:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pUBtsagIsVkX8Y3XaZ3P+E6UwRwPnXULrf1i7+CDAYk=;
        b=HUqGrLrAyQxEgyQxCKoJIayS2tvkFNjWmplRFdMK1iO8SGvV4tEinbq75vS0cBu5PL
         XgH273UsGvrqERUSGbu1r2oXrED2leZrGYtEVo7qB3dvfMdJkIM4QNUiOCViKrqBKKgX
         +qDBGXPT+Bmxkeqj6riTOkA5nfRjIzvi0v/2xZQ94J62XosDTuvDJ+1o441hzQbp4wEi
         1sp+DfsLwVjXFCMItlbeV6Zp3Fjs1t673VTr81jY6v6sDO5ISthwJ7oAib9DPrpPwqEB
         gJxrgu+AL5vyQnvSC5RyMwUirmtWNXgEGoSuXIIfbAFnbcho4bJx66zLGRJtwJyw6vHI
         38Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pUBtsagIsVkX8Y3XaZ3P+E6UwRwPnXULrf1i7+CDAYk=;
        b=dWo4O5fS1WJVi+x45RfKbL/LdYLIVUZzV9skQtI9TtOxqR433wsO1I6ln73fwY0mcg
         pU3+4GiepXYyZsnnTH9kBtKRcHE1op5HKyBvQD6ikf8hGqg/MqVwworgThSuP62t9TUM
         5UUZjC8nSmeYjnCis/hk/BuspgiwM6SwQv+5IVZYW0VpmtmuT8i1+NhSf8i5ZSa+6WSq
         A6hWuE7he8A2/fVWypm4F1JGP4yx3He19DT0nZeHIl04zBxP6FmMng8KfACid4FGjyTF
         DO+iQ+DeL57v9tmrtcNyN5uHPyoa0A7rknfiACYy8GK7FV4a66TLK7op9Dr5KMz93J1z
         4OpQ==
X-Gm-Message-State: AJIora+qzKd7nFIpAbOMXtUbxzYnwJegIDIGIS9oKBRrabuytunELcdY
	M26kZd6oGAz5XXFnmOzGQWk=
X-Google-Smtp-Source: AGRyM1vhaWgaoShKoMGABtGUhnYLtLbNBz5rjPqyBvlkLjDrmroIA6VhBGVRXbYC4LbB1KTob0Elvw==
X-Received: by 2002:a17:902:ea04:b0:16a:1f33:cb0d with SMTP id s4-20020a170902ea0400b0016a1f33cb0dmr21465257plg.103.1655985437347;
        Thu, 23 Jun 2022 04:57:17 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net. [111.71.94.93])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:57:17 -0700 (PDT)
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
	szunichen@gmail.com
Subject: [PATCH v3 02/14] dt-bindings: power: supply: Add Mediatek MT6370 Charger
Date: Thu, 23 Jun 2022 19:56:19 +0800
Message-Id: <20220623115631.22209-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_045722_009887_E27A371B 
X-CRM114-Status: GOOD (  12.59  )
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

Add Mediatek MT6370 Charger binding documentation.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---

v3
- Add items and remove maxItems of io-channels
- Add io-channel-names and describe each item
- Add "unevaluatedProperties: false" in "usb-otg-vbus-regulator"
- Rename "enable-gpio" to "enable-gpios" in "usb-otg-vbus-regulator"
---
 .../power/supply/mediatek,mt6370-charger.yaml      | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 0000000..f138db6
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6370 Battery Charger
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


