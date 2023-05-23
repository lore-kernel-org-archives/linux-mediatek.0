Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8E3C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 07:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WxBts+izImma4dqhNXYtF5Lmlti9eOhyq6o1cmpGCW4=; b=1BOwCVIeT1mL8kdQqX6Y2uT+xJ
	jKW0q3Dy8yjM2Kia7Q0DKLcALPaj8QB6qdAb6XwZ7TgV1Z1mI95munEdTL5L11jBx3o1ig12A/+U2
	NOhadOgJMet9JxlaY85TVo8cpVXVEx78Q38T3O6tMqNAFtLiV8hdSQVv4GLy2PmSn23GRY5F+P+8v
	FMnY9u0Tj7BthE/WSEbgFHgV6UqgoMv0CgbrCILiVoBYo06O5sCXlt8t7/CtjDbgGenxMclUbIvVM
	GCRWCAjUBmNDMk6NsUXIjULqTi+oJW95aWfSv13XVmQT87wJfyS2bSBXqo7Of7BsxW8QemCBv3TkZ
	oGfn3JbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1M0E-00999m-1Y;
	Tue, 23 May 2023 07:00:14 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1M0A-009985-10;
	Tue, 23 May 2023 07:00:11 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTP id 0CC4980B5;
	Tue, 23 May 2023 07:00:07 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mips: dts: ralink: mt7628a: Unify pinctrl-single pin group nodes
Date: Tue, 23 May 2023 09:59:58 +0300
Message-Id: <20230523065959.15831-1-tony@atomide.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_000010_386304_B9A29530 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We want to unify the pinctrl-single pin group nodes to use naming "pins".
Otherwise non-standad pin group names will add make dtbs checks errors
when the pinctrl-single yaml binding gets merged.

Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/mips/boot/dts/ralink/mt7628a.dtsi | 40 +++++++++++++-------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -51,85 +51,85 @@ pinmux: pinmux@60 {
 			pinctrl-single,register-width = <32>;
 			pinctrl-single,function-mask = <0x1>;
 
-			pinmux_gpio_gpio: pinmux_gpio_gpio {
+			pinmux_gpio_gpio: gpio-gpio-pins {
 				pinctrl-single,bits = <0x0 0x0 0x3>;
 			};
 
-			pinmux_spi_cs1_cs: pinmux_spi_cs1_cs {
+			pinmux_spi_cs1_cs: spi-cs1-cs-pins {
 				pinctrl-single,bits = <0x0 0x0 0x30>;
 			};
 
-			pinmux_i2s_gpio: pinmux_i2s_gpio {
+			pinmux_i2s_gpio: i2s-gpio-pins {
 				pinctrl-single,bits = <0x0 0x40 0xc0>;
 			};
 
-			pinmux_uart0_uart: pinmux_uart0_uart0 {
+			pinmux_uart0_uart: uart0-uart0-pins {
 				pinctrl-single,bits = <0x0 0x0 0x300>;
 			};
 
-			pinmux_sdmode_sdxc: pinmux_sdmode_sdxc {
+			pinmux_sdmode_sdxc: sdmode-sdxc-pins {
 				pinctrl-single,bits = <0x0 0x0 0xc00>;
 			};
 
-			pinmux_sdmode_gpio: pinmux_sdmode_gpio {
+			pinmux_sdmode_gpio: sdmode-gpio-pins {
 				pinctrl-single,bits = <0x0 0x400 0xc00>;
 			};
 
-			pinmux_spi_spi: pinmux_spi_spi {
+			pinmux_spi_spi: spi-spi-pins {
 				pinctrl-single,bits = <0x0 0x0 0x1000>;
 			};
 
-			pinmux_refclk_gpio: pinmux_refclk_gpio {
+			pinmux_refclk_gpio: refclk-gpio-pins {
 				pinctrl-single,bits = <0x0 0x40000 0x40000>;
 			};
 
-			pinmux_i2c_i2c: pinmux_i2c_i2c {
+			pinmux_i2c_i2c: i2c-i2c-pins {
 				pinctrl-single,bits = <0x0 0x0 0x300000>;
 			};
 
-			pinmux_uart1_uart: pinmux_uart1_uart1 {
+			pinmux_uart1_uart: uart1-uart1-pins {
 				pinctrl-single,bits = <0x0 0x0 0x3000000>;
 			};
 
-			pinmux_uart2_uart: pinmux_uart2_uart {
+			pinmux_uart2_uart: uart2-uart-pins {
 				pinctrl-single,bits = <0x0 0x0 0xc000000>;
 			};
 
-			pinmux_pwm0_pwm: pinmux_pwm0_pwm {
+			pinmux_pwm0_pwm: pwm0-pwm-pins {
 				pinctrl-single,bits = <0x0 0x0 0x30000000>;
 			};
 
-			pinmux_pwm0_gpio: pinmux_pwm0_gpio {
+			pinmux_pwm0_gpio: pwm0-gpio-pins {
 				pinctrl-single,bits = <0x0 0x10000000
 						       0x30000000>;
 			};
 
-			pinmux_pwm1_pwm: pinmux_pwm1_pwm {
+			pinmux_pwm1_pwm: pwm1-pwm-pins {
 				pinctrl-single,bits = <0x0 0x0 0xc0000000>;
 			};
 
-			pinmux_pwm1_gpio: pinmux_pwm1_gpio {
+			pinmux_pwm1_gpio: pwm1-gpio-pins {
 				pinctrl-single,bits = <0x0 0x40000000
 						       0xc0000000>;
 			};
 
-			pinmux_p0led_an_gpio: pinmux_p0led_an_gpio {
+			pinmux_p0led_an_gpio: p0led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x4 0xc>;
 			};
 
-			pinmux_p1led_an_gpio: pinmux_p1led_an_gpio {
+			pinmux_p1led_an_gpio: p1led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x10 0x30>;
 			};
 
-			pinmux_p2led_an_gpio: pinmux_p2led_an_gpio {
+			pinmux_p2led_an_gpio: p2led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x40 0xc0>;
 			};
 
-			pinmux_p3led_an_gpio: pinmux_p3led_an_gpio {
+			pinmux_p3led_an_gpio: p3led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x100 0x300>;
 			};
 
-			pinmux_p4led_an_gpio: pinmux_p4led_an_gpio {
+			pinmux_p4led_an_gpio: p4led-an-gpio-pins {
 				pinctrl-single,bits = <0x4 0x400 0xc00>;
 			};
 		};
-- 
2.40.1

