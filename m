Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853A8C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:04:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25923229CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25923229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UqqMuxprr6Q5LFlY3pRXw2y34dMfFjI1unmRh0MPLFg=; b=gy9i1XiwwtVkfHArhCooj/1mwS
	G5xLkVKhYtpuBaZqQ+LYOnlKvw5VqLvcukcK4aPIsMjXAe45icgFY2PVh3GtcE9+kVzqADIU1qzjb
	rf1xFITURHCOU5yIPnAHrskDbD6hpHmpamTy+yWEwQ40LERbqZC5dOUQbARoyT2Pa2a4EWSKu8Iqc
	EnDuGCc5ytsx07pVQSG7LNXVmX4KgaCuskSbBmmwcVeEW45n8TsQCSH3hv9JTcjy6GEw6sonSuh9N
	iN1DqmYXnSxWX3SQVQLEWhL9sKoa7SuM80o7ZOfIRc9SA02SV3mMorqxFaCmKDjzUDkZkaL7QJFSU
	sTRtsodQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdx2-0004ru-1D; Wed, 13 Jan 2021 11:04:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdwv-0004oR-M0
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 11:04:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id d4so868190plh.5
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 03:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qi6TAbH6xq2gb5QhoJgs+Zx34VA+1B8w65ilqHtaQhg=;
 b=niAlQ6mrmMUTgxTuk/wIFV0dA5FTNL/q7yIeA3KMpPiYrOoeMif/GrsGlBNo4nO5hX
 jS0IBXikG2Rz7tuBf7Cg5OWlFEnPLysXBKbE8NfGrDC26Fn1rRXbr3IGMutv7qZjs1ix
 LuL6120cwyB2sznVfa8VmXkijtJmiiqz/Wodw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qi6TAbH6xq2gb5QhoJgs+Zx34VA+1B8w65ilqHtaQhg=;
 b=j9Kc19kEYjrNIIja5ewj9FwkR0FMCTY8LoZxt+uwcFimuIJXm5EGkMaOyomNAHboFv
 R/N0zlQcCSBGC1ahyGGqqBsj7m1qsfkw4vfrfUw7THjyvGlW1bumz9oz1jspIOk2Qru7
 GtfqI6HDFf8554RmlxOIW/AmCtjMUN4kbUnAHnzDu/PCBzB3hIv47VXcAhDHuVNyQZyL
 4/iSS2fYyU89o8uaZa9YTu0YGlGufwxNf17fZsPjm81S55qtvrbVwCqdlsjdLiWlQ5fW
 SRQ9C+ihn0QqGvcCO0bk5gj9hWGklgLj5JLPrviTbLGpB4Y0D6S/mj64b1HIOXyHTNnC
 gJvQ==
X-Gm-Message-State: AOAM530Kwuz9ae9A0tJTtPbSTQ0NUFyWJ3H2zSC3uGzX+AZnz3ISY1zR
 p8bgDeMTaDsV/Ev3dZ0UBx76XA==
X-Google-Smtp-Source: ABdhPJwqXk7qSn7z63czfXwWGRHHdTzvY1QViHROIw4GMPDd5xlJEcOqPF8W7QFFkzxLCyFUXJv/fg==
X-Received: by 2002:a17:902:c005:b029:db:1d7:658f with SMTP id
 v5-20020a170902c005b02900db01d7658fmr1625118plx.35.1610535863499; 
 Wed, 13 Jan 2021 03:04:23 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id o129sm2114749pfg.66.2021.01.13.03.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 03:04:22 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 1/3] arm64: dts: mt8183: config dsi node
Date: Wed, 13 Jan 2021 19:03:59 +0800
Message-Id: <20210113110400.616319-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_060425_834654_902A6166 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Config dsi node for mt8183 kukui. Set panel and ports.

Several kukui boards share the same panel property and only compatible
is different. So compatible will be set in board dts for comparison
convenience.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
---
change:
v4: add backlight and enable mipi_tx0
---
 .../mediatek/mt8183-kukui-krane-sku176.dts    |  5 +++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 42 +++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
index 47113e275cb52..721d16f9c3b4f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
@@ -16,3 +16,8 @@ / {
 	model = "MediaTek krane sku176 board";
 	compatible = "google,krane-sku176", "google,krane", "mediatek,mt8183";
 };
+
+&panel {
+        status = "okay";
+        compatible = "boe,tv101wum-nl6";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index bf2ad1294dd30..da1e947587074 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -249,6 +249,36 @@ &cpu7 {
 	proc-supply = <&mt6358_vproc11_reg>;
 };
 
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+
+	ports {
+		port {
+			dsi_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
@@ -290,6 +320,10 @@ &i2c6 {
 	clock-frequency = <100000>;
 };
 
+&mipi_tx0 {
+	status = "okay";
+};
+
 &mmc0 {
 	status = "okay";
 	pinctrl-names = "default", "state_uhs";
@@ -547,6 +581,14 @@ pins_clk {
 		};
 	};
 
+	panel_pins_default: panel_pins_default {
+		panel_reset {
+			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
+			output-low;
+			bias-pull-up;
+		};
+	};
+
 	pwm0_pin_default: pwm0_pin_default {
 		pins1 {
 			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
-- 
2.30.0.284.gd98b1dd5eaa7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
