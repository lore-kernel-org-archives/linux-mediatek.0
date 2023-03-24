Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05F4C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Op/IXC9mlvZ7+8SOEnumYZU/z47ozAV8GNa9iRWtI7w=; b=AQZmXEPv6AnK+9CTBur97ZcoHL
	YbGaAcDJY5cR4q99yCziwVJ+J4noNjBu8N2xD9ElR5dW6V4uGl9QOqeEpHzVir3ijXkf2TSr7BKLM
	uHg6UJxZD1oS7wok4VRRw7oICT58l+YJ8YM7ajjbFax5GfLX9//qbMUZOEes5mBUuJ71N6xRZGCi9
	ytXODg9F0tIJDL9rb6Dabf6/TSkjTuAgXkHNgC0qiFlf/vJ4k87jmYDD7Kzx7rkhCsVna/2/+m/9L
	k3AmRBEk6WGMQkCs2D0fAJkBeDohCN/CzZiyzVLuVYW5Ktk6e/s5ERmANg97hBr9Pb+LyMhNnndc1
	BmSVB6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfleB-005Azx-0P;
	Fri, 24 Mar 2023 17:56:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfld8-005AJV-1X;
	Fri, 24 Mar 2023 17:55:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 845D96603131;
	Fri, 24 Mar 2023 17:55:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679680506;
	bh=JgYNzYY/JT/ZxbQnRLMlhIx1cKKvJaqNQPrMZEWb9yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOSa+0CU0oFtU7GYaAHdanaai5ki08N7IqjNt2o708HST2kpjGeyod96NZ1q9JgWU
	 KThCNzCr6LBjhW5gt3eNMreI1cZiR4WbCASz4Bmrt/UsNRDl7U/qCo1g4r4yKtdrn9
	 EqsLirIpqBPH7easvc0Cljh1pUyW89I/BKgHTvHvCNsw6RSuWkSsFQrXgsm+FQSU7J
	 FQAFwI18TjBxasdzEaO9T5KBaT6TkNNfbLJshIcuKGzweposrxrO0QbgLH80HDahZ0
	 34i4ICHZGPKUej7QqNkFDTrejyStZIga91g9VGWtSlePv8Fy+sTMO90gTtUAK1UG3C
	 bDKlZRfjmFveA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 06/18] arm64: dts: mediatek: mt6795: Add SoC power domains
Date: Fri, 24 Mar 2023 18:54:44 +0100
Message-Id: <20230324175456.219954-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_105510_672693_CF148B9A 
X-CRM114-Status: UNSURE (   9.75  )
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

Add power domain tree for various hardware blocks on MT6795.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 79 ++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index ceb6fc948d8a..d63efb32e6bb 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/mediatek,mt6795-clk.h>
 #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
+#include <dt-bindings/power/mt6795-power.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 
 / {
@@ -264,6 +265,84 @@ pericfg: syscon@10003000 {
 			#reset-cells = <1>;
 		};
 
+		scpsys: syscon@10006000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+
+			/* System Power Manager */
+			spm: power-controller {
+				compatible = "mediatek,mt6795-power-controller";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				#power-domain-cells = <1>;
+
+				/* power domains of the SoC */
+				power-domain@MT6795_POWER_DOMAIN_VDEC {
+					reg = <MT6795_POWER_DOMAIN_VDEC>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+				};
+				power-domain@MT6795_POWER_DOMAIN_VENC {
+					reg = <MT6795_POWER_DOMAIN_VENC>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>,
+						 <&topckgen CLK_TOP_VENC_SEL>;
+					clock-names = "mm", "venc";
+					#power-domain-cells = <0>;
+				};
+				power-domain@MT6795_POWER_DOMAIN_ISP {
+					reg = <MT6795_POWER_DOMAIN_ISP>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT6795_POWER_DOMAIN_MM {
+					reg = <MT6795_POWER_DOMAIN_MM>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>;
+					clock-names = "mm";
+					#power-domain-cells = <0>;
+					mediatek,infracfg = <&infracfg>;
+				};
+
+				power-domain@MT6795_POWER_DOMAIN_MJC {
+					reg = <MT6795_POWER_DOMAIN_MJC>;
+					clocks = <&topckgen CLK_TOP_MM_SEL>,
+						 <&topckgen CLK_TOP_MJC_SEL>;
+					clock-names = "mm", "mjc";
+					#power-domain-cells = <0>;
+				};
+
+				power-domain@MT6795_POWER_DOMAIN_AUDIO {
+					reg = <MT6795_POWER_DOMAIN_AUDIO>;
+					#power-domain-cells = <0>;
+				};
+
+				mfg_async: power-domain@MT6795_POWER_DOMAIN_MFG_ASYNC {
+					reg = <MT6795_POWER_DOMAIN_MFG_ASYNC>;
+					clocks = <&clk26m>;
+					clock-names = "mfg";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					#power-domain-cells = <1>;
+
+					power-domain@MT6795_POWER_DOMAIN_MFG_2D {
+						reg = <MT6795_POWER_DOMAIN_MFG_2D>;
+						#address-cells = <1>;
+						#size-cells = <0>;
+						#power-domain-cells = <1>;
+
+						power-domain@MT6795_POWER_DOMAIN_MFG {
+							reg = <MT6795_POWER_DOMAIN_MFG>;
+							#power-domain-cells = <0>;
+							mediatek,infracfg = <&infracfg>;
+						};
+					};
+				};
+			};
+		};
+
 		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt6795-pinctrl";
 			reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
-- 
2.40.0


