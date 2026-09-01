Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2914C61DD3
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 07:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=; b=L1KJkHdz/MRHrb5K7NiakeqlqC
	NWFW6fkJIGb86t4SJii5MjX4Uj61u5fPJqM0373p/YvMHRntJNOSOqlyyuAOGDWA9ki+vDAcHFAXn
	VPHbKz55qcceuV9zhqKG4VBHOkUmI/mFFFzVSZLoEla3I2tjQUuv6sDmU3shArtgEyk79EdOp4SmB
	KJsXwpXPTzbrFgOpXihd4JQhIk1gXePEyGoSfPWvST7Plz4xLiiSDaxvlYBIdTM+9phGY1Axxj2kL
	4u4Lu5PX7fC6qVE0yu0EpbGOtb7hF2YG0fgyYUIB2acTnpsrjNB3U4ooQVrGUYXX6H1Yhk71HQ2Di
	raJCkqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFw-0000000BAFK-3ort;
	Tue, 01 Sep 2026 07:50:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JFt-0000000BAAi-1gxs
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 07:50:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso46479385ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249004; x=1788853804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=;
        b=azaSL/zu9bi15PaJRhw4SZPWPVivFWdV3eJk8ezn/j1RjAxmkPktlPgpVLsBwJx6wp
         GNDmLlwkfRljikwP8lM+CKRYnx9qRGDsg8kM8kWGXA8OTwJePyjSU7FiPKrMu3qpp0yK
         c2arn/XlHHNgZZY9IJGFhNa38tYRcBfX2p4a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249004; x=1788853804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=;
        b=WjBJ4ypsK6zsSOxefU01M31v1d1zvLG31DXsDg/MpsglxGLVyydG50BCMJ0HF2oRLV
         kr/n5ZAXpqVz8twddNbZrnYrxjM2PWWy6U3Q72V8Hts9nC9pJ4RkO7D/kxfQGRczgEvE
         H7/7/f1q289P0L51hkkoB3GEpJH7tx1gOA5QO41wDCv+r0EU5fnv8bhiDp2Bil/iqxod
         8AinkOzhRAztXyBaPcdiFgsfdh61nOnzF8nVmeGa3pbcsCJVw8DwI7eZSv6t4G3NxCcb
         X8pkvTWiBsxrhZjCTgat+7V7uTSdLD+AfSyk+HI6oXNLKNcwldtmcBe/pHDgCBcza2cN
         xrtg==
X-Forwarded-Encrypted: i=1; AKwUvBym7oj9P6uWkUvJ809I2ceW7GNe21Df2I6upah96O5gDnhK+rYxqDFidQS23RWF6v93+Z+FGafPfZiNABPkUw==@lists.infradead.org
X-Gm-Message-State: AFuF++m7ijeVSPAZgj6nrC/0Mf9MF0jvHlbal9V3Jg3xmM6s5yRGcyH+
	lK+45ke7YjslS2yAFp0/afso07yIjvsBeNpyMTnOMSVRePBmq70fO3ys9S+H7ZM1Qw==
X-Gm-Gg: AYBFou1N7oEGWxYZgn9ZVi9Za/u5pfLyDNvrqdgF6NOD03A0Uz9biNRwsUySrqf4/Ot
	Y9lk3KAhUPaiV16zamHGctJJn6KWsr6YwxWk/JOVzXxFxgXc5MtWG3PsMkf86UKmdUn8P8N3v98
	ZutsS/TWaBiiBH7W2kVdsNNpwVe1J7Cs5CyCukPNG+f9B8i7F1RlJGrRE5u+8xNIq6rcBeomguH
	5imnzZ3U9HNB+TE+DwGbLyvjB8tCsCm7UPwPylw092Eiyi9tUezx2fVoIT2QimYiJiGlN9OnIle
	4Q5KFJIFQFzCpbEzUuNj4aT05r6U9EwCCelOL7gEERYYqTFYj7O8hUAH2RAurqOBX1UkVOqm16B
	IbuaFs2g0qT3Bu6HSUnzCTL6XBUKuyMmPcx4pB5duRnDqnOZp6YMBESZUZNTjIystfJrv4pPRIC
	hYYmKmc+7aJckW/kYI034ReDKzbIwF9AIwrEEeymJuRMC538FUHtLn5AgG2r9wAi9DM37KEYCQ/
	Fk0+UFFhz4CMmPyFt9LNYlmRDbCkve17R+Q+oqz6b13WA==
X-Received: by 2002:a17:903:3d0f:b0:2d8:d4ce:7e3b with SMTP id d9443c01a7336-2d95d5fc28amr40543015ad.16.1788249004522;
        Tue, 01 Sep 2026 00:50:04 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:04 -0700 (PDT)
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
Subject: [PATCH v6 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  1 Sep 2026 15:49:22 +0800
Message-ID: <20260901074930.764550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_005005_447726_9F2B5A38 
X-CRM114-Status: GOOD (  17.86  )
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.897.gb25b4bd76c-goog


