Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7923C76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXDZyqSe2ygGKCK9vMp4xkEXiEytY57YZV2sVuSYXpc=; b=Ma3IFEQqa6T9SgP35AEaqA1qqj
	igRxOJJ9tCKv7MnJ7RumE55skNDUOB/MjCBV43jw2lq4vYi5tcqtHOPBbs0s0uEgTteMoHQTc3pSL
	TDOxob+q6ag2b2B3QWLDzgVqL+5lQ3QJFozuLYJv2KzNBUXso1SrgyYgaPlloxEQ5O+OGBht66Xyl
	PXaUgZq8zrcxT7FG+ZCFTW5brswiz37CuwzJZZPKlq41a9efyQU8Y86FDz3WotzN+DSQexDUexf27
	jjscrIjxePME6XLWTGfySX52DcbKoPO9P9mAIAyLW9kgzDro94vV/iFIDGOjkDXKVfkrQbuKhbGxV
	XxKNjKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhUG-009Urt-1R;
	Fri, 07 Apr 2023 08:30:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhUD-009UqU-2B;
	Fri, 07 Apr 2023 08:30:22 +0000
X-UUID: 6c029776d51e11ed8687db9d93187ff1-20230407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MXDZyqSe2ygGKCK9vMp4xkEXiEytY57YZV2sVuSYXpc=;
	b=SY1NZcTgW2NyRWJrFZ23AKRAogJAg8HGWAkHSrq8FifHeaKFJh9/2mDvP4xJ8CQtQrhPcv+a9j+/CJZJO5lsCOd8oipkDmpsu+789tnXm+7OfufZVM2U/yaFG9853TmTNWsgaApBtIVlVCr9m8PB5C0nrr1TMPKYce3NVXKYXrk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:c1ed386a-15e8-4d6d-b0ac-fccf942b9c69,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:120426c,CLOUDID:d83aa02a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 6c029776d51e11ed8687db9d93187ff1-20230407
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1287367143; Fri, 07 Apr 2023 01:30:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 16:29:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 16:29:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
	<tianping.fang@mediatek.com>
Subject: [PATCH v2 6/7] dt-bindings: usb: mtu3: add two optional clocks
Date: Fri, 7 Apr 2023 16:29:36 +0800
Message-ID: <20230407082937.14558-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
References: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_013021_771074_1E04A442 
X-CRM114-Status: UNSURE (   9.01  )
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
v2: remove assigned-clocks* properties suggested by Rob
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index d2655173e108..3d403d944453 100644
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
@@ -74,6 +76,8 @@ properties:
       - const: ref_ck
       - const: mcu_ck
       - const: dma_ck
+      - const: xhci_ck
+      - const: frmcnt_ck
 
   phys:
     description:
-- 
2.18.0


