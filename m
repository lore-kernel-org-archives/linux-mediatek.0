Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146EEC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 23:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SjAapmrBoeJvk2vnlclkpzuXnRknVk/UGE5rPGWCZzo=; b=eRhEU0aKq2/9hCqG7PktVdNS+9
	ypIwO8C46kR/2ImL8MT+yQ2kOc1F+UWeiaw/rTT0uBefdzThe8ZRp9rWxsKnnwifED7d3dIF0f6d1
	cFTttyr5TFy8CsLGQPrxJ6QT4UXWCJgh7hNgod6feANTg0idItbeVeu/ADY/IoS1IYjOWQTsj75M/
	fX92mOgB/FzHaE3ovQGT7iSpS7JEsIpNtdVPveQWbJLCtUNnwxj0F/dPOYAlZQriH4RmvFYXzWZhw
	lRqK3AsNevjx6JKJJlpFSa1KysqYNutDTfr3NGz8Tz5YFEUIN9dzBM0oSE3VYLH1jkZvCDlgYIEDs
	sh1cfzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peP5v-00AnIZ-2D;
	Mon, 20 Mar 2023 23:39:15 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peP5q-00AnGQ-2R;
	Mon, 20 Mar 2023 23:39:13 +0000
Received: by mail-ot1-f46.google.com with SMTP id 103-20020a9d0870000000b0069f000acf40so5248269oty.1;
        Mon, 20 Mar 2023 16:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679355549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjAapmrBoeJvk2vnlclkpzuXnRknVk/UGE5rPGWCZzo=;
        b=Usfdu0X9SfR/MeH+kSRLIYRC5RecHg0DfHeHZ9zzsOzo+ZD1p3mjWRiS1aZaFa2RMA
         /0Iq7RshvkXZKxFCFJi602sk0CBmxzTvB4eTbUWTB+z97k3tfbvQ2LHCmpaCnwyccGax
         pOl97Hj1/lafFauABJQ8uHuzlMUwQVyEB0hLb261cx4AuWG1tT+upDj5HuVKOgZMR/OQ
         4Jd2VcboVmcGvL+czFdetm9iMNo/J99bIQBSdh9MowsCmc58bRicLHUMbzKw7ZesiFbE
         dFV/DYH46Buuyl1ZTA8M+CIr1v865dpnW9H0lma0Pp2H4blvOAsHwOnS5g82zRPhdOoF
         Nnjw==
X-Gm-Message-State: AO0yUKWeYHHuC7im188PU2nqVwoASskHz7fU5mjKt0RWPt/l/i1EbMbI
	8RkW4MS4S4j3RJvcf6Q+QQ==
X-Google-Smtp-Source: AK7set+yH1biLxvRiR6yVgjcR8FkcuTOROnOYpZqzTSFeN8ZAsDNUX+MdLY949P50nSkRhKhjSe8WQ==
X-Received: by 2002:a9d:6948:0:b0:69f:2dd6:7f00 with SMTP id p8-20020a9d6948000000b0069f2dd67f00mr238775oto.36.1679355549393;
        Mon, 20 Mar 2023 16:39:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j18-20020a9d7392000000b00690e42f0da8sm4520941otk.24.2023.03.20.16.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:39:09 -0700 (PDT)
Received: (nullmailer pid 2920315 invoked by uid 1000);
	Mon, 20 Mar 2023 23:39:08 -0000
From: Rob Herring <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Justin Chen <justinpopo6@gmail.com>, Al Cooper <alcooperx@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: Drop unneeded quotes
Date: Mon, 20 Mar 2023 18:39:02 -0500
Message-Id: <20230320233904.2920197-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_163910_792997_F11E741D 
X-CRM114-Status: GOOD (  11.53  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml         | 4 ++--
 .../devicetree/bindings/usb/brcm,bcm7445-ehci.yaml        | 2 +-
 Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml    | 4 ++--
 Documentation/devicetree/bindings/usb/generic-ehci.yaml   | 2 +-
 Documentation/devicetree/bindings/usb/generic-xhci.yaml   | 2 +-
 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml   | 4 ++--
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++--
 .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml     | 4 ++--
 .../devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml     | 4 ++--
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml        | 2 +-
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml  | 8 ++++----
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml  | 4 ++--
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml        | 4 ++--
 .../devicetree/bindings/usb/realtek,rts5411.yaml          | 2 +-
 .../devicetree/bindings/usb/richtek,rt1711h.yaml          | 4 ++--
 Documentation/devicetree/bindings/usb/richtek,rt1719.yaml | 4 ++--
 Documentation/devicetree/bindings/usb/st,stusb160x.yaml   | 4 ++--
 Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml   | 4 ++--
 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml    | 4 ++--
 Documentation/devicetree/bindings/usb/usb-xhci.yaml       | 2 +-
 20 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index f38a2be07eda..da757c1155d4 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
 
diff --git a/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml
index ad075407d85e..1536cbec6334 100644
--- a/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/brcm,bcm7445-ehci.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Broadcom STB USB EHCI Controller
 
 allOf:
-  - $ref: "usb-hcd.yaml"
+  - $ref: usb-hcd.yaml
 
 maintainers:
   - Al Cooper <alcooperx@gmail.com>
diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index 51120fe90322..f6e7a5c1ff0b 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: ON Semiconductor Analog Audio Switch
 
diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 050cfd5acdaa..9445764bd8de 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
 allOf:
-  - $ref: "usb-hcd.yaml"
+  - $ref: usb-hcd.yaml
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
index db841589fc33..594ebb3ee432 100644
--- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Mathias Nyman <mathias.nyman@intel.com>
 
 allOf:
-  - $ref: "usb-xhci.yaml#"
+  - $ref: usb-xhci.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index bf4b1d016e1f..f196beb826d8 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/gpio-sbu-mux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: GPIO-based SBU mux
 
diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 8e513a6af378..beccbd1d4d0e 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/maxim,max33359.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/maxim,max33359.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Maxim TCPCI Type-C PD controller
 
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index c72257c19220..4f6018aadc8c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/mediatek,mt6360-tcpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek MT6360 Type-C Port Switch and Power Delivery controller
 
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
index 72f56cc88457..747d0f16d9b6 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediatTek MT6370 Type-C Port Switch and Power Delivery controller
 
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index c119caa9ad16..556bedb96165 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Chunfeng Yun <chunfeng.yun@mediatek.com>
 
 allOf:
-  - $ref: "usb-xhci.yaml"
+  - $ref: usb-xhci.yaml
 
 description: |
   There are two scenarios:
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index d2655173e108..5b908c457e3d 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Chunfeng Yun <chunfeng.yun@mediatek.com>
 
 allOf:
-  - $ref: "usb-drd.yaml"
+  - $ref: usb-drd.yaml
 
 description: |
   The DRD controller has a glue layer IPPC (IP Port Control), and its host is
@@ -204,9 +204,9 @@ patternProperties:
       example if the host mode is enabled.
 
 dependencies:
-  connector: [ 'usb-role-switch' ]
-  port: [ 'usb-role-switch' ]
-  role-switch-default-mode: [ 'usb-role-switch' ]
+  connector: [ usb-role-switch ]
+  port: [ usb-role-switch ]
+  role-switch-default-mode: [ usb-role-switch ]
   wakeup-source: [ 'mediatek,syscon-wakeup' ]
 
 required:
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index f16ab30a95d2..a39d38db7714 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -68,8 +68,8 @@ properties:
     type: object
 
 dependencies:
-  usb-role-switch: [ 'connector' ]
-  connector: [ 'usb-role-switch' ]
+  usb-role-switch: [ connector ]
+  connector: [ usb-role-switch ]
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index e638f77658fc..e2270ce0c56b 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/nvidia,tegra-xudc.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/nvidia,tegra-xudc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: NVIDIA Tegra XUSB device mode controller (XUDC)
 
diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index 623d04a88a81..9309f003cd07 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -26,7 +26,7 @@ properties:
       phandle to the regulator that provides power to the hub.
 
   peer-hub:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the peer hub on the controller.
 
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
index 1999f614c89b..3bec824ec446 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/richtek,rt1711h.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Richtek RT1711H Type-C Port Switch and Power Delivery controller
 
diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml b/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
index e3e87e4d3292..43562041b646 100644
--- a/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
+++ b/Documentation/devicetree/bindings/usb/richtek,rt1719.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/richtek,rt1719.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/richtek,rt1719.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Richtek RT1719 sink-only Type-C PD controller
 
diff --git a/Documentation/devicetree/bindings/usb/st,stusb160x.yaml b/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
index ffcd9897ea38..edfebb813f77 100644
--- a/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
+++ b/Documentation/devicetree/bindings/usb/st,stusb160x.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/st,stusb160x.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/st,stusb160x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: STMicroelectronics STUSB160x Type-C controller
 
diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index f81ba3e90297..fd36dd02fe74 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/ti,j721e-usb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: TI wrapper module for the Cadence USBSS-DRD controller
 
diff --git a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
index 348a715d61f4..7d9c5e786e42 100644
--- a/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/usb/ti,tps6598x.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments 6598x Type-C Port Switch and Power Delivery controller
 
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
index f2139a9f35fb..180a261c3e8f 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Mathias Nyman <mathias.nyman@intel.com>
 
 allOf:
-  - $ref: "usb-hcd.yaml#"
+  - $ref: usb-hcd.yaml#
 
 properties:
   usb2-lpm-disable:
-- 
2.39.2


