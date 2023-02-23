Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF3BC64ED6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REFzH4DWkHdEnZccByxIxMNmMKixf1wmFUH99pmAcUo=; b=2z82eIUDUqRItZO7HlZv7sOrC2
	kdV9Ij9XUcmFt4iJQSx0cpyG91e0JHK2Gm3QLTvNNtC+p5efuTdvHTY1Bp8bO/4dQJyGoWjl1qcfn
	hTFzCy7JSY332QlCg/Y5hyuy0Gh4MnnjeDSWjK7fPYilxtLihoFYt8i7M2Xxqp3T0ZUbyRlRWx2GH
	mfjPTxrqjuC/mNA/loxJcWY0UZZkCCPM15JEN/uKQp2qR7gVtQ3yaYBO3MYTVtyCpG+7OVZcmoKhd
	NopJmvYW7RmvO3AWKLYSbuqj0uxCHyP1M9PK5bCYTbSyn4utSvx/zRWk61FtuiPoNdvyRwaYybZSl
	rxuBB6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVD0U-00Gtvs-Ue; Thu, 23 Feb 2023 14:55:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVCzU-00GtTv-Q4; Thu, 23 Feb 2023 14:54:39 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2AAD56602217;
	Thu, 23 Feb 2023 14:54:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677164075;
	bh=r1iG8jDPuaedm/CyEheNxI1t1kS8LDRLHJXYGo1C1oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2Qw7uaKoarbfSpT2X7FiJ21QT6UUJdak/MAff4DhFgjRfqWMPOuJKVz1InWreYDT
	 Qky9OzsU22SRt/iWayRt0EOgnFd72XXq82HfSQkNlpLwEFC7kxietNn10TZwjypv6P
	 PlCZFHQ0DkUd1dNgfNsv1PAcEX5OX1G5woVvW3YVGIsWlDWwO626OFxN12x35rkd7+
	 XCE+AxIswCRNKi5SqhNXybHS1pSUU32G/I24hni3fJ2a93OMM46AeSqMzU6KGViHrQ
	 K/aidOSGZGq9PAURMbcWacrhkzZpEQ4ZZt3WAfYaBRQAXbhfrizbgggNTn1Xwu16B1
	 NaQda17tZO68Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 2/4] arm64: dts: mediatek: cherry: Enable PCI-Express ports for WiFi
Date: Thu, 23 Feb 2023 15:54:24 +0100
Message-Id: <20230223145426.193590-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_065437_000639_C78F4DC5 
X-CRM114-Status: UNSURE (   8.40  )
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
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |  7 ++++++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 25 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 2d5e8f371b6d..11fc83ddf236 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -20,6 +20,13 @@ &sound {
 	model = "mt8195_r1019_5682";
 };
 
+&pcie0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_pins_default>;
+};
+
 &ts_10 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ae2052a7160d..d679a04207d8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -553,6 +553,13 @@ flash@0 {
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
@@ -934,6 +941,24 @@ pins-cs {
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
2.39.2


