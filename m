Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50521C54F4D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=; b=sYelhzNf7xpgBD0BGH3U4qZvNX
	QsWur6YIXgkiI2zbEqZqRPsE5W68gjcTWyBoQNamQBdgPTvRKMXklSGPTBtvkvp75NNyYpaa4bNZ6
	nPQpBmGmx3k0CIlhCqnd3YjBH7SF9c4eEn/oRUdJQT8zrqUxhFk+UNN+xox6qsJuVmvSMDro8DvZ/
	zo8HEa01zZJjaKYOS1WNmFv/iZWvfM1xGL45FPBQUOqEo3/r0awfUdrvUV2WJmk05EBjn9sCWLBhX
	FvDewptzEn8kVLaBfiDpl5aMIbL+TcXGlXcrDeYPZ278RstBdDfQjvM9wcSbtVPxxoTzH+g1+L8sG
	3sk7LKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3e-00000005hqu-0E89;
	Tue, 28 Jul 2026 15:49:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wok3N-00000005hbG-2oOU
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 15:49:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954df200ddso26733175e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 08:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785253752; x=1785858552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=;
        b=YqjLQvYNihZf68eTgKuaolzvc5RLC2YP/6ZmMLxY/Qf4fiD4chKmyOsBW3miZg9zm0
         qLe31nDlKZ0D6ZqZ6gD2tWSCj78jeM0e2D4wk3asUrqqM8U1itkjN76UUa9Bce61UVVG
         HPbgjJJTZNvF3hWD3NWJyxy7P1JDw1AMKHxqOhIDFdgqyp0M7svWTDCgECF/BO+tszvk
         ZfdRcs7PWD2gKiUKkoeBty31judMdUUBHz4HgiQZtAQuHfMcTgcddNz1zOekxHwA2Bd8
         2QOgqud+C9XLuKyDQfa5mbP5Wdtr+sv36pjtSnSzxchFeccl+30L19z79Z1VhxjtHhQq
         9wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785253752; x=1785858552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iZ5Ahml9vc0Lc4cZvlseqL+CGWwYxJKEQ105WcAHSfg=;
        b=fJd99Eni67DQvm0qO/IACuMy3Q0VTFCY3XYoyoCAxu4PAkwEU5SquDtJV62ktSQrl7
         fZJjDdZ+b2ZLvESEZGRa44hmNjFWyQf3u/e8qPsvoVXNZAgTcfQv7hkfs/sjFqvwVL/4
         5TR15hyvPUxr8f3Lp9H9jeVwHQdWWpxXTfzqSLzvdkKtZ+GsFU2CFw4JqltimDYOCr5Q
         5/cw8fJ6diI0mse/aVNw01MXLBGNNwUegqa9Dktadu2SReyWImB2qWhKknYpfhnutOkh
         0sbBqhMYvQYv0RF0NCS80MsKErnM/fG+y3l6+3y4tEkbBLTwK0kyF2xuDndDonD8Dpfg
         67sg==
X-Forwarded-Encrypted: i=1; AHgh+RqoDLzdaNjKk7RgGxdpK9EdbgDI0NL/YNUy4uRO/wBTFILc0ixpvQmZIAE85Oum/LEVkw5z0S+Uc19+vxle6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0qPmZDf2wMqA7S3pkagtxqOhySEIVUUdUXKMTBHd2lIxEx6oi
	hh1LRPWQzKzsRZqgAmoqMu0FOjJ/Xx9CmsvravNIYFRajz+fJuMxGJLk
X-Gm-Gg: AR+sD12m9TPKJQF59sZbZQdPoyDFLVK0324yH73QQ5hLw6fGWXdcBclt7JpmaBB1R6x
	CGZgkNA+W+buEUnc945M0gpPYWTqUKYb1lfHY+ODI+s4ZgXnDhTF74PBmpM4vrPRr1cW/+CJAzo
	eE6y5SfeIBY1zGiCcKGmrU6OMK7J7iRQ1GPWByXWqQJxPOYmjR16t54wgop4ujfmrJAuQfG/K0s
	vvAX/fxTOfa6yGrXKS1qqEfQv3J9NP4JsK0GV/o6B2zm/bOGfc9NQ+cFWjHtQxEhlnNMwHhnkJJ
	T8OzMkRm0LVULk7sGTSFs3YnRhqGWWqVjgJ2jzF80FQ5mNE0D60IbKaMt3HUWsqjoH64GJGwHSh
	Xtff91x+sGryQYkQzS0zimy6w10kFDaCfL0wx5+PelZKLqJjV8ZL07FWMrZ5dYsc4B5etN8kRjO
	gMuDCbvUU3TNf4sJt/d2bBAWZb4iYR
X-Received: by 2002:a05:600c:5486:b0:495:7040:c7e9 with SMTP id 5b1f17b1804b1-496c6414bddmr31261065e9.6.1785253751459;
        Tue, 28 Jul 2026 08:49:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([37.161.95.51])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496c4632263sm94912035e9.15.2026.07.28.08.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:49:10 -0700 (PDT)
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
Subject: [PATCH net-next v19 03/10] dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC
Date: Tue, 28 Jul 2026 17:48:30 +0200
Message-ID: <20260728154846.1828945-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_084913_760716_343DE70E 
X-CRM114-Status: GOOD (  13.82  )
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
 .../bindings/mfd/airoha,an8855.yaml           | 173 ++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
new file mode 100644
index 000000000000..647d6d4c4c6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
@@ -0,0 +1,173 @@
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
+  reset-gpios: true
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
+    $ref: /schemas/net/mdio.yaml#
+    description: MDIO exposed by the Airoha AN8855 SoC
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
+            reset-gpios = <&pio 39 0>;
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


