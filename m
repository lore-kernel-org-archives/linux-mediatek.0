Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AAECD3442
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 18:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=; b=VQLorZv3yUiO0vW91MGPlUkxi6
	bZiuywN+XHDVux6QBylv43LWh0JuEvcP9OH8diRqEPYNMKDXn8p6SUOPKsdRKZBiJsiSe/aZGK8H+
	mCNq+fSc5bU7u/tC9h17Xz3BMeYTCTRhtn5LiiD9Bwlgwybhl+rx0pTl7exOnTX7KGamxi6Jd+mTh
	aetlDcmGJkQhv+yO8Y5fRYusGghSgNNox7Y199xh/NznQ4c0HO7ZEz5VFs73wavrbv+PhMcCFm4fI
	EBKhrpwtMnnGEFPSAxN1mH0rhyCfil1pOSWsDgg6V2Lc0b6RvHRf+ewU7ehYvbea9q4K3xda8Gnle
	GJ4FBzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUk-0000000HAcH-2kAS;
	Tue, 05 May 2026 18:27:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUg-0000000HAUn-3vpC
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 18:27:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488ad135063so53095205e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005661; x=1778610461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=FVhYor44pIjTHYsSleREqyq3UGsOPFP3JaqLCfC6yfH2uU328yCWMdlSWH7kiL+l4V
         ONKAdV0gPQV7aMZhq9PhrqtXCNsIY7LmBfTgpaVYJGpZJGjqXujDSfjWhV474fYubXFv
         +VrLACF+rKiwmYne/iKh0/UMD8OBu/omXepmmREp1NgQRFwkmp4e6XTBcCGyGhkoxqJv
         nwVoutzGmcQPx2wLTsuH95J+nrgYIBXAivXWD8pcgmZUujFfBrr+qTDDI40grMcXo4FX
         IvRZZIS8tNEplkB+OrSgGOpmVWQicejU6H056NVQAsDArUbphRCz1XvNj4aqt4sG0xnR
         rM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005661; x=1778610461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2x1A+JAuzDdUiINu53XK8eGzEAE0up6CyLUPQxC/1W0=;
        b=BFZzqvu36+dqplFNk4aZMopED0IyL22vLmPphfA1cnf4hXk6d9DI6o+YomYhBdufeH
         w4i3rMdvlnVIyPYy9kc/LW3drvymq5ZYPnYr0zYc+Pls8fnaVr00oAUb/0yIXLEW/z7I
         O7EWVVvW+nHxezaZj3eomaYdMWK3CQoZlZUbmXaoMoN+VCKV/2V11F4meapaumIca3xa
         epwTqUYL6OvTJE6sUJVFYgKeQ/Ye7pSdzZ2E5RlFZuzY9Gcz//iGyJB6h1zSZYjOJGpQ
         91DsopQMBC5vvYm3crH7APV0nDOHDmZP152b3Bbe0eYhyYAqUxgYOQVU7D/Ciw9dGXB5
         JiQw==
X-Forwarded-Encrypted: i=1; AFNElJ8uhhE1mws/KLloc/x0rFQRupCruhz4RHYYzuwWh6l3qA5PJzjsJomNQzci9DKUOQ8g20nDC/s+XzDe1YScrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSvBXyRipfVpw3cUgYGUB7Qea9qitpoO64je9jbdhsOx2zm04d
	Vis22MBWhBWNvbPV3dUEMlXMer/o5Wk+rYhHZzkz/reUWs8vZMzJw6zT
X-Gm-Gg: AeBDievhTikSS/Isqgkq5DQ1smNEX4Gxf9Hq8r7DriYfQktfIzQHe7a36ZjQVXH+UL/
	GPfH+3LFpi5OAg+Cs4IzYaH+LjM5JomrWPjSej/I48OQXsobLa24zbhwMJ1jqJEjG6J/eNKCz0S
	Fr3344p3shqrbovxv0SEoRXwDMVAiRTMVWHAbaUsXSNk4I5ICcrJcsK133+Vdi8+s3eh1wLGCtA
	HFism/WP/nwbEk5wG/6dFryTYNcfdMAbjjs9yGWyTyRXjg2bVCngji5+FRrxiQG+vZ1bo0W7o6p
	hNLU1efiOK5bvOgHxckmRz6lM/VqbjfTPwJi1D/cnrWk+zAednm5TVHDlj8e9BqJgQt+fnfOQGQ
	nZbu16jUwQ8jhN0pXbnX3k9ew7MLfG0aIWJlnkP4yDQNxZRneg38gYKJjPQQd17x83lD+G59NBM
	J2kd7D1BD1GvsilwRQNIPwk8LOo/DD44/G7zZZPfSg8GD65LFHy1AKtWCM+7/2iF4Z1XXjqa5uH
	/ieE2m1PINVD2QvHg==
X-Received: by 2002:a05:600c:1e8a:b0:488:fd7e:1063 with SMTP id 5b1f17b1804b1-48e51f4cdcdmr5427305e9.29.1778005661133;
        Tue, 05 May 2026 11:27:41 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 08/10] dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
Date: Tue,  5 May 2026 20:27:09 +0200
Message-ID: <20260505182713.27644-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112743_006242_58BCE3F3 
X-CRM114-Status: GOOD (  12.83  )
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

Document support for Airoha Ethernet PCS for AN7581 SoC.

Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
the various Serdes port supporting different Media Independent Interface
(10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).

This follow the new PCS provider with the use of #pcs-cells property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/pcs/airoha,pcs.yaml          | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
new file mode 100644
index 000000000000..8bcf7757c728
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/airoha,pcs.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha Ethernet PCS and Serdes
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN7581 SoC expose multiple Physical Coding Sublayer (PCS) for
+  the various Serdes port supporting different Media Independent Interface
+  (10BASE-R, USXGMII, 2500BASE-X, 1000BASE-X, SGMII).
+
+properties:
+  compatible:
+    enum:
+      - airoha,an7581-pcs-eth
+      - airoha,an7581-pcs-pon
+
+  reg:
+    items:
+      - description: XFI MAC reg
+      - description: HSGMII AN reg
+      - description: HSGMII PCS reg
+      - description: MULTI SGMII reg
+      - description: USXGMII reg
+      - description: HSGMII rate adaption reg
+      - description: XFI Analog register
+      - description: XFI PMA (Physical Medium Attachment) register
+
+  reg-names:
+    items:
+      - const: xfi_mac
+      - const: hsgmii_an
+      - const: hsgmii_pcs
+      - const: multi_sgmii
+      - const: usxgmii
+      - const: hsgmii_rate_adp
+      - const: xfi_ana
+      - const: xfi_pma
+
+  resets:
+    items:
+      - description: MAC reset
+      - description: PHY reset
+
+  reset-names:
+    items:
+      - const: mac
+      - const: phy
+
+  "#pcs-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - resets
+  - reset-names
+  - "#pcs-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcs@1fa08000 {
+        compatible = "airoha,an7581-pcs-pon";
+        reg = <0x1fa08000 0x1000>,
+              <0x1fa80000 0x60>,
+              <0x1fa80a00 0x164>,
+              <0x1fa84000 0x450>,
+              <0x1fa85900 0x338>,
+              <0x1fa86000 0x300>,
+              <0x1fa8a000 0x1000>,
+              <0x1fa8b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XPON_MAC_RST>,
+                 <&scuclk EN7581_XPON_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
+
+    pcs@1fa09000 {
+        compatible = "airoha,an7581-pcs-eth";
+        reg = <0x1fa09000 0x1000>,
+              <0x1fa70000 0x60>,
+              <0x1fa70a00 0x164>,
+              <0x1fa74000 0x450>,
+              <0x1fa75900 0x338>,
+              <0x1fa76000 0x300>,
+              <0x1fa7a000 0x1000>,
+              <0x1fa7b000 0x1000>;
+        reg-names = "xfi_mac", "hsgmii_an", "hsgmii_pcs",
+                    "multi_sgmii", "usxgmii",
+                    "hsgmii_rate_adp", "xfi_ana", "xfi_pma";
+
+        resets = <&scuclk EN7581_XSI_MAC_RST>,
+                 <&scuclk EN7581_XSI_PHY_RST>;
+        reset-names = "mac", "phy";
+
+        #pcs-cells = <0>;
+    };
-- 
2.53.0


