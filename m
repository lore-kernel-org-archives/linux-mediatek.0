Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41FFCD4F21
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 19:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbaYGCVJ/e4zvTDmh7Ra8wHMVZemBwajoPoC5ZoV0ek=; b=ZRg0BGOhyTVvzPsrSuZS+ma8Bh
	LXN/xvcVOB1KNZAPWQROeVu0g7dO5qiUiVbxsuVROLf0XfpjsFpU0ZQEMIwwy0WRJP7AB1XEIPHhG
	aoiqCLKNFQAli1r3DdM9sfo4xK+U2yEgtu4dJZ1yZz7qZx/9dtmcfIWt9EP2JOeavHkklArBanbQ7
	e1AQOLjVaSRngEUf5nxj0t8DLvtzZlZTS5dm+lyPUkSthKVwAG8MnmBX05Tltwho4SQ/OqCaMqvxd
	WXt10fewPZAOoxC+313Z3pNcYhEB2L2RLjdF7dTrBF952QQNM01Zd7gwmBdQtVxPtpsL+60b38aLT
	D8v1xbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF4y-00000003YQD-3bMy;
	Wed, 13 May 2026 19:17:12 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF4w-00000003YON-1ka9
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 19:17:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16FA13C391D;
	Wed, 13 May 2026 21:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778699827; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GbaYGCVJ/e4zvTDmh7Ra8wHMVZemBwajoPoC5ZoV0ek=;
	b=vusjylv7Aeoss1kL0WTBCs0ghDps5MeQSO9KwbVy0++2ekUmUPJBj9zIDXmAyzN7pI1Hvk
	aNqteJhnunq2T/npzbwiocaptHdzymr3ztMRK+F7T06LhTpASAaLU/LccITfNzbL3mEp/c
	1an8P494F3CC4rPLLXQUNxY24eb8kDbYv61FfxsiulBlIQ6CrM5e5KABTqmjYZukURZNap
	ejNxf1xl4G53akM5n0mGxmrDB3KXV7LKM2YPBfousX12s0YWrao4IQsrDns4XGcneH3L7r
	7V5WI89IG60QxutoAvkHIkCGXHWVeSkufgfOLnoglAs5A+VUureckSvixmP8fA==
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
Subject: [PATCH v6 1/2] dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
Date: Wed, 13 May 2026 19:16:51 +0000
Message-Id: <20260513191652.3200607-2-cjd@cjdns.fr>
In-Reply-To: <20260513191652.3200607-1-cjd@cjdns.fr>
References: <20260513191652.3200607-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_121710_698693_DDC37213 
X-CRM114-Status: UNSURE (   5.42  )
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


