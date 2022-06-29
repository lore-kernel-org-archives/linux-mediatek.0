Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57422C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrEks6K6o/r5hooK9K9VERcTDWh3X3oltTLRjNU8Fog=; b=sJZge/2YPMeFEhlyoWDgO4IqS8
	UiKo9qy9FRz72Fdriu2sSqlWlbpRqorGYJQ1VdLYvPleYklCzlqz/k3gcFOxwQ7p2m9w9+3RwvHnw
	190RGw0h+sI1ABxQyP0XhWg8hlMGeeVg6ynZyHGs+L4a3mpsDvB0sg4AK8Y3qS5xFctNhvNp6+L+8
	H44ZCrpgWKhe8dFXARbbbPXLcUgjy4FVD3XZUXAqJuvosdl2+KWt2sT9q2BvVdmVmWwgROSFXjhO8
	9EWmXcTSWWunAwjqTWWYxCJoHG5YkF/cnRjyvRTfaEjTABmUqooE2acVqiSNSnuuZA4cqIKDsC/G7
	nNxI0C9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a95-00Cpgw-GK; Wed, 29 Jun 2022 16:02:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6s-00CoRX-I4; Wed, 29 Jun 2022 16:00:13 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 38617660192F;
	Wed, 29 Jun 2022 17:00:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518409;
	bh=fiBaCyrf7h8x5bjTRdPMlGfXIm342Oj/a4cpeBrl3sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ablb9biVRLjSiJrDQ/KRWyJAw6wtsoaZnnD3ZyMIh0p5nIzhVeDOcyLT6HEEshSXg
	 lZutaoZu1LyPnZnVZwuLroEXNk5EWriHP/zvQIAMV5yd4sOgTetJSQeGnUUbcu5zk3
	 4WcjbFqzeAVw+HbXVZ7dWlv1Amh1D6B8ssudvsnD2qR9Vl4ALJr6n/B0mV3o5jXFWL
	 wk48SnFeqSk9WDUCesoK9Tsaj0Q2mPIQTDFUhSrQYewZyTx42570Rp+9eTeBVTAbVL
	 jpluzX61xGD7Zj7zOIB07Lo472jeGzGihO53gTXcd1yOOchzCjhvkSR7og8FA/M/lq
	 7mIx731ef+2xQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 04/19] arm64: dts: mediatek: asurada: Document GPIO names
Date: Wed, 29 Jun 2022 11:59:41 -0400
Message-Id: <20220629155956.1138955-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090010_922987_435D3D04 
X-CRM114-Status: UNSURE (   9.98  )
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

Add the gpio-line-names property to gpio-controller in order to
document the usage of GPIOs on the Asurada platform.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v1)

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 228 ++++++++++++++++++
 1 file changed, 228 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 277bd38943fe..e10636298639 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -21,6 +21,234 @@ memory@40000000 {
 	};
 };
 
+&pio {
+	/* 220 lines */
+	gpio-line-names = "I2S_DP_LRCK",
+			  "IS_DP_BCLK",
+			  "I2S_DP_MCLK",
+			  "I2S_DP_DATAOUT",
+			  "SAR0_INT_ODL",
+			  "EC_AP_INT_ODL",
+			  "EDPBRDG_INT_ODL",
+			  "DPBRDG_INT_ODL",
+			  "DPBRDG_PWREN",
+			  "DPBRDG_RST_ODL",
+			  "I2S_HP_MCLK",
+			  "I2S_HP_BCK",
+			  "I2S_HP_LRCK",
+			  "I2S_HP_DATAIN",
+			  /*
+			   * AP_FLASH_WP_L is crossystem ABI. Schematics
+			   * call it AP_FLASH_WP_ODL.
+			   */
+			  "AP_FLASH_WP_L",
+			  "TRACKPAD_INT_ODL",
+			  "EC_AP_HPD_OD",
+			  "SD_CD_ODL",
+			  "HP_INT_ODL_ALC",
+			  "EN_PP1000_DPBRDG",
+			  "AP_GPIO20",
+			  "TOUCH_INT_L_1V8",
+			  "UART_BT_WAKE_ODL",
+			  "AP_GPIO23",
+			  "AP_SPI_FLASH_CS_L",
+			  "AP_SPI_FLASH_CLK",
+			  "EN_PP3300_DPBRDG_DX",
+			  "AP_SPI_FLASH_MOSI",
+			  "AP_SPI_FLASH_MISO",
+			  "I2S_HP_DATAOUT",
+			  "AP_GPIO30",
+			  "I2S_SPKR_MCLK",
+			  "I2S_SPKR_BCLK",
+			  "I2S_SPKR_LRCK",
+			  "I2S_SPKR_DATAIN",
+			  "I2S_SPKR_DATAOUT",
+			  "AP_SPI_H1_TPM_CLK",
+			  "AP_SPI_H1_TPM_CS_L",
+			  "AP_SPI_H1_TPM_MISO",
+			  "AP_SPI_H1_TPM_MOSI",
+			  "BL_PWM",
+			  "EDPBRDG_PWREN",
+			  "EDPBRDG_RST_ODL",
+			  "EN_PP3300_HUB",
+			  "HUB_RST_L",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SD_CLK",
+			  "SD_CMD",
+			  "SD_DATA3",
+			  "SD_DATA0",
+			  "SD_DATA2",
+			  "SD_DATA1",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "PCIE_WAKE_ODL",
+			  "PCIE_RST_L",
+			  "PCIE_CLKREQ_ODL",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SPMI_SCL",
+			  "SPMI_SDA",
+			  "AP_GOOD",
+			  "UART_DBG_TX_AP_RX",
+			  "UART_AP_TX_DBG_RX",
+			  "UART_AP_TX_BT_RX",
+			  "UART_BT_TX_AP_RX",
+			  "MIPI_DPI_D0_R",
+			  "MIPI_DPI_D1_R",
+			  "MIPI_DPI_D2_R",
+			  "MIPI_DPI_D3_R",
+			  "MIPI_DPI_D4_R",
+			  "MIPI_DPI_D5_R",
+			  "MIPI_DPI_D6_R",
+			  "MIPI_DPI_D7_R",
+			  "MIPI_DPI_D8_R",
+			  "MIPI_DPI_D9_R",
+			  "MIPI_DPI_D10_R",
+			  "",
+			  "",
+			  "MIPI_DPI_DE_R",
+			  "MIPI_DPI_D11_R",
+			  "MIPI_DPI_VSYNC_R",
+			  "MIPI_DPI_CLK_R",
+			  "MIPI_DPI_HSYNC_R",
+			  "PCM_BT_DATAIN",
+			  "PCM_BT_SYNC",
+			  "PCM_BT_DATAOUT",
+			  "PCM_BT_CLK",
+			  "AP_I2C_AUDIO_SCL",
+			  "AP_I2C_AUDIO_SDA",
+			  "SCP_I2C_SCL",
+			  "SCP_I2C_SDA",
+			  "AP_I2C_WLAN_SCL",
+			  "AP_I2C_WLAN_SDA",
+			  "AP_I2C_DPBRDG_SCL",
+			  "AP_I2C_DPBRDG_SDA",
+			  "EN_PP1800_DPBRDG_DX",
+			  "EN_PP3300_EDP_DX",
+			  "EN_PP1800_EDPBRDG_DX",
+			  "EN_PP1000_EDPBRDG",
+			  "SCP_JTAG0_TDO",
+			  "SCP_JTAG0_TDI",
+			  "SCP_JTAG0_TMS",
+			  "SCP_JTAG0_TCK",
+			  "SCP_JTAG0_TRSTN",
+			  "EN_PP3000_VMC_PMU",
+			  "EN_PP3300_DISPLAY_DX",
+			  "TOUCH_RST_L_1V8",
+			  "TOUCH_REPORT_DISABLE",
+			  "",
+			  "",
+			  "AP_I2C_TRACKPAD_SCL_1V8",
+			  "AP_I2C_TRACKPAD_SDA_1V8",
+			  "EN_PP3300_WLAN",
+			  "BT_KILL_L",
+			  "WIFI_KILL_L",
+			  "SET_VMC_VOLT_AT_1V8",
+			  "EN_SPK",
+			  "AP_WARM_RST_REQ",
+			  "",
+			  "",
+			  "EN_PP3000_SD_S3",
+			  "AP_EDP_BKLTEN",
+			  "",
+			  "",
+			  "",
+			  "AP_SPI_EC_CLK",
+			  "AP_SPI_EC_CS_L",
+			  "AP_SPI_EC_MISO",
+			  "AP_SPI_EC_MOSI",
+			  "AP_I2C_EDPBRDG_SCL",
+			  "AP_I2C_EDPBRDG_SDA",
+			  "MT6315_PROC_INT",
+			  "MT6315_GPU_INT",
+			  "UART_SERVO_TX_SCP_RX",
+			  "UART_SCP_TX_SERVO_RX",
+			  "BT_RTS_AP_CTS",
+			  "AP_RTS_BT_CTS",
+			  "UART_AP_WAKE_BT_ODL",
+			  "WLAN_ALERT_ODL",
+			  "EC_IN_RW_ODL",
+			  "H1_AP_INT_ODL",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "MSDC0_CMD",
+			  "MSDC0_DAT0",
+			  "MSDC0_DAT2",
+			  "MSDC0_DAT4",
+			  "MSDC0_DAT6",
+			  "MSDC0_DAT1",
+			  "MSDC0_DAT5",
+			  "MSDC0_DAT7",
+			  "MSDC0_DSL",
+			  "MSDC0_CLK",
+			  "MSDC0_DAT3",
+			  "MSDC0_RST_L",
+			  "SCP_VREQ_VAO",
+			  "AUD_DAT_MOSI2",
+			  "AUD_NLE_MOSI1",
+			  "AUD_NLE_MOSI0",
+			  "AUD_DAT_MISO2",
+			  "AP_I2C_SAR_SDA",
+			  "AP_I2C_SAR_SCL",
+			  "AP_I2C_PWR_SCL",
+			  "AP_I2C_PWR_SDA",
+			  "AP_I2C_TS_SCL_1V8",
+			  "AP_I2C_TS_SDA_1V8",
+			  "SRCLKENA0",
+			  "SRCLKENA1",
+			  "AP_EC_WATCHDOG_L",
+			  "PWRAP_SPI0_MI",
+			  "PWRAP_SPI0_CSN",
+			  "PWRAP_SPI0_MO",
+			  "PWRAP_SPI0_CK",
+			  "AP_RTC_CLK32K",
+			  "AUD_CLK_MOSI",
+			  "AUD_SYNC_MOSI",
+			  "AUD_DAT_MOSI0",
+			  "AUD_DAT_MOSI1",
+			  "AUD_DAT_MISO0",
+			  "AUD_DAT_MISO1";
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.36.1


