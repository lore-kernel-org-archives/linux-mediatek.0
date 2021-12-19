Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Dec 2021 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sytARVUfEPMvQFhBaw8GFwERoQK09GrsQ1MwAwBmbMg=; b=L2ILM556lWRQjW
	d6qBv1Cxz3zv1VSjMJIqqrhDvml+VvA47EDviyWyYmE71vdxhhIBj/REZNA/vBDzm9ml2m4Ln4wuL
	LK3u9pLsi3nExqXafV2sVwH+0Peeg/n4ulqOzotLuvGlbn4PKojvNFuiImxfUznXQQZ8qNC5BOxDl
	DzNN5XwYQbgFwsQblOP0Yr7qWztx3l8Rd18Qz6w02LAP7JAIXMwXJMK1S8ZbeM9vwSPAV2kXdiqkq
	TzmQw3p0wNmWSKPYVaJm/GrJS8lPgWIrCcsScudSSuQD6k+zzpCZbNB4N6CZKPoqha2Vzczfmeblv
	pnuq73qsXhZhEdAraBhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myyCl-00GErq-8T; Sun, 19 Dec 2021 15:34:31 +0000
Received: from smtpng1.i.mail.ru ([94.100.181.251])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myyCJ-00GEiR-LQ; Sun, 19 Dec 2021 15:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=kZvAmoGdS/dQRl/fNKxdcebE6CxbQoX5L0rVMLaI4Jg=; 
 t=1639928043;x=1640533443; 
 b=Wigb0vyJKAqosFN+UAkoDSGsHVyAPJFbRGpXR0LKPg8OH42xeQyKazfE8u+Cj11NB8CcNY3UmHhB14LQPKtAn9fjs3z0V2iEogthtJt2rDZXSf4UsfZ/UZzSccUV7JUMBix9/rYeP8lPj2Spwuc2cE4umgs+3TuvQ2iWAirsyXzT0V0aPu5mC+wygXMpFMCw/U0qvGyssLAbI2alfJD0W4AX/XrWGkxo05pE12lximC5P1pojX5Vt32/HxHsDu+BpN2acxSdRIvxxu6jmL3+ksTINrcKZ2Rnt4uinKZdPAaPxUh5LiK3m2/oJi4nKqOPyzjCEgJBxncD7F44F6fXxg==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <gtk3@inbox.ru>)
 id 1myyCD-0000Gy-Ac; Sun, 19 Dec 2021 18:33:57 +0300
From: Maxim Kutnij <gtk3@inbox.ru>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxim Kutnij <gtk3@inbox.ru>
Subject: [PATCH 1/3] Add initial support for Mediatek mt6582
Date: Sun, 19 Dec 2021 23:31:32 +0500
Message-Id: <20211219183134.3849-1-gtk3@inbox.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=gtk3@inbox.ru
 smtp.mailfrom=gtk3@inbox.ru
X-174C08C4: 5188C02AEC42908C481ED7ADC579193296BBA28369E3F2D2713F3D5F7D406D31BCF678C7329BA986
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9B5397E24C93BDA6764F5A57ED04DB86D5676CE1DABA587BE182A05F538085040B9E3D8A6E2F1AAF8AC03531299AF8F1C9B85AC199F78CA76AEE5476933E69077
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE755195A04193659F2EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006373CF509324F67ED188638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F9A74987D3CEA46F3CE65A257B7BA0F16F9789CCF6C18C3F8528715B7D10C86859CC434672EE6371117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC8C7ADC89C2F0B2A5A471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BA9C0B312567BB231DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6D795DB135F84D771089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-C1DE0DAB: 8BD88D57C5CADBC8B2710865C38675100920FC4EF0AE1D47A3B1A56EE2B804F6B226C914C996894645FD9D8A29397D6EFF55FE49A3C2BFCFC8C84E951CD0BE2F296C473AB1E14218EA052B563B0B06C67866D6147AF826D8F9A74987D3CEA46F3CE65A257B7BA0F1F972CCD2F8FE1EF1CFC4036BBF6A4EA96783167F9FF52F669C5DF10A05D560A97E15B380B3B81456F2DBB7B6E8D169880D89974173551D4FBDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3463DBE2ADA183F62F5365AFAE824A4DC0553D109B507E0B66ACCCE57BA396FD4FDF0B4FE776BF9CAD1D7E09C32AA3244CAD102FF9AC965DC66477940EF1B1E818A8CE788DE6831205DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYItFUluOT4taPMT7IP98GA==
X-Mailru-Sender: 689FA8AB762F7393C37E3C1AEC41BA5DB7031B3C293E3B0E96CEDD7D0EA3B4468F8182784CE3FA142B2697F7A04D759B04FC54F637BA925032C609A2DC06202998FD9B05CC386A12349DB15C680E247222B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_073403_964591_68F64D03 
X-CRM114-Status: GOOD (  10.15  )
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

Add initial support for Mediatek mt6582 and Prestigio
PMT5008 3G tablet, 4 uart, wdt work, init loads successfully. SMP doesn't
work.

Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
---
 arch/arm/boot/dts/mt6582.dtsi | 129 ++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt6582.dtsi

diff --git a/arch/arm/boot/dts/mt6582.dtsi b/arch/arm/boot/dts/mt6582.dtsi
new file mode 100644
index 00000000000..75539ccab78
--- /dev/null
+++ b/arch/arm/boot/dts/mt6582.dtsi
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2021 Maxim Kutnij <gtk3@inbox.ru>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "mediatek,mt6582";
+	interrupt-parent = <&sysirq>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+		};
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x2>;
+		};
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x3>;
+		};
+	};
+
+	system_clk: dummy13m {
+		compatible = "fixed-clock";
+		clock-frequency = <13000000>;
+		#clock-cells = <0>;
+	};
+
+	rtc_clk: dummy32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32000>;
+		#clock-cells = <0>;
+	};
+
+	uart_clk: dummy26m {
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+		#clock-cells = <0>;
+	};
+
+	timer: timer@11008000 {
+		compatible = "mediatek,mt6577-timer";
+		reg = <0x10008000 0x80>;
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&system_clk>, <&rtc_clk>;
+		clock-names = "system-clk", "rtc-clk";
+	};
+
+	sysirq: interrupt-controller@10200100 {
+		compatible = "mediatek,mt6582-sysirq",
+			     "mediatek,mt6577-sysirq";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10200100 0x1c>;
+	};
+
+	gic: interrupt-controller@10211000 {
+		compatible = "arm,cortex-a7-gic";
+		interrupt-controller;
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		reg = <0x10211000 0x1000>,
+		      <0x10212000 0x2000>,
+		      <0x10214000 0x2000>,
+		      <0x10216000 0x2000>;
+	};
+
+	uart0: serial@11002000 {
+		compatible = "mediatek,mt6582-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11002000 0x400>;
+		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart1: serial@11003000 {
+		compatible = "mediatek,mt6582-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11003000 0x400>;
+		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart2: serial@11004000 {
+		compatible = "mediatek,mt6582-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11004000 0x400>;
+		interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	uart3: serial@11005000 {
+		compatible = "mediatek,mt6582-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0x11005000 0x400>;
+		interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&uart_clk>;
+		status = "disabled";
+	};
+
+	watchdog: watchdog@10007000 {
+		compatible = "mediatek,mt6582-wdt",
+			     "mediatek,mt6589-wdt";
+		reg = <0x10007000 0x100>;
+	};
+};
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
