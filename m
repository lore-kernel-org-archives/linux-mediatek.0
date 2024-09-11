Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC845EE49BC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3C8P2/ShZAyxq+RU0fcUwIOZvUAQXLkIBcEAMfkacE=; b=bpNSa7ui7skhHW
	qMge4BxJY2rPPhRWv6nUm+9UB/ModtXZgiLU5+4kZptiAOF7gmv7K4aObrLdi3nTEjziKCzgh6eUM
	CSfFCJZSgvuccqQ2ylYi1O/fpZwcWQOBpT/ilYHTtT9CHVXplufG8AVpOKRuwHX5ek9Z9B1UM482u
	NI2KYnwUBh0JfH/nA3ntrBg/594aw17oYa2rfv4AOt9/pWXAn+eOtYDTqR+21zBHYPD1egx0ptX++
	/BTJM65sCZSoPEjR6oXAHrn25O5kpvX8RREKtiU2w/02GDqnHk6tWFirT1VMaPHQrXiAUYvUkTUY9
	APFXEWBjn4AdgHACLwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOgG-0000000A13w-2Qwv;
	Wed, 11 Sep 2024 14:50:52 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soORE-00000009w8W-1Rvb
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso4487810b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065319; x=1726670119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3C8P2/ShZAyxq+RU0fcUwIOZvUAQXLkIBcEAMfkacE=;
        b=AccAulErkMlZesg6p9dc3yNpZMmBKWe7I1GYq/nweyJOpzaxWl9m0RzZYFQq9RvfXy
         XVMMeP2obJ2Mw3iZeUYjpkuBgi/UuzBWspF8AhlVfO3BkZvDMRqiB5jPorQ4QNlIFu1D
         yZbw/0TASwW4JviHo7oi6nxe1mjYRfrLVamzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065319; x=1726670119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3C8P2/ShZAyxq+RU0fcUwIOZvUAQXLkIBcEAMfkacE=;
        b=kXbeEOOT/VJGkOf0m1Dv9qHB63fvl4eDw8z4yZkWgGOCmsSDsN0kTF3wmfTfo8tiAs
         DVqEq0PYmgOgqHsDABBH/jcvUTAlhflMraXGViHw4KU/wp+Tt+z/PQad6ghDUu4t+H7r
         CYw6r3YuP6VfE9mDvlG5Dw4gh8wvgher1xwKRuzavkyeWIce+EzC29nojLMDfpVPnDHo
         q1zmwJrRqIMgb3/FF8O4/i5pPfIRvQpqhHjZtBGVxKbKFhFmvHtfY2/hWljzBH8ihE0R
         ojY+sfwAKCm2UtWzDYOxXsyw539vU5B7R0mA00DYEH35n8NRNE1crWZpR3ZoW1qZGKjs
         IGqA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6MZVh5UBeoDMrC9WPIgqZ0fI/TK6m23o6w90bHpdT+MfRldykQwdojOAp7heb5Sin22416VB/nWm0G11mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxemP/bqDOJ6EHqhef9f4cNiHuTRFwJL2XQNeYtCJyZo1h2qB2D
	3GOb3t0uja8zdsNiJT1sVBh9hhNIgcYoCKav980QlYBDRYSlnTRBQ4qMXRmQvQ==
X-Google-Smtp-Source: AGHT+IEWs+Nl1DTwsrFm62j+iMmwxKQIEd1M5v7OwN+K77hrCUFGyxVAB8wJQvjcW3hhfCNxEHJDsQ==
X-Received: by 2002:a05:6a21:168c:b0:1cc:e969:a783 with SMTP id adf61e73a8af0-1cf5e0f481amr5731240637.20.1726065319204;
        Wed, 11 Sep 2024 07:35:19 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:18 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 4/8] arm64: dts: mediatek: mt8188: Add SMI/LARB/IOMMU support
Date: Wed, 11 Sep 2024 22:33:57 +0800
Message-ID: <20240911143429.850071-5-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911143429.850071-1-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073520_399995_C14BAF8D 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Local Arbiter (LARB) is a component of Smart Multimedia Interface (SMI)
that supports IOMMU on the MediaTek SoCs.

Add the following nodes for memory management support on MT8188 SoC:
- one Infra IOMMU
- two Multimedia (MM) IOMMUs of VDO and VPP
- corresponding SMI common and LARB nodes of the MM IOMMUs

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 169 +++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cdd2fe14effa..f746b89c1ec6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/mailbox/mediatek,mt8188-gce.h>
+#include <dt-bindings/memory/mediatek,mt8188-memory-port.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
 #include <dt-bindings/power/mediatek,mt8188-power.h>
@@ -1305,6 +1306,13 @@ pwrap: pwrap@10024000 {
 			clock-names = "spi", "wrap";
 		};
 
+		infra_iommu: iommu@10315000 {
+			compatible = "mediatek,mt8188-iommu-infra";
+			reg = <0 0x10315000 0 0x1000>;
+			interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH 0>;
+			#iommu-cells = <1>;
+		};
+
 		gce0: mailbox@10320000 {
 			compatible = "mediatek,mt8188-gce";
 			reg = <0 0x10320000 0 0x4000>;
@@ -1798,6 +1806,37 @@ vppsys0: clock-controller@14000000 {
 			#clock-cells = <1>;
 		};
 
+		vpp_smi_common: smi@14012000 {
+			compatible = "mediatek,mt8188-smi-common-vpp";
+			reg = <0 0x14012000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
+				 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+		};
+
+		larb4: smi@14013000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x14013000 0 0x1000>;
+			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
+				 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			mediatek,larb-id = <SMI_L4_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+		};
+
+		vpp_iommu: iommu@14018000 {
+			compatible = "mediatek,mt8188-iommu-vpp";
+			reg = <0 0x14018000 0 0x5000>;
+			clocks = <&vppsys0 CLK_VPP0_SMI_IOMMU>;
+			clock-names = "bclk";
+			interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
+			#iommu-cells = <1>;
+			mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb7 &larb23>;
+		};
+
 		wpesys: clock-controller@14e00000 {
 			compatible = "mediatek,mt8188-wpesys";
 			reg = <0 0x14e00000 0 0x1000>;
@@ -1810,12 +1849,45 @@ wpesys_vpp0: clock-controller@14e02000 {
 			#clock-cells = <1>;
 		};
 
+		larb7: smi@14e04000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x14e04000 0 0x1000>;
+			clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
+				 <&wpesys CLK_WPE_TOP_SMI_LARB7>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_WPE>;
+			mediatek,larb-id = <SMI_L7_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+		};
+
 		vppsys1: clock-controller@14f00000 {
 			compatible = "mediatek,mt8188-vppsys1";
 			reg = <0 0x14f00000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb5: smi@14f02000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x14f02000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_GALS5>,
+				 <&vppsys1 CLK_VPP1_LARB5>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,larb-id = <SMI_L5_ID>;
+			mediatek,smi = <&vdo_smi_common>;
+		};
+
+		larb6: smi@14f03000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x14f03000 0 0x1000>;
+			clocks = <&vppsys1 CLK_VPP1_GALS6>,
+				 <&vppsys1 CLK_VPP1_LARB6>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
+			mediatek,larb-id = <SMI_L6_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+		};
+
 		imgsys: clock-controller@15000000 {
 			compatible = "mediatek,mt8188-imgsys";
 			reg = <0 0x15000000 0 0x1000>;
@@ -1894,12 +1966,34 @@ ccusys: clock-controller@17200000 {
 			#clock-cells = <1>;
 		};
 
+		larb23: smi@1800d000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x1800d000 0 0x1000>;
+			clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>,
+				 <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDEC0>;
+			mediatek,larb-id = <SMI_L23_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+		};
+
 		vdecsys_soc: clock-controller@1800f000 {
 			compatible = "mediatek,mt8188-vdecsys-soc";
 			reg = <0 0x1800f000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb21: smi@1802e000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x1802e000 0 0x1000>;
+			clocks = <&vdecsys CLK_VDEC2_LARB1>,
+				 <&vdecsys CLK_VDEC2_LARB1>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDEC1>;
+			mediatek,larb-id = <SMI_L21_ID>;
+			mediatek,smi = <&vdo_smi_common>;
+		};
+
 		vdecsys: clock-controller@1802f000 {
 			compatible = "mediatek,mt8188-vdecsys";
 			reg = <0 0x1802f000 0 0x1000>;
@@ -1912,6 +2006,17 @@ vencsys: clock-controller@1a000000 {
 			#clock-cells = <1>;
 		};
 
+		larb19: smi@1a010000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x1a010000 0 0x1000>;
+			clocks = <&vencsys CLK_VENC1_VENC>,
+				 <&vencsys CLK_VENC1_VENC>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VENC>;
+			mediatek,larb-id = <SMI_L19_ID>;
+			mediatek,smi = <&vdo_smi_common>;
+		};
+
 		vdosys0: syscon@1c01d000 {
 			compatible = "mediatek,mt8188-vdosys0", "syscon";
 			reg = <0 0x1c01d000 0 0x1000>;
@@ -1920,6 +2025,48 @@ vdosys0: syscon@1c01d000 {
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xd000 0x1000>;
 		};
 
+		larb0: smi@1c022000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x1c022000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_SMI_LARB>,
+				 <&vdosys0 CLK_VDO0_SMI_LARB>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,larb-id = <SMI_L0_ID>;
+			mediatek,smi = <&vdo_smi_common>;
+		};
+
+		larb1: smi@1c023000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x1c023000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_SMI_LARB>,
+				 <&vdosys0 CLK_VDO0_SMI_LARB>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			mediatek,larb-id = <SMI_L1_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+		};
+
+		vdo_smi_common: smi@1c024000 {
+			compatible = "mediatek,mt8188-smi-common-vdo";
+			reg = <0 0x1c024000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_SMI_COMMON>,
+				 <&vdosys0 CLK_VDO0_SMI_GALS>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+		};
+
+		vdo_iommu: iommu@1c028000 {
+			compatible = "mediatek,mt8188-iommu-vdo";
+			reg = <0 0x1c028000 0 0x5000>;
+			clocks = <&vdosys0 CLK_VDO0_SMI_IOMMU>;
+			clock-names = "bclk";
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			#iommu-cells = <1>;
+			mediatek,larbs = <&larb0 &larb2 &larb5 &larb19 &larb21>;
+		};
+
 		vdosys1: syscon@1c100000 {
 			compatible = "mediatek,mt8188-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
@@ -1928,5 +2075,27 @@ vdosys1: syscon@1c100000 {
 			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0 0x1000>;
 		};
+
+		larb2: smi@1c102000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x1c102000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_SMI_LARB2>,
+				 <&vdosys1 CLK_VDO1_SMI_LARB2>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,larb-id = <SMI_L2_ID>;
+			mediatek,smi = <&vdo_smi_common>;
+		};
+
+		larb3: smi@1c103000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x1c103000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_SMI_LARB3>,
+				 <&vdosys1 CLK_VDO1_SMI_LARB3>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,larb-id = <SMI_L3_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+		};
 	};
 };
-- 
2.46.0.598.g6f2099f65c-goog


