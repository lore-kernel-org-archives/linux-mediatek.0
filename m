Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A944EC44529
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=; b=oEQP1ljXTI5StqoaU3KQkaYqpA
	3W1PxsnBVmyp299I7wYHWWv9Kp1V1cHQG56dJNhF5J+zf26E4QQoxVNV3FoNJozc2B3NseWV3GgQH
	o6RP01iyO5EvhJa1v6UQOfLxefOdRfrBfQqIhoQoULJedsC21DufC1EU9o1ta63hscc2LVr3ntkVS
	C2T4JJ+HZRffcKjdGiJfsm9y5emdJvojcYObmyCP3g0OxJ3PTpKpeytLSgqinRR/Lb+8qnWEC3l/e
	/y+dqwMsxU2rUPkxT4tsfwQICF8/75MLVQOZEwJq/mXQY+cnydxEKKz3mdcY4J44Pyug4//d5r2FA
	c1trpx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5J1-00000008hwC-2OiP;
	Tue, 21 Jul 2026 07:54:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Iu-00000008hqE-0oEC
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ceae1ed204so89823105ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620455; x=1785225255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=;
        b=gVkFrHdkaItz/zRI1gbPsQkfyEz3MvdnOukjV779Zxj5Et1o1UVJgr6I6uCeGza8Cy
         L/21MIJUiX4hvja0yI+2I10WZJ1pUuK5Jci3YfuLMI8V3WCYxt2ZBcvhclY72Ce54CzI
         gclrPypuPgm5dwxQH6YFcu8JIFO9QvZ3x2uCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620455; x=1785225255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNKmqRLcn9Q9wFj4nPUvbsCt3JMsfIzkeIOJzLyzvCI=;
        b=nGuEG8sTJvt07SsLo66AGc2BmmAO/DEzn2q6OnAQ3Q7yAcoQLFMJrnTrAHPuQU7lYM
         TO16IJ7xiTZso63tdOePyduig3GnzLFBwKRwNr0SbpcV3lSYurNKNvYlDlMeNqjR2yWh
         zxFBws3pD267wj8x7tZlhKcfSD+WCy1bSSJjSYtXB1UpfB7i7Spkv29AehGqaLMEqE2I
         G3ZVFyxMUqix5xjo1PEsj1Qw/RlQko1U9i90+EUHnha5MOgQ7sioEWKQc+YKxjLydAMx
         0HdUeBaxma2GV5W5XpGxlLlg47EKM8GjBeJrwtD0oRMa93pQQoVzUOD58MWYTUQNgyJI
         SLxg==
X-Forwarded-Encrypted: i=1; AHgh+Rqxxw62z4opYllyyBmrwXqS+ibUoFwjtNQGvzG4jYOJ42tsqhxvomJ74FXGdaMPslwSrJKJzCpAXcW9+RS5uQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzezBdL3Bpz+aWz13EiuIcfomtswm8EaUW4uwmWXJ0zsNBaysJF
	xnNVDwJJ29PJlHklwgYG9EwlubBxl4cZ2oXuf/gPa0/B8s1qlKHf5oMk3nd7KWrMonJqbHWjMlY
	E3H4=
X-Gm-Gg: AR+sD10JoMg1aIbm12mQj1nhcg7BRMh8hfXdgBO5NdAAmhV9mIih2U6AluzAFBEv60M
	oN4ISr1eqTHLHqxsOllwchsNfu/wogmJSlLf9HO7akg4rlCOhxFzRiRwR495xLUTxCQkxTBa+1W
	SpZstobWcUQbEUACptHoSAB7GFQnk6Cy8MOg6asx01Qkciw0rDwTTA/OiX6bOK+cf50OOqBsAlt
	lJVRVJ4K1x2Zt7kIfJ5fB3WVxlvXKHTY8OxP6DPzKl9eSrPfCObURj1mieipPOtnf/uYnfRh45w
	l4VDdJs60qxymOFbHdySgq83SeQHOQOzWQ8BYsHybMQAn5rK+1WCIPrBMZT/6el1i5RkIT8Cw/k
	wrgM2KxmNdbiCutqmuazIXn/wyA+erNNcwEzuglOI3E4vvma8ohGW93/tsmiqjgZLOlPX4XW9Oj
	ftr1Oy54ooLBeNWIQhicuC96dKYtvt0RVjUSeyLqOQlqB/0jiFawbeXi7qvO+P1NGM/efzsA==
X-Received: by 2002:a17:903:2f84:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2cf34850f28mr198999395ad.6.1784620455632;
        Tue, 21 Jul 2026 00:54:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:15 -0700 (PDT)
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
Subject: [PATCH v3 4/9] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 21 Jul 2026 15:52:18 +0800
Message-ID: <20260721075226.2347933-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005416_234984_35D9EA44 
X-CRM114-Status: GOOD (  18.19  )
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

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.229.g6434b31f56-goog


