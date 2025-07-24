Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37F7C87FC5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YXTftNbNvm3PQ/5dzTiH914wTJVNPw1VWZtHp35bdok=; b=sXicWGptThEx5G
	pDv7Vf7BKjgTJLKvjzU4mrf7u9soxB3OUAGUsnzRGIgW8Keqc9zYZHFWw1DRjsJOTyKhM4/1BbYn/
	m+pcD/gu4TIOXBJjQ9rjZAeNgEFn8mccUCSrHIfm8REka3JLFcGlF4peQb1g2ORC9r+eGHWQQB3nK
	ZbU9WCFEFeaTUDE7EkhNrsSxbHEvNEWMC2Ovq6sx7Mk2rmyi5o0FJyI5MhutuAS+Afc3GgvPbEJtv
	wSgtryxrAwKa3mQzU+uSDHsajAAI7hWIUeEYYqrUL4Qay2slW8LFmb274HEHcSYoCJiUhDkDFvwNt
	kNvkRKrC6tbr4olvG5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesal-000000077BA-3YKU;
	Thu, 24 Jul 2025 09:50:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVG-00000006txC-1Bac;
	Thu, 24 Jul 2025 08:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346437;
	bh=ruOgG9NssRl3cdtPQRKeFueBDCD5QJFqdpNnG31ExK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tn1pe5e+z2LgfCG3U+8FMElpCzMqRQJux/91By6ADwXQ2/UWjYu2xHgKoLApz3svN
	 2ktXAMWE5p7vP7Mt3O6HCSs+daza/JUYfguhSDuQWzeLknoRL8uJfQjtDEebzbp11n
	 Kn3bWuWiFFPNfGXDzNYdJXYhtQYZz5uRoXD0+Jqd3vbnIPL3Ev3AyQFlm51JulDlRI
	 Hv7Ck83VvYN5/Ldc1BwUOjrJpetyxh9ZT152U7NEYuCa/qrjufAgqvHQ2YeUhsKWPb
	 j6Syn8dY7Q+9YNiLnj1gNJb1IqSbsrQfRcI+9x6RLnpt6bjFZzkAo/+TxdV/OIoHKV
	 OCH+htRjWrjLw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 83C1517E1110;
	Thu, 24 Jul 2025 10:40:34 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 27/38] arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
Date: Thu, 24 Jul 2025 10:39:03 +0200
Message-ID: <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014038_468933_44443623 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The PCIe and USB TPHYs are under the soc bus, which provides MMIO,
and all nodes under that must use the bus, otherwise those would
clearly be out of place.

Add ranges to both the tphy(s) and assign the address to the main
node to silence a dtbs_check warning, and fix the children to
use the MMIO range of t-phy.

Fixes: ("f693e6ba55ae arm64: dts: mediatek: mt7988: Add t-phy for ssusb1")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 560ec86dbec0..cc0d3e3f4374 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -629,20 +629,20 @@ pcie_intc1: interrupt-controller {
 		tphy: t-phy@11c50000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11c50000 0x1000>;
 			status = "disabled";
 
-			tphyu2port0: usb-phy@11c50000 {
-				reg = <0 0x11c50000 0 0x700>;
+			tphyu2port0: usb-phy@0 {
+				reg = <0 0x700>;
 				clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
 				clock-names = "ref";
 				#phy-cells = <1>;
 			};
 
-			tphyu3port0: usb-phy@11c50700 {
-				reg = <0 0x11c50700 0 0x900>;
+			tphyu3port0: usb-phy@700 {
+				reg = <0 0x700 0 0x900>;
 				clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
 				clock-names = "ref";
 				#phy-cells = <1>;
@@ -659,20 +659,20 @@ topmisc: system-controller@11d10084 {
 		xsphy: xs-phy@11e10000 {
 			compatible = "mediatek,mt7988-xsphy",
 				     "mediatek,xsphy";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11e10000 0x3900>;
 			status = "disabled";
 
-			xphyu2port0: usb-phy@11e10000 {
-				reg = <0 0x11e10000 0 0x400>;
+			xphyu2port0: usb-phy@0 {
+				reg = <0 0x400>;
 				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
 				clock-names = "ref";
 				#phy-cells = <1>;
 			};
 
-			xphyu3port0: usb-phy@11e13000 {
-				reg = <0 0x11e13400 0 0x500>;
+			xphyu3port0: usb-phy@3400 {
+				reg = <0x3400 0x500>;
 				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
 				clock-names = "ref";
 				#phy-cells = <1>;
-- 
2.50.1


