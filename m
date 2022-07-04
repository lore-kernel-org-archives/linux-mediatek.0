Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C1EC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 05:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2096TrnLrOi6TQb9sd3IJckHfJM0dfj6pjilL2XtYM=; b=ujalEWFesx3DHQysuiIoG7YX9/
	mlvPQvFMszlhjHH/zErCxwmQrYqFIHGqTdMCK8ZtEGY6yi8EIVuUihfjZd4z8Fert1YNbW04k2U99
	3eD/FN6A4WLrMBp2NOx9zVaNRCaVh4HU5EhmW9QzkfRf2/2X+P0+XoZJWe32jGx7iDym6/b5TYkPK
	aBidJprXzZe20RhC+Ad+18zgxe1iR0j5/jjxLOiF5kdJvOLT7LCgSDLHPxIKSQQPbG6iIthHI6sFF
	e3sEQz/8BHj/S4Pdcoo5yKhB/rmxjSE1kGN8lnlWuaJ4BgbTmnoJeXL+8UpdSg7KYYm+kh8pj9OhH
	F/X6G8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Eof-0053z9-Ir; Mon, 04 Jul 2022 05:40:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Eo9-0053dP-AP; Mon, 04 Jul 2022 05:39:42 +0000
Received: by mail-pj1-x1035.google.com with SMTP id o3-20020a17090a744300b001ef8f7f3dddso7592pjk.3;
        Sun, 03 Jul 2022 22:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F2096TrnLrOi6TQb9sd3IJckHfJM0dfj6pjilL2XtYM=;
        b=pjM3xzgFjRLnvs0GNNP7U7Ho1tjYTsycSoDgKS+B8pXnIAlALkP94GE39gDetj0q3s
         NTdLpK4M5lo/Sw1JSPl6flBHrQpzwzPuTUO/oFUoxkwrdcqFGMjOM5JVz3VDzgxGHbZX
         j/YUkTWidr9mv27vyO2xCaoeyp29+CwrnHrOINV9dyWRWaNAsCrwotcp5abLEdUyzhpW
         rHxVpdqjUzBAo0jSILyNfqWgGjwXkDZY7tZPwB+XqgH+b6vw5n5ytQUHfwIrIPsBVlNs
         xJRlgMNzPZjsJqMU2/cO8lexo9LRf8L+Jhp2WT5G0ZRUS+rQBTm0FwBlEiGWve+uP9Zs
         eGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F2096TrnLrOi6TQb9sd3IJckHfJM0dfj6pjilL2XtYM=;
        b=KmbDMCLjUbELYBZpNWJWsIDBV0tHcA8pllcGa7omGyP2qXEzRjym38x0ey9GN+TWl5
         TIjCH3NSK1Q0UjHVPxWefI4HfCvgxOJMzNU8PtryfivmBAtbgYCilMCnRjuOGI7ie873
         42ZJcY5RuWh/4wHcK4MZ31dELlZkZPxPILr5O8vGXaC2jpDFOKdkNSDJZJdrTIbfk/hK
         fmJ4Pfw8acuNRhkycc+jhT3KiFu1fRv8RGHgjwwz2P3CM3qJICJ46IjC4B4XFpPmdqYi
         Q3CR5/TesO/T807GVIwh96aDgRwx9wEQtK9/mqQ9dOI218dsezE9rE/WpoSfVrXnX/cW
         mLtw==
X-Gm-Message-State: AJIora9IO0jourjVBxl6FqYPto5cw5J81LQ7EZfISwOvaOpJo4Cf1AfM
	m+PQDemYshrSawW5ra7rVXQ=
X-Google-Smtp-Source: AGRyM1sH6S0WrfyDcm8NZMoUo/7mjXv+ixMV1mBqBrskO5QOtg8rGX9FFCrdxOCNJMaAXwW18XTOfg==
X-Received: by 2002:a17:90a:af98:b0:1ef:1d10:c052 with SMTP id w24-20020a17090aaf9800b001ef1d10c052mr33374468pjq.111.1656913180400;
        Sun, 03 Jul 2022 22:39:40 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-4-255.emome-ip.hinet.net. [42.72.4.255])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm13904507pgb.16.2022.07.03.22.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 22:39:40 -0700 (PDT)
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
Subject: [PATCH v4 02/13] dt-bindings: power: supply: Add Mediatek MT6370 Charger
Date: Mon,  4 Jul 2022 13:38:50 +0800
Message-Id: <20220704053901.728-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704053901.728-1-peterwu.pub@gmail.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_223941_382708_037ECFBD 
X-CRM114-Status: GOOD (  12.53  )
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

v4:
- Add minItems of "io-channel-names"
- Replace text "Mediatek" with "MediaTek"
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


