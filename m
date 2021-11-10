Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D348FC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE0B610CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AE0B610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEbxx8w82+s1pKeD6FKxyd/Uv89Qir7Y2DqTO0ru5z0=; b=du0J/y+dqXLmFC
	oxiox6x1ngUboTxiU9RNWK5JZtaKbqQgKnWKrjuckbf3dmlHSrxfgfezwvVHA0fJ1RV+fpk5dzZas
	dYRo36G+hQM2HlbGZZcbEUXHg4l9WAYscveQRYBJ1e4GbPQbcfOKjwjeam74SwHB2Dc9upcQitNNy
	ZaqJSbfRQC7/GLtA4w17O+5iqj1fZpcAWvnupa72Cc0DNe5lqjaHC3rABZdEBSOO3/8sy+cfGrmyt
	aXpjIWgBHDTJIHORnGXogjk8PoaWNbQG1xR8HrOcPRQYpqZdyJg4ypYW/crTVYziMlAJkVRq2My8g
	jXcCL3tBywaK9F4FuEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkh93-004ZZ4-2k; Wed, 10 Nov 2021 06:31:41 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkh8n-004ZQh-96
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 06:31:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id r5so2223876pls.1
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Nov 2021 22:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MIJkQVkt4xqve0BOXtxCBd9FeU0z9MmxfabsOKsl+NQ=;
 b=mcj025yCzja9hIlJwynNpOt/E28zRtlbZxmElO5IyDcrdKFpFqTqAiS+EKoo+Ppbqn
 EemHKBHw3CsQFJ4osYHtbnQYNk27e/pXfGEwRYl7hPnCzCi5I3u42vA2Jkt8kPutz6th
 d07JQ88vJf+p1b5AmujFTUH0CnAQw2YG0IWXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MIJkQVkt4xqve0BOXtxCBd9FeU0z9MmxfabsOKsl+NQ=;
 b=NHBls1EfSpA3Ce7wvduJz8Rj6GtXAtd8P8VnCym6DyON8bghnu1+HDrJ1UfKLqbunk
 tnKjWzmZnf0fKDV3oGDe7C4aE5prBiS/zz0zAAL5NMBTIcptb9Z2nZqMQ9b+hRzFFUPQ
 fdVSRvqaBFIs3RiGBOqH1V8/SXYGnUb8DZE4bMvMTN8cApseIOx1bsyrBL2m0Gvv+CD+
 vgA/KBnXlIqXD52+rozrVO64wDWkL82VlQOZcAzE0szOqDMPt3bd63HdUUc47VlqTWkq
 v8QUSnemjdOWzin3B+sEoUMLYlpG1BzVd6wlNXSShfxihJVK851QP8D9ywfl8IvtbPcw
 owuw==
X-Gm-Message-State: AOAM5326Y5pxm9F7xrjO+3jIFmsAi3ixgq82NBWGSRyj4wv8c2GiApPA
 UoDm8uLnhHKwiQA7iY9L+hcqyg==
X-Google-Smtp-Source: ABdhPJx6Q97OrMCMe68Imw6Gj8S/disVEQv3LbC6RMq6Z9b59hdwE/dMZqj6d4GCaQGhmQjJHDOQ1Q==
X-Received: by 2002:a17:90b:218:: with SMTP id
 fy24mr14245160pjb.187.1636525884182; 
 Tue, 09 Nov 2021 22:31:24 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6886:f712:1a79:e3d9])
 by smtp.gmail.com with ESMTPSA id w1sm15623959pgb.50.2021.11.09.22.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 22:31:23 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] arm64: dts: mt8183: Add kukui-jacuzzi-cozmo board
Date: Wed, 10 Nov 2021 14:31:13 +0800
Message-Id: <20211110063118.3412564-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211110063118.3412564-1-hsinyi@chromium.org>
References: <20211110063118.3412564-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_223125_328334_265AB536 
X-CRM114-Status: GOOD (  13.81  )
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
