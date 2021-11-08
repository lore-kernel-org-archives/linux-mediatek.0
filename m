Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5F0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC32E60D43
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC32E60D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6PJgYC3syzdtv/AbQHTj0ansWIk2phcqyDr/1EMDqs=; b=hHKa1RUeZMw+vr
	4cwFzV7HvUFWcXCupJF90iIskn0QwLIiqLMX3e8HTAy7K5ul8iw2/XbkdG+iBwOpp8ES/dkCWkD/Z
	h9z8T7NRh3rRCdLSFrFR5IwTe2MCr37tJaGe8P44T5ZK+uMRSvZzNaCy6r/FlhCouPwZwHgJceaY0
	amfzpozpRaTQ4se14t5t0ijosUfUMq+ntPFeQasAknjFCGxWQ4ubLfMz27W03ArvYPyD3qgLikBcF
	gDSR7SLxgOk+7gFpkfiTtwjTTzM9Bu2akYYqmNR4160OBJByU/JoWbNMrrI7TsMGNDd/ZccB6ufV7
	sOnwwaWtmRY/xKzngVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjz4G-00FZFZ-E7; Mon, 08 Nov 2021 07:27:48 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjz3q-00FZ2h-T7
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 07:27:24 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so8094067pjc.4
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqa39s+vxgVR+dxhrZtkvgAdK1DW/ZPp25VXvulqjaE=;
 b=QhFa2WeZX88Bs0WCf7fMhuD7QMmVgzU8otVrSy7Zgz1HaGsQRqOTXucXWIpvs4gsRT
 SN4D4YeiYcu/maV/BBTiUz5HKHNmZqWurD9lzouupzMQcht/m+aWI9YgXc9Case492Ts
 Q2PEbtPj1aNCgQso90RqjSRYrVL1xie3it4VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqa39s+vxgVR+dxhrZtkvgAdK1DW/ZPp25VXvulqjaE=;
 b=QnX4ybzYh+X/g2OcHHm2v52PKWcX3zvMliK5458+TpcFcdXB+YRJLD/Z70viUCrej7
 VD29WGAONYsp9nFL80ELNXD+LeUQFwm4k5vFu5dX4WJ+XDtkWHMmitt6WobNas9eKJMb
 VcXf6ay9Fv4gTDJH4PzfzUmzxtkH/iE9aXikSDxIGja4d7GPENt/YFGVo7+8KaovJMqD
 WMLG82E8ShtptMLtDLYPcchDgsn8MpccvdVA8OBSPoadD+O9+CAJ2XZ7NUBMYkTtLYBa
 dTK1dT4+l5Wy5VQv4dvbRbmxSHEbI1x5FLJv5ANnfRyJyHobRIGMqKzd3gBzirUDk2/I
 RfWQ==
X-Gm-Message-State: AOAM5302ZXqz9S22NMHo7ESUC4O3yM/XJF4klAvrtXHeUVFrT1Ygj36A
 Stjb7040kp6O5Nu9TrhqDM58LQ==
X-Google-Smtp-Source: ABdhPJw8fTIJIR0QspPBLwT2xjfJCUaQF6HsFhnrIs7lc4mG337MzXvoExoAoIEvLCsKriqpETCotQ==
X-Received: by 2002:a17:90b:4d92:: with SMTP id
 oj18mr49333764pjb.188.1636356441798; 
 Sun, 07 Nov 2021 23:27:21 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f03:6a9b:24e8:3a2e])
 by smtp.gmail.com with ESMTPSA id e8sm11684972pgn.46.2021.11.07.23.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 23:27:21 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] arm64: dts: mt8183: Add more fennel SKUs
Date: Mon,  8 Nov 2021 15:27:07 +0800
Message-Id: <20211108072711.1628566-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211108072711.1628566-1-hsinyi@chromium.org>
References: <20211108072711.1628566-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_232722_979004_F268B20D 
X-CRM114-Status: GOOD (  15.66  )
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

Add fennel sku7 and fennel14 sku2, which use different audio codec than
previous fennel/fennel14 boards.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 ++
 .../mt8183-kukui-jacuzzi-fennel-sku1.dts      |  1 +
 .../mt8183-kukui-jacuzzi-fennel-sku6.dts      |  1 +
 .../mt8183-kukui-jacuzzi-fennel-sku7.dts      | 33 +++++++++++++++++++
 .../mediatek/mt8183-kukui-jacuzzi-fennel.dtsi |  1 -
 .../mt8183-kukui-jacuzzi-fennel14-sku2.dts    | 17 ++++++++++
 .../mt8183-kukui-jacuzzi-fennel14.dts         |  1 +
 7 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 045927402269a9..9834bd659d1530 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -18,7 +18,9 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cozmo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku6.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14-sku2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
index ef6257c9a2d2ff..dec11a4eb59e30 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
 
 / {
 	model = "Google fennel sku1 board";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
index 899c2e42385c27..37e6e58f63b7e3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
 
 / {
 	model = "Google fennel sku6 board";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
new file mode 100644
index 00000000000000..0e09604004d5e7
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-rt1015p.dtsi"
+
+/ {
+	model = "Google fennel sku7 board";
+	compatible = "google,fennel-sku7", "google,fennel", "mediatek,mt8183";
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
index 577519a775c057..bbe6c338f465ee 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
@@ -5,7 +5,6 @@
 
 /dts-v1/;
 #include "mt8183-kukui-jacuzzi.dtsi"
-#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
 
 &mt6358codec {
 	mediatek,dmic-mode = <1>; /* one-wire */
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
new file mode 100644
index 00000000000000..3fc5a6181d7e66
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-rt1015p.dtsi"
+
+/ {
+	model = "Google fennel14 sku2 board";
+	compatible = "google,fennel-sku2", "google,fennel", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
index e8c41f6b4b0d4e..23ad0b91e9776f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
 
 / {
 	model = "Google fennel14 sku0 board";
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
