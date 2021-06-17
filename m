Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C7EC48BE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 01:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ACCD611CE
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 01:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ACCD611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=km/0xxoUxV4T/r017P8JcMAM0+60h0juiESuI+r4i4s=; b=c0FhkaCu1xoEHh
	6vqlAh2fvJsc2pPN3+RgcPE/rjlYPYumIi28AogKwVYqhxSQUCv9/fMdzbT/wPLBkTTrfZ0h2DHxl
	mRAxZ9Gh0jZz3PHGqeZ59e0RScLloond0BlctocD/UhrTKXGsyrTMSCNw8dOWRfS5WjMuBlQILvQa
	0GmlOuOYrdp9W5AS1CHbi7ZXR4IVvtps+Pg1gBUsNW/9u2EeZbgcUSrtbfktCx0RvLIO6uiN+FT8t
	DpLVkkTzflMW/DZxurXWSBf2ziWvt4bsLh/A+CddPy+8d5XkzWlDdIqOFORSJ0XuiLgPBrFkO2PS0
	qvFy9VlrHoH30yDi4OMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltgwE-008QIY-Kb; Thu, 17 Jun 2021 01:35:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltgw0-008QHZ-IV; Thu, 17 Jun 2021 01:35:11 +0000
X-UUID: 9aea0bdf53f244e98eaee040967d9c32-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=6A5KTyTiFkYfy1NyQJ7Z8af65ZDO/vOMKCA0He7qZU0=; 
 b=pk1OYk+xJjh6T4yMGnhvhxrKIIZ03WdXPr8Nu5f6S7WADj0NZNw80l/HTma3WYdL8MjPrh59pel7wga+gD3VA9PGYiuv4JL9go8bAeWBO7cRp1dPMvo/uWDHsvK95+t8UsDhMn+yIzBWyLaCselhIe0GkqRxOd5mpdigtThtdUY=;
X-UUID: 9aea0bdf53f244e98eaee040967d9c32-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1933774863; Wed, 16 Jun 2021 18:35:03 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 18:28:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 09:28:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 09:28:13 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH] arm64: dts: mediatek: Add mt8195 clock controllers
Date: Thu, 17 Jun 2021 09:28:03 +0800
Message-ID: <20210617012803.5894-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_183509_471801_196A91C2 
X-CRM114-Status: GOOD (  10.92  )
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

Add clock controller nodes for SoC mt8195

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
This patch is based on 5.13-rc3 and [1], also depends on [2].

[1] Add Mediatek SoC MT8195 and evaluation board dts and Makefile
    - https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
[2] Mediatek MT8195 clock support
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 218 ++++++++++++++++++++++-
 1 file changed, 217 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 8fc2af12c0f8..b0255c5aa019 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -5,7 +5,7 @@
  */
 
 /dts-v1/;
-
+#include <dt-bindings/clock/mt8195-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
@@ -273,6 +273,18 @@
 			};
 		};
 
+		topckgen: syscon@10000000 {
+			compatible = "mediatek,mt8195-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg_ao: syscon@10001000 {
+			compatible = "mediatek,mt8195-infracfg_ao", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8195-pinctrl";
 			reg = <0 0x10005000 0 0x1000>,
@@ -299,6 +311,12 @@
 			reg = <0 0x10007000 0 0x100>;
 		};
 
+		apmixedsys: syscon@1000c000 {
+			compatible = "mediatek,mt8195-apmixedsys", "syscon";
+			reg = <0 0x1000c000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		systimer: timer@10017000 {
 			compatible = "mediatek,mt8195-timer", "mediatek,mt6765-timer";
 			reg = <0 0x10017000 0 0x1000>;
@@ -306,6 +324,30 @@
 			clocks = <&clk26m>;
 		};
 
+		nnasys: clock-controller@10211000 {
+			compatible = "mediatek,mt8195-nnasys";
+			reg = <0 0x10211000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		scp_adsp: clock-controller@10720000 {
+			compatible = "mediatek,mt8195-scp_adsp";
+			reg = <0 0x10720000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		audsys: clock-controller@10890000 {
+			compatible = "mediatek,mt8195-audsys";
+			reg = <0 0x10890000 0 0x10000>;
+			#clock-cells = <1>;
+		};
+
+		audsys_src: clock-controller@108a0000 {
+			compatible = "mediatek,mt8195-audsys_src";
+			reg = <0 0x108a0000 0 0x2000>;
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@11001100 {
 			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11001100 0 0x100>;
@@ -368,6 +410,12 @@
 			status = "disabled";
 		};
 
+		pericfg_ao: syscon@11003000 {
+			compatible = "mediatek,mt8195-pericfg_ao", "syscon";
+			reg = <0 0x11003000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		spi0: spi@1100a000 {
 			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
 			reg = <0 0x1100a000 0 0x100>;
@@ -505,6 +553,18 @@
 			};
 		};
 
+		imp_iic_wrap_s: clock-controller@11d03000 {
+			compatible = "mediatek,mt8195-imp_iic_wrap_s";
+			reg = <0 0x11d03000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imp_iic_wrap_w: clock-controller@11e05000 {
+			compatible = "mediatek,mt8195-imp_iic_wrap_w";
+			reg = <0 0x11e05000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		u3phy1: t-phy@11e30000 {
 			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
 			#address-cells = <1>;
@@ -557,5 +617,161 @@
 			#phy-cells = <0>;
 			status = "disabled";
 		};
+
+		mfgcfg: clock-controller@13fbf000 {
+			compatible = "mediatek,mt8195-mfgcfg";
+			reg = <0 0x13fbf000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vppsys0: clock-controller@14000000 {
+			compatible = "mediatek,mt8195-vppsys0";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		wpesys: clock-controller@14e00000 {
+			compatible = "mediatek,mt8195-wpesys";
+			reg = <0 0x14e00000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		wpesys_vpp0: clock-controller@14e02000 {
+			compatible = "mediatek,mt8195-wpesys_vpp0";
+			reg = <0 0x14e02000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		wpesys_vpp1: clock-controller@14e03000 {
+			compatible = "mediatek,mt8195-wpesys_vpp1";
+			reg = <0 0x14e03000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vppsys1: clock-controller@14f00000 {
+			compatible = "mediatek,mt8195-vppsys1";
+			reg = <0 0x14f00000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys: clock-controller@15000000 {
+			compatible = "mediatek,mt8195-imgsys";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys1_dip_top: clock-controller@15110000 {
+			compatible = "mediatek,mt8195-imgsys1_dip_top";
+			reg = <0 0x15110000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys1_dip_nr: clock-controller@15130000 {
+			compatible = "mediatek,mt8195-imgsys1_dip_nr";
+			reg = <0 0x15130000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys1_wpe: clock-controller@15220000 {
+			compatible = "mediatek,mt8195-imgsys1_wpe";
+			reg = <0 0x15220000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		ipesys: clock-controller@15330000 {
+			compatible = "mediatek,mt8195-ipesys";
+			reg = <0 0x15330000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: clock-controller@16000000 {
+			compatible = "mediatek,mt8195-camsys";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawa: clock-controller@1604f000 {
+			compatible = "mediatek,mt8195-camsys_rawa";
+			reg = <0 0x1604f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_yuva: clock-controller@1606f000 {
+			compatible = "mediatek,mt8195-camsys_yuva";
+			reg = <0 0x1606f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawb: clock-controller@1608f000 {
+			compatible = "mediatek,mt8195-camsys_rawb";
+			reg = <0 0x1608f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_yuvb: clock-controller@160af000 {
+			compatible = "mediatek,mt8195-camsys_yuvb";
+			reg = <0 0x160af000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_mraw: clock-controller@16140000 {
+			compatible = "mediatek,mt8195-camsys_mraw";
+			reg = <0 0x16140000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		ccusys: clock-controller@17200000 {
+			compatible = "mediatek,mt8195-ccusys";
+			reg = <0 0x17200000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys_soc: clock-controller@1800f000 {
+			compatible = "mediatek,mt8195-vdecsys_soc";
+			reg = <0 0x1800f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: clock-controller@1802f000 {
+			compatible = "mediatek,mt8195-vdecsys";
+			reg = <0 0x1802f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys_core1: clock-controller@1803f000 {
+			compatible = "mediatek,mt8195-vdecsys_core1";
+			reg = <0 0x1803f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apusys_pll: clock-controller@190f3000 {
+			compatible = "mediatek,mt8195-apusys_pll";
+			reg = <0 0x190f3000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: clock-controller@1a000000 {
+			compatible = "mediatek,mt8195-vencsys";
+			reg = <0 0x1a000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys_core1: clock-controller@1b000000 {
+			compatible = "mediatek,mt8195-vencsys_core1";
+			reg = <0 0x1b000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdosys0: clock-controller@1c01a000 {
+			compatible = "mediatek,mt8195-vdosys0";
+			reg = <0 0x1c01a000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdosys1: clock-controller@1c100000 {
+			compatible = "mediatek,mt8195-vdosys1";
+			reg = <0 0x1c100000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
