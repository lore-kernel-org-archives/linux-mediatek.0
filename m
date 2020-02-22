Return-Path: <SRS0=+7pC=4K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22918C35671
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFEDD206ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GP1XBCrU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCeJQWqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFEDD206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aCjcYrde4KaQdtKDAI8XyxSSVfEjPt8xZ0rJazK/WBs=; b=GP1XBCrU6cqroEvGgoIWE9xTu3
	/hZ6AJ392rkvRGBOzGAw30VAKBYlsPkftjWMMqRAovTzjyVuL7yWJJFXKIAHQFeob9QS4CwedvHKk
	PaT28zyt59KKcvY2RkUaMkzTT1NwXfREV9Lbbudw8pgP7SKVB4fWQrS+fLRs5JqbCPKc6MOJ01prN
	AhIjfYFwnn4YCCboO/uQrh4ndIhgIN1Lv1tS/7vvStvdrJh2HjMNwkP5HWAATb0K9WmsoXAHXLqtE
	riw9V7IGhPAVZAkevs63adGH9JK/vY5Nd3wvuzKLC7RPh+Ro6Tbh9JvZPniv3l1TQqKtghZrwE9vk
	L5WU7VKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5Xb4-00018c-9a; Sat, 22 Feb 2020 16:25:42 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5Xac-0000dj-BO
 for linux-mediatek@lists.infradead.org; Sat, 22 Feb 2020 16:25:16 +0000
Received: by mail-pf1-x441.google.com with SMTP id 4so2947346pfz.9
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Feb 2020 08:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ToHubF4KECCMrwSTfQauUnB07RA2vKU+QmGUx0zj7dk=;
 b=DCeJQWqMYEktzqwzYPWXrCtBjxlTN8VoLK6rTnVSJ+DyThaYmZG4zMy3J0uAcv5Xl6
 NTFZV5I50yPOniS5gf0xWJH2PZ+CmoCgCyT0RGbxaOHZBpXWkLCoD58p/vpgq9wR7s6r
 vJwrEd4Qdlr+awqgO1zD6srjSxbvwRSNN/oYR4kEz8evxlBLsVi5CeOULy/e5DkSgF/b
 1wrr6XV6qrvNLX4R699w4FgeGpTYIIqQoIEH34dlqPzw2pbaP9tiidjLStIO1d5eAO3d
 KUlN4/nws3fNhI+lLEsiGP+3hu+n5gtOQgjkxmo4yB6uOAVRNUDoMnlaqrhHzsLUZXSk
 QVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ToHubF4KECCMrwSTfQauUnB07RA2vKU+QmGUx0zj7dk=;
 b=K1Cu6jLQ8Ja/w75z86HEWdTItUxjgUH67bg++QbhFNQB0QMz2Lwr1as/DKNzUar3yy
 q3fwjXHyx9P4GACMnb9XK+2MOlwr8WM5taGAC51YUYEeaFPxfKCTIN+A1+CYfMXm3Dg+
 rIkdOR5a+SGfUHuaFMlcuUCED4EJZgYOdcau9T0Q+W3O/3TRRq99RB28SUCEZqPPfxXo
 E1Ebhy1qzMi3YgobHVrGcmwmiOdmvMCx7T4dkTK5rB7b+88fMm/zVRaUt7aVn0C2W9I4
 tVt5HNFvdBCQJqgTMyoDZlX3DIHQ3pA+Ua5mYfNSMv7zAMqbPiD5+pSBqKI4jfJJrS4O
 bmhA==
X-Gm-Message-State: APjAAAVSNe1dT3mxipXhz5u26Showk2puhTspon5rFFmQ3S/AxD7AXgU
 2eejqvwu7ZJzohT02yavsB0Z
X-Google-Smtp-Source: APXvYqxqECy1swcSUk5Q/XFynMYjNqC7uwTEp6QMHAMY0oAVrNhg714YYtW+z6ull/nvzMusU+x6RQ==
X-Received: by 2002:a63:120f:: with SMTP id h15mr45746851pgl.235.1582388712857; 
 Sat, 22 Feb 2020 08:25:12 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:801:b38c:89e8:305c:23c4:b77f])
 by smtp.gmail.com with ESMTPSA id q17sm6851296pfg.123.2020.02.22.08.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 08:25:12 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH 2/4] arm64: dts: mediatek: Add I2C support for MT6797 SoC
Date: Sat, 22 Feb 2020 21:54:42 +0530
Message-Id: <20200222162444.11590-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
References: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_082514_421510_CE7BBAE3 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 adamboardman@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add I2C support for Mediatek MT6797 SoC. There are a total of 8 I2C
controllers in this SoC (2 being shared) and they are same as the
controllers present in MT6577 SoC. Hence, the driver support is added with
DT fallback method.

As per the datasheet, there are controllers with _imm prefix like i2c2_imm
and i2c3_imm. These appears to be in different memory regions but sharing
the same pins with i2c2 and i2c3 respectively. Since there is no clear
evidence of what they really are, I've adapted the numbering/naming scheme
from the downstream code by Mediatek.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 220 +++++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 2b2a69c7567f..22f093960d27 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -155,6 +155,62 @@
 					 <MT6797_GPIO233__FUNC_UTXD1>;
 			};
 		};
+
+		i2c0_pins_a: i2c0 {
+			pins0 {
+				pinmux = <MT6797_GPIO37__FUNC_SCL0_0>,
+					 <MT6797_GPIO38__FUNC_SDA0_0>;
+			};
+		};
+
+		i2c1_pins_a: i2c1 {
+			pins1 {
+				pinmux = <MT6797_GPIO55__FUNC_SCL1_0>,
+					 <MT6797_GPIO56__FUNC_SDA1_0>;
+			};
+		};
+
+		i2c2_pins_a: i2c2 {
+			pins2 {
+				pinmux = <MT6797_GPIO96__FUNC_SCL2_0>,
+					 <MT6797_GPIO95__FUNC_SDA2_0>;
+			};
+		};
+
+		i2c3_pins_a: i2c3 {
+			pins3 {
+				pinmux = <MT6797_GPIO75__FUNC_SDA3_0>,
+					 <MT6797_GPIO74__FUNC_SCL3_0>;
+			};
+		};
+
+		i2c4_pins_a: i2c4 {
+			pins4 {
+				pinmux = <MT6797_GPIO238__FUNC_SDA4_0>,
+					 <MT6797_GPIO239__FUNC_SCL4_0>;
+			};
+		};
+
+		i2c5_pins_a: i2c5 {
+			pins5 {
+				pinmux = <MT6797_GPIO240__FUNC_SDA5_0>,
+					 <MT6797_GPIO241__FUNC_SCL5_0>;
+			};
+		};
+
+		i2c6_pins_a: i2c6 {
+			pins6 {
+				pinmux = <MT6797_GPIO152__FUNC_SDA6_0>,
+					 <MT6797_GPIO151__FUNC_SCL6_0>;
+			};
+		};
+
+		i2c7_pins_a: i2c7 {
+			pins7 {
+				pinmux = <MT6797_GPIO154__FUNC_SDA7_0>,
+					 <MT6797_GPIO153__FUNC_SCL7_0>;
+			};
+		};
 	};
 
 	scpsys: scpsys@10006000 {
@@ -233,6 +289,170 @@
 		status = "disabled";
 	};
 
+	i2c0: i2c@11007000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <0>;
+		reg = <0 0x11007000 0 0x1000>,
+		      <0 0x11000100 0 0x80>;
+		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C0>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "main", "dma";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c1: i2c@11008000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <1>;
+		reg = <0 0x11008000 0 0x1000>,
+		      <0 0x11000180 0 0x80>;
+		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C1>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "main", "dma";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c8: i2c@11009000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <8>;
+		reg = <0 0x11009000 0 0x1000>,
+		      <0 0x11000200 0 0x80>;
+		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C2>,
+			 <&infrasys CLK_INFRA_AP_DMA>,
+			 <&infrasys CLK_INFRA_I2C2_ARB>;
+		clock-names = "main", "dma", "arb";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c9: i2c@1100d000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <9>;
+		reg = <0 0x1100d000 0 0x1000>,
+		      <0 0x11000280 0 0x80>;
+		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C3>,
+			 <&infrasys CLK_INFRA_AP_DMA>,
+			 <&infrasys CLK_INFRA_I2C3_ARB>;
+		clock-names = "main", "dma", "arb";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c6: i2c@1100e000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <6>;
+		reg = <0 0x1100e000 0 0x1000>,
+		      <0 0x11000500 0 0x80>;
+		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C_APPM>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "main", "dma";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c7: i2c@11010000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <7>;
+		reg = <0 0x11010000 0 0x1000>,
+		      <0 0x11000580 0 0x80>;
+		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C_GPUPM>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "main", "dma";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c4: i2c@11011000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <4>;
+		reg = <0 0x11011000 0 0x1000>,
+		      <0 0x11000300 0 0x80>;
+		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C4>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "main", "dma";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c2: i2c@11013000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <2>;
+		reg = <0 0x11013000 0 0x1000>,
+		      <0 0x11000400 0 0x80>;
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C2_IMM>,
+			 <&infrasys CLK_INFRA_AP_DMA>,
+			 <&infrasys CLK_INFRA_I2C2_ARB>;
+		clock-names = "main", "dma", "arb";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c3: i2c@11014000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <3>;
+		reg = <0 0x11014000 0 0x1000>,
+		      <0 0x11000480 0 0x80>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C3_IMM>,
+			 <&infrasys CLK_INFRA_AP_DMA>,
+			 <&infrasys CLK_INFRA_I2C3_ARB>;
+		clock-names = "main", "dma", "arb";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	i2c5: i2c@1101c000 {
+		compatible = "mediatek,mt6797-i2c",
+			     "mediatek,mt6577-i2c";
+		id = <5>;
+		reg = <0 0x1101c000 0 0x1000>,
+		      <0 0x11000380 0 0x80>;
+		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infrasys CLK_INFRA_I2C5>,
+			 <&infrasys CLK_INFRA_AP_DMA>;
+		clock-names = "main", "dma";
+		clock-div = <10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	mmsys: mmsys_config@14000000 {
 		compatible = "mediatek,mt6797-mmsys", "syscon";
 		reg = <0 0x14000000 0 0x1000>;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
