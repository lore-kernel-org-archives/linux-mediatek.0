Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA57CC35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7Yj6Y66nkJxIiUbHpJeS3QldM2ExHIW+dsu2Qi/ECo=; b=iUVdR4vNIL0Np5umLUoT5ueqYT
	arVpGgN7BxJvKevw9OEvmbchffAuiZSnRr+B2mUq75tfPq/Wrkg6JVmE25bkU7QF7i0ycajTlrR9u
	Q0+jIWPPsoYTL5NrJv5QLuTwmYODvJWFUqDc2xOTaEvW1b8El2nRloaXWXmHRc/PcL+j/SYCHegTG
	OZbAJ3YjmJhm8N+fG6Zy+BqUw0Sr7a7+VEUHYrKdywVOc8s8GNzLOJiFOyGpKtLpKMtRy2MoAGlbO
	ouMZpw6JVXOXafZhXZOAGKyYyfJLbRP1YiS/HXv97va4J2nqslDQl8yIIVjSKnntpZJ5aVwKJcLZd
	wfG4t3oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9F7-009WIA-2y;
	Mon, 18 Dec 2023 08:44:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9F5-009WGo-0v;
	Mon, 18 Dec 2023 08:44:52 +0000
X-UUID: b211150e9d8111ee958cff29c719f35b-20231218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y7Yj6Y66nkJxIiUbHpJeS3QldM2ExHIW+dsu2Qi/ECo=;
	b=Lo5lZUYDFf7JJu0qgMrkKQk8IeLGBn7vZ+0LuZQQAq81oWe+nmyK9c/U4vfu+cXUDoljwxDBtzDGI0oPddgz6QAtzTRwZnz4Kr4vDF8OaAUq+6HMieCfBKePpIRPi0OrW6RkWdsVEXSBu0vZTEqF4UYxpF+TURMt+bvpaNxVxBw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:e0251ec0-3cba-487d-ac79-0f4ba43abc37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:f5064dbd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b211150e9d8111ee958cff29c719f35b-20231218
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 409379223; Mon, 18 Dec 2023 01:44:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Dec 2023 16:36:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Dec 2023 16:36:35 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 3/3] dt-bindings: soc: mediatek: Change the description of gce-events
Date: Mon, 18 Dec 2023 16:36:04 +0800
Message-ID: <20231218083604.7327-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231218083604.7327-1-jason-jh.lin@mediatek.com>
References: <20231218083604.7327-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.786100-8.000000
X-TMASE-MatchedRID: qT9V7Qri98/C5N8cNUn/XmwbuvhCHs3cTJDl9FKHbrk1LB46LFAAkpdA
	ax/AUFGFQv/RxZk9D1GOj381tmO8MtCjuUhsbmmkngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIx1F
	PlNAAmcCPpBngdcMN7xlRDFVipn3MNVv/DcAEyrgk9IZxEaEaYZ6oP1a0mRIj
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.786100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C670A22497E49DC940E1AA3C07A75162FEF88A0B79553D7D7A658F692AF271BE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_004451_335429_9989063E 
X-CRM114-Status: GOOD (  10.91  )
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

Change the description of mediatek,gce-events property to reference
mediatek,gce-mailbox yaml.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml     | 5 +----
 .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml     | 5 +----
 .../devicetree/bindings/soc/mediatek/mediatek,wdma.yaml      | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
index 4380b98b0dfe..64c0f99fcbce 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
@@ -36,10 +36,7 @@ properties:
 
   mediatek,gce-events:
     description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+      Reference to Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml.
 
   clocks:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index ba2014a8725c..34b313154534 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -55,10 +55,7 @@ properties:
 
   mediatek,gce-events:
     description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+      Reference to Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml.
 
   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
index 69afb329e5f4..ff515cf8394b 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
@@ -37,10 +37,7 @@ properties:
 
   mediatek,gce-events:
     description:
-      The event id which is mapping to the specific hardware event signal
-      to gce. The event id is defined in the gce header
-      include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
+      Reference to Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml.
 
   power-domains:
     maxItems: 1
-- 
2.18.0


