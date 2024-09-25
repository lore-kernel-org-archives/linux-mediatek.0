Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EAFC369B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 09:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7bXktUyxRWkmvmoDnOf/TDCOPJhfZ68iG0bFgcdjWoY=; b=oPF8yhAyqkk+zTpviv6AuP1cYm
	wydCGvZhnjvcdk6+ckdh1qlINojpOJ60LlwW12AxG0Ht40ex3bAeNWRwwArWpn4e+uwNe2UOfZc6E
	mtdfZgsAxFPA1yFfECkzeSjCCPT+qZBXHSrDkinfVxRQVtNz5pOyynpXGv7gv4D1BH97IsiY2nWN+
	rmWW+48e9RF7zNUgkHLLijAvHS4otvVcjvfBU1KGD/018TR068eYFODWdd7tmOrl7/WV33v98QuH/
	qNVj0Pt1ogzI3Nc08d3vFRMsOB/3Pmh4sdSTgukuzSjGH7OuNkJXSfWtzpmpniRiQ8aRERXcz7wbB
	f1SXa5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOVv-00000004duT-11BV;
	Wed, 25 Sep 2024 09:40:51 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stOTU-00000004dLv-3iXc
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 09:38:22 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso4731480a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727257100; x=1727861900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bXktUyxRWkmvmoDnOf/TDCOPJhfZ68iG0bFgcdjWoY=;
        b=CeGz+OZpUcsTdeoB2jBMDUUuUbwt1AynFSGfupHAUyw7y0+ubQswGzzRa5uUhmVZT1
         eBwETTlc89uIgELNZwLng/tae6G/Fv4kBfSd1jTK5x/BtuoYw+XEM2lXgVhOUZKGJkWA
         m8YNQefGj0Ar8enjCH5k/tN0fm5XIMtU9mZag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257100; x=1727861900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bXktUyxRWkmvmoDnOf/TDCOPJhfZ68iG0bFgcdjWoY=;
        b=QLISzmSIB2Hg8AiMh0dOWtRe+P36uGPgLzC8u7micurm71b6e52lz38HesZCco7xJb
         sp4+sFMGFygRrJIug82yNNb21rcO/5Pez6gMW5zsDVnhxZTA5RGTprZAtBd1AforJvJ8
         1YRqecuFpIPIcdvuV1cjvouNC+dcIgL9T52p9fNdPom39CIoX+vjgSxhy7+pYZ1DpHQ/
         Q78DdWGsmWn2qLPITw6SYAc/N/PZaAdMDBY+YXvDHtIBhXyegJ0Cl7u2UgTjOMeOR+YE
         Rzg1UaGOAFN3Y5newXP55Y2JOmFlPD2GbGQRmGlLOQCkKS5m+48bROudanA0d2eCrgHR
         R8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5S/+Wq7AUu+XL5XFExowUt8u4UZHsSE1gtZE+9XnSU+MqcbdntyvjwH/A8IUVwQVoE8TQPbjtEyP/mlPOzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy76I4sNOV/7t/8OCsebjwawleWW/yqS15x11GfKkmnO2XO3TBV
	MW4skMc08x/L4PU5yQYgWnplUMhpwrqOUO/ieM+USRg9O07Xa3L9mfvue+M9YQ==
X-Google-Smtp-Source: AGHT+IHiIptcOj4pohjGvFSBEsElP+b23Io+sJLV0MHs1RLHjwz1o2ogGe1jcYOVaKnKSawT4ThJ6Q==
X-Received: by 2002:a05:6a21:3305:b0:1cf:31b6:18c6 with SMTP id adf61e73a8af0-1d4e0beb994mr2832996637.46.1727257099967;
        Wed, 25 Sep 2024 02:38:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2480:2c96:2b64:cdcb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc8347fesm2432789b3a.35.2024.09.25.02.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:38:19 -0700 (PDT)
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
Subject: [PATCH v8 2/3] regulator: Add devres version of of_regulator_get_optional()
Date: Wed, 25 Sep 2024 17:38:05 +0800
Message-ID: <20240925093807.1026949-3-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925093807.1026949-1-wenst@chromium.org>
References: <20240925093807.1026949-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_023820_953886_F242C1CC 
X-CRM114-Status: GOOD (  18.58  )
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
Changes since v7:
- New patch
---
 drivers/regulator/devres.c         | 39 ++++++++++++++++++++++++++++++
 drivers/regulator/internal.h       | 16 +++++++-----
 drivers/regulator/of_regulator.c   |  4 +--
 include/linux/regulator/consumer.h | 17 +++++++++++++
 4 files changed, 68 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 1b893cdd1aad..36164aec30e8 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -749,3 +749,42 @@ void *devm_regulator_irq_helper(struct device *dev,
 	return ptr;
 }
 EXPORT_SYMBOL_GPL(devm_regulator_irq_helper);
+
+#if IS_ENABLED(CONFIG_OF)
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
+#endif
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index f62cacbbc729..b3d48dc38bc4 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -65,6 +65,13 @@ static inline struct regulator_dev *dev_to_rdev(struct device *dev)
 	return container_of(dev, struct regulator_dev, dev);
 }
 
+enum regulator_get_type {
+	NORMAL_GET,
+	EXCLUSIVE_GET,
+	OPTIONAL_GET,
+	MAX_GET_TYPE
+};
+
 #ifdef CONFIG_OF
 struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
 					      struct device_node *np,
@@ -74,6 +81,9 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 				 struct regulator_config *config,
 				 struct device_node **node);
 
+struct regulator *_of_regulator_get(struct device *dev, struct device_node *node,
+				    const char *id, enum regulator_get_type get_type);
+
 struct regulator_dev *of_parse_coupled_regulator(struct regulator_dev *rdev,
 						 int index);
 
@@ -116,12 +126,6 @@ static inline bool of_check_coupling_data(struct regulator_dev *rdev)
 }
 
 #endif
-enum regulator_get_type {
-	NORMAL_GET,
-	EXCLUSIVE_GET,
-	OPTIONAL_GET,
-	MAX_GET_TYPE
-};
 
 int _regulator_get_common_check(struct device *dev, const char *id,
 				enum regulator_get_type get_type);
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 358c3ed791db..3d85762beda6 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -668,8 +668,8 @@ struct regulator_dev *of_regulator_dev_lookup(struct device *dev, struct device_
 	return ERR_PTR(-ENODEV);
 }
 
-static struct regulator *_of_regulator_get(struct device *dev, struct device_node *node,
-					   const char *id, enum regulator_get_type get_type)
+struct regulator *_of_regulator_get(struct device *dev, struct device_node *node,
+				    const char *id, enum regulator_get_type get_type)
 {
 	struct regulator_dev *r;
 	int ret;
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 2b22f07e491c..8c3c372ad735 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -172,6 +172,9 @@ void devm_regulator_put(struct regulator *regulator);
 struct regulator *__must_check of_regulator_get_optional(struct device *dev,
 							 struct device_node *node,
 							 const char *id);
+struct regulator *__must_check devm_of_regulator_get_optional(struct device *dev,
+							      struct device_node *node,
+							      const char *id);
 #else
 static inline struct regulator *__must_check of_regulator_get_optional(struct device *dev,
 								       struct device_node *node,
@@ -179,6 +182,13 @@ static inline struct regulator *__must_check of_regulator_get_optional(struct de
 {
 	return ERR_PTR(-ENODEV);
 }
+
+static inline struct regulator *__must_check devm_of_regulator_get_optional(struct device *dev,
+									    struct device_node *node,
+									    const char *id)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 int regulator_register_supply_alias(struct device *dev, const char *id,
@@ -370,6 +380,13 @@ static inline struct regulator *__must_check of_regulator_get_optional(struct de
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct regulator *__must_check devm_of_regulator_get_optional(struct device *dev,
+									    struct device_node *node,
+									    const char *id)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void regulator_put(struct regulator *regulator)
 {
 }
-- 
2.46.0.792.g87dc391469-goog


