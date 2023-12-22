Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA969C41535
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TG5YNHKAkRWVrkYlv/OzsBvwG1g8SCQSol5QW/b7HEA=; b=ResdBEwjE98PRlQbJL9jbB1ml4
	TxuEi2Th9F7zMKCdlJUAF8YCeSf3UlsZ8M90NWhxHMsG7uX9FwIgRhv0QwivY8AGjl6igBlVpGf+m
	qFpz3rT2evfpVS+7EZ+KrPJXts4talo3+HdpghVEiEzvedHbr+F9M8//Gg7n+20ZJjC6q1/imLbo0
	2LwUMIHk0pfxOjtAV9nhMRppKDl4KOLwkTr9gFLBoGiAoW8AVNYpIXJuO+OVGRuoXq/1tjPp/WGaB
	e1FKwnAygWXT+oiftEwpQLYSlOHwPVwKTYTtnCsa+0cZb+L/0hYEEuDIaju4dOzaCODqQ9waa2xxM
	vKJDRNxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGatR-005JSq-2R;
	Fri, 22 Dec 2023 08:28:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGatP-005JPH-1O;
	Fri, 22 Dec 2023 08:28:28 +0000
X-UUID: 0ecb8764a0a411ee9b09ad09c76753c8-20231222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=TG5YNHKAkRWVrkYlv/OzsBvwG1g8SCQSol5QW/b7HEA=;
	b=OD1ddcktcWy+gYINBwSHTuvS9d1NUZzdMY+QUMix5xFUuTz9PoHjvKqvzieLlbKjdgwPcfaj6iNVJC/o8v6xUApCUbLga9L4Vvgd+QgITkGi6IwgIE+WVHVj8CZNYRuIux6XB7asJf3h1//fQB1ERgnDLmfDjfMfB/I8gqZZsqg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:cd61e748-7b52-46df-99ec-f8a2357e5520,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:87250f82-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0ecb8764a0a411ee9b09ad09c76753c8-20231222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1607154678; Fri, 22 Dec 2023 01:28:17 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 16:07:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 16:07:42 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v4 1/3] arm64: dts: mediatek: Add socinfo efuses to MT8173/83/96/92/95 SoCs
Date: Fri, 22 Dec 2023 16:07:37 +0800
Message-ID: <20231222080739.21706-2-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231222080739.21706-1-william-tw.lin@mediatek.com>
References: <20231222080739.21706-1-william-tw.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_002827_484544_339F060D 
X-CRM114-Status: GOOD (  10.36  )
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

Add efuse nodes for socinfo retrieval for MT8173, MT8183, MT8186,
MT8192 and MT8195.

Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 +++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 +++
 5 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index c47d7d900f28..0f4aab80d5e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -590,6 +590,15 @@
 			reg = <0 0x10206000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			socinfo-data1@40 {
+				reg = <0x040 0x4>;
+			};
+
+			socinfo-data2@44 {
+				reg = <0x044 0x4>;
+			};
+
 			thermal_calibration: calib@528 {
 				reg = <0x528 0xc>;
 			};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 976dc968b3ca..1fe351b710ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1585,6 +1585,15 @@
 			reg = <0 0x11f10000 0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			socinfo-data1@4c {
+				reg = <0x04c 0x4>;
+			};
+
+			socinfo-data2@60 {
+				reg = <0x060 0x4>;
+			};
+
 			thermal_calibration: calib@180 {
 				reg = <0x180 0xc>;
 			};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index df0c04f2ba1d..7dd0ae965ee0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1672,6 +1672,10 @@
 				reg = <0x59c 0x4>;
 				bits = <0 3>;
 			};
+
+			socinfo-data1@7a0 {
+				reg = <0x7a0 0x4>;
+			};
 		};
 
 		mipi_tx0: dsi-phy@11cc0000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 69f4cded5dbb..85f2c49be6fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1120,6 +1120,14 @@
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			socinfo-data1@44 {
+				reg = <0x044 0x4>;
+			};
+
+			socinfo-data2@50 {
+				reg = <0x050 0x4>;
+			};
+
 			lvts_e_data1: data1@1c0 {
 				reg = <0x1c0 0x58>;
 			};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index e0ac2e9f5b72..520f7b649cb2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1686,6 +1686,9 @@
 			lvts_efuse_data2: lvts2-calib@1d0 {
 				reg = <0x1d0 0x38>;
 			};
+			socinfo-data1@7a0 {
+				reg = <0x7a0 0x4>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.18.0


