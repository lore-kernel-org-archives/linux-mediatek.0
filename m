Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DED7C61DD6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJMnm69J8RdOeWIBaNigEROVzoE1nH5G/6Xl+5Lr2x8=; b=d3KIUVauqkf4zmxRgnprUbm5KY
	kHvDIiiuliNRHYTS67a56sYhv7bOnqQjDA7/ZjqPusW5t7nOuDPGLC41V7qTI+zeDTIxTVh/KnHWu
	dEIZgimmxXjTKTGah1DHcdTR5/w7dABIcjslAHYEKgzSS/RAXQT9iaF36eRu6MRiZLtM9E6snxmKR
	zjzRFXc8TRbWgob2nNVOUzTwqfoqF4rT7TJKNLsWTpZk7wpBtzbYvvMYmYjmK/TXLJlfm2UWUWjtp
	DSvtlxSsZIonZ6mXBKrsYGBA01aLX8HXsRQ1h7AA/c1AluAl5FSN58WGVaq9RYuxa552ep2hOHZHO
	/z1ygQfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFl-0000000BA2g-0ODt;
	Tue, 01 Sep 2026 07:49:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFi-0000000BA0Q-2HhZ
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 07:49:56 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d71ae3455aso8926755ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788248994; x=1788853794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NJMnm69J8RdOeWIBaNigEROVzoE1nH5G/6Xl+5Lr2x8=;
        b=I4I9AK8eN+fsI3s+bTL4Wst6xQCR3wobce7CGO6myN0fBffNVbg2tDHweFZ2ft4nDr
         DyQvbj3e3qIB8JADZlzc1ZkL/pQkmLbWGAobAcONyyukvIg4kJufGog8RxXg5xHOqWUD
         iATQHO692EvnIfzAzghvf4fdCJzh5XRzmHbX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248994; x=1788853794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJMnm69J8RdOeWIBaNigEROVzoE1nH5G/6Xl+5Lr2x8=;
        b=ruuK+h1AOJE4eKW4i/m6M26/jVBPCC2Zgbme4Eac+SS7yzKFGooNt/X+xX/YpJdNa0
         mV47x52dYIaVEvFn/u/qL78xPlXcxg81iRx3qQy5p5oN1/jDfsl4I7Ho19V4hwC7Fi0P
         wQdaZx8RVdl1CeLKVAjCroPK6CPwWp187X2PTVlyBIJ1C8KwluroF/23eZ6CTSV+g20+
         g/7BqfjQZugTuwwDFQvshfoXjb9h/jG6QAfwXdyg31meM6M0ZG4qzmdXVpQ1t51IeTWL
         yXWcC+NcKybFgeVr10gKQBkJtg6EarqJDrBNnJ26dRe6ck6Z8u5pgRq5SgkJL2Ikm/gf
         GOEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcqY/hdXI9t4t7JMwwQJTD5FI4oF3mjMjwIr9ZY0CMqsmVgCflquwY9jcyrbccdWNuUolCjq5M60qWa8VlUg==@lists.infradead.org
X-Gm-Message-State: AFuF++nduO4l7U/8as15wGmfk88TPAXfK4bL+3LoLjCP57+bkOwfNslC
	i0sXYKuihgl93QEG85RiA2lKWbHdTsNEiNSgxaGocDdvdOFKKd76hmncR43jaZknHw==
X-Gm-Gg: AYBFou17n9PfumIC77CNXGha2d+zjcaHnlq8U6qD/8b4Awb8eI+eYKJ62vLxSLnQAUg
	IytyqlkiI/LHdJb7gGLMw/ALhbYp+mXDf9f7lLBkpefAZkw/eQpi0fzLMNW1pNbmszRhwoX+kxz
	nY/R3rNR6i7AbKSWhmO5QsaecOOYfTY81iWECoIDrq5FrV0spxjescuIRz1gtql5apYuiVag9NV
	vY8cGoAXS4mz9lpWCABRxqPxBH/Xuy9PbBT0X07uwnP0z1sBg4z8HupgRB/HIVIGZ6DmAa56Jfu
	8bkIam1+GvNRK+o9PJfHEFZKUBDxwgP8s4BhaiLbPWEiks/+H+NweX/ZUZqXi1dtkz4sgF2sVhL
	lbnGvwCm+CI3OhlxkJBk4hKbD6Pcz/3IcWrLyuHy65nb0q/Ouf2eatUwMNDe6xPfWu4c70WgLsL
	t7MT0BgwjWIavOnJAxcPoeVD+QB5EPWln/pEQbyQnWxhmNXw01y3dIg7P0Bd2jov4NrGf2wWo28
	F3DVvpVL29KCyiASpGXZf0IPs6EC6nnzmwzDlWoOnYIQg==
X-Received: by 2002:a17:902:fd85:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2d74dc6f7c3mr521877535ad.7.1788248993464;
        Tue, 01 Sep 2026 00:49:53 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:49:53 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/8] regulator: core: Add "enable and wait" functions
Date: Tue,  1 Sep 2026 15:49:19 +0800
Message-ID: <20260901074930.764550-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_004954_613088_97893FDB 
X-CRM114-Status: GOOD (  38.99  )
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

The timestamp is updated each time the regulator is actually turned on.
For regulators left on by hardware default or by firmware, the core will
set the timestamp if it detects it was left on and its supply (and their
supply, and so on) is on as well. This is unfortunately best effort
only. The core can only assume a dangling regulator (one without a
supply) has power. This also applies to the dummy regulator.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Correctly assign wait_us to all bulk consumers (Sashiko)
- Check _regulator_is_enabled() > 0 to check for enabled regulators
  (Sashiko)
- Lock regulator_dev on final _regulator_is_enabled() check in
  regulator_register() (Sashiko)
- Make it clear that _regulator_is_enabled_recursive() assumes that
  supplies have been resolved (local AI review)
- Consider supply's last_on timestamp for regulators that are already
  enabled or have no .is_enabled() ops (local AI review)

Changes since v4:
- Try to update last_on timestamp for regulators that were left on

Changes since v3:
- Added __private modified to regulator_bulk_data.wait_us field and
  switched to ACCESS_PRIVATE accessor for the field
- Moved wait outside regulator lock scope
- Moved "remaining" value assignment closer to conditional
- Fixed variable unit name in regulator_enable_and_wait() prototype

Changes since v2:
- New patch
---
 drivers/regulator/core.c           | 129 +++++++++++++++++++++++++----
 include/linux/regulator/consumer.h |  21 +++--
 include/linux/regulator/driver.h   |   2 +
 3 files changed, 131 insertions(+), 21 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387b5..d7a193a3bcb2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -99,7 +99,7 @@ struct regulator_event_work {
 	unsigned long event;
 };
 
-static int _regulator_enable(struct regulator *regulator);
+static int _regulator_enable(struct regulator *regulator, ktime_t *last_on);
 static int _regulator_is_enabled(struct regulator_dev *rdev);
 static int _regulator_disable(struct regulator *regulator);
 static int _regulator_get_error_flags(struct regulator_dev *rdev, unsigned int *flags);
@@ -1675,7 +1675,7 @@ static int set_machine_constraints(struct regulator_dev *rdev,
 		    (rdev->constraints->always_on ||
 		     !regulator_is_enabled(rdev->supply))) {
 			ret = (is_locked
-			       ? _regulator_enable(rdev->supply)
+			       ? _regulator_enable(rdev->supply, NULL)
 			       : regulator_enable(rdev->supply));
 			if (ret < 0) {
 				_regulator_put(rdev->supply);
@@ -2186,6 +2186,45 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+/**
+ * _regulator_is_enabled_recursive - is the regulator output enabled all
+ *				     the way to the root supply
+ * @rdev: regulator device
+ *
+ * Only intended for checking regulators that have been left on by
+ * hardware default or firmware.
+ *
+ * Assumes supplies have been resolved. Must be called with dependent
+ * locks held.
+ *
+ * Return: Positive if the regulator output backing the source/client,
+ *	   and all of its upstream supplies, have requested that their
+ *	   respective device be enabled, zero if any of them hasn't,
+ *	   else a negative error number.
+ */
+static int _regulator_is_enabled_recursive(struct regulator_dev *rdev)
+{
+	int ret;
+
+	ret = _regulator_is_enabled(rdev);
+	if (ret <= 0)
+		return ret;
+
+	/*
+	 * If .last_on was set, then this rdev was either enabled through
+	 * _regulator_do_enable(), or had been checked before as the target
+	 * of regulator_resolve_supply().
+	 */
+	if (rdev->last_on)
+		return ret;
+
+	/* This is the root supply; we can only assume it actually has power */
+	if (!rdev->supply)
+		return ret;
+
+	return _regulator_is_enabled_recursive(rdev->supply->rdev);
+}
+
 static int regulator_resolve_supply(struct regulator_dev *rdev)
 {
 	struct regulator_dev *r;
@@ -2370,6 +2409,14 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 		}
 		rdev->constraints_pending = false;
 	}
+
+	/*
+	 * regulator was left on but not enabled with .always_on or .boot_on
+	 * constraints, and thus .last_on timestamp is still invalid.
+	 */
+	if (!rdev->last_on && _regulator_is_enabled_recursive(rdev) > 0)
+		rdev->last_on = ktime_get_boottime();
+
 	regulator_unlock_dependent(rdev, &ww_ctx);
 
 	if (!do_final_setup)
@@ -3061,6 +3108,8 @@ static int _regulator_do_enable(struct regulator_dev *rdev)
 		fsleep(delay);
 	}
 
+	rdev->last_on = ktime_get_boottime();
+
 	trace_regulator_enable_complete(rdev_get_name(rdev));
 
 	return 0;
@@ -3130,16 +3179,18 @@ static int _regulator_handle_consumer_disable(struct regulator *regulator)
 	return 0;
 }
 
-/* locks held by regulator_enable() */
-static int _regulator_enable(struct regulator *regulator)
+/* locks held by regulator_enable_and_wait() */
+static int _regulator_enable(struct regulator *regulator, ktime_t *last_on)
 {
 	struct regulator_dev *rdev = regulator->rdev;
+	ktime_t supply_last_on;
 	int ret;
 
 	lockdep_assert_held_once(&rdev->mutex.base);
 
+	supply_last_on = 0;
 	if (rdev->use_count == 0 && rdev->supply) {
-		ret = _regulator_enable(rdev->supply);
+		ret = _regulator_enable(rdev->supply, &supply_last_on);
 		if (ret < 0)
 			return ret;
 	}
@@ -3177,13 +3228,26 @@ static int _regulator_enable(struct regulator *regulator)
 		} else if (ret < 0) {
 			rdev_err(rdev, "is_enabled() failed: %pe\n", ERR_PTR(ret));
 			goto err_consumer_disable;
+		} else {
+			/*
+			 * Either the regulator was already enabled somehow, or this regulator
+			 * itself has no on/off control. Either way our timestamp cannot be
+			 * earlier than its supply's timestamp. supply_last_on == 0 if there
+			 * is no supply.
+			 */
+			if (rdev->last_on < supply_last_on)
+				rdev->last_on = supply_last_on;
+			if (!rdev->last_on)
+				rdev->last_on = ktime_get_boottime();
 		}
-		/* Fallthrough on positive return values - already enabled */
 	}
 
 	if (regulator->enable_count == 1)
 		rdev->use_count++;
 
+	if (last_on)
+		*last_on = rdev->last_on;
+
 	return 0;
 
 err_consumer_disable:
@@ -3197,31 +3261,49 @@ static int _regulator_enable(struct regulator *regulator)
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
+	ktime_t last_on = 0;
 	int ret;
 
 	regulator_lock_dependent(rdev, &ww_ctx);
-	ret = _regulator_enable(regulator);
+	ret = _regulator_enable(regulator, &last_on);
 	regulator_unlock_dependent(rdev, &ww_ctx);
 
+	if (ret)
+		return ret;
+
+	if (wait_us) {
+		ktime_t end = ktime_add_us(last_on, wait_us);
+		s64 remaining;
+
+		remaining = ktime_us_delta(end, ktime_get_boottime());
+		if (remaining > 0)
+			fsleep(remaining);
+	}
+
 	return ret;
 }
-EXPORT_SYMBOL_GPL(regulator_enable);
+EXPORT_SYMBOL_GPL(regulator_enable_and_wait);
 
 static int _regulator_do_disable(struct regulator_dev *rdev)
 {
@@ -5390,30 +5472,38 @@ static void regulator_bulk_enable_async(void *data, async_cookie_t cookie)
 {
 	struct regulator_bulk_data *bulk = data;
 
-	bulk->ret = regulator_enable(bulk->consumer);
+	bulk->ret = regulator_enable_and_wait(bulk->consumer, ACCESS_PRIVATE(bulk, wait_us));
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
+		ACCESS_PRIVATE(&consumers[i], wait_us) = wait_us;
 		async_schedule_domain(regulator_bulk_enable_async,
 				      &consumers[i], &async_domain);
 	}
@@ -5441,7 +5531,7 @@ int regulator_bulk_enable(int num_consumers,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(regulator_bulk_enable);
+EXPORT_SYMBOL_GPL(regulator_bulk_enable_and_wait);
 
 /**
  * regulator_bulk_disable - disable multiple regulator consumers
@@ -6243,6 +6333,15 @@ regulator_register(struct device *dev,
 			goto del_cdev_and_bdev;
 	}
 
+	/*
+	 * If no supply was given, then the last_on timestamp could not have
+	 * been updated in regulator_resolve_supply(). Check it here.
+	 */
+	regulator_lock(rdev);
+	if (!rdev->supply_name && !rdev->last_on && _regulator_is_enabled(rdev) > 0)
+		rdev->last_on = ktime_get_boottime();
+	regulator_unlock(rdev);
+
 	rdev_init_debugfs(rdev);
 
 	/* try to resolve regulators coupling since a new one was registered */
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 56fe2693d9b2..0b83acc015d4 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -145,6 +145,7 @@ struct regulator_bulk_data {
 
 	/* private: Internal use */
 	int ret;
+	unsigned int __private wait_us;
 };
 
 #if defined(CONFIG_REGULATOR)
@@ -192,7 +193,7 @@ int devm_regulator_bulk_register_supply_alias(struct device *dev,
 					      int num_id);
 
 /* regulator output control and status */
-int __must_check regulator_enable(struct regulator *regulator);
+int __must_check regulator_enable_and_wait(struct regulator *regulator, unsigned int wait_us);
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
2.55.0.897.gb25b4bd76c-goog


