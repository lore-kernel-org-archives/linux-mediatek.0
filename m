Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D12C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZWEWgV9KWorwzy5WyRu1cE1MVCUr2d2V/ImhIwrHg0=; b=lok0oxx+kFAiE5zdnZ56F1HIt5
	gAJ3AXpc5ruLcsvWeUmyywcj7r0g47BtxHJOYJgfDsKd3StP7s8yRXfaWokusnnPACYw8mprM8OpJ
	GlBZkvbF5TWEASwQEvl8HqdmPQYt8q3TDpzYzMmQnmi67Hjf9v/zSwHBlBdbJfUEg6slm2xUX+ZOI
	I2Kg5AkQrR20nZF+AKFuucgHc548HYaFmKnvFmw8MQqtB99klRqc2lVWWB/AotrRT2d+kmr+vsZ50
	wuC6XaCPld8osv9jwcDTj1JPlNPSzDu5Jxy1CezXg4bcBtz5Z9uQVmCL8pmledp+sncF54S6Nw+Oj
	MVstzD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiNY-00AIHj-1R;
	Mon, 27 Mar 2023 08:39:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLj-00AHAF-0N;
	Mon, 27 Mar 2023 08:37:11 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2E5A366030DD;
	Mon, 27 Mar 2023 09:37:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906226;
	bh=Hpg+2kX8cSdZxnfmoRo906qfV2RYRZo5yI+72ONjdQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FAw0FkcvKRQq7SxMAUHNCsdj/Xi9VXqhIMNLXbL0I1aMoIQFFEu4oH8lXmvdGpTOq
	 N3bIawz0SMfPVyzPYWB1kQBMhciex90bwii9r46fjeG1F2ZNhM0oRB6ZBYrWryEKY/
	 YA9yE3PcNqfKoA7kiNt47TLoxHieCsgUmQ02TIwbsKV5iE3PY9iyZNvF0AdzdLvnZm
	 jyMyM8vUb2UYMaqMkvQatG7STuhbjGKn2R9cDTsP2pJhcdW6ebr+YZhA8tWZUXtYpR
	 Hubnz2bE97PUqE+Wcsh4FZxZnPVJNDQJmjJtFuJ8RisAdlae/WV/3u/9KbDY8EuwWE
	 CwAw97wTtXPzw==
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
Subject: [PATCH v2 13/17] arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
Date: Mon, 27 Mar 2023 10:36:43 +0200
Message-Id: <20230327083647.22017-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013707_284003_4EE04953 
X-CRM114-Status: UNSURE (   8.06  )
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

Add the RMI4 Touchscreen on I2C2 and its pin definitions.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 6df1c848e2d5..edab90f06a24 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -71,6 +71,28 @@ &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins>;
 	status = "okay";
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts-extended = <&pio 6 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_pins>;
+		syna,startup-delay-ms = <160>;
+		syna,reset-delay-ms = <90>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+		};
+	};
 };
 
 &i2c3 {
@@ -80,6 +102,19 @@ &i2c3 {
 };
 
 &pio {
+	ts_pins: touchscreen-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO6__FUNC_GPIO6>;
+			bias-pull-up;
+			input-enable;
+		};
+
+		pins-rst {
+			pinmux = <PINMUX_GPIO102__FUNC_GPIO102>;
+			output-high;
+		};
+	};
+
 	i2c0_pins: i2c0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO45__FUNC_SDA0>,
-- 
2.40.0


