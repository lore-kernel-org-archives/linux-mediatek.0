Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0C0C38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 02:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ahhjesBQPoRdOxI0FPgtGG53bpvUK7B+pZWktlNNyHw=; b=0IjKqyOOrnE34VWcQ2peqR5jS6
	vFpvKZ5OIQX90AdonvP0wkHErKyFTLYn/ocTIUg8dDik88oX0t0/2wLEOrw90FoCuqWCn+eXOLLk1
	U3vxe3yR8XRxjz1W/hzFlkn/sfUhTv9kJhU+INS8pKPSIbUbc7Vj7yICGz+Alt8oyGAAGrieQyxuM
	Qw7FtXulx1fKRwSxMqe2jraHDK4Oif86yRHbu4zR2OKJFhITzcstde2s//7Bhje39n7V6p4iZnd7J
	zVSFUQYJAoHrunwlgZuE7NJ0/LmrMigdYX/0/S53u2sf6DSnzvUQbpzGxpAEBOAfrIiPf312db9CW
	PHfQ0rEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIgn0-0080Ja-RP; Fri, 20 Jan 2023 02:05:58 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIgms-0080Ho-KC; Fri, 20 Jan 2023 02:05:52 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1442977d77dso4770744fac.6;
        Thu, 19 Jan 2023 18:05:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahhjesBQPoRdOxI0FPgtGG53bpvUK7B+pZWktlNNyHw=;
        b=dsDU0rk/nbNbXx0NjQ7o0vV6WyWMv/IkuYp1Sb6FhCiBpIds81pw/yKQWhXlDtu6zM
         OoDeN/hw3aM/KtBoZbSvb1PpkwcePr04zZl3qpZhWT56IUrK28e6n4euaNB/lfHDTRmx
         opY3XwIzxlr27jlXNwN0SJrii7dT307WaY+VGqbq4rbDxBGrtd7ZGFHJ+ZVTtPGEU8d0
         qSQmulZLqPHw+J2XNZ8UJLemxqsAga+0CdbEO0IV1g6c0Z4GKVynn7lJXsTWJkyyD0oH
         8YOkEelTYSBvY3gU3qronlrgsdCe7ssGEogoJVu6hyUJTP+BTPszGxcMZBoZUrlIoYEH
         6oYA==
X-Gm-Message-State: AFqh2ko5/tX8w70huL4a9wbegAezss3L8dES78TwVyOa7PW5GYCy8Xwo
	5U1O44cm5FrMwPSVTByjhDHlxLD4kA==
X-Google-Smtp-Source: AMrXdXuVokQY0W5Usg208to2n7Uk2JpiCm76ol2hFYEa7ATCcSTjsWD0UYD70pahcOTNicoL/zCxlQ==
X-Received: by 2002:a05:6870:54d4:b0:15f:2ffe:8d54 with SMTP id g20-20020a05687054d400b0015f2ffe8d54mr7546883oan.47.1674180348439;
        Thu, 19 Jan 2023 18:05:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z13-20020a05687042cd00b0015f83e16a10sm4073504oah.44.2023.01.19.18.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:05:47 -0800 (PST)
Received: (nullmailer pid 3230582 invoked by uid 1000);
	Fri, 20 Jan 2023 02:05:47 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: mediatek: Fix child node name patterns
Date: Thu, 19 Jan 2023 20:05:36 -0600
Message-Id: <20230120020536.3229300-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_180550_701171_EFE368D1 
X-CRM114-Status: GOOD (  11.33  )
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

The child node name patterns in Mediatek pinctrl bindings don't match
reality. I don't know where '-[0-9]+$' came from, but I don't see any nodes
with a matching pattern. Also, patterns such as 'pins' or 'mux' are
ambiguous because any prefix or suffix is allowed. If that's desired, it
should be explicit.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 12 ++++++------
 .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml    |  8 ++++----
 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml    |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 1b44335b1e94..a55c8e4ff26e 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -70,11 +70,11 @@ allOf:
   - $ref: "pinctrl.yaml#"
 
 patternProperties:
-  '-[0-9]+$':
+  'pins$':
     type: object
     additionalProperties: false
     patternProperties:
-      'pins':
+      '(^pins|pins?$)':
         type: object
         additionalProperties: false
         description: |
@@ -158,7 +158,7 @@ examples:
               <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
               <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 
-          i2c0_pins_a: i2c0-0 {
+          i2c0_pins_a: i2c0-pins {
             pins1 {
               pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
                 <MT8135_PIN_101_SCL0__FUNC_SCL0>;
@@ -166,7 +166,7 @@ examples:
             };
           };
 
-          i2c1_pins_a: i2c1-0 {
+          i2c1_pins_a: i2c1-pins {
             pins {
               pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
                 <MT8135_PIN_196_SCL1__FUNC_SCL1>;
@@ -174,7 +174,7 @@ examples:
             };
           };
 
-          i2c2_pins_a: i2c2-0 {
+          i2c2_pins_a: i2c2-pins {
             pins1 {
               pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
               bias-pull-down;
@@ -186,7 +186,7 @@ examples:
             };
           };
 
-          i2c3_pins_a: i2c3-0 {
+          i2c3_pins_a: i2c3-pins {
             pins1 {
               pinmux = <MT8135_PIN_40_DAC_CLK__FUNC_GPIO40>,
                 <MT8135_PIN_41_DAC_WS__FUNC_GPIO41>;
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index c9ea0cad489b..ac93eb8f01a6 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -61,11 +61,11 @@ then:
     - "#interrupt-cells"
 
 patternProperties:
-  '-[0-9]+$':
+  '-pins(-[a-z]+)?$':
     type: object
     additionalProperties: false
     patternProperties:
-      'mux':
+      '^mux(-|$)':
         type: object
         additionalProperties: false
         description: |
@@ -244,7 +244,7 @@ patternProperties:
                 groups:
                   enum: [wf0_2g, wf0_5g]
 
-      'conf':
+      '^conf(-|$)':
         type: object
         additionalProperties: false
         description: |
@@ -348,7 +348,7 @@ examples:
           gpio-controller;
           #gpio-cells = <2>;
 
-          pinctrl_eth_default: eth-0 {
+          pinctrl_eth_default: eth-pins {
             mux-mdio {
               groups = "mdc_mdio";
               function = "eth";
diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
index 0d2484056a0f..c30cd0d010dd 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
@@ -67,11 +67,11 @@ required:
   - gpio-ranges
 
 patternProperties:
-  '-[0-9]+$':
+  '-pins(-[a-z]+)?$':
     type: object
     additionalProperties: false
     patternProperties:
-      'pins':
+      '^pins':
         type: object
         additionalProperties: false
         description: |
@@ -210,7 +210,7 @@ examples:
           interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
           #interrupt-cells = <2>;
 
-          i2c0_pins_a: i2c-0 {
+          i2c0_pins_a: i2c0-pins {
             pins1 {
               pinmux = <PINMUX_GPIO48__FUNC_SCL5>,
                 <PINMUX_GPIO49__FUNC_SDA5>;
@@ -219,7 +219,7 @@ examples:
             };
           };
 
-          i2c1_pins_a: i2c-1 {
+          i2c1_pins_a: i2c1-pins {
             pins {
               pinmux = <PINMUX_GPIO50__FUNC_SCL3>,
                 <PINMUX_GPIO51__FUNC_SDA3>;
-- 
2.39.0


