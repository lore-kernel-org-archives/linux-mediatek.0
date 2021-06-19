Return-Path: <SRS0=YaGT=LN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57AA3C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 02:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 160A86135A
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 02:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 160A86135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3auIhs8WdOIjUAmZG+I9l2ftHMR4dNj6d2Cvk4OnKgg=; b=Q6Tq6NjhHUS0dv
	y6dHtLlURs+gkUAG2WwiRiL/uaDtm8rQJUx5TEjZoYd1+q9GTL5Vqv5YDCuJb4hl1l5y7GE+4fdIv
	1F20cWFIX/14LZn4GnyAOg5rN+pMPRasKMgfZmgtd1ahpUCzyho0ZNqNKS+V800xAoQPhu6eddrbl
	DnJh/wEO0qFJwTw4pIF+lwkV0FGBXeT8QC7pYoRSMQgz0jRPcf9yUfgHhn1c1ElXBNBa1r+KbBRfp
	VR8V/l5ds47CJtwx5kc+mjscNrjSg57oBbz7LrQP6vx8tc1iieX7iPX3JQsQbbpKbFCRGJ/FWfCfw
	kJhSIuJPuRsBv45lgrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luRAw-00G61m-94; Sat, 19 Jun 2021 02:57:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luRAt-00G61H-6R; Sat, 19 Jun 2021 02:57:36 +0000
X-UUID: 78722d7862fd429d9405424b5c37f6cc-20210618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+DNgoc0dJLPn2Z9eauLliOfak73wsTSbX0RxPScRkfM=; 
 b=RWOwgKmtIawD72yGl+NsrWkjmn+gJQyyNeMt9XeTehiZ2k6nb3APX9O1vdIa+elaLlyno/zb2G/0e6TlniCXDBwnZtI751tP65JP/iqF7AoUD63qBWUQtuslYJOsm+ON77u6k9z3VhQn4Uw8G0b4OCVMcMR6ExIP2cZ+E86Lti0=;
X-UUID: 78722d7862fd429d9405424b5c37f6cc-20210618
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1069663994; Fri, 18 Jun 2021 19:57:32 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 19:47:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 19 Jun 2021 10:47:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 19 Jun 2021 10:47:24 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: phy: mediatek: tphy: add support hardware
 version 3
Date: Sat, 19 Jun 2021 10:47:17 +0800
Message-ID: <1624070839-1233-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61F31F61220BC684D2241E75CFBD627072BEFBA453B5AAAAE65EB56E6EAC09FE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_195735_291624_1A65F975 
X-CRM114-Status: GOOD (  12.81  )
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
Due to the FreqMeter bank is not used but reserved, it's backward
with v2 until now.
For mt8195, no function changes when use generic v2 or v3 compatible,
but prefer to use v3's compatible, it will not waste the time to
calibrate the slew rate, and also correspond with hardware version.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add more commit log suggested by Rob
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
