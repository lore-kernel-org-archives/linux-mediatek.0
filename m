Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311C6C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Lm+V4MOHLjpwTvmluMGIdUeu5zSQz92EjZA+xk1shE=; b=q5NpPOv43OrMQkpsOc0FZC72ro
	wF0vvqo8dSIJFB/48R+LAHNnrAn9dP0oIn4dHFxdW8Dx6TZywyNaAkVFP8lD8zPLlL3FD/dCrIx8Z
	qADljQvOhb0I3ZIFpAZdnbOTsHpUUxcHHRx6AQMn5J9mKLzPNi39PaMiQLUlV2nx3DAy7z00qKzBK
	Ziap2Fph5KRmbbdgalrAC+IYbM/yRizoXZFceU3TXkOiRdfHVuXJMKC5EtBPoKHH1Ty9jQ40MaOSQ
	lbD9cmYoIlWF3lTYjtGJNSjFfTNCWmS/P1Oxl7XvJWfh9dKCob+Wpreh1A+wys7guLL34gHI2FQc5
	uKKnAf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7GAS-00000001tcn-0Hdi;
	Wed, 15 May 2024 15:03:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7GAI-00000001tZW-1VnR
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 15:03:36 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-34d9c9f2cf0so5866592f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 08:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715785407; x=1716390207; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Lm+V4MOHLjpwTvmluMGIdUeu5zSQz92EjZA+xk1shE=;
        b=x3S5RdY1VUTWlhB2EWIpx2h7xtggzCCU+Pzj6rQve5meuJiJ1Q/DcbxR/WIwTq4e1G
         u82rsPuN/B4Wg7J299ir7gEtKdJnsNBp0h2EH3ztGFPErAc6tegO2LW+Ch09TSCirIFB
         wqJVjIjDCf8eceS1XptlgivB1v6ZTl2Ps07uLGaJD1izMu3edw33imGD+eZP9dr5zBPU
         F1zmUhLicFqOlcGTlRS68ce+lrWMK4z0U5jPjZLYG/8csPi0kMDLa8BUNbdPujK5kXFx
         7jokj6kw9FljB0zTjb0j4TvddDDDFnjM/q7gYHrWmOH0+qm5ZGacqEpVOJrceCGxv4fv
         H51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715785407; x=1716390207;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Lm+V4MOHLjpwTvmluMGIdUeu5zSQz92EjZA+xk1shE=;
        b=a7umUdNnR/fumc7UVvRHSfCg58o7z2rtl1UVGKpTB0RGuJyQ1R1qiZyGTZWPFTh8D2
         caIFK7fcVUr5Pc27HtZ3kVBEXOhbSfmJ7bmJy8obz4SvqrUNSaWSG3sy7P+wVRlhvfvD
         tm6+CSRfqRBwCGHYlnoQdET41ZjAW/9AKaSEAoK7TIyW35qpiV99N70x0BOa73e5r63v
         wE9OcMqfE9B9WMDFqaVjORaKY4492ABb84j9ppKwbNocxdfLQe3g+2BJHQFYlHzt3FeT
         wqiYwNbvabhOTwV8GT8HWMsUPMCFJCxufzIchzZke3ISLwXsSt4LtG35lCCLRDAeVWFk
         mfrA==
X-Forwarded-Encrypted: i=1; AJvYcCVzMAdEJzvtZgiloMO6l/DUR6PXpjdb/O+dFlIUAIXcYN7ByVHb6bCcE9oZvqwpHkwSZ0vc+cHzrvP76Yr6sD9HVK23W1VpILOoX2ClaEfWOzf/
X-Gm-Message-State: AOJu0YyR2TUyHv76EfvnmdE6EO6xyLX8ZqAwGY4wcst34FiGh2QxzEYD
	Lf0ae9M+XTLGO+mukrwB1oVMSPmFZpn3St9aZZ6f4Uv/Cjb22dVfcr0tBwpQ5mA=
X-Google-Smtp-Source: AGHT+IHFvV/YKUp2ASUsyofDT+uyThnhNn6z7AHT8eX7ShpKC+KLWTMhMTmjH/vu1Il4PLMLegu1Zg==
X-Received: by 2002:adf:e788:0:b0:34c:fd73:55d with SMTP id ffacd0b85a97d-3504aa63499mr14009742f8f.70.1715785407436;
        Wed, 15 May 2024 08:03:27 -0700 (PDT)
Received: from [127.0.1.1] (abordeaux-651-1-78-161.w90-5.abo.wanadoo.fr. [90.5.97.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-351d21c8106sm368310f8f.60.2024.05.15.08.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 08:03:26 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Wed, 15 May 2024 17:03:25 +0200
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove filtered
 mode for mt8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240515-mtk-thermal-mt8188-mode-fix-v1-1-e656b310b67f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALzORGYC/x2M0QpAQBAAf0X7bMvi6vgVebjcYuPQnaTk323eZ
 uZhHkgchRO02QORL0mybyqUZzDMbpsYxatDWZR1YchgOBc8Z47BrcqWrMWwe8ZRbmRjK9+4irw
 j0MMRWfN/7/r3/QA8wb3LbQAAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715785405; l=2130;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=srhSqcE057PYT8XZgoL4eiPLut1PLIps2HRV2s02uPs=;
 b=P6zbORiYNVpAHtTEViYts3RXJ33FKGxDpNyirArfqnQ9wqgAzgfM/pAZmaR+Kyl+pwyiMRTwW
 7+RPG0iDXfsDZfJk/djBA5pcqzd3ftimEDK5ts4vW1hDgpPUDiqOnCi
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_080334_431744_98B41EFD 
X-CRM114-Status: UNSURE (   9.29  )
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

Filtered mode is not supported on mt8188 SoC and is the source of bad
results. Move to immediate mode which provides good temperatures.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Filtered mode was set by mistake and difficulties with the test setup
prevented from catching this earlier. Use default mode (immediate mode)
instead.
---
 drivers/thermal/mediatek/lvts_thermal.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 0bb3a495b56e..82c355c466cf 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1458,7 +1458,6 @@ static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 1),
 		.offset = 0x0,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	},
 	{
 		.lvts_sensor = {
@@ -1469,7 +1468,6 @@ static const struct lvts_ctrl_data mt8188_lvts_mcu_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset = 0x100,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	}
 };
 
@@ -1483,7 +1481,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(0, 1, 0, 0),
 		.offset = 0x0,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	},
 	{
 		.lvts_sensor = {
@@ -1496,7 +1493,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 0),
 		.offset = 0x100,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	},
 	{
 		.lvts_sensor = {
@@ -1507,7 +1503,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset = 0x200,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	},
 	{
 		.lvts_sensor = {
@@ -1518,7 +1513,6 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 		},
 		VALID_SENSOR_MAP(1, 1, 0, 0),
 		.offset = 0x300,
-		.mode = LVTS_MSR_FILTERED_MODE,
 	}
 };
 

---
base-commit: 82d92a9a1b9ea0ea52aff27cddd05009b4edad49
change-id: 20240515-mtk-thermal-mt8188-mode-fix-e583d9a31da1

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


