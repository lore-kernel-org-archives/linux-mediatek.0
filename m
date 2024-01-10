Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BEEC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O746dOdENmbBQtujY/4r4cNg6wrPMsTsPcGtObEJqEI=; b=xQNRn5DwmyyYxy9m/vF5sB7ljF
	LLSIQyLtv87bvoMs5E+0V/IsGYeukStalxhqZba+/T4Ajg6CP6sG/OhIubXboUhtLZo/z2RJCKw7k
	uOt3ztIbd1wM83VhcJ3gedvtOx4jMey748sfR/9oQ050T6XQXVGI32qL1aGgsEvwt2rPf7IBRvQYk
	Ngpsx3GZ+5lNIG1/dUDtNG4WnEyugFeqYAkIPbu40+gvfo8E7o5wp7Ru97h3bx7ligDdHw+pB7OOB
	gJgcIB4d9dG1D2ZZb+QIA+KSRHHU4h7i3trXNMsi2NE3q6Rn3s+nDOS5M39UyWNdYtDCLYJ+N+fns
	wbEtJ6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSBo-00AUlG-2V;
	Wed, 10 Jan 2024 06:35:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNSBl-00AUka-0e;
	Wed, 10 Jan 2024 06:35:46 +0000
X-UUID: 76c53c88af8211ee9a662f17bb45267e-20240109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O746dOdENmbBQtujY/4r4cNg6wrPMsTsPcGtObEJqEI=;
	b=s+Oa81HYK3Xig69u3+G1nWahg+s7mV43DGgSoWgyESVYoWmS6sSSzp70HFFXyeMJB58R+fKKnDzxSA+39VgQ/3t7Ow9E+Ftnr2IRmWfuJ+9IZbaf5/F2tz945Av3M2ICfkmAzAthlhZ6ZVrx2bM+1WDNppIWEdu/W9BEAaosQSI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:8dfee7f7-22d7-4a24-a9fd-464577a8fab1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:03c12f7f-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 76c53c88af8211ee9a662f17bb45267e-20240109
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 707998922; Tue, 09 Jan 2024 23:35:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jan 2024 14:35:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jan 2024 14:35:33 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 4/4] dt-bindings: soc: mediatek: Change mediatek,gce-events to refernece
Date: Wed, 10 Jan 2024 14:35:32 +0800
Message-ID: <20240110063532.14124-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
References: <20240110063532.14124-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_223545_274336_DEAB44D9 
X-CRM114-Status: GOOD (  12.18  )
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
 .../bindings/soc/mediatek/mediatek,ccorr.yaml        | 12 ++++--------
 .../bindings/soc/mediatek/mediatek,mutex.yaml        | 11 +++--------
 .../bindings/soc/mediatek/mediatek,wdma.yaml         | 12 ++++--------
 3 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
index 4380b98b0dfe..9e03de3c721b 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
@@ -34,13 +34,6 @@ properties:
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
 
@@ -51,7 +44,10 @@ required:
   - mediatek,gce-events
   - clocks
 
-additionalProperties: false
+allOf:
+  - $ref: ../../mailbox/mediatek,gce-props.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index ba2014a8725c..6c3dafe7f9a5 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -53,13 +53,6 @@ properties:
     items:
       - description: MUTEX Clock
 
-  mediatek,gce-events:
-    description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
@@ -73,6 +66,8 @@ properties:
       a client defined in the header include/dt-bindings/gce/<chip>-gce.h.
 
 allOf:
+  - $ref: ../../mailbox/mediatek,gce-props.yaml#
+
   - if:
       properties:
         compatible:
@@ -97,7 +92,7 @@ required:
   - interrupts
   - power-domains
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
index 69afb329e5f4..a8d393784554 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
@@ -35,13 +35,6 @@ properties:
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
 
@@ -60,7 +53,10 @@ required:
   - clocks
   - iommus
 
-additionalProperties: false
+allOf:
+  - $ref: ../../mailbox/mediatek,gce-props.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.18.0


