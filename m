Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729E3C88E5A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=; b=sz9+xiDukRf9xu0bmAsUnHgM7z
	L/iKyU/0lsyI4wCA6oQfAfdYRlI+9FSsS8dJnbznMlVX+2zLDAFIJprvnR/bYT+zgFIk7XF9spn5e
	T7rqMdL2O7eWd75GJivlU3IARF6wXcMv2rVL4MxqYX7hYI2Mn2/w7lkLVEOaO8LHKlCpeQOu590sk
	wiJFIT/V8njXFDHXSx6hC/L0yqcf8WEru8ZjT57Vb+VDRA1JuDiCDUGz/GP7t00UOSyd0nHkScbxG
	lG6tMxllUBi7TqAzWoqwvAK5gfh8AHoKREy7dcNM0O5ZW9t4lQGeDa2C2iwR0ZubIpOMKOySnSI7e
	UEXDjZKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8n-00000000Ixc-3QtY;
	Fri, 11 Sep 2026 22:54:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5A8k-00000000Iss-2v9N
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 22:54:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so11257905e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 15:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789167277; x=1789772077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=ZwmQHXPm8K68loB5ZwfT6uxMs9J8x2dP6+RMni5IQyGcFZrDr6Y8IZ1DBDEydp73t8
         IiEqxLy0FsAPVBb7DiojbIOr8O9OjWtHxqPpeCNpKyCNxoaz+P7/QkDOJ5n6wnTwHWww
         F1r3o9117czRnR+LEBIvU0hOQc5Ys63cSeBPJ1rswdEavsPHsDg4LP/+Fj90PtTpvU6y
         qVsb5WDZUm7opCyT3VPhWBDtmyAYqVHjB0N/zBP51XmcIS0fSLz4kaAbnLahoyTmrv2O
         L9vlDpDWqsj2qkVTqAi3vUWrdnWa4o//Rglkea/wZoCkKRIjH92sIqejEYok347/AAO4
         Lx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789167277; x=1789772077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nefrNojAo6vQreAbsmdFBgT6xPV/rOTuu+Wp6J/Zb/c=;
        b=cF9sxK1OPMWc+HfpvRo1UzchFslYyVLGITbebF7tIBzBxn1MFyjyzdnRam452Y8pPA
         5Xg3GodZ07Y1ZXo/xCWV264Gq8julCuiM/n5HPTBG1OblkBwOeBTEV4YDHhrAIGUet5p
         mK+yIy/v6wyctJ13E2GpdNfgCHWlrzhIBL1NPjOYKl90qRHl24Kl7BeZeoLt01dsXkb4
         6NZ0O62eSot+FzgK2l0yrXM8WHDVyI8WqSR2UXl4BRytioT6ocsIemkY17csI6JbSMau
         21XZADfW4E9hNg0CClA+QtUvB58j/KqPAlGT4/C/ojlVtgOj4F/P20i3884fwzrRDdof
         JQIA==
X-Forwarded-Encrypted: i=1; AKwUvBxpO91VIfMFwhntHAYgtGh6Jaaakb3+25TUuu8rwhS/DCkK8rp0PfB0enhlf8w3s8ZwXUhFVu5Pb4aEV7aUTA==@lists.infradead.org
X-Gm-Message-State: AFuF++mn1ffZTyzhQN2yNvVVp1CaR+IagPS9slKTZqA63ldPvs7ZAULI
	u8k8vZ0MZtr+aGtw8OuU7/mf7VkFx9u+wlLOYB738rtaB6lFB+owpS5W
X-Gm-Gg: AYBFou1llZN3hrR8vGv+XbOZ00XfE2PAX5bmC+EZJn/yncNHbwUtn6pjIToA2J1Ouid
	iVe3FxIPVvtkbhP1vCwEAdRncZ6PGw3rST4nV5iPmCkL1JbNRY+SZiCNVwzjoXSYoo+L8oflbVp
	LlpUgfFSCnYWnWXewx5zhwVNb2TkgV5CsiCupQooz6e9kooXXs/MxsMgZM0nfY1ohOkJ3cYTOT2
	Byz/kuFYHAAdb+TgtKLtr/rKSHPqszQVj8CfqlZDFr2NuRe+oPZN2L55lLH7exlLBT+dYGszM9A
	ZwhjdOm89Yx96N4uW04jELNlcWrir36gBORHVcIIPUlPBEJi5FCU0RUhsURbNroq7M+YQjqVMf6
	oUVZWrhfKBaXdA23/vaiZE36YLmDCqH7SjJWWCY5chi7kfiI1jIWSfOUgR7sMnNCWnz7wZIuYEW
	wxHynWgzOPnlaN0qD9uBadJ9Yf7S0P5jnXsKQiRK85yHhie85RmeD4iUYbZ+H/zb/UQ/hV9npqq
	hdgQmmViuABKuQVVYSaV22nRCQFoYskwTUqt8MHKpiszuAGl34gW1gSaXWct1BLic/RQGp/zA==
X-Received: by 2002:a05:600d:864d:10b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e61983764mr53966765e9.2.1789167276867;
        Fri, 11 Sep 2026 15:54:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e6221ffb0sm77593685e9.3.2026.09.11.15.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:54:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v21 3/9] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Sat, 12 Sep 2026 00:53:27 +0200
Message-ID: <20260911225414.225980-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911225414.225980-1-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_155438_816037_1D0BA75C 
X-CRM114-Status: GOOD (  13.58  )
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

Document support for Airoha AN8855 Switch SoC. This SoC expose various
peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.

It does also support i2c and timers but those are not currently
supported/used.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..48127e956c96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 Switch is a SoC that expose various peripherals like an
+  Ethernet Switch, a NVMEM provider and Ethernet PHYs.
+
+  It does also support i2c and timers but those are not currently
+  supported/used.
+
+properties:
+  compatible:
+    const: airoha,an8855
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  efuse:
+    type: object
+    $ref: /schemas/nvmem/airoha,an8855-efuse.yaml
+    description: EFUSE exposed by the Airoha AN8855 SoC
+
+  ethernet-switch:
+    type: object
+    $ref: /schemas/net/dsa/airoha,an8855-switch.yaml
+    description: Switch exposed by the Airoha AN8855 SoC
+
+  mdio:
+    type: object
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - mdio
+  - ethernet-switch
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        soc@1 {
+            compatible = "airoha,an8855";
+            reg = <1>;
+
+            reset-gpios = <&pio 39 GPIO_ACTIVE_HIGH>;
+
+            efuse {
+                compatible = "airoha,an8855-efuse";
+
+                #nvmem-cell-cells = <0>;
+
+                nvmem-layout {
+                    compatible = "fixed-layout";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    shift_sel_port0_tx_a: shift-sel-port0-tx-a@c {
+                       reg = <0xc 0x4>;
+                    };
+
+                    shift_sel_port0_tx_b: shift-sel-port0-tx-b@10 {
+                        reg = <0x10 0x4>;
+                    };
+
+                    shift_sel_port0_tx_c: shift-sel-port0-tx-c@14 {
+                        reg = <0x14 0x4>;
+                    };
+
+                    shift_sel_port0_tx_d: shift-sel-port0-tx-d@18 {
+                       reg = <0x18 0x4>;
+                    };
+
+                    shift_sel_port1_tx_a: shift-sel-port1-tx-a@1c {
+                        reg = <0x1c 0x4>;
+                    };
+
+                    shift_sel_port1_tx_b: shift-sel-port1-tx-b@20 {
+                        reg = <0x20 0x4>;
+                    };
+
+                    shift_sel_port1_tx_c: shift-sel-port1-tx-c@24 {
+                       reg = <0x24 0x4>;
+                    };
+
+                    shift_sel_port1_tx_d: shift-sel-port1-tx-d@28 {
+                        reg = <0x28 0x4>;
+                    };
+                };
+            };
+
+            ethernet-switch {
+                compatible = "airoha,an8855-switch";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+                        label = "lan1";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy1>;
+                    };
+
+                    port@1 {
+                        reg = <1>;
+                        label = "lan2";
+                        phy-mode = "internal";
+                        phy-handle = <&internal_phy2>;
+                    };
+
+                    port@5 {
+                        reg = <5>;
+                        label = "cpu";
+                        ethernet = <&gmac0>;
+                        phy-mode = "2500base-x";
+
+                        fixed-link {
+                            speed = <2500>;
+                            full-duplex;
+                            pause;
+                        };
+                    };
+                };
+            };
+
+            mdio {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                internal_phy1: ethernet-phy@1 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <1>;
+
+                  nvmem-cells = <&shift_sel_port0_tx_a>,
+                      <&shift_sel_port0_tx_b>,
+                      <&shift_sel_port0_tx_c>,
+                      <&shift_sel_port0_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+
+                internal_phy2: ethernet-phy@2 {
+                  compatible = "ethernet-phy-idc0ff.0410",
+                               "ethernet-phy-ieee802.3-c22";
+                  reg = <2>;
+
+                  nvmem-cells = <&shift_sel_port1_tx_a>,
+                      <&shift_sel_port1_tx_b>,
+                      <&shift_sel_port1_tx_c>,
+                      <&shift_sel_port1_tx_d>;
+                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+                };
+            };
+        };
+    };
-- 
2.53.0


