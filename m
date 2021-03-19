Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC77C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F02364E07
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F02364E07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tk+Yi5v4ktT0+jwJu4+Qsp/QahnzVTpn+Nfv0l1bMFU=; b=oFTugAgmnlZNnlYHT6pV6MpaZ
	3yjIT1YBvqJuXO1zh+M1uvLl3Ln1TSnASuun9DsxpqqUSNG5D1UTI2adApyZMIO7J+1L4tngL7A5O
	N9zK1ydP1YKfYZ3AFW1xU7ou8ZZTI6PphXhyxBzzMhtke3fOamuqFmklSxSg3/R0B2UXl19grg0fm
	0/tEkFhj2UzSqh2h7E9T407qgWiCLfZ5Q+u9UyHK76+ZCqdiLC2yQ9Sw/SWUuHB8XEZj6O3SK7zcT
	Rx90JqKbKNTp49L6AcxJLQe9a2aimy7at/xlleK5+057ZKmfPV7/SIKi1ccLHksKJX6/lA4hBlwM9
	ziwfa4WQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN6CP-006Qep-7m; Fri, 19 Mar 2021 03:53:21 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN6C2-006Qaq-KH
 for linux-mediatek@lists.infradead.org; Fri, 19 Mar 2021 03:53:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so6068657pjc.2
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 20:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0c6ue7k7W+aM2C/ru0d4xrULEj/JDjoLwyUHXQYoMxI=;
 b=nv1Nx7xsndUI6U29g+m86RII2Symog9Ppe+sR30OmWZ/YOOcqph1L5Jd+xN/HdcFoI
 vNlvlU4PBDG5QqNvjgjv95u0C5jUqB5wp/yPJQk5dZWi62DaM7wcWqD9KaGUAaKtyix8
 TZGSwWcexyzZOPo82x+EhmCLcjZyMOoWlrv4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0c6ue7k7W+aM2C/ru0d4xrULEj/JDjoLwyUHXQYoMxI=;
 b=oYpd+H0H3jNR0zB3et+7oV+4Mg+TEa8GooImM5sBtb1POl6eLz0jpkgY61FhWAO6Hy
 tcNbfQ07JDKnE5P4UBh5AYmZEJZCzpAk/HLGApujerQrXBzU4kY0BTXsOJHAZvaWYoUN
 PLwlWcZh4r5bxuA/A9fB4DMNKANwI4PZBXlgFfnGVe+WY4zvx6LRDfQMnvW4x45YS2Kt
 4Y0fUwGHas1g3bPJLwuvGUnHc8cUSVhh/Z0lM9ovMH+Cra8kIGWXHIBwux1abWcLFg4E
 MWjmUsfaoJ+PyrBScKcOE7zCFGbb4IIPSJIFvnuf9bYe9nQ91Wc7Maf1ohzWDO7MTLhy
 YGog==
X-Gm-Message-State: AOAM530YnT9hAV1veuBbdEXBmwVdDlPVANcYnkHwCLO/LDFbbkTlr0ss
 4AyxAcZb8i7MHfXyGjB5rnbhog==
X-Google-Smtp-Source: ABdhPJzAsFK+Zh3E/btZHCY105Qrc22+B+j7F68MDjbBqt+1bIvVfKn8q8ZxeM7+VANXIB/a25HmGg==
X-Received: by 2002:a17:90a:c588:: with SMTP id
 l8mr7574989pjt.120.1616125977224; 
 Thu, 18 Mar 2021 20:52:57 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e12f:5c36:14f:bbf5])
 by smtp.gmail.com with ESMTPSA id u66sm3442180pfu.186.2021.03.18.20.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 20:52:56 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH v4 4/4] arm64: dts: mt8183: Add kukui-jacuzzi-juniper board
Date: Fri, 19 Mar 2021 11:52:45 +0800
Message-Id: <20210319035245.2751911-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210319035245.2751911-1-hsinyi@chromium.org>
References: <20210319035245.2751911-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_035258_855321_FC0330D6 
X-CRM114-Status: GOOD (  14.48  )
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

Juniper is known as Acer Chromebook Spin 311 (CP311-3H).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mt8183-kukui-jacuzzi-juniper-sku16.dts    | 13 +++++++++
 .../mt8183-kukui-jacuzzi-juniper.dtsi         | 27 +++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 554105d2c389..db4753d82a4b 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
new file mode 100644
index 000000000000..36d2c3b3cadf
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-juniper.dtsi"
+
+/ {
+	model = "Google juniper sku16 board";
+	compatible = "google,juniper-sku16", "google,juniper", "mediatek,mt8183";
+};
+
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
new file mode 100644
index 000000000000..078bc765646f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
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
+	qcom,ath10k-calibration-variant = "GO_JUNIPER";
+};
+
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
