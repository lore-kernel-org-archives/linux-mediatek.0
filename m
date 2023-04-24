Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A66C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2WsBy9D+hRfwOWkrxwmd3lLjMwOzTRUf9EB9Q/QdtQ=; b=GimCda1nzR1ARsmjhOKEQBXlhF
	ba9q0rNyArLzKyzThj8bhaT69KOt1IRVK5kqawMAlNZGcHx9IE6W08dpInWWBcnrQAuf+5vYr8ZFf
	7hs/wIgO+F36o6NXCurcW8/UETTnYIlhXP9DC4o1yB70qVnEgAXaJ3txQfWxlLJCcxoNTCzkI0GLu
	kLcJOAxZyP1NX26lfNPsbtW2F7+mD2VI2dtHQfKWVKU9W5uwpp3G4XChTrsb9C7RCsDAaNZvEer7X
	NvYEqH6BjKE0rUVDw8XRygP/9VR4efvUR5KgTbUm0H1WAhQpLODxKDoNZkFzzB3w2ugze4NWeF3h5
	UQmtz2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqt3q-00FuSb-3A;
	Mon, 24 Apr 2023 10:04:42 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqt3n-00FuRS-10
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 10:04:41 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso3449209b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682330676; x=1684922676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2WsBy9D+hRfwOWkrxwmd3lLjMwOzTRUf9EB9Q/QdtQ=;
        b=QAT8s9jI9J/mNPQLSP2R9Gv0/pCLs36KQ58Jrhu8C6+SrP/N1F/G4CaLqL7IRuYz9m
         o92u1G+OMIkgsdt4DEhrbqxoL4BiGD/GHiQou79/lSFaMsx8t0AIU0c5ARh/U93oJRRO
         hVJ/4lbG3A+A/vWLmsD/lBxcGAuDpvi+5OrPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682330676; x=1684922676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2WsBy9D+hRfwOWkrxwmd3lLjMwOzTRUf9EB9Q/QdtQ=;
        b=AiOL9Qm/jkU4q+2RvIuTRGNIY36C5Vr9U6O/XVjaPM16DFKu+NjYNoPvhSoBlMNos5
         Bw1PaX3BNEWrECn4s2Nc48f39DbebLD3bo+Zv1eTvW4dydE4kNznxm7CWekF+Ng7erLV
         vBYvk6lQUodZ5TnOsVwDOnc4x0qSY72Ei6jCxhhMfaAyhTEw9ZIQe98bY0hdKURbozOU
         Jg5wsIpMatQAf/gEFzWja+9DN0rd75AkZ+lNaN/hzPSYU7snYfSqkLXPKVCZKkyKKOhU
         fkEuJkVRrDCEvPAa1AMbcNJhQUsmUy1B5Fspo8AcWorCrV7xTG1yOtllZNVrZL33/Yzo
         lJcw==
X-Gm-Message-State: AAQBX9ch2JPSf8Wnyj+HknVu6tjgJYHT8CcOLGlccE3XNktZTk8YAOD2
	YmDMoXiOUS0uKyJLGvk7cSkxug==
X-Google-Smtp-Source: AKy350bj/iADyzfE4iDotwQ7l2Rxbf6TbBeW1F3yNWU/4SiigkNJRyIeCg1s+Cm+cSH3JmiMZNXFWQ==
X-Received: by 2002:a05:6a00:cd2:b0:627:6328:79f1 with SMTP id b18-20020a056a000cd200b00627632879f1mr18330546pfv.34.1682330676591;
        Mon, 24 Apr 2023 03:04:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1d00:1ac0:e499:fc5b])
        by smtp.gmail.com with ESMTPSA id j18-20020a056a00235200b0063d46ec5777sm7084425pfj.158.2023.04.24.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 03:04:36 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: mediatek: mt8192-asurada-hayato: Enable Bluetooth
Date: Mon, 24 Apr 2023 18:04:09 +0800
Message-ID: <20230424100409.2992418-1-wenst@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_030439_372186_87E4FAA4 
X-CRM114-Status: UNSURE (   9.53  )
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

Hayato's Realtek WiFi/BT module has it's Bluetooth function wired to
UART1.

Add and enable the relevant device nodes for it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes since v1:
- Dropped unreferenced labels
- Dropped GPIO line name comments
- Fixed pinctrl node names
- Dropped "output-enable" property
- Added spacing between device nodes for consistency

 .../dts/mediatek/mt8192-asurada-hayato-r1.dts | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
index 43a823990a92..6e23428a3ed2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts
@@ -40,9 +40,90 @@ CROS_STD_MAIN_KEYMAP
 	>;
 };
 
+&pio {
+	bt_pins: bt-pins {
+		pins-bt-kill {
+			pinmux = <PINMUX_GPIO144__FUNC_GPIO144>;
+			output-low;
+		};
+
+		pins-bt-wake {
+			pinmux = <PINMUX_GPIO22__FUNC_GPIO22>;
+			bias-pull-up;
+		};
+
+		pins-ap-wake-bt {
+			pinmux = <PINMUX_GPIO168__FUNC_GPIO168>;
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
+		};
+	};
+
+	uart1_pins_sleep: uart1-sleep-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO94__FUNC_GPIO94>;
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
+	bluetooth {
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


