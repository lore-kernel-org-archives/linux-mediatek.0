Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E99C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfWlRrbNj4Bcq24IXL0yWkLlYoRbm2P5BkwSEgw03dg=; b=1lDf0+OdUbUXCd1XnsWAXUJt/F
	KSh/dItG+1LMaiBOR9WP7bYZ/063EDVEqDCIL46mO5tlI0OxMF86kTUoEh6lrLBU46RNKDllWffqM
	glV0h6/2wYaVnv6cIQ1Vhn40fFGQkJDvidC0J3lvBGe8FgAoWWtG8o62KN5+fnZVe2YQgok98Jqs7
	iU7iLc6WPV0EFgsJsazUe3OAyB9/ZLm/Z6Ok1AFg1A1kKpVRz9isgneK7hJWdcE/SukCauFBd0oJQ
	xeRk5R5jN0AANeDeiJ5WuLYyIwcdAin0r2zdofviKHBED30JLFHytRE3E3/wRXt0Ppn75uWN4ItKW
	MmfW3DeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsyX2-0000000A52H-3SSS;
	Sun, 09 Aug 2026 08:05:20 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsyX0-0000000A51j-34Fp
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 08:05:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-39266382df6so904989a91.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786262717; x=1786867517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VfWlRrbNj4Bcq24IXL0yWkLlYoRbm2P5BkwSEgw03dg=;
        b=Qtr7lrYHFLewDyyboWnBlfWkkp4f0rTNMOW3YEbmbqencKuL70tsEkWJBBRPc6dwds
         +hWi08U2gqcu7Qi8xfZAXRY5/TnzjyLJUat0ZGVgNGYIZFOz+ADbM5O/QPQxLpJ+dJWM
         i91dWhWlLx6T/p/S4NhuQwQqaMsXBBcR9XE50PiI3dkw7Nj0hWMWqOtEQFGizmKJMcXp
         fUuMitJiOCzt66sTPsVQ/7/S1JlAnrXzY6HEmmC8xB6uJK1uMaSPTqczMqZVJAWgJJkV
         zzqtv23fiT9it7XlDVgsv5QH22uAvx0ndd7qtXDUNGbNmRNqCAgW9EtTi0gOdttIWfr9
         oqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786262717; x=1786867517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VfWlRrbNj4Bcq24IXL0yWkLlYoRbm2P5BkwSEgw03dg=;
        b=pucGohLxyFoSA116PDcwJMJpCjuWlQIePWVF/mjsIytsI66e84wHIrGvAbIrjZtku3
         v8cXLbnQwJLriBcOLZjtpAEOgJoI0S0LoTImESv9LmSqMoN7rzzLRBJ0SR7gSt7u80qn
         Mnqz1uDS1L07/A5ntaTG2R2+v5t0c3aCJF4/Ja0eKk+uBUz4bXIvcyoYjLjPwjxK9Ibx
         nIPJgSD8/gmQ/mFadmajJIWD18YsPgkALNmBlbkJ1aiF82IMjF8B9vSxst/Jo9ZK4/5O
         NvpoJwOXn4LEfy+EUFWc5a74a5WJt5wPaFUayO5HUZxw06OyfMjrnnwN1al9/YDURmSL
         rALA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq1sb7A8YxO/IPNiU0tX9fboLX1tscrQ105XQuvagfjvFgdWuUs5GZ5k7E/ZgDjWeZ0TJXf61sC+F69aTZkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZWdcrEXKYdqPBFQIzeRz3OzMwAT4dobe6uloe4qsRNk9nn/Yd
	dksZ6wT4kOSVr+ps8gyuEUpU9pf/GiMyu8SYlCKODl4c0vypI5GE9GU/n886XwV8
X-Gm-Gg: AR+sD10DZfrYa9by5SdyBXUmP++VY8TNVw+bI/0zpW+djVS7V4a7wQyc+PSgvtek92w
	kyRP1H31g2NG3GR40RHrMwYMBq34IMDWf/iESbd8YOp9tRTb8lugq2WG//Y9g1XEFTa9kzSMwnh
	W0Y+MD4baMrKnm5OO9ea+39NxtGmMvp+NpoLRP2konEHW1km9/yWnd7gaIPsjzCFcs8QX5/asol
	r3n65KbZlNMFJRKyNoQNs+cm2P0njZ0oPHRyxiDN2bS/OM51ft3l5CoIuxospuPpNiLNIwzagMM
	D+Ag8IJUXSrl/KX4u2sQvPhV/Q/8QuCH0S9TdXyUPK6eVaYsK1fgvUwV9qOyIGTyinUi2E+8Xx2
	emkmaS75kGLOTxkR4rduJxiKrUdM5+J9MT0XHrDow61voOAtFx+YcZ6li2k/MdmcR4r2tyYVFNv
	BUESXia3kEe3FFzOeZ8Mw1G35HjsaZ8LtuX8+2A2wI2brSxyEpNOkegllfJtNrUZOwJdIV
X-Received: by 2002:a17:90b:56ce:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-3903c5faa8amr36761114a91.17.1786262717450;
        Sun, 09 Aug 2026 01:05:17 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm23315598c88.14.2026.08.09.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:05:16 -0700 (PDT)
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
Subject: [PATCH 1/3] pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
Date: Sun,  9 Aug 2026 12:04:58 +0400
Message-Id: <5a7f97adbca73f2bd01393ce0ca840c2a6f43f76.1786262697.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1786262697.git.naseefkm@gmail.com>
References: <cover.1786262697.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_010518_805811_CE94F171 
X-CRM114-Status: GOOD (  23.12  )
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


