Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25424C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 02:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNucw+MrsEW+b89K2o8bKFy1rNJQSH89cpdRR3TKKNM=; b=PT9CfQOJRZmP6tySpArypLxATt
	K5Yh8J8dCS2tZc4/r/IbdWTuoVSvF/IBco/9cPGb55M3JjPmt6PSVw+v0TaLf2vNzVk5Np/QE1B27
	FjWSaE+CpAzWDuV3BwqWPUM8aPU/xampSra7wuLNPRTe10Qzx9kCnop3xNynYH2NFXTEOpmxXpr9w
	5iVNc5NJaToIs5SpGXRu7grCK2G/s6TKO7qBqQwTQGC1NNpynxbyndBLBGBuWRpUvBA8N4q7OYhtL
	cxXs25PylY5b/ndUfuGC2q6WveBQcDaWxoB/Ea53wDdRdeyPa/0LVg5PTRzuQ930t/Lqa26PVUQP9
	3d299O3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWx8-003MDr-1h;
	Fri, 24 Mar 2023 02:14:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfWwg-003M3Z-1I;
	Fri, 24 Mar 2023 02:14:24 +0000
X-UUID: 7c782afcc9e911edb7d8d11f642b8e78-20230323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QNucw+MrsEW+b89K2o8bKFy1rNJQSH89cpdRR3TKKNM=;
	b=eU0Ni3rf7jF3ml+xSK0L0E3nwxidUvTgRhL4gdM6CAQcEguNPx/89RntPXZCxoRsohMVp97EeSdQ9cgb6An3p2Z51eJugIezucBu+UIkhfkX+5ypEvaqctbpG2uX4p5o5+cX4ZewIltXjIFcefj3uMoTeuWsqmM46lj8kL5FoyQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:8cdbcd00-e12c-4d00-b521-fac0cdd23424,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:8cdbcd00-e12c-4d00-b521-fac0cdd23424,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:83e5c1f6-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:2303241013058Y1WI0SV,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 7c782afcc9e911edb7d8d11f642b8e78-20230323
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1835078563; Thu, 23 Mar 2023 19:13:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 24 Mar 2023 10:13:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 24 Mar 2023 10:13:03 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 6/6] arm64: dts: mediatek: mt8186: Add display nodes
Date: Fri, 24 Mar 2023 10:12:58 +0800
Message-ID: <20230324021258.15863-7-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
References: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_191422_460280_70380BBB 
X-CRM114-Status: GOOD (  10.58  )
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

Add display nodes and the GCE (Global Command Engine) properties
to the display nodes in order to enable the usage of the CMDQ
(Command Queue), which is required for operating the display.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 116 +++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 0d1ff5bb9526..75667a26ec4e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -20,6 +20,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		ovl0 = &ovl0;
+		ovl_2l0 = &ovl_2l0;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -1189,6 +1196,20 @@
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+		};
+
+		mutex: mutex@14001000 {
+			compatible = "mediatek,mt8186-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
+			interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
+					      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
 		smi_common: smi@14002000 {
@@ -1222,6 +1243,45 @@
 			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 		};
 
+		ovl0: ovl@14005000 {
+			compatible = "mediatek,mt8186-disp-ovl", "mediatek,mt8192-disp-ovl";
+			reg = <0 0x14005000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L0_OVL_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		ovl_2l0: ovl@14006000 {
+			compatible = "mediatek,mt8186-disp-ovl-2l", "mediatek,mt8192-disp-ovl-2l";
+			reg = <0 0x14006000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_OVL_2L_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		rdma0: rdma@14007000 {
+			compatible = "mediatek,mt8186-disp-rdma", "mediatek,mt8183-disp-rdma";
+			reg = <0 0x14007000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			interrupts = <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_DISP_RDMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		color: color@14009000 {
+			compatible = "mediatek,mt8186-disp-color", "mediatek,mt8173-disp-color";
+			reg = <0 0x14009000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		dpi: dpi@1400a000 {
 			compatible = "mediatek,mt8186-dpi";
 			reg = <0 0x1400a000 0 0x1000>;
@@ -1239,6 +1299,52 @@
 			};
 		};
 
+		ccorr: ccorr@1400b000 {
+			compatible = "mediatek,mt8186-disp-ccorr", "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1400b000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		aal: aal@1400c000 {
+			compatible = "mediatek,mt8186-disp-aal", "mediatek,mt8183-disp-aal";
+			reg = <0 0x1400c000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		gamma: gamma@1400d000 {
+			compatible = "mediatek,mt8186-disp-gamma", "mediatek,mt8183-disp-gamma";
+			reg = <0 0x1400d000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			interrupts = <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		postmask: postmask@1400e000 {
+			compatible = "mediatek,mt8186-disp-postmask",
+				     "mediatek,mt8192-disp-postmask";
+			reg = <0 0x1400e000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		dither: dither@1400f000 {
+			compatible = "mediatek,mt8186-disp-dither", "mediatek,mt8183-disp-dither";
+			reg = <0 0x1400f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		dsi0: dsi@14013000 {
 			compatible = "mediatek,mt8186-dsi";
 			reg = <0 0x14013000 0 0x1000>;
@@ -1272,6 +1378,16 @@
 			#iommu-cells = <1>;
 		};
 
+		rdma1: rdma@1401f000 {
+			compatible = "mediatek,mt8186-disp-rdma", "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1401f000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L1_DISP_RDMA1>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xf000 0x1000>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		wpesys: clock-controller@14020000 {
 			compatible = "mediatek,mt8186-wpesys";
 			reg = <0 0x14020000 0 0x1000>;
-- 
2.18.0


