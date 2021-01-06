Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276D3C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:46:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88672310A
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B88672310A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B03cCxeXQza6QI2pJbdBRTgqVVAA4ekGNHFFb14YmG0=; b=JSFnlDiEKd1x4VsrHRxOaGe7b
	pOtDszZPIj2Q9q+/nbRVaZR4B/uNAuEiE7NGIKtx3G5cHUlablyss2WSS9X5tsa4yIWNKkud0Ch1T
	UzyHU8apl+0w3PWPPN4VkTsBU7bgLhdS8SoitRQd2XaAyv+1iZQGESgaydm4BZnCmN1FY9dyn0vLz
	waG/ZoLRiirAfp5Rf5+EmtJ5NHJ/ZlTo4zX01rFj6A1tW3ldn7dFQtYSse+1SY4n6zPfwvkMXHZXf
	v+ACIv0GqiN8SRkwiPbNmyNOsw39U9kH9XMyCLp+Zq0lhaoUywm2IJx0fSecWfBpFy+hOfQl+nSYF
	HyEWY2sAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx4So-0004rn-Ol; Wed, 06 Jan 2021 08:46:42 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx4Sk-0004pz-Mj
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 08:46:40 +0000
Received: by mail-pg1-x533.google.com with SMTP id n7so1792622pgg.2
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 00:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XfqO1B4CXfAktEO4OP7WVNtR8GYAt8b6FfkGFkAlye8=;
 b=JCMGXnw4hpCIMuCmzITNql8JVCFDO4s3SzbgoCqBvoN7yj3DnBQ3D0meZuqxG2QwOZ
 wZFU1mUN+DVDRxMvYYSscFVup0s3LwEYoukPjusvi4x9mUxcFhh4XyAEvm6ZzZCBEti2
 WzVgT2NXayAk80vQaQrdTUwP0qB2NHq9I1qd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XfqO1B4CXfAktEO4OP7WVNtR8GYAt8b6FfkGFkAlye8=;
 b=fTSvgMg2XLe7fhGhMZStinCjladdOFeWL0Da+PUxqsRmgJYDhPce3u9432XLDbVbXd
 gGQhUoCmnfEBi5GpOig1JiBjeZoJA2CuLEh5W6sfPGGRtMOeG0hVTkiQGdMnGXZK+mmC
 LCVigHK+YnPI0PzXzbQtqe+i+kCZ8WxH/D7ZVAfoEKZ4VfA2aMsdLnoLOjFkFP25AfFj
 6j2LTx4aphAulbYzzyq3V71HIPNvTvtSXQ8xuGJX5O92b87i7euchgDt7uxgVCRsB7/K
 Vf8QbXYZj5AAfWsyJzIAIgOc3Kiwmsz5mTa6cLYeLfHn7TP+wWBGFcR2oFYR9+0e9LWa
 MZJg==
X-Gm-Message-State: AOAM532UocXQdsv3Y49wwqNbM1WUvLKV2QwB2lJyiZY5l/N4l1Vez8mf
 A3qLV35ss5r+dc7FZ/PiqJVUNw==
X-Google-Smtp-Source: ABdhPJw1OmoRcuh/NoSGaMxrAs1NAtbcRxJlotuwUZxrxa1f3/MMKUQpUnglVc6EVoPR9IDfvNeYYQ==
X-Received: by 2002:a63:105e:: with SMTP id 30mr3407174pgq.24.1609922796547;
 Wed, 06 Jan 2021 00:46:36 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id a31sm1913401pgb.93.2021.01.06.00.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 00:46:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] arm64: dts: mt8183: Add krane-sku0 board.
Date: Wed,  6 Jan 2021 16:46:26 +0800
Message-Id: <20210106084626.2181286-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210106084626.2181286-1-hsinyi@chromium.org>
References: <20210106084626.2181286-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_034638_848392_89D3DACC 
X-CRM114-Status: GOOD (  14.95  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Similar to krane-sku176 but using a different panel source.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 30 +++++++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 53f0d4e3ea982..3276f7a2ce672 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -120,6 +120,7 @@ properties:
           - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
+          - const: google,krane-sku0
           - const: google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 18f7b46c4095b..deba27ab76574 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
new file mode 100644
index 0000000000000..4497291889506
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2019 Google LLC
+ *
+ * Device-tree for Krane sku0.
+ *
+ * SKU is a 8-bit value (0x00 == 0):
+ *  - Bits 7..4: Panel ID: 0x0 (AUO)
+ *  - Bits 3..0: SKU ID:   0x0 (default)
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-krane.dtsi"
+
+/ {
+	model = "MediaTek krane sku0 board";
+	compatible = "google,krane-sku0", "google,krane", "mediatek,mt8183";
+};
+
+&panel {
+	status = "okay";
+	compatible = "auo,kd101n80-45na";
+	reg = <0>;
+	enable-gpios = <&pio 45 0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&panel_pins_default>;
+	avdd-supply = <&ppvarn_lcd>;
+	avee-supply = <&ppvarp_lcd>;
+	pp1800-supply = <&pp1800_lcd>;
+};
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
