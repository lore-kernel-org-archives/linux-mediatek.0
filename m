Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD906C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=re3QwCdkfZectnr5q5xdpOrt369YzI+V4L/CAK9ecY8=; b=pPk5TNLGH3WEqh2Aq/jVjckUZY
	JJv6neHY0Atm25O2llXCSADL1FLazfS4yd3w2EPkefR1QSqDaOEQm7fimGZfb5rQvdMg9Y6ULrkC5
	JxQVGeZB70BRh2/Kozwlls3kIySpZiNXmgohiRGYabQBbGT4aRzdHx7SsF0YFev4xLy4rC81nbpMz
	XkqBooD3zg1ic+AK7894LjVq1AnNfftegbevUc+EjtQyzdbknpIZZ0lbq5g+ZqQ63fVPGpMPzzOpA
	VoX7jD9CYFQK2ucaQFLxatscEXCYmIfKu1HcLVBh04KtD6ty1iUQrQysg9ht3fwz1Hjm2XKxpp3i5
	iSnBEMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wEj-000KiF-A3; Thu, 30 Jun 2022 15:37:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAe-000IYa-LV; Thu, 30 Jun 2022 15:33:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A0716601975;
	Thu, 30 Jun 2022 16:33:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603211;
	bh=UVbfYKEp/UeHIzeeBg5jE/nWREPvL/7gFeHO3MKYGcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RlXswnkJyVrkDmTAsWhmp5Z99o7Hiaq3mRZtf2oNn9/iD0BV+KoCVqjzZX35r3pHL
	 380sjv28tpyf2rhw9uMiJizg20PflFEyzheDrlUUJJakZJrVCtib8ejsReLof9ZWNZ
	 OURhxQ0WZ++rKBjOKzRvEQxe0jNrhs4M9rHB3ozrKlqK4ZtijZO8kJiGJFKDlwwN7F
	 CW7X3lUsw28aJCFGn2ohH5E1csQa85iWc83Zcf7jbwlAmJrEq0oskLO1FD1kpGHuO1
	 mDlzBWTOFnSYjd8yCXq5BlTfiYogoxE4pRpdX3fkYvH6rWnoS5CXHdNm8t4vSlY3OO
	 N6dWFemSxkiDQ==
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
Subject: [PATCH 08/11] arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers
Date: Thu, 30 Jun 2022 17:33:13 +0200
Message-Id: <20220630153316.308767-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083332_906952_BCB5DF25 
X-CRM114-Status: GOOD (  10.65  )
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

Add USB functionality by enabling the required PHYs and the XHCI
controllers.
This enables all of the supported USB ports on the Cherry boards.

Please note that u3phy1 also enables u3port1, which is configured
to be a PCI-Express PHY for the second PCIe controller that is
found on the MT8195 SoC, which will be enabled in a later commit.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 23a86d07274c..379d0e5c4055 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -93,6 +93,15 @@ ppvar_sys: regulator-ppvar-sys {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	usb_vbus: regulator-5v0-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &i2c0 {
@@ -563,6 +572,52 @@ &spi0 {
 	mediatek,pad-select = <0>;
 };
 
+&u3phy0 {
+	status = "okay";
+};
+
+&u3phy1 {
+	status = "okay";
+};
+
+&u3phy2 {
+	status = "okay";
+};
+
+&u3phy3 {
+	status = "okay";
+};
+
 &uart0 {
 	status = "okay";
 };
+
+&xhci0 {
+	status = "okay";
+
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
+
+&xhci1 {
+	status = "okay";
+
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
+
+&xhci2 {
+	status = "okay";
+
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
+
+&xhci3 {
+	status = "okay";
+
+	/* MT7921's USB Bluetooth has issues with USB2 LPM */
+	usb2-lpm-disable;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	vbus-supply = <&usb_vbus>;
+};
-- 
2.35.1


