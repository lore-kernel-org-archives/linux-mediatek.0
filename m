Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93795C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:27:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA3160F4B
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FA3160F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEbxx8w82+s1pKeD6FKxyd/Uv89Qir7Y2DqTO0ru5z0=; b=Z10HpRLzqrS9nE
	tGTVSvLFhQKmyiRlslZrkN5RNlm9IoaN3MmUxxv3VZPw45PIhXcJs3ctZuvcUJRZYz+5OOXmj7JM/
	rT2l8i8eridmq8CHyyf9n2jLkoFRUzRBH7+n9oIBFZfr9DNExYopiG5Ume5ugZzrUnGU7/Sb8rHFO
	dr7QHzVB1jVppDd/6OFwZOIHRCPIhJPF4pscAp/Gs8LpzpWxtM74X6qVoumSrT0TpdaKO+VVU6OVq
	R+mgc5TO84GoG/W7NCihKaJBKBqbq86sxpt5Ql8W9nwQv8W/yXkEUBx4P2exCRQxTnaSggl5aDRnJ
	bOkqKZBMicML16P4xbAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjz4F-00FZEt-5O; Mon, 08 Nov 2021 07:27:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjz3p-00FZ1t-9l
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 07:27:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id q17so3099281plr.11
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 23:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIJkQVkt4xqve0BOXtxCBd9FeU0z9MmxfabsOKsl+NQ=;
 b=keyO8iQjd9MCSdaTolVmJpKXr1NkWN8c7TyoX5mn+Uh2OMTjvFsH72trcqAquzXCqx
 Z53QzVjhBv23LGyFMgZ19Ddb1tmvUi6sujNSrj1QRX8J1z+9DI4hFTd4eSJaVNAC6XwF
 W5iAp4s3TYRvfKHZDUC6rT+N8fEdvMpcQJ1hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIJkQVkt4xqve0BOXtxCBd9FeU0z9MmxfabsOKsl+NQ=;
 b=FKIyCtE3oOFoerP6iR9QLImDDxOv8wSBWzB0EiBYW7Dz/4UXpvGwnChZlUiuEvqZVq
 Few1icr5UDNyJS++Zq8W7iWns03Oz522FF+3sVc1oTMOOmOAft/FIAfXjd/WAAvR0Hwb
 Wo737tC8uWofV2gXIa0E3y7Sx07ke/UVWP5OAQrmUGlmnpVyo2E+WeoJtbunbdsqE52i
 LyZAt54cEF83NoSKKJrgTISEkWXDtE+866GDWayUuM4PI88ebZE40Mx+NZDaboREH8di
 w83uUCyYEheCOTnEhlKl02JhqGgWHq6B1lk9IgkIOx4h/DBp6zGzkJXvRJfeyykFt9lL
 JroQ==
X-Gm-Message-State: AOAM5326FP22ZcUXwXlujw9XwT+t5XEs5IUmvwyKVl+Zhkzc1yTLLdeK
 wxuw5OaEt0qEqn+6AJ1ovnNu/A==
X-Google-Smtp-Source: ABdhPJzWiwCT5/iU7//1etleZoUzv9KAQgehJNsaiUeAXd7ajQbe6/LTy0OJCjJITgmab/gRI1dkqg==
X-Received: by 2002:a17:90a:5303:: with SMTP id
 x3mr49602563pjh.226.1636356440183; 
 Sun, 07 Nov 2021 23:27:20 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f03:6a9b:24e8:3a2e])
 by smtp.gmail.com with ESMTPSA id e8sm11684972pgn.46.2021.11.07.23.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 23:27:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] arm64: dts: mt8183: Add kukui-jacuzzi-cozmo board
Date: Mon,  8 Nov 2021 15:27:06 +0800
Message-Id: <20211108072711.1628566-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211108072711.1628566-1-hsinyi@chromium.org>
References: <20211108072711.1628566-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_232721_362216_9833D800 
X-CRM114-Status: GOOD (  13.69  )
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
