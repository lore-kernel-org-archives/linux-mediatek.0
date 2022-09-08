Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9F5C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkcNh7k32e9rmFUZ8U0gyDoAHZ0+KNpS49Bv3ZYgwjw=; b=H6Yx2aQFh7Fug8Ts7wSbusNr21
	NCdkBZZcXnT2j5g5a6+Yo7Qzj2b4/h7D8lUWjgLJWt6OllwC1XlCMwkoZtdMgVoyO5MlB8WmkvNrj
	ibyf2Z8WapwBj6Jk58mu2SmtsLFYcXqfeJVVgUvpuaIGLM9prG7ivL/grDDuUXvswX7lM9YB/nxmY
	m5iDX2XYMyTl8Lep0PGXNolAMbjfhT+qvtCNPC0ZiUHR8cZvxaYt+A2oZPGmzRdyeVUCwaR+pv5dM
	CY1h2OoTqytaQ+tCB0iKKoTPD5kSpKcCXWXtckB5sqrfaJeVx7VMp165uJAbt1hc0H8IGzv/ORh2A
	ZnQuh8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL6K-006BJv-0Y; Thu, 08 Sep 2022 17:14:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWL4N-0069ac-6u; Thu, 08 Sep 2022 17:12:04 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A9D7D6601FAB;
	Thu,  8 Sep 2022 18:12:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662657122;
	bh=rOUGO4cGjU8jRBffaVEnBvlEo3ADSgzcmPqVWtblivg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W4yZZ88/tyH+Mtz54J7dUPKtAaHu9sulHCvGhJW0XceEyf8xM1bOtseUPo5hgcJH7
	 c9D+t/8/oXiBbUIKijjlEigm9H47MnfqvDaxSD/qGlTVe4rrGitDjT6a7OPx6NfmRI
	 wGusqe9oxSjjCkXqhrpMSX0ePdYMSMYhD7LaY5FobGoFrjzLqscx/nJ8Z2wK2Qyyuf
	 I5F9lkBDNROwsJLXm5zWVH4HW/Vtb60zHdchwPRT/rf1LIOd+RSyUKcZmT8PxcgOCQ
	 0P/AM0UQhCDovEesQEDKNiiwIVN7IqgcUCTWdj1vt6mLj2E/2ftgECTPO8kLtT/ful
	 tPd0UqN3wFyVg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] arm64: dts: mediatek: asurada: Add display backlight
Date: Thu,  8 Sep 2022 13:11:52 -0400
Message-Id: <20220908171153.670762-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908171153.670762-1-nfraprado@collabora.com>
References: <20220908171153.670762-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_101203_430418_BC23EF1C 
X-CRM114-Status: GOOD (  11.01  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 1d99e470ea1a..33ef55b6dbe1 100644
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
@@ -840,6 +850,17 @@ pins-pcie-en-pp3300-wlan {
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
@@ -901,6 +922,13 @@ &pmic {
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
2.37.3


