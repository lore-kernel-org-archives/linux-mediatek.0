Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8716CCF649C
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 04:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUlZdNbsNhX6XY/barzAaC32mkUj4VQXnCI2Cvk8mw8=; b=YmBBRJTKzAemoRinTg1bt2CU08
	738wdaTcISbK1oYTsdE1XsZ92LucyY+sW0QYC2qzrLEpmGWagzzsNkhOcLigWiMxUs73XhW7jK0xn
	y4LJW/cz4OuI1iNpPE5dLByXqDAiaYghhJL+5OZK5EHt1SSe1wtY+nbqxs75MoeG9BzEhmheQf9BJ
	Lzd4xfNlKlFK0Ty/j5llg6FG+LeqlthXgGwxAq+BJAzqLGrlZklPpcvCwcf07RLb92EGBLJ43PBKP
	3aU0cM/JtpdLFATNowtPhBZ8tMzYW4TCiuaOTYItx7pGUsDcWnxaBmQau8XXa2tfVaaMUlvAlTGMw
	1rhQNR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8LI-0000000Fv6I-2LPY;
	Mon, 30 Sep 2024 04:49:04 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8Iy-0000000Fuik-44LJ
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Sep 2024 04:46:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-206aee40676so32180795ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Sep 2024 21:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727671600; x=1728276400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUlZdNbsNhX6XY/barzAaC32mkUj4VQXnCI2Cvk8mw8=;
        b=YmuWBSde9OpVzgnCbQgGRBMYvsyb1v3Srxn5S998bXgIIpkmhYhwOMC/6TQQb/ZwdE
         RdDMHr1Q4HSz1vtCIJ6s8zFmja6V0ADbKQ19nZ8pL7EuyUA/vuyn21vhadBwhYcTpU0Q
         lWX+mMq7gYi5aqI15vnb2M1S8zBcXwGTmsoiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727671600; x=1728276400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUlZdNbsNhX6XY/barzAaC32mkUj4VQXnCI2Cvk8mw8=;
        b=fQeglNKJQgrQb2/WAr7vCucjEseQYMUTDvWeiwCBbB9rJEb3HVg2vZ5TeUGNtvKH/J
         nBj1m56geIvAEhButQ9+PwoqUjlisR5+kSpssLc/BrnbyYOrSd9K9U4t4sJR5IaRjcIw
         87mqtdN7BMWvxRwKsDkBJQIJkznCI4uS9+m2hWwk6w20Onp37/ZDIs6b6gWKddQ9YJ/q
         FALJJiwArWw9pjXai7FWdk6MCYHzTY+QRZTqBRMlKbc8h9hgqr5sI8IF3zMmyxdFqXvU
         chXQTo2pl1UEL9QaPNAFCrUHRC9nVfkuvQeiOy4hE2Vopu45FNqPwzBdCoWRA4nQaTxV
         XbqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIgeY7uEGmu1HkzvML71grZsF4/ZRs/nFDultHxi4IwL3uNbu739JL74Vw0cun1hFCz7DJIh57+SE4UWmeXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaNEUHr8oBEZnEl8nNL7cx8gIcrC5V2eTTiS0oforeoWlhE4xA
	5tS8xpltWcYqwCrfoidwA9JT6CmwQdSeXTuk4oyBsyUf8NEFCQPnA5bmLPOZIw==
X-Google-Smtp-Source: AGHT+IGiPaUQ16Xnuae4NQju8BfwvozQQ66u5aiOHauwEzMnexKXZpeJLU+M8Oth2gtCms9fyjV8aQ==
X-Received: by 2002:a17:902:ea0e:b0:20b:8c13:5307 with SMTP id d9443c01a7336-20b8c1357fcmr27571105ad.33.1727671600403;
        Sun, 29 Sep 2024 21:46:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:659b:6caf:831b:3926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d65asm46236925ad.123.2024.09.29.21.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 21:46:40 -0700 (PDT)
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
Subject: [PATCH v9 2/3] regulator: Add devres version of of_regulator_get_optional()
Date: Mon, 30 Sep 2024 12:45:22 +0800
Message-ID: <20240930044525.2043884-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20240930044525.2043884-1-wenst@chromium.org>
References: <20240930044525.2043884-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_214641_071087_0C367520 
X-CRM114-Status: GOOD (  19.19  )
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

There are existing uses for a devres version of of_regulator_get_optional()
in power domain drivers. On MediaTek platforms, power domains may have
regulator supplies tied to them. The driver currently tries to use
devm_regulator_get() to not have to manage the lifecycle, but ends up
doing it in a very hacky way by replacing the device node of the power
domain controller device to the device node of the power domain that is
currently being registered, getting the supply, and reverting the device
node.

Provide a better API so that the hack can be replaced.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v8:
- Moved OF-specific devres version to of_regulator.c
- Made _of_regulator_get() static again
- Made devm_regulator_release non-static
- Reformated stub versions with `clang-format`

Changes since v7:
- New patch
---
 drivers/regulator/devres.c         |  2 +-
 drivers/regulator/internal.h       |  2 ++
 drivers/regulator/of_regulator.c   | 37 ++++++++++++++++++++++++++++++
 include/linux/regulator/consumer.h | 14 +++++++++++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 1b893cdd1aad..569a80963a86 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -14,7 +14,7 @@
 
 #include "internal.h"
 
-static void devm_regulator_release(struct device *dev, void *res)
+void devm_regulator_release(struct device *dev, void *res)
 {
 	regulator_put(*(struct regulator **)res);
 }
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index f62cacbbc729..b1b4277aaf90 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -131,4 +131,6 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
 int _regulator_bulk_get(struct device *dev, int num_consumers,
 			struct regulator_bulk_data *consumers, enum regulator_get_type get_type);
+
+void devm_regulator_release(struct device *dev, void *res);
 #endif
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 358c3ed791db..9096d8f494a7 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -704,6 +704,43 @@ struct regulator *of_regulator_get_optional(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(of_regulator_get_optional);
 
+static struct regulator *_devm_of_regulator_get(struct device *dev, struct device_node *node,
+						const char *id, int get_type)
+{
+	struct regulator **ptr, *regulator;
+
+	ptr = devres_alloc(devm_regulator_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	regulator = _of_regulator_get(dev, node, id, get_type);
+	if (!IS_ERR(regulator)) {
+		*ptr = regulator;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return regulator;
+}
+
+/**
+ * devm_of_regulator_get_optional - Resource managed of_regulator_get_optional()
+ * @dev: device used for dev_printk() messages and resource lifetime management
+ * @node: device node for regulator "consumer"
+ * @id:  supply name or regulator ID.
+ *
+ * Managed regulator_get_optional(). Regulators returned from this
+ * function are automatically regulator_put() on driver detach. See
+ * of_regulator_get_optional() for more information.
+ */
+struct regulator *devm_of_regulator_get_optional(struct device *dev, struct device_node *node,
+						 const char *id)
+{
+	return _devm_of_regulator_get(dev, node, id, OPTIONAL_GET);
+}
+EXPORT_SYMBOL_GPL(devm_of_regulator_get_optional);
+
 /*
  * Returns number of regulators coupled with rdev.
  */
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 37a5c4199563..582b82a104e2 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -171,12 +171,20 @@ void devm_regulator_put(struct regulator *regulator);
 #if IS_ENABLED(CONFIG_OF)
 struct regulator *__must_check of_regulator_get_optional(
 	struct device *dev, struct device_node *node, const char *id);
+struct regulator *__must_check devm_of_regulator_get_optional(
+	struct device *dev, struct device_node *node, const char *id);
 #else
 static inline struct regulator *__must_check of_regulator_get_optional(
 	struct device *dev, struct device_node *node, const char *id)
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct regulator *__must_check devm_of_regulator_get_optional(
+	struct device *dev, struct device_node *node, const char *id)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 int regulator_register_supply_alias(struct device *dev, const char *id,
@@ -367,6 +375,12 @@ static inline struct regulator *__must_check of_regulator_get_optional(
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct regulator *__must_check devm_of_regulator_get_optional(
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


