Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F340C48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9E/UvhK5CSAsRCQgb1278nkWwKaiC3/rTLcvlSnjgNE=; b=zR9sWQR+bPn5LcPl+Z1IEZlUZQ
	SqVcALOW3rGmWidYIy4zJItc08F7AQzQrekonErk8KeViVCaTu7PKteJ8e8VSTbLY/Z0U94qL4tcq
	eQYjn/quOVHFLsyOW2bgiJWm+06kmWsn3b/0NfIx5fE+LAkYlvKh2t8NyQzoerKCmVSBlJ0KdbLjC
	nngNsHsTeQxElxZchCsXFSc0Tr8kKPWqU4rNBhtrQlAG/z8v/m5X0l2q9sugoXcoNwAo3BHofVU/q
	3Nb3lhz8dAX7FcxzX1ZaH/xRSPPXsc8PBS0pNDdwq3yP8ExhTPMunGip/VTep/6ojuQD4IfgMqjJ0
	7kQyTDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rav8g-00000001u8F-18QI;
	Fri, 16 Feb 2024 10:08:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rav8d-00000001u6i-0FaM;
	Fri, 16 Feb 2024 10:08:12 +0000
X-UUID: 46eff996ccb311ee9a263b4415211400-20240216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9E/UvhK5CSAsRCQgb1278nkWwKaiC3/rTLcvlSnjgNE=;
	b=CcMs6WvF5d7loJMAWZtv51nKSvSl8fulQFJU5PZXS2zfL5CMi5Bm0AaKXoMqPQCFFKzkakF0SVxqg5iMI+d3myUQoc6dCZp1Ua3IjDfWKXPko/S+gJTUaJSmJkcw+D7Z8UQw8DGGeXpQ9qLAd1OSpkNmx791/6Xrl6bwTnncku0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c6f4b733-aaa5-4db3-a696-2d7684150e0f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:22a87580-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 46eff996ccb311ee9a263b4415211400-20240216
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 298310303; Fri, 16 Feb 2024 03:08:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Feb 2024 17:58:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Feb 2024 17:58:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: add u3port1 for xhci1
Date: Fri, 16 Feb 2024 17:57:51 +0800
Message-ID: <20240216095751.4937-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_020811_117196_4E41666C 
X-CRM114-Status: GOOD (  11.87  )
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

This patch fixes an issue where xhci1 was not functioning properly because
the state and PHY settings were incorrect.

The introduction of the 'force-mode' property in the phy-mtk-tphy driver
allows for the correct initialization of xhci1 by updating the Device Tree
settings accordingly.

The necessary fixup which added support for the 'force-mode' switch in the
phy-mtk-tphy driver.
commit 9b27303003f5 ("phy: mediatek: tphy: add support force phy mode switch")
Link: https://lore.kernel.org/r/20231211025624.28991-2-chunfeng.yun@mediatek.com

Prior to this fix, the system would exhibit the following probe failure messages
for xhci1:
  xhci-mtk 11290000.usb: supply vbus not found, using dummy regulator
  xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
  xhci-mtk 11290000.usb: xHCI Host Controller
  xhci-mtk 11290000.usb: new USB bus registered, assigned bus number 5
  xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
  xhci-mtk 11290000.usb: can't setup: -110
  xhci-mtk 11290000.usb: USB bus 5 deregistered
  xhci-mtk: probe of 11290000.usb failed with error -110

With the application of this dts fixup, the aforementioned initialization errors
are resolved and xhci1 is working.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 7fc515a07c65..e0b9f2615c11 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -854,6 +854,10 @@
 
 &u3phy1 {
 	status = "okay";
+
+	u3port1: usb-phy@700 {
+		mediatek,force-mode;
+	};
 };
 
 &u3phy2 {
@@ -885,6 +889,8 @@
 };
 
 &xhci1 {
+	phys = <&u2port1 PHY_TYPE_USB2>,
+	       <&u3port1 PHY_TYPE_USB3>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
 };
-- 
2.18.0


