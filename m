Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A0EC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 09:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlsK9VG8JeEKnHO9SgYwlWP8w/10katNg0OpeVoez20=; b=fWrWL8HnBzUr8ji+iMozcDvcuS
	/qgNuqYYRWy1z/WHCSChtK0MoQN3e98NVHDL9WhQ4yN9mOi/tqeN0yzbeXUED3ZNiDu3reWsfwH2o
	mN31UtBU7Ce+bxiUNxr5h2GfCZz4NFYE2W5WF7HsR/RjqlbWsciXWotKXnAgFws1tkpM7nsG1tFmB
	L2lg4c/pXPLb03HyicE88WDsQhH3V7bQA4VT86wFiWbYS5EiRmdp9OYi1Iz8OSEOfNjwBYS1SXO9M
	fLlXZYiNcMDl6lB6sOGBaR7zVV1l4WeQ1lwfzoCFN5RAypv2gJHYdy8aLjZaJ5oao67/Uy8FF6NZx
	n6VcZS7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNW4C-00Dayt-Ki; Mon, 15 Aug 2022 09:07:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVz3-00DWx9-NP; Mon, 15 Aug 2022 09:02:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id ha11so6448906pjb.2;
        Mon, 15 Aug 2022 02:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VlsK9VG8JeEKnHO9SgYwlWP8w/10katNg0OpeVoez20=;
        b=NgYJIcAw4FudOOCMawiEuWZxFqtHcLtD3vTuACefn24x36dvXnEnGU6YsCMCZvznCH
         GLnntUk5VBxLiuWZNQmCAQyt5g/+GUNl7Gg7QUfvoJYiKcjEIkE4NZ/HaHzEM5ZA6Rh7
         DB2pajACx2I2PC9eKEsEfJRUTh0ae/AbI/O5one0dz7Mlo7wD9GBUH7371sBJF6ycVdQ
         OLKzuVsUuzj4bPAl6vTEkpBDy2x5UqluXmQ0zBibFHrizhSq03QvCHeKtuYJHWIttK/O
         LlgA4Ir+dgbnvecus2ZyMi/UWJgT6z2XL2wncomrP65IuBsT9lR0oKS8BMzhv7GTE0jo
         D6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VlsK9VG8JeEKnHO9SgYwlWP8w/10katNg0OpeVoez20=;
        b=BRt/HnIND/dqMjhWdeMDLSOZltpF8gUgWnrsLldllrCUYXZzzSJotyVJPzL/DHPzTA
         Rpwuk5mhgggcb+pKTg0lfb/xnsS+mgCvrftQWSM8Wr4VzQusmbxMtNepaAfNMmuJW2y3
         XsDEwHz4yX+W5CQZcwYfyJGk25DFnPzgIK6sEHUI+nfDg7L/zqYnmeSoYohWiLwJ/169
         JSlhBydpdt3Te9UAwBSd+NuUYbLX3uG59C8q0UArFqhjhbJmlSoA0KXY4lw70Ac+gGGe
         v6+Pz8CW8CGoWxHcNJ6LsqNU1fOB2gyGVRkBDoAjQtdo5QPHgPaxT+WZ9p2SV3iaKMEc
         xAuw==
X-Gm-Message-State: ACgBeo1KTMkgJINryCtXDbhY05hUy7VzsZ6SrnDeL+n6EiH2tBGwOaa7
	Wj8P0ssucAFZCKSmddSbkFg=
X-Google-Smtp-Source: AA6agR5Ex/q+cYEhdYO5Un2Dewa4DsqhifKbGnf09+BlibZOGwFs0rOgXHcTL2j+SCj1BLcwLBZ3bA==
X-Received: by 2002:a17:902:d1d5:b0:16d:d21d:abb8 with SMTP id g21-20020a170902d1d500b0016dd21dabb8mr16263105plb.138.1660554123106;
        Mon, 15 Aug 2022 02:02:03 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
        by smtp.gmail.com with ESMTPSA id a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 02:02:02 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: lee@kernel.org,
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
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	deller@gmx.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com,
	lgirdwood@gmail.com,
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
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v8 02/12] dt-bindings: power: supply: Add MediaTek MT6370 Charger
Date: Mon, 15 Aug 2022 17:01:15 +0800
Message-Id: <20220815090125.27705-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_020205_897280_C3217998 
X-CRM114-Status: GOOD (  11.50  )
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
 .../power/supply/mediatek,mt6370-charger.yaml | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-charger.yaml
new file mode 100644
index 000000000000..bd09a0af7e65
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
2.34.1


