Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C75C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 11:47:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F2652339D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 11:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F2652339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ULnThXokeroHKZmI8nD8UkGv7D2HI2TI0oG95V/KSAc=; b=B6eRJf/exkpeVph/MLrXVj99OG
	WTvQxkcJxiXnOVO2EhoowDg6VO2EXh3zyM2lgKlzBtZN1yNnnAijAYm3xEQIl2mXRQSB8ZjH+VMBd
	ZO6UNFcS6OnTwya+W5HzStIyE3XFd9qIEqAyElTwunxC7WnMXDFEoPM3mcsMboe5St0BlIRQnjNBg
	koJqFuFKtJsvoAd9HDJud5Amhe3XYCCIpsfBe1X7esJx6oNGxqnY27NbYWnGqw+ND9hhQ+vCtzNlI
	rX6jB2TLnJcDrxtPU8+H1Fg/7xhCLzFdrFvaW6NK5aIY6aoB07Q3Kl2yD/czjf8sR46iuhHzJjeJQ
	cdU9assQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpVGb-0006Yn-B6; Wed, 16 Dec 2020 11:46:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpVGX-0006Y4-IA; Wed, 16 Dec 2020 11:46:48 +0000
X-UUID: 4d06a5da23e14c44b347be0feecea3ce-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LZL++HmGem6FjixCGtV7sy++FzsOPGzogkMtCEFNHAU=; 
 b=sA44dnF1Kkwf1NJIn12ltaD3mg5ISRAMuOMG8ALLAShs4P2FGG911+68fKDM77v76HL+DKJocTNb9TTid9vkcRjwZiqZmbRaQj29d6NwFE+ghVlCZmVAMZf7hJpVpjDH10V1aIelti2/ih9W/dBmDx8oaXqEux5SiC8CUmhUKTU=;
X-UUID: 4d06a5da23e14c44b347be0feecea3ce-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 917146431; Wed, 16 Dec 2020 03:46:41 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 03:36:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 19:36:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 19:36:35 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mt8192: add m4u and smi nodes
Date: Wed, 16 Dec 2020 19:36:30 +0800
Message-ID: <20201216113630.26050-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_064646_659013_46FB64EF 
X-CRM114-Status: GOOD (  12.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, weiyi.lu@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, yi.kuo@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt8192 IOMMU and smi larb/common nodes.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
This patch base on:
1. mt8192 dts base which is in the linux-next now.
https://lore.kernel.org/linux-mediatek/20201030092207.26488-2-seiya.wang@mediatek.com/

2. clock nodes and definitions:
https://lore.kernel.org/linux-mediatek/1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com/

3. PM definitions:
https://patchwork.kernel.org/project/linux-mediatek/patch/20201030113622.201188-15-enric.balletbo@collabora.com/

4. PM nodes:
https://lore.kernel.org/linux-mediatek/1605782884-19741-1-git-send-email-weiyi.lu@mediatek.com/

5. iommu ports defintions:
https://lore.kernel.org/linux-iommu/20201209080102.26626-1-yong.wu@mediatek.com/T/#t
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 193 +++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index a315568fcd9a..b84585de5ca8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8192-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/memory/mt8192-larb-port.h>
 #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
 #include <dt-bindings/power/mt8192-power.h>
 
@@ -807,24 +808,116 @@
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
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_INFRA>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
+		};
+
+		larb1: larb@14004000 {
+			compatible = "mediatek,mt8192-smi-larb";
+			reg = <0 0x14004000 0 0x1000>;
+			mediatek,larb-id = <1>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_INFRA>;
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
 		imgsys: syscon@15020000 {
 			compatible = "mediatek,mt8192-imgsys", "syscon";
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
 		imgsys2: syscon@15820000 {
 			compatible = "mediatek,mt8192-imgsys2", "syscon";
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
 		vdecsys_soc: syscon@1600f000 {
 			compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
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
 		vdecsys: syscon@1602f000 {
 			compatible = "mediatek,mt8192-vdecsys", "syscon";
 			reg = <0 0x1602f000 0 0x1000>;
@@ -837,12 +930,79 @@
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
 		camsys: syscon@1a000000 {
 			compatible = "mediatek,mt8192-camsys", "syscon";
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
 		camsys_rawa: syscon@1a04f000 {
 			compatible = "mediatek,mt8192-camsys_rawa", "syscon";
 			reg = <0 0x1a04f000 0 0x1000>;
@@ -867,10 +1027,43 @@
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
 		mdpsys: syscon@1f000000 {
 			compatible = "mediatek,mt8192-mdpsys", "syscon";
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
