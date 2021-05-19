Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAA8C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:24:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0534760234
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 16:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0534760234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qUUUiK0Tp9xGucJe0gT0vxvtobmrnljJivzGU4qukcE=; b=TYJeLa34HiT2nfeuwxL6sB5r7
	JShbmh3PIv/xGl8TdrdLn/GpfWxKWS/h12tMYhnQWb64R1TjbgaEwfkF4e/1rcqKMulfWoT7f6zHg
	bX6q2ACI7ukM2JL6wP0zXSyZGwsHg/rEGmCWnHznH0AZaHVGFkr1CRHJ1ktzJHaSpA/KYbRgYd+HA
	Mx2tH9qB5/bUOYyT0gRREBofkdvTSxK70rRZeLcYjibNWzpHWAf5KY/xXzk5ypS0gnMtzd9sEwVcv
	NFM/1nUiBWIhi0Tyypg4JKRHtXaJlLJ5HI9qnD7Vc2YO7bR4y4fLAA5L8lLHytfCXeiTcJWnZIKBm
	nxDFJuBOw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljOzv-004W6V-JA; Wed, 19 May 2021 16:24:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOzd-004W1M-Vk
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 16:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xDecEJ8FPO187q788YjGGMjJH6kTnQ+F3dKYqIcPUTE=; b=Z0iaynF+FSbmD72R8a/HFFUgp+
 5UssKrpinBP175+emP2NkUt+XNJ9vlQElyYtOKtJHw2H5xYrRpo2R1bhb3S9po7z1gJc/+tx7jtrf
 TXQdbNCcuaHCm1GIR9cVIfDgkcnXGreFLPyn8Vzu+FEN519kI0WXAQsVtwdmnNtHtPXcxo0j+OkLZ
 da/5JrzwKHDBrgRqmIkTAmAnGO3+BPidXSBA0XdZ06wEYQGEiT5wDDpwHJUGZWbe+djHfpscyTj4+
 tN0GvkwDNcmjQouANPmLx7aXSFy5NPbSUJ8GDJPIrS5Xf2qXI+vHkid0qd8SxzrLD200cDMoCuqOS
 0eDKz6pQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljOzX-00FclP-DZ
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 16:24:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id b7so7017818wmh.5
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDecEJ8FPO187q788YjGGMjJH6kTnQ+F3dKYqIcPUTE=;
 b=U8NQGKYWIzTHZZjQWZocDtXkC2360rFQbt29YWhB09tKEd6q20740IzNwNf9VYr9ri
 nbGFTmyu/u/fvP4AgooP27UVva29dYIUZ4Ujh5IWqKkGXFXekjbePnEAAEWg1GKXVW/v
 hQ6VDGt4dokyV2e/VtaYH5QsRX85vzoEZhhqvLcIPxCgq68hU0+blVeNBNwppH6AkAIU
 q58eYPkLmNtQTFklZ0hl36MLbq+ZQ2C0PSFIlDwxcce7Gk0Db5RxZb4xsBLRrTcuotox
 JfByYaV8dUir52DIMD+ANQIFmx2KbEeiceB1XKAxRbrfFMxdTxZu662xUecewI+Z3AV0
 Q3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDecEJ8FPO187q788YjGGMjJH6kTnQ+F3dKYqIcPUTE=;
 b=hRr5VWgSWkUZyv+3kifPvBScJrztSTRwi2qvOwk3K7Yg0d9GKg5tYtfFC6XRYtapEB
 xBeSNqD9r/BLJQ2k15yIdDQkDVDkRQyGIB1CW3YpYRZM9D/NVjIV1BmyTgKq9gDyGXmi
 qhQnFTn79yHcVCwVMHYCgavygwbzP988hi8Bd50iH8Nyrt+FeGJLiDKsnNX9mdjv14K+
 /N/zPgQ8iZhI7zLsOmLpyaflXL0MnxAQvlB8mxVAJvgXtzi2TOBjULtrIUhePHwENDL7
 cn5405J5rx6UzTEI3v1aX45yOfAOm0bjs0wbjJkSZfB8z5EFBlp8UCUl3DDIAYWEEQxT
 Yrvw==
X-Gm-Message-State: AOAM531DDJoSTK1n8e97KzK2i04Uy19r5rI1uQlwT9WzV94BfupQRfLQ
 n55VG1/W3IbDJOYS62vab0I1KQ==
X-Google-Smtp-Source: ABdhPJxBxVZ+GBRsoB7WKm0donupE/x8LTiMFNOKNBnwn090HBIP7REjBBZ/Nddf2jkgWRghlrCV+A==
X-Received: by 2002:a7b:c154:: with SMTP id z20mr128550wmi.13.1621441454146;
 Wed, 19 May 2021 09:24:14 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id p10sm24489710wrr.58.2021.05.19.09.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:24:13 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] pinctrl: mediatek: don't hardcode mode encoding in common
 code
Date: Wed, 19 May 2021 18:24:07 +0200
Message-Id: <20210519162409.3755679-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519162409.3755679-1-fparent@baylibre.com>
References: <20210519162409.3755679-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_092415_470198_82B5027E 
X-CRM114-Status: GOOD (  18.41  )
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

MT8365 encode the pins mode differently than other
MTK pinctrl drivers that use the PINCTRL_MTK common code.

Add 3 new fields in mtk_pinctrl_devdata in order to store how
pin modes are encoded into the register. At the
same time update all the pinctrl driver that depends on
CONFIG_PINCTRL_MTK.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mt8127.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mt8135.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mt8516.c     |  3 +++
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 19 +++++++++----------
 drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  3 +++
 10 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2701.c b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
index df8c6fb12955..37228dd5103e 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2701.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
@@ -523,6 +523,9 @@ static const struct mtk_pinctrl_devdata mt2701_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0x1f,
 	.port_align = 4,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 	.eint_hw = {
 		.port_mask = 6,
 		.ports     = 6,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2712.c b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
index 8398d55c01cb..ba35fc6cc138 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2712.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
@@ -576,6 +576,9 @@ static const struct mtk_pinctrl_devdata mt2712_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 	.eint_hw = {
 		.port_mask = 0xf,
 		.ports     = 8,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index a1914e0e49c7..bc5c3dfcdc76 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -33,6 +33,9 @@ static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 	.port_shf = 3,
 	.port_mask = 0x3,
 	.port_align = 2,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 };
 
 static int mt6397_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index 5f05be056309..eaf5c76b14c7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -292,6 +292,9 @@ static const struct mtk_pinctrl_devdata mt8127_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 	.eint_hw = {
 		.port_mask = 7,
 		.ports     = 6,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 9ac784c48873..b8f4080aab45 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -305,6 +305,9 @@ static const struct mtk_pinctrl_devdata mt8135_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 	.eint_hw = {
 		.port_mask = 7,
 		.ports     = 6,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index 7b68886bad16..ba12ef795e52 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -324,6 +324,9 @@ static const struct mtk_pinctrl_devdata mt8167_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 	.eint_hw = {
 		.port_mask = 7,
 		.ports     = 6,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
index 75e7c0978337..fc99df8a11c6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
@@ -332,6 +332,9 @@ static const struct mtk_pinctrl_devdata mt8173_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 	.eint_hw = {
 		.port_mask = 7,
 		.ports     = 6,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index b375426aa61e..219fb4bc341f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -324,6 +324,9 @@ static const struct mtk_pinctrl_devdata mt8516_pinctrl_data = {
 	.port_shf = 4,
 	.port_mask = 0xf,
 	.port_align = 4,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
 	.eint_hw = {
 		.port_mask = 7,
 		.ports     = 6,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index a02ad10ec6fa..9fe91e11a877 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -33,7 +33,6 @@
 #include "mtk-eint.h"
 #include "pinctrl-mtk-common.h"
 
-#define MAX_GPIO_MODE_PER_REG 5
 #define GPIO_MODE_BITS        3
 #define GPIO_MODE_PREFIX "GPIO"
 
@@ -61,7 +60,7 @@ static struct regmap *mtk_get_regmap(struct mtk_pinctrl *pctl,
 static unsigned int mtk_get_port(struct mtk_pinctrl *pctl, unsigned long pin)
 {
 	/* Different SoC has different mask and port shift. */
-	return ((pin >> 4) & pctl->devdata->port_mask)
+	return ((pin >> pctl->devdata->mode_shf) & pctl->devdata->port_mask)
 			<< pctl->devdata->port_shf;
 }
 
@@ -74,7 +73,7 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	struct mtk_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 
 	reg_addr = mtk_get_port(pctl, offset) + pctl->devdata->dir_offset;
-	bit = BIT(offset & 0xf);
+	bit = BIT(offset & pctl->devdata->mode_mask);
 
 	if (pctl->devdata->spec_dir_set)
 		pctl->devdata->spec_dir_set(&reg_addr, offset);
@@ -96,7 +95,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 
 	reg_addr = mtk_get_port(pctl, offset) + pctl->devdata->dout_offset;
-	bit = BIT(offset & 0xf);
+	bit = BIT(offset & pctl->devdata->mode_mask);
 
 	if (value)
 		reg_addr = SET_ADDR(reg_addr, pctl);
@@ -135,7 +134,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
 			pin, pctl->devdata->port_align, value, arg);
 	}
 
-	bit = BIT(pin & 0xf);
+	bit = BIT(offset & pctl->devdata->mode_mask);
 
 	if (arg == PIN_CONFIG_INPUT_ENABLE)
 		offset = pctl->devdata->ies_offset;
@@ -311,7 +310,7 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
 		return -EINVAL;
 	}
 
-	bit = BIT(pin & 0xf);
+	bit = BIT(pin & pctl->devdata->mode_mask);
 	if (enable)
 		reg_pullen = SET_ADDR(mtk_get_port(pctl, pin) +
 			pctl->devdata->pullen_offset, pctl);
@@ -683,11 +682,11 @@ static int mtk_pmx_set_mode(struct pinctrl_dev *pctldev,
 		pctl->devdata->spec_pinmux_set(mtk_get_regmap(pctl, pin),
 					pin, mode);
 
-	reg_addr = ((pin / MAX_GPIO_MODE_PER_REG) << pctl->devdata->port_shf)
+	reg_addr = ((pin / pctl->devdata->mode_per_reg) << pctl->devdata->port_shf)
 			+ pctl->devdata->pinmux_offset;
 
 	mode &= mask;
-	bit = pin % MAX_GPIO_MODE_PER_REG;
+	bit = pin % pctl->devdata->mode_per_reg;
 	mask <<= (GPIO_MODE_BITS * bit);
 	val = (mode << (GPIO_MODE_BITS * bit));
 	return regmap_update_bits(mtk_get_regmap(pctl, pin),
@@ -798,7 +797,7 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	struct mtk_pinctrl *pctl = gpiochip_get_data(chip);
 
 	reg_addr =  mtk_get_port(pctl, offset) + pctl->devdata->dir_offset;
-	bit = BIT(offset & 0xf);
+	bit = BIT(offset & pctl->devdata->mode_mask);
 
 	if (pctl->devdata->spec_dir_set)
 		pctl->devdata->spec_dir_set(&reg_addr, offset);
@@ -820,7 +819,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
 	reg_addr = mtk_get_port(pctl, offset) +
 		pctl->devdata->din_offset;
 
-	bit = BIT(offset & 0xf);
+	bit = BIT(offset & pctl->devdata->mode_mask);
 	regmap_read(pctl->regmap1, reg_addr, &read_val);
 	return !!(read_val & bit);
 }
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
index 69364b56803f..98f27cdc609a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
@@ -254,6 +254,9 @@ struct mtk_pinctrl_devdata {
 	unsigned char  port_align;
 	struct mtk_eint_hw eint_hw;
 	struct mtk_eint_regs *eint_regs;
+	unsigned int mode_mask;
+	unsigned int mode_per_reg;
+	unsigned int mode_shf;
 };
 
 struct mtk_pinctrl {
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
