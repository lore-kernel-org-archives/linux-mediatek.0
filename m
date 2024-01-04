Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CA3C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 06:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uv6Gd2q3aQyxlXr8dcRbSBp3HzgyRoMe+zBqyZakg90=; b=dcqT97W8Mr9aNsZF/N5g/G8zZ6
	1Vs6kuZ2V9sRfppSE/p7QslJ5flQD0omvLRrQXQ33r2Yt/xH2r5fQYehndOmciYF/fgkRsT4WTP6c
	sv8gRfxBeW5wegq97/+is0JtoNFPNsUj22Z7xFiZa3msQ+y/y+4nj35k+DO6glCy9AtFBxWHeA1u5
	wJUxlsqaGW+rFNo/B+24fd0/ITUibL1NcVz61sESPz9YitTfNpfZk8seBk2EMvPGNV31urgRBbmjS
	tGbmHurA7lijuZcCuYkUy1cX5M4ydEjP8AJ8yGWiGONiTj+ApHMl3H09pgiAvDnjT+HB2dLGjZAPF
	PCAFg4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLH2l-00CyAV-38;
	Thu, 04 Jan 2024 06:17:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLH2j-00Cy8f-1E;
	Thu, 04 Jan 2024 06:17:26 +0000
X-UUID: e9933a58aac811eeafd70d0b34820190-20240103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Uv6Gd2q3aQyxlXr8dcRbSBp3HzgyRoMe+zBqyZakg90=;
	b=MDI5NjCfP4Errl23R1XAW2WDx/6qx4SUUXEwNabSnL1bBR4eZ/0TB32ofe8xXwu4xp0v07k2VAoXI9DZMGYNlBXUW04N+rcZ3hIq954UPc7T6TR6wdKV62M/VvGZ/+0vt4q3GVxESsnVmkzjUyOdXYKl7BI/sMj0FA3NCIq5d9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:ce9eea61-ba49-4a0e-9464-a5c25c958335,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-35
X-CID-META: VersionHash:5d391d7,CLOUDID:0294e08d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: e9933a58aac811eeafd70d0b34820190-20240103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 822199827; Wed, 03 Jan 2024 23:17:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 4 Jan 2024 14:16:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 4 Jan 2024 14:16:41 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mathias
 Nyman <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: usb: mtk-xhci: add a property for Gen1 isoc-in transfer issue
Date: Thu, 4 Jan 2024 14:16:38 +0800
Message-ID: <20240104061640.7335-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_221725_464625_95DEC133 
X-CRM114-Status: GOOD (  12.46  )
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

For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
still send out unexpected ACK after receiving a short packet in burst
transfer, this will cause an exception on connected device, specially for
a 4k camera.
Add a quirk property "rx-fifo-depth" to work around this hardware issue,
prefer to use 3k bytes;
The side-effect is that it may cause performance drop about 10%, including
bulk transfer.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v5: fix typos, add acked-by and reviewed-by
v4: change rx-fifo size in bytes
v3: add fifo depth unit, change the value range from 0-3 to 1-4
v2: change 'mediatek,rxfifo-depth' to 'rx-fifo-depth'
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index e9644e333d78..924fd3d748a8 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -124,6 +124,17 @@ properties:
       defined in the xHCI spec on MTK's controller.
     default: 5000
 
+  rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      It is a quirk used to work around Gen1 isoc-in endpoint transfer issue
+      that still send out unexpected ACK after device finishes the burst
+      transfer with a short packet and cause an exception, specially on a 4K
+      camera device, it happens on controller before about IPM v1.6.0;
+      the side-effect is that it may cause performance drop about 10%,
+      including bulk transfer, prefer to use 3k here. The size is in bytes.
+    enum: [1024, 2048, 3072, 4096]
+
   # the following properties are only used for case 1
   wakeup-source:
     description: enable USB remote wakeup, see power/wakeup-source.txt
-- 
2.18.0


