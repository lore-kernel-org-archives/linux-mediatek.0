Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49BAC4727C
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 13:12:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D78F2074A
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 13:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQqKmx1v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cQSdKmC+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D78F2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x5J4362kDXwKlj0ZyAYyxbWrGmrrCTeZZnXU9aEpvj8=; b=OQqKmx1vid7GlCB/dqLEXeD6F
	pg7eno6V+6RSxTQZNsGfwuPl/6k13n160ztzE05EkTMggoeHg5M3ifAebRxXItMk/h4b21CHwGqHl
	ai3FjODZ0OtdxdGGODMfMbpeFU4vDb51yvMjOWRr1dwa/vJYO4zhk+RZ72x5OSNlgwuz9WN0CkIKs
	Bjw3uH2EgumWtEyo6uRBi6h5husCLcsSwUcPM2lSFGaiw+kUaQ359gzF6BX9FaVgXAylA3bmEfQ/C
	1rdJhJ+JcM6xgP92S/FxkRgcbaakU2ALJEyY94EpSht6jngjo1oc6sqLHXKNM2+5Dae3hkYO4Dvuw
	FgKnhRT3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMsxB-0003FY-4l; Mon, 28 Sep 2020 13:12:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMsww-00039i-2T; Mon, 28 Sep 2020 13:12:16 +0000
X-UUID: 5219da37747e48c59bcc90fe5c47cf83-20200928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7qnmH6zd2m7IXntKt3yluwEtjEbUCrvblIFqr4JiihY=; 
 b=cQSdKmC+ECbyEIN8Xf1SyQNhUL1idGUNxq7Iu7N5hx5XvhR7EdoYRtoISXDUAXZ7YopUdDNncHZ4aqgKxa4nrpMrNKmV8a1pxPC/s4eNRRqAyC93tt6aaXvnoeqnevhnrIJxZL7fuQWAzWOnk7KV4LfZJOlRhXcmEokvm6IDhkw=;
X-UUID: 5219da37747e48c59bcc90fe5c47cf83-20200928
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1371486522; Mon, 28 Sep 2020 05:12:02 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 06:12:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 21:11:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Sep 2020 21:11:59 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: mt8192: add mmc device node
Date: Mon, 28 Sep 2020 21:09:17 +0800
Message-ID: <20200928130918.32326-4-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200928130918.32326-1-wenbin.mei@mediatek.com>
References: <20200928130918.32326-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_091214_309360_A31FC0AA 
X-CRM114-Status: GOOD (  11.77  )
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
