Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F2C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQCo381J32Ur1RWu7o4R4x7OkFF7ksggkVIhgxZP7fA=; b=vfsbgUuRH9YPbkoWRRYYWvgP/M
	hfGf1TpZX/YtvzKUbrJGW/eOp/SxkmzumYSlPbuRRYHtKM1AO+Yh/SskUNGm0XuvF+nzoL63NVh1S
	iK3TsErd1V5mxLn4/6ckRkY8iw18CIvX6tSHGNm9Cgl1aBXp4Cs8LDTWLbYZYgApMHFa936B14DCv
	fEu55/0aUz+dlmbLb9tErZOZrAOPyAvM45Z1lcvpghrLiffJAJ+Zuvz5iJKb6aDZJ9oAPeC/o4lqP
	xnEs39SKH+ZwRux1CLoht7BEI8PdrL9MW2Oh9f6+Byu2OomeZhNB4T7SSVTY36aV3W/2M7NH4z54F
	YOpYOl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIqgG-00DlnY-I5; Tue, 02 Aug 2022 12:07:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIqg4-00DlhE-GD; Tue, 02 Aug 2022 12:07:13 +0000
X-UUID: e73a94b946194355a3e30c23eb2ac0ba-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:61a563fd-5ba9-4a84-a954-a20bf745c8ae,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:b77414d0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e73a94b946194355a3e30c23eb2ac0ba-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 26335715; Tue, 02 Aug 2022 05:07:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 2 Aug 2022 20:06:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 2 Aug 2022 20:06:25 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, <Rex-BC.Chen@mediatek.com>,
	<TingHan.Shen@mediatek.com>, <Liju-clr.Chen@mediatek.com>,
	<Jian.Yang@mediatek.com>
Subject: [PATCH v4] dt-bindings: PCI: mediatek-gen3: Add support for MT8188 and MT8195
Date: Tue, 2 Aug 2022 20:06:24 +0800
Message-ID: <20220802120624.19258-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_050712_564509_8C3B5CB0 
X-CRM114-Status: GOOD (  12.19  )
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

MT8188 and MT8195 are ARM platform SoCs with the same PCIe IP as MT8192.

Also add new clock name "peri_mem" since the MT8188 and MT8195 use clock
"peri_mem" instead of "top_133m".

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
Changes in v4:
Remove "items" for "mediatek,mt8192-pcie" since it only have one item.

Changes in v3:
Use enum property to add the new clock name.

Changes in v2:
Merge two patches into one.
---
 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 0499b94627ae..c00be39af64e 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -48,7 +48,13 @@ allOf:
 
 properties:
   compatible:
-    const: mediatek,mt8192-pcie
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8188-pcie
+              - mediatek,mt8195-pcie
+          - const: mediatek,mt8192-pcie
+      - const: mediatek,mt8192-pcie
 
   reg:
     maxItems: 1
@@ -84,7 +90,9 @@ properties:
       - const: tl_96m
       - const: tl_32k
       - const: peri_26m
-      - const: top_133m
+      - enum:
+          - top_133m        # for MT8192
+          - peri_mem        # for MT8188/MT8195
 
   assigned-clocks:
     maxItems: 1
@@ -126,6 +134,7 @@ required:
   - interrupts
   - ranges
   - clocks
+  - clock-names
   - '#interrupt-cells'
   - interrupt-controller
 
-- 
2.18.0


