Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159E0C6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pzLBh8q0HEpNBy7rhGdQI4pEylD48j48i2DCezpwpQ=; b=UGTLcAw1orPR8NZOiDYVJBBwSw
	1L2/Nm3vhrxLmf/j/k0mtb8UrKqFXmooNVmw0eR/VS7NzFvL9RXDQd33LS5r7rfVbeuK+aJyG1+Zt
	I3r5Zxa2wctWaKoNcyLBNXPvzIp6gzRMCJDGWYu3LeNKNEOBgYi6W2uvU7i2geitQMsl1OIv9bnd1
	ik83GkYuH3pcSLh3mxpfFRXNSGVFNUKLwvKjUq/ksS8T00on6UCUHNkPy4UM7p9cS5Y9evx3/j4ws
	9JUranrX58osWAUviHbpjiGSCXoPUoEHVgkEvNxi8u7sLR0wUPKzDKMDBQMLx0PiArhdYN0tZZZRK
	3JITkSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objQV-004akZ-3S; Fri, 23 Sep 2022 14:13:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1objQS-004ahD-As; Fri, 23 Sep 2022 14:13:10 +0000
X-UUID: 6ad88c4c3c004bcd9c78118da20dc3b0-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8pzLBh8q0HEpNBy7rhGdQI4pEylD48j48i2DCezpwpQ=;
	b=MaisL9WQPJTJufQ05pPxbMctSb4yU5JX46ed5gvqI3jttMNHK4CgGYQluq2kUtMqj6nPE5/3gS4RJzgw0u+LjEP5Ib1H+CVBuzFjDuxODP0JeHxBLNeuyU1Latcuam5hU9JhHR4jgJEn8n6GjCohKyYAY87eEhEKrgzz+cKHacw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1ea86c1c-d376-46aa-b1c7-6f4ee880341b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2aa005e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6ad88c4c3c004bcd9c78118da20dc3b0-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1801679605; Fri, 23 Sep 2022 07:12:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 21:11:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Sep 2022 21:11:52 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	"Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 3/5] arm64: dts: mt8186: Add IOMMU and SMI nodes
Date: Fri, 23 Sep 2022 21:11:46 +0800
Message-ID: <20220923131148.6678-4-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
References: <20220923131148.6678-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_071308_398224_1C25F8E4 
X-CRM114-Status: GOOD (  10.26  )
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

Add iommu and smi nodes for mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 173 +++++++++++++++++++++++
 1 file changed, 173 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 833e7037fe22..68f06bef88f3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/mt8186-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mt8186-memory-port.h>
 #include <dt-bindings/pinctrl/mt8186-pinfunc.h>
 #include <dt-bindings/power/mt8186-power.h>
 #include <dt-bindings/phy/phy.h>
@@ -944,24 +945,113 @@
 			#reset-cells = <1>;
 		};
 
+		smi_common: smi@14002000 {
+			compatible = "mediatek,mt8186-smi-common";
+			reg = <0 0x14002000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>, <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_GALS>, <&mmsys CLK_MM_SMI_GALS>;
+			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		larb0: smi@14003000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,larb-id = <0>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_COMMON>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		larb1: smi@14004000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,larb-id = <1>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_COMMON>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
+		iommu_mm: iommu@14016000 {
+			compatible = "mediatek,mt8186-iommu-mm";
+			reg = <0 0x14016000 0 0x1000>;
+			mediatek,larbs = <&larb0 &larb1 &larb2 &larb4
+					  &larb7 &larb8 &larb9 &larb11
+					  &larb13 &larb14 &larb16 &larb17
+					  &larb19 &larb20>;
+			interrupts = <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&mmsys CLK_MM_SMI_IOMMU>;
+			clock-names = "bclk";
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+			#iommu-cells = <1>;
+		};
+
 		wpesys: clock-controller@14020000 {
 			compatible = "mediatek,mt8186-wpesys";
 			reg = <0 0x14020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb8: smi@14023000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x14023000 0 0x1000>;
+			mediatek,larb-id = <8>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&wpesys CLK_WPE_SMI_LARB8_CK_EN>,
+				 <&wpesys CLK_WPE_SMI_LARB8_CK_EN>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_WPE>;
+		};
+
 		imgsys1: clock-controller@15020000 {
 			compatible = "mediatek,mt8186-imgsys1";
 			reg = <0 0x15020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb9: smi@1502e000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1502e000 0 0x1000>;
+			mediatek,larb-id = <9>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys1 CLK_IMG1_GALS_IMG1>,
+				 <&imgsys1 CLK_IMG1_LARB9_IMG1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_IMG>;
+		};
+
 		imgsys2: clock-controller@15820000 {
 			compatible = "mediatek,mt8186-imgsys2";
 			reg = <0 0x15820000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb11: smi@1582e000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1582e000 0 0x1000>;
+			mediatek,larb-id = <11>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys1 CLK_IMG1_LARB9_IMG1>,
+				 <&imgsys2 CLK_IMG2_LARB9_IMG2>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_IMG2>;
+		};
+
+		larb4: smi@1602e000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1602e000 0 0x1000>;
+			mediatek,larb-id = <4>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_LARB1_CKEN>,
+				 <&vdecsys CLK_VDEC_LARB1_CKEN>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_VDEC>;
+		};
+
 		vdecsys: clock-controller@1602f000 {
 			compatible = "mediatek,mt8186-vdecsys";
 			reg = <0 0x1602f000 0 0x1000>;
@@ -974,12 +1064,65 @@
 			#clock-cells = <1>;
 		};
 
+		larb7: smi@17010000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,larb-id = <7>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC_CKE1_VENC>,
+				 <&vencsys CLK_VENC_CKE1_VENC>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8186-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb13: smi@1a001000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1a001000 0 0x1000>;
+			mediatek,larb-id = <13>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM2MM_GALS>, <&camsys CLK_CAM_LARB13>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_CAM>;
+		};
+
+		larb14: smi@1a002000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1a002000 0 0x1000>;
+			mediatek,larb-id = <14>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM2MM_GALS>, <&camsys CLK_CAM_LARB14>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_CAM>;
+		};
+
+		larb16: smi@1a00f000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1a00f000 0 0x1000>;
+			mediatek,larb-id = <16>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_LARB14>,
+				 <&camsys_rawa CLK_CAM_RAWA_LARBX_RAWA>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_CAM_RAWA>;
+		};
+
+		larb17: smi@1a010000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1a010000 0 0x1000>;
+			mediatek,larb-id = <17>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_LARB13>,
+				 <&camsys_rawb CLK_CAM_RAWB_LARBX_RAWB>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_CAM_RAWB>;
+		};
+
 		camsys_rawa: clock-controller@1a04f000 {
 			compatible = "mediatek,mt8186-camsys_rawa";
 			reg = <0 0x1a04f000 0 0x1000>;
@@ -998,10 +1141,40 @@
 			#clock-cells = <1>;
 		};
 
+		larb2: smi@1b002000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1b002000 0 0x1000>;
+			mediatek,larb-id = <2>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mdpsys CLK_MDP_SMI0>, <&mdpsys CLK_MDP_SMI0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
+		};
+
 		ipesys: clock-controller@1c000000 {
 			compatible = "mediatek,mt8186-ipesys";
 			reg = <0 0x1c000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		larb20: smi@1c00f000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1c00f000 0 0x1000>;
+			mediatek,larb-id = <20>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&ipesys CLK_IPE_LARB20>, <&ipesys CLK_IPE_LARB20>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
+		};
+
+		larb19: smi@1c10f000 {
+			compatible = "mediatek,mt8186-smi-larb";
+			reg = <0 0x1c10f000 0 0x1000>;
+			mediatek,larb-id = <19>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&ipesys CLK_IPE_LARB19>, <&ipesys CLK_IPE_LARB19>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8186_POWER_DOMAIN_IPE>;
+		};
 	};
 };
-- 
2.18.0


