Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E83C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 06:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wT6L12FQNaWx6Rm0cYBfdK4wwQwZV9ZOJPOa++K3K/g=; b=oJiCnWWe5dwmD+/kLGHXkyaEVa
	3Q/lHh7gs41eRHpbTNvUXNLL4YcrB45Cu3RBC4NmqlyfkNM95pAuP67/59cSXZbbERgVE8vBjXf+h
	BkDiB9xNNomPv8+bH1Hc7GY0gqZD1pEd/LzAmy2maJP9d1l4nc4EVUXrZ2ZcRh3NxM0rzSt/HZeFH
	lpZvDMK/2PrhejnXb6HUdqQbo5e/9EEto10Zwfjq2Z2U7HXylNbQd6sZEFEmqT5+tHnPBhBrWY3PJ
	jBphBJalWY/GP12IRjZc0aYQ2xPJR1vZkhRCp5UahyfHyOLng0hrKIQbo6xFeOsxZDxWVBUpxMJNS
	1eryxpOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIrC-00Do3f-0X;
	Wed, 13 Dec 2023 06:36:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIr7-00Do1d-1Z;
	Wed, 13 Dec 2023 06:36:31 +0000
X-UUID: eea2ef5a998111ee958cff29c719f35b-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wT6L12FQNaWx6Rm0cYBfdK4wwQwZV9ZOJPOa++K3K/g=;
	b=LC4YDiav+nghYdp1mi1zHiGBfiZNPHmfD6QTGeBA4SAH6H4nl5m9tdg47hH2v1tVDkvVuIUOhuiJHCYqfc3NQnG0T1FCi1YSi+dfOmXS8Ch9bLGkkUYriNqYCuzjnzVZsqxEZA1DHrV6IS1T5vBWSOnHWg6e+p3ctL12e8wIByA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:5109ae7c-9454-41a4-b154-c072da7f9d7d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:3f701ebd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: eea2ef5a998111ee958cff29c719f35b-20231212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 941180962; Tue, 12 Dec 2023 23:36:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 13 Dec 2023 14:35:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 13 Dec 2023 14:35:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mathias Nyman
	<mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Macpaul Lin
	<macpaul.lin@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8195: Add mediatek,rxfifo-depth to cherry
Date: Wed, 13 Dec 2023 14:35:43 +0800
Message-ID: <20231213063543.12435-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
References: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.493100-8.000000
X-TMASE-MatchedRID: 6pbNFWS8cDvREKzvS64+oUAoPtuOD8baBdebOqawiLsUta+LQgEZMA4D
	QawrW+a/bhd2wSXB2al2ke9pVPnlKW94Ipa1otxo98sqn8kK3uF9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrdEifc9nolYfTA0OZlrhcEd8tH5vvpYSxTzEkZW7fanljQJquhmJPATW0/
	74iSYj85QfOBeKyB45Yu4o39ob+Xo7BmSr5gys2eLDq7G+Ik/yv22xKJRyIGVDnOxozmpp1r+Wv
	XJiKHRLMw/B2eF7ydmUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.493100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7076D785627DCAEAF457C7A3EF026C5B2281C7455469107C4ADE47F566AFBC692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_223629_527468_6B0AE7A0 
X-CRM114-Status: UNSURE (   9.75  )
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

Add the quirk property "mediatek,rxfifo-depth" to work around Gen1 isoc-in
transfer issue which send out unexpected ACK even after device already
finished the burst transfer with a short patcket, specially for a 4K
camera device.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index dd5b89b73190..2f2133931846 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1185,6 +1185,7 @@ &xhci0 {
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,rxfifo-depth;
 };
 
 &xhci1 {
@@ -1192,6 +1193,7 @@ &xhci1 {
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	mediatek,rxfifo-depth;
 };
 
 &xhci2 {
-- 
2.25.1


