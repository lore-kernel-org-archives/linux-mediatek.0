Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69182C369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpC3bMATM3lf+XV0YiTWcXgm6sU8WRjyf2ObtC447xA=; b=el7drveihYGdQXtSlwZ+BBxbmO
	Q27nSVNbCck2VXvI4ITI86RXoQ17H/bVkwYBolrb4MQnnBKvcu3wc/x1B1bngNoSljsrJVaP66DAk
	PNPinKAyiZ48oMuG1xXakQdDs+uTmLU55klyVnDa4P4ddETXqEi6h6L1554I4U4MjIqIH1CKuWWIi
	soEuhk/UVmkrJO0IUUmbXfmsUGfFrzfkRObJl9pyCi3Dv81EcOlZ2TBqBuPCLMydoijm/82cnwgfG
	MKZ76h+dj4Rya7s+E/qyGKBFyCdPNgojnxuqAGn6Z9yALlVsGe8Ti2ZM8qzHksktuVj1JFr37aDcb
	pgG3nq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Exk-0000000GT3L-1NDb;
	Fri, 25 Apr 2025 09:03:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Eoa-0000000GQOp-2cOi;
	Fri, 25 Apr 2025 08:53:46 +0000
X-UUID: c68fc0d221b211f0a2405d5ef59ce188-20250425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JpC3bMATM3lf+XV0YiTWcXgm6sU8WRjyf2ObtC447xA=;
	b=WJvkx/6Qlxsd2WoT+EAsW/oPbhzpGE+QmiXxLNHhRrUadyQH9UZGIb54PwVE057xXvThdbNQQoMG9T1j+vO7fIAYaYSaX5EYAtymKDLCdpEPexzlmuCXopdxkXhZrLE6BhVonOh6uqr5dtVK40n1bHbHzlJ8DUcNhkRtTqwnnzo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f1c0da09-746e-4e31-ba26-5d7ce8560abb,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:a357dd6f-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT
X-CID-BAS: 5,DFT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c68fc0d221b211f0a2405d5ef59ce188-20250425
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 201289323; Fri, 25 Apr 2025 01:53:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 25 Apr 2025 16:53:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 25 Apr 2025 16:53:33 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v3 02/12] dt-bindings: media: mediatek,jpeg: Add mediatek, mt8196-jpgenc compatible
Date: Fri, 25 Apr 2025 16:53:18 +0800
Message-ID: <20250425085328.16929-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250425085328.16929-1-kyrie.wu@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015344_721362_1D23AA3B 
X-CRM114-Status: GOOD (  10.64  )
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

Compared to the previous generation IC, the MT8196 uses SMMU
instead of IOMMU and supports features such as dynamic voltage
and frequency scaling. Therefore, add "mediatek,mt8196-jpgenc"
compatible to the binding document.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../bindings/media/mediatek,mt8195-jpegenc.yaml           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
index 596186497b68..e2d772ea0fb0 100644
--- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
@@ -14,7 +14,9 @@ description:
 
 properties:
   compatible:
-    const: mediatek,mt8195-jpgenc
+    enum:
+      - mediatek,mt8195-jpgenc
+      - mediatek,mt8196-jpgenc
 
   power-domains:
     maxItems: 1
@@ -44,7 +46,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: mediatek,mt8195-jpgenc-hw
+        enum:
+          - mediatek,mt8195-jpgenc-hw
+          - mediatek,mt8196-jpgenc-hw
 
       reg:
         maxItems: 1
-- 
2.46.0


