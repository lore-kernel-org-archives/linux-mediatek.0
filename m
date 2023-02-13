Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A3DC636D7
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 03:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6eQQOvqn+zPWnCwihlkrd8bxgyCpuOOMe/nTlCqPLo=; b=kBW876oYAlcAsEjlitvBn9wROi
	JJ65NNuJ4i6wI8Vm/kWuKfOQWp5zYyl+jHkErABUFyi7xA6Ta4TILYxrdP2K/JVbbttO+UE0scvxl
	Lx38Y0y7AIfZ5xh/b7lTOngWUOQzmdnQNoQK3fvKAdLyArB21GwQ8pyiWDzNQwhDNNTx0glzElMsY
	jdRg9b64Zco/sVKFmlD/NR6bIuHfa/aGEoooEuh1IeMbprpb/jDgeGUrHQmRzQF9RpKLpYMYPhfkI
	4kq0ttvtdWJHZye5CFOA/AhhW5gcCG36jbAc8cXRLQcgwi8OvAqdxO0uS5ylrBdmZ8daHC7MnEDOT
	JWGWCW0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRPhs-00Cz6b-Sx; Mon, 13 Feb 2023 03:40:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRPfz-00Cy0g-OI; Mon, 13 Feb 2023 03:38:51 +0000
X-UUID: e7c3ff9cab4f11edbbe3f76fe852e059-20230212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=e6eQQOvqn+zPWnCwihlkrd8bxgyCpuOOMe/nTlCqPLo=;
	b=XpqDAnWrAhpipnsfhow9eDnZQOiLfzHaWDJS3yIMFiwiTfxEr6IyXLvdGI5BV841V8KugBfTNc73OkAfhUycama4f//Rb+CyvlQw2Sba0fgcvb76WS/zeQVFxMROY7Yc8kF9pRH6ULyLNaGUC9UYsVqghGKeCv7WB+TdFc0OB7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:86e38db5-1982-4791-9e45-d9618c502197,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:a473ad8e-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: e7c3ff9cab4f11edbbe3f76fe852e059-20230212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1378196844; Sun, 12 Feb 2023 20:38:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 13 Feb 2023 11:38:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 13 Feb 2023 11:38:04 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 12/12] arm64: dts: mediatek: mt8195: Add SCP 2nd core
Date: Mon, 13 Feb 2023 11:37:58 +0800
Message-ID: <20230213033758.16681-13-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230213033758.16681-1-tinghan.shen@mediatek.com>
References: <20230213033758.16681-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_193847_885436_EEFACD81 
X-CRM114-Status: GOOD (  10.55  )
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

Rewrite the MT8195 SCP device node as a cluster and
add the SCP 2nd core in it.

Since the SCP device node is changed to multi-core structure,
enable SCP cluster to enable probing SCP core 0.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  6 +++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 32 ++++++++++++++-----
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 56749cfe7c33..31415d71b6a4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -933,7 +933,11 @@
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
-&scp {
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
 	status = "okay";
 
 	firmware-name = "mediatek/mt8195/scp.img";
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8f1264d5290b..31209ef7e55d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -826,14 +826,30 @@
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
 		};
 
-		scp: scp@10500000 {
-			compatible = "mediatek,mt8195-scp";
-			reg = <0 0x10500000 0 0x100000>,
-			      <0 0x10720000 0 0xe0000>,
-			      <0 0x10700000 0 0x8000>;
-			reg-names = "sram", "cfg", "l1tcm";
-			interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+		scp_cluster: scp@10500000 {
+			compatible = "mediatek,mt8195-scp-dual";
+			reg = <0 0x10720000 0 0xe0000>, <0 0x10700000 0 0x8000>;
+			reg-names = "cfg", "l1tcm";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x10500000 0x100000>;
 			status = "disabled";
+
+			scp_c0: scp@0 {
+				compatible = "mediatek,scp-core";
+				reg = <0x0 0xa0000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
+
+			scp_c1: scp@a0000 {
+				compatible = "mediatek,scp-core";
+				reg = <0xa0000 0x20000>;
+				reg-names = "sram";
+				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+			};
 		};
 
 		scp_adsp: clock-controller@10720000 {
@@ -2291,7 +2307,7 @@
 				 <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
 				 <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
 			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
-			mediatek,scp = <&scp>;
+			mediatek,scp = <&scp_c0>;
 			clocks = <&vencsys CLK_VENC_VENC>;
 			clock-names = "venc_sel";
 			assigned-clocks = <&topckgen CLK_TOP_VENC>;
-- 
2.18.0


