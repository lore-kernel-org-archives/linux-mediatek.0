Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055CAC4167B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PuPfc3pKT54jXiYQ8Ndfth4/oA2Qy9PCNWIdvTn7YQ=; b=M9HQ28rt6Uu1dL58a0kwDM3J0g
	+OPrsstoo25FF4TolUDS2aTZt7jZdmU+imowAVMjtHIyUr8XjPqlteIBBnrADSsMLF2nrFO5eKYSB
	OIVRCSlbaMskpnC32TsZ3/izRDytJnDcBIAWEkdEglG4MeqkFhfDRyZVLw3/BQqh8yyvjd8Panzho
	uT7eMPnBNAzKFHvmkOHRud2Hg1JL6EAYumHH4vpaJv5Fo2eebCDHLCt9/qOhn71lFkNHdbftkJHtt
	7jpO5jdiJg9douufaN2ecs/NI0p/iBbESP0NzlFhNqIAMW+LxzHXCbjEHpv5fAulo7sd6FK+TqHtj
	GDEa00qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LX-00A4ey-2c;
	Sun, 26 Nov 2023 01:54:07 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LM-00A4Z0-2E;
	Sun, 26 Nov 2023 01:53:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so21177335e9.1;
        Sat, 25 Nov 2023 17:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963634; x=1701568434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PuPfc3pKT54jXiYQ8Ndfth4/oA2Qy9PCNWIdvTn7YQ=;
        b=gfrRuHhGRJ4eVjdOBn8R69LsFWTvxQTNVi8gvM2ym033FI7+HHOFP72KA2Hm4wEsvT
         DhyS5zOB5nZwm7nILAUECyfIGg3XYTBzeg+Daa/KJwUpvZh9cBzYM5cMAAEWDMEzbhE6
         8MvLEr3YoaJlet7D9Jd7jCM8paLNHTMjRWEua7fUPDUtZMerdRGnC27F7bJOaUsZW5ro
         0sd//8bdMGOI9N++HsqrI50m2M1Df8SgbGzbAJ25g8HCgQ2guRcUeVIuMHWC+u1yYcD8
         hjid3XTxJ+oh9oS+/0zrYKfrXeYI22MQA72G79Re7FjXrS7t5ywgjADyHdjdbvRBxeXl
         FgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963634; x=1701568434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PuPfc3pKT54jXiYQ8Ndfth4/oA2Qy9PCNWIdvTn7YQ=;
        b=PkuFVdHt5HSr+2xxvW9ZFe515L2p9ga8GfgbeBdSTdGVLLJVCMeizbX1ZC81S9ceLU
         CvDNh1n4jTqGnQa9NjL+2Ukqc2D9FtOnUqAEGNl4UFwAUwFM32RSJIlcGguoWvCzAlvF
         7YVs7NyzuVRcd82uWKqTFR4uzo2CCMazG49OgrG+4XhgfsLHxOr4w9zCjBs0gw5L05uN
         +lBy2MAx9xvD/CqLB32H3fNJhK4oI9kD0xqHt9jGS8MeM9RVvMjHAFC5L2B3z6SM0ecM
         5T1ZcYxTT3OK3U7N1JlDRMTWBOgHy1H/AfqPkNVrETsoWaSjSnvMgEH9njKRAma1f2Yl
         iQpg==
X-Gm-Message-State: AOJu0Yydv7ph3Oahgkp8x7I00NoMtSwYrbzAI64URGG9jQWUZt/a5LNq
	ThVnuOmftUZjp1J94c5dZ1o=
X-Google-Smtp-Source: AGHT+IGT3kVk/Y70H/CEAP1Ju5gLlYhiOA1oBECCTELXr6jvCovt5uh7h4dHEkHO63rUGI9WO9Z/HA==
X-Received: by 2002:a05:600c:4e8e:b0:405:7b92:453e with SMTP id f14-20020a05600c4e8e00b004057b92453emr5936349wmq.37.1700963634259;
        Sat, 25 Nov 2023 17:53:54 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:54 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet PHY package nodes
Date: Sun, 26 Nov 2023 02:53:39 +0100
Message-Id: <20231126015346.25208-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175356_728581_614FBAB2 
X-CRM114-Status: GOOD (  17.38  )
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

Document ethernet PHY package nodes used to describe PHY shipped in
bundle of 4-5 PHY. The special node describe a container of PHY that
share common properties. This is a generic schema and PHY package
should create specialized version with the required additional shared
properties.

Example are PHY package that have some regs only in one PHY of the
package and will affect every other PHY in the package, for example
related to PHY interface mode calibration or global PHY mode selection.

The PHY package node MUST declare the base address used by the PHY driver
for global configuration by calculating the offsets of the global PHY
based on the base address of the PHY package and declare the
"ethrnet-phy-package" compatible.

Each reg of the PHY defined in the PHY package node is absolute and will
reference the real address of the PHY on the bus.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-phy-package.yaml    | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
new file mode 100644
index 000000000000..244d4bc29164
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PHY Package Common Properties
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  This schema describe PHY package as simple container for
+  a bundle of PHYs that share the same properties and
+  contains the PHYs of the package themself.
+
+  Each reg of the PHYs defined in the PHY package node is
+  absolute and describe the real address of the PHY on the bus.
+
+properties:
+  $nodename:
+    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
+
+  compatible:
+    const: ethernet-phy-package
+
+  reg:
+    minimum: 0
+    maximum: 31
+    description:
+      The base ID number for the PHY package.
+      Commonly the ID of the first PHY in the PHY package.
+
+      Some PHY in the PHY package might be not defined but
+      still exist on the device (just not attached to anything).
+      The reg defined in the PHY package node might differ and
+      the related PHY might be not defined.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: ethernet-phy.yaml#
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package@16 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ethernet-phy-package";
+            reg = <0x16>;
+
+            ethernet-phy@16 {
+              reg = <0x16>;
+            };
+
+            phy4: ethernet-phy@1a {
+              reg = <0x1a>;
+            };
+        };
+    };
-- 
2.40.1


