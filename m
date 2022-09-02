Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE720ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9hn4GWfHY4gVzAIcpELz4YLrH7w809240pFifLXjqs=; b=Uz6Uh9gHW14PCwXCCk/UDa2JIQ
	VIfFUvPv/As74h5pIqV4Gt45gLdGnTIhnSuiQDtEGtjsV8lPj32Trdqz/y9f27iYJWIDfVHGRaHYR
	QSsHSE89r07LxsnPFbGmYTVniVQtOw/7ZAcvehppiX+lne3K1PcF/UlcF9nNffP51qz91ocO6vMyL
	T0qxvejCHl9BHWAdnFYVHCL/bQJaLFfpqo3xFSw6Q6mbf5hNawIhkN5iOLCnz9qNczTrycCszSI7d
	4Tlxb7KHpK3sB+rcMe8fs9cUOGQYPnXmBb62EE3E3ZWzcoLHPWRyNreB28DAJAtNNU9nYKXNPaupC
	4EXdZssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1ow-001hgQ-0z; Fri, 02 Sep 2022 08:14:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1ml-001fzn-06; Fri, 02 Sep 2022 08:12:20 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D5A06601F0A;
	Fri,  2 Sep 2022 09:12:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662106334;
	bh=YhFaf65iorIyRZ0aTehbgCAzAziop4kjadNUEtvfcus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=julMrODEKQxikvddmC/0mTNajCESQm6RvSk2nr8evTeNfra+wxaG94rPRSubrGMMo
	 8nUHqlTpwGTlsSAseu2gyhQ2WoTuhdygm7oPj6ExV8K2R9TjqQHgtgZxJe7UT7M6cx
	 WAi4TOOh4FiS9ktjvENpMTj9o27+027p3BMS9ISe6yEEGe1Ne39HXzyw7oVGOzvnrR
	 qRm0JtA2Dfcb8MZjyoqGEytxOGvQXSzUr8UrfsuTHE/DoYtChnOweeKkWim+zL9Jtf
	 o4G1sn0sHtLKxvuWzKr3A77yYqUsbKURi8N9ca9YWlTmoOlrjFY8GMPo0ZxiFgomQw
	 vivLt3PE+Xggw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 7/7] arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus
Date: Fri,  2 Sep 2022 10:11:56 +0200
Message-Id: <20220902081156.38526-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
References: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011219_214144_D36B1588 
X-CRM114-Status: GOOD (  10.41  )
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

All machines in the Cherry platform use MT6315 over SPMI: add the
two instances, providing Vbcpu and Vgpu regulators.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ee59619068d9..9b62e161db26 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/spmi/spmi.h>
 #include "mt8195.dtsi"
 #include "mt6359.dtsi"
 
@@ -832,6 +833,47 @@ usb_c1: connector@1 {
 	};
 };
 
+&spmi {
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	mt6315@6 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+
+		regulators {
+			mt6315_6_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vbcpu";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <6250>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+
+	mt6315@7 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x7 SPMI_USID>;
+
+		regulators {
+			mt6315_7_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vgpu";
+				regulator-min-microvolt = <625000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-ramp-delay = <6250>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 &u3phy0 {
 	status = "okay";
 };
-- 
2.37.2


