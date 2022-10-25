Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF666C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kRaqG6/0b8n/dJhItF3var/jK1C82waL6qs7ymv9gY=; b=MlpWtZIb7Z39R5
	jOM0LeqqO/MaTlfuyLI3aY2nDDnKnwDV4S+XSxwj6a/joI82lexKh9B5LK2huS8gYihxB9Hbb+g6D
	oe+4WsNcPLPAFmBAkKc6898inKIk3f0LP92Iz1qmZN9TIJ9AwWxYXI0a6+wIWLdSiY1CB9qeY/HOn
	kPWwXrjAW3zfjL0xNcWFAMeYUovp2WeAc47VUsJthDAG/7TG2y5AFCHqZE+RRPP2/+O7AeNgng4X5
	xbQIcWRyTjF/oGmJsJb5hPyabivc7YfEPt5jZGKUkAnSYGDUQXo/a+Y4bDPVkusdqeyQFTsmRhOaL
	Hj/FZigA+D3mybwuzzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEN5-004940-O5; Tue, 25 Oct 2022 07:29:11 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEMi-0048v5-EA; Tue, 25 Oct 2022 07:28:49 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 7D6FD621A8;
	Tue, 25 Oct 2022 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666682926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+kRaqG6/0b8n/dJhItF3var/jK1C82waL6qs7ymv9gY=;
	b=L3q9XlMIEzQfBzcMd2h96nZTMH3hhJJrPl0iGtcPZb3115pXKUd1ZA0WXl7DYeJOpOcNmS
	+KzZX4DuulBV8s5eLxIzFA0TXOSxvTrj0VRzW6nZeZnDe8MdM+C2bp3wcw4tiltyFHXhDR
	56iPd0aGK1ofd/2HxTpDCaI27GV80qc=
Received: from frank-G5.. (fttx-pool-217.61.152.57.bambit.de [217.61.152.57])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id C4ADB10086A;
	Tue, 25 Oct 2022 07:28:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: PCI: mediatek-gen3: add SoC based clock config
Date: Tue, 25 Oct 2022 09:28:36 +0200
Message-Id: <20221025072837.16591-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025072837.16591-1-linux@fw-web.de>
References: <20221025072837.16591-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 2b71bb53-df56-407c-9358-af34211c4bf2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_002848_638386_18C0A760 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

The PCIe driver covers different SOC which needing different clock
configs. Define them based on compatible.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2:
- fix typo in mediatek,mt8192-pcie
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 48 ++++++++++++++-----
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index c00be39af64e..98d3f0f1cd76 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -43,9 +43,6 @@ description: |+
   each set has its own address for MSI message, and supports 32 MSI vectors
   to generate interrupt.
 
-allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -84,15 +81,7 @@ properties:
     maxItems: 6
 
   clock-names:
-    items:
-      - const: pl_250m
-      - const: tl_26m
-      - const: tl_96m
-      - const: tl_32k
-      - const: peri_26m
-      - enum:
-          - top_133m        # for MT8192
-          - peri_mem        # for MT8188/MT8195
+    maxItems: 6
 
   assigned-clocks:
     maxItems: 1
@@ -138,6 +127,41 @@ required:
   - '#interrupt-cells'
   - interrupt-controller
 
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8192-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: tl_96m
+            - const: tl_32k
+            - const: peri_26m
+            - const: top_133m
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8188-pcie
+              - mediatek,mt8195-pcie
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: tl_96m
+            - const: tl_32k
+            - const: peri_26m
+            - const: peri_mem
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


