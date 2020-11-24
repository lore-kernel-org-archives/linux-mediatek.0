Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C542C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 04:13:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3065D2072C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 04:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wQXWoLAX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VuX6Oo/7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3065D2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8UTToppjmf/PKzGfxcJ3PlGTnv+vXr2MCP8HInN2UiU=; b=wQXWoLAXhrVwR/8W+qL+LAOaGQ
	NRuRLkCmmlxz82fdYetIeZqEzeWdKG/S4IEOEspRLfR01Vt5mOwHKkMdTBaE5SLiXqst/aMfx6OIS
	AD/3Mu8hBbWHYs8YzV/tOxGwUVOmLC0+hbyIBaAVuWXc8KrDANgUcetFVv31DWXHRuDcdRZPtaLaN
	/XlNCiZs3M6Qt4jYQoYEmBc0iIN7ODIcTOJ48L8c3fb4G2NtMPEsUezYOZ7Q/PASXg4ptmWQacb7s
	SQ1v4KfXR8/j/GD5RC7PI1I2dWbrvbqRVdWb5vjC1yqZQtzgs8MTJjFyehzog2foXqjOHnWRrjsvE
	gCTaVigw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khPhf-0003xY-6i; Tue, 24 Nov 2020 04:13:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khPhd-0003wn-LM
 for linux-mediatek@lists.infradead.org; Tue, 24 Nov 2020 04:13:18 +0000
Received: by mail-pg1-x535.google.com with SMTP id w4so16265527pgg.13
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2020 20:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ssE2rkcenapq+x01obSYaE3MnwfSXU+ZOnv8ujkQ9Ew=;
 b=VuX6Oo/7aAGiwVPeYURTPR2s3/UpFMbgk1E7E8z8vtpW0ZZJln8Yv1kD3Rso2pubwB
 bqfjiP0gLtvMbJn1R3M3fyrA8ykiHDA93IwMsvpTrZUeUQF38kkKvuhuGN93M56JueyB
 myF3j1IeMGWOjrci9sQy2NMdi3gPba55Cqclc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ssE2rkcenapq+x01obSYaE3MnwfSXU+ZOnv8ujkQ9Ew=;
 b=FR8wUwVgb2l14CuSvFbODEy/E/8fVfGTElDhTHI4qlPaz+o5n+X3yHg0h3kudmSW9D
 r4G0IzFopjrfqTz9QxTFTsyU91/p7sX+tU4X8dJwDQ57/0/D4uqYHrg69GNTK5TGfEIz
 satdAk6ORhRLR0ed5NVmmhLRGkNDpWPzdUxzWc1BFz95AZfQqD6w+jshwMjcplcSHoRd
 kAndrxWrNKfVIfYE98KI4HA3EcwmIaYd1xE8/4jZSYQ9yNyHy9s5KTRuYqsThCJnSonQ
 aGx6DeU9RT0q+6FX5qpmsh/D/HcbRkxazFvzSRyUNpCKkgJ2s+RM/D3K/4xWa1IflwQi
 esEQ==
X-Gm-Message-State: AOAM532rInSPoC39qAFlnjSvwfEhQ2KwLmngCyXopvXjRSJfIJdhY8ZS
 /41bx94Q2yocOoLnrTDE52rDzQ==
X-Google-Smtp-Source: ABdhPJytodyqoVaYOATZjSTTMStbhpj9VvjR1hPJ6OwERCe+wrABF9KQfnHIygXjjdYU2sNuESsLYQ==
X-Received: by 2002:aa7:86d8:0:b029:18b:585b:3b16 with SMTP id
 h24-20020aa786d80000b029018b585b3b16mr2422645pfo.72.1606191193618; 
 Mon, 23 Nov 2020 20:13:13 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id g3sm4443573pfr.145.2020.11.23.20.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 20:13:12 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183: Add pwm and backlight node
Date: Tue, 24 Nov 2020 12:12:54 +0800
Message-Id: <20201124041253.4181273-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_231317_751618_7BFC44C1 
X-CRM114-Status: GOOD (  11.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add pwm to mt8183 and backlight to mt8183-kukui.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 28 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 10 +++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 85f7c33ba4461..bf2ad1294dd30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -19,6 +19,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	backlight_lcd0: backlight_lcd0 {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 500000>;
+		power-supply = <&bl_pp5000>;
+		enable-gpios = <&pio 176 0>;
+		brightness-levels = <0 1023>;
+		num-interpolated-steps = <1023>;
+		default-brightness-level = <576>;
+		status = "okay";
+	};
+
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
@@ -536,6 +547,17 @@ pins_clk {
 		};
 	};
 
+	pwm0_pin_default: pwm0_pin_default {
+		pins1 {
+			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
+			output-high;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <PINMUX_GPIO43__FUNC_DISP_PWM>;
+		};
+	};
+
 	scp_pins: scp {
 		pins_scp_uart {
 			pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
@@ -670,6 +692,12 @@ pins_wifi_wakeup {
 	};
 };
 
+&pwm0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pin_default>;
+};
+
 &scp {
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 08a914d3a6435..a974bad899365 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -479,6 +479,16 @@ spi0: spi@1100a000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@1100e000 {
+			compatible = "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
+			#pwm-cells = <2>;
+			clocks = <&topckgen CLK_TOP_MUX_DISP_PWM>,
+					<&infracfg CLK_INFRA_DISP_PWM>;
+			clock-names = "main", "mm";
+		};
+
 		i2c3: i2c@1100f000 {
 			compatible = "mediatek,mt8183-i2c";
 			reg = <0 0x1100f000 0 0x1000>,
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
