Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Wi32tmpiQHX52ETq9Uk/4lGPfSR1D8G8ZTXJ1dPWC8=; b=y02PRs5lXgm9HE
	jKxtBnNH+70QyasVRjYoaKkD5dccotkZbbnu3rtynIFxVq4lu375EbUZPbBXSjBoD47qL8WjIEEJz
	/AeZNQcGEfyP6PnfovDWfseF2VSbf2TVVyTZAfdKYF4/pd4FZhcPiMa4FsUMbYyyaGTz5/FvIgFTb
	dZGwfZBTk38vsB35mhA7XbqV+mBv0KwSEkXltHuMxdjFUV3S2vyp9EFoVhUY/pDIr9cUr4+tp8nWV
	wwaKj3cwx/G3P2/iVDXEcIwAyktXc8k4vjD6lM70s8xK8wrPevA5VWGIL13PB+X1bW3lYmRQvamyZ
	kbr0FpAu6Kewv0puIGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1A3-00Ao87-2C; Tue, 31 May 2022 12:39:47 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw19p-00Ao5Y-6k; Tue, 31 May 2022 12:39:36 +0000
Received: by mail-pl1-x643.google.com with SMTP id b5so12707214plx.10;
        Tue, 31 May 2022 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NLlQWPmyPhz9LkYQh7iizThmB3DZjfxS2yfzbAOphFg=;
        b=dR/tmmYf6X+SPz7vVDCZSTvJxhSmPumrcdc8D9eCahiy7k5GDXb8cgd5Oz+V7Xx0PC
         hAmjVU30wiCV7GMwbEfx0EI6okI7wgqBJjhtxxQOaoMd+KgOUEjQWC7TaK13GS+wbNV3
         4nMpIu8GOnQGX2cEOSo5rOoPbmdvRMkGyIytuDFbw6Q1ndzsjki6TmeyBbqod00KmjJ+
         LwkmKZN9M46Mt3KB7twZ0g+yay2qgsRP7Ds07ocwfWBkCmEM/RZTwEDb24Rtex7xJinQ
         +c3SJX7hCPVwQTa0GmgjxG6xpuflTpqYSLVacboKq/ZCOD8dvEg/RhMzwuNJRlDQQuiN
         AOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NLlQWPmyPhz9LkYQh7iizThmB3DZjfxS2yfzbAOphFg=;
        b=ayXJ4iTvJq3cui+JG7kR0igIsPgFlx2cWMgCH2ZBFdXJX+F1T2gcSJ0wcGW9SMT80R
         CLBPlRDC1dHL7+xwSXgfGBlpdrEVqEIHb2HEtUqyAs5YQwBXK/av18lLvSen18qsYhny
         IO2CSorg+3ySAVsz0FRYDXZ9zO7cJszu8lIX6P3R730OxvQWruHo05h/B/IaUbVrlkdl
         TFrL94JO8p+oSEOgHbuLISF2vbT/8UrpYIWkrYDlcvKqu1/gN9UI7xyFysVAOqXhcrRE
         zkKnPYqRe0TDb4Gp7Yf79oE7HiiJTWwWVGXVJEFPN6wDvAboYpm1A2Ifmr2NM5QAWoYu
         7KPw==
X-Gm-Message-State: AOAM531qTR5DvZt0BaBLHTleKGxc96/AnXI7TuyWtiWp8hfiCGLuF2KC
	EyT2yIR1OCJW84YFbXzYYzE=
X-Google-Smtp-Source: ABdhPJwMUDWTQjzldPrXFAGVjBuisYokJWG2xm0cEnR/uFycvlSkZSU8HIszco6eDBSdMG6hx3eaRg==
X-Received: by 2002:a17:902:9349:b0:158:a6f7:e280 with SMTP id g9-20020a170902934900b00158a6f7e280mr60247418plp.155.1653993750981;
        Tue, 31 May 2022 03:42:30 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-220-172.emome-ip.hinet.net. [42.72.220.172])
        by smtp.gmail.com with ESMTPSA id d19-20020a17090ac25300b001cd4989feebsm1525829pjx.55.2022.05.31.03.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 03:42:30 -0700 (PDT)
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
Cc: cy_huang@richtek.com,
	alice_chen@richtek.com,
	chiaen_wu@richtek.com,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 11/14] dt-bindings: leds: mt6370: Add Mediatek mt6370 indicator documentation
Date: Tue, 31 May 2022 18:42:08 +0800
Message-Id: <20220531104211.17106-3-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531104211.17106-1-peterwu.pub@gmail.com>
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_053933_283870_3FAD8B94 
X-CRM114-Status: GOOD (  11.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek mt6370 indicator documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../leds/mediatek,mt6370-indicator.yaml       | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 000000000000..823be3add097
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,57 @@
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
+  see Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
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
+  "^(multi-)?led@[0-3]$":
+    description: |
+      Properties for a single LED.
+    $ref: common.yaml#
+    type: object
+
+    properties:
+      reg:
+        description: |
+          Index of the LED.
+        enum:
+          - 0 # LED output ISINK1
+          - 1 # LED output ISINK2
+          - 2 # LED output ISINK3
+          - 3 # LED output ISINK4
+
+      mediatek,soft-start:
+        description: |
+          soft start step control, support /0.5ms/1ms/1.5ms/2ms.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
