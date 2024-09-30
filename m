Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264F4CF6491
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 04:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGyzeNaZ5V1M7D29TbD7ZSDpWWRPNFu98Dae5UWiJuc=; b=cC9QrVBMZnw+BASIEZuhoT+FTR
	HN0SmdpQ4J3TW7+D06wtLaxuPT/oxaXj9kWasKYTqywdEvAtEnA52O2HduoCDf8Nnp9wAXBVYR2cO
	XQw1N+ny86wvezeBeG0j9lZWKhm4SZAFqMF06zQ+i+N2AGZ+9qzYcjjoGgc8rswI2CnzZqjkrvZiX
	OgBjb8GxMi34rHnz4uQS1ArBJnfEiC4tsnNVkxXmSaVpGpLCRavHaIqyQ3DkYCh05l38HKk6JYL0+
	NAED8IK8Znn8Dx9b1CBXmdhI6fGAbuiDGmYQ8iJByXez5BRbJrVsaKO6khefjagRLCt/UykjYJon2
	cOW/i8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8LI-0000000Fv63-0xIk;
	Mon, 30 Sep 2024 04:49:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8Iw-0000000Fuhj-1BVD
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Sep 2024 04:46:40 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20b833f9b35so4324125ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Sep 2024 21:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727671597; x=1728276397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGyzeNaZ5V1M7D29TbD7ZSDpWWRPNFu98Dae5UWiJuc=;
        b=HAxBSuRkLNqALhzOcjq2hCrUssovdRW9KPP5yZqzV4Lse5B9hcAH3LeOwU7R78FXTf
         wzy0ROKESqM3I5LhOWl29MTDIVcBDd8bUMpoFSuSFzzA5KJeDXxDHEhh+1xN/CnUIb9o
         DHKWi5/UUAzWd06h+/HX+PrGS1es8gyCFeWqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727671597; x=1728276397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGyzeNaZ5V1M7D29TbD7ZSDpWWRPNFu98Dae5UWiJuc=;
        b=DtJZ50qzYuhnLjgQ+nO/FR3N3sZenUu6aGNdSlcc7XTv8vZXB+lNl7fUwkAA/WGobi
         pqWRqSuL+StpXAKGx1ld8z2LtpS2Sv8/3R11hK7ijfed9Aydb08lt+ucoTIjtAYZcEQd
         W7FgNOcXMhPt8ug8sPw9zD9gooSCT8wVd+l7aj7dFJydNhn/de9PJD2ByphUI5ayk7q4
         qzirQ7+YHUWMqUU5Q4FvasqcdxNx0DS8VTzYSqtndCrWK8++CVb636rRIsA1byXzPgMf
         rHRgSgTk+EuRkJT55tH9UUrGchUtQQcNtM3nXBtNYdEjQJvnCvIC85sPSFlBqBuPxEs/
         /kPg==
X-Forwarded-Encrypted: i=1; AJvYcCUCEYzWE4kROVK/aBlvqzgoZflaK7ICmBQLySl3p8+rsfHrkhuE9u3CISKN9KxSMqbWZki+T9rQqaB2PugTuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjnQ4yUasmpJwx2XrmfnT8Wl691NjSaVs5NHZL8zYk4TFSTDwZ
	SgwOFgrFgHCgCseH4kEnjm76r00IExvKbjtLbUiWVH6SijOTYmkxXNtZCUDU/Q==
X-Google-Smtp-Source: AGHT+IFnMQTAEREEEWPYxSTTjCTMZ6EMTOWbZJ5tAa90pajm8FslwDubIQOj+gAHEiUnOmMNv6gA2Q==
X-Received: by 2002:a17:902:d549:b0:20b:54e5:e822 with SMTP id d9443c01a7336-20b54e5ea9amr97833325ad.21.1727671597400;
        Sun, 29 Sep 2024 21:46:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:659b:6caf:831b:3926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d65asm46236925ad.123.2024.09.29.21.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 21:46:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v9 1/3] regulator: Add of_regulator_get_optional() for pure DT regulator lookup
Date: Mon, 30 Sep 2024 12:45:21 +0800
Message-ID: <20240930044525.2043884-2-wenst@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20240930044525.2043884-1-wenst@chromium.org>
References: <20240930044525.2043884-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_214638_354456_F92F41A1 
X-CRM114-Status: GOOD (  27.57  )
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

The to-be-introduced I2C component prober needs to enable regulator
supplies (and toggle GPIO pins) for the various components it intends
to probe. To support this, a new "pure DT lookup" method for getting
regulator supplies is needed, since the device normally requesting
the supply won't get created until after the component is probed to
be available.

Add a new of_regulator_get_optional() function for this. This mirrors
the existing regulator_get_optional() function, but is OF-specific.
The underlying code that supports the existing regulator_get*()
functions has been reworked in previous patches to support this
specific case.

Also convert an existing usage of "dev && dev->of_node" to
"dev_of_node(dev)".

Link: https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/ [1]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes since v8:
- Reformat stub versions with `clang-format`

Changes since v7:
- Added stub version for !CONFIG_OF and !CONFIG_REGULATOR

Changes since v6:
- Changed reference [1] to Link: tag
- Rebased on top of commit 401d078eaf2e ("regulator: of: Refactor
  of_get_*regulator() to decrease indentation")
- Exported of_regulator_get_optional()
- Changed commit message to focus on "of_regulator_get_optional()"
- Dropped change to of_regulator_bulk_get_all()

Changes since v5:
- Used "dev_of_node(dev)" instead of "dev->of_node"
- Replaced "dev_printk" with "dev_printk()" in kerneldoc mentions
- Fixed kerneldoc "Return" section format for of_regulator_get_optional()
- Fix @np parameter name in of_regulator_dev_lookup() kerneldoc

Changes since v4:
- Restore platform-agnostic regulator consumer code to original state
- Move OF-specific regulator code to of_regulator.c (separate patch)
- Split _regulator_get() into three parts for reuse (separate patch)
- Add OF-specific _of_regulator_get() function
- Rename regulator_of_get_optional() to of_regulator_get_optional() for
  consistency
- Make of_regulator_get_optional static, as it is only used internally
- Convert of_regulator_bulk_get_all()

Changes since v3:
- New patch

# This is the commit message #2:

# fixup! regulator: Add of_regulator_get_optional() for pure DT regulator lookup
---
 drivers/regulator/core.c           |  4 +--
 drivers/regulator/internal.h       |  2 ++
 drivers/regulator/of_regulator.c   | 51 ++++++++++++++++++++++++++----
 include/linux/regulator/consumer.h | 17 ++++++++++
 4 files changed, 66 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 1179766811f5..d0b3879f2746 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1959,8 +1959,8 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 	regulator_supply_alias(&dev, &supply);
 
 	/* first do a dt based lookup */
-	if (dev && dev->of_node) {
-		r = of_regulator_dev_lookup(dev, supply);
+	if (dev_of_node(dev)) {
+		r = of_regulator_dev_lookup(dev, dev_of_node(dev), supply);
 		if (!IS_ERR(r))
 			return r;
 		if (PTR_ERR(r) == -EPROBE_DEFER)
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 5b43f802468d..f62cacbbc729 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -67,6 +67,7 @@ static inline struct regulator_dev *dev_to_rdev(struct device *dev)
 
 #ifdef CONFIG_OF
 struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+					      struct device_node *np,
 					      const char *supply);
 struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 			         const struct regulator_desc *desc,
@@ -82,6 +83,7 @@ bool of_check_coupling_data(struct regulator_dev *rdev);
 
 #else
 static inline struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+							    struct device_node *np,
 							    const char *supply)
 {
 	return ERR_PTR(-ENODEV);
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 3f490d81abc2..358c3ed791db 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -588,7 +588,8 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
 
 /**
  * of_get_regulator - get a regulator device node based on supply name
- * @dev: Device pointer for the consumer (of regulator) device
+ * @dev: Device pointer for dev_printk() messages
+ * @node: Device node pointer for supply property lookup
  * @supply: regulator supply name
  *
  * Extract the regulator device node corresponding to the supply name.
@@ -596,15 +597,16 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
  * Return: Pointer to the &struct device_node corresponding to the regulator
  *	   if found, or %NULL if not found.
  */
-static struct device_node *of_get_regulator(struct device *dev, const char *supply)
+static struct device_node *of_get_regulator(struct device *dev, struct device_node *node,
+					    const char *supply)
 {
 	struct device_node *regnode = NULL;
 	char prop_name[64]; /* 64 is max size of property name */
 
-	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
+	dev_dbg(dev, "Looking up %s-supply from device node %pOF\n", supply, node);
 
 	snprintf(prop_name, 64, "%s-supply", supply);
-	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
+	regnode = of_parse_phandle(node, prop_name, 0);
 	if (regnode)
 		return regnode;
 
@@ -628,6 +630,7 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 /**
  * of_regulator_dev_lookup - lookup a regulator device with device tree only
  * @dev: Device pointer for regulator supply lookup.
+ * @np: Device node pointer for regulator supply lookup.
  * @supply: Supply name or regulator ID.
  *
  * Return: Pointer to the &struct regulator_dev on success, or ERR_PTR()
@@ -642,13 +645,13 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
  * * -%ENODEV if lookup fails permanently.
  * * -%EPROBE_DEFER if lookup could succeed in the future.
  */
-struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+struct regulator_dev *of_regulator_dev_lookup(struct device *dev, struct device_node *np,
 					      const char *supply)
 {
 	struct regulator_dev *r;
 	struct device_node *node;
 
-	node = of_get_regulator(dev, supply);
+	node = of_get_regulator(dev, np, supply);
 	if (node) {
 		r = of_find_regulator_by_node(node);
 		of_node_put(node);
@@ -665,6 +668,42 @@ struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static struct regulator *_of_regulator_get(struct device *dev, struct device_node *node,
+					   const char *id, enum regulator_get_type get_type)
+{
+	struct regulator_dev *r;
+	int ret;
+
+	ret = _regulator_get_common_check(dev, id, get_type);
+	if (ret)
+		return ERR_PTR(ret);
+
+	r = of_regulator_dev_lookup(dev, node, id);
+	return _regulator_get_common(r, dev, id, get_type);
+}
+
+/**
+ * of_regulator_get_optional - get optional regulator via device tree lookup
+ * @dev: device used for dev_printk() messages
+ * @node: device node for regulator "consumer"
+ * @id: Supply name
+ *
+ * Return: pointer to struct regulator corresponding to the regulator producer,
+ *	   or PTR_ERR() encoded error number.
+ *
+ * This is intended for use by consumers that want to get a regulator
+ * supply directly from a device node, and can and want to deal with
+ * absence of such supplies. This will _not_ consider supply aliases.
+ * See regulator_dev_lookup().
+ */
+struct regulator *of_regulator_get_optional(struct device *dev,
+					    struct device_node *node,
+					    const char *id)
+{
+	return _of_regulator_get(dev, node, id, OPTIONAL_GET);
+}
+EXPORT_SYMBOL_GPL(of_regulator_get_optional);
+
 /*
  * Returns number of regulators coupled with rdev.
  */
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index b9ce521910a0..37a5c4199563 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -168,6 +168,17 @@ int devm_regulator_get_enable_read_voltage(struct device *dev, const char *id);
 void regulator_put(struct regulator *regulator);
 void devm_regulator_put(struct regulator *regulator);
 
+#if IS_ENABLED(CONFIG_OF)
+struct regulator *__must_check of_regulator_get_optional(
+	struct device *dev, struct device_node *node, const char *id);
+#else
+static inline struct regulator *__must_check of_regulator_get_optional(
+	struct device *dev, struct device_node *node, const char *id)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif
+
 int regulator_register_supply_alias(struct device *dev, const char *id,
 				    struct device *alias_dev,
 				    const char *alias_id);
@@ -350,6 +361,12 @@ devm_regulator_get_optional(struct device *dev, const char *id)
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct regulator *__must_check of_regulator_get_optional(
+	struct device *dev, struct device_node *node, const char *id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void regulator_put(struct regulator *regulator)
 {
 }
-- 
2.46.1.824.gd892dcdcdd-goog


