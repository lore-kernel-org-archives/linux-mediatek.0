Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A5DC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqwlyrcWthPgDj5Mlnz71SSD/KhEZCHWRkRhnh/1Jgg=; b=j0X8Lopz5mRaAlnwailibD/lIm
	nS7atJ3ONz0QJhl5uMgL4yNI0ZFiJKAgTiZ/pXP7zqjQN2Ep55HJ+zrv6BMW9djjJlD1vPXs3CIDx
	ffCusu9adW13F9KtuRD0F3HT24BHsiJm3ZBSJvAmbWSfdn/sC3bfe5jRg06Mls/FIj29dBH9DPVPw
	yPK9OTC+gkVXk8+keJOAt2TgEeI8G7T0f72owQAfGTiGC16wJBZVV6MylxhuH6VHg5wO7ltXzrpwX
	CkqIkNcMgkfNUx5xEmnJJPk66Tku2ocTJEOC29ecf7M0/vwvbm2DZ1uNe0K+Ob2KKBcBrrGsI/aDf
	hzO4TkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pflet-005Ba7-1Q;
	Fri, 24 Mar 2023 17:56:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfldB-005ALt-20;
	Fri, 24 Mar 2023 17:55:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 997DF660313A;
	Fri, 24 Mar 2023 17:55:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680512;
	bh=cWKkAzJmflHlylToMK1QImQEca35moH/Qy5BEXPVfYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9xkCyeWIsLtYEjjp94iVfDR4aC8F0rHjKCupNZfUdossrimrGdGe5MNC+DlYv3+L
	 nH//JL767JRXZyx8FxlyNjKbvy2LVwMNagkbC0aazJBVfiOFEAf32Aakwr9t+DOG6Z
	 bj6JfIpqtP0tR9sD1pn1midXV72TC7uMGP95TihQV5QwyZUGVA6KxaC3vqpZbLtszd
	 onXiuu8YE/gr0yD43danNu4JdPmim/GOdwiWgY0pn5voVxq4iqNw1aA64tZT4L9lgs
	 O/MNYGxiemM57/1oYT2PGfjukB+KhRzgk02nbF8sTt93DFblr5Qxxo0J0lIcE+K7Is
	 uQoZEgvOr1P/Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 13/18] arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
Date: Fri, 24 Mar 2023 18:54:51 +0100
Message-Id: <20230324175456.219954-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105513_828523_812306EC 
X-CRM114-Status: UNSURE (   7.83  )
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
devices attached on the Sony Xperia M5 smartphone.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 52ce3284a46f..6df1c848e2d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -55,7 +55,71 @@ &fhctl {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+};
+
 &pio {
+	i2c0_pins: i2c0-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
+				 <PINMUX_GPIO46__FUNC_SCL0>;
+			input-enable;
+		};
+	};
+
+	i2c1_pins: i2c1-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO125__FUNC_SDA1>,
+				 <PINMUX_GPIO126__FUNC_SCL1>;
+			bias-disable;
+		};
+	};
+
+	i2c2_pins: i2c2-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO43__FUNC_SDA2>,
+				 <PINMUX_GPIO44__FUNC_SCL2>;
+			bias-disable;
+		};
+	};
+
+	i2c3_pins: i2c3-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO136__FUNC_SDA3>,
+				 <PINMUX_GPIO137__FUNC_SCL3>;
+			bias-disable;
+		};
+	};
+
+	i2c4_pins: i2c4-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO100__FUNC_SDA4>,
+				 <PINMUX_GPIO101__FUNC_SCL4>;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-rx {
 			pinmux = <PINMUX_GPIO113__FUNC_URXD0>;
-- 
2.40.0


