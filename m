Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B841EDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uo9H3mi08AzEIcyFPjnP71nK8rUWm/O6uNXtiPTxfPw=; b=TzVj55aAdDKDsbH0ECihmjyr87
	GTSVuxwhKrTMsdpYHw4DGeEHmAPOwpBxT4+ZEBTCdJZeZVN0wkaDSKINNsb/0JEYGXcnc0rSQwARf
	cI+gs9EZ6Xwd7aBZk3BsSCos7FvwUtAMZiiBZixlTYYE31wYlfMC4DugdrNDG8dNrQjbK0O+iz5TZ
	2s8KwBoheE/imEIW/o3j+beiCzMHOHsWnbsJszQGmqkWXR37dKaa1wpkQbW5A73FkKl7MdwWlmh86
	3HaRvwNhBy/DLDnLUi/SPstdfSycBKK99XLHLqtktZGXwDTzyd86LWTs38xGkURd3UovSkfyIeieD
	XV2xeJ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHqi-00000008S6J-3eaJ;
	Wed, 11 Sep 2024 07:33:12 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHmA-00000008QlE-1csY
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71798661a52so466124b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039709; x=1726644509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo9H3mi08AzEIcyFPjnP71nK8rUWm/O6uNXtiPTxfPw=;
        b=Y2ZvjfWd2VIRTb8u90v+CqZQEBfUPt0z6Hi+7F8dgDpFj4m/8G/1D11JUJ4L9iggof
         IzI3A0HQRe8eKdb1trpWH90QuLAsq+hsR/55UW09/4sWyl0FLi8YeMFKAgc04lQ5D2NG
         QkXRXcuE+F0x9RhIn1D2UTJYQJzz7ecW0zf0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039709; x=1726644509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uo9H3mi08AzEIcyFPjnP71nK8rUWm/O6uNXtiPTxfPw=;
        b=oLsfMhSDW/0KCJkn8mNVUWvbadusxy5141KJzu3tpEqYKFtnD3MIFFheMQQrZryUI9
         cmwvx3hRDHf8lBnFyxi59rdTRCkMYw30THzVLBspmfSaV3dTl4idFLecGe7wpDottmhe
         imBAI94EKNui4izZnIBrdUWlEoiBK3M8huL5ZVPZ3SjEQ5c7JpPrXQ7QF+j0BDBb8V0J
         aZCu5Df9xM6gH7VxVpgn32izkcUPYZW1dUNIHNq80wne92auTfEnmli4Ft2MNNWj/9ry
         CKGL0Z+lHmIVvL4HiTfKnynIzLMaPZTqHGKkjBnIX1y3NxtIJ25z8XQamz1yjeqyRYUE
         A9uw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3+CG61kjIdsUcnbPyHq9TPOX9Cr9dZ5+8Opf5f9iz3F1zBgeWEkTq3FcPBFJSezElZlj23cW/qmX+FVMTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvRQs1L+QhhqQvHDy+AINx+GS9B4vrvcp1hypBR4f4H34ZjVw/
	u3V9S7XW2TPWwG9w1oABcR0hOFZrT0P0mzEe5To9qsQqGslOVfq9ykQCma7W4g==
X-Google-Smtp-Source: AGHT+IH8y/5qgaRg14jmmESJlTP33GJD1mpI9XyvqpkYm264oWkGo2r0XR7RzXDvrRycmczgHdwVfQ==
X-Received: by 2002:a05:6a00:6f0c:b0:70d:26cd:9741 with SMTP id d2e1a72fcca58-71907f29d40mr7749073b3a.12.1726039709427;
        Wed, 11 Sep 2024 00:28:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:29 -0700 (PDT)
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
Subject: [PATCH v7 03/10] regulator: Split up _regulator_get()
Date: Wed, 11 Sep 2024 15:27:41 +0800
Message-ID: <20240911072751.365361-4-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002830_506155_8869AD0D 
X-CRM114-Status: GOOD (  18.28  )
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
Changes since v6:
None.

Changes since v5:
- Fixed kerneldoc "Return" section format for _regulator_get_common()
- Slightly reworded return value description

Changes since v4:
- New patch
---
 drivers/regulator/core.c     | 54 ++++++++++++++++++++++++++++--------
 drivers/regulator/internal.h |  4 +++
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 835a5531d045..d60c86477ac2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2103,26 +2103,43 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
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
+ * Returns: pointer to struct regulator corresponding to @rdev, or ERR_PTR()
+ *	    encoded error.
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
 
@@ -2238,6 +2255,21 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
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
index 8e5506c5ee94..5b43f802468d 100644
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
2.46.0.598.g6f2099f65c-goog


