Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBAC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqRLzlPTEnQUVqEhTxeICvt3kSVg5OnjTVSkVV6x8I8=; b=gxF5td2VbRJRGbwdar4txBOs63
	D3MJ52NOD+tCDcl2yxqdWu77R01GyPDoDUEhZ8cB5JZ5egZP2yX1OYw6AbcvtUE9/pM2xsQvINJTb
	txIv/Lw99dfzGSHpEmwKedY8acFTrjsi0muz04TUhZ8Ii3mTwmMPIsaOLG55nW/nhgaTkIL7yZiKj
	BJLNg5n0Bi26VsBzTpJE+AJZkF5kJD2qX1o+xQ6aRxgQ1LUD8ywL/z69jvfcU7S4Dr+w3oSfGId3k
	x4v78++exe1e5Db0KcC5P/V3F9KJxz0kgtJ/FBcEnmLoOOzaCMs7hou4XneAbE+MHFeUUYxg6W/co
	pE30QRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVD1M-00GuTt-7A; Thu, 23 Feb 2023 14:56:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVCzV-00GtUV-Eu; Thu, 23 Feb 2023 14:54:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BCEE06602218;
	Thu, 23 Feb 2023 14:54:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677164076;
	bh=2FDlNqFMvv568OceJDLOHaVPuNkoQcOewFS48O2E3K8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hDuVc56t9YVqQsWw8Z293SKRKZ++z7sXiXURKBM0uIr8fSXw2qoC0Flal9G2n9Bcg
	 SJlLEncNL/dQTjNkoAB0Qt+TbHNsxdhXxzPkWqHT5LNMdaIStRygUpMt9pGEU2K0qH
	 GX/rEaCMSNZZrP+4LW1dvGsAazCto1QUVBQrkGKm6n833DL1oN5pKUtODo9/CQfhDX
	 eA/DBDYqicqHknC5cwT0n7F+sRhsU+PFKKUiIAyKGaKGJ88BVhQ11nuFdcPPX6HXf9
	 QwYGebToYhxPkP0bV1voaQDykZpFsLMF5eVw67S91vtBG+WPaobCGd+ng9l+NX22Qb
	 u31Q5TMDaTu5w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 3/4] arm64: dts: mediatek: mt8195: Add display pwm nodes
Date: Thu, 23 Feb 2023 15:54:25 +0100
Message-Id: <20230223145426.193590-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
References: <20230223145426.193590-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_065437_708651_6AE74E3B 
X-CRM114-Status: UNSURE (   8.20  )
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

Add the two hardware PWMs for display backlighting but keep them
disabled by default, as usage is board-specific.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index fecb41104193..c86c4b48dc3f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1102,6 +1102,29 @@ lvts_ap: thermal-sensor@1100b000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		disp_pwm0: pwm@1100e000 {
+			compatible = "mediatek,mt8195-disp-pwm", "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_LOW 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			#pwm-cells = <2>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM0>,
+				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
+		disp_pwm1: pwm@1100f000 {
+			compatible = "mediatek,mt8195-disp-pwm", "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100f000 0 0x1000>;
+			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
+			#pwm-cells = <2>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM1>,
+				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8195-spi",
 				     "mediatek,mt6765-spi";
-- 
2.39.2


