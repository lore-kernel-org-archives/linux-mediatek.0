Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPAc/qWy7WDF+OU62ZhHsIe0LSpUeImNXTQVaueOw3M=; b=oi/Gl7sT6ZQ9NG
	eM9qVAAlyFKImbTmal6L0frN9Th39Bs8U3SXKe62pEx4tCp+LLeFDoHCR1Wun9v3N/ogQrp+yInjH
	8YRgbTsAhMJqElaJzdDIZ+SxIBmoLZnTCoYtLqRga1cEebQeuwiMyVmn0NZlndhfR9j7OXPUNdDnk
	xmebsoqI+7sG6wLtY4wYQlmevPOdrCQiWpYezTEGtXNFN49AXAqBkJRgFuWCdhvqFeioOUyWE56SX
	Pl6Os5wZ9Bq2qJ+t+wJsLo3gIFNMukxcOCngLl7v9pWWs5NAR4oYal/mVgPch1LhHWkUFVCidVrDy
	jL04LSkT3nyVtgOlt8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLTz-00Ehaf-9t; Tue, 26 Apr 2022 13:43:59 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLRz-00EgZ0-Fi
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:41:59 +0000
Received: by mail-wr1-x436.google.com with SMTP id v12so18723556wrv.10
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukJ87PJJQr6WdcFY9U3LOip92CMRk0OSZz5wfX1gBdA=;
 b=kDrmXa+2sq1U9qBMrPJIHx1jotVEcR5D8DKEmsoYwJTXjPNPSRpDulPjvcWztnPFu2
 /dLv84homwh9Uhhqm7+xW2eZY0+Cy+GyNKnGRrACDhnMJLE79ZjBv25ni9Qbgb1P+6/A
 n3WEDDRKRcsStS6hWTAcGEwRUxmvVV9CqJXZa3Nth/Vjmlo5vPmJ9ZtDlaOPBYvBtsSV
 GVM17O6tMCHLlc89ZREHueAsj9aHBW0YiSoS8sVj5gzPfZdueg/vSIOY4IHKY5ouT4FH
 IZVzPCpH6zC4F52l+51ldnrcYRBjCkTm6jL1HvnWuj4HI8Tz+GjdLQog46RZ+kQ8Owvi
 pspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukJ87PJJQr6WdcFY9U3LOip92CMRk0OSZz5wfX1gBdA=;
 b=kkEOPGANVgeePi9dqxY3C+WDfJeWYXBux26XAkKvBg+Nhaz+LCisPp9WwAFo0rBEC5
 OOJwW7YgJ4JwX5fm4W2QpiIEbY/fIxH4reu6DG+1TUuuitXpxSSdbzwiCe8UtewCA8oq
 rqM0uhD0CUrY2+3xOuj794FLATGLOmUVkiDgCtFGGfVvHTyNp3mIl3nv03u77ajnN2BH
 yySuL0vtUM2wfjn18hVa1ZXNYCdtRVKJ1VjkPzK1h3CSU7jzxZ9WK2gdyiYtIbsnwtUG
 2KfTx8jbnfqjrWqF4prtUtIWwHqWjTpeijJUgIZfUWSxp7M5Fl6BhcczPiuTNeGd5kRv
 lebw==
X-Gm-Message-State: AOAM5330E498T20J+fKmyAbwANq+lbd/a1pO2RcVgxQ9yH0ddOl267Eg
 6bKMwIl+N/LPj49jHusQIIjtxQ==
X-Google-Smtp-Source: ABdhPJyPVIr76v3m+QAnFXrUZyRfsJs85pAn0hlzBhRMa5PgGJw8PZlDVyZ0amQ+ifKJB0syMBrC5g==
X-Received: by 2002:a05:6000:114d:b0:20a:d608:5e54 with SMTP id
 d13-20020a056000114d00b0020ad6085e54mr12139126wrx.539.1650980511758; 
 Tue, 26 Apr 2022 06:41:51 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm13628475wrd.47.2022.04.26.06.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:41:51 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Biao Huang <biao.huang@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: mediatek: mt8195-evb: enable ethernet
Date: Tue, 26 Apr 2022 15:41:02 +0200
Message-Id: <20220426134106.242353-5-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426134106.242353-1-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064155_577330_34AB8AA6 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>

Add ethernet support for MT8195 EVB.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
This patch comes from https://lore.kernel.org/all/20211207015505.16746-7-biao.huang@mediatek.com/

The differences between that patch and this patch is that:
* The EVB dts modification has been split into its own commit
* The patch was rebased to fix merge conflict with the upstream mt8195-evb.dts file
* Re-ordered the node to be correctly sorted based on phandle name 
* Re-ordered the pins for the pinctrl to be sorted by node name
* Fixed dtbs_check: use - instead of _ in node names + prefix pins node with pins-

 arch/arm64/boot/dts/mediatek/mt8195-evb.dts | 90 +++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
index d49ae8605e67..0b04421942ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8195.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "MediaTek MT8195 evaluation board";
@@ -28,6 +29,29 @@ &auxadc {
 	status = "okay";
 };
 
+&eth {
+	phy-mode ="rgmii-rxid";
+	phy-handle = <&eth_phy0>;
+	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
+	snps,reset-delays-us = <0 10000 10000>;
+	mediatek,tx-delay-ps = <2030>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_default_pins>;
+	pinctrl-1 = <&eth_sleep_pins>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		eth_phy0: eth_phy0@1 {
+			compatible = "ethernet-phy-id001c.c916";
+			#phy-cells = <0>;
+			reg = <0x1>;
+		};
+	};
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pin>;
@@ -69,6 +93,72 @@ flash@0 {
 };
 
 &pio {
+	eth_default_pins: eth-default-pins {
+		pins-cc {
+			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
+				 <PINMUX_GPIO88__FUNC_GBE_TXEN>,
+				 <PINMUX_GPIO87__FUNC_GBE_RXDV>,
+				 <PINMUX_GPIO86__FUNC_GBE_RXC>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+		pins-mdio {
+			pinmux = <PINMUX_GPIO89__FUNC_GBE_MDC>,
+				 <PINMUX_GPIO90__FUNC_GBE_MDIO>;
+			input-enable;
+		};
+		pins-power {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			output-high;
+		};
+		pins-rxd {
+			pinmux = <PINMUX_GPIO81__FUNC_GBE_RXD3>,
+				 <PINMUX_GPIO82__FUNC_GBE_RXD2>,
+				 <PINMUX_GPIO83__FUNC_GBE_RXD1>,
+				 <PINMUX_GPIO84__FUNC_GBE_RXD0>;
+		};
+		pins-txd {
+			pinmux = <PINMUX_GPIO77__FUNC_GBE_TXD3>,
+				 <PINMUX_GPIO78__FUNC_GBE_TXD2>,
+				 <PINMUX_GPIO79__FUNC_GBE_TXD1>,
+				 <PINMUX_GPIO80__FUNC_GBE_TXD0>;
+			drive-strength = <MTK_DRIVE_8mA>;
+		};
+	};
+
+	eth_sleep_pins: eth-sleep-pins {
+		pins-cc {
+			pinmux = <PINMUX_GPIO85__FUNC_GPIO85>,
+				 <PINMUX_GPIO88__FUNC_GPIO88>,
+				 <PINMUX_GPIO87__FUNC_GPIO87>,
+				 <PINMUX_GPIO86__FUNC_GPIO86>;
+		};
+		pins-mdio {
+			pinmux = <PINMUX_GPIO89__FUNC_GPIO89>,
+				 <PINMUX_GPIO90__FUNC_GPIO90>;
+			input-disable;
+			bias-disable;
+		};
+		pins-power {
+			pinmux = <PINMUX_GPIO91__FUNC_GPIO91>,
+				 <PINMUX_GPIO92__FUNC_GPIO92>;
+			input-disable;
+			bias-disable;
+		};
+		pins-rxd {
+			pinmux = <PINMUX_GPIO81__FUNC_GPIO81>,
+				 <PINMUX_GPIO82__FUNC_GPIO82>,
+				 <PINMUX_GPIO83__FUNC_GPIO83>,
+				 <PINMUX_GPIO84__FUNC_GPIO84>;
+		};
+		pins-txd {
+			pinmux = <PINMUX_GPIO77__FUNC_GPIO77>,
+				 <PINMUX_GPIO78__FUNC_GPIO78>,
+				 <PINMUX_GPIO79__FUNC_GPIO79>,
+				 <PINMUX_GPIO80__FUNC_GPIO80>;
+		};
+	};
+
 	i2c0_pin: i2c0-pins {
 		pins {
 			pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
