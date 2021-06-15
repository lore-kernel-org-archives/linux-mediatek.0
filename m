Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A25FC48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92CD61078
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92CD61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rn+yc4UNEKSa6gAxKDw9/wEO1vcl7tF/zCu2t6Y9NRs=; b=lB/VopCy1VHriU
	9OgjQY2CKeaxfBobNYNf497knj0tAZb+NPziwWv7CEW3I8lLzLNCcjMOD4j7wqaUb9J4MCzogEamT
	suppXMDoIoStI04YOw6uRR3PEWnh0rCdjLRUPsAAESrHCLm4ApFyMFvMfYoZCcxldA38bb8Qwn+w/
	kGKpuJtc7ioOhai1TNMRA9K4tN2kqIn1D2gNx316qdCkbkFKbA923nHI815EQq0cr0ENo5PD38Ik2
	LJiDrXu+vk7dzwl1l9f/mP3WaWRi350IJ8IdziGEjrKg4ZEaB6HrVfRgkiWYK+6U6leTQbCAGssHR
	E81sieoQIipUUkUOvetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGeN-003AUv-OZ; Tue, 15 Jun 2021 21:31:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvt-001lI9-C7; Tue, 15 Jun 2021 17:33:03 +0000
X-UUID: 3b8fc57370744015aa7cb654c130f23f-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vzUI8UWenpkuRVZXHi04t3M5tuJz3n7gxO2HkFiXDu0=; 
 b=r37NfuqlHi7Jnn8bUs+Tckjlqfiufz8NyBuIlwUl/G/DU2ilAmxfAtOw8OnSO6OKsQ/t8grpQsv+jKwjV1xT5chNWjrLHtiPfJ3GusXaaV9eaoB+BCdVTyMBNJKq1h221Wfwe/AXNV54E4t6PCTfuP5emuZsCgtPhrLpNbilfoc=;
X-UUID: 3b8fc57370744015aa7cb654c130f23f-20210615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 318864669; Tue, 15 Jun 2021 10:32:53 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:51 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:44 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, James Zheng
 <james.zheng@mediatek.com>
Subject: [PATCH 13/27] arm64: dts: mt8195: add hdmi nodes
Date: Wed, 16 Jun 2021 01:32:19 +0800
Message-ID: <20210615173233.26682-13-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103301_654253_FBF24843 
X-CRM114-Status: GOOD (  10.05  )
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

From: James Zheng <james.zheng@mediatek.com>

Add HDMI support for mt8195 SoC.

Signed-off-by: James Zheng <james.zheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 327ff1b856d2..1a281551d011 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -20,6 +20,10 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		dpi1 = &disp_dpi1;
+	};
+
 	clocks {
 		clk26m: oscillator0 {
 			compatible = "fixed-clock";
@@ -317,6 +321,28 @@
 			interrupt-controller;
 			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
 			#interrupt-cells = <2>;
+
+			hdmi_pin: hdmipinctrl {
+				hdmi_hotplug {
+					pinmux = <PINMUX_GPIO32__FUNC_HDMITX20_HTPLG>;
+					bias-pull-down;
+				};
+				hdmi_ddc {
+					pinmux = <PINMUX_GPIO34__FUNC_HDMITX20_SCL>,
+						<PINMUX_GPIO35__FUNC_HDMITX20_SDA>;
+					mediatek,drive-strength-adv = <0>;
+					drive-strength = <MTK_DRIVE_10mA>;
+				};
+				hdmi_cec {
+					pinmux = <PINMUX_GPIO33__FUNC_HDMITX20_CEC>;
+					bias-disable;
+				};
+				hdmi_5vctrl {
+					pinmux = <PINMUX_GPIO31__FUNC_GPIO31>;
+					slew-rate = <1>;
+					output-high;
+				};
+			};
 		};
 
 		scpsys: syscon@10006000 {
@@ -693,6 +719,12 @@
 			#clock-cells = <1>;
 		};
 
+		cec: cec@10014000 {
+			compatible = "mediatek,mt8195-cec";
+			reg = <0 0x10014000 0 0x100>;
+			interrupts = <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		systimer: timer@10017000 {
 			compatible = "mediatek,mt8195-timer", "mediatek,mt6765-timer";
 			reg = <0 0x10017000 0 0x1000>;
@@ -1105,6 +1137,22 @@
 			#clock-cells = <1>;
 		};
 
+		hdmi_phy: hdmi-phy@11d5f000 {
+			compatible = "mediatek,mt8195-hdmi-phy";
+			reg = <0 0x11d5f000 0 0x100>;
+			clocks = <&topckgen CLK_TOP_HDMI_XTAL_SEL>,
+				 <&infracfg_ao CLK_INFRA_AO_HDMI_26M>,
+				 <&apmixedsys CLK_APMIXED_HDMIPLL1>,
+				 <&apmixedsys CLK_APMIXED_HDMIPLL2>;
+			clock-names = "hdmi_xtal_sel",
+				      "hdmi_26m",
+				      "hdmi_pll1",
+				      "hdmi_pll2";
+			clock-output-names = "hdmi_txpll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+		};
+
 		i2c0: i2c@11e00000 {
 			compatible = "mediatek,mt8195-i2c",
 				     "mediatek,mt8192-i2c";
@@ -1408,5 +1456,41 @@
 			reg = <0 0x1c100000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		disp_dpi1: disp_dpi1@1c112000 {
+			compatible = "mediatek,mt8195-dpi";
+			reg = <0 0x1c112000 0 0x1000>;
+			interrupts = <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "pixel", "engine";
+			status = "disabled";
+		};
+
+		hdmi0: hdmi@1c300000 {
+			compatible = "mediatek,mt8195-hdmi";
+			reg = <0 0x1c300000 0 0x1000>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_HDMI_TX>;
+			clocks = <&topckgen CLK_TOP_HDCP_SEL>,
+					<&topckgen CLK_TOP_HDCP_24M_SEL>,
+					<&topckgen CLK_TOP_HD20_HDCP_C_SEL>,
+					<&vppsys1 CLK_VPP1_VPP_SPLIT_HDMI>;
+			clock-names = "hdcp_sel",
+				      "hdcp24_sel",
+				      "hd20_hdcp_sel",
+				      "split_hdmi";
+			interrupts = <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&hdmi_pin>;
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi";
+			cec = <&cec>;
+			ddc-i2c-bus = <&hdmiddc0>;
+			status = "disabled";
+		};
+	};
+
+	hdmiddc0: ddc_i2c {
+		compatible = "mediatek,mt8195-hdmi-ddc";
+		clocks = <&clk26m>;
+		clock-names = "ddc-i2c";
 	};
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
