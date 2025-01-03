Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD2E7718F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 06:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fSI14JXINs/0jFNxsxkI+ZTe1Oh5xsksvQrQ5PGxns=; b=VtHJEkrGpJI7lB37gSeYK9z1I9
	89m1iEZQBz5OpSgPrro+h7O98SXUjveHluc0mDKzwY4Bu1LIwoF21eKuMIeLD17Z8t9YE6v6Gkn3g
	J3gP83tD2k1f9mf8aBKduOZqV96iw+p3EBO9onmuVUFBqvg0KbBPao3QubtFQGDHD/kydWGWcK/gY
	JPgcoIvjf6N0usK3Ug19H0zQJYVcVWEV1eqEJEFJeBm/hsHUUoWo8lNHuuuDaZgwOEy8TiizeTEZd
	8disMHKl+YmRR/HGGiWa7Si/ER1m8TK7p+vVpMGsjPX7ds/Cmtl/kKdi9TRwP4WaLc4Ku+D+pi8jR
	YVIogWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTamK-0000000CAb3-2kyg;
	Fri, 03 Jan 2025 06:03:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTajv-0000000CA0d-2KPA;
	Fri, 03 Jan 2025 06:00:56 +0000
X-UUID: 140db102c99811ef82ff63e91e7eb18c-20250102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7fSI14JXINs/0jFNxsxkI+ZTe1Oh5xsksvQrQ5PGxns=;
	b=iQ0neLuW5KlMOjCVH4HYY9qWkjaRhsQHNPGgVc15Tbn/yi9sJjYwkBsQPHhcDwKQj9qOZ0MMf3Bz/VDFACFN0aA64P2rrUCq6KUuudUMKdXCXSH+aZa7AFjxIsq1k+7QxFwEBl6xJ5yOcC4PS6sdmUHlmzqKett+GE6nHH57q+A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:63ae151e-912a-4fb3-9293-adb2f8a69112,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:39db4b37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 140db102c99811ef82ff63e91e7eb18c-20250102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2076254845; Thu, 02 Jan 2025 23:00:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Jan 2025 14:00:45 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Jan 2025 14:00:44 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Xavier Chang <Xavier.Chang@mediatek.com>
Subject: [PATCH 1/5] dt-bindings: PCI: mediatek-gen3: Add MT8196 support
Date: Fri, 3 Jan 2025 14:00:11 +0800
Message-ID: <20250103060035.30688-2-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250103060035.30688-1-jianjun.wang@mediatek.com>
References: <20250103060035.30688-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_220055_599769_B4410A69 
X-CRM114-Status: UNSURE (   9.33  )
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

Add compatible string and clock definition for MT8196. It has 6 clocks like
the MT8195, but 2 of them are different.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 .../bindings/pci/mediatek-pcie-gen3.yaml      | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index f05aab2b1add..b4158a666fb6 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -51,6 +51,7 @@ properties:
               - mediatek,mt7986-pcie
               - mediatek,mt8188-pcie
               - mediatek,mt8195-pcie
+              - mediatek,mt8196-pcie
           - const: mediatek,mt8192-pcie
       - const: mediatek,mt8192-pcie
       - const: airoha,en7581-pcie
@@ -197,6 +198,34 @@ allOf:
           minItems: 1
           maxItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8196-pcie
+    then:
+      properties:
+        clocks:
+          minItems: 6
+
+        clock-names:
+          items:
+            - const: pl_250m
+            - const: tl_26m
+            - const: peri_26m
+            - const: peri_mem
+            - const: ahb_apb
+            - const: low_power
+
+        resets:
+          minItems: 1
+          maxItems: 2
+
+        reset-names:
+          minItems: 1
+          maxItems: 2
+
   - if:
       properties:
         compatible:
-- 
2.46.0


