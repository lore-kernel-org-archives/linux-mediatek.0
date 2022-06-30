Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E359C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx+9BaNLIYzLxN11F6MPhEmGuNh7XKvQrsKGjaPH0Kk=; b=cfKI4u9PJFDRNfS13j/OhgljP9
	VNF4+s+PKuHhXGOZuZhd/I5ZvpobaejJeisnhvT+SrErGLBQqj6EfMYhq98snVwzNG2RCrDN8kmI0
	DVr7mUcnfZiuFrr/KRcreYaVXyM1jW1gBWu04+Ol6mrBRZ4hCRJAz790L8dpWHiGSFXcWUCk3h3dI
	anvath9ycsaA+Ft9+4kAL+FUizTsuvfBMPlzV+G9VSomvP01JEivZZR4cgsOnVeuqxCb46ToeCgzc
	cqdunIFBvyGgRX06JxTtDTkjj5GwRdVw/s6rG8ePORVFftxjQSNBfMTQ9T4s8614Y1tfrAlMszltl
	v1VT1fGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wFs-000LRC-88; Thu, 30 Jun 2022 15:38:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAg-000IZn-CL; Thu, 30 Jun 2022 15:33:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5EA0D6601979;
	Thu, 30 Jun 2022 16:33:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603213;
	bh=UHGvuNhuUk7L5c7BKtAhAhJRqJa8V9GWgDdTDxtXvvw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lssvneloFtoaJ59J9UcbKSZwHCwGiqV6tWJ5ePbZXkha7i7mmKQ2GXp8StPv8sQ0w
	 xY5AOgCbS+K8uHBmBcy6jQ9JIgAwsk0Ltgr5gzlgSgRMSxQQuCx/adzp8KLtj5K+es
	 6+M1HHqO5hEt26ijSUqRfkb775kRvpFJUY0O/hv+B+8B7+KQ1LOIDT019onrD2NFKu
	 AEfvOhIC+4X/fAwiiMp1gQ1uFGH3GcQuDYWimFI8t2MlpwrMGMGO1ySXs5GkBKRvxH
	 XS5sVuk9tCm+au1k7MZGkaOFS4lHV5JYNsNxdqyqp4z4HLaT25PVnx4zOxp4WQHvtw
	 mkI4Jo/mzD5Mg==
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
Subject: [PATCH 10/11] arm64: dts: mediatek: cherry: Enable support for the SPI NOR flash
Date: Thu, 30 Jun 2022 17:33:15 +0200
Message-Id: <20220630153316.308767-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083334_639873_FD8E4D21 
X-CRM114-Status: UNSURE (   8.98  )
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

This platform has a SPI NOR: enable support for it, completing the
storage compartment enablement for the entire platform.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 1668aa1be373..2687c6d40ac1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -231,6 +231,21 @@ &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
 
+&nor_flash {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&nor_pins_default>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <52000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+	};
+};
+
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 	pinctrl-names = "default";
@@ -513,6 +528,22 @@ pins-rst {
 		};
 	};
 
+	nor_pins_default: nor-default-pins {
+		pins-ck-io {
+			pinmux = <PINMUX_GPIO142__FUNC_SPINOR_IO0>,
+				 <PINMUX_GPIO141__FUNC_SPINOR_CK>,
+				 <PINMUX_GPIO143__FUNC_SPINOR_IO1>;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-down;
+		};
+
+		pins-cs {
+			pinmux = <PINMUX_GPIO140__FUNC_SPINOR_CS>;
+			drive-strength = <MTK_DRIVE_6mA>;
+			bias-pull-up;
+		};
+	};
+
 	pio_default: pio-default-pins {
 		pins-wifi-enable {
 			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
-- 
2.35.1


