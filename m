Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A80C5DF70
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 08:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=; b=zZ5Ob5VtBLqR2r6hyIvfhgqIf1
	ErCz81wkZ5Uy9QCywLO1PsgCbyb+X/xf+uEBbeivVaxtaZQD1WhNJB/tpVBSP3DUeVu/AfkBciu/j
	BWVCSV6U2G2M8Mv1dxzEF4IkzLcL8Wvj7p15FXckpM+jXR7haF0g7O5SAcHKLuNEAbIUIphbHzA0t
	XOpjoQfJ6DNJE+mfSZfgxyFaKHHC0P3gCMX2bsDnLN2NjQLDbfF/eZOAaNRxU36D+79m/3RknGjLl
	Hu64vp+rd/kyMkYS9TAZNEsSRys+XPMhiZ49+jnHSwmZI8r8TCOJtyrG+TWvYqcJuaRs8nKkr7FoC
	eaqmBJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaO-00000005ePz-3TkK;
	Mon, 17 Aug 2026 08:20:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsaM-00000005eO9-2Q0h
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 08:20:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954d29264cso14958165e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786954845; x=1787559645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=bIn6guHFwUCOnI7y9/G0gm1FIh40vd8ZSFAdNOogQqCF3sdOKgpRFMBYuOF7PfyQyX
         vU5NwTtybhVT3pnHhph6/lhRF111ycQgTUmZupDAnltYzjQul0dNQU0x2cGu/klyNl/K
         FexUTWsCkJBR1wmuAyH3+WQKYSirexH3I3JqcZJx5GxUAvdYoc/Se8o1HLwTRhMuX6ry
         woIHNb06AHfHifyhwdhCUC7LHbhrkhONXjGt6l50z/ANLM3RjVBB3Hm8O3gsPURG2Vm9
         63Ch5cpi35kdcRT4jxyIgJnyt5KPHo3KldfP5IKGNrrA4HTPYjGBV6Se0SBwNReCsdV7
         7YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786954845; x=1787559645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=MIwEd/mVTE3IetmnC7A50L4ccMkBpqcPq/mqVZ1QEwCFi/u/s/sJM9xIcD7FpH5sUW
         Uo0IEOJbvjcz0dqyGW3/UexsNJS8EGt5nJQazyDbr0Ty5c13gdMD+lr2yWs251YNQkZo
         +sgRXJakSKxvgpy5R5tuvX6xGCdOdonftcormxMMOn2ifQTziencl7LqoEG9h3F2YmBq
         /EN4ODUsHjRPx2SZC5gOakhUfXO72jlmAUUZvPIjGP8WsAiBKMZHH8bDEURthrt1Zw1F
         kRUtivn93VxMdb1wc2SbOopvtMc8q/5ljlnkP5zr1cNejbNdjBu++QylPHhzGM2O1hcJ
         afig==
X-Forwarded-Encrypted: i=1; AHgh+Rq5xz1q3kTefI7u0X0e2XxPSngcNtgl0BeHW7v2+jr8fFTA2VwXvKaYCNqLPhI43avObIaAN3OCXGrLVX2fMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSbZhG2J3drgmVIpqKghXfR02eSTKOjR6gOySBD1GTKkTmqcLW
	RhIpXhBPvg5OzJG3qavWAbRZP28MA6jh149+AIl8ZGBu5w9CxbEe26v4
X-Gm-Gg: AR+sD118ckM4frrWL0zTGlu7g5YRxvhX4KsHGl28oXWEMr5Gr3zgkFeFp7jUFYgdom1
	vGgqOtYicB1jFYOm9HpXT78r9CLwXfejTXdti3AvMn5j7elOPyf8FRbFf8esPxlmVqYoMATav8N
	ctDd2PPtXuc9dg44IBUdhFvtXLXyf4A2wo8nLoaUawPL+HIxwmFGNZSon2OIouFMnM1Yk6nDQRO
	yEp+A2xloev1IGZQyL0NGsa+ZobPD55vJB7wvoIeDWg1HwyPRlVh2YReSXdgtx7pusI89Qexn10
	VlSpGjLc4JLXLkAy8G4YV/cW29dSCXAKPiU8AxducposhyAhOqGaUxVZWqRqMf9zp91eOAcytsr
	US61zOySCw6tAWHSw7Z15M6mR2wNTws258gVdp2ORhK9xQjpfnangyAnTN5V3s/LoV+FjpHAWSp
	V9RM3im9EjpLZlHQuZ5cdHBnZnkyvt1BcsFPbG1BTmfuEbnpt49zQdPwqKHUjBXYjKQ/KSAxZ1M
	OLeUQRA0vLaebvaUIc5gfEbFEsx2WVqsJ99GcnxasKnU7H/tVA8bky+k1WaqnRmR1wQ
X-Received: by 2002:a05:600c:8218:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499879357cemr398067875e9.1.1786954844530;
        Mon, 17 Aug 2026 01:20:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-40-190-175.business.telecomitalia.it. [79.40.190.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4999d078517sm19684195e9.5.2026.08.17.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 01:20:43 -0700 (PDT)
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
Subject: [PATCH net-next v20 01/10] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Mon, 17 Aug 2026 10:20:22 +0200
Message-ID: <20260817082034.20326-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082034.20326-1-ansuelsmth@gmail.com>
References: <20260817082034.20326-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_012046_644532_E50A414D 
X-CRM114-Status: GOOD (  13.23  )
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
2.53.0


