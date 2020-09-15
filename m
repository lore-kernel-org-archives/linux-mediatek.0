Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C15C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:02:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63736206B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Ucy9/ZA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SXQ5tR+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63736206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x5J4362kDXwKlj0ZyAYyxbWrGmrrCTeZZnXU9aEpvj8=; b=0Ucy9/ZAS3RiY/VSdcFK/cMKS
	XCdnWfiX8U45ztVtB+deTnkH3FigCMsDlr7xM6+b0Pgcty1ixVTIgV12+bzOK1GPYpBUdSN+fmxbl
	zKL83vdPKbRDeWdRORiys9VUs/d2BLnm/pVSXoayZ7tKupkmKrwnOVCuXqk34syUvwPe3PHJ8twpe
	pgXN9GKf+HvcsnX5wgwzplQOWZ/R3P0RrIlUoTSxiJkQgyIDfre4yeP9crdH7lifTN27+98XiQxOl
	qqhlx7mH2/naUWfxwruLdWfoGkY+HhtOq8nrB24r7PcXXP0dXC9VUS2lE+mWue1uCe+wEzSOwyqrz
	evM3NENvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI42t-0004zl-8Z; Tue, 15 Sep 2020 06:02:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI42h-0004v6-Hg; Tue, 15 Sep 2020 06:02:17 +0000
X-UUID: 4b634fa93a5b4a748b688214fd9a2d3a-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7qnmH6zd2m7IXntKt3yluwEtjEbUCrvblIFqr4JiihY=; 
 b=SXQ5tR+Krg2H/6BCQyGvQAHPqRuKf3xPhB3h4sQVCYe3uol6xTzHRZFAFfWweeAlCVCysm2ldF9OR0q5yeMoCd9duzyoel7tj6c27slV4wJG5i7S9NL+iL+txBaGwWVp/w4U/NbRKf5j149NCCS/8L9Q5/AN/LwiiE/1zQVYADI=;
X-UUID: 4b634fa93a5b4a748b688214fd9a2d3a-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 75310889; Mon, 14 Sep 2020 22:02:07 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 23:00:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 14:00:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 14:00:44 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: 
Subject: [PATCH 2/3] arm64: dts: mt8192: add mmc device node
Date: Tue, 15 Sep 2020 13:58:34 +0800
Message-ID: <20200915055835.25590-3-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200915055835.25590-1-wenbin.mei@mediatek.com>
References: <20200915055835.25590-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_020215_772998_95F4B9F1 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds mmc device node for mt8192

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts | 89 +++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 34 ++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index 0205837fa698..a4279fa87c2b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	model = "MediaTek MT8192 evaluation board";
@@ -27,3 +28,91 @@
 &uart0 {
 	status = "okay";
 };
+
+&mmc0 {
+	status = "okay";
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	bus-width = <8>;
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	supports-cqe;
+	cap-mmc-hw-reset;
+	no-sdio;
+	no-sd;
+	hs400-ds-delay = <0x12814>;
+	vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
+	vqmmc-supply = <&mt6359_vufs_ldo_reg>;
+	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
+	non-removable;
+};
+
+&pio {
+	mmc0_pins_default: mmc0default {
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO188__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO185__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO193__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO186__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO189__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO187__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO190__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO183__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strenth = <3>;
+			mediatek,pull-up-adv = <1>;
+		};
+
+		pins_clk {
+			pinmux = <PINMUX_GPIO192__FUNC_MSDC0_CLK>;
+			drive-strenth = <3>;
+			mediatek,pull-down-adv = <2>;
+		};
+
+		pins_rst {
+			pinmux = <PINMUX_GPIO194__FUNC_MSDC0_RSTB>;
+			drive-strenth = <3>;
+			mediatek,pull-up-adv = <1>;
+		};
+	};
+
+	mmc0_pins_uhs: mmc0@0{
+		pins_cmd_dat {
+			pinmux = <PINMUX_GPIO184__FUNC_MSDC0_DAT0>,
+				 <PINMUX_GPIO188__FUNC_MSDC0_DAT1>,
+				 <PINMUX_GPIO185__FUNC_MSDC0_DAT2>,
+				 <PINMUX_GPIO193__FUNC_MSDC0_DAT3>,
+				 <PINMUX_GPIO186__FUNC_MSDC0_DAT4>,
+				 <PINMUX_GPIO189__FUNC_MSDC0_DAT5>,
+				 <PINMUX_GPIO187__FUNC_MSDC0_DAT6>,
+				 <PINMUX_GPIO190__FUNC_MSDC0_DAT7>,
+				 <PINMUX_GPIO183__FUNC_MSDC0_CMD>;
+			input-enable;
+			drive-strenth = <4>;
+			mediatek,pull-up-adv = <1>;
+		};
+
+		pins_clk {
+			pinmux = <PINMUX_GPIO192__FUNC_MSDC0_CLK>;
+			drive-strenth = <4>;
+			mediatek,pull-down-adv = <2>;
+		};
+
+		pins_ds {
+			pinmux = <PINMUX_GPIO191__FUNC_MSDC0_DSL>;
+			drive-strenth = <4>;
+			mediatek,pull-down-adv = <2>;
+		};
+
+		pins_rst {
+			pinmux = <PINMUX_GPIO194__FUNC_MSDC0_RSTB>;
+			drive-strenth = <3>;
+			mediatek,pull-up-adv = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index faea0d97c2a9..de3d10c0eeef 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -760,6 +760,40 @@
 			#clock-cells = <1>;
 		};
 
+		mmc0: mmc@11f60000 {
+			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11f60000 0 0x1000>,
+			      <0 0x11f50000 0 0x1000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
+				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
+				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
+				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
+				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
+				 <&msdc_top CLK_MSDC_TOP_AXI>,
+				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
+			clock-names = "source", "hclk", "source_cg", "sys_cg",
+				      "pclk_cg", "axi_cg", "ahb_cg";
+			status = "disabled";
+		};
+
+		mmc1: mmc@11f70000 {
+			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
+			reg = <0 0x11f70000 0 0x1000>,
+			      <0 0x11c70000 0 0x1000>;
+			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
+				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
+				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
+				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
+				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
+				 <&msdc_top CLK_MSDC_TOP_AXI>,
+				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
+			clock-names = "source", "hclk", "source_cg", "sys_cg",
+				      "pclk_cg", "axi_cg", "ahb_cg";
+			status = "disabled";
+		};
+
 		mfgcfg: syscon@13fbf000 {
 			compatible = "mediatek,mt8192-mfgcfg", "syscon";
 			reg = <0 0x13fbf000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
