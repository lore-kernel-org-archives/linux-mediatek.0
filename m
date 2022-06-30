Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A60C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5k4lGG2y8yeH7pfRmZWVR7TA+kv3l9ztWKwlBvi1lDc=; b=Zdn0zDvjwy54H5SqMQEDmrSM0o
	8KA95v2N9NmtDreMprkswUontXwSnAgQAMT3gJlBESu7fvF0Q3lUaKfhkTKlIODjG7BnRE9TTTtQm
	xB4n+u8rcUSLB3I1/urf8HGc8zkoaPA/KsXdtRZ3SvOquSbHCwzrwtTC/ZTDdNR35B7rUsf9ZCEhQ
	LjirLgQ96aK2xPIUpMlDFO7qc143byNSZ81b5kvngOhNoykPFHr3aHkh2VYfy3Rz9ILGvqrQwfgDL
	d/JihGgpsPjq7SeWZT5gVFIyBBqdpwPOZ5PYmfMviVD7POpyxUeHziMhlB3JTjrQaXn9pthy9dZDO
	pUCqhK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wCc-000JYH-4l; Thu, 30 Jun 2022 15:35:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAb-000IWF-Nt; Thu, 30 Jun 2022 15:33:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2413C660196D;
	Thu, 30 Jun 2022 16:33:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603207;
	bh=jogVEZhtKyX8PbDyMB9xCc1ckAJzJb39HZYE1/psFO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n2gzTT5fHhXY5fdGABAYABEnjCRQqc/6aSezdn73L2uiPETndybCnk4KSmQ0nUih+
	 WoeX7tqaaiMo5W+WfpSL72XjLCtHv7xwu/DuK0dHKd7goK3uNB1Ab42RBW1nrrluKx
	 UNobQDPOlhypsSzhZTbVhP79bDl6uOV7sSg23OWQAgRCkK3xApTpVN8S9G63hez4aG
	 EWfWRI4zfIvBOjOOt1p2d/PEF1TwpBb5VJq9PmNvq9AdMZRyGaziO8rPV2pRlT+bl3
	 iY1z+5+mj5NljM1ZyGQ5mqXlrt/M+U6qB3VPcNfyQBsx4rNNanBEfnueWBLIonRuiM
	 XAqoxz+Y+Agog==
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
Subject: [PATCH 04/11] arm64: dts: mediatek: cherry: Add platform regulators layout and config
Date: Thu, 30 Jun 2022 17:33:09 +0200
Message-Id: <20220630153316.308767-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083329_943783_CED381CB 
X-CRM114-Status: GOOD (  11.78  )
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
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 14f8f30b1eb3..091338f7d5ff 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include "mt8195.dtsi"
+#include "mt6359.dtsi"
 
 / {
 	aliases {
@@ -19,6 +20,107 @@ memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
 	};
+
+	/* system wide LDO 3.3V power rail */
+	pp3300_z5: regulator-3v3-pp3300-ldo-z5 {
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
+	pp3300_s3: regulator-3v3-pp3300-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_s3";
+		/* automatically sequenced by PMIC EXT_PMIC_EN2 */
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&pp3300_z2>;
+	};
+
+	/* system wide 3.3V power rail */
+	pp3300_z2: regulator-3v3-pp3300-z2 {
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
+	pp4200_z2: regulator-4v2-pp4200-z2 {
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
+	pp5000_s5: regulator-5v0-pp5000-s5 {
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
 
 &pmic {
-- 
2.35.1


