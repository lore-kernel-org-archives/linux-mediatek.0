Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B6ACD98D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=; b=Agurkqt7TD6xuqRRkuyc6GGtjB
	gN/b2O0rlj4aNddVIdq7yO21eoGOi0iKBlpH+kbzirIO3iv5pSszpHBL2O6hyhhkddlgwsRHqomB9
	X6ZG+D3ndLNlhi84b+P/fzvDSzTCBRHJeUTRSCqVUHMVSM5BPHSne82H8oT+DE0Xq3Ux48fB7QZGo
	74yvne9jUOLQ/WuGRyCjdrFT/tcttpTfl9AL+PiwlLf1v/8zkZ6bamoekcaZ9BvoEp62vIPf4hkDZ
	OKiS7nohOzOtMxzuxs69DBUsdjG9HUe26CyvguZHEH/QVZcUCO52uOE0guuynUKqL42TsFc/snF0x
	8PKgthbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVn-000000076Eo-0X5t;
	Wed, 10 Jun 2026 08:42:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVk-000000076AF-0Wx9
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:42:09 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0b944f6edso66411845ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080927; x=1781685727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=;
        b=feNpll2NEGkanpZRKfFYjRB7qu1AGA5a4Qt3waWGiwPHOI+5CPXrPh7vG7plmTOn3A
         NOHfO/x2559k+LKYgluAJsAwawEwqn5PrKnG0H5e9VWR0sgmqPvxxIgnJkhM+kIVkMVr
         iQ6x3cvluWIYzDcrHewn8fo+KPoVkh3k3Bvfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080927; x=1781685727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=;
        b=g802AiKnSRIWOBtm0PzaR6g+wjvYGEW4bod3Il8ehn0vC05weTIze757ADlBu5qfTg
         CgWk+QqYupnKlh6HqaRwUphEJMsXdKaMRrEFa+90CYfcfEa/P06QugmJmJaLJ1rm2IsB
         9QMycHZg5JoMPHKCIky69edpeN4vs5r53HaFdHnr4+xF5dChOHSCaeRQA8tgtnVW728s
         L9R+R+CL/ilanI/WvpG2TSQw2CSAWg9Bv4WaWxx9idpYgjM0m060Ak6Q73V9pJD+skUM
         gCfdYFKWWLk2EmsTpYBhxU/sLbngkW0pMx4iwKth7lI1PyFjHUyCzsgIgQt6QIuvbd3d
         mJ1A==
X-Forwarded-Encrypted: i=1; AFNElJ9oiZy5r61hYRiBHCdDLbOsVgkN5xXQxfoA3TmEXxSbS2jINv3BveNhtjDVYtME2tlwGkteCU/uS2Z3CzLc5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6CiLfSy8KhW8Vc4rHJpAkJ9rsGxTt0XaIA5bKwqL0Ww+uvQlq
	LbtbIOuSlcw68m1XLxfHcPBe6ur3gnBLNW9W+dJzch0TvaWavZqSmM+Z61rtixsraw==
X-Gm-Gg: Acq92OHR+mlAD6SRKtMh46WeSfumtebyyKYO2IpSAVdhqC+ruLzs+SOItq96b2pEWTa
	ueDMp/krEySlLmKypJ0AhTOLeDTbSAZSLl4I6EkhdLwkIsm9EusBbM0yfX/+IGWfhNBZ5yjHpaw
	MjfCRhqUhDJCskQ8A8rQ0orDph4SoeEYcN8iO8bRDB+WXZ/ho7gQqSsNUI9CkxhMyFM5mv/28A0
	3r4qgChDKHqUAdUGazYVj9lyxO4tZ1vMTdiicUDe/VhhhDWOgc52nx9OaGtUIgrjZBu03msnEw6
	Kei7eP2eA54t81FUr6i+UMMrNZkGmzd6yHlPgoX6YuBJlC7HI0XejaOpFBiadrGHcuLYwI2aucB
	eweEKj20yvwCr8dvd0XI2WpEenbXUJ52nu7H6QzeyI3iX3/d82vM2rHK7uy12qrebITL9NQKqFw
	rQsUegI8ME41a59ablkCF3CDdP/5aYUG9aYuDNZ892cUrl2BY7gLrFLkMazMFbdP3rRSMW613oU
	zz1qYY9eCudI6L5YA==
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr269724115ad.0.1781080927559;
        Wed, 10 Jun 2026 01:42:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:07 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 10 Jun 2026 16:40:45 +0800
Message-ID: <20260610084053.2059858-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014208_175780_D4A0A191 
X-CRM114-Status: GOOD (  13.96  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 49293376956b..a21a3dbe8a5d 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -70,46 +70,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
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
@@ -131,13 +131,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
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
 
@@ -148,7 +159,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.54.0.1099.g489fc7bff1-goog


