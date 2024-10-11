Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4325FD2447F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 06:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y2T9fRA9uvlVR02QkoFnRdEwwHlGLql4m/SX4vgEwHo=; b=VLo4qKHa5oWv5vp2JRjIEcw8rK
	qyZRknEgVJLHClmz/Im5Ub3Gb0OgWzLjLHb6BlX8G3cMbfxJcKSq0iUL94FV71uNixARy9dz2W6a+
	OtqxRg31fnouhnL3y8PcOYBEFi3aT8HcfCot1sFVNyvzacAVNKQezSNMwVfcTSRBc60gXjwDeXaB6
	R6jY8zjNZLSeePlLZRcA0Cz2O86nDihq6E0YIS2sWMz+i7reLDj1eDN3eYaktn6mUH8BHQyK2PAbV
	uqktmAJ2CMKGiC3j0QsZdCU+kA+iX08WGRITz2vzxFHcv/wS0zMqqSUWj8FTzwWMpnkVDdojYKlbj
	CeGIRrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz9Y8-0000000FSc8-0qy2;
	Fri, 11 Oct 2024 06:54:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz9Rm-0000000FR8O-366t;
	Fri, 11 Oct 2024 06:48:24 +0000
X-UUID: cc09489a879c11efba0aef63c0775dbf-20241010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=y2T9fRA9uvlVR02QkoFnRdEwwHlGLql4m/SX4vgEwHo=;
	b=GoGcYPsVH18eV2yFySiMsYYm1WP4DMT7fnZI9dlVcyPcHiNAti7DFcDS9GlGO/p89+X3GftJVU1kGkqZ0GIjHQ50h9VezV6CrdDGMrXcGTAUguyD+QFkXxCFxgiu0DFFUZ7Q8bGg35JTaVY7oo0cNpAE3JpWhze/rZrwHsemEig=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b744213c-7b21-43d5-a046-a255472c04d1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2df01465-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cc09489a879c11efba0aef63c0775dbf-20241010
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 959974817; Thu, 10 Oct 2024 23:48:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 11 Oct 2024 14:48:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 11 Oct 2024 14:48:13 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] dt-bindings: phy: mediatek: tphy: add a property for power-domains
Date: Fri, 11 Oct 2024 14:48:10 +0800
Message-ID: <20241011064810.5103-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.165100-8.000000
X-TMASE-MatchedRID: k8Cd32tj8sGMNoAzq9nHoWNW0DAjL5p++OI6XsK3BWHfUZT83lbkEJVD
	ZsT0rYWCqP2RhwqsDVhYSGAnlsUp3lAXAjgfNI2iRy+94mWbR+blOkM7VYqzaZi7/tnxUUyGo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqt7aENEMomdGuGxZsjVPBjfObxZIv/aSQArgevuQgg4NYHJD
	IxduTwSZmxuzUAi+Dfup5+b9g7ZTRiF54b8Md0Br5sQoYg/dmD4sOrsb4iT/K/bbEolHIgZUOc7
	GjOamnWv5a9cmIodEspRnLV2kwrLg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.165100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4AD9FFC112EA5D5D7D7DB547735B4F1CC3D11219A3110772C6367C57CD5144FB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_234822_816705_E3F01E8D 
X-CRM114-Status: GOOD (  10.48  )
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

MediaTek TPHY should be existed in a power-domains.
So we add property 'power-domains' and set 'maxItems: 1' in the
DT Schema.

A reminder is also added to the description of 'power-domains'
property.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/phy/mediatek,tphy.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

Changes for v2:
 - Add a reminder in description of 'power-domains' property.
 - Fix commit message from v1.

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 423b7c4e62f2..6be3aa4557e5 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -125,6 +125,16 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 28
 
+  power-domains:
+    description:
+      The TPHY of MediaTek should exist within a power domain. The
+      developer should be aware that the hardware design of MediaTek TPHY
+      does not require the addition of MTCMOS. If the power to the TPHY
+      is turned off, it will impact other functions. From the current
+      perspective of USB hardware design, even if MTCMOS is added to the
+      TPHY, it should remain always on.
+    maxItems: 1
+
 # Required child node:
 patternProperties:
   "^(usb|pcie|sata)-phy@[0-9a-f]+$":
-- 
2.45.2


