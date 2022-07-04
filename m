Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC06C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRMmzXoh/41DNC1ogh5Cp53yF6EQXQ0nFylO8oGwH1M=; b=A56k6ppMtExY2X9LWbbNGSnTKN
	CgFepwTh/ypBFpV1Eru9EofE/HJwxsb4uDzBARY1V9HaQhkU/yxcgKL3qK1zR+JU7CGkp23X/vZeK
	VY7RLvBKXlq2hlZh8ipgSDdcCLbqyVyn5y0Ro2h61dvKk9M1RzXb0r8/UTwsVhL/dkOMKxXQ6YUc4
	/L//oSRk/Kb9axvyE2Rms19YmfCmkTS2d1t2CPfSMFLYbukgLzyzZQgqG7C6LWc8w8C1u4LofZe9+
	lt0nD8ZHPaCoAUDlYI/23SYoZSYca8G4L4p3iOXAECghX+M2WmRPO5xikztHkFjyBP+1JO6DQK2bv
	1n0rCF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5i-006q2j-D0; Mon, 04 Jul 2022 10:14:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5A-006pdP-EQ; Mon, 04 Jul 2022 10:13:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6FBA1660198A;
	Mon,  4 Jul 2022 11:13:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929611;
	bh=bu6B2YcCIYZ6plXvXeLwW+wNbSXcWtCS4ehbelYtopY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OlURyK2nUwWnjHb+c0TDCo2Tfh/NkIrknxQVESdZEZRZygtrTNuim9574RnoXze9j
	 P+8Yhaz04DubblJ0OyS6xMm4CbT4TdDx0FG4HH3Yf8UAVSU64uWnVprqq+qRPil/EF
	 WxpMJThx59EwQr5PWZqyknUi2EnL+rkbGwhFonE7Vyx+9TmN+V9NRH2/9oXTPM0FlF
	 frbWAEPFKVm12lGDuYhfO1bMNZ7bcZSiwXH4Uv/JyP+7n4IGpRAFCHCMZ4obh8mvk+
	 kSO6E9qVh4BsVmR/Mqn3WXNKAEnsSSTX0iaempFszgrXo27xo2lNzPnvxDv2rCcmt6
	 Er0+PtHviP8+w==
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
Subject: [PATCH v2 03/11] arm64: dts: mediatek: cherry: Add platform regulators layout and config
Date: Mon,  4 Jul 2022 12:13:13 +0200
Message-Id: <20220704101321.44835-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031332_792415_F1D52266 
X-CRM114-Status: GOOD (  12.31  )
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

Add the regulators layout for this platform, including the basic power
rails controlled by the EC (and/or always on).
Moreover, include the MT6359 PMIC devicetree and add some configuration
for its regulators, essential to keep the machine alive after booting.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 7406d7bbf725..f4c3d33843a7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include "mt8195.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	aliases {
@@ -19,6 +20,109 @@ memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
 	};
+
+	/* system wide LDO 3.3V power rail */
+	pp3300_z5: regulator-pp3300-ldo-z5 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_ldo_z5";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* separately switched 3.3V power rail */
+	pp3300_s3: regulator-pp3300-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_s3";
+		/* automatically sequenced by PMIC EXT_PMIC_EN2 */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pp3300_z2>;
+	};
+
+	/* system wide 3.3V power rail */
+	pp3300_z2: regulator-pp3300-z2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_z2";
+		/* EN pin tied to pp4200_z2, which is controlled by EC */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* system wide 4.2V power rail */
+	pp4200_z2: regulator-pp4200-z2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp4200_z2";
+		/* controlled by EC */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <4200000>;
+		regulator-max-microvolt = <4200000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* system wide switching 5.0V power rail */
+	pp5000_s5: regulator-pp5000-s5 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp5000_s5";
+		/* controlled by EC */
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* system wide semi-regulated power rail from battery or USB */
+	ppvar_sys: regulator-ppvar-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvar_sys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+/* for CPU-L */
+&mt6359_vcore_buck_reg {
+	regulator-always-on;
+};
+
+/* for CORE */
+&mt6359_vgpu11_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vgpu11_sshub_buck_reg {
+	regulator-always-on;
+	regulator-min-microvolt = <550000>;
+	regulator-max-microvolt = <550000>;
+};
+
+/* for CORE SRAM */
+&mt6359_vpu_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vrf12_ldo_reg {
+	regulator-always-on;
+};
+
+/* for GPU SRAM */
+&mt6359_vsram_others_ldo_reg {
+	regulator-always-on;
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <750000>;
+};
+
+&mt6359_vufs_ldo_reg {
+	regulator-always-on;
 };
 
 &uart0 {
-- 
2.35.1


