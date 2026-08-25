Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C5DC5DF81
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 04:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=; b=Zw9Q0ipcvY3MQGPdGNr7e5HJBY
	M7GGoBAhHakkZSqZi1c7hyKIvT7uXd6W6ruzazRQVZKoLc7BnyQhOcxRszsmg7oIsqgnhqIX1fiRj
	OpUDpJOVHy1Skr34tTZ2IOgaeMXtdvLITgs2J1JH/cFZ1oKZsa1W4I9g1beALhg1SO5wbl8utuTmb
	+6pjcobCALggsqpamE87tROjazdzvDPOtRrNqqGFNNMjxODZbkW17MqWo80GQUDtKWFVcmM/9h6ZJ
	y2e5DAiQd35kNSnUAgnnvxJAyPdTuJngzptRe9XCqI5J+EW3UoMvlq4PHqR8oKUDMfR6Qe7DGiKKE
	5ECwR7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyiqz-000000008Bn-29Ic;
	Tue, 25 Aug 2026 04:33:41 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyiqw-0000000089Y-3PrM
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso6057372a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 21:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632418; x=1788237218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=;
        b=AHgq5PyCIsj8qOdm8OcMVXVdnvcnjYWJYnrGOUug11XE00eoL12srlxZrBT5aigXiE
         1G8iGo43tTuMEvyEI6nAMOW2vf1s1QwQpyZ0WTnl6ufYCo/oVg+fggnxPKASGGKFYcJm
         RTHGvTTmTWWxG05b3wJCbUAd6ZvuFq342N9Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632418; x=1788237218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3x3zvQVHa95aIkNqH4RuqCyE87uGo0+4gPg8D8l4X4=;
        b=VSB5xBUDnJsm+CMSYP5DCirYYlkXBB0Y3j175pnt4XXQCC1XULT+5lbH4XumS9PEyu
         FJDejABVIxSXa0dyXwSAQfo8omOk7q2QSQVwiCtn7oPNHlPfignNPsZgBKTvkltVkylN
         y1h0Bz/uHdd9+b7mFGnFpp+kLAg+qJGDRcqiP+Q8pbS+Z+TqXN50XuwiXy5AbMDiwUmO
         +USzXHOeVgMHwaxAkHJRhqalvR1Z3cD8Ei4kHJqiqkejrW/fHDJusC/ED0BbH4hoaRwi
         5XWHRDxvUov06izsetqKI8BT/Ph0KU+HIfhqLoyFRb46AkpxkZXQkY8rDKIzFJZwfB1Q
         427Q==
X-Forwarded-Encrypted: i=1; AHgh+RoIhmtC/9A4HzIZgEo0AbCtYKAptfPw8DrXmSjhq5hUfZXHHbMQiuDhU+0/NhXU9rWJVIm2NhHpimIxBZga0A==@lists.infradead.org
X-Gm-Message-State: AFuF++lBiNJ0+5oYCS2tarxkCCOJmUg25rEwkLdyOKOtsn0M6/aOFQ3b
	oewfR2PphjxvM8ESAVACjwu1Gm5VwZ5eCJ/zf+mesql4UasVV7K5YeFBoj9bxtlGxg==
X-Gm-Gg: AR+sD13HkwNZ1aghi5EBTiezFKZ7JmHq7YuuZYhQJpC7k9EMhmPmLPPu9zxdehBPRUy
	DvnMORuQg45TP+uM+R/x2GPnEKfJy9MjyoZcbxFv/0S5zRQRCPs4km4Ir7wml0xkKWhtjLQe7Aj
	acSV7KJAcjtIhCLHQc5Iwdyi6dUFb+O2OUFF0nnSfWel41Fx0i6fMazXxjgKFd5GI8ZYlsGzi/J
	k24auVCQJhAai3mcpWhFyiiqW+Yx2vdcynopPZm2zCoWUVknk7S4G+v0gJvXmS7ihDG6o379U/O
	wyWx04QUSO04m6AFEgyhUcT9a6Dg4YJyCYohpJIAqU9RqENzLo7HUhTymbWqV9909/xJFpidjNJ
	saAhgpPdCV65BA3dBHU+Aje9V866OACtC6DkGLB6nW0JwKd5R2bQeG6OHaIofZqOThm+G4daeYY
	QhDS3vtU1lZY5imXAMM5JJYHqCrTR969edHQNjvu+HnhYb9eu76Uo1+VBtfWQcCTOtz3O5Q1EjB
	DS+GsPoohNBk7CbP+hrdj8HijCyUui2KuazXYu6zTQhtMs=
X-Received: by 2002:a17:90b:574f:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-396463f1346mr8081145a91.8.1787632418173;
        Mon, 24 Aug 2026 21:33:38 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:37 -0700 (PDT)
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
Subject: [PATCH v5 2/7] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 25 Aug 2026 12:16:20 +0800
Message-ID: <20260825041628.988369-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213338_949031_E352E48F 
X-CRM114-Status: GOOD (  16.49  )
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

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Link: https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.860.g4b6b3295ed-goog


