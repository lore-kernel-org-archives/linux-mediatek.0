Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D13C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHxr1lWW4/hZtKoDo+ymZ6Halxk36is2h5OEVuaDMrE=; b=cwILhCqi3DapBI7LuQON7H1o15
	8YCQlVp0llFWeLJntngyL8N6RTSR7v3IK8n59kAXEr1zLIW14doPnB7X1R2AhOp35/oh63Jo0xjbD
	bTCua+bqn53gxv6o0kApCa+M+LPRSkKMuADF63/y8ayrcxHubH2fQI4XboAV8XWNLQ0IKgyGoitOR
	5lmLsARu0n5LaUCQszr5Hd8x/yccOa6nT4b55EtQ0cm7kEdud2Bln/Jv2ZjcHn5zh3suASWe71hlA
	AFAyjkNVbCYPsLFsqDY++LALllGwE8CeRvxtszz3HQL7gNdVBHHZEi7zi6R92kZIBf4Yqz7QFuf67
	+a93A3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiNi-00AIR2-2s;
	Mon, 27 Mar 2023 08:39:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLk-00AHAk-0R;
	Mon, 27 Mar 2023 08:37:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 232D866030E3;
	Mon, 27 Mar 2023 09:37:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906226;
	bh=M2x6XrfKatUDNCzi+SX1mFtgO/Okir8+l/Hd5u8MM30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Euip6vBAt7XX/ExWE42LBSSpfsCWwWShcG+34Ee+U7pCYfVKBkIrHcLALBlWY888J
	 d/IIyUO8X4IpbPBW2NFW0SxI4K5TqgcEMOkM8o/PctPHE5BwJE/ugrtuLsChD6jcBx
	 by6w10s/Z0xmWYS1MEtW4OF8GzWrEFegVxo2jSpeZS+Gqdi0RAhrtXmBT31ckaMuEr
	 +PTRDKW2DDCGGt34A9X1+IWb+6sDTedWHfqGmYASK32O0ZS5/SIO3kVB5NzIw680WE
	 zcDeB7z9BHEFycJez4hooVXCwWzIMD265Zul0F+j5tFkSfqgKaDPTP3lFhOr89wotd
	 3RbFm3zYGaYBg==
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
Subject: [PATCH v2 14/17] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
Date: Mon, 27 Mar 2023 10:36:44 +0200
Message-Id: <20230327083647.22017-15-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013708_305590_A55DA26A 
X-CRM114-Status: UNSURE (   7.93  )
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

Add the BMA255 Accelerometer on I2C3 and its pin definitions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index edab90f06a24..54a1f7f306f7 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -99,6 +99,13 @@ &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
 	status = "okay";
+
+	accelerometer@0x10 {
+		compatible = "bosch,bma255";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&accel_pins>;
+	};
 };
 
 &pio {
@@ -115,6 +122,14 @@ pins-rst {
 		};
 	};
 
+	accel_pins: accelerometer-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO12__FUNC_GPIO12>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-- 
2.40.0


