Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3441AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2iyce82x/d2kTp5yvkXw0WLgvU2Idv/hxOAoMjpv7E=; b=gbj7G9SmVcNYTs
	vpyWDcQlb9H3kNAwXykNY9Q7G5LUCa8AyYFmvEwwqDLiIAfkoKreSX8Sj7GXMXfCHznCjFldmetP0
	I8LW/HmumQfyts5B1j4nD6nu/wmAf04hXpbPTprLNiDRwFxX1YzGMIUZttVo4Qnqq18z97fz4fbbp
	/A0FbbPmDTGG+Lqu17YuwB9ZJ0yXL4drXbrdnMlxYh1wgI8mtkwvK8lEbsr/kXTXDtYON+Yu+937f
	DtjRpW1YCbZrsRDvZqo368rOVPLRQgQ+hf+dIPF4hQRfbEx6sMQDpySYfWoA8UoSi4aznfvmkZwlo
	fxL2Udv1u1X8FdCISDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwoDl-00Abl4-2h; Mon, 13 Dec 2021 16:30:37 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwoCF-00Ab0D-Fj
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 16:29:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id k26so15365798pfp.10
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Dec 2021 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2tU0hw9Fvr13Zay+fstlz/pyiNLZeA6ZP9w6V5x5DuU=;
 b=KxiYz8+JA80WTPI5E6V52Uo45TgQhCf/f+OnQeeCML6RkM7Tr2IXBAZf74WCTohzFS
 uI+FhNy2HM6SiHGEVHVkJbSnt+LFGwKuOgKLRrkM0v65KQHQTFd5H7ThVcl0V7qdpm22
 UR548+Wtog7B9zP8NvtXv43tsg5VWT4XdNUBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2tU0hw9Fvr13Zay+fstlz/pyiNLZeA6ZP9w6V5x5DuU=;
 b=Z7CZKJW9goM3PRnmyCBn26mUgK3CB3LF/DB9LULSv7skAEhE1G4PxIMu/7LkmppaJe
 GmtowokHbJ2rw9S0IgWSlb6d84kJKkSeMBF7NWFh4GI6Gu6yUgF4YJsRNiv4GPM4jW3t
 VEPrkac/m0ifYZ9TDLxfw3IMbWjpyfrtSK45iTeJGwDJ8+YwfZF/YROBBTV7QSav8FS6
 hDG5zpQrekTIHbQYkybuq72IUbNKzCnJCtrLVmgyen/zsg/WLGBO0b45ecpNFWeq5Thc
 fF+xRHCBIs0osEF65zHnHru20augo4G5haVeLqio1ROL1Q1vNnkVkdF8GCT6NOR4AU/z
 6obw==
X-Gm-Message-State: AOAM530/sbsoehCYkoz0Fd9IhwN7w07yhdgAjhMlaj1LVUr4G5K9E15C
 6qXxTYgE1QHPZ8TZuh4b749XsQ==
X-Google-Smtp-Source: ABdhPJyVKUIG4JiDJfTwgnVjQB80rFaeAfGNBryQjZXYrn4n3GcGW1Z/DoTYoEhFP6KxTqeOjADVEw==
X-Received: by 2002:a62:1708:0:b0:4a7:e068:b121 with SMTP id
 8-20020a621708000000b004a7e068b121mr34003359pfx.61.1639412942231; 
 Mon, 13 Dec 2021 08:29:02 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id mh1sm7803802pjb.6.2021.12.13.08.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 08:29:01 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] arm64: dts: mt8183: Add kukui-jacuzzi-makomo board
Date: Tue, 14 Dec 2021 00:28:54 +0800
Message-Id: <20211213162856.235130-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211213162856.235130-1-hsinyi@chromium.org>
References: <20211213162856.235130-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_082903_558724_FE447F47 
X-CRM114-Status: GOOD (  13.08  )
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
