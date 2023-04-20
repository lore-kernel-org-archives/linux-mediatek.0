Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C548C77B78
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEZcgJkD2W6Tkr5VLp8EWp6C4I3JJnK453oFJFMsp1Y=; b=SecWFGU4YV3ds1uHhr0GHjJ8HO
	8PbUAJCBQOTJ1LmhuL0s62LfkHIQDy8aYckU9EQ1FkCG4+8yBgziVi5Qnq0DfBQ6Vjg3Fa+Q2jMdy
	61GNqqLPEXgtQuOJxdcI8GD/t03bBbIuK+USgqTQQeJ+iZCu76nKkMUYiYLDwpknF/Hq6+cEPz7kA
	bDKyhBpbxf/tlOsiPtz3Jz3HLBqCCHx2wjhTFrsmNVwrzBIhZOazUhBWM24HdeC0GoL4MNs3DR3sD
	q3mxrrkYeYCIF3uWulyvIq/6fOe1SVvKnXnzM1H+bEi9a2d9OWu5KEyiYds1Lgty42VoxNACFsp+E
	wVJZpNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqn-007Za4-1N;
	Thu, 20 Apr 2023 09:45:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqO-007ZO9-2n;
	Thu, 20 Apr 2023 09:44:51 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 24D7866032AA;
	Thu, 20 Apr 2023 10:44:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681983887;
	bh=eTPRbfdJLpoEovWoX9DFmWEwQag9cVc/gZKE80xSx8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPcMTMMTPEKj7UALYhV/RuKy/DVHmACu/w3/QLiIQtaLqq6cvKauICdVEvF9G9FXn
	 zveAEUZ0Wcskp/hXOQMFDr4AmO08BIWq0XrFoEV11JxbP+75k3EFSgWJ++qqdTxYrP
	 n4PNjHCh8QBxJ3JO9ncNmOyTwpVJDcHRDJ3EviNSJIylW1jka3q38n1xgBIojFWflo
	 Zzs2nre7OU5BsDCzqgRyAs3bHjh1vGUXFO1d5uC60vLbFMMvvodhnMmRoJiFwU3RwT
	 4LhK52kfGdMpL4BdHREU+bUjxaQZBkyN+wH4HC2/Jnuo0cGssoMchkCmbVjMovwLWw
	 hD2Tuy9PRyFkQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/5] arm64: dts: mediatek: cherry: Enable PCI-Express ports for WiFi
Date: Thu, 20 Apr 2023 11:44:32 +0200
Message-Id: <20230420094433.42794-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_024449_031594_A9DB888B 
X-CRM114-Status: UNSURE (   9.30  )
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

On the Cherry platform, a MT7621 WiFi+Bluetooth combo is connected
over PCI-Express (for WiFi) and USB (for BT): enable the PCIe ports
to enable enumerating this chip.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 46f1c8091498..9e2bc363c9cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -567,6 +567,13 @@ flash@0 {
 	};
 };
 
+&pcie1 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_pins_default>;
+};
+
 &pio {
 	mediatek,rsel-resistance-in-si-unit;
 	pinctrl-names = "default";
@@ -961,6 +968,24 @@ pins-vreg-en {
 		};
 	};
 
+	pcie0_pins_default: pcie0-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO19__FUNC_WAKEN>,
+				 <PINMUX_GPIO20__FUNC_PERSTN>,
+				 <PINMUX_GPIO21__FUNC_CLKREQN>;
+				 bias-pull-up;
+		};
+	};
+
+	pcie1_pins_default: pcie1-default-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO22__FUNC_PERSTN_1>,
+				 <PINMUX_GPIO23__FUNC_CLKREQN_1>,
+				 <PINMUX_GPIO24__FUNC_WAKEN_1>;
+				 bias-pull-up;
+		};
+	};
+
 	pio_default: pio-default-pins {
 		pins-wifi-enable {
 			pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
-- 
2.40.0


