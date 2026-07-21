Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2678DC4452B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iH2zA1ruu4tS3rL/ntmqLvjt6Xg4qydbdtr1Vk28d0=; b=oDi6q+5J4OV2mCmkvAERnBFKFp
	KOeGknaZwf2Udo/dfXKS9vEue+hXSwzTSU6E6ViVzU3c5fU3pqnPYh8HalH4nTKSheMUTQTflwjHT
	kTJvAvg34dVt5A6ECmEYe2MqJr3uQH1pR6fhg5YsYtNBvJ+VaP+vWx7Ft2khvXk3POJJ/5718HHYh
	g7avMbOcUN0yx8DcE7JeC4XsmvXu+FCjROd5TFu8BzugMsYTBXQ2KwhWNzzGUyBQA5Gh78nxjOL5t
	3SkJIUjnSdLbKjVXcUPMpIPXGnFi2HSy2f/LqNqZKBfdfl2p0PSkeya1N4nZcL+wr/EbEKbVNABo9
	3zVZ0ukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5JD-00000008i9L-0Gql;
	Tue, 21 Jul 2026 07:54:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J0-00000008hua-3WY0
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cf52d15d88so25884185ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620462; x=1785225262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7iH2zA1ruu4tS3rL/ntmqLvjt6Xg4qydbdtr1Vk28d0=;
        b=GLfabADQQ5EyRJxonW3OJtTeIhJG5cBpx5gHQjqjQUxTeDNPohOQPWDLgVBpyzGlS0
         z2UCiW5MMAaAXfDbSMf5b7YZ5JASSoKfQqdEWBwkSEZozh6k5oP/f1ig+kojZcdQGVa6
         ogq9+im/3eA6JQpBADA6F6BL6cHMlhjWE56lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620462; x=1785225262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7iH2zA1ruu4tS3rL/ntmqLvjt6Xg4qydbdtr1Vk28d0=;
        b=ZYBNzW3XWuaJAHWdUdld43i39VIIsi4Ncj6lUIzNUmBZyptR8ja+NWM3KJPcJi0zdu
         cdfM2qXAKGUqr6OgZdDRifUsdu53+5NVoit+nOVHp+l9FT2qE4JnsUKtbl8DtHKgfOcl
         si8zNobuxij7597KH1nSZo3SkFRMSBAvX8WhWD+cnqQgs2M3Je/6jODZ2x3W2O5O7cL0
         TPPPvxHG9VPYPBbqZ9yvXXRxgBrSY/WlJsg/DVAuAKJuV8csTthsRlGR4X2yph5tR1+y
         c7GN6ukWLtgbxT58ui+xvCl6BYwa+qmeKdDLVuDMEZVGtcdV7q7pwNFK2DIqWX/3lLSx
         BojA==
X-Forwarded-Encrypted: i=1; AHgh+RqHFKka34ib2D5dBRL4anvVBE8U0/GgzUd17GUhkL5lOqaevScG58Wt5RNEOnrXf5Q4wdRPVBfQx/1n7GxgkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywCF8UbqUAmrPbICvjG+7b2KXRNNv52uL6waippTJMz7ObniMW
	GY+FsNUDgfAb4/EQohRvmFSlRLLQYDsc0/axr6NF2cSuHMLI/1jf4iQnmxWjtPXuxw==
X-Gm-Gg: AfdE7cmtBe8KTznj+D+BXyZKAuNTOIeg+a9gT7bv2gjI79irp87aqrK5ddH1Z3/3oqd
	jyXgaoLs7EBeUl3n8HBC0PfAMH5cW2temqVJ2+YBMmXwQBmFzejC2NABSoVmqaDWkQWgoIS2/Rm
	gbWETBlv8ZTTWl2ddCjc8750XcSg/3BMDQGWUpAvBlU9v0afsmdswNk2qPKhNyVrfPXYQw5rSMj
	WwS2nsGx0CK6pRI+9k2ztWFg1L4ZaGKEDLKYmf7b2r93t6B1YHdDS2ed6ZCYh5yXWZe6CyFFq2E
	qoPucQaag2yl0qN9tp1Rjz3/eJJxLB9dnyrrpunb+l+9biGGJKZ8m3k4GdVyL8COi2il0zxkF6U
	vvobptsCvH+WoSnyihcd3MKyjbi7EglgrLcGfloYp9i+qKH0H6jbY2Dih8bg23njLzpKES75dJN
	8D/d3IJDJRJTbutYO1tGupn3WwEaHOAdJLNQuxy0csTXoZj48AxW+VjqaxU5Y=
X-Received: by 2002:a17:902:d586:b0:2cc:df15:91f5 with SMTP id d9443c01a7336-2cf34a2a314mr196331925ad.44.1784620462223;
        Tue, 21 Jul 2026 00:54:22 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:21 -0700 (PDT)
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
Subject: [PATCH v3 6/9] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue, 21 Jul 2026 15:52:20 +0800
Message-ID: <20260721075226.2347933-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005422_894848_FA15A038 
X-CRM114-Status: GOOD (  19.61  )
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
index f9f3c0ef93ff..68c929b16b06 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -235,11 +235,23 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
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
@@ -356,7 +368,7 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	return 0;
 
 out_disable_regulator:
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, false);
 out_put_gpiod:
 	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
@@ -401,7 +413,7 @@ void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_put_gpiod(ctx);
 
-	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_disable_regulator(dev, ctx, true);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, "I2C_OF_PROBER");
-- 
2.55.0.229.g6434b31f56-goog


