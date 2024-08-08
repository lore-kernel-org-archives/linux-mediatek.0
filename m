Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E703EC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wR1Udf/FWl7py4H5RQqWMXM0U9PswySd1hls6tNxB7g=; b=hGGGX1Gi38Yd2BnFYeswB3YiKr
	Ao+D9yW8LtVm6s/zV0/vmI3ScD2NPCgYYJlEQp/ANa77KjvT2faZPzQqZ9AB8L9HV63xZmjTwNKpj
	l/Awk6e1VkdxSzKRd3UQ7M5d1ySPPP3y4KMkWn1yf+tgnO6HIqFAcRFZvHLgbVqo4CqBn5vcSwlYu
	HtScNgm/3FCpCHWTyuNNLR/23ZDz6td2CW0zA8uvqVBmDtv5mbkSl15citEjEkeGBgoXvktkNbyNz
	9JVSiVSNU1fUNWxiYe/18yadeJbeQf+QbDcV6ebt1nO0n57l5ekvpWfV8LXSVI00Obyk2vSO+yP13
	O+gQ4t1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzx2-00000007oL6-2bh8;
	Thu, 08 Aug 2024 10:00:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbzvz-00000007o1Y-4927
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Aug 2024 09:59:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1fd90c2fc68so7480015ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Aug 2024 02:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111191; x=1723715991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wR1Udf/FWl7py4H5RQqWMXM0U9PswySd1hls6tNxB7g=;
        b=MphKt03gOtnaSH0XTncSAbxGxD38EQ6fIf9zV8tkNPb4hBmlsB/GiJAMBD31JHNdSD
         p9YOjc9VNmGqplOGw9oD2PNALdncmfIZvpKXZHe0UdUUMHk9VDjjoIhZSRznxIuYiYlI
         Ow9X3hkq4KwoBSjN8FT7NZe7YcK9magsuamfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111191; x=1723715991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wR1Udf/FWl7py4H5RQqWMXM0U9PswySd1hls6tNxB7g=;
        b=ciGCupch5KJtUoXyRl1Z+t7XrJ+hKoMphljbvLZv7HUdTQGaEaEl67TWgK9AQmTjaE
         RN7IGgZNMLYmxuGMciKVBpK2EDRVuTl7LLSoPsSLqTObcQkcbxIVmVCiJVOq9MvRX8li
         pL6IR8OxseukzWiKp2KclixoYn0IRHrayG5VGH+/MNn8uIF3Hm5UwN+1e5Kv1NwlrolP
         eAQLqMcqnBcfGnhBvCbXg6irPVWyQSgwfGh6daW1ZDV0SnFYEUu3Mb2+oXjul4yWJunB
         hlYp0t8eEuwugtJb29zvxKpHmRzoNGAHveybJUNryilNWNckV7++e8RudpNixbDXFsn7
         kSqA==
X-Forwarded-Encrypted: i=1; AJvYcCXhBXu16jhw5F36QXCd1y39LLsAwArZ8a6uR9RnCm8ieCugTLe2fs00q2CV1655XfLA5sy0ZrkoNb4Oa6nhzCrfq0yvpqPSqSqywuQ/ndyEFYJs
X-Gm-Message-State: AOJu0Yy3E7yHUi6qxYYvMV1c0woAWnjY8qY5kb5uC7ukn7qdrctFO3o5
	haGD6xHUbJlGxEJaEcVJFwg8VdTS5Di/ClRqkc+d2/16Ii8/Ewp+kNUGNIgeZQ==
X-Google-Smtp-Source: AGHT+IHWAl+hZjv9nSvJy1SKpxCjwWYJJknIPCWUxWfBsX+zsM0IhYTrybxxtL2FsiZEr+fCR0sgcA==
X-Received: by 2002:a17:903:40c5:b0:1fd:d55b:df26 with SMTP id d9443c01a7336-200952e9a8bmr13508545ad.61.1723111190903;
        Thu, 08 Aug 2024 02:59:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v4 2/6] regulator: Add regulator_of_get_optional() for pure DT regulator lookup
Date: Thu,  8 Aug 2024 17:59:25 +0800
Message-ID: <20240808095931.2649657-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_025952_055569_02C5CF50 
X-CRM114-Status: GOOD (  28.04  )
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

This adds a new regulator_of_get_optional() for this purpose. The
underlying code that support the existing regulator_get*() functions
are extended to support this specific case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- New patch
---
 drivers/regulator/core.c           | 81 ++++++++++++++++++++++--------
 drivers/regulator/devres.c         |  2 +-
 drivers/regulator/internal.h       |  2 +-
 include/linux/regulator/consumer.h |  8 +++
 4 files changed, 69 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 7674b7f2df14..ba4542d76642 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -456,30 +456,29 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
 
 /**
  * of_get_regulator - get a regulator device node based on supply name
- * @dev: Device pointer for the consumer (of regulator) device
+ * @node: Device node pointer for supply property lookup
  * @supply: regulator supply name
  *
  * Extract the regulator device node corresponding to the supply name.
  * returns the device node corresponding to the regulator if found, else
  * returns NULL.
  */
-static struct device_node *of_get_regulator(struct device *dev, const char *supply)
+static struct device_node *of_get_regulator(struct device_node *node, const char *supply)
 {
 	struct device_node *regnode = NULL;
 	char prop_name[64]; /* 64 is max size of property name */
 
-	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
+	pr_debug("%pOF: Looking up %s-supply from device tree\n", node, supply);
 
 	snprintf(prop_name, 64, "%s-supply", supply);
-	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
+	regnode = of_parse_phandle(node, prop_name, 0);
 
 	if (!regnode) {
-		regnode = of_get_child_regulator(dev->of_node, prop_name);
+		regnode = of_get_child_regulator(node, prop_name);
 		if (regnode)
 			return regnode;
 
-		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
-				prop_name, dev->of_node);
+		pr_debug("%pOF: Looking up %s property failed\n", node, prop_name);
 		return NULL;
 	}
 	return regnode;
@@ -1996,8 +1995,14 @@ static struct regulator_dev *regulator_lookup_by_name(const char *name)
 /**
  * regulator_dev_lookup - lookup a regulator device.
  * @dev: device for regulator "consumer".
+ * @node: device node for regulator supply lookup.
+ *        Falls back to dev->of_node if NULL.
  * @supply: Supply name or regulator ID.
  *
+ * If dev is NULL and node is not NULL, a pure device tree lookup is assumed.
+ * That is, it will not use supply aliases and end after DT based lookup is
+ * done.
+ *
  * If successful, returns a struct regulator_dev that corresponds to the name
  * @supply and with the embedded struct device refcount incremented by one.
  * The refcount must be dropped by calling put_device().
@@ -2006,21 +2011,30 @@ static struct regulator_dev *regulator_lookup_by_name(const char *name)
  * in the future.
  */
 static struct regulator_dev *regulator_dev_lookup(struct device *dev,
+						  struct device_node *node,
 						  const char *supply)
 {
 	struct regulator_dev *r = NULL;
-	struct device_node *node;
+	struct device_node *regulator_node;
 	struct regulator_map *map;
 	const char *devname = NULL;
+	bool pure_dt_lookup = false;
+
+	pure_dt_lookup = (node && !dev);
 
-	regulator_supply_alias(&dev, &supply);
+	/* Pure DT lookup should use given supply name directly */
+	if (!pure_dt_lookup)
+		regulator_supply_alias(&dev, &supply);
+
+	if (!node && dev && dev->of_node)
+		node = dev->of_node;
 
 	/* first do a dt based lookup */
-	if (dev && dev->of_node) {
-		node = of_get_regulator(dev, supply);
-		if (node) {
-			r = of_find_regulator_by_node(node);
-			of_node_put(node);
+	if (node) {
+		regulator_node = of_get_regulator(node, supply);
+		if (regulator_node) {
+			r = of_find_regulator_by_node(regulator_node);
+			of_node_put(regulator_node);
 			if (r)
 				return r;
 
@@ -2032,6 +2046,10 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 		}
 	}
 
+	/* Pure DT lookup stops here. */
+	if (pure_dt_lookup)
+		return ERR_PTR(-ENODEV);
+
 	/* if not found, try doing it non-dt way */
 	if (dev)
 		devname = dev_name(dev);
@@ -2076,7 +2094,7 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 	if (rdev->supply)
 		return 0;
 
-	r = regulator_dev_lookup(dev, rdev->supply_name);
+	r = regulator_dev_lookup(dev, NULL, rdev->supply_name);
 	if (IS_ERR(r)) {
 		ret = PTR_ERR(r);
 
@@ -2169,8 +2187,8 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 }
 
 /* Internal regulator request function */
-struct regulator *_regulator_get(struct device *dev, const char *id,
-				 enum regulator_get_type get_type)
+struct regulator *_regulator_get(struct device *dev, struct device_node *node,
+				 const char *id, enum regulator_get_type get_type)
 {
 	struct regulator_dev *rdev;
 	struct regulator *regulator;
@@ -2187,7 +2205,7 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 		return ERR_PTR(-EINVAL);
 	}
 
-	rdev = regulator_dev_lookup(dev, id);
+	rdev = regulator_dev_lookup(dev, node, id);
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 
@@ -2318,7 +2336,7 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
  */
 struct regulator *regulator_get(struct device *dev, const char *id)
 {
-	return _regulator_get(dev, id, NORMAL_GET);
+	return _regulator_get(dev, NULL, id, NORMAL_GET);
 }
 EXPORT_SYMBOL_GPL(regulator_get);
 
@@ -2345,7 +2363,7 @@ EXPORT_SYMBOL_GPL(regulator_get);
  */
 struct regulator *regulator_get_exclusive(struct device *dev, const char *id)
 {
-	return _regulator_get(dev, id, EXCLUSIVE_GET);
+	return _regulator_get(dev, NULL, id, EXCLUSIVE_GET);
 }
 EXPORT_SYMBOL_GPL(regulator_get_exclusive);
 
@@ -2371,10 +2389,29 @@ EXPORT_SYMBOL_GPL(regulator_get_exclusive);
  */
 struct regulator *regulator_get_optional(struct device *dev, const char *id)
 {
-	return _regulator_get(dev, id, OPTIONAL_GET);
+	return _regulator_get(dev, NULL, id, OPTIONAL_GET);
 }
 EXPORT_SYMBOL_GPL(regulator_get_optional);
 
+/**
+ * regulator_of_get_optional - get optional regulator via device tree lookup
+ * @node: device node for regulator "consumer"
+ * @id: Supply name
+ *
+ * Returns a struct regulator corresponding to the regulator producer,
+ * or IS_ERR() condition containing errno.
+ *
+ * This is intended for use by consumers that want to get a regulator
+ * supply directly from a device node, and can and want to deal with
+ * absence of such supplies. This will _not_ consider supply aliases.
+ * See regulator_dev_lookup().
+ */
+struct regulator *regulator_of_get_optional(struct device_node *node, const char *id)
+{
+	return _regulator_get(NULL, node, id, OPTIONAL_GET);
+}
+EXPORT_SYMBOL_GPL(regulator_of_get_optional);
+
 static void destroy_regulator(struct regulator *regulator)
 {
 	struct regulator_dev *rdev = regulator->rdev;
@@ -4928,7 +4965,7 @@ int _regulator_bulk_get(struct device *dev, int num_consumers,
 		consumers[i].consumer = NULL;
 
 	for (i = 0; i < num_consumers; i++) {
-		consumers[i].consumer = _regulator_get(dev,
+		consumers[i].consumer = _regulator_get(dev, NULL,
 						       consumers[i].supply, get_type);
 		if (IS_ERR(consumers[i].consumer)) {
 			ret = dev_err_probe(dev, PTR_ERR(consumers[i].consumer),
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 7111c46e9de1..7d9ea8232959 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -28,7 +28,7 @@ static struct regulator *_devm_regulator_get(struct device *dev, const char *id,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	regulator = _regulator_get(dev, id, get_type);
+	regulator = _regulator_get(dev, NULL, id, get_type);
 	if (!IS_ERR(regulator)) {
 		*ptr = regulator;
 		devres_add(dev, ptr);
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 77a502141089..51eb552cba01 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -120,7 +120,7 @@ enum regulator_get_type {
 	MAX_GET_TYPE
 };
 
-struct regulator *_regulator_get(struct device *dev, const char *id,
+struct regulator *_regulator_get(struct device *dev, struct device_node *node, const char *id,
 				 enum regulator_get_type get_type);
 int _regulator_bulk_get(struct device *dev, int num_consumers,
 			struct regulator_bulk_data *consumers, enum regulator_get_type get_type);
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index d986ec13092e..76826d0d99f1 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -168,6 +168,8 @@ int devm_regulator_get_enable_read_voltage(struct device *dev, const char *id);
 void regulator_put(struct regulator *regulator);
 void devm_regulator_put(struct regulator *regulator);
 
+struct regulator *__must_check regulator_of_get_optional(struct device_node *node, const char *id);
+
 int regulator_register_supply_alias(struct device *dev, const char *id,
 				    struct device *alias_dev,
 				    const char *alias_id);
@@ -358,6 +360,12 @@ static inline void devm_regulator_put(struct regulator *regulator)
 {
 }
 
+static inline struct regulator *__must_check
+regulator_of_get_optional(struct device_node *node, const char *id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void devm_regulator_bulk_put(struct regulator_bulk_data *consumers)
 {
 }
-- 
2.46.0.rc2.264.g509ed76dc8-goog


