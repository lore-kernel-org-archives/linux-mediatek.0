Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799CAC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR3HBOBrg252cVIsFuSxx7rl30ZNwOGOA05DWf1zduA=; b=ThJJMxZT0vZR+7tAZfm5NaBi29
	uBrwoMedfqgphcMiklAkDhhbEKS+6t3by506Nz+258vfqPXc3ru8Qt2lgIE0uKmAgLXk6j7QwEJ3p
	jNQ/YP5Z2Zxd2k5AfDBhWMeyoWAXZqdRaPef77hXwcjwfT0NUwWhiL7HvNmu16eDr9KqJxV3LQP6G
	llbf+WtziehUXObAisnw9n/TkYWqmX1LlmXrbbLiEsIElfox4v71s75VlRDm/ftcV5OTF4q6p56jJ
	GvYNnnSS3V4tUMgCpBspqc73vQuGTfh2BcabV2m85+KhZqRNuOW9XKIzol6yog+Ro+WEhc0k34xg/
	QYpLkENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXVq-008Lkv-53; Thu, 21 Jul 2022 14:50:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEXVW-008KvG-Fm; Thu, 21 Jul 2022 14:50:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B803E6601AAE;
	Thu, 21 Jul 2022 15:50:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658415029;
	bh=c9v3l9FdU2UcsKgOUHjJo+v/EkJQURQSMnGUGxmVLvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AnPIhqFHkbBbo3n1vL+fu46KmMrjOPabN0u76tdWr2UHBKNcXpRuxfjg5RAYka+1L
	 bsqKjEIJXwIh4l1H57RjOfi2IUF5c0z3jPdJMg1GWjpTkFQVySXWk8ps4H4j3nB/cq
	 SVAM5bE1d2bUUyX4QXu80WjL8BXNd1PGHC6f3UvCbj87sBieaKZ5ZbC4nCrVBf6jbq
	 Xs5vPgIYQLT5nvdV7DY3YAcJlwNTcpnYA2u2FaA0dPC2756IOcfZUdcsl087PFyecH
	 sMQ+J2vzPRpCmprDIpDLiSjTwMTynO7pIJDunQWUbmwVVF7s8+vWH5GbfJvvublW+G
	 W3ipKOQXuj9Hw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/8] arm64: dts: mediatek: cherry: Enable the System Companion Processor
Date: Thu, 21 Jul 2022 16:50:10 +0200
Message-Id: <20220721145017.918102-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_075030_669990_9AF1D13C 
X-CRM114-Status: UNSURE (   9.10  )
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

MT8195 features a SCP like some other older SoCs, and Cherry uses it
for various tasks. Add the required pin configuration and DMA pool
and enable the node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index fcc600674339..feebbe367e93 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -104,6 +104,18 @@ usb_vbus: regulator-5v0-usb-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+	};
 };
 
 &i2c0 {
@@ -600,6 +612,14 @@ pins-low-power-pupd {
 		};
 	};
 
+	scp_pins: scp-default-pins {
+		pins-vreq {
+			pinmux = <PINMUX_GPIO76__FUNC_SCP_VREQ_VAO>;
+			bias-disable;
+			input-enable;
+		};
+	};
+
 	spi0_pins: spi0-default-pins {
 		pins-cs-mosi-clk {
 			pinmux = <PINMUX_GPIO132__FUNC_SPIM0_CSB>,
@@ -643,6 +663,14 @@ &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&scp {
+	status = "okay";
+
+	memory-region = <&scp_mem>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&scp_pins>;
+};
+
 &spi0 {
 	status = "okay";
 
-- 
2.35.1


