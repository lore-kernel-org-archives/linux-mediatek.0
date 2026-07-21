Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CABC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 06:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=; b=Cr9c1GdnxOj1AiuBQuop8oWE3N
	m5RwKgR1G8B4ST7CGfLvHklO/KNabEbjsreK6Jt3SJKNgUFdIUTGkPUfTD5NtAJTE3PBKzXrh65XB
	jEYNY/StyHRet5Xttul5JTf0MpKZUyH3LTWzHSGYR9MqrXlNjFHWV1C4SgCl+X3hDS1IJEU2P2SrF
	VJYd+WslOn7nECgi02TQbq8JVMVEVxN3xW9r+lkuPX9K4WxEN+NZ/+MoBPtabHB2pl+26Aw9bk7ET
	JBWw8g9ikh9eZ8k1imvxOFZ4dMYAHxZj3hXcTyH3zBrUgLDfSRfpv5WWgONIUBBf6zM3tggTumtEr
	aKL7iUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Oe-00000008bNe-0e8G;
	Tue, 21 Jul 2026 06:56:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4OE-00000008az9-3QW1
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cca0c5799eso86502795ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 23:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616942; x=1785221742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=VqWcy+Kwc8equCylbyqIo9Nx3IefOboKmt4wf7JciImC4+/Dwnu1KSWWmfsrEItu8/
         6ZEJ43S7rQAc340IRD8Lkg0iZAI+6exBxPEXk85x1vzJS84rlcDqlnZjfB0mSpZ+TrfX
         V8Db8pUclihW1T4UDWnB23A9icpHSoLCXmnjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616942; x=1785221742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=T5P1OnazOGj0MO6l6elFcJkQ98/BNNMVR8xGvpxCddxJEVNfWVjlQiAruu/MBcFx00
         kH4SJhMmUimXEy6WtkIbDTNrK5V/lF33sReGpUpb6LqnfcgBgllj8DDzc+x7BYkdTS98
         xBWXtnOUs3h8HaNhTSdHFJbUIDoLy8GaCAs/UnNmD5vPYUTG6PWEkWYuIaZXsHENjz0a
         Sx90po4zR/hfS0oZrlRMV6EJX2BV3D+VEAvttAV8KV8d6dZEyOR+clBARylJeFbn7vHc
         WZYgauFRXadXh3snz71dqmlCw8HMtDOqU+6F39NQLuFNGP8paHFknlMHBHbspDA91yyJ
         EHzw==
X-Forwarded-Encrypted: i=1; AHgh+RqfwkDopSR8vfOm9Xg+Xz5J5BhIQ9c2eOgc/GVHSUICHkRY9eUX/ik3ULXdE5ksiT1/EsIv3IFIEiHsLEASrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YykvHDq/BFhcGTps2TT7gBvqptzRgfHufBdT0fkFISWqXiWiJNI
	qOu6JEQhSjrRh2tgPnGKVQAa4gE80wdhqW+QlM5LU+N2pNe6qU8xI7UK4jLPASKpJA==
X-Gm-Gg: AfdE7ckZiepoqOy6MKORtse3QaHeuT9AktGaP1ctIvqpamRZI88OD58Lba0Lllbpscs
	V5o8lEFHSbkM+FGFCV68ZNTuxMk0k4Aken9Rwipv7OBhGcISu1uJZ4D0q9/HiThpMYqiFXX0Qkd
	/A9I/mp31p5/GY31ysVjSKF7DJF4UZDP09sK6bxWShslyhtdPDdj9uPgxdKqrGPMPDjxyyr3Bik
	YbdPzmdnJ5niqxECX16aQqKr0eP4KN4INoeCHUYnaYASRRFE3vzk0LKQKEdsxiSaUAbgJPZGWo/
	X4N79pMGUUiu4Vzui3ThHOX/xETO3g5nHepFJev8XQebeqLJlqMOGBQ9l+4tcgc1N2s3XWpfE4L
	TZtdfEDlVD0n+cVc73dKGjwNoDVw4STfsIzlxQN86sG5MkXOx1GeZMhZmZUF9LPCh+XInmvgNM+
	aB8RTPYkM32ND10Xzr0nrAqvj2G2/8tbPAxN2kQJEVGlTnsM4pNupDTCB79tkFiyHZDvf+sQ==
X-Received: by 2002:a17:903:3550:b0:2c9:97a8:aff1 with SMTP id d9443c01a7336-2cf349f76b7mr179989295ad.42.1784616941867;
        Mon, 20 Jul 2026 23:55:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:41 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v6 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Tue, 21 Jul 2026 14:54:09 +0800
Message-ID: <20260721065413.2306137-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235542_869723_0063F582 
X-CRM114-Status: GOOD (  22.67  )
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

Some UART / serdev based Bluetooth drivers need to be able to reset the
hardware during initialization or recovery. This is not possible with
the current power sequencing API if a unit is shared between USB and
UART interfaces.

For now, split the Bluetooth unit into two, one for each interface.
This allows either interface to independently toggle the power, with
the last action prevailing, thereby unbreaking the Qualcomm Bluetooth
serdev driver. This is also needed for the Realtek Bluetooth serdev
driver (hci_h5).

Having independent control from either interface unfortunately means
that userspace is able to shut down the controller from sysfs using
the USB port's "disable" setting without the serdev driver knowing
about it. On the USB side, independent control is also desired, as it
allows the USB core to power cycle the port/device during faults, and
for userspace to initiate reset and recovery using the aforementioned
"disable" setting. However when USB is used, a serdev device is not
created, and there is no conflicting usage, which allows the power
sequencing to work even without the split unit.

Suggested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch

This patch is _not_ squashed into the previous to provide clear context
on the change, and the less than perfect nature of it.

I think what we need in this case is some sort of lockout. The serdev
consumer would want "exclusive" access, locking out the USB consumer,
which can tolerate "shared" access.

Something similar would be needed for the WiFi if we ever add support
for SDIO for toggling the state of W_DISABLE#1. At least the SDIO and
PCIe reset signals are separate.
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 693b0d33f8cf..56e4f40e0480 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
-	.name = "bt-enable",
+/*
+ * XXX There are two Bluetooth units to allow either one to be able to power
+ * off and thus reset the controller. In practice only one of the interfaces
+ * is used, so there is no conflict. However userspace could power off the
+ * USB unit by disabling the associated USB port, without the UART unit or
+ * its consumer ever knowing.
+ */
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_uart_unit_data = {
+	.name = "bt-uart-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
+};
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_usb_unit_data = {
+	.name = "bt-usb-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_bt_enable,
 	.disable = pwrseq_pci_m2_e_bt_disable,
@@ -130,13 +144,13 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
 	.name = "usb",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_usb_unit_data,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
-- 
2.55.0.229.g6434b31f56-goog


