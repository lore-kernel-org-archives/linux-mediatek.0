Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFD4C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NeLnuvum3jUmZEq04v6lfVUx02YHsRA5xFbxWTDqAZw=; b=LczExXKhE/nfqt
	tt5mMe9TsBS6ZNgwPLW0F2WeLCwAx3lZ8BF1sa9i3P4++ykvD5UumYoNCoKBXrl8i+ETGYzVUgcy/
	WQFMa9KjggQx+C7nmZKllF4VUM7urF3X/JIxob2Ze4KpCwl51S8igoyUfmu78vV32IbO0HCV1VeAG
	zgqvnnGrq5LdAdN2vbnjRWlQZlfbkBq+kxb08uwnAhrfBO/aM/ZuWu4BA9y8giCxi5rMo6Rmupng8
	wBuMhKvvkM5Bhz6SwKvkcixGDC0HU/D/9BdTPsRi29G4RRb+oTFQQgRj7xVW91YiSjLuMIXTG80NU
	b8pjJi7g05nkJ7MHxzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmda-004ZFX-Pe; Sat, 12 Nov 2022 09:17:18 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otmcI-004YRw-2W; Sat, 12 Nov 2022 09:16:00 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id F188360449;
	Sat, 12 Nov 2022 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668244539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeLnuvum3jUmZEq04v6lfVUx02YHsRA5xFbxWTDqAZw=;
	b=kph56ItsEfXV5GUvtEk8fPOJQJb9wm9QxyCs4Yqh/lnyMdLCLI1wkokY03WCY0Gb3P+ejb
	x+uovfnH9VydaKKQCpIBIYrw9grjskfwSspJ9T6aPv6V3y4h4T3UuV3UNFLvQC7fCeGUfi
	U0uT94cec8PxziVbPWuhNvTqfjlbLBk=
Received: from frank-G5.. (fttx-pool-157.180.227.41.bambit.de [157.180.227.41])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id DBF3E36065F;
	Sat, 12 Nov 2022 09:15:37 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 05/11] dt-bindings: PCI: mediatek-gen3: add support for mt7986
Date: Sat, 12 Nov 2022 10:15:12 +0100
Message-Id: <20221112091518.7846-6-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112091518.7846-1-linux@fw-web.de>
References: <20221112091518.7846-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 0c30f0d1-0b1f-48d0-afa9-4e610343be72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_011558_386546_7E922395 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string and clock-definition for mt7986. It needs 4 clocks
for PCIe, define them in binding.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
- squashed patch 2+3 (compatible and clock definition)
---
 .../bindings/pci/mediatek-pcie-gen3.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 5d7369debff2..f7a02019daea 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -48,6 +48,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - mediatek,mt7986-pcie
               - mediatek,mt8188-pcie
               - mediatek,mt8195-pcie
           - const: mediatek,mt8192-pcie
@@ -78,9 +79,11 @@ properties:
       - const: mac
 
   clocks:
+    minItems: 4
     maxItems: 6
 
   clock-names:
+    minItems: 4
     maxItems: 6
 
   assigned-clocks:
@@ -160,6 +163,20 @@ allOf:
             - const: tl_32k
             - const: peri_26m
             - const: peri_mem
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt7986-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: peri_26m
+            - const: top_133m
 
 unevaluatedProperties: false
 
-- 
2.34.1


