Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF74C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5oBLDeH2TFPPE1qW+095x6ar1U98gaW60A2FSoyamQ=; b=KhvxEO1piQztA9hXXY8B8TsvRe
	w0PmPeTX2XvsyZkRuTPuFAXAXlpBo9bEYIuXp1y1jDKiiMda4bnzIEtrVBMVEb8JYxBp6YTCYraQA
	VIxuFkL3e3x0X/Bnyw1c4aXNMZfOxHVp8NQhhpvDEekFI1jz+dQZUOJ1E3ZYmWwx2aQ9dW5s7Ouh5
	yFQDrEhqDmWzEq5NO9O4yToYhlaxQvX1tzEOZ5YOLSW3tImCWtnWhGWTRYL8bWZXQHyhq7lrRjr0h
	AWsXpLNxdyqgDna4ynXqcIslG7nzXVZyx3+DOz5Btumhmmj1DzKyl4ytj05/YYrtmLTkDZc3I2Myt
	QTJFda2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LU8-00Eogd-Im; Thu, 23 Jun 2022 11:58:56 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LSg-00EnoH-EW; Thu, 23 Jun 2022 11:57:28 +0000
Received: by mail-pf1-x42e.google.com with SMTP id n12so11951528pfq.0;
        Thu, 23 Jun 2022 04:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M5oBLDeH2TFPPE1qW+095x6ar1U98gaW60A2FSoyamQ=;
        b=PcxhtUBnyPDnzbGcjPOH22wXUg64coBDrbIKm55BA3uBCZt/v0IKz/meTcap2SGjfB
         OAcyzRkqDFgj4gT5v9h8X67lB1yjdI9ZAyixj1KSxpOIjrnSZ1e1c9ZzXQxo9DrgvgLa
         EPp1YijsJXMTxKlaJO2mkfyWZfyydkymswth5pdzC1bR2GVbnonCWv5RlGypNuNly0pT
         9dZotbzBxyhN/3Q81oUMzbBRJ+w2n8GyXCz4SQJRfnCREQ8qXmvhiTCOt4UzrPhNIqtT
         hjCEfw3BwBKpMvGZGDhfyXBpK6vYDap9fFAbWjHb1Kq1q2Pl5jVEGRtxPnCy5gwo61/O
         BxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M5oBLDeH2TFPPE1qW+095x6ar1U98gaW60A2FSoyamQ=;
        b=AIEuq8L+hJH48ql7vnmf+PXxMfn87k+gy/MLgtwRrG7rZQj3Pw6MGsYghdzKgrPegu
         dfWbCQWBtl1yTcaafJOdsrbwSwxFbFheshRshEA7mxCfGry88DZkmzWbsxkC1RzVwD0P
         V5tAn4KRwLExqNzSYiacjsAJ/RHaRoQ88ctJcHFclQWEs2Aonb6wSEuQ1aYDWkQj6Fg6
         XSv6Uo4YKKWJsbcqEZXm/gisYtxRT2V1ww6D/yK7i87MRyoOkJProlvtUU6l5AmyfUqF
         sv+z0VrKE8o7n2J1YtlX1h3Wp+G+78+KWv5IkITZBT8bn11Yn4X1X5JLXryix/LSIt/t
         w3eg==
X-Gm-Message-State: AJIora8ayR2/F+ZCh/0FxBTslIurd7UWpQ1WHxmxh4wPktqNC7LnGcCl
	7CaM7ZMhdfGbhMmMTejIYI0=
X-Google-Smtp-Source: AGRyM1v2dS8GCsHCr6bAYJn0dJ8H5c9Q7wS9pSlJJ8PZKZKq3RJ5NeGGUM/SZNXaholm+I9PvXwMjw==
X-Received: by 2002:a05:6a00:22ce:b0:51c:15ac:3977 with SMTP id f14-20020a056a0022ce00b0051c15ac3977mr40443294pfj.3.1655985443535;
        Thu, 23 Jun 2022 04:57:23 -0700 (PDT)
Received: from RD-3580-24288.rt.l (111-71-94-93.emome-ip.hinet.net. [111.71.94.93])
        by smtp.gmail.com with ESMTPSA id t6-20020a63b246000000b003fbfe88be17sm15016516pgo.24.2022.06.23.04.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:57:23 -0700 (PDT)
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
Subject: [PATCH v3 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370 current sink type LED indicator
Date: Thu, 23 Jun 2022 19:56:20 +0800
Message-Id: <20220623115631.22209-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220623115631.22209-1-peterwu.pub@gmail.com>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_045726_561792_8C8428EE 
X-CRM114-Status: GOOD (  11.40  )
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

Add Mediatek mt6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---

v3
- Use leds-class-multicolor.yaml instead of common.yaml.
- Split multi-led and led node.
- Add subdevice "led" in "multi-led".
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..45030f3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,77 @@
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
2.7.4


