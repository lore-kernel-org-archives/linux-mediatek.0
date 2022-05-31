Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B34C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrXBXC9gYo/FycO++QKk+3Hr2Bj3c7FrnDDNohl0NUI=; b=nVhttJ+yKiyuta
	RsMBxOeQepRHPAFqq4IkIZ8067DLWe/z60Crv5v+I4fEiBBnNetsFmer2FcDM4hP2XadQ02WhKic1
	axqoCvTNz3C4G7UpP3cKmHSZHBNiwQb81VgOTR9naSts6l7xDsZHkJHiEImVkOEixXnxZphgB9jBP
	D0YJkAwMvBSWHHuKUX5Wi4iRAvVY0ZBv7ylUiYlu5DMy7dUI9aZzWjWiRgl8zi/Wxm+P5SmEXm/9g
	qEYism0Qc8wfmo/ZioZbksQPU98kbXWd4OZBUTbdEZp7cAmp+ytUjrezkuidJXwV4SBcKLeT2L9ca
	DNjYa3/N06t1Y76Qh7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0K8-00AYrG-2S; Tue, 31 May 2022 11:46:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0Jf-00AYeL-3h
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 11:45:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id p19so7871050wmg.2
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 04:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ysOdFy7JHZK3UBBDBfJdbJbrtIA4C2hQ/aDw2BjlBdM=;
        b=KWxM/rUJRj4uHbly0OCSVRrHV2yLvmgrpjVJyKz85AVaZpdFs4PA7DALPMgT7vwffY
         QJn/cLRgXwa/GzGAjTreATmkk6uYk1GZazoFJPiQcHrFhFzYAC7xE56r3X9B6/PGWASJ
         HVpycM3cbcrxswpCOloxzMEG0K2QjHq30HeQJFMGTmqjLBEwjfIa+3gxWYWHBPd/VFj0
         OzWs4P8OuKp6dWi9tHUEgc0kKXHwTv1RWOuZ86ren1b8i+rdNAFUucroQaPjCa+C29gb
         cNq5luqAdHWgX5dQqpAfR++cET8p05ns2AgBt36FAXbMNEmZ5ns7Wur7G32fgWOgKel3
         I3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ysOdFy7JHZK3UBBDBfJdbJbrtIA4C2hQ/aDw2BjlBdM=;
        b=HzI6oXjmdIfuIJXVO/nm+UaNVnk1PZRBizKWoHi6HoqeD1/yYcfXQpe3nh8S24gUj6
         tmtFCzNEu/FEFd12ahD6d5mA+Kpmof/Xy8LqGTSXD1hxnlLQ4APsAFSIVh8W55b7ocoi
         OXdhQ2XmkfdTR7vsEp7E0tSHn+bisd5N7glP2h4epqyZ3EenG48a/W2BLjjgEX1ONmNz
         oShazL3l/sJA1WJ+adgTDgtYdlc8thNC1dovj2wY45wrmfdzWvESgqFcMb3np7EI+EXr
         52p2IBBQ0B4u1gHNjQHfzdL2vhOrJdxwwu4rqF3Pp/yEx++TfwHeESEiJJPkW+A1krAD
         8Ebg==
X-Gm-Message-State: AOAM531ucjCMLQY7e8OXiNlqkLXPYWvmSFHK8QU0/nmPcoeQrJTAl2WK
	aB2uKvq+KNzTM4DKGE8qEunj0w==
X-Google-Smtp-Source: ABdhPJycyKUCddhvZ2P1lhmISgVMlGFmiDF5qyKUACKLyZ+M1suUOsfu5L1KnHN6R4G8Y6EBpmlIUA==
X-Received: by 2002:a05:600c:2305:b0:397:44a4:d3cb with SMTP id 5-20020a05600c230500b0039744a4d3cbmr22829021wmo.115.1653997536833;
        Tue, 31 May 2022 04:45:36 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id e15-20020a056000178f00b002102f2fac37sm7695660wrg.51.2022.05.31.04.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:45:36 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] arm64: dts: mediatek: mt8195: add ssusb support
Date: Tue, 31 May 2022 13:45:26 +0200
Message-Id: <20220531114526.144275-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531114526.144275-1-fparent@baylibre.com>
References: <20220531114526.144275-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_044539_188044_3A0F3F85 
X-CRM114-Status: GOOD (  13.58  )
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

Add SSUSB support for MT8195. In order to not break any boards, this
commit also enable SSUSB for every board that has xhci0 enabled. The
boards are configured as host-only, in order to not change the current
behavior of the interface.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts |  5 +++
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts  |  5 +++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi     | 37 ++++++++++++++------
 3 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 4fbd99eb496a..317922fdb72c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -400,6 +400,11 @@ &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&ssusb {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
index db25a515e420..d49ae8605e67 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -138,6 +138,11 @@ pins {
 	};
 };
 
+&ssusb {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &u3phy0 {
 	status="okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index b57e620c2c72..d076a376bdcc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -555,25 +555,40 @@ spis1: spi@1101e000 {
 			status = "disabled";
 		};
 
-		xhci0: usb@11200000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x11200000 0 0x1000>,
+		ssusb: usb@11201000 {
+			compatible ="mediatek,mt8195-mtu3", "mediatek,mtu3";
+			reg = <0 0x11201000 0 0x2dff>,
 			      <0 0x11203e00 0 0x0100>;
 			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
 			phys = <&u2port0 PHY_TYPE_USB2>,
 			       <&u3port0 PHY_TYPE_USB3>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
 				 <&topckgen CLK_TOP_SSUSB_REF>,
-				 <&apmixedsys CLK_APMIXED_USB1PLL>,
 				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "xhci_ck";
+			clock-names = "sys_ck", "ref_ck", "mcu_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
 			status = "disabled";
+
+			xhci0: usb@11200000 {
+				compatible = "mediatek,mt8195-xhci",
+					     "mediatek,mtk-xhci";
+				reg = <0 0x11200000 0 0x1000>;
+				reg-names = "mac";
+				interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+				assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
+						  <&topckgen CLK_TOP_SSUSB_XHCI>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+							 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+				clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+					 <&topckgen CLK_TOP_SSUSB_REF>,
+					 <&apmixedsys CLK_APMIXED_USB1PLL>,
+					 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
+				clock-names = "sys_ck", "ref_ck", "mcu_ck", "xhci_ck";
+				status = "disabled";
+			};
 		};
 
 		mmc0: mmc@11230000 {
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
