Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFED8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 11:59:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 785DD61107
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 11:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 785DD61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9EjMucn6nopF7jAw0Ydx/i5aB3dPVmWOD5bRHTSe18=; b=km0F9hwtVFHLJP
	TxRw7cYI/8SMNSat9seyemXWrPZEdKOJEsXNj06iKh7jHkwSIciQFHYD/6Y55+2ytqM5A7KsleW2o
	V+KyLJRo0QPKVnVQDenrIL6Dr5wUFebWKD5kKEGr/4aIdVLOm3I8qT/ut2XBYYx0Dk8GzmDOjuUtp
	tgkhlg2KWSPDX/PfBE4xSlMgojviCnGetbqg+ibDkDomcAQoXw+5UlRrEC7A+GliY+Bd/5eGIEvCI
	8C6cRr59Yj/ESDWKGudzzvaWOS3BE2zYcDwzuYzABlM+RQTqelNdCh1nTv/lP8fgEaFY4EpqESMZe
	P8E4vs3Kpd9Ltv29C62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNO3-00BAOi-1K; Thu, 23 Sep 2021 11:59:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNNp-00BAK3-WC; Thu, 23 Sep 2021 11:59:23 +0000
X-UUID: 473890adfe1c4e2fb7f8dd787c2a90e9-20210923
X-UUID: 473890adfe1c4e2fb7f8dd787c2a90e9-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 300699141; Thu, 23 Sep 2021 04:59:17 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 04:59:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 19:59:13 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 19:59:13 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, <yen-chang.chen@mediatek.com>
Subject: [PATCH v3 02/33] dt-bindings: mediatek: mt8195: Add binding for infra
 IOMMU
Date: Thu, 23 Sep 2021 19:58:09 +0800
Message-ID: <20210923115840.17813-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210923115840.17813-1-yong.wu@mediatek.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_045922_086296_79FE1FED 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mt8195, we have a new IOMMU that is for INFRA IOMMU. its masters
mainly are PCIe and USB. Different with MM IOMMU, all these masters
connect with IOMMU directly, there is no mediatek,larbs property for
infra IOMMU.

Another thing is about PCIe ports. currently the function
"of_iommu_configure_dev_id" only support the id number is 1, But our
PCIe have two ports, one is for reading and the other is for writing.
see more about the PCIe patch in this patchset. Thus, I only list
the reading id here and add the other id in our driver.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/iommu/mediatek,iommu.yaml         | 13 ++++++++++++-
 .../dt-bindings/memory/mt8195-memory-port.h    | 18 ++++++++++++++++++
 include/dt-bindings/memory/mtk-memory-port.h   |  2 ++
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 9b04630158c8..c528a299afa9 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -79,6 +79,7 @@ properties:
           - mediatek,mt8192-m4u  # generation two
           - mediatek,mt8195-iommu-vdo        # generation two
           - mediatek,mt8195-iommu-vpp        # generation two
+          - mediatek,mt8195-iommu-infra      # generation two
 
       - description: mt7623 generation one
         items:
@@ -129,7 +130,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - mediatek,larbs
   - '#iommu-cells'
 
 allOf:
@@ -161,6 +161,17 @@ allOf:
       required:
         - power-domains
 
+  - if: # The IOMMUs don't have larbs.
+      not:
+        properties:
+          compatible:
+            contains:
+              const: mediatek,mt8195-iommu-infra
+
+    then:
+      required:
+        - mediatek,larbs
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/memory/mt8195-memory-port.h b/include/dt-bindings/memory/mt8195-memory-port.h
index 783bcae8cdea..9882877cda9d 100644
--- a/include/dt-bindings/memory/mt8195-memory-port.h
+++ b/include/dt-bindings/memory/mt8195-memory-port.h
@@ -387,4 +387,22 @@
 #define M4U_PORT_L28_CAM_DRZS4NO_R1		MTK_M4U_ID(28, 5)
 #define M4U_PORT_L28_CAM_TNCSO_R1		MTK_M4U_ID(28, 6)
 
+/* Infra iommu ports */
+/* PCIe1: read: BIT16; write BIT17. */
+#define IOMMU_PORT_INFRA_PCIE1			MTK_IFAIOMMU_PERI_ID(16)
+/* PCIe0: read: BIT18; write BIT19. */
+#define IOMMU_PORT_INFRA_PCIE0			MTK_IFAIOMMU_PERI_ID(18)
+#define IOMMU_PORT_INFRA_SSUSB_P3_R		MTK_IFAIOMMU_PERI_ID(20)
+#define IOMMU_PORT_INFRA_SSUSB_P3_W		MTK_IFAIOMMU_PERI_ID(21)
+#define IOMMU_PORT_INFRA_SSUSB_P2_R		MTK_IFAIOMMU_PERI_ID(22)
+#define IOMMU_PORT_INFRA_SSUSB_P2_W		MTK_IFAIOMMU_PERI_ID(23)
+#define IOMMU_PORT_INFRA_SSUSB_P1_1_R		MTK_IFAIOMMU_PERI_ID(24)
+#define IOMMU_PORT_INFRA_SSUSB_P1_1_W		MTK_IFAIOMMU_PERI_ID(25)
+#define IOMMU_PORT_INFRA_SSUSB_P1_0_R		MTK_IFAIOMMU_PERI_ID(26)
+#define IOMMU_PORT_INFRA_SSUSB_P1_0_W		MTK_IFAIOMMU_PERI_ID(27)
+#define IOMMU_PORT_INFRA_SSUSB2_R		MTK_IFAIOMMU_PERI_ID(28)
+#define IOMMU_PORT_INFRA_SSUSB2_W		MTK_IFAIOMMU_PERI_ID(29)
+#define IOMMU_PORT_INFRA_SSUSB_R		MTK_IFAIOMMU_PERI_ID(30)
+#define IOMMU_PORT_INFRA_SSUSB_W		MTK_IFAIOMMU_PERI_ID(31)
+
 #endif
diff --git a/include/dt-bindings/memory/mtk-memory-port.h b/include/dt-bindings/memory/mtk-memory-port.h
index 7d64103209af..2f68a0511a25 100644
--- a/include/dt-bindings/memory/mtk-memory-port.h
+++ b/include/dt-bindings/memory/mtk-memory-port.h
@@ -12,4 +12,6 @@
 #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
 
+#define MTK_IFAIOMMU_PERI_ID(port)	MTK_M4U_ID(0, port)
+
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
