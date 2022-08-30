Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FADECAAD1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 03:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=; b=Qc5PE7yRLaFAh/PeI+Np/jcSFj
	CK59GvTh1Lz5BcPtzdg0hUkNatYiCOkhVppjLTDXaUVoPhEQ5XI5dvdHd50wy3qq84cqgPTTTf7X0
	E3Lh8shXYId7/zDoIXgb2qUvmSxZhs7LZy0yGX8hrw0BHSndcRrRrWLNBYRsBTYaXizzCViGCHxdk
	lNOViYQzQEyuIdpZG95g8FPt4sVPuhAtZ8XWgs7RyfK4ppA5jS/iGRXubhNtehmxF8SiSh2gdhO0X
	olFmUou8X9ecIadoF2nw++T32YPozyHihHhq2NkJwJDmK8VwSXTUasjZdmY7LKlu7jc3EXvppXUvg
	2zcr2a0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSs8U-00DpaR-3r; Tue, 30 Aug 2022 03:41:58 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSs7c-00DpL5-TI; Tue, 30 Aug 2022 03:41:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 69so7866245pgb.13;
        Mon, 29 Aug 2022 20:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
        b=oYDP/wpYKn7pzGewiKACK5FOKw8n7vLOfV7cZBxZgfMSIrsBFhQkO8l1QVhmWMI8r3
         62NBdsLQuf/GHqFU682JYnhk9lZXH9I3QIGy7JKB6FEM1EDE+ovh9qwMjCvk+YFmO5Z5
         IEoSarywLDduua/FoP6kjI2eb/QSmrmbZdJidyc1hYjI7EXQRZWs/0nauJ2A3gmzZYn7
         xUNaujrgcr8PM6YGY2Abr4FVrhgSPBeyf1IPVi9E2cRvuH8vFL8OMnmE9pmr8YvBbXOd
         0JzKUhqpRIMCir28PfI21TexDx0+69xqdEc1q3aQDHAeGZTNLXozIm4AsbBUBM6XCZ8j
         uHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pmhuNMasJsnu7yKY0wuXEG96SXA8koMOiIgc3LgLhpU=;
        b=I+Be7nv4z7IZQYWQfrjPSQkQfsQGrkDFiJk8lqjng4I6hQhHQYpHoQ/8R8eTzlfPi4
         ORf1RApeeYleWySkZOp2yLax7PVfYAp3uaUuYVF3x/EoNHqEnAxxlyNSrf0GvNZmjZfc
         LcKsgbRR+boEP6yuTN/NdXxTKj4Fz4tHsY8iMZxIsk2JvGYhBYn+owtAHTCVT16LXTog
         O6h4cPznWP7DyMukHI/DgwoIJGq/YDLTsyCrxsAW/YJTVbXRT0JDy6xleWT1yyBkmA1p
         JHSIRAoFjYVGa6zMVyYbVzuaHjNXN08a/fki2L96evIVHyyMznw2VcgaAUV/gpEGoxu6
         5uqw==
X-Gm-Message-State: ACgBeo0wIzleSQYqmAjZtNwOH9on8RxMDHPkuYqEpX779MRmMzKH6zF0
	Vmao8TpbOCNB9fBkF7Hwmig=
X-Google-Smtp-Source: AA6agR4W65aG3rwOdbOAexC/xIrC4Aa2k2yS38nDD0ciGVsBe+dmlZO2Xab8SX3NLTOzf53VDROejA==
X-Received: by 2002:a63:e74e:0:b0:42b:609d:3275 with SMTP id j14-20020a63e74e000000b0042b609d3275mr16198235pgk.443.1661830861964;
        Mon, 29 Aug 2022 20:41:01 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-77-88-242.emome-ip.hinet.net. [42.77.88.242])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm8439577plh.170.2022.08.29.20.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 20:41:01 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com
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
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	andy.shevchenko@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 01/10] dt-bindings: power: supply: Add MediaTek MT6370 Charger
Date: Tue, 30 Aug 2022 11:40:33 +0800
Message-Id: <20220830034042.9354-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_204105_129852_7D16F115 
X-CRM114-Status: GOOD (  11.46  )
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


