Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75EAC43458
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2026 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=; b=mRx3xJ8KepifILCu/tYfzC7Jb2
	5EKbhymz6lImQP8VurauX0KZcowUQcdGKorh5kFQ4iszb54FqjIO6ya9pTq4s7MfFEqFLxDVQ9uCL
	76qGHNiE7HIjI9c2nFSeKQznppL9DmtPqbaEFRj3BottJ4FjFasGDlOSTUONpc++MMxfPmCzDgS9P
	NBqM9hS/EAbHlhHgqNbxBPuAVelabZROHJ5L9ykLQ4dXgFcTnk1q2eufIEcqrnUF4BnPvqVoN9Fkl
	4oIFEQ3xH+xeJnMKoTvlAmWMWgZGmHS/UqUFZK68sAH6aa0ZVOSRW2vHSbQ5alO6HxOPcmzNzjgpF
	3zndtYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVK-00000006rkS-08Bt;
	Fri, 03 Jul 2026 11:56:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcVG-00000006rfF-1nLk
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Jul 2026 11:56:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-847aebc56b6so373707b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079777; x=1783684577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=WrQHosPwIyfZD4Jv/iDebZM049BGmT/xQUJPEuBh/4PNU4LIx5OEAImX0Ktx56HxUQ
         VDScs0ElKwbewH7OTwoZIJnkFSC9Twi+1z50nEm9GZZy/talfYXdPTeBT3qiKI2ZPkUy
         AL9lnC5IqvR3oxJ1OW4WUvU+v12Wtjn1dmuZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079777; x=1783684577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W1Qi7K0Q2jUkzExsWzvH+ABdRL+B0DFQxVv+X4n7A58=;
        b=fCkjnlfSwX9YckWlP9CdiASQUfuewehmXSvlwCxmop5Rc5Opz0LOINnvxgs3zmWXUL
         ndw6ttrvfIZ0xerGJp8BSFj72MK6q0OU0SUI8sXj5xgJ/+omp4fURMm2LYZetxo2/F6f
         p/5/GI97VZA4i/oLV+2TmeO3DdunY8QQ9+A23X0LGuV4UbxFw8yHWw7FZX87tluelpC4
         gkCPKT23sZV1/4wNmV/LL82LE7uxS2jyUXNHp/U09KZ2wpn0RMRDlDRD+w+DC3OuW0sW
         4nnj6FJTFoFrJskTBuHOeNBGItIslL8ZtERF88p9jZU0NI/OGciKmGetn5oy7eJ2S3Yb
         TR/A==
X-Forwarded-Encrypted: i=1; AFNElJ8Rdb6S2tV8yvZzOUe4Sq4Y4it3QX6pp4oFXQMBMmyS+TuwaYNMJml9RjodUVbhh3w6QXgANu5eRmpy11XhkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+rTcEnlorH9JTslHvCmtjBTPQr8TLvWL0HIqFZjB8iaXzkKqP
	RtHCckAlXTPgwNQq/TryWxqkXzlzSH2zIcRu3/AY9jxLOZ2FMN14fPeP6okmzlOMbw==
X-Gm-Gg: AfdE7cnjsLiQJ/M3ZfjUD1B5MSFShLL9Qh8v9O1VNU33F36/fME7z99htmicRIIC/me
	LSF/+mhPlfjOo30gPl9jsmWGBvsQfZp3AyNNcVfi8BUjwD5vVk9zsfjsDAD6XDReibMlFcJPfo8
	dzGLzKj9H5UeqFrk/07biztPoSFSQ2MiKqR4KRdX4Do6KtKA8xf+YrXTjmYE+xI768Wt7XA9rUy
	U0xBJv6gOxGTregsXWoA8Sz2NLjSCnKwB/sl/tXdJOrLghNAZQS5S6LjHnv/tUUXZ4CTYW2EBxx
	YaWx6xKD1w8wv5qP7shBXqlQRgo9LhZrjmSN2ztbBeDXuRCzNSm6aIoeZjJ01USPenShNINxCLO
	IqfpkDL5U6SozxeY85UUplLlhcDQY6WFuQ5g0aO7Vva+tdcF35dpN4K5DRXTJKLLMuG5EbND8dg
	xGn6xMFrwsXy1Hig7j7vJ+2aTzoSFtbiZhtV1Cz+cVdhCdf4j4phOWPf26LszjBUXMvkuvvBLjy
	wSooXhx
X-Received: by 2002:a05:6a00:6ca7:b0:845:388b:56f with SMTP id d2e1a72fcca58-847c08956ebmr10321332b3a.40.1783079777502;
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:17 -0700 (PDT)
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
Subject: [PATCH v2 2/7] HID: i2c-hid-of: skip post-power-on delay if already powered on
Date: Fri,  3 Jul 2026 19:55:55 +0800
Message-ID: <20260703115601.1323491-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045618_533199_DA7D030B 
X-CRM114-Status: GOOD (  18.20  )
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

Instead, check if the regulator supplies are all enabled, and skip
the post-power-on delay if that is the case.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..70afdfb207ac 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string_choices.h>
 
 #include "i2c-hid.h"
 
@@ -46,8 +47,12 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 {
 	struct i2c_hid_of *ihid_of = container_of(ops, struct i2c_hid_of, ops);
 	struct device *dev = &ihid_of->client->dev;
+	bool supply_was_enabled = true;
 	int ret;
 
+	for (unsigned int i = 0; i < ARRAY_SIZE(ihid_of->supplies); i++)
+		supply_was_enabled &= regulator_is_enabled(ihid_of->supplies[i].consumer);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
 				    ihid_of->supplies);
 	if (ret) {
@@ -55,7 +60,8 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
+	dev_dbg(dev, "supply was %s.\n", str_on_off(supply_was_enabled));
+	if (!supply_was_enabled && ihid_of->post_power_delay_ms)
 		msleep(ihid_of->post_power_delay_ms);
 
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


