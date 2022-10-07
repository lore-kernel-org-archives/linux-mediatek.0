Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA75C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 13:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1F79IzwZ0dMUZFmXlU+IVgVaLT58myI+Xc67kDLiY10=; b=Gf4CU5us9bosvIurt3UNWqF/Fu
	jIIkhzYkWhoBUrydGwS7GSuOLspMEHvrXSb+TDEHb1yiiaZ5EYzWsgX0VC9q6StKEZBkhoy0Efa4m
	kCCmfMLszl1H3yaoQiOwys9Vy6FR4yy5SXjzPjcF8d7U31YTVNqJSSUw303OfJiZq2sY23XDPCScf
	dKJVRyhu97m/C2x6BHLXwN7238j4RM0OHJZwYp4tSoKURWKtIISWZZWZ0XXdGMHd3240UXEM/mUm6
	HaGYd+z9x4yUFP9BCQTJE6nVAgyKzO2ub2jpGzVIXXMzqIhDDs4uPeSh33m5w4cZzZIO2JL8XDkIm
	lHSVBrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogn0A-0091jE-4c; Fri, 07 Oct 2022 13:02:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmxH-0090Ch-U5; Fri, 07 Oct 2022 12:59:57 +0000
Received: by mail-wr1-x433.google.com with SMTP id a3so7251682wrt.0;
        Fri, 07 Oct 2022 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1F79IzwZ0dMUZFmXlU+IVgVaLT58myI+Xc67kDLiY10=;
        b=A2Xi2NTEpbov6ZIgp+ERPzG9qWa15tijCWRiH7Wfh9oKVDTKOp0xTJvWoAp/jUg6Yt
         pKJkLks/8c0RqZPB06qFmsBeD1gmkp88pm+nJK7v7vV2su7KOj60HvBa8ypWMoH+uIX/
         VQh86hDXJRIwRh9rWi8J1MrCJ7BJFs3narIghlApzg9XMu13SGx//jsu8GPfYBqF47r9
         Mka7TYkyIpyF0eL0QfmYpc7qAoH74Vg3ro/8ORL3T5JrPHgWYfGUnGPcpFg7FGIQahn2
         0xNDQ394JoIlEHU3UKOGR53XyCqh+CL2osmcZ1ATiH9n7uZcrgH+ovacQQRIWxbFRfGn
         QqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1F79IzwZ0dMUZFmXlU+IVgVaLT58myI+Xc67kDLiY10=;
        b=wvMphAH6NgXJQMk/PbZ/v+AaBJcSIEAjvBdUQ3pJHvr10ldBlsieVqbCz6cGujaoSh
         DXqBYg6V52RjoErXQ3Bn3qkY3FAHfAz3nP2AQnXCiY+jXYBA3VZOWSV5XgPRVLHoAhu4
         N7H3eyDPvzNP/buwlTlgUZNpGUw3m01reyRjXJO4+fPSXqi5qZLljzddTgHGTxKaDmky
         6XPfIoEdnpJ8jMp9i/mlzlwRAkHrT1VyCst6PQC1WOsEcRz40G2GxO6epePEhMxy68PZ
         wreFvmEvAyrgWY5tXusXofb4UvZL6t0ymIYA2aVRPmUQUsDHqNsEje5qgw+EmB0rU9us
         GtVQ==
X-Gm-Message-State: ACrzQf1gtEWnT5ljpQ6FVLzk7mzOV0EjNVbGhIGkRCWR7L5JZlhahCMu
	8WmDU7Fznzc01XdnFqO8GdI=
X-Google-Smtp-Source: AMsMyM7GbVQ5uWE91PfjMJq48KJe96DTnrSw1mHq8WiQ7dgsi6oeCBQRUCLBNzx+Cg5gVVxfANHK6w==
X-Received: by 2002:adf:fe0f:0:b0:22e:482b:b63a with SMTP id n15-20020adffe0f000000b0022e482bb63amr3077205wrr.586.1665147591145;
        Fri, 07 Oct 2022 05:59:51 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:50 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 09/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin controller
Date: Fri,  7 Oct 2022 15:59:03 +0300
Message-Id: <20221007125904.55371-10-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055956_021488_08778EDD 
X-CRM114-Status: GOOD (  14.88  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add bindings for the pin controller found on MediaTek MT6735 and
MT6735M SoCs, including describing a method to manually specify
a pin and function in the pinmux property making defining bindings
for each pin/function combination unnecessary. The pin controllers
on those SoCs are generally identical, with the only difference
being the lack of MSDC2 pins (198-203) on MT6735M.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 46 ++++++++++++++++++-
 MAINTAINERS                                   |  6 +++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
index 71a9aae2cc8c..7b120803a1a5 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Andy Teng <andy.teng@mediatek.com>
   - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
   - Sean Wang <sean.wang@kernel.org>
+  - Yassine Oudjana <y.oudjana@protonmail.com>
 
 description:
   The MediaTek pin controller on MT6779 is used to control pin
@@ -18,6 +19,8 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6735-pinctrl
+      - mediatek,mt6735m-pinctrl
       - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
@@ -63,6 +66,33 @@ required:
 
 allOf:
   - $ref: "pinctrl.yaml#"
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6735-pinctrl
+              - mediatek,mt6735m-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 8
+          maxItems: 8
+
+        reg-names:
+          items:
+            - const: gpio
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
   - if:
       properties:
         compatible:
@@ -312,18 +342,32 @@ examples:
             };
 
             /* GPIO0 set as multifunction GPIO0 */
-            gpio-pins {
+            gpio0-pins {
                 pins {
                     pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
                 };
             };
 
+            /* GPIO1 set to function 0 (GPIO) */
+            gpio1-pins {
+                pins {
+                    pinmux = <(MTK_PIN_NO(1) | 0)>;
+                };
+            };
+
             /* GPIO52 set as multifunction SDA0 */
             i2c0-pins {
                 pins {
                   pinmux = <PINMUX_GPIO52__FUNC_SDA0>;
                 };
             };
+
+            /* GPIO62 set to function 1 (primary function) */
+            i2c1-pins {
+                pins {
+                    pinmux = <(MTK_PIN_NO(62) | 1)>;
+                };
+            };
         };
 
         mmc0 {
diff --git a/MAINTAINERS b/MAINTAINERS
index 184519342e45..edcb30842ddf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16287,6 +16287,12 @@ F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
 F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
 F:	drivers/pinctrl/mediatek/
 
+PIN CONTROLLER - MEDIATEK MT6735
+M:	Yassine Oudjana <y.oudjana@protonmail.com>
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
+
 PIN CONTROLLER - MICROCHIP AT91
 M:	Ludovic Desroches <ludovic.desroches@microchip.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.38.0


