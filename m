Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B51EFA373D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a/kWHFWiolLd0KM8UYBtYZQOHNoY748/5HeE3gBEF0=; b=uNHoLO8CPMHBsGg+TYVjN0znpS
	quJRJES4giOEWAC2cOrhAl8C+l8cQV08gTDi8wIg8LYot+BF2g75Of8AsNz8qFn/jJzJE4g3lz7yf
	z+KGR3MOiDcknFPc5VfWWfDrA4f9Os/3DUwRpA2OTHJYlYh1yKjlwpHVJt2xLdKBETT4MOcW9YCE5
	ySLPZFEusZIb86q2L+yzD/Y1zQEmxs17OPE/8yPffYgp95i0K6Vt9f4BWZblsReJvibNfXZIn/Udc
	cL7tGGpOkh+3lhfjM8VoO7TcTI+ie1cXwxAPCCihSP2/r30C1Nc2t7Iil5KUVNBhCzUALDvsB/V2h
	dVr7KDkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzcZ-00CgYf-EW; Thu, 27 Oct 2022 09:56:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbX-00CgAs-Qd; Thu, 27 Oct 2022 09:55:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EBC0566028C7;
	Thu, 27 Oct 2022 10:55:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666864514;
	bh=zdy18YQDKtXStsbVbpC3wzp0voDORe/EGo/4QyaE8oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zodexra/+zqui8rth+sqsOGV/oCKAO7Uvp0AD71PrnLDBMw21gPfIlEL9wrUYxmIk
	 wiKn+mf/uVPieCFdSjHgqt0I8JBD4WIBCGqkZEainaE0DmSO2oT1l5QBSidSgbcb99
	 ubsN/CP5BLera7OClMgjfO1iXictsQAe0kLsTTv1Yu6NeBkrlAYD92g9lm212+z1RD
	 o0HxA8yxVCUYBTG7DK4cMsGA6vleiA16+FUkKyA4QxFkAlCDAPx4dlaagst03h2qmS
	 1vIvrsR+u6wru49AomGYvEsj5DsRNHLXAMIGX4YEu3CIEy6j7qFp+3AN35ubnSEpJ2
	 HCUiGBw11zMCg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sam.shih@mediatek.com,
	andrew@lunn.ch,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/6] arm64: dts: mediatek: mt6795: Add topckgen, infra, peri clocks/resets
Date: Thu, 27 Oct 2022 11:54:59 +0200
Message-Id: <20221027095504.37432-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
References: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_025517_966927_A67CB8CE 
X-CRM114-Status: UNSURE (   9.31  )
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

Add nodes for topckgen, infracfg and pericfg, providing various
clocks and resets and needed to support basic IPs of this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 46f0e54be766..1801cafd9c13 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -6,7 +6,9 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mediatek,mt6795-clk.h>
 #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
+#include <dt-bindings/reset/mediatek,mt6795-resets.h>
 
 / {
 	compatible = "mediatek,mt6795";
@@ -192,6 +194,26 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		topckgen: syscon@10000000 {
+			compatible = "mediatek,mt6795-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg: syscon@10001000 {
+			compatible = "mediatek,mt6795-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		pericfg: syscon@10003000 {
+			compatible = "mediatek,mt6795-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt6795-pinctrl";
 			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
-- 
2.37.2


