Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DFCC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:37:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B00C26117A
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B00C26117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z3k1QwbGz9w93F6EqFL04LGS2YZrhXq3sENoIGaHpdE=; b=V4XCQCL/M5tjmou7DCNfozX39
	hh7UQpR1Ana53+XwY4yV5mIwa59+5MTnvf5yN7sB3BJNYfjaf9IxoB6n3igxJL1rlGQvBVgqsEwQr
	2euAN4oXGmaiLGVaGUN7zveOHB061wHlghHRLHTNG7BmvZosKJX3biwK1KmWGMs8Di1UuCPpppuLw
	lVTCOWF9ZM3VDl88196y/Cy9wmGptUVIzrsHA//5UpAp6Z0LV88jeTFcY1Vj0/m3FZSRw98tCTXFO
	H/PM04ZXTWPwdeGfN0GTCT9/yK5eI89HpU6mp+xm1Zf7km+ntgKgqQQ8AVir+Gctxliu15pWFUJyf
	RxJ4Jk56w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyRB-00FYOf-4P; Thu, 15 Apr 2021 09:37:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPV-00FXiq-KU
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=h+86LqT5oinC3IBYbJbqOFlu8RNdurbYHgH1kxS9lr4=; b=WwfmEEiaD4ENNt5ZgnustN0rBn
 +qyXiWyldc4zABZGQl4E6cqB5B1CwRxZFuAFAwrncEGWXLRdc/eD5s60Ogv9kZBwlE5HMfdNVDjrA
 uMBl7ttQmonhFyaQ3JH4DrihAXCeImglS8Tn+vF6Nah3XxQZ8iN/FjIsj0dW9LPqMyQCY9G5YFlHV
 IIrP3zHZwowStMiB5Lwp+XOBOCrMLp9tdx9WnFgsfRHVWPrnpYGLFKGqQVycu+wrph7/bEAWMcGB8
 tKzHqw9k1TJTn/rO5bxkCbavxVPFSuCAPlMPOPEu6r4ll+p71CUkjSFf2qcqO2AOGKym5FcgBZMMq
 +xgq7+FA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPQ-008QkN-QH
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:40 +0000
Received: by mail-pf1-x432.google.com with SMTP id o123so15689925pfb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h+86LqT5oinC3IBYbJbqOFlu8RNdurbYHgH1kxS9lr4=;
 b=QZ3xUzhLie38b8o4JWSAhQSC86r1et0WBeoUGAS6KhLP+G+/iFfzuB0sEiYsszBaju
 9EBjt8/JNrQc9OmH87qXGFeK7uTeztVOF4wNZjnCGi/V89k12D1EvsUS+4m4Dw6h2pPX
 Xad7JZV7ayNV9fOXwjmY3Fx4N6Hwny4zUObJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h+86LqT5oinC3IBYbJbqOFlu8RNdurbYHgH1kxS9lr4=;
 b=uClGgSLiikUab3BS6ihrEkfzBzfCRZZGVad4ILABhX3U6StXpKATFFW00xNWQjAp28
 XV+Pis3Z/+Ce5wkhZp6AlZGIqtvulYZKpmQmRNcPDtQhq4D6u3mMfjw52S7jYM4CvqY0
 xMJtxPSgJz6nrqTjyc7lwkGQFOQ+09MWAejq0dvb75ddr0+F0hzUV8owR4rCY8U9RQMH
 t3dBPZljY+nOZpc5ctMzMiFMNY/WRhI2nrgVBFbbbkXP4KsEaDI/W//Q/n1iyJwnr96l
 zkPtcyAn4Cb3usNXjCHMMQ1FJ4ME9Ld9v2XdonDTuAosdBiRoj9o9JOxKsAzQhTpzsmp
 vOtg==
X-Gm-Message-State: AOAM531DU+nQ2gEGqroH6NrZAHwnXNs/oWHsi6UGPF0ZzMKhcrvT2nNA
 L4QiaCcPNa8TGgT8A+WDegDcKQ==
X-Google-Smtp-Source: ABdhPJxGucH3tKSvFEUCJSZK97KpyCmwuD/W5M5byPGAZynzdj2CR1IVsUuwpV7W+dyB5Kj8ESzTKA==
X-Received: by 2002:aa7:800a:0:b029:250:c8c5:64b3 with SMTP id
 j10-20020aa7800a0000b0290250c8c564b3mr2349531pfi.23.1618479334008; 
 Thu, 15 Apr 2021 02:35:34 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:33 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 6/8] arm64: dts: mt8183: Add kukui-jacuzzi-willow board
Date: Thu, 15 Apr 2021 17:35:17 +0800
Message-Id: <20210415093519.1920877-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023536_863789_472986E8 
X-CRM114-Status: GOOD (  14.52  )
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

Willow is known as Acer Chromebook 311 (C722/C722T)

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 ++
 .../mt8183-kukui-jacuzzi-willow-sku0.dts      | 13 +++++++++
 .../mt8183-kukui-jacuzzi-willow-sku1.dts      | 12 ++++++++
 .../mediatek/mt8183-kukui-jacuzzi-willow.dtsi | 28 +++++++++++++++++++
 4 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index df70674949ce..5f43bbc2ea72 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -16,6 +16,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
new file mode 100644
index 000000000000..281265f082db
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-willow.dtsi"
+
+/ {
+	model = "Google willow board sku0";
+	compatible = "google,willow-sku0", "google,willow", "mediatek,mt8183";
+};
+
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
new file mode 100644
index 000000000000..22e56bdc1ee3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-willow.dtsi"
+
+/ {
+	model = "Google willow board sku1";
+	compatible = "google,willow-sku1", "google,willow", "mediatek,mt8183";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
new file mode 100644
index 000000000000..3204c1abc4ee
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+&i2c2 {
+	clock-stretch-ns = <9500>;
+
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
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
