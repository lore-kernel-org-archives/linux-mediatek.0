Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C3FCFC287
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 10:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a8qCVhVIWFAmnRKX3OXq2rlmCfjQb9p/E9Q29h/MGfI=; b=1zZLzTziXRct+KV5cIqahBj0px
	4t4JtlMSS6NRFhH5/oyyJ8PgPutj13iF7Ot6y9Zk7jDouMrjw97Cd44jsR2VSPgKQL16fyzOlaTXp
	bwALNRnK3RJZwSkJe+FPmRp7FTT2Qf0TA51NEycTtV2dGo+kE6WFGGHfXn6822sBaILvXhub06DeE
	Qkrc0KTY32Hqzq4RY3nzxBCzf0aEzziZwJAZnw+3OYSKl49PpPad60sG50xoG/tZpl+72QMbG7OkO
	tOafj6/OXoZIXBc6t11vhI0MpIJFU3fvUUc0sNMZGJw862yg4kzSUV9N5SYandYWsS4Uyp4vUkEHd
	IyJT0JXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0evJ-00000007rww-3Yv9;
	Tue, 15 Oct 2024 10:37:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0esT-00000007rJo-0pwd;
	Tue, 15 Oct 2024 10:34:10 +0000
X-UUID: fd8218248ae011efba0aef63c0775dbf-20241015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=a8qCVhVIWFAmnRKX3OXq2rlmCfjQb9p/E9Q29h/MGfI=;
	b=dIZg9dNZ78CGEz1H5ECI36zLGdngdlbEClKELM1jSO3OqVVt2+Sw61arhAY6Kl88wQeVGbRUPm10bhca+TME1A5VUIvEB/IuXetLJYy/9DQOposl6Unkjt9cMg/WZTjPDxTudr9P/4n7VCa0zIgkAU9MQOPQomUjNat9ClSzQRM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:609a7238-661d-453e-94a7-fc9ea2ad9f1c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:277fd106-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fd8218248ae011efba0aef63c0775dbf-20241015
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 211048401; Tue, 15 Oct 2024 03:34:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 15 Oct 2024 18:33:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 15 Oct 2024 18:33:56 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, ChiYuan Huang
	<cy_huang@richtek.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chris-qj chen
	<chris-qj.chen@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: usb: mediatek,mt6360-tcpc: add ports properties
Date: Tue, 15 Oct 2024 18:33:36 +0800
Message-ID: <20241015103337.20479-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.840500-8.000000
X-TMASE-MatchedRID: 6pbNFWS8cDsogNuHjUlKTcV1CHtMfzqgJNtuyL6mpIXfUZT83lbkEDQz
	47GqDWjpiYeJX0ZLCFCwji3+hURDy7YCBNsYIDyvjtK7dC6UBnnlOkM7VYqzaZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNZGN3uF5aYuhkFr/Uz3mflTcBaWlN+Fm4iCeCicusNBiC3m0DNajQcvAvp
	LE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.840500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 636958D15D9342168208B73159A0A722B66D6B91044804FA29D1FA68BA23E3B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_033409_268285_E03B8128 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

Add 'ports' and sub node 'port' properties to specify connectors on the
High-Speed/Super-Speed data bus, or Sideband Use (SBU) AUX lines
endpoints of the USB controller.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/usb/mediatek,mt6360-tcpc.yaml    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index 053264e60583..5b6ea0d734ea 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -32,6 +32,27 @@ properties:
     description:
       Properties for usb c connector.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Any connector to the data bus of this controller should be specified.
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "port@[0-2]$":
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          It could be one of the following interface types. High-Speed
+          (HS) data bus endpoint to the Type-C connector, SuperSpeed (SS)
+          data bus endpoint to the Type-C connector, or Sideband Use (SBU)
+          AUX lines endpoint to the Type-C connector for the purpose of
+          handling altmode muxing and orientation switching.
+
 additionalProperties: false
 
 required:
-- 
2.45.2


