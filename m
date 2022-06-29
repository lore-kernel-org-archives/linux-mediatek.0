Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF065C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDwZWCKeRaT+g4l4NKmkKyJjH4PU1u79p0NUuOLu+d4=; b=F1DXYv6lHl8of2t9eu/6WCDf1O
	peKhftEwODEsKgyC/kc/O8HUSc4coyh3dSYCYY71bKKn/82NfATqbAeVlLdnfV8GtPaFK/3MfEg55
	YKC1MHD4V8KGCXTzMFRNFAAH/KToiPfDFHXpo6WN4Ui795xbeKK//tbDsGOaAeyQp/wYB+bFxajNc
	96QmEjSmxPJ0GqDvMfjrRYFmAkQY4vMjQcJCCiUh2R5FuFT8CFEtLPb40s2SU7ypgiAtygvo7Lku+
	ti1cruuCQfJVLv/YFr+P6egJajiPiiL33JZPudEKSvVosWxPLYrPP3RxAdG0pbx68cnX2VB1mNvhQ
	vaDxZW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aC4-00CrIb-67; Wed, 29 Jun 2022 16:05:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6z-00CoXU-U0; Wed, 29 Jun 2022 16:00:20 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8E23E660195F;
	Wed, 29 Jun 2022 17:00:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518416;
	bh=DkEh0i4AhAuZrJDIOKX1/1K+MmHQy1XtKrDDIPq0SBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mGuzmp1ExCM5zcE7UT3S1NSe2MQD7d0sS9HCaAVaseFC4I2QPRi96THo3qN+rHpN8
	 i6HVkrIwSZlEIwusQ2V7tSfif7LJvsCk42xKv3fm9+rXmKDVleh1nHKPqzKYczIb6F
	 H7gWCYmkJ5XnAIHOXboLgC70btl+u3z7I06+SJjEsNYB+ju7fZJ/ft2uX6mRhdl9f0
	 xgRK69PYY9vM2C7GbxqRiB8z5zoEvnAgklCov1Q/MhxJ1Pzy3LybHRmdjck/7udDAk
	 hSvj4dTLi01kYevztV7GrfacfroFBArZB3s7EsGzxKBlU1BHVRlJ9FsNBzmWAilzZ9
	 W/jnPqWXGOnDg==
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
Subject: [PATCH v4 09/19] arm64: dts: mediatek: asurada: Add Cr50 TPM
Date: Wed, 29 Jun 2022 11:59:46 -0400
Message-Id: <20220629155956.1138955-10-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090018_160029_5ED6C291 
X-CRM114-Status: GOOD (  11.05  )
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

The Asurada platform has a Google Security Chip connected to the SPI5
bus. It runs the cr50 firmware and provides TPM functionality. Add
support for it.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v1)

 .../arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 07405dea4d9d..fe626535ee5d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	aliases {
@@ -353,6 +354,13 @@ &pio {
 			  "AUD_DAT_MISO0",
 			  "AUD_DAT_MISO1";
 
+	cr50_int: cr50-irq-default-pins {
+		pins-gsc-ap-int-odl {
+			pinmux = <PINMUX_GPIO171__FUNC_GPIO171>;
+			input-enable;
+		};
+	};
+
 	cros_ec_int: cros-ec-irq-default-pins {
 		pins-ec-ap-int-odl {
 			pinmux = <PINMUX_GPIO5__FUNC_GPIO5>;
@@ -513,6 +521,15 @@ &spi5 {
 	mediatek,pad-select = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi5_pins>;
+
+	cr50@0 {
+		compatible = "google,cr50";
+		reg = <0>;
+		interrupts-extended = <&pio 171 IRQ_TYPE_EDGE_RISING>;
+		spi-max-frequency = <1000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cr50_int>;
+	};
 };
 
 &uart0 {
-- 
2.36.1


