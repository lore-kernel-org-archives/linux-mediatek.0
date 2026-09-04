Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC26CC79F83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=; b=Nx9xbzmwhn9oj3FH0OcnGFN0NZ
	njO6TuYiMCEiPvxyP0Wv/VWj5cQWTiUZ5bfzzGlNoh60mlv5C/WxaXS1b0sc7LJBEK4P1FBEwfjI2
	xj24XGxNS60EV2yLpfBH8zMxul1l+dnIL1ujwknPfH60clraVfSE2wS1iWxm+PiiRLEcZoHe3PBWn
	E+JNkd9uF27205BoVkAgIaL5q/3vwRPGeCam12ckaHNm7K+TrGSyEbJALSBNe84mi3a/p4Mn8kEvI
	lzqkbkS0mZLRUBqP07ujWnJZjG92/QpsNOPqHemVpEEOjyMOcDPu1U407oEULQ4p829A9oghKlx4M
	9XjtUD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXJ-00000001Qpc-45qk;
	Fri, 04 Sep 2026 08:44:37 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PXG-00000001QkV-0F0Q
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso874122a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511473; x=1789116273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=;
        b=NQfUNfqexw+Of+wkQA/CdkLZxXI+EeV0x05SWAb/fpvaZ2BuhkXPMlg32TrtgfxqL+
         aFAEOYAPyM/ucG8IIqnqj0R9831GakOqrQcDffbqtsZVbV8rMuwySYJ2dhNljvyfOQw2
         6G1IECNaNOggfZC9A1LMMoX1ksgU8SYvUphgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511473; x=1789116273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=;
        b=ErhsJLvU3JlczuSSIoEAUVqHLhHIMTD5u1zilicfi9NBO9UylQ3P1BpGmarbVfIAWd
         Srjhf0qNP00i8+TTXcnHiVTDSjbBUI6qNaxfuG72Q3fITBRGkTXZjGPCCkxuuHwneX4S
         NRjro++27MVKpJeFMMqjr7nbuIUgVXkfwwXBIKSefP1gvUwL16OE6tOQOFYb6aMBE6af
         uN2PffkGMHzJSPO82srdBlPTcF5XhxkSr0bMN/bWJ4Nn1puDIR6QwmZD1WNFUABV+cFA
         47iecUoDpTeJ+yp6vbCoA7RLBgzdqzNpQuGuJnuKPBVZwPVkzoO9/wFYjzbLNTr294jn
         csTw==
X-Forwarded-Encrypted: i=1; AKwUvBwtWy1l7zrz8DdpbX2S+C0SVQMMRCTgL6fkLyLY4Z9g1Jnat4behrlEMRCnr4Y0FZ+elFh5VaySkFa1SIP4dA==@lists.infradead.org
X-Gm-Message-State: AFuF++n6ROTTnAsMvG51EX5xt6bu4Uzzu8Vfpgjsp31//JLISpkcED7B
	bIf8RIPmGY/d9i7t/HdbY8k0UP0VCdSKJvx/pLajrSfp6c5smhlKy94pwtFzX2iBXQ==
X-Gm-Gg: AYBFou0s17qYReeM5U/Ffn/zQW3o7Snz440lK0aEeNMoD8U6xQZmASWrmVOcdCyZfsT
	i6Pu9ktZ27CFhWkXoBhTul0YQ44Z8eniD8y039Piz/uCnqKffMUtTZ4lg6/Cvm+/gEVItfMpazz
	nLx22OIPqZ/PH7AqjR4DcFWCzeWfwGTPd24wdz4IlAgXxorwVcnxGVc7OVwXaz2JFcYC0RFaSkp
	IAKmvaLZxCn7Ax7umnGYucFitgH16WY2iDGaSFkniflKUgVXhXra1TJEP3Mir4HwzeqOJWFMdgR
	Sj1p/W/PINLGyaC4wbdxsiqep+rrXSS+XHShUDvZwz//0ePF9viLlOhdbo54UqTJiF57pOQLtIP
	uWI/HkF5H5StU7lrgYxHtPv3NMMWHB5J9PcI4tVw2CtPWlK9e+A/elOGaHa39wpg6J7JLfglcyh
	e07wAFMcwN0d4zueM2pjSQsWwGhiJf7l2J7DE5gQS0iFvq1GAb2PLz9eOd24ZKPdmvyXi4sXxVN
	0uq7Sziq4VUD5CqIVKTSnu+BRCdtdexeCCm3Atp8gpcV7Dq822T+WTt
X-Received: by 2002:a17:90a:e18b:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39b26155274mr6523995a91.10.1788511473366;
        Fri, 04 Sep 2026 01:44:33 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:32 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Fri,  4 Sep 2026 16:41:53 +0800
Message-ID: <20260904084158.1341550-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014434_103437_F2B16F18 
X-CRM114-Status: GOOD (  22.14  )
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
index 987faa9f3b3b..f7bcc8bb4c77 100644
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
2.55.0.979.g7e5102b832-goog


