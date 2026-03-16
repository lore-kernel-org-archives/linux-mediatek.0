Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A37F53D6D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2026 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRiPz9a4SpQjGmlka47ayeQWMe+U7ftfbmH0XfIDxo4=; b=Q9g0h2e9jPnQyPxgFeI5dhQB3P
	0ujq59QxPHbfl/6GVw/GdZ216TUzeVkO/5JHPpN74zSlz7f1kxjUX5t546ChBL2LLuuY+K3U3hbY+
	tn9jpnuB2qMQPvRwJpJGSS9frkfZNmcf1zkhd5Quu5FZllpF21OazO/kzk+NySrKRhPAo4mIJgIRW
	0wOgSvdrmiW+vsFPChw5U1rI/F0qFeREAYRdMWa8FZNoUkZLCvqKW3Nf2WqtWxi+dwAKPUcpnCZO/
	k7Oh9/B2+YGzHubFkCy44eKbhvf7ejTbFxXUoKJeZF68pjHza3JTcILiJi1M7TF1ZDP2e54jqUBb6
	OORUA8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AEy-00000004NVa-0uEs;
	Mon, 16 Mar 2026 15:52:24 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AEv-00000004NTa-09Q8
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Mar 2026 15:52:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 828EA302833;
	Mon, 16 Mar 2026 16:52:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773676336; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nRiPz9a4SpQjGmlka47ayeQWMe+U7ftfbmH0XfIDxo4=;
	b=HS7fPIfF82+G1igAcixBu+g4xNDb8ffUhwDVFYU1QUa0Ht3uSUUAe2pL4EbGO+heYRYqkh
	gPctVN4dwUvmIGPl9HiOoroCWW7p2izAYD1ugu+oqlnFNSv416T780tqyWjnQFTBkbOMPr
	xgKUdH9mYbHucRi/3kGbbgvOFYqm0N2aW2qO6/EA2oaVszRtC5XXzlJA6mLPFzfheLULX3
	DkESfk7aC3/cXOO1oiGylbpkXi4UsBgAEp17+uWjv7/IYcitUWR+nhj3MZ5OdNLM37nEwo
	c/V+W46BzF9ZWzJKP2sYm0qsJs4vmQPsP5F7c1o37V6Gf4U4WKDi3CsYkbL+eQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 1/3] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Mon, 16 Mar 2026 15:51:55 +0000
Message-Id: <20260316155157.679533-2-cjd@cjdns.fr>
In-Reply-To: <20260316155157.679533-1-cjd@cjdns.fr>
References: <20260316155157.679533-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_085221_340944_CD4363F9 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
binding.

EcoNet PCIe controller has the same configuration model as
Mediatek v2 but is initiallized more similarly to an MT7621
PCIe.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/pci/mediatek-pcie.yaml           | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index 0b8c78ec4f91..bac6e3c84752 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - airoha,an7583-pcie
+          - econet,en7528-pcie
           - mediatek,mt2712-pcie
           - mediatek,mt7622-pcie
           - mediatek,mt7629-pcie
@@ -226,6 +227,31 @@ allOf:
 
         mediatek,pbus-csr: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: econet,en7528-pcie
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+
+        clock-names:
+          maxItems: 1
+
+        reset: false
+
+        reset-names: false
+
+        power-domain: false
+
+        mediatek,pbus-csr: false
+
+      required:
+        - phys
+        - phy-names
+
 unevaluatedProperties: false
 
 examples:
@@ -436,3 +462,59 @@ examples:
             };
         };
     };
+
+  # EN7528
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+    #include <dt-bindings/clock/en7523-clk.h>
+    #include <dt-bindings/reset/airoha,en7523-reset.h>
+
+    soc_3 {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pcie@1fb81000 {
+          compatible = "econet,en7528-pcie";
+          device_type = "pci";
+          linux,pci-domain = <0>;
+          #address-cells = <3>;
+          #size-cells = <2>;
+
+          reg = <0x1fb81000 0x1000>;
+          reg-names = "port0";
+
+          clocks = <&scuclk EN7523_CLK_PCIE>;
+          clock-names = "sys_ck0";
+
+          phys = <&pcie_phy0>;
+          phy-names = "pcie-phy0";
+
+          ranges = <0x01000000 0 0x00000000 0x1f600000 0 0x00010000>,
+                   <0x82000000 0 0x20000000 0x20000000 0 0x08000000>;
+
+          interrupt-parent = <&intc>;
+          interrupts = <23>;
+          interrupt-names = "pcie_irq";
+          bus-range = <0x00 0xff>;
+          #interrupt-cells = <1>;
+          interrupt-map-mask = <0 0 0 7>;
+          interrupt-map = <0 0 0 1 &pcie_intc 0>,
+              <0 0 0 2 &pcie_intc 1>,
+              <0 0 0 3 &pcie_intc 2>,
+              <0 0 0 4 &pcie_intc 3>;
+
+          pcie_intc: interrupt-controller {
+            interrupt-controller;
+            #address-cells = <0>;
+            #interrupt-cells = <1>;
+          };
+
+          slot0: pcie@0,0 {
+            device_type = "pci";
+            reg = <0x0000 0 0 0 0>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+          };
+        };
+    };
-- 
2.39.5


