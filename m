Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A5DCD1292
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 09:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0VdWl81xUkhQ/9Yp0vD3aydPnMUvCiiOMIXPQn+0VSc=; b=aVsmhR47EB5a8VCsHsrlon7vL8
	ZhQiTYxkbao0r0V1k8MC8IdhJ+tVg89yjhfDHiC5RZtetDIYjASuVbI/jgO+9YlZf2emWIlGZplv+
	Cm8GRk2tWHW/kr0ADrXcBCEwmFBRA/ziSmsStZjLPS7xnr5cT8wlbdWmCFeiGFQd3nacKy4y9ELIJ
	3uGlDhuQb7DAQVE0x005jzXlpBeTIeCSuLnrR/3jp5+pClFwprsNcOvLRrmHdYmpFf4UwfcTT0+a/
	twBnbo0GcEtzrv+D/+/+s2eH+cjsHwem5VMAMTpnmyGBzy4c/TfZuBwgHYjZr6zjKzrjR22tKHfFm
	ACSmgxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkwK-0000000F0pE-1JCU;
	Mon, 08 Apr 2024 09:05:20 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtkwH-0000000F0oR-1qeh;
	Mon, 08 Apr 2024 09:05:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a4715991c32so595147766b.1;
        Mon, 08 Apr 2024 02:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712567114; x=1713171914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VdWl81xUkhQ/9Yp0vD3aydPnMUvCiiOMIXPQn+0VSc=;
        b=e18vLiRxrVAT4NDjjXnV2iUsCIdWFEyGTf29TnyBul9y5bwN4fBRGp3iuIna5aWjh2
         3OfZloU3nOH9V/Jc2DYmPqEeDjnsEOrLLFUalZafwKPJ6/k/exVYZNvDUjOnLnmVs02A
         Ghjc4kdwnlKMAf4fMyj78l4UfQq8fqp3BktyscPewV9fZJzF1uJvHXzGsZrjuxoRD9+8
         OS1Tr9Lm/4sCzXHbsf+6mHj6HgWpwkzJ4MNkrGYU31Ab0bueN2GtdDSwWd5q0UkCuiop
         fyn333nlUtWB0d/0ra8HJJOw5PSRLO4PYJnSPUJrsAt7o9BiX4Bgjy897D3y19lDD4M2
         kAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567114; x=1713171914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VdWl81xUkhQ/9Yp0vD3aydPnMUvCiiOMIXPQn+0VSc=;
        b=mmIcdCUdqM+VswErRKABrWb9Tv/LRTbReEAlxHRns/pDMx+qE+l4XcGhgd/flvCKth
         uQxPbq2AebpZMXJyiTcDreKOSVfv6R5v2IoWC313kk+xt3QjNZiyF6EKFsnCAJ9lZBHe
         WRX3XZLbGeR4des8TumtApmcm+2BSc7fc9gzd0NmNXZVBzvibG1Xao+NaJBd3Fl7yptD
         1IBGd6ce2MHashu2miAOLYRDM+Kn8q9zfY2PlIasmfssZeEgvPMV+CJT2leonaPe0nbS
         nfv0YEUxoOf3NfdEBc+lQv+q2VSxR+8VYxvHZXvBc1lEcwuXtRr+qCMpixueM8T0eNaD
         6o1g==
X-Forwarded-Encrypted: i=1; AJvYcCVGTr3CTVqEqwMX8DFie5TITXse7+E9LKyCU6NFxrUSf1Lgg8k/Bh62OulQnxfhK632Te3GHfSoSbU1F6g/VZI7L6bhBck8fVPC3x1USomfmlqpaMH5nCBPeN9q5zTrf6Pu+ocPtdC11noxuX3g7kzYA+VVjkkZIE0=
X-Gm-Message-State: AOJu0YyCdUNH9TKMdzlRYYluweYxdYWS/JluQavZ0DKleXHrnG3KxmPI
	soD9La2Pi2f5NTG0/ZPb3T588uC5+Kcgc04QthGt7pPjW1s6Wc2K
X-Google-Smtp-Source: AGHT+IHoDPHjMBvKWWxI6l+a/pOx5BO9ETXLbsUsMeGrQvdnDpuv/Gs2Dn58wW/rDjO9l2t+4A7cUg==
X-Received: by 2002:a17:907:84b:b0:a51:df52:5a65 with SMTP id ww11-20020a170907084b00b00a51df525a65mr608198ejb.2.1712567113914;
        Mon, 08 Apr 2024 02:05:13 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id h1-20020a170906718100b00a51bd3bfec3sm2773969ejk.121.2024.04.08.02.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 02:05:13 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/3] dt-bindings: pinctrl: mediatek: mt7622: fix array properties
Date: Mon,  8 Apr 2024 11:05:04 +0200
Message-Id: <20240408090506.21596-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_020517_519407_D31C4359 
X-CRM114-Status: GOOD (  10.27  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Some properties (function groups & pins) are meant to be arrays and
should allow multiple entries out of enum sets. Use "items" for those.

Mistake was noticed during validation of in-kernel DTS files.

Fixes: b9ffc18c6388 ("dt-bindings: mediatek: convert pinctrl to yaml")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 92 ++++++++++---------
 1 file changed, 49 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index bd72a326e6e0..60f30a59f385 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -97,7 +97,8 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [emmc, emmc_rst]
+                  items:
+                    enum: [emmc, emmc_rst]
           - if:
               properties:
                 function:
@@ -105,8 +106,9 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [esw, esw_p0_p1, esw_p2_p3_p4, rgmii_via_esw,
-                         rgmii_via_gmac1, rgmii_via_gmac2, mdc_mdio]
+                  items:
+                    enum: [esw, esw_p0_p1, esw_p2_p3_p4, rgmii_via_esw,
+                           rgmii_via_gmac1, rgmii_via_gmac2, mdc_mdio]
           - if:
               properties:
                 function:
@@ -123,10 +125,11 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [i2s_in_mclk_bclk_ws, i2s1_in_data, i2s2_in_data,
-                         i2s3_in_data, i2s4_in_data, i2s_out_mclk_bclk_ws,
-                         i2s1_out_data, i2s2_out_data, i2s3_out_data,
-                         i2s4_out_data]
+                  items:
+                    enum: [i2s_in_mclk_bclk_ws, i2s1_in_data, i2s2_in_data,
+                           i2s3_in_data, i2s4_in_data, i2s_out_mclk_bclk_ws,
+                           i2s1_out_data, i2s2_out_data, i2s3_out_data,
+                           i2s4_out_data]
           - if:
               properties:
                 function:
@@ -159,10 +162,11 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pcie0_0_waken, pcie0_1_waken, pcie1_0_waken,
-                         pcie0_0_clkreq, pcie0_1_clkreq, pcie1_0_clkreq,
-                         pcie0_pad_perst, pcie1_pad_perst, pcie_pereset,
-                         pcie_wake, pcie_clkreq]
+                  items:
+                    enum: [pcie0_0_waken, pcie0_1_waken, pcie1_0_waken,
+                           pcie0_0_clkreq, pcie0_1_clkreq, pcie1_0_clkreq,
+                           pcie0_pad_perst, pcie1_pad_perst, pcie_pereset,
+                           pcie_wake, pcie_clkreq]
           - if:
               properties:
                 function:
@@ -178,11 +182,12 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [pwm_ch1_0, pwm_ch1_1, pwm_ch1_2, pwm_ch2_0, pwm_ch2_1,
-                         pwm_ch2_2, pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0,
-                         pwm_ch4_1, pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1,
-                         pwm_ch5_2, pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3,
-                         pwm_ch7_0, pwm_0, pwm_1]
+                  items:
+                    enum: [pwm_ch1_0, pwm_ch1_1, pwm_ch1_2, pwm_ch2_0, pwm_ch2_1,
+                           pwm_ch2_2, pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0,
+                           pwm_ch4_1, pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1,
+                           pwm_ch5_2, pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3,
+                           pwm_ch7_0, pwm_0, pwm_1]
           - if:
               properties:
                 function:
@@ -260,33 +265,34 @@ patternProperties:
           pins:
             description:
               An array of strings. Each string contains the name of a pin.
-            enum: [GPIO_A, I2S1_IN, I2S1_OUT, I2S_BCLK, I2S_WS, I2S_MCLK, TXD0,
-                   RXD0, SPI_WP, SPI_HOLD, SPI_CLK, SPI_MOSI, SPI_MISO, SPI_CS,
-                   I2C_SDA, I2C_SCL, I2S2_IN, I2S3_IN, I2S4_IN, I2S2_OUT,
-                   I2S3_OUT, I2S4_OUT, GPIO_B, MDC, MDIO, G2_TXD0, G2_TXD1,
-                   G2_TXD2, G2_TXD3, G2_TXEN, G2_TXC, G2_RXD0, G2_RXD1, G2_RXD2,
-                   G2_RXD3, G2_RXDV, G2_RXC, NCEB, NWEB, NREB, NDL4, NDL5, NDL6,
-                   NDL7, NRB, NCLE, NALE, NDL0, NDL1, NDL2, NDL3, MDI_TP_P0,
-                   MDI_TN_P0, MDI_RP_P0, MDI_RN_P0, MDI_TP_P1, MDI_TN_P1,
-                   MDI_RP_P1, MDI_RN_P1, MDI_RP_P2, MDI_RN_P2, MDI_TP_P2,
-                   MDI_TN_P2, MDI_TP_P3, MDI_TN_P3, MDI_RP_P3, MDI_RN_P3,
-                   MDI_RP_P4, MDI_RN_P4, MDI_TP_P4, MDI_TN_P4, PMIC_SCL,
-                   PMIC_SDA, SPIC1_CLK, SPIC1_MOSI, SPIC1_MISO, SPIC1_CS,
-                   GPIO_D, WATCHDOG, RTS3_N, CTS3_N, TXD3, RXD3, PERST0_N,
-                   PERST1_N, WLED_N, EPHY_LED0_N, AUXIN0, AUXIN1, AUXIN2,
-                   AUXIN3, TXD4, RXD4, RTS4_N, CST4_N, PWM1, PWM2, PWM3, PWM4,
-                   PWM5, PWM6, PWM7, GPIO_E, TOP_5G_CLK, TOP_5G_DATA,
-                   WF0_5G_HB0, WF0_5G_HB1, WF0_5G_HB2, WF0_5G_HB3, WF0_5G_HB4,
-                   WF0_5G_HB5, WF0_5G_HB6, XO_REQ, TOP_RST_N, SYS_WATCHDOG,
-                   EPHY_LED0_N_JTDO, EPHY_LED1_N_JTDI, EPHY_LED2_N_JTMS,
-                   EPHY_LED3_N_JTCLK, EPHY_LED4_N_JTRST_N, WF2G_LED_N,
-                   WF5G_LED_N, GPIO_9, GPIO_10, GPIO_11, GPIO_12, UART1_TXD,
-                   UART1_RXD, UART1_CTS, UART1_RTS, UART2_TXD, UART2_RXD,
-                   UART2_CTS, UART2_RTS, SMI_MDC, SMI_MDIO, PCIE_PERESET_N,
-                   PWM_0, GPIO_0, GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5,
-                   GPIO_6, GPIO_7, GPIO_8, UART0_TXD, UART0_RXD, TOP_2G_CLK,
-                   TOP_2G_DATA, WF0_2G_HB0, WF0_2G_HB1, WF0_2G_HB2, WF0_2G_HB3,
-                   WF0_2G_HB4, WF0_2G_HB5, WF0_2G_HB6]
+            items:
+              enum: [GPIO_A, I2S1_IN, I2S1_OUT, I2S_BCLK, I2S_WS, I2S_MCLK, TXD0,
+                     RXD0, SPI_WP, SPI_HOLD, SPI_CLK, SPI_MOSI, SPI_MISO, SPI_CS,
+                     I2C_SDA, I2C_SCL, I2S2_IN, I2S3_IN, I2S4_IN, I2S2_OUT,
+                     I2S3_OUT, I2S4_OUT, GPIO_B, MDC, MDIO, G2_TXD0, G2_TXD1,
+                     G2_TXD2, G2_TXD3, G2_TXEN, G2_TXC, G2_RXD0, G2_RXD1, G2_RXD2,
+                     G2_RXD3, G2_RXDV, G2_RXC, NCEB, NWEB, NREB, NDL4, NDL5, NDL6,
+                     NDL7, NRB, NCLE, NALE, NDL0, NDL1, NDL2, NDL3, MDI_TP_P0,
+                     MDI_TN_P0, MDI_RP_P0, MDI_RN_P0, MDI_TP_P1, MDI_TN_P1,
+                     MDI_RP_P1, MDI_RN_P1, MDI_RP_P2, MDI_RN_P2, MDI_TP_P2,
+                     MDI_TN_P2, MDI_TP_P3, MDI_TN_P3, MDI_RP_P3, MDI_RN_P3,
+                     MDI_RP_P4, MDI_RN_P4, MDI_TP_P4, MDI_TN_P4, PMIC_SCL,
+                     PMIC_SDA, SPIC1_CLK, SPIC1_MOSI, SPIC1_MISO, SPIC1_CS,
+                     GPIO_D, WATCHDOG, RTS3_N, CTS3_N, TXD3, RXD3, PERST0_N,
+                     PERST1_N, WLED_N, EPHY_LED0_N, AUXIN0, AUXIN1, AUXIN2,
+                     AUXIN3, TXD4, RXD4, RTS4_N, CST4_N, PWM1, PWM2, PWM3, PWM4,
+                     PWM5, PWM6, PWM7, GPIO_E, TOP_5G_CLK, TOP_5G_DATA,
+                     WF0_5G_HB0, WF0_5G_HB1, WF0_5G_HB2, WF0_5G_HB3, WF0_5G_HB4,
+                     WF0_5G_HB5, WF0_5G_HB6, XO_REQ, TOP_RST_N, SYS_WATCHDOG,
+                     EPHY_LED0_N_JTDO, EPHY_LED1_N_JTDI, EPHY_LED2_N_JTMS,
+                     EPHY_LED3_N_JTCLK, EPHY_LED4_N_JTRST_N, WF2G_LED_N,
+                     WF5G_LED_N, GPIO_9, GPIO_10, GPIO_11, GPIO_12, UART1_TXD,
+                     UART1_RXD, UART1_CTS, UART1_RTS, UART2_TXD, UART2_RXD,
+                     UART2_CTS, UART2_RTS, SMI_MDC, SMI_MDIO, PCIE_PERESET_N,
+                     PWM_0, GPIO_0, GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5,
+                     GPIO_6, GPIO_7, GPIO_8, UART0_TXD, UART0_RXD, TOP_2G_CLK,
+                     TOP_2G_DATA, WF0_2G_HB0, WF0_2G_HB1, WF0_2G_HB2, WF0_2G_HB3,
+                     WF0_2G_HB4, WF0_2G_HB5, WF0_2G_HB6]
 
           bias-disable: true
 
-- 
2.35.3


