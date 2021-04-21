Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DDFC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:10:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C0C61430
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C0C61430
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c/82zbBQBT/EXqHPVgNQA15Aj0u5M5mvE284T12d7JQ=; b=a6BMNFs5a4K1/x4e5auK94Z21
	TB4+0Cud1H3o76JxLM/gmlKCBc5pwwb2tzB+QhdjoubZbe/o7m9CPzFaPBd/UbkfyH19gKTl5ghwH
	sXprsZQUGTnHzcAIzRSFaQ6ZXeFs0hBhvcBPSV7s2XO0l6aTkvua4x0AR1MEYLnepA/2ePDQcrs3e
	JGyKR6eBDuXBo1VmNlwqab3J9UTdL7ma52oNR8FRvZTpbxwm7wPOrVpzbw9ACw6ZkQdEgiaVAqQFS
	VtMPwXgcHscp2FtqLMxQIHZG2hTf1OhC2ix/6v5FzJwqCoDXq5q2gZW4lbOeHseAqCg/2vY2RhCPK
	ho2zSJaRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8sB-00E4Fp-NV; Wed, 21 Apr 2021 09:10:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oY-00E2yV-Q4
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sk0aghWAXiuY04TlYdrwhlUuLk1uH7qefHmT/IdZMDg=; b=mtntMcoFgMIC0gyHRODacVACLo
 C+cVFENNbdkNsas/ZbFM1BLS2XKTEpLKE+dEEh/qmZiK9DEl1Co7kz3icy0egmimK7ruEmbwPVD1R
 AH7j0ycwSrKwBhR/EbaSfXDaA3sNYNioahoWBbDXwTV9E4aNEozMczHomO3T7cYOlAigp3jSlhdQY
 bVN8z59nhrBVR6rHw/jVV4tFvzJqOmROwYKkshrhtD/NYv+5UKjKx1FOo5Piqt6vgJYjiR25fWzqP
 ZGXVbgr/7kkFAFESsMoujPXGcaZM3RD15rh9XVkE0ACoTnEcn4iRg+wDBhRz6EXiTia7xid1P/nTj
 aVIqrBZw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oT-00CjiZ-Iy
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y62so4318266pfg.4
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sk0aghWAXiuY04TlYdrwhlUuLk1uH7qefHmT/IdZMDg=;
 b=X1z4+mbKLpRObRWvepNJAEU8M64wuBuiqxLX549X+Ho8iRE5kaQD90yRHfHCY+YJ6g
 FM8LaOVK1/LdWKWgkNWbU+n3nwqg8lp67hlUI1TOdQ2mcwKv2oZTuiocfajeExKfeUV7
 O/1pyQwQXhYeTpQv9ql/qWWY7D6cxwf+5pPlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sk0aghWAXiuY04TlYdrwhlUuLk1uH7qefHmT/IdZMDg=;
 b=r+8BUneoi1CNVYc5R9Kj1saEeUKc6Mi7sV7cjd1w8jht7IuutGlR/MLxk3IAPWQPBW
 zpWMG81E/AcyCE0KlxM5gpU0Oxiurw6l3KZZiyVBG21gdiRgCnqfUiddECpH7DwWLC54
 o9OLh6K28PWqSTXhzP518xObLy2qrb392lpMt/D1mvE3zBODsETdSXsEec2EKfWoXFaa
 qmKw7fqjaROpZUKAstSKBAQysMuyyQ7f6gmGStrG2e+QcrJ1Ftkrt2NKXLWfCthzhtbA
 NAgpYX9V98Cz1KHBnZaxKZLdrgkFJpUQJ2y2yyEihXi5SqO0EpGYk8EVbRXY3Ge9QxjA
 fb0A==
X-Gm-Message-State: AOAM531+zuN3p44juPrSyD85tiV8Rg1maonDvrG4tiCRNYv441mf1ZF8
 MgoYyFVOB6MDoqRXCmHqxfAk0Q==
X-Google-Smtp-Source: ABdhPJwx8xPcPkWj8CVwq7V7TaSoTM3OM9ne0/1AqA3lNvcjnZl3HcAtiDGW8d97DRHzqFh/tgp/pQ==
X-Received: by 2002:a17:90a:1b42:: with SMTP id
 q60mr10308555pjq.230.1618995984831; 
 Wed, 21 Apr 2021 02:06:24 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:24 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 10/10] arm64: dts: mt8183: Add kukui-jacuzzi-fennel board
Date: Wed, 21 Apr 2021 17:06:01 +0800
Message-Id: <20210421090601.730744-11-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020625_634658_85DE94D8 
X-CRM114-Status: GOOD (  15.58  )
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

Fennel is known as Lenovo IdeaPad Flex 3 Chromebook.
Fennel14 is known as Lenovo IdeaPad 3 Chromebook.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  3 ++
 .../mt8183-kukui-jacuzzi-fennel-sku1.dts      | 44 +++++++++++++++++++
 .../mt8183-kukui-jacuzzi-fennel-sku6.dts      | 32 ++++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 27 ++++++++++++
 .../mt8183-kukui-jacuzzi-fennel14.dts         | 16 +++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  8 ++++
 6 files changed, 130 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 25770d83059d..4f68ebed2e31 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -15,6 +15,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku1.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku6.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
new file mode 100644
index 000000000000..ef6257c9a2d2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+
+/ {
+	model = "Google fennel sku1 board";
+	compatible = "google,fennel-sku1", "google,fennel", "mediatek,mt8183";
+
+	pwmleds {
+		compatible = "pwm-leds";
+		keyboard_backlight: keyboard-backlight {
+			label = "cros_ec::kbd_backlight";
+			pwms = <&cros_ec_pwm 0>;
+			max-brightness = <1023>;
+		};
+	};
+};
+
+&cros_ec_pwm {
+	status = "okay";
+};
+
+&touchscreen {
+	status = "okay";
+
+	compatible = "hid-over-i2c";
+	reg = <0x10>;
+	interrupt-parent = <&pio>;
+	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&touchscreen_pins>;
+
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL";
+};
+
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
new file mode 100644
index 000000000000..899c2e42385c
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+
+/ {
+	model = "Google fennel sku6 board";
+	compatible = "google,fennel-sku6", "google,fennel", "mediatek,mt8183";
+};
+
+&touchscreen {
+	status = "okay";
+
+	compatible = "hid-over-i2c";
+	reg = <0x10>;
+	interrupt-parent = <&pio>;
+	interrupts = <155 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&touchscreen_pins>;
+
+	post-power-on-delay-ms = <10>;
+	hid-descr-addr = <0x0001>;
+};
+
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL";
+};
+
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
new file mode 100644
index 000000000000..bbe6c338f465
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
+&i2c2 {
+	trackpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&trackpad_pins>;
+
+		interrupts-extended = <&pio 7 IRQ_TYPE_LEVEL_LOW>;
+
+		wakeup-source;
+	};
+};
+
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
new file mode 100644
index 000000000000..e8c41f6b4b0d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+
+/ {
+	model = "Google fennel14 sku0 board";
+	compatible = "google,fennel-sku0", "google,fennel", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 4049dff8464b..d8826c82bcda 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -92,6 +92,14 @@ volume_up {
 	};
 };
 
+&cros_ec {
+	cros_ec_pwm: ec-pwm {
+		compatible = "google,cros-ec-pwm";
+		#pwm-cells = <1>;
+		status = "disabled";
+	};
+};
+
 &dsi0 {
 	status = "okay";
 	/delete-node/panel@0;
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
