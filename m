Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FFDC369A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VpzhxiIWGVCS4kVdPRp582B1kElY78w2rnCabRZFkD0=; b=T1NDkd4E9IPoksp1tutZCKDFIB
	qIjX2hbyUKnPFt7/UMdzt7BIdGamu7u8o6bZDXPYRFuyoigT4MGTz/vdNCDj/K8/7P4IHub7HkRDv
	0Qd2lgN5v0sXIkJDGU1Mu03B50QzNS/LmKAG07drMMz2dUivAld7twpIFtHH3czWAERfkVRDYGaKp
	JEczqXX+WeX8x0v3nYwf7Cka1jd3bIgLxeNIxImmN+bPx4DDdYjLrOJTzYmK5a00LhFny+Ce4D/OP
	VYVPmNoV9WEcG4GnrtfspzXOl06UjveDaqrFI8tKQvtvo7cvByrF9qfLhmUFtdyvrj6LPWR5skELc
	+IKN9kUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMJh-00000004IRd-0z9c;
	Wed, 25 Sep 2024 07:20:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMHv-00000004HkP-3GWY;
	Wed, 25 Sep 2024 07:18:18 +0000
X-UUID: 530c8c3a7b0e11efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VpzhxiIWGVCS4kVdPRp582B1kElY78w2rnCabRZFkD0=;
	b=rzuZoIok7Qo2pKmUA3pbSbMPKK5TPSQt6gmR2YwnY1tqP8TwvzJsmUhzu0Jj2KCre+MKcbW1tyHB4Vfy0KTjqTY+NZoUnGtfQeGI0f1hfVPQqaz/wuU1NxqJ/xBgXgOZ+rDyOZD+z1oClfWCg7woynzN2w3bMIHkGI/X+WVkPzY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3cd61c4b-404e-44d5-9589-0c02e9037c1d,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:3dd03818-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 530c8c3a7b0e11efba0aef63c0775dbf-20240925
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2012001247; Wed, 25 Sep 2024 00:18:12 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 00:18:09 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 15:18:09 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Tommy Chen <tommyyl.chen@mediatek.com>
Subject: [PATCH v2] arm64: dts: mediatek: mt8195: Add power domain for dp_intf0
Date: Wed, 25 Sep 2024 15:18:07 +0800
Message-ID: <20240925071807.19603-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_001815_842841_430D463C 
X-CRM114-Status: GOOD (  11.53  )
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

During inspecting dtbs_check errors, we found the power domain
setting of DPI node "dp_intf0" is missing. Add power domain setting
to "MT8195_POWER_DOMAIN_VDOSYS0" for "dp_intf0"

Signed-off-by: Tommy Chen <tommyyl.chen@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

Changes for v1:
 - This patch is related to adding mt8195-dp-intf to DT schema fix for
  - http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml 
  - patch: https://lore.kernel.org/all/20240924103156.13119-6-macpaul.lin@mediatek.com/

Changes for v2:
 - Fix typo for Tommy's email address. Others remains no change.

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index ade685ed2190..6218bd7abb05 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3252,6 +3252,7 @@ dp_intf0: dp-intf@1c015000 {
 			compatible = "mediatek,mt8195-dp-intf";
 			reg = <0 0x1c015000 0 0x1000>;
 			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
 			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
 				 <&vdosys0  CLK_VDO0_DP_INTF0>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
-- 
2.45.2


