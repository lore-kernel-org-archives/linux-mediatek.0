Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB0AC44500
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqdlZomoyNAVRvaeXkG61JOu1jmM++65FkGRpMf9qL4=; b=zfkqxBlQlOz9x4ZCMXH3DNDnoe
	3ujGoiSAQLZSysSAAiKG2zrfEeOb31GaeOZ2Yxe5L7vCwkHUoui21PcZlQOxPWR3vw4puO6/SIWDu
	jzpb4hBspW543mz5T8oMVVLfINlZlbLDUMPESjDvciRQYZ4UkiFUuDYU/sSWZnTIrHujGhkFSPumg
	ULYkGunO1W8jdnwCbabNf/t0rI1R+vmvYNAh4xzGXnuRiG5KJTXnzCa9/hafOyma0PwklGdcOZvnW
	ZwMLbpU8/IjvbmwGdmqua1pbeeDYd9QuX7ElXXRxkRfhJgk6m1v+Su1qyP9cL4MwNPxHUW86lwXHn
	E224LZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbh5-00000006lr3-2ATl;
	Fri, 03 Jul 2026 11:04:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbh2-00000006lmf-3CGa
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caea3f742bso1486895ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076664; x=1783681464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqdlZomoyNAVRvaeXkG61JOu1jmM++65FkGRpMf9qL4=;
        b=AlYbp5gV4Wk6z3JTHwV8nKrnIKDxCsqc21b/gWKe0+I72XyuW88KSPCGJ7S2DidD4S
         eBtGTuuLqyW/XKA29At4tYGKkankmF+XRptmdoOJvhSjzYpJsFDPQBxgSfSgQ32py8d8
         HvnDsMq9KhjgJHByBye36k2QFD8hvmCggpWWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076664; x=1783681464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqdlZomoyNAVRvaeXkG61JOu1jmM++65FkGRpMf9qL4=;
        b=OtovpvRKBxRASklYLD3ZD97/4f2Ffa61RJ2GSxvcbeJiLuUn5Q/5JeBPIZKicFYKzI
         jOaHGSLF7GS49yBGf+vRk3rwwPgEgJMn6HkuiZw4HhBuNntAZ94ZYXJyylPhxX3QvnfU
         hA2Dkn3pMCJwko/hrg9GiFivYFjPCQbCkyR7E2HKoSMlW8Fhe1IUsPw6Z8R6dAmhP1iS
         CU2Ew/E6K8N8TFEdLZDgD+rO2LLAQUnynLBidoF1pCgNh2ooI/+lY3ZxcWmQjG9rVIU6
         1GInWb/xVh9ZKpYrfkngQ8+ZLI+rYJPu2xFwzBhi5YopkSVjsMrT4TWuhwIHGFDuy2Qm
         tVoA==
X-Forwarded-Encrypted: i=1; AHgh+Rocqq2jZoFXX/1ylwW50pl2gaODbPvIyX4Y3c8J8+/mLeZR+fN0FriQYSAWPvxCS1wFMpYfpdt3RUUlNylWsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx3y2SoejRJEsSOyiTVK6Xf80X/FifiAV8+KlPG4r964OknPHm
	92qWtP2u1+T8BPun6UkiX8Wzm4uibzqS9IZwtYl6bscU8mS/fb41AgUz3erSelDpnA==
X-Gm-Gg: AfdE7cl+4pQMkxAxokT3A/kCSLF4fO7ygM57EH1tAo2Ea76M9PynPW1CbCOgBypn9KW
	AZ7XFLcIIV6w6I3ed+DLXT8O/ICwPwkEnzGxT1cDHMSFsKqBO89o1tXrzVgk15cZ8RzdIoodR7p
	ObNc0tUnj+XO2Bf27epD1HcG2+rliH7md/WvBcOMiZJ5vI3OiUzNdmRjpUc8zvdeDK52Rd2xWS1
	HqCvbYC59d83MZkHHTWj8v7GGyJyu7yb0FacpiWNSFPgThwPDefIPj2ZVjlgr5RXxHq8dz1fwVz
	B94faXISiZ/iIw9dDzfSTWFajAfcMeag1ps+3DJJWYy85uwcvW/uyvbie1KGK41naBD9ByJYV8e
	s2HEt1Fil0PTSssGAHBrCrYnUl1MhHjHLKOyXkE9P0lK+IscwMFTahGvreh/CYS9q3MWVvzyBsK
	0EYn9XzObQImneRJUoi3Z3C0AojwqI8heiQtPxEI6AhhCicr9xUrXaVL82XNA9mJx6awZtWulQB
	VI855Sb
X-Received: by 2002:a17:902:f642:b0:2ca:ecf6:9119 with SMTP id d9443c01a7336-2caecf69930mr5132115ad.5.1783076664127;
        Fri, 03 Jul 2026 04:04:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 11/13] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri,  3 Jul 2026 19:03:12 +0800
Message-ID: <20260703110317.1283411-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040424_821811_C6EF3DCA 
X-CRM114-Status: GOOD (  14.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. Currently the driver only supports PCIe and UART.

Add power sequencing targets for SDIO and USB. To avoid adding a
complicated dependency tree, rename the existing power sequencing units
"pcie" and "uart" to "wifi" and "bt". The existing target names are left
untouched. The new "sdio" and "usb" targets just point to the renamed
"wifi" and "bt" units.

The "unit" names are internal to the power sequencing framework, and
should be confined to a single provider. The names are only
informational. Dependencies are tracked with pointers to other units.

The "target" names are the strings that the consumer uses to acquire a
descriptor with. As these remain the same, existing users will continue
to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 16a47f76e7ce..029ae39f6e3d 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	NULL
 };
 
-static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
-	.name = "uart-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
+	.name = "bt-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_uart_enable,
-	.disable = pwrseq_pci_m2_e_uart_disable,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
 };
 
-static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
-	.name = "pcie-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_wifi_unit_data = {
+	.name = "wifi-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_pcie_enable,
-	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.enable = pwrseq_pci_m2_e_wifi_enable,
+	.disable = pwrseq_pci_m2_e_wifi_disable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
@@ -130,13 +130,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
+	.name = "usb",
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
-	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_sdio_target_data = {
+	.name = "sdio",
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
@@ -147,7 +158,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


