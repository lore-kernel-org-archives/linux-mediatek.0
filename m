Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379CECD1297
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T1LpKFL+yI+IpX+c47vgJ/x998fTDNJ7BUtB4SB1yXE=; b=ih7xRz0tNv1LpgNLdVSpRw/1S3
	a1f2Y508LdWL/J+Y+BezTH/AtHcw7b5vxyjIoQPs93OaPYETPeBLh1cHoggdWaVRzFePg5IoZWJSc
	K+RPybkB7ccJ2XCob6HdqOroAKUQEs61W2ZWjAFtYuGM4JJWacM7Ku7jCuREkm3fwdXdN9dUDazUF
	CpByuc69OjetQ1sJfT5RrD5mDG5BNRVvcKI5IShLyfQf3gtihYbdozLMmy6EqEdMkXJbYsvVxr/UA
	KQzTsz4jo4K25f8FbUgbFIEa4nfkSdnAsC90jOGgLKIatpbdc6jjcmVMK4PC4FxzZWBSH4kASaAoV
	hNdiuFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUqR-00000006ITn-2tyP;
	Wed, 10 Apr 2024 10:06:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruUqN-00000006IOJ-0NUf
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 10:06:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso5028734a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 03:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712743569; x=1713348369; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T1LpKFL+yI+IpX+c47vgJ/x998fTDNJ7BUtB4SB1yXE=;
        b=dfGYbbcc+8+Vry86AnGcxRqorQhSGMl2d+um6mJs2qIVCUM8kNUGdxQOvHetCJOQYZ
         kDFgdA6AVnjb+ZzgAQP8iwE9bMmCFYmIZRv0qsDtWOYjsMaSyujO7udL34LwRVKy0P0V
         v3qFCA4GbU6AgdUuDJL54yX8QtKghr9AH8K5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712743569; x=1713348369;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T1LpKFL+yI+IpX+c47vgJ/x998fTDNJ7BUtB4SB1yXE=;
        b=S4lrHJP9gSUl1ACmY8wSOOEYDVj8aT8a913bDHVb8OcWolDCcLw37IjErPjLmPy0xw
         38hM32jo3PKHrmiU1CqTr5T7mZmzDPIDVfRS77n/uHtReRx/0Xb7NG65+Yve+WTaZiTk
         cOgqjLkkhJkMqT+wl059rm6ddmV/GFB/eV/vIMlFoiCR9tuWApaYJkvte14wRgfkbWRR
         INQ03NVtGVj7sP2mMuudqtwlHCEqjvr7Pe73YHHV7pCXXGKv8HlwYQoXWkK7t5fOMSLh
         mW0+k/I/OPDtvaOLMl37LXY0VTRQBJfhs3/p1V7vVZgVsM7KwUd0FZA5XO+UtK6kB5Md
         Yjag==
X-Forwarded-Encrypted: i=1; AJvYcCXxlgUy+jYdBJhegt0WCJ1uNFcytmwrxOPFqPDMyVo4dbX/o1UkOvlD4uW3U6iwPMWu/+o/LGHNs3cvuCK5qALgfGuweHnZjXZEYsHMQJTNMqxs
X-Gm-Message-State: AOJu0Yyd6qiA0SaYiIP93s4gfOeFTUTswYxKnjliQUwBUZSbzgOhSAD2
	V+6/BxmN3pykptkwqOJw3DAiyg+6lyPAqIoPCmSRsPEfdkkWfPKAuru56P/R/PVCmSSARSOtrWQ
	kGQ==
X-Google-Smtp-Source: AGHT+IEgWW/yvuflbCPPd3wcdtqJfAQHQgU5ksKHqoN0JvvBwSkc10gWcYuN/ly4S2nYghQ9sKh4yg==
X-Received: by 2002:a17:90a:e514:b0:2a2:672f:ef66 with SMTP id t20-20020a17090ae51400b002a2672fef66mr1861559pjy.7.1712743569253;
        Wed, 10 Apr 2024 03:06:09 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com (88.216.124.34.bc.googleusercontent.com. [34.124.216.88])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090a740b00b002a4ce78e3e8sm1014434pjg.35.2024.04.10.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 03:06:08 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 10 Apr 2024 10:06:04 +0000
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Add coeff for
 mt8192
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-lvts_thermal-v1-1-ee50b29c1756@chromium.org>
X-B4-Tracking: v=1; b=H4sIAItkFmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDE0MD3ZyykuL4kozUotzEHF3jFGMzUwsT88TktDQloJaCotS0zAqwcdG
 xtbUAtac9M14AAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_030615_182550_4AFE5134 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

In order for lvts_raw_to_temp to function properly on mt8192,
temperature coefficients for mt8192 need to be added.

Fixes: 288732242db4 ("thermal/drivers/mediatek/lvts_thermal: Add mt8192 support")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 drivers/thermal/mediatek/lvts_thermal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index fd4bd650c77a6..6d226c3e135ca 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -80,6 +80,8 @@
 #define LVTS_SENSOR_MAX				4
 #define LVTS_GOLDEN_TEMP_MAX		62
 #define LVTS_GOLDEN_TEMP_DEFAULT	50
+#define LVTS_COEFF_A_MT8192			-250460
+#define LVTS_COEFF_B_MT8192			250460
 #define LVTS_COEFF_A_MT8195			-250460
 #define LVTS_COEFF_B_MT8195			250460
 #define LVTS_COEFF_A_MT7988			-204650
@@ -1530,11 +1532,15 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 static const struct lvts_data mt8192_lvts_mcu_data = {
 	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8192,
+	.temp_offset	= LVTS_COEFF_B_MT8192,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
 	.lvts_ctrl	= mt8192_lvts_ap_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8192,
+	.temp_offset	= LVTS_COEFF_B_MT8192,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {

---
base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
change-id: 20240410-lvts_thermal-3d365847acff

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


