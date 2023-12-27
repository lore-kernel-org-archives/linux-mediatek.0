Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30FCC46CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NGljdjksTJl7cSSu9XYy7FO8kYtRZge6sNRdb6feXL4=; b=Z4jlUAnJH+/Bl3RGfQIxs4DAhA
	0CfRroyv2I6jn1cAU+AdzAnzg5YtlALstOfVW244TfCf3dRBYjK+ngxyDfR60ReNhiYdT8kgQatRk
	K4mj7WpXw6GMjP8Ae+KHIUy+4rqLhlx1GatLnyQy0GylhqAezOgwO6mL7co+4twL3vJj50yTzRSC5
	9e0wTMqa2RBHUDnAAqXOQ5RpzSbvbAuuCQWqbpBr/w+r3lvhpW1Y8+XBpIDRjBlSvmpAeEWbw+pPw
	OtfvdUceUt/QvoIDTmnHjS1L8czj4tfme5rPWprHIK7FbXUua1LJzJ/ZqWdNhQIQHnkXuZ9hfho29
	zB0vry7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIN1Q-00E1gd-2y;
	Wed, 27 Dec 2023 06:04:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIN1L-00E1fN-2a;
	Wed, 27 Dec 2023 06:04:01 +0000
X-UUID: b794f8c6a47d11eeafd70d0b34820190-20231226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NGljdjksTJl7cSSu9XYy7FO8kYtRZge6sNRdb6feXL4=;
	b=NcxIVVNS0IdJpB5IsuQktbnvfJasN0mYmtFKHPu1rBiCeDvV3SiZytfUSH5h1xgy9sEI/DdeJPzUSwFLoqeYDjmGLqSiV383PR+fR6aXS6HSJEANYRpZIGDXQsCdGu7Z1ZH+3EU7/i3F4f3o/kLEht5lz+X2d0SIUsg1WelQyIg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:67d4e2c8-cf35-400b-9f87-dc50b68da0e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5d391d7,CLOUDID:914a9d8d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:N
	O,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b794f8c6a47d11eeafd70d0b34820190-20231226
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1930532562; Tue, 26 Dec 2023 23:03:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Dec 2023 14:03:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Dec 2023 14:03:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Mathias
 Nyman" <mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH v4 1/3] dt-bindings: usb: mtk-xhci: add a property for Gen1 isoc-in transfer issue
Date: Wed, 27 Dec 2023 14:03:14 +0800
Message-ID: <20231227060316.8539-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.698500-8.000000
X-TMASE-MatchedRID: G4NbPPbBCbo28LK855iUisp9Bgr5ONKhXxT5cg8K/td+YesuCgkiXKLs
	GdYIe0oEWB8Rur00SOpx/Hv6BudnAqB/4ZSHyd2lsyNb+yeIRApRnscLnNAC7BjQD3m2MCf7FWo
	Asts4LpWPqQJ9fQR1ziV2YP+J+E56aACC67qZQKpsG7r4Qh7N3DNzwULQwTBPVzOmd/bB9b6uoc
	zUog5jKJR0/TJZAy/xoJY+2TrDFLUdpD3DKTh+QJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYkmKjeD7ZgQXRJ1fYQaQSqLhehi1q7el9sGHUWvrwT/1d+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.698500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9363BDB1CBB7952FF72435AEDE0989D1A860F3E2E01C0BACAFCA187C3CADDD0C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_220359_842929_073CF2D7 
X-CRM114-Status: GOOD (  11.33  )
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
The side-effect is that may cause performance drop about 10%, including
bulk transfer.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: change rx-fifo size in bytes
v3: add fifo depth unit, change the value range from 0-3 to 1-4
v2: change 'mediatek,rxfifo-depth' to 'rx-fifo-depth'
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index e9644e333d78..9f621f2209df 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -124,6 +124,17 @@ properties:
       defined in the xHCI spec on MTK's controller.
     default: 5000
 
+  rx-fifo-depth:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      It is a quirk used to work around Gen1 isoc-in endpoint transfer issue
+      that still send out unexpected ACK after device finish the burst transfer
+      with a short packet and cause an exception, specially on a 4K camera
+      device, it happens on controller before about IPM v1.6.0; the side-effect
+      is that may cause performance drop about 10%, include bulk transfer,
+      prefer to use 3k here. The size is in bytes.
+    enum: [1024, 2048, 3072, 4096]
+
   # the following properties are only used for case 1
   wakeup-source:
     description: enable USB remote wakeup, see power/wakeup-source.txt
-- 
2.18.0


