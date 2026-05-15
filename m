Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6F7CD4F3D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=; b=M9CNRr6ZYwhT0kMGELBTIDbsmy
	pBR1iEKWdtQs9TLvPMBZWM4yPUgmFc9DSG+7zC22qisTo4Gn/8Lpilq4w8Yw2/1HBgEN+oCI5Ytt9
	RDexK26ulj2NI60+BNPEuOnUS5biGC4EYOUXkvcMTwv7GOH+oy1Kxsd2G5vqJdM4Hc8UUC3dSKBTP
	i5G/WnHwg1JjfjhKKsFIdfC+xL9bumaj4zx0L9DS27Ipc5wJhjwwur9hV+IBT9P1J77pW8B23KmJR
	Ub/gr0OVBznBjWgxoDwcJbCZywZlqIlj9k8xTBYFuY5PnCt417AS7JWCbX3K6LLe+fjfeK2jG6Tlf
	mKPL/XIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR6-00000007okI-19n1;
	Fri, 15 May 2026 09:02:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoR1-00000007oeq-0RvJ
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3692bf38290so1178346a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835738; x=1779440538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=;
        b=fGVCcNgdZTNGfeScFjapOIw3i3pLZC/4PyuWuMs0QdquFsXSrgbPmWtEpbbu2ZXPNO
         szM2giQckN6HXmFDOHfkQRUyRg7rNI+ADIxqhIZd02DCtxzGR8C2dxGa8lXYorAv14Fy
         lxVjfBpHGhojAcJZEJfTQ3eKcrAFZjl5HMtbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835738; x=1779440538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lkMXWQOY3SYOq1egH+Z6kUsiL0nTYxohMUH/RmfCF7Q=;
        b=YUwT68oAllSR9TRLygmXN+ZVg4c03NoJMLAEqmDsyo8zT0XvzZ/rylFagGGJNMfKPc
         dVf5K4xio+toKUj856f+xYbPw7IqoYRj0TjQ/0Nq6UXuER6O+uUQlx8oCHOr+9uRo454
         HsKgcO2LIKc72sK4IMKcz/l3Sf7TtBcBS9hG1MZcbBNDGm5chfwTyOK2wgB5JN5rqr7r
         bjisjdZMmDegPB2/xhYx8S4NA7QLNJU40JWhitm3x3PT31YZ2I+Nz/9LqX/fzbrHguw/
         7TWcofOpgay3ZjQcMDeYK6W3pmVlQnZMUToRko/lTn2cMZ6Hggkh58rGnhO2A5hzMkoP
         Dw6g==
X-Forwarded-Encrypted: i=1; AFNElJ8NMBV8clX9vSGP1YLCu4hhoZybfb1q8Lqyx0GGcSOwXWCvhxQwEvUMvfZl3ogj1lS619gdIpAdNMIN2v+xXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3uN3ynMzeTUwfZlZ2vDkiCNVOZ4HyHGSC1qE56OFwP2iXTSeV
	xiMwVu3CdYiUD4B6C51dSkuJMHVtQ3K4WO0O80H5dXZcIUtZyz4LZrNUKzARTCaekA==
X-Gm-Gg: Acq92OHvajYZJTM1q45KWARUgMaLqtcnqyj8gHioH8HNP7bN+ydm6a07Lg4gOvz07/X
	5Jbq+N6lys5QhCHEjq25xh+8tZlG0CSSn/vWoVaxUe01+q5PZijCP8s/MeYpcfhboYj0TCUNfZR
	5ff/YUUlN93Bsg5BAHkHt1S2adG+Bv3TNet2Ss1D71LEivn5zqKvGUFYH1wCcn6UlDQI1htOPp9
	lRJJJDX1zF2jqGBho4xrxuI6FR6lyDBgZHh6HOSa9xqzEbPwIKm1DVFG+qDbJU1QhcPlj+m9xJv
	Nn8ICls4rEHbDKVt9OvuNW+nZhEQgb70JHpErxrdYVQn0q3It1fPuz9wxY0K+rqfH9hyiARS18l
	hmmsM1GHLwd3qr+yosgpqrSYzdSX1GuqVC4tmFFKIdYPUMNesTXWvx7LOqc1jZBX2sMOvr+L6ML
	Z+Jakn0FWz0EzLJfAG3bycrSC14JfEDmxAkj/bfQ8eSDinMOiYQSPLMbhchAIUrwQbhJCaS4BDl
	ekMhDN1UY7IaBKrunI=
X-Received: by 2002:a17:90b:5744:b0:366:159a:c17e with SMTP id 98e67ed59e1d1-369518af9c4mr3451493a91.2.1778835738088;
        Fri, 15 May 2026 02:02:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 03/12] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri, 15 May 2026 17:01:39 +0800
Message-ID: <20260515090149.3169406-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020219_636597_F28C2F92 
X-CRM114-Status: GOOD (  13.49  )
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
index c9aed2c02e81..a5585f000ef1 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -62,46 +62,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
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
@@ -123,13 +123,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
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
 
@@ -140,7 +151,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.54.0.563.g4f69b47b94-goog


