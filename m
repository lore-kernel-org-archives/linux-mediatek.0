Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CB7C3DA79
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7w7+yEBl4vGwjIjE10iuV0TWKv2sdao0DcaahtfY9sY=; b=F/KpH/kfmVud6g
	Q6EwTJn6DmrE9SPQs99fomFyY1yjhIxVFQto63OFVEyr2nZNq6Da3v8OVS01yLif0WeuH1ewixBbO
	I04k+XO6O8QisQeCYtu+UNg1EAK87RcmcVcxatp67oZqS4IlSaRg19qCq1BzIluX8hSZc64DboS2w
	3EzlMX96UWvctlYRG9AMxH0PxaCdZblH7PZS0qGty6z9jFOPL7nanZeerCsfG9hgEb9MPmchZerzc
	v6nlDFN4qkO6QIHwhnTyY2Mf6C95yV15xwtvdVJ8GnObLkr/yU8ERZ91CZZolameUmXjpxA15uKv/
	lPWXDhb6BzvbvnikY5Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAuFV-00GiL9-7W; Thu, 29 Dec 2022 14:51:13 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAuEv-00Gi4p-VG; Thu, 29 Dec 2022 14:50:40 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 70E6360012;
	Thu, 29 Dec 2022 14:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1672325433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7w7+yEBl4vGwjIjE10iuV0TWKv2sdao0DcaahtfY9sY=;
	b=xQfqutAmpCYUjYaXe8wYVtEGuzewqzKqXtwxQQ3Ty/HfRF79fkv/kR2D0rGUAOwRsC03Ng
	ui4ltGOgqfRMNJ7jLslahSwrzkxS/bEM3aqfN4/KQucMgH3QgpY7zNLuHeMo0dibo6R1Bs
	0zzAyxOrP3jqHb+q5AwFyQBcsMMftcs=
Received: from frank-G5.. (fttx-pool-80.245.77.213.bambit.de [80.245.77.213])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 37DC41226AC;
	Thu, 29 Dec 2022 14:50:33 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v8 4/5] arm64: dts: mt7986: add pcie related device nodes
Date: Thu, 29 Dec 2022 15:50:22 +0100
Message-Id: <20221229145023.55713-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229145023.55713-1-linux@fw-web.de>
References: <20221229145023.55713-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_065038_211668_83083A98 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, Jieyy Yang <jieyy.yang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sam Shih <sam.shih@mediatek.com>

This patch adds PCIe support for MT7986.

Signed-off-by: Jieyy Yang <jieyy.yang@mediatek.com>
Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
changes compared to sams original version:

- add clock-names to pcie node
- update clocks to new binding
---
bindings-patches:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=690172
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 16 ++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 52 ++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index c7a2ac764a30..4f18b4a9a8c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -93,6 +93,15 @@ &mmc0 {
 	non-removable;
 	no-sd;
 	no-sdio;
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	status = "okay";
+};
+
+&pcie_phy {
 	status = "okay";
 };
 
@@ -155,6 +164,13 @@ conf-rst {
 		};
 	};
 
+	pcie_pins: pcie-pins {
+		mux {
+			function = "pcie";
+			groups = "pcie_clk", "pcie_wake", "pcie_pereset";
+		};
+	};
+
 	spi_flash_pins: spi-flash-pins {
 		mux {
 			function = "spi";
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9c552442c02d..f6e980771b69 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mt7986-clk.h>
 #include <dt-bindings/reset/mt7986-resets.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	compatible = "mediatek,mt7986a";
@@ -361,6 +362,57 @@ mmc0: mmc@11230000 {
 			status = "disabled";
 		};
 
+		pcie: pcie@11280000 {
+			compatible = "mediatek,mt7986-pcie",
+				     "mediatek,mt8192-pcie";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			reg = <0x00 0x11280000 0x00 0x4000>;
+			reg-names = "pcie-mac";
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			bus-range = <0x00 0xff>;
+			ranges = <0x82000000 0x00 0x20000000 0x00
+				  0x20000000 0x00 0x10000000>;
+			clocks = <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
+				 <&infracfg CLK_INFRA_IPCIE_CK>,
+				 <&infracfg CLK_INFRA_IPCIER_CK>,
+				 <&infracfg CLK_INFRA_IPCIEB_CK>;
+			clock-names = "pl_250m", "tl_26m", "peri_26m", "top_133m";
+			status = "disabled";
+
+			phys = <&pcie_port PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &pcie_intc 0>,
+					<0 0 0 2 &pcie_intc 1>,
+					<0 0 0 3 &pcie_intc 2>,
+					<0 0 0 4 &pcie_intc 3>;
+			pcie_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie_phy: t-phy@11c00000 {
+			compatible = "mediatek,mt7986-tphy",
+				     "mediatek,generic-tphy-v2";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			pcie_port: pcie-phy@11c00000 {
+				reg = <0 0x11c00000 0 0x20000>;
+				clocks = <&clk40m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+		};
+
 		usb_phy: t-phy@11e10000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
-- 
2.34.1


