Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDFC88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=; b=sAgZqrT57bXH6hiNUjUkjvKpIG
	BREagMIZfcp8fSOOOJRbBJtus1HwUE8yA29V65prt7SGqGQmeokCnpbvu8AzlNImSq7R1UQNh8ub4
	luIuNISJMSmotCi8PCxXBZNFc6ne9QOxnd29tLMF6C/QqL9dJA4FoMlrfrriuq/c4JBUG2WnwV5Uu
	AZ5n2CCWbDmc82wmatQ2f9qLmp/kshGjlQVIx+idFfz4SsCsFcu7tR3yG4+0y8VQdq/oxVxI8erJs
	/vx9F9hPKmu68cMp2WchuJZIPJdPUdK61MSkQYYA7wV08Haw9182YYG6C+mhTQXLJt7RvmaMoMWHN
	qpteliQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kZB-00000008equ-0sGE;
	Wed, 16 Sep 2026 08:00:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYF-00000008eHR-0OYX
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=; b=M4FNmsX3g+wy5zMQbDcCQ18rzt
	1e5EgWa7hU2FDhBIn5lIF+uZbnVv1dJmGX5ran12k7LllF1Hfj/7Em99lKkH5AVueudXUnGLG3gl9
	1OZs5zVFN2r51He7PNQVhHO+BnprpvYENb2Z2z+FSKVl/liOS63Z9KqoDRYMgbJO4JdngSwydKQrH
	W+jrKIrmNgiT0vof2Pf0YHAf+FciAHWvUYWEDLuehvnZS0BG/pWh/frvtRlS7TCmadFtDmRjjEBnj
	4srWyQNiaSQpJOollliU7t834q56Kdlh6hxKYmIWYMXRYI09QIoMRvdh1l3LpXEhzt0XkNQZXPJ99
	6mFIXCcw==;
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kYC-00000007bdh-08Qy
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:29 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccda24afso405184a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545566; x=1790150366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=JKNa59DnL4Y9wJAnyTgFpqu3FoIXlSHXrw5hM/VC4Kep5FA+4lfz5ec1zsgtIPiwnW
         qPV7AMe9G3+xzS3Jxj6dZpTyHr5fgwE5STngFRnZ7ZOfckKOIN2gFEoqtqUfwXIJ6TDB
         A/3Y2y1vu3aDkZCaFGKOADu71scWVEqkmsHxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545566; x=1790150366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HG7OvbliYWQiE77ZMzyIyMkMvjpjZCW/b60QdeLOOYM=;
        b=cxi5y3ip6JbNLIVu+9NSYAEeQ1tpu51zf/J6ETLG3pSDgtN5ILbIxW3rzMFXHKd4gH
         ck01rqqqNF3SH5mtxNEgzLCWOaaWkjIvA9sPhriMjEcS/7RZz+DoXauF6D4IovC/m+GM
         rSoZW1K02XvAF48rF95qGmznWAMWQV0eugcMrM2oJmZ1iEm2l2qR6HrS0xUz9++ukv5o
         odv0YANjYVM6y9+jNjc+7AQ2ndXsIC3GzGPsYl3OOXeEdC3rbEvOcvnQz0eMvM0s+lgv
         0uqc5KFFukmPCCp9ii0IaoG8DKJUZ08YyG4iC40i7zWCOLWrBPOjvGlr8Bh7zHClGkXc
         myLg==
X-Forwarded-Encrypted: i=1; AKwUvBw4AfaRs7X8tDoK/M2h3oy77LRl5rqRFzBGWvOryoBNPRzN1o+k148brzRlBQ6lXkvpS+v/pOzXBRE8gjTotw==@lists.infradead.org
X-Gm-Message-State: AFuF++nRBLwV9T3Bp+JkD+M9x0wOBjqERrwuOnlnW+TGy+jjjtV6md5j
	T5hVie2c/k7sl2rYgg0EDDx+GtkRk5EsJproGdSpJqGyv6PWutawEQ7K2VHCKc2CKg==
X-Gm-Gg: AYBFou2OL+dUR8LifR+H/nziUqMxLP2ziqQ6zgHocIQ3dHkUHO6Pg4BdDyfj4zMZicf
	dukT7uL48W3EC8r5aGuCrX52FgfIF2NOCgxD96iM+UQv1smA4u0c5S2kgy6X+QQQVKB+5w9GN1X
	0MZGoD4U5rBaWEwBG/IEMa8iRSm+QfZZd9a7ucnGaHXrZn9gH8W8Jk/E5bHf7NHxP0X++IJfsuB
	2tDLxKGMG8Li9/sbulXDftDgffyBKlRz1+arytgqCOvUSmHm8KM4ogvt8cndBq5KsW2lVn/GOjj
	XbbtPvKllqX2XgNIGUVuB9MOUwnEziAKmLj6XFVDRI2ISTexV1gqb5escbG3TI2QmpE0tdcTsBn
	p5T8HsAjxjsFWpX6PTASLmvI/DzUtMg6TJN4YAzTE//HlQl0NHMcJaobhcSr9iwEdRC1bCJquVb
	WT1HgnKhIqUJJ2UK9vz5Y7kEyrFuHx0BU/d33nWoR3VKS5gDR4L1yZQ3Nqa+RthLBHv0v09C0E3
	fGcqeWzv40o8cWSt4B2PWMQkyQLyA3XvCTh0dst4XBYcxwy1fS0eo6G50tSWjsVdbsO
X-Received: by 2002:a17:90b:3b91:b0:398:a486:81ec with SMTP id 98e67ed59e1d1-39e1e380e12mr4028912a91.11.1789545566189;
        Wed, 16 Sep 2026 00:59:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:25 -0700 (PDT)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 12/15] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 16 Sep 2026 15:57:38 +0800
Message-ID: <20260916075745.3549953-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085928_211339_8884CB2A 
X-CRM114-Status: GOOD (  14.81  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 350a4c8831f7..499cfd291a39 100644
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
2.55.0.1032.g73a4cd73de-goog


