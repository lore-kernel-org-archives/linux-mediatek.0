Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA10EC61DBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVgxh9oUlB3e4bZmBcCaqz9cii+hpvVBbhiEnaUJ6LQ=; b=uWOWaIRz+0XmVMd0tsLM+MukNH
	r1+Xybvgw1p2kHJ+F0dD31qX1dbOKZsFn0apOHi418WyJTPVUpZomP7qeT43hXIuf9fdDL4AEH+LI
	1fWsr6pFKfj4fCh9eFyi/RJh80vHPAiowzrbyNAHnENbOJ7u0KM7ELB9p7sHfQhTG+f58P8h9sZkM
	X1e6qqCHmP4pxogwEzQ1Zw0a7oJM7+z+9Mm8DcKlp4+cJwDyAImc4CFdUdbZ+gB45571L3Phu2XoH
	7s/Kuu6glZ7Ujm7HopzmOJwq95ojWr+fQ7hWcz1O2NRRZnGppvY7o9jJ/RtQRSufgkrarN6p866Xo
	clptV6Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzycF-000000066s6-36rR;
	Fri, 28 Aug 2026 15:35:39 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzycD-000000066qe-1zUD
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 15:35:38 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so926613a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931336; x=1788536136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVgxh9oUlB3e4bZmBcCaqz9cii+hpvVBbhiEnaUJ6LQ=;
        b=Am/SqMXagfPUY+ccwH7hbm7vU7Y1rcjAl3+nSRShw+fuN0hJYwWNEvZ+cV1m2vwuJ4
         R95JfMnAVHXYWcH3FR1Up3MJPNm0Rv4bpbqVEwUnQCaxAhaFcWNGiLDABSHL1G9iikY+
         N/cQ0c//tQxv1fUw4K+T7ANg8tosIu5z1L6Dv23HQJ8ZoHjvF3fqy6p8bPmKcSigXCvf
         kyUIDM6nD+tdX0RsuJu+4tSZTxwn1eFxTiJSyOzUynEMjG4wLwZi61b3GLPWIJtJfydz
         cnek1BTHwtreKWFjjKHss/UcrlcTvr8aXU3Aj5+fdv9EWhgl2foaZc8tpSOQTlZ0n5Mt
         dGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931336; x=1788536136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVgxh9oUlB3e4bZmBcCaqz9cii+hpvVBbhiEnaUJ6LQ=;
        b=hF5wtZo3/9vYHc0ML5TvKv+fqDDU2Zv/ZYvwuskxakF78DemUDAHllyLf/wRSEyoIw
         ihpHIoFwDobn4YEdc1eVqy/uNSXE8ORrgDhjqvJubwcsP46gJsmWI8uznj3/DTTujHxO
         nZeT5zFNKldRauMDOUFDiMzhCP0ulNOkf5Sx48mT15+57lro1Wg1vn+e/b9ag70N3372
         cl0JMsCapqj+L3+zLPNcIy0uN9BFn4mMvpXMEnZFfBvNVL7iJXXMzCijIuc08VCh8qZK
         DxI7c06bhpZO++7Yd8FJPFxYLT9vxTV5gJEdNf7BpHD8EXniKaF3AB3tRAnR6pR4xpSm
         d5Vw==
X-Forwarded-Encrypted: i=1; AHgh+RooT0h6JeZDr1Iyi7IMOX1YEUUHsct1kBJVhVLdRn5I4T1+Q0V1widb1qGMvT7SJ7IZyEkHJJCMN0cdfhfRxw==@lists.infradead.org
X-Gm-Message-State: AFuF++lRVEtASMahOu3uFOZp56h25riPSJSZmYFJut/CLtGB51qJ6G86
	MLZAh9VlPoTF03+FpmYKj7uJR1+0VRFpuYq8CmcD3I4ZaWIGd02ZC0gf
X-Gm-Gg: AR+sD11b5uJfK8xHaqQuYRVBnJmZiDnQBedOLu7THlJIpEmL020dynO8VwUOpZaMlS9
	48lASJY+A85wVlmtfOs+lw2QJxsq+VPhIEbGvNpnRkXAc08n4AC+N/4Km3tOup0ojcsWtjaaiiJ
	PBelwuzzk/pocVWs4mW1VnKmpP6LHN+lu5xJ+wSqLgkXKYxp+VmdxFdZL6dLQQcBzgbnOUQYmXR
	2266UjWljonb66yta1PfjhNJY8fVsUI+9LerjIlIZik26AD8XvJZDgbApnIo4GjUQyff/rRlQlz
	7l6MZVQhsRQJOCKAi0hIuSgJP0Ymd5eKTWs8igvfkzGJIoVNYZ1idEFIliHzU/90jvg6MpPXH+O
	fQiTq7RIrh7h6nT9FS9grYQ7h82NC4xWljU4hVFW2g0KxRreetuiZQf2OUXlXemxJToKgCSOAqN
	k+FWUgnw03rnGYVsxjk+UHrIRemR2wShcP6UN1PGzK6p2FQzz6UxETHm5PWKwCFpYEZH+Yob5kw
	F5fjBJLgOo=
X-Received: by 2002:a17:90b:1d52:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-396d10154abmr16419573a91.12.1787931336367;
        Fri, 28 Aug 2026 08:35:36 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.224.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm6256824eec.23.2026.08.28.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:35 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/3] pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
Date: Fri, 28 Aug 2026 19:35:13 +0400
Message-Id: <420a5e385cf7204318cdc1cc86a99570162e9b35.1787931313.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1787931313.git.naseefkm@gmail.com>
References: <cover.1787931313.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_083537_526903_3003F64B 
X-CRM114-Status: GOOD (  23.10  )
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

The driver assumes that every one of the AIROHA_NUM_PINS GPIOs can raise
an interrupt. That holds for the SoCs supported so far, but not for every
member of the family: on EN7528 only GPIO0-GPIO15 are wired to the
interrupt controller.

Without this the driver hands out interrupts for GPIOs that can never
fire, and the interrupt handler reads status registers that are not
backed by any pin.

Add a num_irq_pins field to the per-SoC match data and use it to bound
the interrupt callbacks and to size the loop in the interrupt handler.
Feed it to gpiolib through gpio_irq_chip::init_valid_mask as well, so
that gpiod_to_irq() fails for a pin that cannot be an interrupt source
instead of deferring the failure to request_irq().

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
---
 drivers/pinctrl/airoha/airoha-common.h  |  3 +++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 33 +++++++++++++++++++++----
 drivers/pinctrl/airoha/pinctrl-an7563.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c |  1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c |  1 +
 6 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index c1acbfb7426e..16f7abcdfb83 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -127,6 +127,7 @@ struct airoha_pinctrl {
 
 	struct gpio_chip gpiochip;
 	struct airoha_gpiochip_regs *gpio_regs;
+	unsigned int num_irq_pins;
 };
 
 struct airoha_pinctrl_match_data {
@@ -140,6 +141,8 @@ struct airoha_pinctrl_match_data {
 	const struct airoha_pinctrl_func *funcs;
 	const unsigned int num_funcs;
 	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
+	/* number of GPIOs wired to the interrupt controller */
+	const unsigned int num_irq_pins;
 };
 
 int airoha_pinctrl_probe(struct platform_device *pdev);
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f505a3f69c5d..52a768c859b7 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -213,7 +213,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 	u32 val = BIT(2 * offset);
 
-	if (WARN_ON_ONCE(data->hwirq >= AIROHA_NUM_PINS))
+	if (WARN_ON_ONCE(data->hwirq >= pinctrl->num_irq_pins))
 		return;
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(data));
@@ -249,7 +249,7 @@ static void airoha_irq_mask(struct irq_data *data)
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
 
-	if (data->hwirq >= AIROHA_NUM_PINS)
+	if (data->hwirq >= pinctrl->num_irq_pins)
 		return;
 
 	regmap_clear_bits(pinctrl->regmap, gpio_regs->level[index], mask);
@@ -265,7 +265,7 @@ static void airoha_irq_ack(struct irq_data *data)
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
-	if (data->hwirq >= AIROHA_NUM_PINS)
+	if (data->hwirq >= pinctrl->num_irq_pins)
 		return;
 
 	regmap_write(pinctrl->regmap, gpio_regs->status[index], BIT(offset));
@@ -273,7 +273,10 @@ static void airoha_irq_ack(struct irq_data *data)
 
 static int airoha_irq_type(struct irq_data *data, unsigned int type)
 {
-	if (data->hwirq >= AIROHA_NUM_PINS)
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+
+	if (data->hwirq >= pinctrl->num_irq_pins)
 		return -EINVAL;
 
 	if (type == IRQ_TYPE_NONE) {
@@ -304,9 +307,11 @@ static irqreturn_t airoha_irq_handler(int irq, void *data)
 {
 	struct airoha_pinctrl *pinctrl = data;
 	bool handled = false;
+	unsigned int nbanks;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(irq_status_regs); i++) {
+	nbanks = DIV_ROUND_UP(pinctrl->num_irq_pins, AIROHA_PIN_BANK_SIZE);
+	for (i = 0; i < nbanks; i++) {
 		struct gpio_irq_chip *girq = &pinctrl->gpiochip.irq;
 		u32 regmap;
 		unsigned long status;
@@ -340,6 +345,22 @@ static const struct irq_chip airoha_gpio_irq_chip = {
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
+/*
+ * Mark the GPIOs that are not wired to the interrupt controller as not
+ * valid, so that gpiod_to_irq() fails for them with -ENXIO instead of
+ * handing out an interrupt that can never fire.
+ */
+static void airoha_gpio_init_valid_mask(struct gpio_chip *gc,
+					unsigned long *valid_mask,
+					unsigned int ngpios)
+{
+	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
+	unsigned int num_irq_pins = pinctrl->num_irq_pins;
+
+	if (num_irq_pins < ngpios)
+		bitmap_clear(valid_mask, num_irq_pins, ngpios - num_irq_pins);
+}
+
 static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 					struct platform_device *pdev)
 {
@@ -362,6 +383,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
+	girq->init_valid_mask = airoha_gpio_init_valid_mask;
 	gpio_irq_chip_set_chip(girq, &airoha_gpio_irq_chip);
 
 	irq = platform_get_irq(pdev, 0);
@@ -848,6 +870,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->grps = data->grps;
 	pinctrl->funcs = data->funcs;
 	pinctrl->confs_info = data->confs_info;
+	pinctrl->num_irq_pins = data->num_irq_pins;
 
 	err = pinctrl_enable(pinctrl->ctrl);
 	if (err)
diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/airoha/pinctrl-an7563.c
index 40cbbe90cc46..f011c6c9ccce 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7563.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
@@ -1069,6 +1069,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index 2fcf88106e11..bfb777594811 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1441,6 +1441,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 2c3a75c35915..1cd0f442ddc1 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1471,6 +1471,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index 5aa39bacf460..b0c5e60f0aeb 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1113,6 +1113,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.num_grps = ARRAY_SIZE(pinctrl_groups),
 	.funcs = pinctrl_funcs,
 	.num_funcs = ARRAY_SIZE(pinctrl_funcs),
+	.num_irq_pins = AIROHA_NUM_PINS,
 	.confs_info = {
 		[AIROHA_PINCTRL_CONFS_PULLUP] = {
 			.confs = pinctrl_pullup_conf,
-- 
2.34.1


