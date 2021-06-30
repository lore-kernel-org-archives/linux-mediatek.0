Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FA4C11F6A
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0904961D90
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 02:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0904961D90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3E5oBB2SL6BZg/byrhFbNbpE+MjuBSreCv51pnKVG5I=; b=KARLnSHFLYWF1X
	Ly4LN+dfVfRXTJQiwms+10KcfBn+9j+P7Z3KaUpKVZgvHv4sS2uGvh9HeakVVAcF8OhjTuOyZe5Rg
	78+bFubInZ7XUXG3y8pmliL4aPghwgBNvvu2P/oiAqXTIJbUsfhTSQOhzuD/w3IYhfUah8n+hNzTh
	2JIvBq6Qe0Bn5m1mL1qQVivQPEa7RbCZUuweyW5Njt8bNUrBXSKvR9wgLq5p0VAhb4rqkNJ8Nhhtf
	2nxW0KfpMmXweAOF8J82hsX+EkonNUB1Zcx6bxdtsTZnSiizrXtIiNbUpxfC/jEVZJEszNmA8lOWx
	utBkXksU89yX6DZYSijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyQ52-00CT3S-2k; Wed, 30 Jun 2021 02:36:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyQ4n-00CT0G-16; Wed, 30 Jun 2021 02:35:49 +0000
X-UUID: 395311935087487d880973c039ffddde-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=s+G2a/7ljlriTfQQGRJjxN/nofVHrmEeoyQqT6LTHZU=; 
 b=e7F9V+EaTJ9PXMlJI8L/E+bGrezNtgJLQmAm8tUtV5BVcQ6sVkHVoIdJ9e1ymlK2Nss3v+ycc28XbWdtdbIFrSWx4AEqpWSuRnnlvLBYbA4Q5uDHIOZZ61tu+vqn4evrYwc/Q+Fs6AvFP/aTknnssEqDqmdFia8n9UIsXwYtyQA=;
X-UUID: 395311935087487d880973c039ffddde-20210629
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2043512840; Tue, 29 Jun 2021 19:35:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 19:35:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 10:35:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 10:35:34 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH 02/24] dt-bindings: mediatek: mt8195: Add binding for infra
 IOMMU
Date: Wed, 30 Jun 2021 10:34:42 +0800
Message-ID: <20210630023504.18177-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630023504.18177-1-yong.wu@mediatek.com>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_193546_554439_9F201453 
X-CRM114-Status: GOOD (  13.75  )
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
---
 .../bindings/iommu/mediatek,iommu.yaml         | 14 +++++++++++++-
 .../dt-bindings/memory/mt8195-memory-port.h    | 18 ++++++++++++++++++
 include/dt-bindings/memory/mtk-memory-port.h   |  2 ++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 9b04630158c8..6f3ff631c06b 100644
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
@@ -161,6 +161,18 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      not:
+        properties:
+          compatible:
+            items:
+              enum:
+                - mediatek,mt8195-iommu-infra
+
+    then:
+      required:
+        - mediatek,larbs
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/memory/mt8195-memory-port.h b/include/dt-bindings/memory/mt8195-memory-port.h
index 783bcae8cdea..67afad848725 100644
--- a/include/dt-bindings/memory/mt8195-memory-port.h
+++ b/include/dt-bindings/memory/mt8195-memory-port.h
@@ -387,4 +387,22 @@
 #define M4U_PORT_L28_CAM_DRZS4NO_R1		MTK_M4U_ID(28, 5)
 #define M4U_PORT_L28_CAM_TNCSO_R1		MTK_M4U_ID(28, 6)
 
+/* infra iommu ports */
+/* PCIe1: read: BIT16; write BIT17. */
+#define M4U_PORT_INFRA_PCIE1			MTK_IFAIOMMU_PERI_ID(16)
+/* PCIe0: read: BIT18; write BIT19. */
+#define M4U_PORT_INFRA_PCIE0			MTK_IFAIOMMU_PERI_ID(18)
+#define M4U_PORT_INFRA_SSUSB_P3_R		MTK_IFAIOMMU_PERI_ID(20)
+#define M4U_PORT_INFRA_SSUSB_P3_W		MTK_IFAIOMMU_PERI_ID(21)
+#define M4U_PORT_INFRA_SSUSB_P2_R		MTK_IFAIOMMU_PERI_ID(22)
+#define M4U_PORT_INFRA_SSUSB_P2_W		MTK_IFAIOMMU_PERI_ID(23)
+#define M4U_PORT_INFRA_SSUSB_P1_1_R		MTK_IFAIOMMU_PERI_ID(24)
+#define M4U_PORT_INFRA_SSUSB_P1_1_W		MTK_IFAIOMMU_PERI_ID(25)
+#define M4U_PORT_INFRA_SSUSB_P1_0_R		MTK_IFAIOMMU_PERI_ID(26)
+#define M4U_PORT_INFRA_SSUSB_P1_0_W		MTK_IFAIOMMU_PERI_ID(27)
+#define M4U_PORT_INFRA_SSUSB2_R			MTK_IFAIOMMU_PERI_ID(28)
+#define M4U_PORT_INFRA_SSUSB2_W			MTK_IFAIOMMU_PERI_ID(29)
+#define M4U_PORT_INFRA_SSUSB_R			MTK_IFAIOMMU_PERI_ID(30)
+#define M4U_PORT_INFRA_SSUSB_W			MTK_IFAIOMMU_PERI_ID(31)
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
