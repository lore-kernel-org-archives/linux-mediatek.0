Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054E8C41535
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 02:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPP+fjrilrhAMP+i+QG0Lq7aDVFhTO7O157PxOkEVns=; b=YZTCtPTEmZrT2U8d6yAxMdo6nD
	IhA1N8HNus9+iNHs8cWzgZl4SvM64hqpIotiO27PfV7tzlR0YgHXiJ9XAk21HWigcMrxvnEiNeYCQ
	zFMLsWMgVHq9daAXoJ2vHYb0YK1CLyC3n2eHAtmleArEiQ3DDNhQtdREAjcaXHgNpLZYquLanSjfS
	ZajqheadxsjNqt719sD2iXjEyfFtu4Td2NXNR2uAKZmg+h/hgCyL4qhGrQ4GX3/N9VrsA/JhuMCGy
	2b3+RWzeQIIqXV7dyS2+yn0/9ODFNUQU3VC050kx06n52SX+GbUOQKWV0P0Y34+Oyrr2L4H+A0Wbt
	3LsrWz8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmnu-00G0ge-01;
	Wed, 20 Dec 2023 02:59:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFmnr-00G0fh-1q;
	Wed, 20 Dec 2023 02:59:25 +0000
X-UUID: c54700589ee311ee9b09ad09c76753c8-20231219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gPP+fjrilrhAMP+i+QG0Lq7aDVFhTO7O157PxOkEVns=;
	b=Ynb0LHKcGtrjwSmrumhJm1XdN2iVnH31F9gAlvsKZOsUDaOG9RQihvw5FuGaApuzCUri1cykrR2g5rZ50+DPVe+xrlO531X9GwJ8wCcCkvjSabZ0oCeWxVDMPsSbiHTFIYSoUymujn9hYV5Box9thW1dzldALFC5mdEftEJwdgM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:4d94ef7e-b59a-43a5-864b-55b05d56e85e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:8b8be306-92cc-407c-85a9-5303027ab698,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c54700589ee311ee9b09ad09c76753c8-20231219
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1731374376; Tue, 19 Dec 2023 19:59:19 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 10:58:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 10:58:45 +0800
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
Subject: [PATCH v3 3/3] arm64: dts: mediatek: mt8195: Add 'rx-fifo-depth' for cherry
Date: Wed, 20 Dec 2023 10:58:42 +0800
Message-ID: <20231220025842.7082-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220025842.7082-1-chunfeng.yun@mediatek.com>
References: <20231220025842.7082-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.858000-8.000000
X-TMASE-MatchedRID: SmKlVN5gTYOLwgJA7qJvFEf49ONH0RaSGSqdEmeD/nUQVRHC3B6FYFfe
	kLFvP8UVQt2470g7vecqScZQsLRFpMBMY+N44zjMwCZxkTHxcclQCOsAlaxN70C0ozeEMMB8gK6
	qCGa1Z9f+L7hkgxmjCYAy6p60ZV62fJ5/bZ6npdiujVRFkkVsm1M3J2vm0mJ+yiHX4eBbTmTLpk
	uFSwPGnqV24iXBtxcDn3OZvch5THViXwsLBqINMwd+1FkBk2L+Hkqld9LmJfhrhj/zqKQQB21Rj
	oup2VCcWve+eVz4Pp5Vk5utmQ1VlGVF3+d9rnox6EMj9/eK3+Y=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.858000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0892C9BC451D3DB96D076D71859C99E1D706F4D7315969C0460307EB121A3B6F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_185923_610608_185C1783 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the quirk property "rx-fifo-depth" to work around Gen1 isoc-in
transfer issue which send out unexpected ACK even after device
already finished the burst transfer with a short patcket, specially
for a 4K camera device.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: change value according to binding
v2: use 'rx-fifo-depth' property
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index dd5b89b73190..58593348b810 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1185,6 +1185,7 @@
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	rx-fifo-depth = <3>;
 };
 
 &xhci1 {
@@ -1192,6 +1193,7 @@
 
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	vbus-supply = <&usb_vbus>;
+	rx-fifo-depth = <3>;
 };
 
 &xhci2 {
-- 
2.18.0


