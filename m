Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896FAC5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=; b=UZ5s1N7y+5UBEtsDyKcqdpZTmM
	xBRj1Rv5ggy7j1s4sU7/tYGCUMHXhX6GAm3EctfmEd3x5KKsr+xY5mDWaMC3t+38qPU0rnwCD4ZLH
	lAV9Bkrn+AJZzIjPwXPKVkQ5C1aWPJKR3j6bznvY/yQ0A7TkIwcfZYdk1ICwsZylilqzrMZwCgRRi
	ctargTyAh5/mmz6ciirgEKVJYZgykt0NUM9RNykbbKQ7z46/9xQE4SodYzAq9U6WEXOgd7HcI/4K6
	sTiXDH7S7ZkKnyUJdYEfvLFm5ixd1tgQzmF+72+clg6BOQoe9Xkth66pEo/h27nCfsmqlbSE4HQkY
	ym5TVsKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTP-0000000E09T-0dNE;
	Tue, 11 Aug 2026 12:20:51 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTL-0000000E06I-3nrM
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:49 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c966b9ee9cbso1940147a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450847; x=1787055647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=;
        b=l88x1R58VkI9E2vUvkIZBkm2d886qQruM5HwEbap4ZlEX9YCSzeQWomlcAsH2P9uhj
         u6d5H+ps/dmVLQv7npmj4Hz0iz6z7bXlj4PaoF8vwzaZGB5YbK3x5CFxmP3r+JbjkKdZ
         tiqu9oLwS9GT3gBWRcr9NcDC0c3TTO6lR8/f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450847; x=1787055647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AY/BjzRkfyU3t+6SOkz7/qVT24RkrhiWULr6d4aAG4=;
        b=tMyzJ8aR0GTgCAyphVtcaOFk3tSuZg6fE3HMCYpwxqr7f1+GzgK1mdNXxXxcSktwCZ
         YbbbFiHfbFJU/2Ky73feHLqw/mNYeg37w6Dg9XcjLX41eFp5bpiOLI2qR0u57Gh5NbNh
         L33dqklGAPNHIvZXp7khfOeuzp75Po/bZvtyw7D3u1WZSN9Y/jOZwXhshpLtTSwopnsf
         M6/n0Q5uq81R5whcA59UtO6pEG2fctJUtQUbNoAafQon4W4yj0dYr6ksjWJXtIze4vjQ
         nymsBqnTHfsGtJWOdcXYZcoIBVpb6ZAck+eASTvgH4OHh8PwgavcpKo++Yjp5MqdphwY
         OA4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpw4WCztyBqasDa45fVPAX8kkCqc+C+iO8UyX5LDj3SJC/bhx39uXTWmoPDDYo3h76szCsSn74snm7MselSPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqud5HmPXIE9io/K+9xUW3UJtLwrP4BQmTP8IyYLsw3JfZ2i8L
	ANwgqMUck99RylGTv2alzV3YVe2krTy0I/yWTHpBFFz5fJnvHQxipISQr+IvZmTWhw==
X-Gm-Gg: AR+sD10hy010VmD3R0PinFpFJX+uDGGe5HMqUiHdxxL2SCfXKHLN5+jPKpkczjBWeAO
	biaYN0NjQS4e1RUAlRSA9jUZVpNTvNgYIDVixEz3J1jmCTcFJEL90cPNaBJ3p1v/zsF7K97TlnT
	RpxFzcsO220bfeGulkMlL/6ZY1NkdsRPgUwpDyzh5aQP0NLxYdGXu9q8MStcPqHEr4ADk3LtL+w
	ta5E8BOOiTrs+8ACmh/Jf3aqwk9rAYqAErXikB27YoLWdPihXUIF7y1jRl7cZtgS4ZyPn0uCHnf
	ZVhdgPpNcMRF+5SmYsNEcT3itkTNDsHAuZ/ojQLSV1VHwmXm/LEgvgj1ht3qfI1RFGJXbJdl3id
	9HMSf7XrSpCxHkiDzVQ+Xj6nWK2W6vXEW+u+ub+M/XNOl6OhxrAH1Cb7+eBfo7vfbc7esotp5AK
	T8oMJA7zJaEkk0knnIDWImux1960Di7DnrDnO094JmlwFvocJCzjkgvyA94lF2mgVFzpfX6EqZV
	P+/+dQTImSN4ccgHkZkqDkGfQ5GPAB04h9PToXrKkay4Q==
X-Received: by 2002:a05:6a00:6ca1:b0:84e:89a:b8ec with SMTP id d2e1a72fcca58-84fa86ab177mr2896532b3a.11.1786450847047;
        Tue, 11 Aug 2026 05:20:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:45 -0700 (PDT)
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
Subject: [PATCH v4 3/9] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue, 11 Aug 2026 20:20:03 +0800
Message-ID: <20260811122011.3539250-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052047_954567_465C4D06 
X-CRM114-Status: GOOD (  16.71  )
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
2.55.0.679.g6767b8d81c-goog


