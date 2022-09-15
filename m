Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61638ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=; b=ET++mEJLYT+sbf6laj6uh+B63a
	bfCMHm2dsfO6NOo0OUv/Ok8aiF4/XpVyl9p5fGZylZ4uYWIBegy56wBjQoJo/LlC4WpulZAxrMyOr
	CIo8lSTPb8e40iziD4hCky9suG48H5uRb772gaP8EgbOoQCzmE26oO/XwegKpHP9awnLgEvW4GPuU
	t0nV5KknR7rmtBmU5brJbDVCXhhI7+Ata8feaEw1Cc6KFjodleJtCa9G1fXuu12YcBo0TFP9SwC5K
	PKir9LobZW6Mz54KMRkCSPUv5A/0N8Nx2VDvKqTyRmxcVOEaiIaN09caeR7J26Wct/E+S1PJarKzY
	r830CHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlVj-005jch-N7; Thu, 15 Sep 2022 09:50:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYlUf-005ioC-2p; Thu, 15 Sep 2022 09:49:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id f23so1584016plr.6;
        Thu, 15 Sep 2022 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=CHEaj8o6rUnkzlrh5/8SeK87KJ2c9UiiJJ9xh+L1HIvR8lmheucStaJflVyp+/NGFg
         PLmLVDP2m6oz456hzOonnHOAN5BU/7161B9N+zMg0CIM2zfHsqb/kkHzddhAkzDIzwBx
         UWVZwCRpeAfn3P/uuvXy1qTqcf/O1ZvalqDQ6iJ74j6cDNK8eZNZ/TWnJ0YaGLq7tb2+
         XfopZvNH42zV/i8BcxiJ4HF77QylZhZF1ntzxAvWe5q+27H7Ky40YdNwbmrHXiJPCsZU
         gHyiyG+Pdg6n5jG7xLOkp8e2XEQ/cv53/8rxTceGvxjHMOpux54PnxF6ghIwwfNQpSH8
         AmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=SQohLOz3G2vayz7V3JVh4/kxpekvNBRKRs+qKcAn80Q/eQE6h+U1166FALgyKqO2dP
         YSfNxwbKRrNeDIN7ebcwwBUPvx1OWeAB8o77EkrZmnC6CfDhlu6XZFwXHwO350JtmYSe
         GCNIIXx34r6AbM3OP0cA2rYq8opvLfvb94DX4VN/VTqsNq3ZRS+RikXLWRyhDHtRCkqa
         CCNGI6DuAeM3ivwHDU2jv8lI/8ifvsD+WRJgdUSbKlOc9BRY/Hy42AiJom2BbTUQ1Lnz
         rgCi/HlmC6ozH9TQQPBYOjWrSU8eIt/yWo5ZusmDyPE1BZgmqzgdgmzwQ8OgCZxri6Yn
         xnyw==
X-Gm-Message-State: ACrzQf3OTZusml28bHpIG9gHC3tiIKxtNYa6QOMuTWaP0nfbrwOcv4lc
	8inJrmbsFqHOnQcXapejrfk=
X-Google-Smtp-Source: AMsMyM6jw/0irDXX/Ze7py7FgfZpT6tu0F+1SFoo+4JvX8TVTzCtEcOlS3P/UWc9o0xM2cVVA9cx4Q==
X-Received: by 2002:a17:903:32d1:b0:178:1cf0:5081 with SMTP id i17-20020a17090332d100b001781cf05081mr3615240plr.54.1663235351320;
        Thu, 15 Sep 2022 02:49:11 -0700 (PDT)
Received: from RD-3580-24288.rt.l (114-137-177-189.emome-ip.hinet.net. [114.137.177.189])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b00176675adbe1sm12669010plh.208.2022.09.15.02.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 02:49:11 -0700 (PDT)
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
Subject: [PATCH v11 2/8] dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator
Date: Thu, 15 Sep 2022 17:47:30 +0800
Message-Id: <206f5cfdcb62d9f34f1fbbaaa6d43e596c16122d.1663254344.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663254344.git.chiaen_wu@richtek.com>
References: <cover.1663254344.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_024913_177604_1EC9A6B8 
X-CRM114-Status: GOOD (  11.26  )
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
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..204b103
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
2.7.4


