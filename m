Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5680AC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQ/ais/DnW2DhkO42fRSNxxKCNt0O583PTfpQXJv2Js=; b=hETuSNEqMuagZ36Ny2qR+9Vyva
	Qvi7KzobAN73mP+FsIwBg7wmKMK/fd2jfgXjqhSc2+x+g9K9Nyw2ohlx9qooGt8DXxxyhNuTHwGES
	x35DUIruEKjYdgsCI0kqTuOtDJl4n1MqQPHHuhtgtyJ1eooncHoBY8/dGpAdsJMZBTW/dZvdZkO8I
	mMbfW/TtF+WmrIA0JZhFbr8d5OK/38OjUhOvNFNfvHUqiLvSGxIyeggVb69kEcbom8mjl0d2ngTZv
	SXAdpKUDP9ShIBvMcUYv3xIOhIiNMNTHpvZD61xMp8ZpPwr1Ndyzer1gs7cKFygurdBsONYTiudgI
	LkxW8d6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh42S-0000000CD3P-09cH;
	Thu, 22 Aug 2024 09:23:28 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zc-0000000CCAu-3AVz
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-713eeb4e4a9so482008b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318432; x=1724923232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ/ais/DnW2DhkO42fRSNxxKCNt0O583PTfpQXJv2Js=;
        b=gr+KiuNYnEI60KfZqAS8J2I6viN5WnCjnZ/B/R/gkYiSeiXWCfCJjZog8SQAdsaE2l
         QRoQg4eYwevhhZD5yK8hhJojP4jKw9Z/TAa1t0Csv0JFuZyCmxCt3mlTKxhnITACs/pe
         luQs690HG6VHS/iG/HUGZznK4SxVQmWuF5cLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318432; x=1724923232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQ/ais/DnW2DhkO42fRSNxxKCNt0O583PTfpQXJv2Js=;
        b=eADRWnDg/N0vlKI9+PU64jUl/hN+WjqqLnVFtHUwDt0gQG3n9NmYsHA4fBXAmrGnFC
         e/LdaCNd72zbMHoSefQu5eQapszEw6OhkLDvfnPNPbK5NV07EnUmGZmRgZCdpI/rDfOf
         yV+gUmNIs6CztoMtpC2wuKt6M3T1ykCFeu6TD5Jd4KzOYHV0ooYMmswsvH4OBfp7lxFv
         19F/dZsWkrKoB7lOk2cltSaF1AE1M1TNhHmoBnJvf02NiMBU68RJg1Cev0hWjS4/KpLL
         cuZVuZN0bSQ+tZ5NA5OIeD0BHePHMoj4w4Sxk5q75iJJ+DLiPHWM/eFvZrWuWmMPkiXZ
         L5IA==
X-Forwarded-Encrypted: i=1; AJvYcCW/jEfN/CAxyGEz05zTltns5ImXDKwIgp/1/VzW+vt1sUUKdUvCbJGPaGN+kQBEaLXCPsvZJVpYx06Wk8GvCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwScQF3VUDU2/CznYAp73Ertg8LyoJ4kOMErH5u/jB/Sb6+Q18C
	p/MmWi911/PJM/3gvkWdI0PgFdxUrp/rnH3XTxQh4+I9tV9ARqzHeqPrqvRlFuIzzwwqqOzdDV4
	=
X-Google-Smtp-Source: AGHT+IHNX1mTbdGkDuNm269HAAWFLZMuunhBrLdO555YXJUIWEo+jUShOHk7j43VZg4OPf7/Roe+/g==
X-Received: by 2002:a05:6a21:398c:b0:1c6:f9ea:f2df with SMTP id adf61e73a8af0-1cad7f89598mr5999512637.12.1724318431795;
        Thu, 22 Aug 2024 02:20:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:31 -0700 (PDT)
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
Subject: [PATCH v5 03/10] regulator: Split up _regulator_get()
Date: Thu, 22 Aug 2024 17:19:56 +0800
Message-ID: <20240822092006.3134096-4-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022032_821943_D609B63F 
X-CRM114-Status: GOOD (  18.20  )
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

_regulator_get() contains a lot of common code doing checks prior to the
regulator lookup and housekeeping work after the lookup. Almost all the
code could be shared with a OF-specific variant of _regulator_get().

Split out the common parts so that they can be reused. The OF-specific
version of _regulator_get() will be added in a subsequent patch.
No functional changes were made.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch
---
 drivers/regulator/core.c     | 54 ++++++++++++++++++++++++++++--------
 drivers/regulator/internal.h |  4 +++
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 361309fcae57..4d1c640cc030 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2093,26 +2093,43 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 	return ret;
 }
 
-/* Internal regulator request function */
-struct regulator *_regulator_get(struct device *dev, const char *id,
-				 enum regulator_get_type get_type)
+/* common pre-checks for regulator requests */
+int _regulator_get_common_check(struct device *dev, const char *id,
+				enum regulator_get_type get_type)
 {
-	struct regulator_dev *rdev;
-	struct regulator *regulator;
-	struct device_link *link;
-	int ret;
-
 	if (get_type >= MAX_GET_TYPE) {
 		dev_err(dev, "invalid type %d in %s\n", get_type, __func__);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	if (id == NULL) {
 		dev_err(dev, "regulator request with no identifier\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
-	rdev = regulator_dev_lookup(dev, id);
+	return 0;
+}
+
+/**
+ * _regulator_get_common - Common code for regulator requests
+ * @rdev: regulator device pointer as returned by *regulator_dev_lookup()
+ *       Its reference count is expected to have been incremented.
+ * @dev: device used for dev_printk messages
+ * @id: Supply name or regulator ID
+ * @get_type: enum regulator_get_type value corresponding to type of request
+ *
+ * Returns a struct regulator corresponding to @rdev,
+ * or IS_ERR() condition containing errno.
+ *
+ * This function should be chained with *regulator_dev_lookup() functions.
+ */
+struct regulator *_regulator_get_common(struct regulator_dev *rdev, struct device *dev,
+					const char *id, enum regulator_get_type get_type)
+{
+	struct regulator *regulator;
+	struct device_link *link;
+	int ret;
+
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 
@@ -2228,6 +2245,21 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 	return regulator;
 }
 
+/* Internal regulator request function */
+struct regulator *_regulator_get(struct device *dev, const char *id,
+				 enum regulator_get_type get_type)
+{
+	struct regulator_dev *rdev;
+	int ret;
+
+	ret = _regulator_get_common_check(dev, id, get_type);
+	if (ret)
+		return ERR_PTR(ret);
+
+	rdev = regulator_dev_lookup(dev, id);
+	return _regulator_get_common(rdev, dev, id, get_type);
+}
+
 /**
  * regulator_get - lookup and obtain a reference to a regulator.
  * @dev: device for regulator "consumer"
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index ffeaef22169e..3718459fb0c5 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -121,6 +121,10 @@ enum regulator_get_type {
 	MAX_GET_TYPE
 };
 
+int _regulator_get_common_check(struct device *dev, const char *id,
+				enum regulator_get_type get_type);
+struct regulator *_regulator_get_common(struct regulator_dev *rdev, struct device *dev,
+					const char *id, enum regulator_get_type get_type);
 struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
 int _regulator_bulk_get(struct device *dev, int num_consumers,
-- 
2.46.0.184.g6999bdac58-goog


