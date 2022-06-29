Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=by8jpOUV9tctlOX4wwz5rMOoGKIEjPc2NHBnieOcnWc=; b=2OTL36CakSBpt9SNn/wT9YZ/vi
	frtQH0MSMtQGhz+eCC1BnSNYbqlnsaVa8EvyQYZW+1TNlN2JhN4z4nmXPt0X6XEvloxebRmC3MJfs
	tOk3mSfPCwb4GOquZG2AjxLI21JAuZlLTRDetVae/UuQVvm7La2pS3ar7w8cdW24RQtOd+AXG6eD7
	IE3OP+KfSOFQzAttVwmksAmyscY7EY4ZouyNXNxLwlO29OroetIXPlhZAU6w7WRsLsGvkusxWkw54
	/F01B+qTRtVWrvSSA6+dEDt0DHTxuIzqnY0khGqyVR3F7C+Uzv4c9nRUr3MtYRLrTXAimaifDeY6R
	e5EcYjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aJU-00CvGS-Bw; Wed, 29 Jun 2022 16:13:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a7E-00Coi0-Og; Wed, 29 Jun 2022 16:00:34 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 61E6E66019AC;
	Wed, 29 Jun 2022 17:00:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518431;
	bh=fWpLVNkaRd2J8/GN0NiVTcm+/j+WzfBVE0/fxSI1x5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DY92GFjN3oeuKinw8Ew49bJgJxgOWoEzUt8A8bZVJPRHE59LO3545axbqRbXd5QI6
	 NOvolx1mgJgf+roEOHSN7NuOJQ0r6maVhCTo9p/20oueU1YT8lQYaE3TusW4e13aqr
	 Wgu7phTuv8d70Zc6IPA7puSWOvI4bWE4Ja98bu7eOeSwM4CGQ9n6g4oCbh/YlShGuW
	 KJ69HN2yvBHPBnC+GdC/nehh+L3J4vxiQ25nRQYnVCiERoBvR/UOVrNpAmN9USsz9c
	 G6OHQ6n+q17lHnOZDCbgPHHs/6yvDDjHN52lMDHILXCKmiCK5/ReyFXGzmOYbOelxW
	 TGpBJe7lQUP0g==
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
Subject: [PATCH v4 19/19] arm64: dts: mediatek: asurada: Add SPI NOR flash memory
Date: Wed, 29 Jun 2022 11:59:56 -0400
Message-Id: <20220629155956.1138955-20-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090032_988183_42DD279A 
X-CRM114-Status: GOOD (  11.66  )
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

Add support for the SPI NOR flash memory present on the Asurada
platform.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v4:
- Added this patch

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index a5625b3cb317..4b314435f8fd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -241,6 +241,23 @@ &mt6359codec {
 	mediatek,mic-type-2 = <2>; /* DMIC */
 };
 
+&nor_flash {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&nor_flash_pins>;
+	assigned-clocks = <&topckgen CLK_TOP_SFLASH_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D8>;
+
+	flash@0 {
+		compatible = "winbond,w25q64jwm", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <52000000>;
+		spi-rx-bus-width = <2>;
+		spi-tx-bus-width = <2>;
+	};
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
@@ -658,6 +675,29 @@ pins-clk {
 		};
 	};
 
+	nor_flash_pins: nor-flash-default-pins {
+		pins-cs-io1 {
+			pinmux = <PINMUX_GPIO24__FUNC_SPINOR_CS>,
+				 <PINMUX_GPIO28__FUNC_SPINOR_IO1>;
+			input-enable;
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pins-io0 {
+			pinmux = <PINMUX_GPIO27__FUNC_SPINOR_IO0>;
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+
+		pins-clk {
+			pinmux = <PINMUX_GPIO25__FUNC_SPINOR_CK>;
+			input-enable;
+			bias-pull-up;
+			drive-strength = <10>;
+		};
+	};
+
 	pcie_pins: pcie-default-pins {
 		pins-pcie-wake {
 			pinmux = <PINMUX_GPIO63__FUNC_PCIE_WAKE_N>;
-- 
2.36.1


