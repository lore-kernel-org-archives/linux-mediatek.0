Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F79E63FED
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2026 18:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dFP8gIvgqds8v1GE3FytFp2lu1cC4gYgYzSFTR33IVg=; b=PBZ6neZ+ZKA8tAN/L5vPL1kzHm
	F3/X6tXlHOwQM5abR9JM6HViSPvZJeO3Ibfkd7ctiGqjqOH0EGEp6Y/VVWvLPerGycTrVSXPpoH7y
	UZ4W5UrB64sMYdzdzskG5u6+uz0GISH8bn6mktE8G0ZkwlR70Kmm1fwQBMRPW41ETqVL+HfHbnkSB
	Lb7da4Ru/DNUO1Sqfru4u2fEX0n+OZoqwneBzegiu+eNSK85vr31qyIUBN9aO7vPK0Ub7FdnBxxqx
	NedKxpq37+7Us1pBVplO3KyaeVIhpp9ufscIfnrG/NxCMnvsZwqW4wdHG0gf1rmqdh/Hs1m6QX/lS
	KsZ+uIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95k9-00000003fHo-3zjM;
	Sat, 04 Apr 2026 18:29:13 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95k7-00000003fGU-0p80
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Apr 2026 18:29:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA3E818DDE0;
	Sat,  4 Apr 2026 20:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1775327346; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dFP8gIvgqds8v1GE3FytFp2lu1cC4gYgYzSFTR33IVg=;
	b=Zt4tlIEu9aIMYbGsSWeGg9zgec7T/EG/eEvtazs0qAwcyKjuYOqgyeJmHiRqKd3KR7diFd
	+RvCdF8P88Gnj2cEXUsG4CTyrSIxL29+Nnr1MSEp1YaetnTCg7/qUb0Vcfhz21O4yJOgSP
	+2XLpbJiN0PNQghS7KG4wlcN4+xDuXL/OdIJF/hyN/Ai/UP0kMf81A+5vVb4YnwS1zByYJ
	O21moPNIoIg9JppN7om0sInQT6ZdTwxzbE0b8vR3PXYpolr8HNm3hTKhRBtUvRynY8H1l3
	1tTNwtSAqJ9Ds4Le9H5DZ8ClLxIeeolsowKnnByU1z8mMc6AeDCuVRb9Rp2Y2w==
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
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v4 1/2] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Sat,  4 Apr 2026 18:28:53 +0000
Message-Id: <20260404182854.2183651-2-cjd@cjdns.fr>
In-Reply-To: <20260404182854.2183651-1-cjd@cjdns.fr>
References: <20260404182854.2183651-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_112911_415694_D7E85DF4 
X-CRM114-Status: UNSURE (   5.17  )
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
---
 .../bindings/pci/mediatek-pcie.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie.yaml
index 0b8c78ec4f91..7e1b0876c291 100644
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


