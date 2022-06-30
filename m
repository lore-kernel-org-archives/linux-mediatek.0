Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8EAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTyVByW4G/VecPm2TF+qOEzpB27+vuJjp8UrdLQIO30=; b=ZfZaXZ4LHfbJRs04r/2Fv5oyqH
	7S9CDEdadHfVsG1ApntO1JhaUbkP4silcORGNvyCQp2NO5G0b4867IePeGfu3yosZIbglGggNIN+4
	gPi3A70ZhTW/qdfXTUJBIITFeR+VC8Vf4JoAdszBom10wVzRpUgxDgzZlwzvMM5jx+oXSkddYNPgs
	JyjK+8+3IhQSE7VQW2AyiXTY/hOkBymXkZGKKQh2bf06EqqWDjT9Hav8QNDxNSN7QGRDzdH2xbiqo
	XckF1RlBBIMQsqwgvA/1xp//LLQ/fm5UlGZ01G95KTXTR1CWNOIMJ916HCpebsuFeJuohSdQSnZdC
	lXSbK60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wFv-000LT0-3c; Thu, 30 Jun 2022 15:38:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAh-000Ia8-7a; Thu, 30 Jun 2022 15:33:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 41477660197D;
	Thu, 30 Jun 2022 16:33:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603214;
	bh=SX4P7RsJewzaMEBrvT46jeE3YycPiAePm3ZFNcwi5O0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BuaUnODh1qw4OyIyA6rE3Sii52gGiK6JGI0LeZCFG/rtoiXjA51r6pC8Up3sWiBR/
	 hxrwfQU4NsW7YyHFG/G+CZTkyPQvNwNiOBZeVJwGepNSWxEYENoeUry8zMj9hOJZOb
	 QnrRqlXecmw7k+Z4Vn7rYgqe1v1eOuZ5kDrhhnMqnZyh/5OoLsSOmi9pHyqc1RCD+4
	 myxssKckdPykteL25QLzc6Ggz97Ik6Yij1bFMdJxaeZfF2wM4AH88/I8wKsByx2zvN
	 9BDzKjrRG3Lz0IUdXdY0Hl5PQzYlhzqa6ECWfLqam39/vR/qmhUXoyzNzbr0LhadNq
	 485JB2fL0wSdA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 11/11] arm64: dts: mediatek: cherry: Add I2C-HID touchscreen on I2C4
Date: Thu, 30 Jun 2022 17:33:16 +0200
Message-Id: <20220630153316.308767-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083335_474267_BA125375 
X-CRM114-Status: GOOD (  10.53  )
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

This platform carries a HID compatible I2C touchscreen on the i2c4 bus,
but it may either be at 0x10, or at 0x15, depending on the board model:
declare both as disabled in the common Cherry device-tree and enable
the required touchscreen node on a per-board basis.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  4 ++
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |  4 ++
 .../dts/mediatek/mt8195-cherry-tomato-r3.dts  |  4 ++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 41 +++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 17e9e4d6f6ab..2837fb24c84c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -9,3 +9,7 @@ / {
 	model = "MediaTek Tomato (rev1) board";
 	compatible = "google,tomato-rev1", "google,tomato", "mediatek,mt8195";
 };
+
+&ts_10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
index ee5fd07ad573..4e1d1a1887c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -29,3 +29,7 @@ pins-low-power-pcie0-disable {
 		bias-pull-down;
 	};
 };
+
+&ts_10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
index 792f6c83e88b..4a45884203ea 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts
@@ -30,3 +30,7 @@ pins-low-power-pcie0-disable {
 		bias-pull-down;
 	};
 };
+
+&ts_10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 2687c6d40ac1..7a32c7006a5a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -143,6 +143,31 @@ &i2c4 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pin>;
+
+	/* Depending on the machine, the TS may be at 0x10 or at 0x15 */
+	ts_10: touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		hid-descr-addr = <0x0001>;
+		interrupts-extended = <&pio 92 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		post-power-on-delay-ms = <10>;
+		vdd-supply = <&pp3300_s3>;
+		status = "disabled";
+	};
+
+	ts_15: touchscreen@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+		hid-descr-addr = <0x0001>;
+		interrupts-extended = <&pio 92 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		post-power-on-delay-ms = <10>;
+		vdd-supply = <&pp3300_s3>;
+		status = "disabled";
+	};
 };
 
 &i2c5 {
@@ -609,6 +634,22 @@ subpmic_pin_irq: pins-subpmic-int-n {
 			bias-pull-up;
 		};
 	};
+
+	touchscreen_pins: touchscreen-default-pins {
+		pins-int-n {
+			pinmux = <PINMUX_GPIO92__FUNC_GPIO92>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+		};
+		pins-rst {
+			pinmux = <PINMUX_GPIO56__FUNC_GPIO56>;
+			output-high;
+		};
+		pins-report-sw {
+			pinmux = <PINMUX_GPIO57__FUNC_GPIO57>;
+			output-low;
+		};
+	};
 };
 
 &pmic {
-- 
2.35.1


