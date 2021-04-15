Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB50C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5180660FD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5180660FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+2yfqRzByk48THMWihT5i0lRkk5FhsjRM5ok/d00wR4=; b=lcXlhUrIPyo7ns8RnhM3/FcF3
	Y8SoWFYPc3Wz923YF+4mYDB3ybvrmbUVPQ7o56W1N/ymXRwywgbKAYCR4wjDOFkp7lqA8pUvVlpTQ
	5FM+ibwFeSzjYf8Y569JnQFn1fCoE0wafskX08/KdDD48Sh4WVu3FdgLaBpvRE630bHbT5BXIsKBS
	FRVGF87H+U/2I68Ev1OhQFinNJdHirmqVo8xXmyGCqWw63UcHbSimCwnJB29q7L0SVcqiczkviW7t
	obCEb2SxIkHgFI68FuGzQ9TdHs2qi68ljddqJSl1ilEKE2vUNco8Gq03oNuZaIT97PFn4lJ/llwiN
	LZFiSYBNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyQa-00FY2X-NQ; Thu, 15 Apr 2021 09:36:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPS-00FXii-WB
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iSimGFiptV/yib1tILwJ1nycFQVOVI1iO9MnbE/4e1o=; b=mrJq/QQGneBwnjUNTSgLpS9L9d
 uUiOX7QfYGu/EBYWNW7SEXrbHVGS+Z+5zspZ4Z6yiEi0JrK9gLIJ6slS1Ty+a6BM+hRcugqL0Z8nT
 wzEAqCbepz7HV9oLe92WSWa5bPMwODmn8kaC7R/luR6o/1K91a9EECBRpBMeSCaBrdOT98I+GWHVs
 C6feHUhgt+H7xiOfDIbjOpP8XK/GGwJ33Yp9V/Hu7YWj0KdQTUgRV1F0vqeNOnwvzoFQ6Ps7zmhgz
 h9Dq/9HC+W0kHdTYUd6nDJjxBWZIJO+T44bObqnlveZIqE+b/6lxj9dlciOIq0Sox3/X8UY8GYmFT
 uF2OKt0Q==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPQ-008Qka-Ft
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:37 +0000
Received: by mail-pl1-x62d.google.com with SMTP id y2so11736309plg.5
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iSimGFiptV/yib1tILwJ1nycFQVOVI1iO9MnbE/4e1o=;
 b=li+r5GUgKcZAkzHHfvRNV4s0f6rG0koGnh8Gj0v5SrLhf0JSoAmSXJjh4/DN6fk+Ez
 xkTLoqQRZ1zb2dbDhUXbfZdo1mAi6UCB0a7c3UdFp9emOz2RWlZ/Aa0tQeXbzjO/nn7q
 u7YypxzVhXQWKeR/SBNosw20eAXnq+PQrK204=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iSimGFiptV/yib1tILwJ1nycFQVOVI1iO9MnbE/4e1o=;
 b=FvZH6w/Kwar+I0lC/2vYK9A8pk8cyCfVcjIGlU83YTMgFxFU+TS6wvwyGPNAi1P8Is
 e7swXdH2w+/YBXcowTPIqqio2GvY6vXCaEBi98jqI7CiMvm8mdzA6ztXVJEd/cjE+eCq
 yK2YUQ7/yQ33wUxJ6NIj1LoECGb2CidHDBPHpJBSmW43iuoJLvXDJGa+nlrHGt5l9pYj
 7hQy4Dt7bGBWYBkY0IobIFs/bUXor4js+ZfwNVvgZyVXQfrld2ZuBSBw/8it8nCstynH
 nOQTx7QI2noVzNMCv9RxYRvZy82hkuY52w6cADE0Xz7JbSMTOwP5et5cWbbKmOAqqwZG
 /6Xg==
X-Gm-Message-State: AOAM533Mnu+NTZVWYT/Jx6S6VNJNjR2O7gdL4iFm0BR+6EbXzKaigIWt
 HUsg8kwAIUp4T0SnkQmlhCwHDA==
X-Google-Smtp-Source: ABdhPJxc2zwVJBCMiV2KgXePV+PRmD3RUu/yvHjmqKWzrJCZSrMIQcXyrY8er9vBhO5j4H0r4TSDfQ==
X-Received: by 2002:a17:90a:1b62:: with SMTP id
 q89mr3036629pjq.54.1618479335951; 
 Thu, 15 Apr 2021 02:35:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:35 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 7/8] arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
Date: Thu, 15 Apr 2021 17:35:18 +0800
Message-Id: <20210415093519.1920877-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023536_548038_DC1E92B3 
X-CRM114-Status: GOOD (  13.94  )
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

Burnet is known as HP Chromebook x360 11MK G3 EE

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 5f43bbc2ea72..b33d0bc58021 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
new file mode 100644
index 000000000000..b97ca331970e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+/ {
+	model = "Google burnet board";
+	compatible = "google,burnet", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
+&i2c0 {
+	touchscreen@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <200>;
+		hid-descr-addr = <0x0020>;
+	};
+};
+
+&i2c2 {
+	clock-stretch-ns = <4100>;
+};
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
