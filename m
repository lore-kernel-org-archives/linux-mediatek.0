Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC7DCCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qu2egUCkJQDE46OKXnqkitrgmSISMSmEZahKNKYjMHM=; b=0j1bP0dW1JRn2PwrCB/NYXN6Kh
	tiChkxTe08QzNWg5pMiBVgTe21QqKBIaZDOSbTVPadMa6gdcsqC1k8Tf4GH3Lq9gv/r9TO+5CKkgZ
	2A9XcgBasMZpfKDjZeyd1yvf0ScQtovj5NV0W02BRlq2/v//DD+04uEsV4oOAYmQYC//NW5ncv/uX
	Ol4WHRYBm9ixkvDV5GY2JW3Vyh2FdhzJP/+T2sH6yTot+x56NzdPhIt+5h2iSJVPorebAEtpwIkP8
	H0uVxFeglQIvQxTxoQ3hcvcy97DROjrTQxjEZrI4rtTBoIFPXQeykte7Eh8LOpZmaiIxC28nPqnKO
	uyMcxO1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlb3-000000081z0-4077;
	Thu, 26 Sep 2024 10:19:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stlZn-000000081lb-2ANa;
	Thu, 26 Sep 2024 10:18:28 +0000
X-UUID: a2b540fa7bf011efba0aef63c0775dbf-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qu2egUCkJQDE46OKXnqkitrgmSISMSmEZahKNKYjMHM=;
	b=af3OcDMnzffx+frNu9Pq/YY/MVflkVskv/2sCRdNXKFZY4xSHmHBhYtk9NfGIX5+uHPdZim4S1slIH8uRW8qgd9OCxPbXtdZy4kegqS32+AlstZvypQU3o2Pi+C6TRAitTEb657Ezp4/UfmAKABrjHW8LkkyduqaySS7mEBycSg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:e111446e-91b2-4130-b1ff-d45f67fc803f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e1074b18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a2b540fa7bf011efba0aef63c0775dbf-20240926
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 520568871; Thu, 26 Sep 2024 03:18:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 18:18:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 18:18:07 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH] dt-bindings: phy: mediatek: tphy: add a property for power-domains
Date: Thu, 26 Sep 2024 18:18:04 +0800
Message-ID: <20240926101804.22471-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.840300-8.000000
X-TMASE-MatchedRID: XzZoR/QBx5m8aDXGBxCZo1z+axQLnAVBKhNpTcvbdULfUZT83lbkEEhh
	ikD15t6m7VjbVyT2Ad2lEtDJyVR88h8TzIzimOwPlpYqKNmWxsHZs3HUcS/scCq2rl3dzGQ1aF/
	EtaBAwFWbVqoswFQwtJfRwwQjoSTh1txDceTZ+1HrkA2hZUjItQyV3cXn6+Blaw1OSeQJJi+D+k
	H1c5vos1G8Wbi/c9wz5KDH/uB+cKzzYaPZALfIbSyZdUr8fx4fMbuyvvGhtIDNwMS8lpRKBQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.840300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 99C1402EEBB0849B7D597AED9FC97AA0B972F04B5C9D1A008EC5ABFF7C2A62862000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_031823_591326_B0F0B891 
X-CRM114-Status: UNSURE (   8.01  )
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

Some platforms requires a dependency for power-domains.
So we add property 'power-domains' and set 'maxItems: 1' in the
DT Schema.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
index 423b7c4e62f2..c77fe43c224a 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
@@ -125,6 +125,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 28
 
+  power-domains:
+    maxItems: 1
+
 # Required child node:
 patternProperties:
   "^(usb|pcie|sata)-phy@[0-9a-f]+$":
-- 
2.45.2


