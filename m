Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C729BC5320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDc0gYFzE7XGjhJ2AhN6DupFbhnHtplhsjKD3gx9Rh0=; b=bQhTcxs12TWLSwELsJzRpjXfwH
	rGPuO3Wby7xTDsbji0u+jJN6JQpQKwjB7wjYkfBM2TmmuyHPgGTH4mJMqEGfmfXV8f8MGQ9OTgvnS
	zbVmTL/jkvZW3sQy5NydaQ8s/Q4ZwwIHH+85/7RIA3OqBjnsUWedbbvBqXdU74aaHbcKTQwZGpABz
	MSXp2IWtIDCLqT9TQM6VSLu7jZ4JvRR6yylPixyiDDHYE62/8ZjeudLOjxhPwJZvOX+jjl2TwmeOs
	BZm3WOfaoUWPT0CV+yoVOIr8HAaefvzXHysAvRHhBLR1+GHcvg0PZkLM8cAQqV37A0oBz/xr2gt1C
	9RXVifmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh42S-0000000CD3n-1Wu4;
	Thu, 22 Aug 2024 09:23:28 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zg-0000000CCCK-0dVC
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:37 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7142448aaf9so403370b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318435; x=1724923235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDc0gYFzE7XGjhJ2AhN6DupFbhnHtplhsjKD3gx9Rh0=;
        b=TAgFQJlqgVPpkVCDSyjj45l5xSOrUjwCdiypbV8UFVwjj0VLLx3flglb66GmSKGChr
         GqngwKlQsLbmCDH3OQkRXsWlVK7W40bqx81tDyZR3rMk625nKdn1QXweGuXuH67aTnoG
         530R/IRsRL/KUegc8RzxuYwUJkicnOTRBd/eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318435; x=1724923235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDc0gYFzE7XGjhJ2AhN6DupFbhnHtplhsjKD3gx9Rh0=;
        b=q9EaRxG/Ypv/MLkujxTwzu25z2xapFpAduh68/WXiU+jTNF6BjZaQJSHxjieBV/nfr
         eKCaJyNYn1+tpMbPmF8+dPQlkQRpyV4G0C7il77mlua2rp8ckhVUSBYrPFICjO2v73Kc
         lBb1IMlDM5Ggpkcdp2gSi2f2iWwGjYr3+m4MAnLMJynrfw3tdNQmOxdwkeZ2ckRtRWuM
         R1NinKzw4oQrYmeAChACsgQVmmcYH6KOHiH3Labe5ExMYD0ZBMLo3bgCDKT5Nvo1Qx93
         XAI84ni7puBBLr+0OHmJn1DLAtdsyzJjv4e/5LpbNy7AVYYdCDde0W5aY52dCQpSjLBn
         PRLA==
X-Forwarded-Encrypted: i=1; AJvYcCVjDT4u5xvqLsgaYeoAYXzh+wvsOuAoTeX0yXxG/QKFCfhrvzgBXi0DoUOUeyPYGhtX/rbDOlSwTFZ28WOZqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkvw1WCMUX7K0kR1DYgFSIApc/zBuAaMP8o9wsTLqutZ8Dpxlp
	8FJDuSKodkzPIZUrCIax7bjdqCE0JoktTLC2ahjp0XEpmwZj2jE+WZcMDtx6/A==
X-Google-Smtp-Source: AGHT+IGFjvk3XcfXwOVUDAxxMj2xSqe1AU1grF2L8qM1UCDTpX9001BmMqg32GNyYPTfbXCI1q3+QQ==
X-Received: by 2002:a05:6a21:8804:b0:1c0:ef24:4124 with SMTP id adf61e73a8af0-1cae51ad139mr3146210637.6.1724318435415;
        Thu, 22 Aug 2024 02:20:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:35 -0700 (PDT)
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
Subject: [PATCH v5 04/10] regulator: Do pure DT regulator lookup in of_regulator_bulk_get_all()
Date: Thu, 22 Aug 2024 17:19:57 +0800
Message-ID: <20240822092006.3134096-5-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022036_218814_E6CB50FB 
X-CRM114-Status: GOOD (  26.29  )
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

Convert the existing of_regulator_bulk_get_all() for this purpose.
This function has no in-tree users, as the original patch [1] that
used it was never landed. This patch changes the function ABI, but
it is straightforward to convert users.

The underlying code that supports the existing regulator_get*()
functions has been reworked in previous patches to support this
specific case. An internal OF-specific version of regulator_get(),
of_regulator_get_optional(), is added for this.

[1] https://lore.kernel.org/all/20231220203537.83479-2-jernej.skrabec@gmail.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Was "regulator: Add regulator_of_get_optional() for pure DT" in v4
- Restore platform-agnostic regulator consumer code to original state
- Move OF-specific regulator code to of_regulator.c (separate patch)
- Split _regulator_get() into three parts for reuse (separate patch)
- Add OF-specific _of_regulator_get() function
- Rename regulator_of_get_optional() to of_regulator_get_optional() for
  consistency
- Make of_regulator_get_optional() static, as it is only used internally
- Convert of_regulator_bulk_get_all()
Changes since v3:
- New patch
---
 drivers/regulator/core.c         |  2 +-
 drivers/regulator/internal.h     |  2 ++
 drivers/regulator/of_regulator.c | 54 +++++++++++++++++++++++++++-----
 3 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 4d1c640cc030..d70302e30731 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1950,7 +1950,7 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 
 	/* first do a dt based lookup */
 	if (dev && dev->of_node) {
-		r = of_regulator_dev_lookup(dev, supply);
+		r = of_regulator_dev_lookup(dev, dev->of_node, supply);
 		if (!IS_ERR(r))
 			return r;
 		if (PTR_ERR(r) == -EPROBE_DEFER)
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 3718459fb0c5..44680ce3587b 100644
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
 	return -ENODEV;
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index d924f5c1de59..67a5882a917e 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -587,22 +587,24 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
 
 /**
  * of_get_regulator - get a regulator device node based on supply name
- * @dev: Device pointer for the consumer (of regulator) device
+ * @dev: Device pointer for dev_printk messages
+ * @node: Device node pointer for supply property lookup
  * @supply: regulator supply name
  *
  * Extract the regulator device node corresponding to the supply name.
  * returns the device node corresponding to the regulator if found, else
  * returns NULL.
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
 
 	if (!regnode) {
 		regnode = of_get_child_regulator(dev->of_node, prop_name);
@@ -626,7 +628,8 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 }
 
 /** of_regulator_dev_lookup - lookup a regulator device with device tree only
- * @dev: Device pointer for regulator supply lookup.
+ * @dev: Device pointer for dev_printk messages.
+ * @node: Device node pointer for regulator supply lookup.
  * @supply: Supply name or regulator ID.
  *
  * If successful, returns a struct regulator_dev that corresponds to the name
@@ -636,13 +639,13 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
  * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
  * in the future.
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
@@ -659,6 +662,41 @@ struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
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
+ * @dev: device used for dev_printk messages
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
+static struct regulator *of_regulator_get_optional(struct device *dev,
+						   struct device_node *node,
+						   const char *id)
+{
+	return _of_regulator_get(NULL, node, id, OPTIONAL_GET);
+}
+
 /*
  * Returns number of regulators coupled with rdev.
  */
@@ -875,7 +913,7 @@ int of_regulator_bulk_get_all(struct device *dev, struct device_node *np,
 		} else {
 			memcpy(name, prop->name, i);
 			name[i] = '\0';
-			tmp = regulator_get(dev, name);
+			tmp = of_regulator_get_optional(dev, np, name);
 			if (IS_ERR(tmp)) {
 				ret = PTR_ERR(tmp);
 				goto error;
-- 
2.46.0.184.g6999bdac58-goog


