Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1692ECCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGORMmyAt9xsZXh0Ovwbl04Yo5sJ4S7NR8EIjHh5Gdk=; b=wumYH1ndGGJrCyVdbEZkcrnUgI
	fYT1iVvpRgkhh3gjtwWUZwrknSZeblnaNN9iji/vrwa1NhycUhs/0xWY/Op+xzgGnSkUHIq1/uCcw
	oL1vWr+ZlA4rVj5xzHoGpQLVn/o4A9413by1KZ5AokBMOAA+zkQhyK757smT75JdDk6NijLkrW5WT
	C5unCbYymCJ09VP+w1H7BNbHGMM+wk+uhUCzYLWk//WUUdzsLmoURO/Tr2jcEAqqOvR0vfeXoC6Y0
	NwWQSxZvSN8FKuKI090kvwH5N+0PIU9Xb13V9pI/PuYY60DuaFPkK2ZZaB97+/ekLVTVyv0n22HR6
	C9/3XZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stkrC-00000007tWX-0eJZ;
	Thu, 26 Sep 2024 09:32:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stkki-00000007s9Q-2CiR;
	Thu, 26 Sep 2024 09:25:38 +0000
X-UUID: 457f8c267be911efb3adad29d29602c1-20240926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gGORMmyAt9xsZXh0Ovwbl04Yo5sJ4S7NR8EIjHh5Gdk=;
	b=O5A6t4RSnX4EperVbWtBAt6SymW7DXERWTw7R7XMi3dxf41oZQZxFHzGqEuVx1WsgPOL9xf+9HpXSYgP4+IWTVhQMX63WBHTrVO3Bvpc3XGOQo8GcSri0/GMC5uH27Xd58hfbEsnGdsQDolu9pklf48XSc5Rx97juBNDM/8ABnI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:71580470-386f-4204-8ce9-8fde5a365538,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8e504a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 457f8c267be911efb3adad29d29602c1-20240926
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1231760021; Thu, 26 Sep 2024 02:25:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 26 Sep 2024 17:25:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 26 Sep 2024 17:25:25 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eason Yen
	<eason.yen@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Shane Chien
	<shane.chien@mediatek.com>, Hui Liu <hui.liu@mediatek.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-sound@vger.kernel.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt6359: fix dtbs_check error for audio-codec
Date: Thu, 26 Sep 2024 17:25:19 +0800
Message-ID: <20240926092519.6556-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240926092519.6556-1-macpaul.lin@mediatek.com>
References: <20240926092519.6556-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_022536_652545_DC4A2186 
X-CRM114-Status: GOOD (  11.65  )
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

This change fixes these dtbs_check errors for audio-codec:
1. pmic: 'mt6359codec' does not match any of the regexes: 'pinctrl-[0-9]+'
 - Replace device node name to generic 'audio-codec'
2. pmic: regulators: 'compatible' is a required property
 - Add 'mediatek,mt6359-codec' to compatible.

Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index dd732a820a7c..47bbd665a5a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -14,7 +14,8 @@ pmic_adc: adc {
 			#io-channel-cells = <1>;
 		};
 
-		mt6359codec: mt6359codec {
+		mt6359codec: audio-codec {
+			compatible = "mediatek,mt6359-codec";
 		};
 
 		regulators {
-- 
2.45.2


