Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD474C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 07:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPVeizzATY2/3fupWqlmWNMkG9wPo0ix3FxSgAWf9kk=; b=AnASuu679ZXZ5r
	CWONlbJZ4rErZd4V+Rb9F3o8IuCp8lomm11QuOeKMJ1JeMz0/Q5UhEea2iyg/CsHUJiBOXbf45XbF
	0DLKLyf4DBZz79eICg7DSKnBN5ckhOojXgBDKo1Cn2wPvwoCfSA3Eo3LJia3d3AVWMHGE7M/EFz+O
	jKwTdzUecSHShDNfZ2yqbjgP3DbUD9Ob01FmtU68Ct8VPXOPqFosEnmF65iO2CHitL3F06h48jdpC
	G8PdtwM1wj4DttgmqwgqMUoGkzlqAhSQa5LFpjNEfjykn4xarM7NcQR/FBXe6YVEJ0ZX8Ni4CsG2g
	akjbM7Kwdj2rMjEgHRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onENG-00499M-O5; Tue, 25 Oct 2022 07:29:22 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEMl-0048ve-4F; Tue, 25 Oct 2022 07:28:52 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 19CB56049C;
	Tue, 25 Oct 2022 07:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666682928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPVeizzATY2/3fupWqlmWNMkG9wPo0ix3FxSgAWf9kk=;
	b=h76N3baNUtUvaXUxVYss74lavlCCeF3PnHjld0LYwZZAcApw/+vTknRNDU2wL3i3sFawll
	SICgkmhU1lrDb+20cIzTx976FJpC0ZFgupwV72xQY2FZvXgi5e2fH4+cxDOr1vtsvuyWot
	Z/d9Vf3gFsFK9pRMI/hBzWVkWATQCdI=
Received: from frank-G5.. (fttx-pool-217.61.152.57.bambit.de [217.61.152.57])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 6AF6D1003DE;
	Tue, 25 Oct 2022 07:28:46 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] dt-bindings: PCI: mediatek-gen3: add support for mt7986
Date: Tue, 25 Oct 2022 09:28:37 +0200
Message-Id: <20221025072837.16591-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025072837.16591-1-linux@fw-web.de>
References: <20221025072837.16591-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 5f0ade24-ef7b-4264-afe6-cd693f90c8d0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_002851_338871_42BF1C9E 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string and clock-definition for mt7986. It needs 4 clocks
for PCIe, define them in binding.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- squashed patch 2+3 (compatible and clock definition)
---
 .../bindings/pci/mediatek-pcie-gen3.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 98d3f0f1cd76..57d0e84253e9 100644
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
@@ -161,6 +164,20 @@ allOf:
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


