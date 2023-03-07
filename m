Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104CFC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEysRp2LLNbE8OqaqMCJkdE0HWAQiicQ5qKiXMYvwo8=; b=MJ2pU1EL9liM0s78NKyvz4Igwm
	1fAFT25kOpzCKeBG0VO0MgIMB4YDjgZ95grXn8tZo65DALAdnlZDT5hjSerOM07Pb0H/P1Bj08rXu
	TA9P1e3VyRZGVhTOOnaagc0XaJCvCWxK5sowVKNyrd5VFoKqGHBvmIlQjg3s++5b5N7JMUNMl8uD7
	vBpCTN4Dn7Il9XUbtH+/a3JyU8wlDdNCqGFAu4JnL2nah9s609eBQQPEw6L7uSwJFj+p+gVBKxEHT
	e6pzJuAA5aaGbrENnGyTu0yDUBM9M6I8Cbu9xCNqrtD69Hpr+IBOtHulc2FgawtZkXV2ALSsuqQO9
	XpmQRR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZ3p-001ATf-N0; Tue, 07 Mar 2023 15:17:05 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYZe-000vXb-ET
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Mar 2023 14:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=oEysRp2LLNbE8OqaqMCJkdE0HWAQiicQ5qKiXMYvwo8=; b=NNK6xafx5jwlKGeqGPyh6zbJKs
	HRANLvld6wrX7UtPvOsq0rUkVMpDIXAedH4L8Xz30yFCgxCqmO4VLZaOSnavxueoSy4pNbvr6kpQZ
	vaJkTNYffNdy+6GpCXfqfDcIoHrMFqofwdSkDBzzaLv0sUnWAUe1ESvhXZlBKw2qpusXTHkpp63v8
	dxom/CMPWstc5DsdinCMmznOMiuScbI8ScPgnGgDQpF8+MuzFDZVPT7ZDf/xXLhmQpBX9B4mQ8TfD
	5+3YgNOc0XKi+Kzzi1SBhXnMaDlpvxImoGff3EVf/Z0CBpTTaNhQv/Iyw+tf7fB/fBCUI6owk/a/k
	eUyrLS2Q==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZXCs-00H3CZ-1y
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Mar 2023 13:18:21 +0000
Received: by mail-wm1-x332.google.com with SMTP id k37so7779159wms.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEysRp2LLNbE8OqaqMCJkdE0HWAQiicQ5qKiXMYvwo8=;
        b=tSdosrxc8Clpmhy8Ka6GWoretGf8XlhU4bfZgM0aufGyol9spfbL4Eftq3UtWOs75f
         Ar6kRW9XcNM1q54Kdix/xlXPUCj4IFwv/kaXEF+Rk++2V8mndJmb3mkgDvZzZI2YvX8W
         8h1n2OOKhAcv1MpD3N4ACEq5NS+0dI2b+UHJULLIisICd2jr3/O27HUmRQ8n42eUs0qW
         wUJtw+iFbCyAC/cy9MmNEZZsZ2sTdbwLf2S2fQG8KwLu/RoYkiQyZXuyGDWs6QweXmas
         uTm0FMmQ/PNzJaYihsT/0qE6g9rEltE4+hMR/Y5YjUi1T2NmZl9CTX4Q/P0O5Rsbo0R1
         MpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEysRp2LLNbE8OqaqMCJkdE0HWAQiicQ5qKiXMYvwo8=;
        b=l732wqfUcHOjtexRzHuXfocGZZaZ586IriMRucXuZLMAHu3n3t/aU8QUUUI88LlOhQ
         t2QAz2dx0ssjE+TiRl1XtL89ESRuES+QvSL1VMutV5ULnaVS6SwOK9eRIzRC+xnl8ouQ
         yZrb97QO3BVZGMstzV+EPpmWNX5lT1fB8fA9wSdpGhYwM7siupPoYhxJR+EzoH7nLPDQ
         QyJwSvgWOffv0soxb6RL4xBDZ4w/xe9oDT8PKbKj7LBx9CGOyssQsioLdLpDzo1P7Etl
         eE2LG0VyRaExWQL30dW+x4quLHfNnjyEsgPWSU8dQojZ1tOFoN1895QUBe7fWWcVezPN
         zxGA==
X-Gm-Message-State: AO0yUKVfGKvhtAFHVQPtLx72xap5ZwHo9tYk53MttjE8DSCjIbq1H0yT
	8cb94glHjLXqpz2quTjywWrn2Q==
X-Google-Smtp-Source: AK7set9Sg3L/dtrfvuq35AvI3lyloaM2L7q6P1AskVtybYA0Ssbgwopv3ZiUmeTeiyf/sqtbn3+AuQ==
X-Received: by 2002:a05:600c:4751:b0:3eb:2e66:8 with SMTP id w17-20020a05600c475100b003eb2e660008mr13128115wmo.35.1678195095698;
        Tue, 07 Mar 2023 05:18:15 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:15 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:43 +0100
Subject: [PATCH v2 14/18] arm64: dts: mediatek: add ethernet support for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-14-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2433; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Tf5+10DbTH8JmWbl0F1BhURJNU0ijmIE+qOre9BoIzg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmF/sAhqWjUqlEjJxepXUShC/SRz4SMSPGgs8dc
 8Y4hC5qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURYrNEA
 C7FKCe06Tg3Xme8I9oeXAXAoQPa/GtIYgVzAnKYh8IYPyu/sjV1POXjfi2nmaSkHupKfhC6R0T2+Sp
 D6DwqRzHGwmVQlO3KzXiY2FjTBJEv8YbjiGNMdtfBhFKR2uvkKmugRENznoWO3joVv6M3Xjzk9ZjUP
 +MNSljha6j/IgWjT6UVeJmOQM8v6hHAuiOqttsrR5zwyCg5wtpCp05bcRDeyIvLJnKGJVglkdu09mm
 7vOTsUpvszwFG+sEkijxxCPmhGcM6uqxIs/cdsnInOlgz4MGkF+S88eLc+MUFY1ss7AhhIWCx8t8og
 VbnKLRI6df/8HfIaMAfhZCyA1wzrUIRkPWiO4iSYu/y8oGTQqBQW1nBY+5i4LYwaznCV6Jccbhc5kP
 FksNuR3D9SRQRJTNkPHb0Din5Tqag8K1GzY1asD1IaK1qsMXyxH8uFkHiGWUw8Nl1Ptl5DKVnd5Afn
 bzWgZHA9MPLBnS13N32jkit1bvE0h4Qeo+cTO5czH8BB2BqQYzR/KBGCTPPalaR7ufapYP2mBKimU8
 MJrKDx1uwmlWHYSrp2uI37SgGrdZ63hXOhtokvakvxUlMh8BWW+nu0+4wLsHkSj3O10fLPumy4SNSA
 pL7/MLDWW68rw9qikXp8l/oBuJCESSj43uffFxrd93bef/tvrhsZ48aF93Jw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131818_770704_AFD66FA0 
X-CRM114-Status: GOOD (  11.55  )
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

- Enable "vibr" and "vsim2" regulators to power the ethernet chip.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 57 +++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 868ee0d160e4..1820daad6da3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -88,6 +88,28 @@ optee_reserved: optee@43200000 {
 	};
 };
 
+&ethernet {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ethernet_pins>;
+	phy-handle = <&eth_phy>;
+	phy-mode = "rmii";
+	/*
+	 * Ethernet and HDMI (DSI0) are sharing pins.
+	 * Only one can be enabled at a time and require the physical switch
+	 * SW2101 to be set on LAN position
+	 */
+	status = "disabled";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
@@ -140,12 +162,47 @@ &mt6357_pmic {
 	#interrupt-cells = <2>;
 };
 
+/* Needed by analog switch (multiplexer), HDMI and ethernet */
+&mt6357_vibr_reg {
+	regulator-always-on;
+};
+
 /* Needed by MSDC1 */
 &mt6357_vmc_reg {
 	regulator-always-on;
 };
 
+/* Needed by ethernet */
+&mt6357_vsim2_reg {
+	regulator-always-on;
+};
+
 &pio {
+	ethernet_pins: ethernet-pins {
+		phy_reset_pins {
+			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;
+		};
+
+		rmii_pins {
+			pinmux = <MT8365_PIN_0_GPIO0__FUNC_EXT_TXD0>,
+				 <MT8365_PIN_1_GPIO1__FUNC_EXT_TXD1>,
+				 <MT8365_PIN_2_GPIO2__FUNC_EXT_TXD2>,
+				 <MT8365_PIN_3_GPIO3__FUNC_EXT_TXD3>,
+				 <MT8365_PIN_4_GPIO4__FUNC_EXT_TXC>,
+				 <MT8365_PIN_5_GPIO5__FUNC_EXT_RXER>,
+				 <MT8365_PIN_6_GPIO6__FUNC_EXT_RXC>,
+				 <MT8365_PIN_7_GPIO7__FUNC_EXT_RXDV>,
+				 <MT8365_PIN_8_GPIO8__FUNC_EXT_RXD0>,
+				 <MT8365_PIN_9_GPIO9__FUNC_EXT_RXD1>,
+				 <MT8365_PIN_10_GPIO10__FUNC_EXT_RXD2>,
+				 <MT8365_PIN_11_GPIO11__FUNC_EXT_RXD3>,
+				 <MT8365_PIN_12_GPIO12__FUNC_EXT_TXEN>,
+				 <MT8365_PIN_13_GPIO13__FUNC_EXT_COL>,
+				 <MT8365_PIN_14_GPIO14__FUNC_EXT_MDIO>,
+				 <MT8365_PIN_15_GPIO15__FUNC_EXT_MDC>;
+		};
+	};
+
 	gpio_keys: gpio-keys-pins {
 		pins {
 			pinmux = <MT8365_PIN_24_KPCOL0__FUNC_KPCOL0>;

-- 
b4 0.10.1

