Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2385C4167D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 21:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZM+SCmKkNB/P4aatmpnUY/Tqe989m6CqxBgRf6EbxDE=; b=Nk4RpdD/fj8nJzBGDoIG/wp3pM
	lORf4zypq+Swj1tPxBwdxCNu0wqonkGhojAVsvBylJcdhzYP4O/UkEsUZwoOPnpLYCudYveABeuE8
	B4oPtS/rfxy0q5gzzLq5qWRC6Jnfri+S82qHckvZWXNeZ9u1zZDdP00WHD1Yuhwxdz0f4WoDtpcg1
	NTUn24GYxXhiUQVo6PbEZui7oSpEM4WrYkDxzG+A9tSuPgsWtoq9OjSeLjA0QLzkBDwU6LKDkfRSG
	04lGVejRK2+Kj5WfGJpJf9ocHinRxUfHxrxydl7dL6NOzUwBo97Y7JpM/aK+zlYhqdLXduMIcTsjW
	P5KC3Siw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Cwa-007IlT-27;
	Thu, 09 Nov 2023 21:52:08 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1CwU-007IiY-1S;
	Thu, 09 Nov 2023 21:52:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r1CwI-0003Y5-34;
	Thu, 09 Nov 2023 21:51:51 +0000
Date: Thu, 9 Nov 2023 21:51:47 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH 5/8] dt-bindings: net: pcs: add bindings for MediaTek
 USXGMII PCS
Message-ID: <2dff6aff7006573d3232ec2ddd93c1792740d4d3.1699565880.git.daniel@makrotopia.org>
References: <cover.1699565880.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1699565880.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_135202_491001_0D52A21E 
X-CRM114-Status: GOOD (  15.29  )
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

MediaTek's USXGMII can be found in the MT7988 SoC. We need to access
it in order to configure and monitor the Ethernet SerDes link in
USXGMII, 10GBase-R and 5GBase-R mode. By including a wrapped
legacy 1000Base-X/2500Base-X/Cisco SGMII LynxI PCS as well, those
interface modes are also available.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/net/pcs/mediatek,usxgmii.yaml    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml

diff --git a/Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml b/Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
new file mode 100644
index 0000000000000..199cf47859e31
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/pcs/mediatek,usxgmii.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek USXGMII PCS
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+description:
+  The MediaTek USXGMII PCS provides physical link control and status
+  for USXGMII, 10GBase-R and 5GBase-R links on the SerDes interfaces
+  provided by the PEXTP PHY.
+  In order to also support legacy 2500Base-X, 1000Base-X and Cisco
+  SGMII an existing mediatek,*-sgmiisys LynxI PCS is wrapped to
+  provide those interfaces modes on the same SerDes interfaces shared
+  with the USXGMII PCS.
+
+properties:
+  $nodename:
+    pattern: "^pcs@[0-9a-f]+$"
+
+  compatible:
+    const: mediatek,mt7988-usxgmiisys
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: USXGMII top-level clock
+      - description: SGMII top-level clock
+      - description: SGMII subsystem TX clock
+      - description: SGMII subsystem RX clock
+      - description: XFI PLL clock
+
+  clock-names:
+    items:
+      - const: usxgmii
+      - const: sgmii_sel
+      - const: sgmii_tx
+      - const: sgmii_rx
+      - const: xfi_pll
+
+  phys:
+    items:
+      - description: PEXTP SerDes PHY
+
+  mediatek,sgmiisys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon node of the corresponding SGMII LynxI PCS.
+
+  resets:
+    items:
+      - description: XFI reset
+      - description: SGMII reset
+
+  reset-names:
+    items:
+      - const: xfi
+      - const: sgmii
+
+  "#pcs-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - phys
+  - mediatek,sgmiisys
+  - resets
+  - reset-names
+  - "#pcs-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt7988-clk.h>
+    #include <dt-bindings/reset/mediatek,mt7988-resets.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+        usxgmiisys0: pcs@10080000 {
+          compatible = "mediatek,mt7988-usxgmiisys";
+          reg = <0 0x10080000 0 0x1000>;
+          clocks = <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>,
+                   <&topckgen CLK_TOP_SGM_0_SEL>,
+                   <&sgmiisys0 CLK_SGM0_TX_EN>,
+                   <&sgmiisys0 CLK_SGM0_RX_EN>,
+                   <&xfi_pll CLK_XFIPLL_PLL_EN>;
+          clock-names = "usxgmii", "sgmii_sel", "sgmii_tx", "sgmii_rx", "xfi_pll";
+          resets = <&watchdog MT7988_TOPRGU_XFI0_GRST>,
+                   <&watchdog MT7988_TOPRGU_SGMII0_GRST>;
+          reset-names = "xfi", "sgmii";
+          phys = <&xfi_pextp0>;
+          mediatek,sgmiisys = <&sgmiisys0>;
+          #pcs-cells = <0>;
+        };
+    };
-- 
2.42.1

