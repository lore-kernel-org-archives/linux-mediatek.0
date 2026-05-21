Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BBECD5BAC
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXgx7gfpsPR0kF8ck7MRUn7Q28yaC8th/9vky8kZIes=; b=QhxQ0wKlaA3IUKsT0CXmzFFOXp
	MZk8deacdkDMSxjOHFV5TFsdAGiYhy2FDpGhirpYs/f2sm+bYjDBxbAHCQWHWiDa1NeLlF4bVVWs7
	mwJclW9g/SDZ68m19DpVcAWbl56xrySm+alqWB9rm7igYUVin8QvWnPrHL9woQOTbqUfx8rz8S2xz
	vyxPFF/HNbKRnssqEx710gADuWYYV8LEmuM5sYg7jy2UNbmsGYaBaLV7jtDx8UbyBYV2DJD56nkmT
	FG2Q/i3n6oqg2hER7m9Z0PMrZfe2RDU+ymX2qy4EFChOw5I8aFnmjGGkSK+JoYzV1gTZJupEIO5cs
	6v0hmzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ74H-00000008cNT-0gJ1;
	Thu, 21 May 2026 17:20:21 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ74D-00000008cLI-0VuD
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 17:20:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7907457564;
	Thu, 21 May 2026 19:20:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779384013; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IXgx7gfpsPR0kF8ck7MRUn7Q28yaC8th/9vky8kZIes=;
	b=Wtx4jOzbMWnKtGbkDL/jREEHpLp3G//rRC5vU9bNng9ZfnkkJ5fTR6uujyq8/obNCX4Z/i
	wOC/qbgdRK+BODevSg8UWxs/GklaT/jO7Vcdh7Hyq3fQ2kup+8UypQazliCly0QFVmYpV3
	teXsyhob2SjKl/ncFaN1spqIITfbLnrBxXV0t9PQNFdVmOtfIwihhEvn1XyamqQbOGDFQn
	q1yEbAfzL8a7vZwVTZLbW1c6ykKaT3UENmzXmMfbh8zwPb9hkPKRK7UcJ55mFDTjwH6OtJ
	2wsmS1SBzEWp3J3A7UmGXrRYGzoyeJqye4OPcxDjblPN4GzfsPAejO0hUyH5kw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	helgaas@kernel.org,
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
	Caleb James DeLisle <cjd@cjdns.fr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 2/3] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Thu, 21 May 2026 17:19:50 +0000
Message-Id: <20260521171951.1495781-3-cjd@cjdns.fr>
In-Reply-To: <20260521171951.1495781-1-cjd@cjdns.fr>
References: <20260521171951.1495781-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_102018_633780_320470B8 
X-CRM114-Status: UNSURE (   5.38  )
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
Mediatek v2 but is initialized more similarly to an MT7621
PCIe.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pci/mediatek-pcie.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index 0b8c78ec4f91..c009a7a52bc6 100644
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
+        resets: false
+
+        reset-names: false
+
+        power-domains: false
+
+        mediatek,pbus-csr: false
+
+      required:
+        - phys
+        - phy-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.5


