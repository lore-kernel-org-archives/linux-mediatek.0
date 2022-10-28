Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51BAFA3741
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 09:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8DFcu4Y0BNFTtsi7qLl27vlNLxGCpxNh+bimbHT58w=; b=Cb9kSIX/cbQM/zaEXZqttH9aAa
	wRHZ0tX0hFFgTsk5E15twWAb3SS3iU3UotTHNGGj0hgZjBLDSTWGv59U9AFpyMHmU9NoZUgHT7SBn
	43Dzw+y/qTFuKdnUewNobiZPsdHPuhQ69EYpV4xyGLV/VBu4M+K+CUqsJDCIMhyiqhF7JsjbVQh1K
	pU8EuWoswPXi4VYVKdeitI7CIAmgDiRAVy22onSJcQbHmWgasxuWt0EJxwFzSfrTy9/YvMWSSrcWr
	Etze1h0UMF83V3kSnuf9eecUbzK/CGR8w4V6CI5pQV8mTT7kbI6o2Qg7qS3e4+yotq2kG9ZNgE+IH
	C/iH7XgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLun-00GOtY-Pi; Fri, 28 Oct 2022 09:44:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLuY-00GOmV-3Z; Fri, 28 Oct 2022 09:44:23 +0000
X-UUID: 731cfbc5fcb140eda6be05a835eaa4a9-20221028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=z8DFcu4Y0BNFTtsi7qLl27vlNLxGCpxNh+bimbHT58w=;
	b=XjYz+XXC20IYw5QbMMQkoBhceZFUtrrcx7Fc9xKVrBl4lr9M/S1QzyOaOtUx3ARHPdAPijJGUuWUr8094kfs4KBq4BMfUt+Cg5u9DHf5J/w7kMa82XRslVMKBJHFFhdpUTqFMaLbb7qLGEJgTFJlF0+ebOjAv+NdSQtcOBPcH20=;
X-CID-CACHE: Type:Local,Time:202210280228-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:904adbe0-a63b-4462-ab06-37833712697c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:f991ef80-3116-4fbc-b86b-83475c3df513,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 731cfbc5fcb140eda6be05a835eaa4a9-20221028
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 586924281; Fri, 28 Oct 2022 02:44:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 28 Oct 2022 17:43:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 28 Oct 2022 17:43:22 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, TingHan Shen
	<tinghan.shen@mediatek.com>
Subject: [PATCH v4 1/3] dt-bindings: PCI: mediatek-gen3: Support mt8195
Date: Fri, 28 Oct 2022 17:43:15 +0800
Message-ID: <20221028094317.29270-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221028094317.29270-1-tinghan.shen@mediatek.com>
References: <20221028094317.29270-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_024422_179497_B9083DA3 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Jianjun Wang <jianjun.wang@mediatek.com>

In order to support mt8195 pcie node, update the yaml to support new
properties of iommu and power-domain, and update the reset-names
property to allow only one 'mac' name.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml         | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index c00be39af64e..a9013c10131a 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -70,14 +70,21 @@ properties:
     minItems: 1
     maxItems: 8
 
+  iommu-map:
+    maxItems: 1
+
+  iommu-map-mask:
+    const: 0
+
   resets:
     minItems: 1
     maxItems: 2
 
   reset-names:
-    minItems: 1
-    items:
-      - const: phy
+    oneOf:
+      - items:
+          - const: phy
+          - const: mac
       - const: mac
 
   clocks:
@@ -107,6 +114,9 @@ properties:
     items:
       - const: pcie-phy
 
+  power-domains:
+    maxItems: 1
+
   '#interrupt-cells':
     const: 1
 
-- 
2.18.0


