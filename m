Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5A3C5B572
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 04:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=; b=ruiCneoAD8jwZ4q06U5TaTBSxW
	TT6Po/CB31lxsJKuVwopQPC3LYQamoxCOFgjFplsRHXtmS0/sCCaaf7uX8nPaHT7IXDwLad0HP+4j
	30bIWCzbRN5lT1ChDV3GhnpGawubPPzv2p5kA/piUU/d7oWnhOq4cQ/DOoTFvIZbTGZlx9QxW1ldZ
	eWwY6d3RNV4xOgsrkoEsMuq90KK5fesfYPteYGedEgXfwodGxEQnamK08PuML6DaFwxLvw7MFmMbN
	2Ohcbflg1ZGlHlZBJbX/aNx8ghCQiqXN5r30BJT2iiULrqT04QcX+tGKw0Ax/YsGaiFGHOPrPxUVi
	H1vGSnXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir7-000000008HM-0oQq;
	Tue, 25 Aug 2026 04:33:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyir0-000000008CK-2rlE
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 04:33:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5139003a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632422; x=1788237222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=ktm4MsVdGwRXIOwTw0CLzjaheURLGEkqddR8kQ49S4Lj1HKQxd6bS2P4fS1xNq0krv
         UR3hN4rFGVsIM0FUp1GvwhaiyHowz8VZ7BhkhaXjAhzFiD/8KQo/GrYYfdjkkolnxEJ0
         ylBt/XGxiSHz3lkw11Pjx6qkpP4iAoCk4qXu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632422; x=1788237222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=nPUbc4E7lCnW+ueYoLGmUeDgWCWTai9jHY87kWPNAiRVWCXPO0Cgx7Q0ga3T9qct+d
         GsW5zAkN0yrVxrmxo46gZP3e8kJVTShOFKu6mXYsM+rfpcjXrE+UkyM75cxwPb/Vj+Nl
         LArSv2tdH21w2F7GEVsHFVGUHPg3oSNjhf58Ne/x10C6snkvBjjLuYN36C2WugxOI+L2
         +LQYgUA9zF/6QyAi769SXfGUlzvnLaFNpKLyOvjrGjOeKmhCcDfEnQeCcfKcWrZ/RhJH
         wN5JHZg6+VslGSYzRm+ND/tBzQCq012G7zvx6VjOvlMf69Stc7DjysaepYtbCxiAbC8L
         6vvw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0CqD8H6inF3NimvHU4L3VqHmj0of4+8F651fSiwBVYhcaB/qgeSsp58BF8l9fla9bFUFUvf/rsPiNCoUgPA==@lists.infradead.org
X-Gm-Message-State: AFuF++lkTMN3fKoPqFxHNBnAKGoDHRFkEVO5tCEfcPEGrZwlga6klLDO
	EcqQDPyT9r1By+wNIVg5C8zdrx5Lp1msFf+Y3ppB2KZrz15vVmK6DNfhwZ0wi/KfLw==
X-Gm-Gg: AR+sD12MJJndfYTFIPFpD0eKGid9D8ncAs9+bu54212NfStnCO4etHkVyYD2GnwUMlJ
	UrKL6sD1nOPIR2TkyZBSslBoWjWFuX2xOCvT7ucvECPNzzLT6EtLc2rET0DL9w597gskFNzs9Zp
	oIMw4ObV5WSYvuAU/I6YmsC01BtgKEZeepNavqmmFfKOh/BVSbpKpOHMblJbnjBwQFQo4k7ZIg0
	zeqy/qOpNFRtIDMPykQjpzyKGwN7by0TEKGlm8JGzwHl2RkLCUP4chHCBRRaI5GG3nJVTDj0+wD
	u/0MR1w831KpfJKgjNj4o0obFpk/mwY+9SM0dnXIcHVD15nsRoy970mipFlU7shEX+qQfv2EZyM
	A42LOs1F0AEc5ggDvN+p6MPU1IC6b+iON+Rqk7McZ8Q8Z1wAsSpgzsUofyEMSku1ftn+7fdeDod
	yr8HL+JkDIZBtsxaGj2xNHfqwiN+Rqh4gY0GVdm+S2WKPEbtH4O1ru6gLV67b9iDcUpYXQ1BEdG
	aJkJjHdHCC1Fc4AhprQq79x93wZxUQDHe5sbch3FHvZAz4oT6Y5id99Gg==
X-Received: by 2002:a17:90b:164e:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395c352fa60mr48644179a91.9.1787632422068;
        Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:41 -0700 (PDT)
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
Subject: [PATCH v5 3/7] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 25 Aug 2026 12:16:21 +0800
Message-ID: <20260825041628.988369-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_213342_731486_74CDD259 
X-CRM114-Status: GOOD (  18.14  )
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
2.55.0.860.g4b6b3295ed-goog


