Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02B8C47DD3
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 06:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmamzG/uxvoY/9JcXAepY44DJ/qDUJu48SqEyvjF57s=; b=FlWH6ug84V+yNU1qaml4VNqip4
	pEvtAA21Q74jbvD+4H3IqgB2ZqoAOwn06TJaJimzVxl06TCrqSIralWWmLsoMr3iV2XzQVo5BGqfi
	BxpIDYFuIHpehfeQoEeyV0uRxAP8CDUJnIIl8XlJe6eN5u7flioQ1QSD7MXJgBD9sJUgTlQtisBY1
	HLXf3NK4ajy3mbf5+xs956AjCY/qOu6f9Qu/Ex6XNRb02n/A7fQvynevVKY3iAHfTxDMJ2acVUxiV
	zqbrK5GETr8S5/Nm0Aolj+H0X9le31VrygVeTGxUPX75YkeK14bi5qSRlkmL/p9D8tCdc/6SsSH1H
	OD12SCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiRA-004baM-1x;
	Fri, 19 Jan 2024 06:33:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQiR6-004bXm-2z;
	Fri, 19 Jan 2024 06:33:06 +0000
X-UUID: 96e85536b69411ee9a263b4415211400-20240118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pmamzG/uxvoY/9JcXAepY44DJ/qDUJu48SqEyvjF57s=;
	b=HoK0iuu9JkLpxOOxEC+Nvkqw1ABk9i4OjnUc7q5bXEHBnaWY+U82GEZXJ88CXNEt4k3dEKdXrF1WLIQCc8rXQbuqb79TaPiJMDVoLkvOBxSYVdI194ofNq47A1bobB8NWE42sAEAqHMYqFAh+L6ZanbiKqkkCxaHnDVhNk2lZ3E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:33ba950f-262f-4e31-be0d-13529e00b9d5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:07da6c8e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 96e85536b69411ee9a263b4415211400-20240118
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1529550407; Thu, 18 Jan 2024 23:32:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jan 2024 14:32:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jan 2024 14:32:25 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 2/3] dt-bindings: media: mediatek: mdp: Change mediatek,gce-events to reference
Date: Fri, 19 Jan 2024 14:32:23 +0800
Message-ID: <20240119063224.29671-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_223304_969470_3CD682E7 
X-CRM114-Status: GOOD (  11.12  )
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

Change mediatek,gce-events property to reference mediatek,gce-props.yaml
instead of defining itself.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../bindings/media/mediatek,mdp3-rdma.yaml           | 11 +++--------
 .../devicetree/bindings/media/mediatek,mdp3-rsz.yaml | 12 ++++--------
 .../bindings/media/mediatek,mdp3-wrot.yaml           | 12 ++++--------
 3 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
index 59db8306485b..4a286d46c8ee 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
@@ -44,13 +44,6 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   mediatek,scp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -96,6 +89,8 @@ required:
   - '#dma-cells'
 
 allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml
+
   - if:
       properties:
         compatible:
@@ -142,7 +137,7 @@ allOf:
         clocks:
           maxItems: 1
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
index f5676bec4326..4774fdde1a1b 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
@@ -38,13 +38,6 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   clocks:
     minItems: 1
 
@@ -55,7 +48,10 @@ required:
   - mediatek,gce-events
   - clocks
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
index 53a679338402..a31f3f5aea96 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
@@ -38,13 +38,6 @@ properties:
       4 arguments defined in this property. Each GCE subsys id is mapping to
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   power-domains:
     maxItems: 1
 
@@ -67,7 +60,10 @@ required:
   - iommus
   - '#dma-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/mailbox/mediatek,gce-props.yaml
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.18.0


