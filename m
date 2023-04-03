Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1206CC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 06:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+VbaGeWufVSeXUc7A9jDhCCNoQflqg5YvZaU8E25zmo=; b=iDmdV4NjkyvcLQmuyUWAwfzbIg
	La0F7xie5536+BhQWLbwYU5ZhvomsP7xf84Ixk7rg9ntqxW+GF7/iD9vs4uUsWA1VCUdSRmKmnQFT
	elj4PQpjJEr1Hs6Oyzcr4PtBSfHk6NWpqiN2OZpXO9bNWDhWQtFo5xjiMlSGUa8lHW7yOyp4KnRYS
	XmUyMzu56jBh9UPCN+gKhCLDNTu/ciLR50YtVApIW9WQaxEjVhjJT3guL2iLJJvxmMbwNGSFL2i/3
	AYIJ4RUdlmMHJqdtD3oeTHjndQMHfulD9vK7pKWZ8T8CPrUlaFUpk9BQ8yh0eQWleKUp41xbY/GxS
	N254nIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDLG-00EEvG-0A;
	Mon, 03 Apr 2023 06:06:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjDLB-00EEuf-1n;
	Mon, 03 Apr 2023 06:06:56 +0000
X-UUID: 22be63d8d1e511edb7d8d11f642b8e78-20230402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+VbaGeWufVSeXUc7A9jDhCCNoQflqg5YvZaU8E25zmo=;
	b=eOGfgghhuCKVUXD5YHUKnCQjiPDrTfVMXQUM9EPMUSGtrXY26UhgJQzD1yvIiMcQHmAF+GXyOSwp2M7vBXXsi3OtPuwZV+aw5px3yMv3NbV1HisbbLy1l5yM97GdixoSULWAHOQ3whjYbq/OWz3vyKcjhuCn+FfDDW3gsYhTABY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:8f0d5e30-bbad-4c64-a726-922377fd5d7d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:1b4b3f2a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 22be63d8d1e511edb7d8d11f642b8e78-20230402
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1349491614; Sun, 02 Apr 2023 23:02:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 14:02:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 3 Apr 2023 14:02:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mathias Nyman
	<mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
	<tianping.fang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add an optional frame count clock
Date: Mon, 3 Apr 2023 14:02:31 +0800
Message-ID: <20230403060232.25699-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_230653_603810_BAB7A888 
X-CRM114-Status: UNSURE (   8.96  )
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

Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index c119caa9ad16..ee8167fbc541 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -77,6 +77,7 @@ properties:
       - description: Mcu bus clock for register access
       - description: DMA bus clock for data transfer
       - description: controller clock
+      - description: frame count clock
 
   clock-names:
     minItems: 1
@@ -86,14 +87,15 @@ properties:
       - const: mcu_ck
       - const: dma_ck
       - const: xhci_ck
+      - const: frmcnt_ck
 
   assigned-clocks:
     minItems: 1
-    maxItems: 5
+    maxItems: 6
 
   assigned-clock-parents:
     minItems: 1
-    maxItems: 5
+    maxItems: 6
 
   phys:
     description:
-- 
2.18.0


