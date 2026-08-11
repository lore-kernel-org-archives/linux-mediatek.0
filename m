Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C223C5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=; b=ikAy7LT4iQIg3igly2Iov/7DUD
	9aHLDNtn2iXpqzI7rQfVOdhy5ZfLyMlDP9nKPAT3s5npnyrsTlC+36I75l0YartT7NWL+KVsa0BVk
	uOP23fmE5MRl0bPurw8b9zW+dX8DhOtB9igxuf3KdrU9FXVFSanU89kqXVQA/5gsvyccyBIMScFlz
	ukihHH4uQkje8AN/8RAhNgohp8qGmTqs0Ft4T22HiNKFQbj+jwJ9Paq4T37sE+hJBDuSdfOidujTE
	dTLhSX3VMyOrL88f4//oWxqAZJYCdfUwf8bNgYkmCdO/8GwCplNZEJHVs54K3TDzQnBsq0W/OEIvV
	lxxtYaoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTU-0000000E0Ep-3IpR;
	Tue, 11 Aug 2026 12:20:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTQ-0000000E0AT-0nyW
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:55 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-848643382fcso746544b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450851; x=1787055651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=;
        b=lfNAk4B+ZO32a7CMS34gxxqNOo8nUctxh68NcLHmqs0Jky+ysxtvdRX0E+zuim55ww
         EM0GuU2CdY0t0/6ivabV6znPw0jLZTyhEExyjHCjYFukCHAGbRRiV4FA1qutA0cJzNU4
         5OH856XgIlX/RwTBNm5MBIaQNS34xJDKMimow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450851; x=1787055651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GsFbGvUc+lL3nEmcNAop98oZPFXcbP5zb4ZbtxDxx0U=;
        b=tSSZLGE6dHdWn9V4CTLV4UHv4p4yeAO59DwHGVBP81P5RLkUrr0P/arTE0AZiTtcVe
         8neklDfotkFXWXZ4cWQccwUL96tGSGlDDBJ1HUOHZZ1vUi5hkzu3qgwlB1HJOkt79MeI
         W+k4fd2MgHOLG/662qL93ybI8sj58Jk3vs5yOxQuuTgjYI3vmQq48aCDd+DvMUeSZ5NY
         sj9A63wGW/ljFjPsX6OVOeXZT4+8T18UjX0ZjGM4f9Lvff2XFraORXYV31gYmv7OVnuy
         PDpkg3v83WPMuA8T9Xloxs7YT1kyr9f7WqUuaXSfZge/ECRPqWB6LAzdNvjHl069Fhp5
         ioZQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq09kEXqnVw1KCMeBt7+5mXAFIfZc/uoUI/dIkjqAN2WC7GMjzqEIHUGc0trRKYzsvy41fFiebiUnh3KzhHDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSEjCNTpN3WjYpiTBqx4oZg7mRy/mbMjiJueSeFqBcpOfAYkAl
	+TakNUTxJrMDIMgH2DeGiosjuZyTGmbMdejGTYDpR4bTl8wEGGKOGe48AAFoBpQDkQ==
X-Gm-Gg: AR+sD10JVStw+CGlY2+ZLDwbcdf+NnWaW9JG+8ROED51JOHN/yLYEcyxGkGMhU8V9AJ
	XBJmPDKgAWndqD46/K26iCiUG7x4SFxHkD2whHjMPZ02FDUvEpE+W8pB2QMrFDJ3dAfrOrGeB4h
	PpB6HbDxAJBa15UgYz0ig+NCyUKeuRHYzV0c5R3MrJ421PK8m5T4L77w2HIAnZQjx/HkH00Ey2/
	vih3Qeka0Vmldzd6x5mwreqmVAEPO7HHjQGUKWUoLEV7jMuNwz03E1e+Wgd4QFIbVs2YPTvbVpV
	H7KjqO9RVh+qnBqrMTHE2ImMpctgqIWjrzghyVAth9F58T/nSwXQoa5XiDhb4mOGSmGi2UYy2/X
	IpU9fxBV8RTo7FLibfxwsx6meBTYLCza2Qelv0vIMsgGVeogkLLRFKDtfd6CT/ag9niEqj+wBDz
	XOXSITR6ekjITHHkUw6HMWOOQuoAfqWTi7AjsV7JCWOPipg2NOV/jCu/t1njkHlFOeDq+Sto6An
	2yt/4WhqNXFKobhIrz3Uz4jQXkVNVJBSNm/HC433VOwfQ==
X-Received: by 2002:a05:6a00:8d1:b0:846:22ea:e171 with SMTP id d2e1a72fcca58-84fa872c289mr2761703b3a.3.1786450851388;
        Tue, 11 Aug 2026 05:20:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:50 -0700 (PDT)
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
Subject: [PATCH v4 4/9] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 11 Aug 2026 20:20:04 +0800
Message-ID: <20260811122011.3539250-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052052_239528_CDFB0A0C 
X-CRM114-Status: GOOD (  18.28  )
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
2.55.0.679.g6767b8d81c-goog


