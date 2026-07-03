Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EFDC43602
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=; b=K8ZI/zbEIEXWjAsfOzn6BINWlO
	MqdZ9aLgGvq7YXlKaLl4NpwN8DtausOAzp8MUm3nBCFoYh1N22ewK7W6SC75eeqL5DQNfO6FYrBxo
	bJaNO8dUqzEw2U5yWcr+ibvYkX76dMd4ml4bhNrLW42S/AScdYC30CIv1mCvi6vYrwoLRZUUUCIKk
	WSV1efAhdbNsMYEqFbcuBbo3jjlxLnyC5VUYyzz5nbChtX3B3FBMuNnPpdXQdKso+PIDVXtEfXQru
	vH0NO4WxTFCUytEZTh5fqgdpyA+ZMo1jPpK3//xBBL+/0lsYBU20Zk4j4fNZzvYfDra7ecRo7otQi
	xcgXS1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVP-00000006rqq-18aR;
	Fri, 03 Jul 2026 11:56:27 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVM-00000006rnb-3Spf
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:25 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso327985a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079784; x=1783684584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=;
        b=KJtc85R+Yh1VXlJb3Se0mBaqW408bSUxIolAg4OZwrF+1AOHN7wuNmLMEXsY/C/fYn
         XIQ84UXHJqzKivc5KKonIkn79OzpxK+vyqh/CZkXteIe4dgKgji8rm/0EdvcBnXVee4c
         HH1lbWDLE7jdLnLCeRBoZHqahahVLmoNKa8/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079784; x=1783684584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gw4z7buIoW/cUS61jHzCC4K3rs/jF8wPJIaBNozTAWk=;
        b=omMuGyL5QSxu+1HA//0sMJA7USgTgt5KPeGNRdLWRnZWZrfZ4vw8bO5FpFEGAQUr7R
         xqD4DQIjlLmK3TQBwRY69sGzSmk87JMC8Lcv8gLxe917TcSF+A/O12/NjYyuSoA1Gcrc
         x/lHBB7h+0QP6MScmWfPdMB01c663tOPc/zfjrgSot4ubyIB8sGf7/SzelEro94C0qaD
         onPb8Mis6iKRwKhQtl+uCtT0ZHv6M9kn8tuG4lgOD+rN/N/KlrtElfZIBMpzqNl2iY44
         lNsRg1RXhKvQv0VQyk45f0GkJh0ptpShcbfazjKYSSXCos4ttNHUK5TCi7ZhEboXOI5I
         +DMQ==
X-Forwarded-Encrypted: i=1; AFNElJ80kjdD3bMRUcGWvzumBLNvHE4PsqIfXSrZQqGqG3W7ellbHcaS6GOeanohLu1ElqC6anusYdNuC1JAH/eUPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsmVRfNlPKLu0UrLGj8RBlmAXBTYDuFj5VC9YCyjw6v4tRE9b7
	QJFqZTMYyFcDA7LtzXromik/KAZiG80Rn9fZJoNUndoS8FN15JpHHbAps6/R8+M/+w==
X-Gm-Gg: AfdE7clvXEq7d5ZimU7yR1j3w15KFrAcYTrhczVwXzVn0BAtZGovrwVHbbMG4YyNxBM
	5QXn7uoGPKhKTtQzncmavHm2f7DcWLsQEEZjl1FgpCzPg/93AlO4DIAquvDx8CToJJcg0JBw+Lf
	iYWf+bL8hh96sLyTI8i1mAs3y4/2UXLWF1b8K2GcVpuBOBT880FtS1zMsPd6RREyKSTzMNNJY84
	o+x9Zr7yrB+F3SuLjNWTerLTSbHJfxgjjLYLbDHbBqzTREsgDg+V7Wjq0fsXNmKVLpJA1pW5mda
	TvU+NTJz+LL1fa2AGCCMyjElYJslftMqGiiPVKnyLU5BrgG49tmK8paHi8jxMsS852z+vYSMjXy
	9FSGN4aNFeT1reJGnFgfXrReDLOVfa4gQQ4nKJ7OWJ54vmx983d7pHyiaqXebTuj4nRwEaoLSbO
	e0aaNYDYwWrvlQYHiEZrFbPsnDoVMZfk0KB4uMPrBe5Vy+KQeoYFqrCICr7kPp2OcKMq+rqQ==
X-Received: by 2002:a05:6a20:1449:b0:3b4:888f:b3f7 with SMTP id adf61e73a8af0-3bfed474d94mr12242560637.42.1783079783900;
        Fri, 03 Jul 2026 04:56:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Fri,  3 Jul 2026 19:55:57 +0800
Message-ID: <20260703115601.1323491-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045624_871728_7423ADDB 
X-CRM114-Status: GOOD (  19.45  )
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

When a I2C component is found, it's device node is immediately enabled.
This triggers device creation and driver binding. The prober will hold
the regulator enable reference across this part. If the driver probes
synchronously, then it happens within this window. On the other hand,
if the driver probes asynchronously, there is high chance that it
happens after the prober's cleanup function was called, in which case
the regulator would have been disabled when the driver's probe function
is called. This would then require the driver to wait 100 ms for the
hardware to reinitialize, even if the probe function was just a split
second late and the regulator was disabled a few milliseconds ago.

Recently, some of the drivers for the component that are targeted by the
I2C OF component prober gained the ability to skip waiting for hardware
initialization if the regulator was left enabled. This happens when the
PMIC has them on by default, or if the component prober left them on
after probing the component.

Wait a bit of time before dropping the enable refcount on our end so
that the actual driver has the opportunity to catch and increase the
refcount on their end. The 100 ms delay was arbitrarily chosen.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/i2c/i2c-core-of-prober.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f274e260353c..17495125467e 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -243,11 +243,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 	return 0;
 }
 
-static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+static void i2c_of_probe_simple_disable_regulator(struct device *dev,
+						  struct i2c_of_probe_simple_ctx *ctx,
+						  bool defer_disable)
 {
 	if (!ctx->supply)
 		return;
 
+	/*
+	 * Wait a bit of time for async drivers to probe and increase the
+	 * regulator enable count. This allows the drivers to check and
+	 * skip waiting for re-initialization.
+	 */
+	if (defer_disable) {
+		dev_dbg(dev, "Deferring regulator disable\n");
+		msleep(100);
+	}
+
 	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
 	regulator_disable(ctx->supply);
@@ -364,7 +376,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -409,7 +421,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.rc0.799.gd6f94ed593-goog


