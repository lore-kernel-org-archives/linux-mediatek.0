Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78C3C4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:32:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60715206B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I4cirY04";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kTdjGRTW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60715206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x5J4362kDXwKlj0ZyAYyxbWrGmrrCTeZZnXU9aEpvj8=; b=I4cirY04afqewOC6a2VyILsHf
	lNxygAaKfRqzagDGn40y2Ke/QXct9pgAS8dDMEOy/9WpfegYJ4UpsdSNM/4iv4495RuRSYijywEZg
	OeIph7gSoKKIFFMP6sHi9r0KmgAH9qcdUZ6dj0clrEnvoq9K8afOcUD/pwGVU16Vyfh3ZQNtAYiRE
	u5zYohZfOhDgxTG/0lOwj2Mkj8PzWyTqkstMmFMKyU69PEZPzQ3E2llI9UEZ1VmABMI04SW2zai+U
	ACwIb+cvIzPSv7WNPW9H/EnSHsoMjpJwmKkXF7hwmHbtl1kw/EbRXN1zUgIbpJzoweslH/Rf9qEOY
	l8HDphqtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXXT-0003X0-0b; Wed, 30 Sep 2020 08:32:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXX2-0003Fx-Ck; Wed, 30 Sep 2020 08:32:14 +0000
X-UUID: 41cf20e081ed44519077be92fef15bdc-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7qnmH6zd2m7IXntKt3yluwEtjEbUCrvblIFqr4JiihY=; 
 b=kTdjGRTWfDBc8IMNX87tyAOCT+3F1H1aZh18lLKcJGFTywFEGsxjZHQAevTU6MGer9g6Nz4acsnlPsWdVW91hEGBn27hhjRwfid/SL25OlL2LzHiaQQlwlwEi5QIfbZflfVIy+PpaAM61aC3DEslplZ59uurHuA7AFAb99v1GQs=;
X-UUID: 41cf20e081ed44519077be92fef15bdc-20200930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 75764564; Wed, 30 Sep 2020 00:32:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 01:31:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 16:31:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 16:31:23 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/4] arm64: dts: mt8192: add mmc device node
Date: Wed, 30 Sep 2020 16:31:19 +0800
Message-ID: <20200930083120.11971-4-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930083120.11971-1-wenbin.mei@mediatek.com>
References: <20200930083120.11971-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_043212_596273_562E9CCC 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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
