Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55146C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFvR1Hwtn77O3A5ap2KSShMNa+JCcU5EDid7D9Ce5xw=; b=JsZuClnf1vQ8qp
	angcw8UdLzYAEVZhZpFfVb5Y0IPZdLq8POXqIC1jdI0ZS2yvTDEZOnsESwDJT3z3bo6FZtn0ijDbQ
	Cd5wkkW/QhcdbhIft9wNVfa1I7QlgwPDDgFa5Wkuq0llwgRuaHlMOBa5tiPfeLDc6htVpx1CAL/Dx
	3m8SgY+qU0AYu+nyAz2e348jZ2djOqjACweH+VDJO1UCEioJcjcoWPw5DV48XKM5cuI7jZWjzTpwM
	lr/OgSkvSBsugRPWsSAp1A4Vy06hERa0nJAJS+rUwwKBd5yV7zAllrLUECujjjIiN8Ic+/+xxM4AB
	JHF0IttK6X230+MhqA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesbn-000000077XO-1RBy;
	Thu, 24 Jul 2025 09:51:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVW-00000006u6S-0WBL;
	Thu, 24 Jul 2025 08:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346452;
	bh=TVuhnwDPPn4uO0H+b17b7IVpJHImbqjOWxlQ//0buiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2yy0BZVaUqs+CkIuOcB1kvo8eR/4NQyCVbhCChcVvbxM9A5O8hBJpwauT9gAKdFx
	 YD0icu7eBQu7YdjnfuP27dGBTF5EaPRSrX7KQevmPr1GUF0XuHw7UFgCWOTmvmztKn
	 foBtU6MhcG3K75MOeYNbgeLIEwFbdFy7T2nyRWb3GpKXqH5Dn9taziJvJ4Q1alh/CE
	 G/ivgeRss8z0iFvSfka2JIuLDNKeKFR6BvGxTXIu4Q0d7/ybnyuEheXdOsbl66/aJt
	 dvpKmS+uNdxQNB34w0vVNEUoUKBrPqdGL4PovLpwQiUFbPZp676MGQ+W80ShRiL7CP
	 cwSR8zYZFUkZA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65C2517E0FC2;
	Thu, 24 Jul 2025 10:40:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel node to machine dtsis
Date: Thu, 24 Jul 2025 10:39:09 +0200
Message-ID: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014054_324901_8EC5641A 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Not all of the kukui machines have got a real DSI panel, infact,
some of those have got a DSI to eDP bridge instead: this means
that the address and size cells are necessary in the first case
but unnecessary in the latter.

Instead of adding a bunch of /delete-node/ which would impact on
human readability, move the entire panel node declaration to each
of the relevant Kukui machine dtsi: even though this introduces
some duplication, the advantages in readability surclass that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
 5 files changed, 83 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index f2afca63c75a..1b74ec171c10 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
 	};
 };
 
-&dsi0 {
-	status = "okay";
-	/delete-node/panel@0;
-};
-
 &dsi_out {
 	remote-endpoint = <&anx7625_in>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index 472d4987615a..d71972c94e42 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -61,6 +61,33 @@ &bluetooth {
 	firmware-name = "nvm_00440302_i2s_eu.bin";
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 1b21e3958061..b702ff066636 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
 	};
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c0 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index a85c73b43195..b6cfcafd8b06 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -45,6 +45,34 @@ &bluetooth {
 	firmware-name = "nvm_00440302_i2s_eu.bin";
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c0 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 8f3a0e85b4ed..4ac0a60fdd24 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -252,29 +252,6 @@ &cpu7 {
 
 &dsi0 {
 	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	panel: panel@0 {
-		/* compatible will be set in board dts */
-		reg = <0>;
-		enable-gpios = <&pio 45 0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&panel_pins_default>;
-		avdd-supply = <&ppvarn_lcd>;
-		avee-supply = <&ppvarp_lcd>;
-		pp1800-supply = <&pp1800_lcd>;
-		backlight = <&backlight_lcd0>;
-		rotation = <270>;
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-	};
-};
-
-&dsi_out {
-	remote-endpoint = <&panel_in>;
 };
 
 &gic {
-- 
2.50.1


