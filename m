Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04947C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+hxTQQTGqrnHf+7NdmOQmI3+7dcE8VEDUJcKhbYFHE=; b=ksLyvQeYimPJFU
	/8muUHKR07XaRfk/YZ+h4PfnatPHHo1p9dKIfM9LVPBlS5x1OcMpiFuKE5qrY3URBMAhMttIS53+4
	E1tl0mt2JP/HjumSdg5z+EjJrMe+aE7wDvKwBy410F7XAdlhPL9RW0OkAR4XZrluexRTIFr4B2/Jp
	GecOlTpY6kfSSuvphEkEjZSVefij0mXhBOhZE0t2ogbxkFFZtg8afj0JnLdP/4E7rCW0a8KXVLu10
	6WhX31Kd+6HHGRjlKbgLIejwZ9CJFm103aScDm/Tkb2VJxhHj03dPlxhsmnQiMSOvt1ORm32P12Ht
	CGjaSgSZS6AYeUigXaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbpKB-002SsC-4s; Tue, 05 Apr 2022 19:58:47 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbpJd-002SaZ-C3; Tue, 05 Apr 2022 19:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YY6foXzBPkeKgwXFtBBUDugou4a7a9Ouq6nJmtz/VTE=; b=HJX9KH3+gWEKbHXeU2u6OfEqLE
 sIY/1dU9ZKoUO9DdUg9FaLMEjlven46KBL0eQMSxoY0sszKgi3vvdiWWiG0pB6RQjYtkUKHsVWkOY
 2nngF51Dr+gE15aqMVzo66OKUnJh4nuksWQz9SwZGodmGvy6AQyYhGNRWstQfMHC8gAc=;
Received: from p200300daa70ef200456864e8b8d10029.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:4568:64e8:b8d1:29] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nbpJR-00035V-B8; Tue, 05 Apr 2022 21:58:01 +0200
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/14] dt-bindings: arm: mediatek: document WED binding for
 MT7622
Date: Tue,  5 Apr 2022 21:57:45 +0200
Message-Id: <20220405195755.10817-5-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405195755.10817-1-nbd@nbd.name>
References: <20220405195755.10817-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_125813_609723_F1FA973F 
X-CRM114-Status: GOOD (  15.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

Document the binding for the Wireless Ethernet Dispatch core on the MT7622
SoC, which is used for Ethernet->WLAN offloading
Add related info in mediatek-net bindings.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 .../arm/mediatek/mediatek,mt7622-wed.yaml     | 50 +++++++++++++++++++
 .../devicetree/bindings/net/mediatek-net.txt  |  2 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
new file mode 100644
index 000000000000..787d6673f952
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-wed.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek Wireless Ethernet Dispatch Controller for MT7622
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+  - Felix Fietkau <nbd@nbd.name>
+
+description:
+  The mediatek wireless ethernet dispatch controller can be configured to
+  intercept and handle access to the WLAN DMA queues and PCIe interrupts
+  and implement hardware flow offloading from ethernet to WLAN.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt7622-wed
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      wed0: wed@1020a000 {
+        compatible = "mediatek,mt7622-wed","syscon";
+        reg = <0 0x1020a000 0 0x1000>;
+        interrupts = <GIC_SPI 214 IRQ_TYPE_LEVEL_LOW>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index 13cb12ee4ed6..1c8dc44bbb52 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -46,6 +46,8 @@ Optional properties:
 - mediatek,cci-control: phandle to the cache coherent interconnect node
 - mediatek,hifsys: phandle to the mediatek hifsys controller used to provide
 	various clocks and reset to the system.
+- mediatek,wed: a list of phandles to wireless ethernet dispatch nodes for
+	MT7622 SoC.
 
 * Ethernet MAC node
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
