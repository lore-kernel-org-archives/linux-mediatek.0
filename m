Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173F6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4B8460E75
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4B8460E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6PJgYC3syzdtv/AbQHTj0ansWIk2phcqyDr/1EMDqs=; b=HsHW+tlQloPHuN
	rHU6LQjw8WoJ47mw2WtFy2kaPOyXFLH4iaLvnqtGfvUJM/NyLNZDd6urgNhuH06Vg+LYjYbWrqo/6
	5VVbstsmlIAZy2MRljdwAZIHQMIXydUAeSuF3RsUP3dua5/XBucFnAnfsxlDda/cgXbpa/+BrYpUj
	1JZKbsMeZUCH0hAYl9pdMqu6zOhmvK+SukFpaTDVnvMgLJDtPM7KoS+2jaW3Ika19PRkAOO2sRXB0
	lV8E9o6wQpLIf1vD8v/NPTTq9dIiC2T7ocMqd1qvwgCLM3jZp9iz+LQGqxccGEPydFVgUImv6LPS/
	8T1htVqowFA1RmlcEEdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJlx-000i8K-31; Tue, 09 Nov 2021 05:34:17 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJlO-000hv2-4b
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:33:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id b68so7752056pfg.11
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 21:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bqa39s+vxgVR+dxhrZtkvgAdK1DW/ZPp25VXvulqjaE=;
 b=KTBF1oYCfSt0l+26wReXA8rrDY5IbD/moujRgHqJG4UqLBpSKiN18Pv4n/64bXlPyr
 JY6fYj1Oq3y/INyJ33dOWC9cMGVos5wHKv/YH3whJDmWHA6eTPVU5n37IhhdFTJ1VrwI
 ElLM6QJLXmoS6UPFWXgq2PLg6l6IK8Mbs3vWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bqa39s+vxgVR+dxhrZtkvgAdK1DW/ZPp25VXvulqjaE=;
 b=qPkaEDTGL2yhG6SG3xS8DnUp5VDCOaYohNQ5FVrNiT9zXL5zecBH+Ud85/u1ZNITmV
 78kEX42gtmuzGofBoga6Rw7KvQEkv1QgHruZ3oXaDFO6fAcLQrm96vLHANquTOqUqz8u
 D1kR57Ue3wiEsOSaSSjdctMVtpbmUmd9LqjnMywmly7u3ROt19iDhpNLOHcRkgCIu4+I
 GoGQm9U15t449B8WCnkaeJxxAHDPJqaG8cEYIhcfA7VjL4SjVNfU2IqpPZdcCnwwKKzh
 xT8ndibobwJlcLxqHDGtFmFZ0pUch/OHfERhwGqtR9KvH/FbF53yWLlxQGHWP1Tiuzxu
 X9BA==
X-Gm-Message-State: AOAM530PWvW0iaMMzTU6m8gn1PNMBWE+WbVS+gyElpwiSgAqk3xh7TBJ
 E7tbPQjJ7eXDyAXy0QEFbHaHMw==
X-Google-Smtp-Source: ABdhPJzVx+OXYFO1YCMNPrv0wT8X7vB3oHoh7iUOegDsi4sndLMc2OT9yph3wSpBq0FiTzSk2HmZYA==
X-Received: by 2002:a63:2aca:: with SMTP id q193mr3967332pgq.211.1636436021340; 
 Mon, 08 Nov 2021 21:33:41 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cc3e:b71b:e327:fb32])
 by smtp.gmail.com with ESMTPSA id w5sm13741479pgp.79.2021.11.08.21.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 21:33:41 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] arm64: dts: mt8183: Add more fennel SKUs
Date: Tue,  9 Nov 2021 13:33:30 +0800
Message-Id: <20211109053334.1840273-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211109053334.1840273-1-hsinyi@chromium.org>
References: <20211109053334.1840273-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_213342_192312_5F81544D 
X-CRM114-Status: GOOD (  15.81  )
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
