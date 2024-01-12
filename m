Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADCEC4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QK557IRd+wZON+YYTQtRDI9+cOJe6LiwCLXhqNwKlzY=; b=djOiSdaxwezUpaGR7vIMXwVk+T
	hRhH3EIN33y8zATG0S+8EORO2LKPoVJ0fFb7AzHpR805Pt4TwcuR1mVHtnqwkn+PurNs4J1J09gxC
	N3u97q7yfCoIsPIKh8zsscGJiWkjE4qzuSdI8GiBPLaZ6o3/qdx1VcF3ens4t69b6Nh/LtrxbDgh3
	Rscv3pNCxR0B9OltkRgNE/G5Cf12a3zuOZ7GwF4Nc9kYb2/bXaAj/W8EZddER2mGQ5xrft3SlUjbv
	MPmUeG+EYg7dKjfuUN/N00Qb2BQrK/vOvZ5KOfZq4HMIHV0ooMMVsk1zNDP4zuMDz7zvjclCZxSV1
	uqnW37Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE8F-002Nhc-20;
	Fri, 12 Jan 2024 09:47:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7p-002NDM-03;
	Fri, 12 Jan 2024 09:46:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052811;
	bh=45PTVpu/MLu2XZLF4j9xTan9RiiNLjDK7dk9hPp3Oa4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h32px89Di+MFxlU4WfgB9Ae9JEHxh0IupX7Upv6vnZxdkdRucyxJFba76WXCH3o8H
	 3hc1V6jW5JIsW/bN3t2kPvFEciK08WNpZauxW0Q59JIOHk2UsVvh8c0Eql32QnDiEz
	 JUPgbLF2TX0Oh43I6EgGRC9kLjA7em93mvnwWckmkdCVz4ayd+YFvK0N0h3RXQayox
	 VhakFOtsGUaDyOLfSGz7g6nHMVlSvQ7WUgdKn5EXEo0PemN+ca3oUhhNzheCIhvgyD
	 GOQYzfeu5V3i7R33ZlWcnDTdyOauesNI+UhxC7amsZTN4aza+7meH3c4FszDbYpNVr
	 MyoSxa/EeNy0g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0F41A3782051;
	Fri, 12 Jan 2024 09:46:51 +0000 (UTC)
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
Subject: [PATCH 13/15] arm64: dts: mediatek: radxa-nio-12l: Enable SPI1/2 for 40pin header
Date: Fri, 12 Jan 2024 10:46:30 +0100
Message-ID: <20240112094632.66310-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014653_194163_2E24507C 
X-CRM114-Status: UNSURE (   9.99  )
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

Enable the SPI1 and SPI2 controllers as pins for those are exposed on
the 40pins header.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index be2094b8fe3c..191c059f5c97 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -582,6 +582,26 @@ pins-bus {
 		};
 	};
 
+	spi1_pins: spi1-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO136__FUNC_SPIM1_CSB>,
+				 <PINMUX_GPIO137__FUNC_SPIM1_CLK>,
+				 <PINMUX_GPIO138__FUNC_SPIM1_MO>,
+				 <PINMUX_GPIO139__FUNC_SPIM1_MI>;
+			bias-disable;
+		};
+	};
+
+	spi2_pins: spi2-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO140__FUNC_SPIM2_CSB>,
+				 <PINMUX_GPIO141__FUNC_SPIM2_CLK>,
+				 <PINMUX_GPIO142__FUNC_SPIM2_MO>,
+				 <PINMUX_GPIO143__FUNC_SPIM2_MI>;
+			bias-disable;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
@@ -622,6 +642,26 @@ &scp {
 	status = "okay";
 };
 
+&spi1 {
+	/* Exposed at 40 pin connector */
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	mediatek,pad-select = <0>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+};
+
+&spi2 {
+	/* Exposed at 40 pin connector */
+	pinctrl-0 = <&spi2_pins>;
+	pinctrl-names = "default";
+	mediatek,pad-select = <0>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+};
+
 &spmi {
 	#address-cells = <2>;
 	#size-cells = <0>;
-- 
2.43.0


