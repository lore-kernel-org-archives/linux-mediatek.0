Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A419C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdMrfrb/tia6PR9TRnzCWyhZ0YgmE9q5tSO1DENUArQ=; b=fqFL1dPeTpdlpI
	fUl00gX7b4mzjvzP9HsXUfSw0aAEPpmHjQmBErtwG8cL8xY29B7ZK7TgP6AOztTNwz/+pYts6BuYy
	Huby42lEJurPmt1JHBUOcfL3VoQc4MagtaOd0n5Mgnow9aPsNusTSr+/2daWkrOkDIWWTpwxP4MYb
	fQDDduDKreLMePYKAit85y/FnmkqTjnyASgZKPCPDfKrvGa1ppKLqHwjUItBYFK1RawAS+FBQkjXh
	UKDfpIJ8XWPwr5qq5ZeSu/WDDo4QM0jVQzX6R6TUWgTKH4IBwqtzPLKinQ2CXs9hM82xejdJz0P6e
	E7XYgjm0uzZ/r0u70y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkM1n-00ACNO-46; Fri, 29 Apr 2022 08:31:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkM1k-00ACMH-5K; Fri, 29 Apr 2022 08:31:01 +0000
X-UUID: eb33c566dd8e4f1183acdc8b851b0026-20220429
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:51b4e143-8c52-4513-832d-ea88d008b334, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:314a2a2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: eb33c566dd8e4f1183acdc8b851b0026-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1123107428; Fri, 29 Apr 2022 01:30:55 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 01:30:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 16:30:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 Apr 2022 16:30:52 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Fabien Parent <fparent@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Cellopoint
 <cellopoint.kai@gmail.com>
Subject: [PATCH v2] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
Date: Fri, 29 Apr 2022 16:30:51 +0800
Message-ID: <20220429083051.11260-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_013100_226329_383288AC 
X-CRM114-Status: GOOD (  11.52  )
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

Power:
  Refine description and add item number for power-domains property.

GCE:
  Refine description and add item number for mboxes property and
  mediatek,gce-client-reg property.

Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power and gce properties")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
Change in v2:
  1. Add maxItems: 24 for mboxes property
  2. Add description and $refs for mediatek,gce-client-reg property
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..2b27577f98cc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -43,17 +43,19 @@ properties:
     maxItems: 1
 
   power-domains:
+    maxItems: 1
     description:
-      A phandle and PM domain specifier as defined by bindings
-      of the power controller specified by phandle. See
-      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+      Each mmsys belongs to a power-domains. If mmsys wants to use PM
+      interface to control the power controller of mmsys, it should have
+      this property.
 
   mboxes:
+    minItems: 1
+    maxItems: 24
     description:
-      Using mailbox to communicate with GCE, it should have this
-      property and list of phandle, mailbox specifiers. See
-      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+      If using mailbox to communicate with GCE, it should have this
+      property. GCE will help configure the hardware settings for the
+      current mmsys data pipeline.
 
   mediatek,gce-client-reg:
     description:
@@ -64,7 +66,12 @@ properties:
       register which is defined in the gce header
       include/dt-bindings/gce/<chip>-gce.h.
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    maxItems: 1
+    items:
+      - items:
+          - description: phandle to GCE
+          - description: subsys id
+          - description: register offset
+          - description: register size
 
   "#clock-cells":
     const: 1
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
