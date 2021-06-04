Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D108C4708F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 07:32:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40B3D6141A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 07:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40B3D6141A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vuOrYbB+XGzIgaF6IYk5DhUNRfdysx6fB+8KijUfjuo=; b=XGtrc4+0uRxE3O
	xYvghdxJvoqtQ+/HK4TUSDyP5eFrQJJDOy0OhD/aAgbVmCXnW9w2mlosP/KMOjmJHR3s99gyfKplt
	Z6JMJb9BXmLynrRfxAAVBNKLki+6tRkBIyoZOpbMk1BcIvio6WIjPv4m6TJoUh+85kOchqGaMGfMo
	svNnsK1mbMmoD78EmsHWkEdDUMQKS6j8wZvelKiF25U0fs9PywvpPKM2ckYNEekbZl+ymUQsx3YGk
	D88RXq7N3hNTL6Dsz3nNMx0UqNWokPeQ7jnH0n08Clvh4f4+qqLKUZmlMksCCl+uyMk/exLAbiLYx
	Gbbc2TW84JLshH1tQhRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp4J4-00C5ho-Ej; Fri, 04 Jun 2021 07:31:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp4Ix-00C5fH-A8; Fri, 04 Jun 2021 07:31:48 +0000
X-UUID: 33d49c71d7fe46799bd5bd2a463645c0-20210604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IAz8PWaAp7+dDEd1sgYX7iVW/iKhtT79zSUqlxOluj0=; 
 b=YbzDYWJwqOP3x0HIs9QuZ6t98tr7miupTa1DRwMB8KCZUxAzYi5uJTuvPPZec1HlUC7T7/aMMZPwOUNv0ZwiuFvSMgDh+HUTFd/5MW/3nmbW3FTuz4LD72i7dXB3rs1BPqeFziL4psZuZm/UwbMbZjCoxVmnNCQIf18X7OsA0A4=;
X-UUID: 33d49c71d7fe46799bd5bd2a463645c0-20210604
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 296507051; Fri, 04 Jun 2021 00:31:39 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 00:31:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 15:31:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Jun 2021 15:31:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: phy: mediatek: tphy: add support hardware
 version 3
Date: Fri, 4 Jun 2021 15:31:18 +0800
Message-ID: <1622791880-20262-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_003144_999915_530F6D61 
X-CRM114-Status: GOOD (  12.82  )
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

The PHYA architecture is updated, and doesn't support slew rate
calibration anymore on 7nm or advanced process, add a new version
number to support it.
Note: the FreqMeter bank is not used but reserved.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/phy/mediatek,tphy.yaml     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index b8a7651a3d9a..939c09296b5f 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -15,7 +15,7 @@ description: |
   controllers on MediaTek SoCs, includes USB2.0, USB3.0, PCIe and SATA.
 
   Layout differences of banks between T-PHY V1 (mt8173/mt2701) and
-  T-PHY V2 (mt2712) when works on USB mode:
+  T-PHY V2 (mt2712) / V3 (mt8195) when works on USB mode:
   -----------------------------------
   Version 1:
   port        offset    bank
@@ -34,7 +34,7 @@ description: |
   u2 port2    0x1800    U2PHY_COM
               ...
 
-  Version 2:
+  Version 2/3:
   port        offset    bank
   u2 port0    0x0000    MISC
               0x0100    FMREG
@@ -59,7 +59,8 @@ description: |
 
   SPLLC shared by u3 ports and FMREG shared by u2 ports on V1 are put back
   into each port; a new bank MISC for u2 ports and CHIP for u3 ports are
-  added on V2.
+  added on V2; the FMREG bank for slew rate calibration is not used anymore
+  and reserved on V3;
 
 properties:
   $nodename:
@@ -79,8 +80,11 @@ properties:
               - mediatek,mt2712-tphy
               - mediatek,mt7629-tphy
               - mediatek,mt8183-tphy
-              - mediatek,mt8195-tphy
           - const: mediatek,generic-tphy-v2
+      - items:
+          - enum:
+              - mediatek,mt8195-tphy
+          - const: mediatek,generic-tphy-v3
       - const: mediatek,mt2701-u3phy
         deprecated: true
       - const: mediatek,mt2712-u3phy
@@ -91,7 +95,7 @@ properties:
     description:
       Register shared by multiple ports, exclude port's private register.
       It is needed for T-PHY V1, such as mt2701 and mt8173, but not for
-      T-PHY V2, such as mt2712.
+      T-PHY V2/V3, such as mt2712.
     maxItems: 1
 
   "#address-cells":
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
