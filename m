Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069BF606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 19:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q1nnjTgc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XM7lu1XqMOu9UjW76lpU6uhCbTkPgDoglZYH7fExAqs=; b=q1nnjTgcD8d+mV
	ytf85wcUamtFIVOtFf7W7KT/Llut9RrtXjVrejAu2vz93r9qIdCtq+b8C/+TgM9gakdx2xyUmGyts
	bS8AHvHxdQnyt9BLZXKcCJ8jelg4jy5WSypwDXLhbaQwxDiDiNRehGw7uaQRBaREe7+EhcofN58ys
	5KRA5QGN8JqCUYOsBZhM72Xg1Vj+zoQD5Y06+U2WDglsInI+sZpEqD5eai6hwXE+Q9Hx098HNQBe6
	9YFNgTxbHjovF3JOTU33W72XZmFBa0FQG36pgOpTSv1cuZby2rD2mzgXLe1bm5N85kv8lyjo3Bkbo
	fLe7TLAPpwA59Qcw35cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1f-0000000AuNr-1Sdo;
	Thu, 12 Nov 2026 18:59:59 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1b-0000000AuK9-07Oc
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 18:59:57 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRa1U-002Xgt-15;
	Thu, 12 Nov 2026 19:59:48 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v2 1/7] pinctrl: airoha: make gpio register layout per SoC
Date: Thu, 12 Nov 2026 19:59:35 +0100
Message-Id: <20261112185941.1316112-2-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185941.1316112-1-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105955_432954_171BC654 
X-CRM114-Status: GOOD (  14.04  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GPIO register layout is fixed to 64 pins in two 32 pin banks and
four 16 pin direction banks. Every SoC uses the single static
airoha_gpiochip_regs and the compile time AIROHA_NUM_PINS.

Move the layout into the match data. The gpiochip register table
carries its own pin count, and the five existing SoCs point at the
shared 64 pin table.

No functional change for the existing SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/pinctrl/airoha/airoha-common.h  |  6 +++++-
 drivers/pinctrl/airoha/pinctrl-airoha.c | 14 ++++++++------
 drivers/pinctrl/airoha/pinctrl-an7563.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c |  1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c |  1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c |  1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c |  1 +
 7 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 16f7abcdfb83..850e733db15a 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -89,6 +89,7 @@ struct airoha_pinctrl_conf {
 };
 
 struct airoha_gpiochip_regs {
+	unsigned int ngpio;
 	/* gpio */
 	const u32 *data;
 	const u32 *dir;
@@ -99,6 +100,8 @@ struct airoha_gpiochip_regs {
 	const u32 *edge;
 };
 
+extern const struct airoha_gpiochip_regs airoha_gpiochip_regs_64;
+
 struct airoha_pinctrl_confs_info {
 	const struct airoha_pinctrl_conf *confs;
 	unsigned int num_confs;
@@ -126,7 +129,7 @@ struct airoha_pinctrl {
 	struct regmap *regmap;
 
 	struct gpio_chip gpiochip;
-	struct airoha_gpiochip_regs *gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs;
 	unsigned int num_irq_pins;
 };
 
@@ -134,6 +137,7 @@ struct airoha_pinctrl_match_data {
 	const char *chip_scu_compatible;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
+	const struct airoha_gpiochip_regs *gpio_regs;
 	const struct pinctrl_pin_desc *pins;
 	const unsigned int num_pins;
 	const struct pingroup *grps;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 52a768c859b7..b50108826d8d 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -94,7 +94,8 @@ static const u32 irq_edge_regs[] = {
 	REG_GPIO_INT_EDGE3
 };
 
-static struct airoha_gpiochip_regs airoha_gpiochip_regs = {
+const struct airoha_gpiochip_regs airoha_gpiochip_regs_64 = {
+	.ngpio = AIROHA_NUM_PINS,
 	.data = gpio_data_regs,
 	.dir = gpio_dir_regs,
 	.out = gpio_out_regs,
@@ -102,6 +103,7 @@ static struct airoha_gpiochip_regs airoha_gpiochip_regs = {
 	.level = irq_level_regs,
 	.edge = irq_edge_regs,
 };
+EXPORT_SYMBOL_GPL(airoha_gpiochip_regs_64);
 
 static int airoha_convert_pin_to_reg_offset(struct pinctrl_dev *pctrl_dev,
 					    struct pinctrl_gpio_range *range,
@@ -207,7 +209,7 @@ static void airoha_irq_unmask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -244,7 +246,7 @@ static void airoha_irq_mask(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u8 index = data->hwirq / AIROHA_REG_GPIOCTRL_NUM_PIN;
 	u32 mask = GENMASK(2 * offset + 1, 2 * offset);
@@ -261,7 +263,7 @@ static void airoha_irq_ack(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(gc);
-	struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
+	const struct airoha_gpiochip_regs *gpio_regs = pinctrl->gpio_regs;
 	u8 offset = data->hwirq % AIROHA_PIN_BANK_SIZE;
 	u8 index = data->hwirq / AIROHA_PIN_BANK_SIZE;
 
@@ -379,7 +381,7 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 	gc->set = airoha_gpio_set;
 	gc->get = airoha_gpio_get;
 	gc->base = -1;
-	gc->ngpio = AIROHA_NUM_PINS;
+	gc->ngpio = pinctrl->gpio_regs->ngpio;
 
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
@@ -831,7 +833,7 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	pinctrl->desc.pins = data->pins;
 	pinctrl->desc.npins = data->num_pins;
 
-	pinctrl->gpio_regs = &airoha_gpiochip_regs;
+	pinctrl->gpio_regs = data->gpio_regs;
 
 	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
diff --git a/drivers/pinctrl/airoha/pinctrl-an7563.c b/drivers/pinctrl/airoha/pinctrl-an7563.c
index f011c6c9ccce..6a2a307807e3 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7563.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7563.c
@@ -1063,6 +1063,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index bfb777594811..6bec1d44b8a0 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -1435,6 +1435,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 1cd0f442ddc1..2689bbd9ebba 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -1465,6 +1465,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7581-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7523.c b/drivers/pinctrl/airoha/pinctrl-en7523.c
index b0c5e60f0aeb..1589acef683f 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7523.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7523.c
@@ -1107,6 +1107,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "airoha,en7523-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
diff --git a/drivers/pinctrl/airoha/pinctrl-en7528.c b/drivers/pinctrl/airoha/pinctrl-en7528.c
index f6c8f834421f..9854e9530219 100644
--- a/drivers/pinctrl/airoha/pinctrl-en7528.c
+++ b/drivers/pinctrl/airoha/pinctrl-en7528.c
@@ -1155,6 +1155,7 @@ static const struct airoha_pinctrl_match_data pinctrl_match_data = {
 	.chip_scu_compatible = "econet,en7528-chip-scu",
 	.pinctrl_name = KBUILD_MODNAME,
 	.pinctrl_owner = THIS_MODULE,
+	.gpio_regs = &airoha_gpiochip_regs_64,
 	.pins = pinctrl_pins,
 	.num_pins = ARRAY_SIZE(pinctrl_pins),
 	.grps = pinctrl_groups,
-- 
2.34.1


