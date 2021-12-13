Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F2CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 07:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2iyce82x/d2kTp5yvkXw0WLgvU2Idv/hxOAoMjpv7E=; b=XK4J8ZrpAJW8As
	IYyXnjlwttyaGSMu37+FZsQ+hKJa+h0orkSIAC2pjTtQvMzon5JRfLJ2HBoeY8TVmhRMBpmSv+WOM
	7d7bqOzDlbBb/543404P4kp4hD85k849JDZJdt3doxZ26PnCkD0dO2/pEvbY0qKYrSrFJCKWTxnhd
	aglSPNIA+TGx8/dr/igg3M1oqeLd2R/evjBgtt/10EkxbkI0lRPA038x0b6C0YtrOgp82Qg1IY48b
	3w3FjFnm9BQw8DX7MiLLz7U47677ROoZisCeokBVW9tuP3O7S7ZMMMJ4C9TyR0W4H0UFJWGWhFzup
	ppbgxPB7UV7QTbyBLJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfh4-0083hU-29; Mon, 13 Dec 2021 07:24:18 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfgn-0083aO-If
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 07:24:03 +0000
Received: by mail-pg1-x534.google.com with SMTP id 200so4957213pgg.3
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Dec 2021 23:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tU0hw9Fvr13Zay+fstlz/pyiNLZeA6ZP9w6V5x5DuU=;
 b=EnRJ8l0qkjcf+Gwyi153UB22/glcDqyPcf4QNxQDw64e8+Mao369qZ1nyRuatepvrm
 OWL7FlIebPRTWSl2OMcThVAhxx0cMhwRjuqIS+obSFxFcVpjGIpMiULJhD0M9jrI2A9C
 gRwvqgAhO9tFwxNLdb0JfDAFkJLFhHrHL1g8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tU0hw9Fvr13Zay+fstlz/pyiNLZeA6ZP9w6V5x5DuU=;
 b=j8diZfO5mMnewagI+QchqOAdYdMlj68edrAVEt5RbYMk3FaTKsM4LYgf+uQZKhpgfb
 AuSPV3gYOzzfS5+0qnhh9IQcrNlr6b6Govv+EuyYhF3CwZ0hv3SeyGsdHZFjnv9/HFZ1
 Vsla8yQtjeczU0/lHuw0muKk8Omz9pjlW0HJ433Ee4KSOwJVwnNqc9sKUwqwB9E2vWcJ
 jYVnTgSp4llGwAX4ai9FedN1JVowBmULZzJxVayGmGJeGI/s9f0ptk1tJ2z2jvqbAvCA
 sXFkNuBfPfqsu1atnQHbUzlAHrFVHcsz0AE/2MVrLRxQ6pP4KP+7+v6bcq0T1XxxTpyo
 Vefg==
X-Gm-Message-State: AOAM531ErA2hkUIoozB+nsNBNJl3Rwcu3c9ZV/M2DFm7RgUmblibRuwO
 +f/Y2Kodr1lFwU0fvgFFCdh2cA==
X-Google-Smtp-Source: ABdhPJx9zzjBSbp76Vo6NSr7Lam2pE5sYioqMaKKb0knYzFmIAMqcf6mT6zHGjOlu4tppmQmhTXlHQ==
X-Received: by 2002:a65:4b8f:: with SMTP id t15mr46674991pgq.223.1639380240456; 
 Sun, 12 Dec 2021 23:24:00 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id e7sm11747562pfv.156.2021.12.12.23.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 23:24:00 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: mt8183: Add kukui-jacuzzi-makomo board
Date: Mon, 13 Dec 2021 15:23:53 +0800
Message-Id: <20211213072355.4079568-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211213072355.4079568-1-hsinyi@chromium.org>
References: <20211213072355.4079568-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_232401_658570_71D7137D 
X-CRM114-Status: GOOD (  13.20  )
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

Makomo is known as Lenovo 100e Gen 2.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 ++
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      | 24 +++++++++++++++++++
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      | 24 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index c130518c3293d5..fe60607084f19d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -24,6 +24,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14-sku2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
new file mode 100644
index 00000000000000..51bf2893ec03b1
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "Google makomo sku0 board";
+	compatible = "google,makomo-rev4-sku0", "google,makomo-rev5-sku0",
+		"google,makomo", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
+
+&mmc1_pins_uhs {
+	pins_clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
new file mode 100644
index 00000000000000..c3b7e9bb0c8960
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
@@ -0,0 +1,24 @@
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
+	model = "Google makomo sku1 board";
+	compatible = "google,makomo-rev4-sku1", "google,makomo-rev5-sku1",
+		"google,makomo", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
+
+&mmc1_pins_uhs {
+	pins_clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
