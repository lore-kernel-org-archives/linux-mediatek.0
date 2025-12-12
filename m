Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED162D4336B
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Dec 2025 03:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnnh38WJAKhFUnTMejVnEV0DsAhOkvN9JTUMh9QkfBM=; b=e34wnMxrK0yfxjFo9bwRLn0CCO
	hpfa7fmT1g5+B+Xky1KpuCoyIgDZ4UixHk21INMDq7t4kDrGaLoMZErJGxA66PrZ/wVMsR3rjnJTN
	8/cq+SyVKlZ80M78LqNqKqWMyDne3CC5mUQSBN0TueKYTXaL/NidJ+9AQD+56O0tamlBfO2KJ3kvx
	7+YeXZa6bG0jgmJ8lBwVW6ysJW+lgR7nbfOtHRUj51WdLZvQ3U92bD0zAo2K1aBUf0QL2x6S81FHl
	CEXn1m9YOqRhztmNBGrns9LLZmB983ITe3p4zeA7mCjrfQFpmC3cZz1ObJTZVcBvRlI0rgyVGfk0/
	WQW8WkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtca-0000000HaUJ-2Nav;
	Fri, 12 Dec 2025 03:15:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtcY-0000000HaTW-41y2;
	Fri, 12 Dec 2025 03:15:07 +0000
X-UUID: c09835d6d70811f09f706fa2197c6ceb-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qnnh38WJAKhFUnTMejVnEV0DsAhOkvN9JTUMh9QkfBM=;
	b=rcuYiB2UtyUa4LIatdFpAgwz567SUbmw+BACmFJqTjirEv3B0WiBPoCAANWqW7CMUzCQXh1MyKlJlyacmegO7KiLfkDJrYBuR4I1ZBW1551pOHjREjpYFPSGxGt/uRkVLsPtv9Ze9W3PL6AbxvdVWPWDsM4DKOEgRTwWMyHpmbE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:abd106e0-02c7-43d6-ba03-a9adf1dd9f68,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:c7136f28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c09835d6d70811f09f706fa2197c6ceb-20251211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1743096770; Thu, 11 Dec 2025 20:15:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 11:15:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 11:15:01 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/4] dt-bindings: soc: devapc: Add for support MT8189
Date: Fri, 12 Dec 2025 11:13:42 +0800
Message-ID: <20251212031450.489128-2-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_191507_002820_29EC52F5 
X-CRM114-Status: UNSURE (   7.95  )
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


External email : Please do not click links or open attachments until you ha=
ve verified the sender or the content.


From: "xiaoshun.xu" <xiaoshun.xu@mediatek.com>

Add compatible and vio-idx-num attribute of MT8189

Signed-off-by: xiaoshun.xu <xiaoshun.xu@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/D=
ocumentation/devicetree/bindings/soc/mediatek/devapc.yaml
index 99e2caafeadf..4068786d3bb1 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - mediatek,mt6779-devapc
       - mediatek,mt8186-devapc
+      - mediatek,mt8189-devapc

   reg:
     description: The base address of devapc register bank
@@ -30,6 +31,10 @@ properties:
     description: A single interrupt specifier
     maxItems: 1

+  vio-idx-num:
+    description: Describe the number of bus slaves controlled by devapc
+    maxItems: 1
+
   clocks:
     description: Contains module clock source and clock names
     maxItems: 1
@@ -55,6 +60,7 @@ examples:
     devapc: devapc@10207000 {
       compatible =3D "mediatek,mt6779-devapc";
       reg =3D <0x10207000 0x1000>;
+      vio-idx-num =3D <132>;
       interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
       clocks =3D <&infracfg_ao CLK_INFRA_DEVICE_APC>;
       clock-names =3D "devapc-infra-clock";
--
2.45.2


