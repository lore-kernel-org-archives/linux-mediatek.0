Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8BBC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oT2Gi8AhWQJmxVKaN1FZw8aYBEbWJlp99zVdogahOl4=; b=ZuEcP01IBTiwE6sk9qY2fXTE5d
	jFqEg04BHNnKMhWGb1pkPsBZmphW9iOz5WMY+kkZPOWVEcjfJKN3lt9ytyCiwmM/Q566lCcMvbHBi
	9ut29YjAax5jsb5nI4DL8PWkVSv7hOmV9oNtoyY9gPmBcU6CpMEPR1L4Fze/Txe+cs9dWpbn+KAOl
	uWATZ8teErbPLCayUpsMUSpbvOyFt+sZvJ6P5h5CIK/UpKUkoSzYg5puEoY6ay3EvQOG34Eh0Rs88
	usof6oAebBpM5BA0/LrbSbdKqa0qqmRTHkVXt+rFgz1bTggAFCT00wdL2vdv5GJ9UkV/HQH3sNuYY
	Ob3IG3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofewA-009Jv3-Lw; Tue, 04 Oct 2022 10:14:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofew8-009Jtw-GJ; Tue, 04 Oct 2022 10:14:05 +0000
X-UUID: a971455217d54fd18ede926922edd938-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oT2Gi8AhWQJmxVKaN1FZw8aYBEbWJlp99zVdogahOl4=;
	b=jmMVg24q+oWO6xqF79JF5DBPrq6VLSSrFpsG87fB+ajvDG5sS6Y784qq4OV8dyJuv/iXlnja9bRw1vddD4Ki0ElVJjjwzBDEHAPL70tgOB3lkuGHN5Fw/222roukU2pTLYlg4DiX/ZzJAjY15ix1sLw04ohkIQyQJp/Mz0oL98M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:48ee237f-654f-407e-b7e7-5bdea9f545d9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:889777b8-daef-48a8-8c50-40026d6a74c2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a971455217d54fd18ede926922edd938-20221004
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1789510658; Tue, 04 Oct 2022 03:13:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:33:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 4 Oct 2022 17:33:21 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 2/6] dts: arm64: mt8195: add MMSYS and MUTEX configuration for VPPSYS
Date: Tue, 4 Oct 2022 17:33:15 +0800
Message-ID: <20221004093319.5069-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221004093319.5069-1-moudy.ho@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_031404_582403_522204CE 
X-CRM114-Status: GOOD (  11.10  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Compatible names of VPPSYS0 and VPPSYS1 should be renamed to
"mediatek,mt8195-mmsys" to match the description of the binding file.
Also, add two nodes for MT8195 VPPSYS0/1 MUTEX.

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 905d1a90b406..7f54fa7d0185 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1477,11 +1477,20 @@
 		};
 
 		vppsys0: clock-controller@14000000 {
-			compatible = "mediatek,mt8195-vppsys0";
+			compatible = "mediatek,mt8195-mmsys";
 			reg = <0 0x14000000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		vpp0-mutex@1400f000 {
+			compatible = "mediatek,mt8195-vpp-mutex";
+			reg = <0 0x1400f000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1400XXXX 0xf000 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_MUTEX>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS0>;
+		};
+
 		smi_sub_common_vpp0_vpp1_2x1: smi@14010000 {
 			compatible = "mediatek,mt8195-smi-sub-common";
 			reg = <0 0x14010000 0 0x1000>;
@@ -1582,11 +1591,20 @@
 		};
 
 		vppsys1: clock-controller@14f00000 {
-			compatible = "mediatek,mt8195-vppsys1";
+			compatible = "mediatek,mt8195-mmsys";
 			reg = <0 0x14f00000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		vpp1-mutex@14f01000 {
+			compatible = "mediatek,mt8195-vpp-mutex";
+			reg = <0 0x14f01000 0 0x1000>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_14f0XXXX 0x1000 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_DISP_MUTEX>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VPPSYS1>;
+		};
+
 		larb5: larb@14f02000 {
 			compatible = "mediatek,mt8195-smi-larb";
 			reg = <0 0x14f02000 0 0x1000>;
-- 
2.18.0


