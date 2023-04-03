Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB311C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 02:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXLfyDrrkNhCJOQV5hBAmnrRvZOodP5FXpETwFNnbxc=; b=hAacbLvff6zVMSllwcGdfj8Ojp
	ifjwrIPFK/X56c+xDyEhOKzTDipKZWva/ifr29jbg0iyiYzLDB/2o6HQIBe1PWnzMvKyc/7pyUkh8
	bn3q1mBqKBXdhD1aff16hnh/6s7ocj6w0d3amzO8+FNCMgdpjalU1n1Oynw9PsAfeOlB6+GNZmEgW
	zwyhr+EXl3BwoT8KP7akR7C22P/RPl0uR4y5DLgU6Q3T08zrYPog2pki47lHLOxhffgnMyIFVTdGq
	g8O8c5WTsSWITcb44U8PDf2MvIfc9uGDAcDln5zqfNIBgxhNG/v44XHSLUfJ/DFKQPkCMQyhLh/cE
	Ba2df1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAMi-00DzMM-2r;
	Mon, 03 Apr 2023 02:56:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjAMg-00DzLS-1S;
	Mon, 03 Apr 2023 02:56:15 +0000
X-UUID: ac443c9cd1ca11edb7d8d11f642b8e78-20230402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QXLfyDrrkNhCJOQV5hBAmnrRvZOodP5FXpETwFNnbxc=;
	b=ncJK13/mEu2YD8O1GiKHtaf1mUTFse2MNiGCPICV/E3YIAg9flgTPEwNUaa/f9u/cD3+8gj9Jce2sIFGHLGIafDtptjdMPJJWGSh+yrUfP8tScOtRog+MPBFYBsDKffHixDlYQrJZKnDByvmTdJmF0owvUYDHhAsgyoxRlfnzFk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:dcef2a1d-9c66-4526-b1c0-3a6d88334338,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.22,REQID:dcef2a1d-9c66-4526-b1c0-3a6d88334338,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:120426c,CLOUDID:5651abf7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230403105313QZ6YZWBL,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: ac443c9cd1ca11edb7d8d11f642b8e78-20230402
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 358590101; Sun, 02 Apr 2023 19:53:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 10:52:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 3 Apr 2023 10:52:35 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>
Subject: [PATCH 6/7] dt-bindings: usb: mtu3: add two optional clocks
Date: Mon, 3 Apr 2023 10:52:29 +0800
Message-ID: <20230403025230.25035-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_195614_495026_C21044CD 
X-CRM114-Status: UNSURE (   8.56  )
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

Add optional clock 'xhci_ck' and 'frmcnt_ck';
Add optional property "assigned-clock" and "assigned-clock-parents";

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtu3.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index d2655173e108..50c15f2ce14d 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -66,6 +66,8 @@ properties:
       - description: Reference clock used by low power mode etc
       - description: Mcu bus clock for register access
       - description: DMA bus clock for data transfer
+      - description: DRD controller clock
+      - description: Frame count clock
 
   clock-names:
     minItems: 1
@@ -74,6 +76,16 @@ properties:
       - const: ref_ck
       - const: mcu_ck
       - const: dma_ck
+      - const: xhci_ck
+      - const: frmcnt_ck
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 6
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 6
 
   phys:
     description:
-- 
2.18.0


