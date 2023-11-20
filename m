Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D74C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSkXFy8s0m4FAo3hSta1RKyG8KAPqujjDp76lrQjrQM=; b=hcYzsZJbKToWgv/PT4n+ndsme4
	gmJOZMn5SJopZIHS6KPlmfEJ5hNpZjtMCwsRPEloXGY2LUKL1s1BGGzjCfoE9HcUtSFF4w/WkyNBt
	xHkAI+OWj7ACS4h0tvG44oRrS+O0gelgFoOINnj7jnZnEgbbF+M0pjPPteJ2zkGcc2yLxlAMmM9lh
	ABEOLOQBf+EdFtcTdAztst+dYUv8gL8ozkaEQB6WdQOTytgAI0DZjrsiKLTkOVTgvuofZjd/cLAOM
	YZCVfwr3JtwL+d38S+NrEP4zVzxgMHynNGh9vecY6Fzre2w4H33cfBzp5ZsXHsoFY7vX2J8TmZdPu
	cmWVXUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lJ-00CRlO-0w;
	Mon, 20 Nov 2023 15:00:33 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gI-00CBeT-0g;
	Mon, 20 Nov 2023 13:51:22 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so53152231fa.0;
        Mon, 20 Nov 2023 05:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488276; x=1701093076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mSkXFy8s0m4FAo3hSta1RKyG8KAPqujjDp76lrQjrQM=;
        b=no0avn0fnVOOZ8ijIHRqjoWyd0CwEP/Atx6vzsV5z1mQE67zwIsouKF9Q35113GsZj
         QTqKDME/0rYpxyAFjYzKk1n3JbhWuUjou0duu9OLUMCT31nwApc1SDfXl4utADVNwhCG
         pjQt7swK0KZ1M+29Eq4rrQWoQHFS5BvAwFsjwn3yWOgmoM2RmTz5bzFjh3/CdpG1UhYR
         KbdIC7y5/Uq/53aPdIeA5/ZYfAIBMLepSm/tzKxQKsskfaPj1n7C4szRO2ObTHrBGnFh
         W+IkqGz3n2BFggoGYrjUnYHkSQ2zEvZ9WfHYGcZE8x6iIfNWRIUKivxerkVbvxM26bcO
         Vm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488276; x=1701093076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSkXFy8s0m4FAo3hSta1RKyG8KAPqujjDp76lrQjrQM=;
        b=eAdV2jGYy4GE+CxfRcYbjJ97AWez9FiOxBc4yS47dOZC8jwWCmKY79mXMTiBmjyOFr
         aj5WhRv12qVJraq5HEe9au+aZq10t3rjXwUjfjAOq6k4gf3pZMoQmbtwzcK4Nsi3JmxC
         6zyeM6BxhDAwe51R1Wlpe0zQCHQrO/BmgtO9Z8zFdWRrINdgjfTotTIqz4hda5HWcV8N
         wXp52/HNZwUE4u9oo3cPJ2V2TcuXMYR/iPdzcAHazuGTHxZ3bVUAkwqRieELrq7t0Y2H
         i+9n6vD30VqoQW6CqaviCyzxU039bQ4HlsVsDT+Z66nLJhGWj3TV/h5rp3TG3O+z1U2q
         RmUg==
X-Gm-Message-State: AOJu0Yx4KM8okV5VFGLzxF77ZTr5/PBCLzdQ56SejK7YPyjW0smnNHNE
	fIoXMxdv9e7QByTq6ucvWXo=
X-Google-Smtp-Source: AGHT+IGRWPskxjGA2rJREXkXtdcG94gsGR4fcmJx18lPkb4K8zHD6Ut0hUV6FgYsk/XQHGBG6tApZg==
X-Received: by 2002:a2e:9192:0:b0:2c5:2eaa:5398 with SMTP id f18-20020a2e9192000000b002c52eaa5398mr4967418ljg.25.1700488276123;
        Mon, 20 Nov 2023 05:51:16 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:15 -0800 (PST)
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet PHY package nodes
Date: Mon, 20 Nov 2023 14:50:30 +0100
Message-Id: <20231120135041.15259-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055118_253275_713EE29F 
X-CRM114-Status: GOOD (  16.78  )
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
bundle of 4-5 PHY. These particular PHY require specific PHY in the
package for global onfiguration of the PHY package.

Example are PHY package that have some regs only in one PHY of the
package and will affect every other PHY in the package, for example
related to PHY interface mode calibration or global PHY mode selection.

The PHY package node should use the global-phys property and the
global-phy-names to define PHY in the package required by the PHY driver
for global configuration.

It's also possible to specify the property phy-mode to specify that the
PHY package sets a global PHY interface mode and every PHY of the
package requires to have the same PHY interface mode.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-phy-package.yaml    | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
new file mode 100644
index 000000000000..2aa109e155d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ethernet PHY Package Common Properties
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com
+
+properties:
+  $nodename:
+    pattern: "^ethernet-phy-package(-[0-9]+)?$"
+
+  compatible:
+    const: ethernet-phy-package
+
+  '#address-cells':
+    description: number of address cells for the MDIO bus
+    const: 1
+
+  '#size-cells':
+    description: number of size cells on the MDIO bus
+    const: 0
+
+  global-phys:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 31
+    description:
+      List of phandle to the PHY in the package required and
+      used to configure the PHY package.
+
+  global-phy-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    minItems: 1
+    maxItems: 31
+    description:
+      List of names of the PHY defined in global-phys.
+
+  phy-connection-type:
+    $ref: /schemas/net/ethernet-phy-mode-types.yaml#definitions/phy-connection-type
+    description:
+      Specifies global interface type for the PHY package.
+
+  phy-mode:
+    $ref: "#/properties/phy-connection-type"
+
+patternProperties:
+  ^ethernet-phy(@[a-f0-9]+)?$:
+    $ref: /schemas/net/ethernet-phy.yaml#
+
+required:
+  - compatible
+
+dependencies:
+  global-phy-names: [global-phys]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy-package {
+            compatible = "ethernet-phy-package";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            global-phys = <&phy4>;
+            global-phy-names = "base";
+
+            ethernet-phy@1 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <1>;
+            };
+
+            phy4: ethernet-phy@4 {
+              compatible = "ethernet-phy-ieee802.3-c22";
+              reg = <4>;
+            };
+        };
+    };
-- 
2.40.1


