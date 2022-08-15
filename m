Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEB5C00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLncMqn5cD6+J/xX/xBdFyZqAOyug656xJDHPfwOkJA=; b=T3UBNfEhF/Av2O85mXXQj/Y/9/
	wPBWQrLWl7xsWKDWBK4sYFYFYLGRgxN5MBaAG+dr9GOlj4HAEP9UR7Wsw7A7SZHyJFzEhenk81oQp
	6bfx6V7vK72MYvOTw92IhVpXaTlmF3WyxZoGgCk2/pGzlULhmLTQOMoeRmkUkpLHMGu0kDehNtgs8
	xkqhEa12P0XiuZNx+q2GHc9IjLrfMWJpDQSR72VYBKB8lojVgwfHB6O9/RQ4/UBiYxNGRZPRG+aR5
	cOxr1xJdc+MHAh/BcXiM07PmvcLH7bhvMqqfi5ADRFg0En0rPjWvQYCb1+nx8WbHw5JpvQKyk7NqN
	ED4uDCqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNW5P-00Dbzx-EG; Mon, 15 Aug 2022 09:08:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNVzB-00DX4Z-HL; Mon, 15 Aug 2022 09:02:22 +0000
Received: by mail-pg1-x532.google.com with SMTP id d71so6015378pgc.13;
        Mon, 15 Aug 2022 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=bLncMqn5cD6+J/xX/xBdFyZqAOyug656xJDHPfwOkJA=;
        b=B3PG0JekDy3pCohcjyZlsPZudH+m/iJ1KWaYWvohvsPxeOPhjsADSikmXZzn7BKP7E
         lLS4kEpcONkErZml7Bnu0PKDS4hcf5JXDwIGYBVzyq3vmPB3tZguxDHAIlFrBsqL1y/v
         T0R5r8u+2vTD6MYbvzU7sgbO12EE/MZh/9u2GIcOyP4xoAlRANwEIA0embBg4huJxb0j
         IkBAqpOiE69ZZKp+8Fp+A+QMwT7z2x2fPAtZYha4wvxhJrNpcudNMv77grRHrwMcH9nM
         m5DWGqKTbfO35oAdRaync3CM+JBI4/tLiclNU4Yg6+rwjeXBqEHBi1o5QX3bbq/6JAzt
         30RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=bLncMqn5cD6+J/xX/xBdFyZqAOyug656xJDHPfwOkJA=;
        b=aLUKvX0Zk63IFs8CuOCqfHRhlX+nH/4LF1Da2ZtBlSPLAu0VQZYdLLoQo4LUQD6CmN
         wBF/RuxtVlo9reMYiMp0TaK5And9JC1aUsPDzkQRTFnp2ZOrnuiKNjlgOhkzow5JLybt
         rI9DxA9Uq7CdL3vd/kwcGT/iO8VpWNg1Ppr4HB62CqELk6onw2FjiCUSj8TwIdUoGJiT
         9zJydXV6MRk2i9EIgvWqylQHFFXOyYk/Tp8Rd/HsPGr2K41wTAmfWzXAcUfdrNuqtIy8
         hvMMm8NKYZoHCS/IxpSfDyi//XjAXkwd27da018aLE4dEe8vI1Xw1CM4vTPrDOHUfdac
         sjDA==
X-Gm-Message-State: ACgBeo05w7jR2IHgDC1TTm2/TdJQueU7QVAZLcjtPB4M/64vaT5WDlW7
	lPJKNP1UBscBF/tXqGsJLaE=
X-Google-Smtp-Source: AA6agR5L3UutCR6SuoZH/M6NAJC5jzQgd1eK9rcw7szj3wmG5QtaNzGvWYIm3llE3iJTVl3LqhHAQQ==
X-Received: by 2002:a63:91c4:0:b0:41c:ce66:8ab7 with SMTP id l187-20020a6391c4000000b0041cce668ab7mr12815928pge.602.1660554130162;
        Mon, 15 Aug 2022 02:02:10 -0700 (PDT)
Received: from DESKTOP-IBN2BAQ.localdomain ([123.110.155.185])
        by smtp.gmail.com with ESMTPSA id a17-20020a656411000000b00412a708f38asm5491612pgv.35.2022.08.15.02.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 02:02:09 -0700 (PDT)
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
Subject: [RESNED PATCH v8 03/12] dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator
Date: Mon, 15 Aug 2022 17:01:16 +0800
Message-Id: <20220815090125.27705-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090125.27705-1-peterwu.pub@gmail.com>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_020213_954622_01B982D3 
X-CRM114-Status: GOOD (  10.55  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 current sink type LED indicator binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../leds/mediatek,mt6370-indicator.yaml       | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 000000000000..204b103ffc2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - color
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.34.1


