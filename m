Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E969AC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOo2b8F8lnHm9Gp1gJ0KQQt/78fIFmrlOEWDanHTf/g=; b=GblP2QsOmnMZIOSa09+zLRlctO
	l7u0AMP+f2/GqJRU+mSUueFVvX4wLoAiJlftB3rCePiV76AtTc0b22ypBlRF8z5OlUPNHzifwC0Xw
	7jlil+A6Juw5B/PouycLObjLD8AxpdeEpiyz1jfWPe3NMMyWPCq9UAh6fxh/Fbj5Ts49g8hyOZz/n
	DRb8W49T9f0fjyI+JKgVjUJND95LjtCNHLi9+042xSubaOqi3cDivKF8Cxj5hayv7i3EdruFpHRZS
	qnyAxSj8vvT06XYMD9xh+mcGbPCsCiwa9f800ufn9wrZprpyi7aZ7W3rorDfEADW8/ZPkILup8k/v
	ZQ2oD8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aC7-00CrK4-25; Wed, 29 Jun 2022 16:05:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a71-00CoYo-Ct; Wed, 29 Jun 2022 16:00:21 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0B60F66019D8;
	Wed, 29 Jun 2022 17:00:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518418;
	bh=o29vqqsWji0OFz7litVCz+HSv2vrNoGr04oOrOfn0YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KA7L+82b3TQ37iIXoQ/ZOTFIuM2Ig0B5xZNl9IkANTbDCpSij0oVuahGvW1BjwMlO
	 Vpn95jAVKnxoDGYxmCnUEGPW8WjJmeq6jRQdNArA2urpVCn9zT0GlVouBsXaQNjEag
	 0ChL6N7YeAm6eVth0++RyWz4A2w1mzUbgBYpeDJUTdcJ48zZ3lsci31vnO5b69YMVu
	 fwiI/K2VWHoDeMe5/SAusfv2dTYVb4nIemEt+TkLmHIze+Svob+tX3J6VJWbAMLrPP
	 tNz2nhV7T2rCTZbOVqOk9j4hCvXTo4gI2k2cOYo1SLVkAA7qLgtHZTDn1y3BZkppiH
	 hKSi2BIbzhHTA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 10/19] arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C trackpad
Date: Wed, 29 Jun 2022 11:59:47 -0400
Message-Id: <20220629155956.1138955-11-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090019_664911_282061BE 
X-CRM114-Status: GOOD (  10.54  )
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

Add support for the Elan eKTH3000 i2c trackpad present on Asurada. It is
connected to the I2C2 bus and has address 0x15.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

Changes in v4:
- Switched mediatek,pull-up-adv for bias-pull-up

 .../boot/dts/mediatek/mt8192-asurada.dtsi      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index fe626535ee5d..4de4235cb768 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -109,6 +109,16 @@ &i2c2 {
 	clock-stretch-ns = <12600>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
+
+	trackpad@15 {
+		compatible = "elan,ekth3000";
+		reg = <0x15>;
+		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
+		vcc-supply = <&pp3300_u>;
+		wakeup-source;
+	};
 };
 
 &i2c3 {
@@ -436,6 +446,14 @@ pins-bus {
 			bias-disable;
 		};
 	};
+
+	trackpad_pins: trackpad-default-pins {
+		pins-int-n {
+			pinmux = <PINMUX_GPIO15__FUNC_GPIO15>;
+			input-enable;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
+		};
+	};
 };
 
 &spi1 {
-- 
2.36.1


