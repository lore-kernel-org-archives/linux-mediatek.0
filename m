Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85444C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3015061362
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 06:49:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3015061362
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MDnX5xHmQdMa5FJIIlDx9sILmcTioFcEM6OLXeUYOTg=; b=4n0s6pisQPtMTw
	4bNHtUmMrW4Sy4F8i+BHcLgm5EhcH+EZ+d7FWCAYcY6PCZfqkURZfFIM4tDFYpp+7PPjOqDxBJjUh
	I3/7guzMmcRQpGwyUV6iBvzag/s4N0iX1I4BZ4m+XYhAWrX8wUu9ZgOHeMEiXyCxTdZtITDKqP6VF
	WW5pXv0fIYN5P25sHccwP2b+lbLjCe03x6UfgRuOJaP5ABZigd0LU/q/kFGyMD1rjyrz312jNdoZo
	U1HVrXja/7qrbU2YeZQlWX3Hs/rxY1fcEDmuxbh6iMhiiAwOulTiebVAXz7pE5GoY+ZdERYSEqEvn
	+duUoIinVrqw0SGvTaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3vAw-00HJA6-AX; Thu, 15 Jul 2021 06:48:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3vAi-00HJ5U-8I; Thu, 15 Jul 2021 06:48:37 +0000
X-UUID: ec9ccd6b27ac4a2b97955554e4da9fa9-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6Vy5huXdOmhmToD+G5ACX0UJXo9+nuwr5HjBLElPdxE=; 
 b=JTSE6U9IuYP4uLxi1KvBGWVMweWwMr1cCoY2Mg8ubHkBbuUL/hLF7Noav0o1e9H9mI8GylfX07KbRQ1/xd84G2KPZXywlLlVcXG2lHRNIS8ZmAeQcVVNQgKLmxCeikWvcNvJ725UEP1We0cnSCv79h5E5m3rsYpaKZaJ1/gTPfQ=;
X-UUID: ec9ccd6b27ac4a2b97955554e4da9fa9-20210714
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 14444555; Wed, 14 Jul 2021 23:48:31 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 23:48:30 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 14:48:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 14:48:28 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH v3 1/3] dt-bindings: phy: mediatek: tphy: add support hardware
 version 3
Date: Thu, 15 Jul 2021 14:48:20 +0800
Message-ID: <1626331702-27825-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_234836_351876_C59DC401 
X-CRM114-Status: GOOD (  12.94  )
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

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: add Acked-by Rob
v2: add more commit log suggested by Rob
---
 .../devicetree/bindings/phy/mediatek,tphy.yaml     | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index ef9d9d4e6875..838852cb8527 100644
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
