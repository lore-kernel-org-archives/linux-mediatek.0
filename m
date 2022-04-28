Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 01:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=unOEpYgSpurnzxKzVaK2af5T7q6ioXMSOmVTm8PQCT4=; b=lWxR1OPvdzxh2V
	58YTht80LWqda2h8ftr2jUB86f6238GQW/KyzvcjhYyFzN5sEN7VSH8pGe307BhviIquJEMQQ+mmE
	CUTJbKbyu/ArJbuOEughyjAot3l+6h5Y6Y9T/7xhHP63ASbDwN5y+WQ/EX3OP3wEmi29iXeCWGgBz
	LEvDt55WToEApHOBmOkToEbvb93HgXl9FqwfJW6eD0L/SKG/U18fTYPOZojkRhWafzMZN8Z8Cm6dJ
	ggi6awqQiRK1re5vPYQjmhcFBEZdKd8d5zcuKMBaRd1LqwaNNko7gUjX+Tqp+l4nSYT/xEcUKJMbl
	3ErlTMe5n/uPKqkIUrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njt5w-004JRm-36; Thu, 28 Apr 2022 01:37:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njt5r-004JR4-Lo; Thu, 28 Apr 2022 01:37:22 +0000
X-UUID: 95429e39666a4daa9ee38ce36ff9e9b5-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e6e0dcb0-c04a-4301-9707-30d9c823be8d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8f3bf62e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 95429e39666a4daa9ee38ce36ff9e9b5-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 808764684; Wed, 27 Apr 2022 18:37:13 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 18:27:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 09:27:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 28 Apr 2022 09:27:16 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Fabien Parent <fparent@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
Date: Thu, 28 Apr 2022 09:27:15 +0800
Message-ID: <20220428012715.2619-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_183719_739228_5C70F979 
X-CRM114-Status: GOOD (  11.74  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Power:
  Refine description and add item number for power-domains property.

GCE:
  Refine description and add item number for mboxes property and
  mediatek,gce-client-reg property.

Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power and gce properties")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..6722f1b724ef 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -43,28 +43,27 @@ properties:
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
     description:
-      Using mailbox to communicate with GCE, it should have this
-      property and list of phandle, mailbox specifiers. See
-      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+      If using mailbox to communicate with GCE, it should have this
+      property. GCE will help configure the hardware settings for the
+      current mmsys data pipeline.
 
   mediatek,gce-client-reg:
-    description:
-      The register of client driver can be configured by gce with 4 arguments
-      defined in this property, such as phandle of gce, subsys id,
-      register offset and size.
-      Each subsys id is mapping to a base address of display function blocks
-      register which is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
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
