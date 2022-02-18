Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C06C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sJOCKfjKtdBKXOumPeX3Sa5qn07Q8yooNrhEgppqek=; b=gfz0cLHTMmwlFC
	4Vdzvnc/0ePJVOebsCuQDNx2vMK2g0Y1lZUlgJ9PlfLJ/w+0yyQW2l/2WThmseJ5efn6eo9WzrDZC
	wSuMWRvKlKKSy7VxX73lBoQPWS2M1B34Yrun6bSBEvpryqsF5U+CXDAbcUJbuUVOqTSf+wtqa6mQD
	Ny/0dlFtdpsCIdWqg0A7FTIP2gE+4I3ETcTgfrOcTTpPZQeG+tFkfnKUPOno8Qlr95gJVFzHpcyo6
	ZxWW+gviihNexxZvVNYeUwtyVrlTNT9OuN/bXwmyp7ojYYXjKKdwWIs1qX7q+1JbeQGclkVHT8g1I
	j3TyOvTLsFA3zyq19gpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzgI-00Db5Q-Mg; Fri, 18 Feb 2022 09:36:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzXU-00DWbl-EA; Fri, 18 Feb 2022 09:26:58 +0000
X-UUID: 5d35769910a041308d3468b111dda6b1-20220218
X-UUID: 5d35769910a041308d3468b111dda6b1-20220218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 801654063; Fri, 18 Feb 2022 02:26:47 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 01:16:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Feb 2022 17:16:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Feb 2022 17:16:50 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 15/23] arm64: dts: mt8192: Add m4u and smi nodes
Date: Fri, 18 Feb 2022 17:16:25 +0800
Message-ID: <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_012656_529755_859CF828 
X-CRM114-Status: GOOD (  10.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add m4u and smi nodes for mt8192 SoC

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 191 +++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index f5e5af949f19..40887120fdb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gce/mt8192-gce.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mt8192-larb-port.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/power/mt8192-power.h>
@@ -1210,24 +1211,114 @@
 			#clock-cells = <1>;
 		};
 
+		smi_common: smi@14002000 {
+			compatible = "mediatek,mt8192-smi-common";
+			reg = <0 0x14002000 0 0x1000>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_INFRA>,
+				 <&mmsys CLK_MM_SMI_GALS>,
+				 <&mmsys CLK_MM_SMI_GALS>;
+			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+		};
+
+		larb0: larb@14003000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x14003000 0 0x1000>;
+			mediatek,larb-id = <0>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+		};
+
+		larb1: larb@14004000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,larb-id = <1>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+		};
+
+		iommu0: m4u@1401d000 {
+			compatible = "mediatek,mt8192-m4u";
+			reg = <0 0x1401d000 0 0x1000>;
+			mediatek,larbs = <&larb0 &larb1 &larb2
+					  &larb4 &larb5 &larb7
+					  &larb9 &larb11 &larb13
+					  &larb14 &larb16 &larb17
+					  &larb18 &larb19 &larb20>;
+			interrupts = <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&mmsys CLK_MM_SMI_IOMMU>;
+			clock-names = "bclk";
+			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+			#iommu-cells = <1>;
+		};
+
 		imgsys: clock-controller@15020000 {
 			compatible = "mediatek,mt8192-imgsys";
 			reg = <0 0x15020000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb9: larb@1502e000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1502e000 0 0x1000>;
+			mediatek,larb-id = <9>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys CLK_IMG_LARB9>,
+				 <&imgsys CLK_IMG_LARB9>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_ISP>;
+		};
+
 		imgsys2: clock-controller@15820000 {
 			compatible = "mediatek,mt8192-imgsys2";
 			reg = <0 0x15820000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb11: larb@1582e000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1582e000 0 0x1000>;
+			mediatek,larb-id = <11>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys2 CLK_IMG2_LARB11>,
+				 <&imgsys2 CLK_IMG2_LARB11>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
+		};
+
+		larb5: larb@1600d000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1600d000 0 0x1000>;
+			mediatek,larb-id = <5>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+				 <&vdecsys_soc CLK_VDEC_SOC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+		};
+
 		vdecsys_soc: clock-controller@1600f000 {
 			compatible = "mediatek,mt8192-vdecsys_soc";
 			reg = <0 0x1600f000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb4: larb@1602e000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1602e000 0 0x1000>;
+			mediatek,larb-id = <4>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_SOC_LARB1>,
+				 <&vdecsys CLK_VDEC_SOC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+		};
+
 		vdecsys: clock-controller@1602f000 {
 			compatible = "mediatek,mt8192-vdecsys";
 			reg = <0 0x1602f000 0 0x1000>;
@@ -1240,12 +1331,79 @@
 			#clock-cells = <1>;
 		};
 
+		larb7: larb@17010000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x17010000 0 0x1000>;
+			mediatek,larb-id = <7>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vencsys CLK_VENC_SET0_LARB>,
+				 <&vencsys CLK_VENC_SET1_VENC>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8192-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb13: larb@1a001000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1a001000 0 0x1000>;
+			mediatek,larb-id = <13>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_CAM>,
+				 <&camsys CLK_CAM_LARB13>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_CAM>;
+		};
+
+		larb14: larb@1a002000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1a002000 0 0x1000>;
+			mediatek,larb-id = <14>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys CLK_CAM_CAM>,
+				 <&camsys CLK_CAM_LARB14>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_CAM>;
+		};
+
+		larb16: larb@1a00f000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1a00f000 0 0x1000>;
+			mediatek,larb-id = <16>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys_rawa CLK_CAM_RAWA_CAM>,
+				 <&camsys_rawa CLK_CAM_RAWA_LARBX>;
+			clock-names = "apb", "smi";
+			mediatek,smi-id = <16>;
+			power-domains = <&spm MT8192_POWER_DOMAIN_CAM_RAWA>;
+		};
+
+		larb17: larb@1a010000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1a010000 0 0x1000>;
+			mediatek,larb-id = <17>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys_rawb CLK_CAM_RAWB_CAM>,
+				 <&camsys_rawb CLK_CAM_RAWB_LARBX>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_CAM_RAWB>;
+		};
+
+		larb18: larb@1a011000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1a011000 0 0x1000>;
+			mediatek,larb-id = <18>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&camsys_rawc CLK_CAM_RAWC_LARBX>,
+				 <&camsys_rawc CLK_CAM_RAWC_CAM>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_CAM_RAWC>;
+		};
+
 		camsys_rawa: clock-controller@1a04f000 {
 			compatible = "mediatek,mt8192-camsys_rawa";
 			reg = <0 0x1a04f000 0 0x1000>;
@@ -1270,10 +1428,43 @@
 			#clock-cells = <1>;
 		};
 
+		larb20: larb@1b00f000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1b00f000 0 0x1000>;
+			mediatek,larb-id = <20>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&ipesys CLK_IPE_SMI_SUBCOM>,
+				 <&ipesys CLK_IPE_LARB20>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_IPE>;
+		};
+
+		larb19: larb@1b10f000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1b10f000 0 0x1000>;
+			mediatek,larb-id = <19>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&ipesys CLK_IPE_SMI_SUBCOM>,
+				 <&ipesys CLK_IPE_LARB19>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_IPE>;
+		};
+
 		mdpsys: clock-controller@1f000000 {
 			compatible = "mediatek,mt8192-mdpsys";
 			reg = <0 0x1f000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		larb2: larb@1f002000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x1f002000 0 0x1000>;
+			mediatek,larb-id = <2>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mdpsys CLK_MDP_SMI0>,
+				 <&mdpsys CLK_MDP_SMI0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_MDP>;
+		};
 	};
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
