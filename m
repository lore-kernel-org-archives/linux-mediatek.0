Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 544A660E75
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 544A660E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEbxx8w82+s1pKeD6FKxyd/Uv89Qir7Y2DqTO0ru5z0=; b=DIR8aRMw8A71gb
	43rOycnu9Lg8hwsAwRrBykPSOC0jBpsjWP7Mb64ToiMhmtrXU0zBEbsjFMOHq24LXYKH2+RHvSZ5j
	ZiAtHHxQt/P4Qx6pN9d7lIC10oNXOO5bUZIFf4eQClAL7SgfGX/K20ljNDo8XgTUcnNVWQ5XSZIQi
	0kn5WZ5yJjHCUgnA5bcWOj+rgx+IR6t+Qy/slJy+eeIP7QLmmTUJXp9xB27HgBnhgBM1RzILcrXgO
	LcAtshZ+IJELgsEyLfQuS5aY7KGmWT6AeLMo2OP8dcwY7UttzwqLFSMtwrpeQ81BIljKosbjRutzm
	YSn9NEPXf4RgUSNIGriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJll-000i4X-P3; Tue, 09 Nov 2021 05:34:05 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJlM-000hth-Jp
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:33:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id b68so7752003pfg.11
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 21:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIJkQVkt4xqve0BOXtxCBd9FeU0z9MmxfabsOKsl+NQ=;
 b=O7ua08acPuCdRgkIOO3pKqCQTGpOBbNWo7jk9qIzOmDT3PvJ7pRobO7xYF5+zGUc/W
 nayRDKzHDvH5eC+DpAEdOwRYRCs8251f7I8I96nTiuBJgWOeJ4vA8SXYx2YmVn//kH7a
 iL9Jx2JERdWWKq2kZQ+wVDGP3yfYX7UKIPY5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIJkQVkt4xqve0BOXtxCBd9FeU0z9MmxfabsOKsl+NQ=;
 b=Ju8Z52dDsR/wC2AlNrKn4SjhSOp4CnPahG5uVYMlimEQsvYsVGjru13GRsRhAq3O/x
 wY3w14eT5Q7dMn68bQT/WICWsUmnHPsZzhcmXteFvRS7hvyGjmNIqGjkUPbl9cjic4jv
 XnXVu/kZd3GIBkEoDdSiMuWporQ4cIkN2o/SJMxjx/sqLDUCooTacnvGyxuambkdBEJW
 OyS924sTK/07+kQkSEmy+6hI0/kIXVcVHljyYgs21tNKDKofcUL1D1hP0m12Q8Uim5Sq
 LSCgyuV/CaH9mvgspkFHLSK1yKZJ01pHow/HlqI8+FrTbJZCmTcO5dLN5AQX1B7p9yV6
 DnkQ==
X-Gm-Message-State: AOAM532nkSarOhmX3Pfzpf9/V2V2jrYVnWYMdbp6EDiHvGpUaMFJIY8/
 dSgcI9xbN463EDQW6HCM5S810A==
X-Google-Smtp-Source: ABdhPJwc3Hhkt8mCaow1k05pyg0wyzvRdI4bicwfhIBrGmE+C/15WUA7k79+BZeNMBIos0lI9+vTTw==
X-Received: by 2002:a63:78a:: with SMTP id 132mr3894983pgh.83.1636436019769;
 Mon, 08 Nov 2021 21:33:39 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cc3e:b71b:e327:fb32])
 by smtp.gmail.com with ESMTPSA id w5sm13741479pgp.79.2021.11.08.21.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 21:33:39 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] arm64: dts: mt8183: Add kukui-jacuzzi-cozmo board
Date: Tue,  9 Nov 2021 13:33:29 +0800
Message-Id: <20211109053334.1840273-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211109053334.1840273-1-hsinyi@chromium.org>
References: <20211109053334.1840273-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_213340_707263_3610C4AE 
X-CRM114-Status: GOOD (  13.86  )
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

Cozmo is known as Acer Chromebook 314 (CB314-2H/CB314-2HT)

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-cozmo.dts   | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 4f68ebed2e3188..045927402269a9 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-cozmo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel-sku6.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
new file mode 100644
index 00000000000000..072133fb0f0162
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-max98357a.dtsi"
+
+/ {
+	model = "Google cozmo board";
+	compatible = "google,cozmo", "mediatek,mt8183";
+};
+
+&i2c_tunnel {
+	google,remote-bus = <0>;
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
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_COZMO";
+};
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
