Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBEAC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YDvN14LGzYl2jRSkK1fRlKatqJWzuwYk+eXtAY5bVg=; b=DwjMKBJ8TMoVmU
	HvCVOCqlfCo4We+dgGMsMXihfr8ZIa2lhHvJXCP4Ajnlt+dEl4cPF2X/Wkz3bEE8GV0uEG7xrM2sk
	m2YlnR6nHBOWuhQvCbAXsfPcUOBT56rKUiJ1ylwIcw6dhLUu9lBs00fbtg+TXyvjgh/K8sJZ5+JjQ
	AxSVfwNuU2QYkM5I0zaif5EtVr6Y5voAEiAbcVokuaN/q0eePVMJGDCWYNhHvabjAwES9i6dmsrLy
	G7WOBKblFqjnKLZQ/Xi6cd3gLdyeIKiNK4oMGevrrYdah0ByHS3zstzLbqaEkRK57R6x2JdQMemmb
	2ppTvkfztzGh7rTcQSYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhkC-00FvDN-KH; Thu, 17 Nov 2022 16:28:04 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovhjp-00Fv4D-IV; Thu, 17 Nov 2022 16:27:43 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 7CE755FC7C;
	Thu, 17 Nov 2022 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1668702458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YDvN14LGzYl2jRSkK1fRlKatqJWzuwYk+eXtAY5bVg=;
	b=FZJ8GRf6FgEFFkc1VVnq/EfBYEeG14ApCk1z41appnSUL2K6078ALn3TQ2WlneDbet25sZ
	ymPMhRU/8lTpCAmnfGpoRmSDvAXJNPjygfusRMP152Hng5ynUcYMUv28FbEKk+GOvbNcsR
	0PLGVE9f1li4BxK5e9IvEZXUxPX/U7Q=
Received: from frank-G5.. (fttx-pool-80.245.75.65.bambit.de [80.245.75.65])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 1FED6100767;
	Thu, 17 Nov 2022 16:27:37 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v5 04/11] dt-bindings: PCI: mediatek-gen3: add SoC based clock config
Date: Thu, 17 Nov 2022 17:27:21 +0100
Message-Id: <20221117162728.20608-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117162728.20608-1-linux@fw-web.de>
References: <20221117162728.20608-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b30333ce-cac8-435b-aa3e-e3dc0e1bf3bc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_082741_893161_1D013705 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Bo Jiao <Bo.Jiao@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

The PCIe driver covers different SOC which needing different clock
configs. Define them based on compatible.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Jianjun Wang <jianjun.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v2:
- fix typo in mediatek,mt8192-pcie
v3:
- remove contains to match only if compatible is no fallback
  tested with series "Add driver nodes for MT8195 SoC" and mt7986
  pcie-nodes, dtbs_check is now clean
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 47 ++++++++++++++-----
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index c00be39af64e..5d7369debff2 100644
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
@@ -138,6 +127,40 @@ required:
   - '#interrupt-cells'
   - interrupt-controller
 
+allOf:
+  - $ref: /schemas/pci/pci-bus.yaml#
+  - if:
+      properties:
+        compatible:
+          const: mediatek,mt8192-pcie
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


