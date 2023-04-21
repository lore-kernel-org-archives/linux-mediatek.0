Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24B1C7618E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0I1sPCdYN0SbjWyDhk4aoTpPCovY0PSzi4d7N1NDJg=; b=mr1g9qi4cOw6ZLhDiZw+7ntkfZ
	HSsOROvp1PY+oVpnR8QesNdNHCiiVh4Y5JJzQPPMRkaiMGLz348xzJCV1XeoJlAbgMU6p8Umzcn/4
	Kp1smkkp9eOHftohdE16n5QWphB4ajWPsGi8kWdOoCO0pfVyCXgDkqrjWLGV8HFw6qUQ+rDNxBqLu
	OqjFZcFHMZ1IHZ+JIfxvn82Fm4unf5Q0xUTCQ9PTp2kYaC35oLSZBDz9qNfRoJ+YaQpAXd2bcYrUx
	Tsc1gZNglNFgGDAApM2YTiToUAfisXi+NxTrQtYqC5mnbkI4eIeeJXCzd8rl8ptFkYa9vYYsrkeCP
	HrEYsBqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pppgD-00Aq6S-35;
	Fri, 21 Apr 2023 12:15:57 +0000
Received: from mail-pf1-f179.google.com ([209.85.210.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppoYE-00Afw3-2t
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 11:03:40 +0000
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b52ad6311so2590906b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682075017; x=1684667017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m0I1sPCdYN0SbjWyDhk4aoTpPCovY0PSzi4d7N1NDJg=;
        b=mc1zwRaK4FAH7g6eSmoxngIMQ+5NXpyIKsfLdgr5W8xUrUlq9W7TbZkKtInZhi+DfH
         +otn/a7Mxi6OW2qTj0rtw+7PHVob4Hzgl+wa8tfdAwGGhx5SPWFzGlHv/cNk6hzFBOUP
         y+jq2HY6gxEhJJlakAZcN6zK4wg1LXE4/we4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682075017; x=1684667017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0I1sPCdYN0SbjWyDhk4aoTpPCovY0PSzi4d7N1NDJg=;
        b=dwt0Y8uJbEVkXdwFkIHZVhcVADspBFEaj6b/czazvN71JblGY2vNVElusZhXLtQ2dE
         tcd1qXRP+JcCLYzpBAmiygmV28ltvpJLRv/JmYt1hQlymFgKovpkTS5rRMhq5NS/J7qh
         thcriNrjo+GAIT/+bfa11uMHm4/T4e3VL7C1iueyQwDgXRFJmrf/2K6rWbusT0B1T38e
         JOKKf2kMCxzsei58KnjtQ/Ud0Ft4OKdHb3Wem/QQQMK7Gd2VR9IT47jzNr8vUUhLqfoQ
         ACWXprejcw/eXxJHLu6iSwbUSVdDjaxWpikeGqRDqhwMpsyF7lKyCZWu2gy8qNoQS7dC
         Vu4w==
X-Gm-Message-State: AAQBX9dUXUBjpdOTyv19Gzau/syaKJ8sfD1OWfEfrfS0CePkW4i5QVSQ
	IXJsKiL3zAvQMcjtX4sVgotRdg==
X-Google-Smtp-Source: AKy350bwnnxLR6pYSUpKWU0Q4r+z54dq3jUrc4qFIiJZ2/JeH/C++AywzL44Oskd0E07kjJUUHSwww==
X-Received: by 2002:a05:6a20:4323:b0:ef:acca:9e19 with SMTP id h35-20020a056a20432300b000efacca9e19mr6865535pzk.14.1682075017705;
        Fri, 21 Apr 2023 04:03:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:47fa:fa8d:a971:f6ac])
        by smtp.gmail.com with ESMTPSA id fb31-20020a056a002d9f00b005e5b11335b3sm2801286pfb.57.2023.04.21.04.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 04:03:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada-hayato: Enable Bluetooth
Date: Fri, 21 Apr 2023 19:03:27 +0800
Message-ID: <20230421110327.2395804-1-wenst@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_040338_966040_D7157A40 
X-CRM114-Status: GOOD (  10.23  )
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

Hayato's Realtek WiFi/BT module has it's Bluetooth function wired to
UART1.

Add and enable the relevant device nodes for it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
index 43a823990a92..6a7d7870525b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
@@ -40,9 +40,89 @@ CROS_STD_MAIN_KEYMAP
 	>;
 };
 
+&pio {
+	bt_pins: bt-pins {
+		bt_kill: pins-bt-kill {
+			pinmux = <PINMUX_GPIO144__FUNC_GPIO144>; /* BT_KILL_L */
+			output-low;
+		};
+
+		bt_wake: pins-bt-wake {
+			pinmux = <PINMUX_GPIO22__FUNC_GPIO22>;  /* bt to wake ap */
+			bias-pull-up;
+		};
+
+		ap_wake_bt: pins-ap-wake-bt {
+			pinmux = <PINMUX_GPIO168__FUNC_GPIO168>; /* AP_WAKE_BT_H */
+			output-low;
+		};
+	};
+
+	uart1_pins: uart1-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO94__FUNC_URXD1>;
+			input-enable;
+			bias-pull-up;
+		};
+
+		pins-tx {
+			pinmux = <PINMUX_GPIO95__FUNC_UTXD1>;
+		};
+
+		pins-cts {
+			pinmux = <PINMUX_GPIO166__FUNC_UCTS1>;
+			input-enable;
+		};
+
+		pins-rts {
+			pinmux = <PINMUX_GPIO167__FUNC_URTS1>;
+			output-enable;
+		};
+	};
+
+	uart1_pins_sleep: uart1-pins-sleep {
+		pins-rx {
+			pinmux = <PINMUX_GPIO94__FUNC_GPIO94>;
+			input-enable;
+			bias-pull-up;
+		};
+		pins-tx {
+			pinmux = <PINMUX_GPIO95__FUNC_UTXD1>;
+		};
+		pins-cts {
+			pinmux = <PINMUX_GPIO166__FUNC_UCTS1>;
+			input-enable;
+		};
+		pins-rts {
+			pinmux = <PINMUX_GPIO167__FUNC_URTS1>;
+			output-enable;
+		};
+	};
+};
+
 &touchscreen {
 	compatible = "hid-over-i2c";
 	post-power-on-delay-ms = <10>;
 	hid-descr-addr = <0x0001>;
 	vdd-supply = <&pp3300_u>;
 };
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&uart1_pins>;
+	pinctrl-1 = <&uart1_pins_sleep>;
+	/delete-property/ interrupts;
+	interrupts-extended = <&gic GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&pio 94 IRQ_TYPE_EDGE_FALLING>;
+
+	bluetooth: bluetooth {
+		compatible = "realtek,rtl8822cs-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_pins>;
+
+		enable-gpios = <&pio 144 GPIO_ACTIVE_HIGH>;
+		device-wake-gpios = <&pio 168 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&pio 22 GPIO_ACTIVE_LOW>;
+	};
+};
-- 
2.40.0.634.g4ca3ef3211-goog


