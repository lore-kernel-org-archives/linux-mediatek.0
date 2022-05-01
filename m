Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8961FC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 May 2022 09:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BcjVtGeBSswNVuFnriHClhzARDu3BGVbpvCWsoJyK04=; b=kvMq4Xgcj8dhr0
	8TSMkq6vQbXuGcJxk+Nq+i8oauT6aZbde6QXx9kMcfS8JsIxqxhQzStnP2gEOgf5TWZsxAtwi+8MU
	cEr1MC7B0nNYPHc5fwMgRMEjgdnUdi0QeGOSj9FGYVdS9naJPHWMLPq9vPKCbj2brr1uGrgRZCtcS
	WAfsref8eRrwu1V7iWQtQI57n9ipoiXN8VGwLvaVribxuAWSq2T8xuSIJSZN5DNLa3Z3rUV2QfMgX
	YDbYf4CupmOe5km6f0fkfvCL6k5xpvZ1PUfg+HJ5kZ3/D4RYdts4826j4uat9qZ1EK3GLp5j+a8in
	EbictTiEAT32IFjO+EsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nl5cC-00Fyi0-W9; Sun, 01 May 2022 09:11:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nl5c0-00FyhF-4W; Sun, 01 May 2022 09:11:29 +0000
X-UUID: 3678f141373f4faa8339ae2030321ed2-20220501
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:07f90531-8a40-45f2-8917-92367838f5b0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:3757512f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 3678f141373f4faa8339ae2030321ed2-20220501
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 21238079; Sun, 01 May 2022 02:11:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 May 2022 02:01:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 1 May 2022 17:01:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 1 May 2022 17:01:18 +0800
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
Subject: [PATCH v3] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
Date: Sun, 1 May 2022 17:01:17 +0800
Message-ID: <20220501090117.19557-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_021128_220215_F9D854FF 
X-CRM114-Status: GOOD (  11.30  )
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
Change in v3:
  Add maxItems condition for mboxes property.
---
 .../bindings/arm/mediatek/mediatek,mmsys.yaml | 34 ++++++++++++++-----
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..f36798792b8c 100644
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
     description:
-      Using mailbox to communicate with GCE, it should have this
-      property and list of phandle, mailbox specifiers. See
-      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+      If using mailbox to communicate with GCE, it should have this
+      property. GCE will help configure the hardware settings for the
+      current mmsys data pipeline.
+    minItems: 1
+    maxItems: 24
 
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
@@ -77,6 +84,17 @@ required:
   - reg
   - "#clock-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-mmsys
+    then:
+      properties:
+        mboxes:
+          maxItems: 16
+
 additionalProperties: false
 
 examples:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
