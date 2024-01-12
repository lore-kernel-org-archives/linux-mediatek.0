Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90234C47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwcrRJnfXGgxScTWwQSdk99kkNZzPTP8Aa+1loXjvSY=; b=bCdT6kJwnbRu5Si4xv9BvYY9Rr
	FDt3kOKhRoMKnTjlSIw4N+fdAuAgAgv+5FU1pKIHmMC7c6otuklFTz/jDQ1Z442umGW/7Od+dfIAt
	WPvXEGi4eK8Ks6LHnlQUDzG3H0z1ZXkltjePCxOSiQvm+gxkXL2SSuF50PoXFZjM+w1kkh0hkXRrz
	iqbVyjOwVAi95nnlG5D5zSrTxRooMvwdnM4xnNo8inK8hC2Q184KWT1N9WMxyWKATgHpD271gdn5y
	IMjc5Jo8RwQYya3PtkhZ052/Q5h5sFmFK32UI9UgB4PARwpUmlamRFTNuGYoFVpO2aYHH8xrmuBPY
	l3Baw/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7p-002NEZ-1J;
	Fri, 12 Jan 2024 09:46:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7e-002N6f-2M;
	Fri, 12 Jan 2024 09:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052801;
	bh=zq877pNGDNR9QpP0tnh0GOjiJi6f38kNnwjwlSPV6gE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kbqici4FvY55mGW4HoF+8HYjWOjjAZL1Dj0IvISss/jPXd+lauI9xo3RiMV8AoBGx
	 ybU2U/UB/ADjB2Wo6jZxFrP435np0ECk5fijdNm/4QaPkz9P8k1JF8Jugw2TZLCCeS
	 XOLlbI+pmmSp0DwzBZQ7rgsbnWWL/Ay6ieAFTj1F7SUV2RORF3lUzJCmMhEbxbCyOP
	 ZPCkyNQwej12I59W7rD6rly+MJZLrahmAYCQfk6VGKbsrXqGx+hDj+nBxQOXmw8J1y
	 pBRLTpL8blyn07PzXRuQVhrGxxyY8Ql7MMy3taTWcnnziWYsTudo3cw+xwz00HzmFA
	 nmskGKFke9tFQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B00813782032;
	Fri, 12 Jan 2024 09:46:40 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 03/15] arm64: dts: mediatek: radxa-nio-12l: Enable I2C 2/4/6 busses
Date: Fri, 12 Jan 2024 10:46:20 +0100
Message-ID: <20240112094632.66310-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014642_900924_B72C5451 
X-CRM114-Status: UNSURE (   9.44  )
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

Properly configure and enable the three i2c controllers that have
devices attached and/or have pins exposed on the board connectors.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 2c4d6805b668..79358e1a3e60 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -85,7 +85,61 @@ apu_mem: memory@62000000 {
 	};
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* iTE IT5205FN Type-C 3:2 Alt. mode passive MUX at 0x48 */
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* I2C4 exposed at 39-pins MIPI-LCD connector */
+};
+
+&i2c6 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&i2c6_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/* MT6360 PMIC at 0x34 */
+};
+
 &pio {
+	i2c2_pins: i2c2-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
+				 <PINMUX_GPIO13__FUNC_SCL2>;
+			bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+			drive-strength = <6>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,
+				 <PINMUX_GPIO17__FUNC_SCL4>;
+			bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+			drive-strength-microamp = <1000>;
+		};
+	};
+
+	i2c6_pins: i2c6-pins {
+		pins {
+			pinmux = <PINMUX_GPIO25__FUNC_SDA6>,
+				 <PINMUX_GPIO26__FUNC_SCL6>;
+			bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
-- 
2.43.0


