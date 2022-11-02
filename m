Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CB2C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 19:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c69/I4VqIWEjsL/udC+BvkgpkV8rqlLvIFN0yYUv6e0=; b=B73KE1PYs4iPM5U39z6JlSLN1P
	VHUNcQK6/CFpr+JLzoKVZatonQwr5ZxUdb9Xz9R3GBrlKU9CuhlbEmSidAW7T/wtBwpDrcwaKylJ7
	mL5lwArfobb/KzjiwHT1fEGvs6eaoocbp5CbNXKwYSTxVN/NTeyRG2vfaXcbY8GNSYaH5iEPYZVcO
	XxhiNH6QYzpkgJHtX+IVvHeOZWefX7F8BTy9z5tafpENJ2AcbxnEKytyz52CGgw37yVrBdjnx3tAC
	hl4yJ5CP3IS0w88QYSs/uxpRDxBAh1Rl7ya8YmNKL8hcQBdU+bdwJ6v5MvBrHu2blp1JyTw3V4U5o
	1mR23kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4o-00DTBH-Gq; Wed, 02 Nov 2022 19:07:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4D-00DSRy-JM; Wed, 02 Nov 2022 19:06:27 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 19A4366028F8;
	Wed,  2 Nov 2022 19:06:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667415984;
	bh=cAWS2o7ezo8lcFTLvtHcfgbNs2i5XRzG1MatYzmAa7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PG6t0H5cZwbo4xAkZShlrqbnZL965LVlR0PxoTqsItZVoxk392J3IfLeTwAR2CUBa
	 oW87ZVKbApzTsorMEeKZ+frpqCI/dhiUzqosZU7yjd/VVfdX6XEp7hNzj1QTmuOuFw
	 N/SLnt4MC244GyHTMFkq+sbuTCAzTtSsgBgWJsMKQtzwemJVfe5V6tVvNVk6W4REWR
	 /e8a7AwBxNKFaNGuuMqirgaLtbdyKOn2iQInzq0Y03umd4TPduhnvdnMw5rl4R4p1p
	 W/d4TgHvZCa1hOt1hfZaOyC6HQCvGlXi4oeDICIbV1EY4rWTX4DIvjrtCfki+zNss9
	 acIOQT9ZOYtSg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/5] arm64: dts: mediatek: asurada: Add display backlight
Date: Wed,  2 Nov 2022 15:06:08 -0400
Message-Id: <20221102190611.283546-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102190611.283546-1-nfraprado@collabora.com>
References: <20221102190611.283546-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_120625_798296_CEC63968 
X-CRM114-Status: GOOD (  10.75  )
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

Add the display backlight for the Asurada platform. It relies on the
display PWM controller, so also enable and configure this component.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

(no changes since v1)

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fafca7428539..666021ca4d4f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -23,6 +23,16 @@ memory@40000000 {
 		reg = <0 0x40000000 0 0x80000000>;
 	};
 
+	backlight_lcd0: backlight-lcd0 {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 500000>;
+		power-supply = <&ppvar_sys>;
+		enable-gpios = <&pio 152 0>;
+		brightness-levels = <0 1023>;
+		num-interpolated-steps = <1023>;
+		default-brightness-level = <576>;
+	};
+
 	pp1000_dpbrdg: regulator-1v0-dpbrdg {
 		compatible = "regulator-fixed";
 		regulator-name = "pp1000_dpbrdg";
@@ -838,6 +848,17 @@ pins-pcie-en-pp3300-wlan {
 		};
 	};
 
+	pwm0_pins: pwm0-default-pins {
+		pins-pwm {
+			pinmux = <PINMUX_GPIO40__FUNC_DISP_PWM>;
+		};
+
+		pins-inhibit {
+			pinmux = <PINMUX_GPIO152__FUNC_GPIO152>;
+			output-high;
+		};
+	};
+
 	scp_pins: scp-pins {
 		pins-vreq-vao {
 			pinmux = <PINMUX_GPIO195__FUNC_SCP_VREQ_VAO>;
@@ -899,6 +920,13 @@ &pmic {
 	interrupts-extended = <&pio 214 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&pwm0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pins>;
+};
+
 &scp {
 	status = "okay";
 
-- 
2.38.1


