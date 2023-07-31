Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED6EC001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uZCgaHt6y0G9LY7vDaFQJNWdSmXIsLwJ73MJZVfrRMs=; b=EDkDvSubdfiw5nnMwMPcFf2dqp
	StAiyoIDD72iBvMALmAJP2I0gybQmOy0Hir6HVRcRWQrLP/kN49EYvCBfXdP1CuSdsNYLUxtrdszk
	WRLHat+OyPmaQUxhap7B9irbwW3zhH657uQekN9aOYbdMMdfPfZzrzgzaNcl04wMhM7ZUTznnxHGV
	mHaZyJv1AYTMDx1GA4p0eZteczWBq95YHZJn2xy4/RVjx/Mhs6sBkTsOIGO8mtaxpamStd5TfyyX3
	jjxRHxnTL8m2d/U5oDjSrlIkwHttdduzpruDUk9LWZAMGMjvPFBR+tn/8pL3neD42xUL8DhcYbP/N
	WB/qIlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQbJ3-00HUQn-13;
	Mon, 31 Jul 2023 22:24:01 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQbIz-00HUPm-2z;
	Mon, 31 Jul 2023 22:23:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qQbIe-0002Rs-10;
	Mon, 31 Jul 2023 22:23:37 +0000
Date: Mon, 31 Jul 2023 23:23:16 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 1/2] dt-bindings: mt76: support setting per-band
 MAC address
Message-ID: <d3130584b64309da28a04826100643ff6239f9ca.1690841657.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_152357_966165_8D176F81 
X-CRM114-Status: GOOD (  14.04  )
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

Introduce support for setting individual per-band MAC addresses using
NVMEM cells by adding a 'bands' object with enumerated child nodes
representing the 2.4 GHz, 5 GHz and 6 GHz bands.

In case it is defined, call of_get_mac_address for the per-band child
node, otherwise try with of_get_mac_address on the main device node and
fall back to a random address like it used to be.

While at it, add MAC address related properties also for the main node.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
Changes since v2:
 * drop items list with only a single item

Changes since v1:
 * add dt-bindings

 .../bindings/net/wireless/mediatek,mt76.yaml  | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 252207adbc54c..7eafed53da1de 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -37,6 +37,12 @@ properties:
     description:
       MT7986 should contain 3 regions consys, dcm, and sku, in this order.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
   interrupts:
     maxItems: 1
 
@@ -72,13 +78,23 @@ properties:
 
   ieee80211-freq-limit: true
 
+  address: true
+
+  local-mac-address: true
+
+  mac-address: true
+
   nvmem-cells:
+    minItems: 1
     items:
       - description: NVMEM cell with EEPROM
+      - description: NVMEM cell with the MAC address
 
   nvmem-cell-names:
+    minItems: 1
     items:
       - const: eeprom
+      - const: mac-address
 
   mediatek,eeprom-data:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -213,6 +229,29 @@ properties:
                     description:
                       Half-dBm power delta for different numbers of antennas
 
+patternProperties:
+  '^band@[0-2]+$':
+    type: object
+    additionalProperties: false
+    properties:
+      reg:
+        maxItems: 1
+
+      address: true
+      local-mac-address: true
+      mac-address: true
+
+      nvmem-cells:
+        description: NVMEM cell with the MAC address
+
+      nvmem-cell-names:
+        const: mac-address
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -225,10 +264,13 @@ examples:
       #address-cells = <3>;
       #size-cells = <2>;
       wifi@0,0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
         compatible = "mediatek,mt76";
         reg = <0x0000 0 0 0 0>;
         ieee80211-freq-limit = <5000000 6000000>;
-        mediatek,mtd-eeprom = <&factory 0x8000>;
+        nvmem-cells = <&factory_eeprom>;
+        nvmem-cell-names = "eeprom";
         big-endian;
 
         led {
@@ -257,6 +299,20 @@ examples:
              };
           };
         };
+
+        band@0 {
+          /* 2.4 GHz */
+          reg = <0>;
+          nvmem-cells = <&macaddr 0x4>;
+          nvmem-cell-names = "mac-address";
+        };
+
+        band@1 {
+          /* 5 GHz */
+          reg = <1>;
+          nvmem-cells = <&macaddr 0xa>;
+          nvmem-cell-names = "mac-address";
+        };
       };
     };
 
-- 
2.41.0

