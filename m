Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5316C5CFE7
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vW5QGWu8BTDFFV87gdYCqNM0QrJMO5Ieo8Go/wJMx6I=; b=zi0iiINVKl9Qmxf/rPQZPnhmCV
	fbuiWH/lMYUs2fWtJ5t+vRYHdXYYoIb2F7rcmDk+/aqzIZaFULEUCl6D9iMOQPiJlBPERhoqcBsKZ
	nWUdzLqIJ1/iXU/Fq8rZ5rSQzqmt1mHvdDWkaFrQhPGpAqHmuV6A/G2pEcbIuDVK7OYBT/rWriQXH
	hDTiVPhAeRz3mnwu1CxAS8YH0BMtzae0lUggTKhIyD2yho3WfB5AilXSZYJN2eaYcbNzf1de335m4
	M07UU6kPRQp/mwbro7LgzBM9R6Tw8vUtur2e8NCNsjUWb/m2qBWnIDQPrMc7ciQFHydr/UBdv3+gI
	X/6/BJYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTv-0000000E0XW-2L0Y;
	Tue, 11 Aug 2026 12:21:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTa-0000000E0Iu-1Ywl
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:21:10 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3037035b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450862; x=1787055662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vW5QGWu8BTDFFV87gdYCqNM0QrJMO5Ieo8Go/wJMx6I=;
        b=Gv7nHl1BmdHfCp4+IuzmtEQ0ar36buUcAkO2Fkj0n/4tHr/W9xs6XKgLCokKNsYzMG
         MlBFoLnuqdk2UmYTKeYShlBTVLHkaoz/di6HbAqRXMJEzIPJeueP7jW9MPhgBULbRyfs
         NcuPU6BKU2T/frbDXAihi/hjWNmNVwRIKl8tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450862; x=1787055662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vW5QGWu8BTDFFV87gdYCqNM0QrJMO5Ieo8Go/wJMx6I=;
        b=nCTS3B6zVujQQ9SkC4T4gJ+7FrcLzzbCfCFp2RSgMwTLZXoh1CZ5URhzww3y3psfnM
         Yt9yK/DDCqRibIRvT+Epp778Y1SWEZTli/MToSXH5uHvBNGSHc80qumtnAfEbDl/UClb
         1qNBKmapbxuxsue77W1YDSF7SUxoC8fLyfbUDW1xMMzfuQ6bYbIC11rcgTihH/kdz51A
         MlDgRNZqnuKxfX9oernYrgSPnStEU9jSlUTZlPsfCXya3UlkRq/cgMnny5fFoazsWfTO
         v//uYUIcresGtoFdgcFVGnd4qcm2kH9sG3p0Ojh9k1NRW+7uV8t860A1OPjBXX4JC6mW
         8FRw==
X-Forwarded-Encrypted: i=1; AHgh+RrEq66qsqJd9YNb9cX5JoCXT4k7qdrTO40evNAvyi6Flkpg7rDhz+fyQRlaCvs8SpH6bVjAVVY3EtmRzyuz+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr2HTamhVtrJLjBet58sDa81jduJgOfottGCM8gCRozwYZFveQ
	0O9eEnJwJcqPETan3s0qr8LbeyUZFFP9czYF6Jh7ACunGDMAI4XW7bQvAZJMV7+6xw==
X-Gm-Gg: AR+sD12kEeXOHw6l5aSQAQKKtlzkHBAXfT/Rz4q67lWQseOhBInAzZiLZn49v6iSkq6
	6mWqy1O1Wa7mLzbU2ehlwldXpI90G8O8UsXSS2zoqV2AZKaf94y+kJmZW+DQolTSw45cT0O5C8j
	6M6H8BSyHvko4TydzUVzpi5Ab4w7Hu1KK91322DeIMt4WhTQ0rv5WDIjD72sUpNR3cFCGFwXtC6
	/KjCa16RdqJLx1jwrCjPykV6Xyn/ZK5/ntmF+34wANgh2VDiKRpNT0AENNFQ+eRgao+bysiZC9v
	qTXmgcrIXdu+64bNAF4wFcqkFwgENVx9eCy4ggAXZXRWUsJZUPX4I8KvLbhcfnuM/ORtsza3Qso
	5s69TqRhJY3USHqkcrKLUs12JeFUwe5FCf80jG60X1EU11bHJOPk9usbi+T4HlPIQ/uOz5kfsBl
	ee1T+cjgB7ZEBubrNEZOa8RzKCx1AxnhGhMZQ3pqKoRX/M9FCWDMBnuRDjdSgqo/j1ISJcYMqYF
	XxIfFZeYNv8p+x8sQWnOOKxkz45NMEQ2jcSpzRsnIRZVQ==
X-Received: by 2002:a05:6a00:e1b:b0:837:f79d:909 with SMTP id d2e1a72fcca58-84fa889d2a0mr3074138b3a.39.1786450861717;
        Tue, 11 Aug 2026 05:21:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:21:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
Subject: [PATCH v4 6/9] i2c: of-prober: Defer regulator_disable() on successful probe in simple helper
Date: Tue, 11 Aug 2026 20:20:06 +0800
Message-ID: <20260811122011.3539250-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052102_806272_62D1272C 
X-CRM114-Status: GOOD (  21.15  )
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

Tests on the Hana Chromebook showed that if the prober and trackpad
drivers are both builtin, then the time between the prober enabling the
device node and the trackpad driver asynchronously probing is between
5 ms and 30 ms, though sometimes there are outliers exceeding 100 ms.

Wait 100 ms before dropping the enable refcount on our end so that the
actual driver has the opportunity to catch and increase the refcount on
their end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Added commit message section showing average delay needed
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
2.55.0.679.g6767b8d81c-goog


