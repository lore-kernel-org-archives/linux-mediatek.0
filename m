Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E470CA6019
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=; b=3+xSlkx/+OiV68zYPwpjjGNtSX
	R/F61zPPRPim/DpTJHmx/bhuedaTgL4o6VxqPTTJYldUWWn/MoMSdZCTwJG6u2vVEeRKKULBFaUgh
	5zs8ucVXFSphOA4fSAtD4v2WFloM/uCkRIQZHuHwj/R5PWwScRnBohVPEmjD50FfPggxAag2lb4SZ
	F4nCyhHKFOs+AG5tWeyScKbg8zsigYBpn4CWEgRA0DqvWxMOZZMx523ChVwViC2NUt8A0qdE5qq0U
	sRD9petzFPr6tzzD7A831ejXlE1jIGiWsX9ftz6UMX8E9dHEIV4M6TMgP81k9jKhz2EaNYhBiK7TO
	vAlf+Uwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBn-00000006cNI-11KM;
	Fri, 09 Oct 2026 16:11:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDBj-00000006cMJ-0lRw
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 16:11:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48af27fe287so3234405f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791562273; x=1792167073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=WOCWo1imHeaV6y7yCHV8TXOg2t42HQLmbd9BqPjA6H3OO69azyLjzPseMlffwIOKKP
         05o+RYVUDxUb2LgwvuwyEXNhb0tiYOYkeG9cr3FJz3cYjnnewdo79kiwnSNhtZj54UL5
         gTNRgeavHvPwPRwddtBDSHSoUZIJCDZeMqsQJKiiFS0vamdXYE4ywUN40fUEBIkBRN1S
         AhX7ZNHYUJfIuCyWZRedCQebDCHLl4OpkCsM/jQ5GDVe9sMSETdoLw/CPRQdivxBk8Qz
         pp4z+Hjfhdy/MChj0C4PNEQUs1NyU7tlMchdjzIsbWYTRiuiWPBywHGHgB4P+RjX7ma+
         DuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562273; x=1792167073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sGFrWQujhzJh9uPF6notnBiKMTrdwWirz/MP50Av2KE=;
        b=1l4p4ZYi28tEvIRqq8O3ATlGP4l9OB3fLMCsTaCwG5XhtrmlN++NasIZjFzRDlIpve
         SbeKJ48dCJUFJ50IUzezgGxnEsBHqiR3juuFBTbnA5uYVnjB2GXfg5SR1kgBLh/fCL7c
         tBMXoppiLPar+SusWbSyd7jJIh5DJAzAxi6zeqj/KtIrMmOTOhRskji/GysCRwWiTiUB
         MoQmJr6GlZwOvUxX83Tzfcz7ZAPLcbgfNewDunHqPNVh41KxnAYRXv1ZphKLOAuqwuCM
         QX44Ri+Zva6jgTgwBz7erBnugG+JVnVJHIsn8qHP/YXGFNQeVUEJ6pstgkvchDFx+6/R
         7ezQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAi9SVJ/T5T1M6UGXEw5UM+rmoW51kuIvnQjqbFkRXQts5G6tT/M2T13A/jPP+tQw+pf5B7wPOtXz1hUXmnw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJsdpJo209AjabFPEM924wHlmBcM2gYI8NtJJyDTj4/WlHDLe4i
	7idlkjQROEhXJMyJjgi6k+gI1nW5nAAq/S0Mrognzr1JSroreTpzihmD
X-Gm-Gg: AYBFou3lNWp3FSQN3fomQ67hOWHKfik5P8h3h65+aEWE2RemDsCFroYl/YnxMBdys0o
	91pQ4f8Vgl3Tupu7HV+WBTTqn8n3z1RMkfjOOhspn0n9ni4mmH2BzVNfYMLGc2xV/I0H/rE0KU5
	iy41g4Od78dFe6NrrjwnQqbJMgUUAFwVGJMDbC6RkhaFOKA2wLtMB0Df3pc2pQsO8lbUFC9bNjf
	JMFzzDRw6WHFsbW5n/8bHWXIL+FvwO8KwaEmOXcdkGewxq72HlfHcL19hbKco4yPIUQ36uL999Y
	5UW2d/Ntko1GcCcof0jc03BOWQxqaIliXsYSFXh7lxPTdx64fq3IoisWV1tHKQ8pw5/vaw5Lx8P
	mnkJvIZBHHIpQs2/SmSPGHa3VjAaeSYtgTrYKlTAt+36ezDc9BoyJ4mJh1e9HPYrkqqhKGCzNGg
	u/bP9vvlL65shgI6RCuzuo6Ef5ylv8O1tkng3oKc4jWCuJ4VegSvQwnDM+pTcX2QlE7a3WUL26H
	lzLsbbY5gVEqqPK6LHfymfQMtmhk1W7BS2xFUi0+QUvvnE9szEIGnYdLNua8H+kljbAbYysA+FD
	6m7IfwYnMKNHnJ+IIw==
X-Received: by 2002:adf:e007:0:20b0:48c:656a:f36c with SMTP id ffacd0b85a97d-48dba77cefbmr3915875f8f.3.1791562272816;
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e2f08sm4744701f8f.15.2026.10.09.09.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:11:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v25 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Fri,  9 Oct 2026 18:10:46 +0200
Message-ID: <20261009161102.38961-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161102.38961-1-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091115_252244_738DCDFA 
X-CRM114-Status: GOOD (  13.37  )
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.55.0


