Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DBCC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrcV8azanCpnbT62QI13Y/t9Oc+j5uEBOurc0vJEliU=; b=C1oj5bcCRtwX0WRW6s5Hi41AwM
	DMVpf58nRLHnRE5scBIPutDmTeko2djjkriNqT2ZtAUPUh3bwN8RKns1qKL0PW32Jyhs76PH11MIt
	jDMyH/z6FoM2YHwAm06C3Hp1q8KAGlMX9YiWwgEXpkzGYZ5rw27mHR12D/cfam0tS3FENySC+mEKb
	S4UOqybc0IhOpfOT7PzjaHVIk/XWs4wX12wBbUC/Tt3D++OMCLEc5xXZuDstzGjlDf0hlXR0X1pEZ
	2bN0UYDHwJPWzXZQapk7TJuXtKPGjoiCTUwChgh6AzmHiFimmfnRfLT/QbcBncQDMeHzNVkAcO8G9
	+kz3e2gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7t-002NI7-1W;
	Fri, 12 Jan 2024 09:46:57 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7f-002N7A-2Y;
	Fri, 12 Jan 2024 09:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052802;
	bh=tcjP/leN4XCKBtnz42PrTROUO/R9BBYO3TR0UYOJr+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FKWxU0tLKPRq7PUUfGwWOYH1GFrkkrHM6458oM5xWZ/GeXhV8ZlYbykzaS0XpRyYc
	 HE7XSNoF4UbofLzNrGwd+nIfXM1JItfGv4hUqCBa3lyF0ZH75DxOfSOZV+RZi140Sa
	 YMEcOUXlIitOvtODF+fMna2y/I+Nuy8rJdNZ00Sm3Bh0MD1MpV8M1f+sOvgPO669/Q
	 uNY7uNR1PCuhXmyPGdQu913U629lv6PuHGBBTw8gKCLUxYZcYnBIr6JHoWH7k2heIS
	 Jais5HX7BxjOZDWGtiN+njkMcoPsT9DocQoVbger90Vg3sJmJ/QD820GvGquEXlU9j
	 O4SagNXw/95bQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BA8FF3782033;
	Fri, 12 Jan 2024 09:46:41 +0000 (UTC)
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
Subject: [PATCH 04/15] arm64: dts: mediatek: radxa-nio-12l: Add external MT6360 PMIC on I2C6
Date: Fri, 12 Jan 2024 10:46:21 +0100
Message-ID: <20240112094632.66310-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014643_963159_C371B26D 
X-CRM114-Status: GOOD (  12.12  )
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

In preparation for adding the power tree for this board, add a node for
the MT6360 PMIC, connected to I2C6.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 79358e1a3e60..281847b8f022 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -8,6 +8,7 @@
  */
 
 #include "mt8195.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
 
 / {
@@ -109,7 +110,15 @@ &i2c6 {
 	pinctrl-names = "default";
 	status = "okay";
 
-	/* MT6360 PMIC at 0x34 */
+	mt6360: pmic@34 {
+		compatible = "mediatek,mt6360";
+		reg = <0x34>;
+		interrupts-extended = <&pio 101 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-names = "IRQB";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		pinctrl-0 = <&mt6360_pins>;
+	};
 };
 
 &pio {
@@ -140,6 +149,15 @@ pins {
 		};
 	};
 
+	mt6360_pins: mt6360-pins {
+		pins-irq {
+			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
+				 <PINMUX_GPIO101__FUNC_GPIO101>;
+			input-enable;
+			bias-pull-up;
+		};
+	};
+
 	uart0_pins: uart0-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
-- 
2.43.0


