Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA84C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rCW+zOBgfvbnw9BhnKL6QqmG00TxqWezJ2oP+m8mTI=; b=2VQ/r2pEaLP7kLjf15MNEbjqKb
	WFXe72OdqK+jgtlolbFDS4BO6fQM3+pxjxLpAOVqcsBwpMHyy9V06+ySEroMJqLSIZEu5s9opD7wK
	OqeI4ybq/ZB20ynKBMIimrXzOYdefI/fADgClmput3XLEkCGiw2VNL+S/Q+4Uhw9l/zImoCbkpqBU
	jt4CI4p4W010+ODMtjf/G6KyHHfFIb1/YRQPxGZmeHjWW/d+TagWgWHxqeEhXZXzeuGjnir1Hv6Hd
	4Kiq+i0tWiz0h7drXM3uq4a9qHTFFkrEUvPj4V2V7mlLeq9nZ9JKOPWPgcFuYOqIl9BjoiaXR/fU/
	6fZEyyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Im-00000008hjO-0muF;
	Tue, 21 Jul 2026 07:54:08 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Ik-00000008hhm-0FdA
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ced3386430so72811055ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620445; x=1785225245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rCW+zOBgfvbnw9BhnKL6QqmG00TxqWezJ2oP+m8mTI=;
        b=AW63XNVL8GeeGy95MOsNNeZfQXjP8LNH2rKjzpNCshxmOrVu9oDBKfGCdVJfumVcnJ
         TMHgATXr2xtxW73gUUckzpjylmbVcDGoU8cj4NlS2Zvb+bxJhulAi6Vpu6KX0P4X5YEY
         qnjBcEmdxNNy4Ze2vcTB4ncbWfshqKBRfWIiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620445; x=1785225245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rCW+zOBgfvbnw9BhnKL6QqmG00TxqWezJ2oP+m8mTI=;
        b=pFHIDzAzPtw5Tt8HC5CLjLouUYlO4ikHI3qeFltug5/jxkgGtvGdBdJjirbFJ7nWNP
         7Q2fdw4cN3KSVRWQmk5IdcxfLclV0keT3AVYJd163QUCjrhSt52n1SJyRaSqOM48xvZZ
         N9rlG/e6r2gV/E1blm/M2FLO2g+VNsNl9RESUntA0W7i2Js/FSzIhMNR5/z5vTfUDcfN
         joL0EG5b4DHckKRI8L66VtV902orfGiSaTYWlYEFL2P7HZv0r3HnuHK//oNpHxfhIme0
         DMKtnTGO0T+1I6eAJzO+dRPa//drlEaI7c3PaB1u14FM5D5dp3LtHGZNnDOy//ZHI9aC
         7BWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6WlnOkcPWVfrqIwZ/gN1RLPkMjB8qaeqj3aC+gpehMaNURn8AGDMcMY67l1I3ko+xX7wcHOvDCwspAKPZAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwA7qiKd1yCq6i8qXPF3rcKBM6/1alzimdxi58zpMcfVqtP0vwY
	SSB6Cc20eqzYc1A/n89ozIOXIPe9Xj/lti5yTo1Z50I5h+Gelp62CgMzWJuhSDAdpg==
X-Gm-Gg: AR+sD10huy7g/QPGsZbtV8wcvvenDWTFZXo+hzdfEHSlbtEQpsz/sf0iwVt6jmXN5LS
	ujmCpk2HVE6fD11eGMDb6AcbxUUKXzmki0D73dob7/s2J59E4JCxY8tNvKAR0fm8y3sCgkk7HQ/
	4sjtYGGE5oco47Vkl97ZNcZ15c85bLux5oskB3EAhT7hS2KlXdzG3TFjSV8Cgrs60h8Ru/ZhGkn
	SgmJ8euR0wPswaxtMK2QWBAXmbLO95JP+wyOkfEvYFTZxsgqDfCQ470GDecd4ADT80Q2xdxawwf
	+6mAolj2V7LP5hIbghPyqu/mTyrBwjLTuwWwkUEH8EB29COwtEVs3KSPQ1S3C4nKlcacV4rcsmF
	EvJzlMiZSCus3anwdLIM5fqpd2CfNv7Ox5z3vq5q8WE5nrgD3JTZHKmioUycsdXXgDQIeIonRPj
	ESLIgae3zQ8SvCc6NYMRNu23IvbdMGmnzSFLK7m9JONs5iMzLNYE73ySvuTZ1UkJWwY52bUg==
X-Received: by 2002:a17:902:fb4c:b0:2ca:d91d:d3a7 with SMTP id d9443c01a7336-2cf34804857mr128068305ad.10.1784620445333;
        Tue, 21 Jul 2026 00:54:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
Date: Tue, 21 Jul 2026 15:52:15 +0800
Message-ID: <20260721075226.2347933-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005406_118010_E4BD3512 
X-CRM114-Status: GOOD (  29.40  )
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

In device power sequencing and initialization use cases, it is common
for the driver to enable the regulator and then wait for a certain
period of time to pass before continuing.

In cases where the regulator supply is always on, or has been turned on
or left on by another consumer, the driver could shorten the delay or
skip it altogether, provided that enough time has already passed since
the regulator was _actually_ turned on.

Tracking this requires support from the regulator core. Introduce a
"last turned on" timestamp field to the regulator device, and "enable
and wait" functions to the single and bulk regulator consumer APIs.
The existing "enable without wait" functions are then converted to
macros that expand to the new functions.

One case in particular is not optimized yet: a regulator left on either
by hardware reset default or by the bootloader, but does not have the
"regulator-boot-on" property set. As the enable timestamp only gets
updated when enabled by a consumer or by the core, the first enablement
always needs to wait.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/regulator/core.c           | 53 ++++++++++++++++++++++--------
 include/linux/regulator/consumer.h | 21 ++++++++----
 include/linux/regulator/driver.h   |  2 ++
 3 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 1797929dfe56..d14ce86d8f7b 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -98,7 +98,8 @@ struct regulator_event_work {
 	unsigned long event;
 };
 
-static int _regulator_enable(struct regulator *regulator);
+static int _regulator_enable_and_wait(struct regulator *regulator, unsigned int wait_us);
+#define _regulator_enable(regulator)	_regulator_enable_and_wait(regulator, 0)
 static int _regulator_is_enabled(struct regulator_dev *rdev);
 static int _regulator_disable(struct regulator *regulator);
 static int _regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags);
@@ -3043,6 +3044,8 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 		fsleep(delay);
 	}
 
+	rdev->last_on = ktime_get_boottime();
+
 	trace_regulator_enable_complete(rdev_get_name(rdev));
 
 	return 0;
@@ -3112,8 +3115,8 @@ static int _regulator_handle_consumer_disable(struct regulator *regulator)
 	return 0;
 }
 
-/* locks held by regulator_enable() */
-static int _regulator_enable(struct regulator *regulator)
+/* locks held by regulator_enable_and_wait() */
+static int _regulator_enable_and_wait(struct regulator *regulator, unsigned int wait_us)
 {
 	struct regulator_dev *rdev = regulator->rdev;
 	int ret;
@@ -3159,13 +3162,24 @@ static int _regulator_enable(struct regulator *regulator)
 		} else if (ret < 0) {
 			rdev_err(rdev, "is_enabled() failed: %pe\n", ERR_PTR(ret));
 			goto err_consumer_disable;
+		} else {
+			/* regulator already enabled somehow, but timestamp might be invalid */
+			if (!rdev->last_on)
+				rdev->last_on = ktime_get_boottime();
 		}
-		/* Fallthrough on positive return values - already enabled */
 	}
 
 	if (regulator->enable_count == 1)
 		rdev->use_count++;
 
+	if (wait_us) {
+		ktime_t end = ktime_add_us(rdev->last_on, wait_us);
+		s64 remaining = ktime_us_delta(end, ktime_get_boottime());
+
+		if (remaining > 0)
+			fsleep(remaining);
+	}
+
 	return 0;
 
 err_consumer_disable:
@@ -3179,31 +3193,36 @@ static int _regulator_enable(struct regulator *regulator)
 }
 
 /**
- * regulator_enable - enable regulator output
+ * regulator_enable_and_wait - enable regulator output and wait for time
+ *			       passed after regulator actually enabled
  * @regulator: regulator source
+ * @wait_us: time to wait after regulator actually turned on; 0 to not wait
  *
  * Request that the regulator be enabled with the regulator output at
  * the predefined voltage or current value.  Calls to regulator_enable()
  * must be balanced with calls to regulator_disable().
  *
+ * If wait_us is greater than zero, then check that wait_us has passed since
+ * the regulator is _actually_ enabled before returning.
+ *
  * NOTE: the output value can be set by other drivers, boot loader or may be
  * hardwired in the regulator.
  *
  * Return: 0 on success or a negative error number on failure.
  */
-int regulator_enable(struct regulator *regulator)
+int regulator_enable_and_wait(struct regulator *regulator, unsigned int wait_us)
 {
 	struct regulator_dev *rdev = regulator->rdev;
 	struct ww_acquire_ctx ww_ctx;
 	int ret;
 
 	regulator_lock_dependent(rdev, &ww_ctx);
-	ret = _regulator_enable(regulator);
+	ret = _regulator_enable_and_wait(regulator, wait_us);
 	regulator_unlock_dependent(rdev, &ww_ctx);
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(regulator_enable);
+EXPORT_SYMBOL_GPL(regulator_enable_and_wait);
 
 static int _regulator_do_disable(struct regulator_dev *rdev)
 {
@@ -5372,30 +5391,38 @@ static void regulator_bulk_enable_async(void *data, async_cookie_t cookie)
 {
 	struct regulator_bulk_data *bulk = data;
 
-	bulk->ret = regulator_enable(bulk->consumer);
+	bulk->ret = regulator_enable_and_wait(bulk->consumer, bulk->wait_us);
 }
 
 /**
- * regulator_bulk_enable - enable multiple regulator consumers
+ * regulator_bulk_enable_and_wait - enable multiple regulator consumers and
+ *				    wait for time passed after regulators are
+ *				    actually enabled
  *
  * @num_consumers: Number of consumers
  * @consumers:     Consumer data; clients are stored here.
+ * @wait_us: time to wait after regulators actually turned on; 0 to not wait
  *
  * This convenience API allows consumers to enable multiple regulator
  * clients in a single API call.  If any consumers cannot be enabled
  * then any others that were enabled will be disabled again prior to
  * return.
  *
+ * If wait_us is greater than zero, then check that wait_us has passed since
+ * the regulators are _actually_ enabled before returning.
+ *
  * Return: 0 on success or a negative error number on failure.
  */
-int regulator_bulk_enable(int num_consumers,
-			  struct regulator_bulk_data *consumers)
+int regulator_bulk_enable_and_wait(int num_consumers,
+				   struct regulator_bulk_data *consumers,
+				   unsigned int wait_us)
 {
 	ASYNC_DOMAIN_EXCLUSIVE(async_domain);
 	int i;
 	int ret = 0;
 
 	for (i = 0; i < num_consumers; i++) {
+		consumers[i].wait_us = wait_us;
 		async_schedule_domain(regulator_bulk_enable_async,
 				      &consumers[i], &async_domain);
 	}
@@ -5423,7 +5450,7 @@ int regulator_bulk_enable(int num_consumers,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(regulator_bulk_enable);
+EXPORT_SYMBOL_GPL(regulator_bulk_enable_and_wait);
 
 /**
  * regulator_bulk_disable - disable multiple regulator consumers
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 56fe2693d9b2..a69157c9b5b5 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -145,6 +145,7 @@ struct regulator_bulk_data {
 
 	/* private: Internal use */
 	int ret;
+	unsigned int wait_us;
 };
 
 #if defined(CONFIG_REGULATOR)
@@ -192,7 +193,7 @@ int devm_regulator_bulk_register_supply_alias(struct device *dev,
 					      int num_id);
 
 /* regulator output control and status */
-int __must_check regulator_enable(struct regulator *regulator);
+int __must_check regulator_enable_and_wait(struct regulator *regulator, unsigned int ms);
 int regulator_disable(struct regulator *regulator);
 int regulator_force_disable(struct regulator *regulator);
 int regulator_is_enabled(struct regulator *regulator);
@@ -209,8 +210,9 @@ int __must_check devm_regulator_bulk_get_const(
 	struct device *dev, int num_consumers,
 	const struct regulator_bulk_data *in_consumers,
 	struct regulator_bulk_data **out_consumers);
-int __must_check regulator_bulk_enable(int num_consumers,
-				       struct regulator_bulk_data *consumers);
+int __must_check regulator_bulk_enable_and_wait(int num_consumers,
+						struct regulator_bulk_data *consumers,
+						unsigned int wait_us);
 int devm_regulator_bulk_get_enable(struct device *dev, int num_consumers,
 				   const char * const *id);
 int regulator_bulk_disable(int num_consumers,
@@ -410,7 +412,8 @@ static inline int devm_regulator_bulk_register_supply_alias(struct device *dev,
 	return 0;
 }
 
-static inline int regulator_enable(struct regulator *regulator)
+static inline int regulator_enable_and_wait(struct regulator *regulator,
+					    unsigned int wait_us)
 {
 	return 0;
 }
@@ -457,8 +460,9 @@ static inline int devm_regulator_bulk_get_const(
 	return 0;
 }
 
-static inline int regulator_bulk_enable(int num_consumers,
-					struct regulator_bulk_data *consumers)
+static inline int regulator_bulk_enable_and_wait(int num_consumers,
+						 struct regulator_bulk_data *consumers,
+						 unsigned int wait_us)
 {
 	return 0;
 }
@@ -676,6 +680,11 @@ regulator_is_equal(struct regulator *reg1, struct regulator *reg2)
 }
 #endif
 
+#define regulator_enable(regulator)	regulator_enable_and_wait(regulator, 0)
+
+#define regulator_bulk_enable(num_consumers, consumers)	\
+		regulator_bulk_enable_and_wait(num_consumers, consumers, 0)
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_REGULATOR)
 struct regulator *__must_check of_regulator_get(struct device *dev,
 						struct device_node *node,
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index cc6ce709ec86..8a74aa681df3 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -658,6 +658,8 @@ struct regulator_dev {
 	unsigned int constraints_pending:1;
 	unsigned int is_switch:1;
 
+	/* time when this regulator was enabled last time */
+	ktime_t last_on;
 	/* time when this regulator was disabled last time */
 	ktime_t last_off;
 	int cached_err;
-- 
2.55.0.229.g6434b31f56-goog


