Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E659C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxQGn4iIVyQgO4sCNH7+LFX9XzovM/Q2pkwFCARsvl8=; b=o1V5PqfED8Mcx/um+irohSUyf5
	2txc7BWHn8YZmPvgSbEspOfpema/CEmiQ+fDmzrMi5MGypyD0nMdlgitNmfmEK8+fIdAxq6aCBwXp
	pOnzsav+ObryrnCHq6cKk1CITFL2D6z17tXZAWR9J3iiWE5UeqeZdPjtqo7IixFgfWSi7fMEXUURa
	lN5Ld/YsbFGPnY0V1J+KWztMYb+efR+bWFgahXtfdDaORtviwofMx6BGW6Xbz6Xm6dCEZW8dzisdQ
	v00z2vz802yqLK+2fx26YMKCzESh2ytE7WmPef1EZk59cZaGBTkPCgZvGSqJ9egijuxTeJ8M8VyWr
	Ma2Ax58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJTt-006ZHt-EH; Fri, 15 Jul 2022 11:27:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCJT6-006YnF-6V; Fri, 15 Jul 2022 11:26:49 +0000
Received: by mail-pj1-x102a.google.com with SMTP id cp18-20020a17090afb9200b001ef79e8484aso7917071pjb.1;
        Fri, 15 Jul 2022 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IxQGn4iIVyQgO4sCNH7+LFX9XzovM/Q2pkwFCARsvl8=;
        b=Mgv/uMAS6quJW6YOZJXpMrDjRfPkFpN+lUMCrij5TBWPh0sRprsv1vbBDjKB3yyw+2
         2R5YnmXIe/LBE2jM97adfXCANPNts4ZSLncX3BhmojlH6iJB4B9fPJNdHe2pKNN9oytd
         u62zCqRFFeFhM9pcOxcs6unc0wEmMbyI6pKZY1FRUU18doVFIHRsJEVlNVin2BBRgaAh
         8FWBSrqiYL4BsoR3E6tSKYQK9LpGXBALXysPOw1quULxO7mxCGPmyvnr5yUev6asjhrH
         wTud6mjKTQu6+640YM/rWz7AK/cKlRMyoADJCuFRKViULuePnuLVKaDKPbSfyhvRDtfa
         nd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IxQGn4iIVyQgO4sCNH7+LFX9XzovM/Q2pkwFCARsvl8=;
        b=vKVTJJF62c8zBK7ZxFfig3GDSKwOg/YuTS4FsskNArZVzY5Z4rqaYmv6aPlqhDubl1
         XgTBZyxvLEQ/kQxYARnw+G0eSzL6nKSLyD02soegGTUf7DtyOgBgCkgnQCa7RpuwfiTK
         nK/SAP8kQzqm5aoZOk3QE1whkDuSubv1XrsEr3cjiItSSs1RJtOuFqoCGJc8AjqUQDzP
         uyf23LBWjJOswJJfyWaxhKtoLJdPitLT/S7+abyc/YORn8z9fFG8cbNMAI+odn8ADQi3
         1hzsistluXPJueTOr3iflr2CVjwv/vUov6+GFtmK7dHKs7FeeD7h190kz5BSU8C9NDVz
         kIeA==
X-Gm-Message-State: AJIora93l43oGrEvLSBK4dlJEV5khK/RI050QQsDmqZpjHrOJQYCNGE+
	mcebWzmwJ9cUxzyyo8z6E9A=
X-Google-Smtp-Source: AGRyM1s3nsMjuXz7+TjcArNnQ5dHqg+xYnlDeUbRjeQaq2MhYrhBmlzeb//JROOfLXHQe+5HiF+Isw==
X-Received: by 2002:a17:90b:3811:b0:1ef:d704:24cf with SMTP id mq17-20020a17090b381100b001efd70424cfmr14962651pjb.14.1657884401220;
        Fri, 15 Jul 2022 04:26:41 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-159-86.emome-ip.hinet.net. [42.72.159.86])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b00525b61f4792sm3550604pfr.109.2022.07.15.04.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:26:40 -0700 (PDT)
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
Subject: [PATCH v5 03/13] dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator
Date: Fri, 15 Jul 2022 19:25:57 +0800
Message-Id: <20220715112607.591-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715112607.591-1-peterwu.pub@gmail.com>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_042648_245052_732076E6 
X-CRM114-Status: GOOD (  10.79  )
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

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


