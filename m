Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A582EC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sl4qlttmKIif7Xuk+0Av+jVf6HGOZu8iMGZv9Qz/Mv0=; b=RYiTsmt4ZDYKp23a0X85NSaE2H
	MEz8n2Qy1AW6wvYZcDldtcnn+yaqvuPV00QnES4VidzS7zeFs26kMmEugPkCszvdOiN+6jBfnFRGS
	q/CipBPIV4TQ9Cy2zpPIsGmsLBMcWsjY5N3/SXMB7PEdUSEQLO+a38Pfq/zVRrvxyPwE7CewiUXSs
	OROIQaOqUtDxESFrgS/WAzgTYsb0lK7g4iE9vzeHtV/IPAhRx6jwQBmw0/v7XuyoMhgaJBM5PM9LK
	kg68Bu8srBG301N1jTErHVjH3KFIsADSbUftROO195x+LWJfiZmhl82aDi0zqR9JsxYj6DIKoVfpx
	SxT2p6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J1-00000008hvw-27Hd;
	Tue, 21 Jul 2026 07:54:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Iq-00000008hnW-3tRx
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2caed617615so121815665ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620452; x=1785225252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sl4qlttmKIif7Xuk+0Av+jVf6HGOZu8iMGZv9Qz/Mv0=;
        b=Xs0BEdJEptJh0m9WHWt0WAQlgwcLFOXAwGZY9tfdkT2p0HbFdTHHfve8YC6EM7n6Bh
         wvvXioZnMIo0lHiI68qXx+zCoB+/gTh1iEFUchONURghQOO+HpqqFVobaI8vCuWL/k/9
         nEkjCtpGSEXMTLkhMtMbKcWaQBBDvusY91pAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620452; x=1785225252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sl4qlttmKIif7Xuk+0Av+jVf6HGOZu8iMGZv9Qz/Mv0=;
        b=aK6M5gT0DFolho1AMv7bUjtAaiM+zIawgdY1hEiC8y3h5LXxSwg6CWnHIa8krlhhOJ
         W2XTdr9svWqJjtkXidzYm/zv9eRSaedMcrJVAG0AiZ8+edWR4iaxhan9tcmmGmxwnb7x
         ChVUSaQDg1G2vRbw+k/nWR+7QUV1qOsKtx7/rAGvHxlEWL7HUOV5V9TQe7kWSvHrvtlW
         4Qt0vUEgC3H0VFACLZYGnh1TjpdFRDH+ecpXoo+E3wQZ1JqLGeY352+L+PGuiLO0a6tk
         /VR6E+AcZM+F+q1/qyeMBOsvKL1ijNIqNLIHA2a5xFXSKn4Oi8jrYYtd743BxOpeFkf+
         qNkw==
X-Forwarded-Encrypted: i=1; AHgh+RqEi0kCHbYtIbPYwHBztZCS6UFJFghqbeVOFLuibFbFQiYmA5PrSsSlsYu+NqC4bw9zZYc+Z9WqKOGZsbF3nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoFCBhI42WIqMpe02+CcFOUoVepq5l73f/jhGaU8Cr4P3ZWm4b
	L7OnQOqCnTJTJaxhOluAE6Sp/7NkN6WvJaQPSOPW0/8OjSWGe4hISm01N0OQ9g1aFg==
X-Gm-Gg: AR+sD11IQMVPQlqAogKQyEz2xn8ipSaMCFzSpkWj508wbI6nU4oGEMXj6fgCNXGZYU/
	b0BgrJp2wekI3pmEdNzAJ7vMPy1vF3eTN3EZjw5z7tOH7S7Y4wCMC1RGYqX5oyc8ePQJB8b5o91
	P/rQ1oEvvrqG1UTspGo8jg2Nfh/QDcIJPqXCjL5K+/3liM/7rZKchEF0r8ObeRxjRPzbfzNzK52
	2RCnQIQcB5/CNxTrtsDBtj1fC4aFRKOkOBIhYS3xc4XyoW0Lx+Vck5srQsV8O2vs85nIHrZ9Iz+
	6BrIlnunyEaKe878eqsPnw6Zrrv2H2yapy1oIKqX4qoxd0Vhoe4xD3oXm8erw6ySLj7vu5uOThH
	Wtn5fEVOqfjr9j5JERcAbQcWY0ZDoIfk70oJUUtOmBoewIQgFbNKUQyQg4syKkr8wM3C6dBQI2e
	iWEagJztpaoq+wDlJXM3H4n+0AV+47Hsx8TOMl/8dmhFlXoJ7uqY6Hdaa29D0=
X-Received: by 2002:a17:903:1210:b0:2ce:d34a:5959 with SMTP id d9443c01a7336-2cf34a3a5eemr181108535ad.44.1784620452343;
        Tue, 21 Jul 2026 00:54:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:11 -0700 (PDT)
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
Subject: [PATCH v3 3/9] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 21 Jul 2026 15:52:17 +0800
Message-ID: <20260721075226.2347933-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005412_968615_82597949 
X-CRM114-Status: GOOD (  16.62  )
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
index 9f024a435dbf..77885930bf9e 100644
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
@@ -1250,7 +1253,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1406,7 +1409,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.55.0.229.g6434b31f56-goog


