Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9289EC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 May 2024 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=odc+1s3TU5qEstRr4mHfnv2o7wrGMkD8UFQyNruiv4A=; b=I32dVL85VvfxJgcjdp2HFh0MhH
	SDdM9b5Vkn8Y1A9iircIgJam/SOjf1/keOff9H3I9qXs12FajhEYUB2aqDw7Vy3F2nffKpXHANLPi
	FwaxZ/t75p7MG2dccG7+A/iTW4upwGOuo6/TSuwjKhlqwVTXauiLOVKLIghCkJsNGEGvgdst5Nrx2
	2BaVfnGrfy/uAu3PXyrJ+ngdwbQOSzhTCFptCKX4tc3YZgsschoS7bMOFof//rkm5o+a7JZD8SW68
	D40gjFcaeuTXLU4BHkFbye5q5rnr/l/3Ja1GHX6h51IwiIBnCKx4r3lTATotnlpPSWen3LAqwEAae
	3JsMNumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7YbP-00000004WU4-3s9I;
	Thu, 16 May 2024 10:44:47 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7YbL-00000004WQ9-2DBh
	for linux-mediatek@lists.infradead.org;
	Thu, 16 May 2024 10:44:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-572e8028e0cso3191047a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 May 2024 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715856281; x=1716461081; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odc+1s3TU5qEstRr4mHfnv2o7wrGMkD8UFQyNruiv4A=;
        b=EboY7Z9yDfKbMPMDz6/E2wojIkfNK3nFfPwCJkz9cyMi4Ncm7FoFRLchbVhbL0jyGV
         /rndioervkuYDp4vhbvTpjGo5hcvBdNXPZjehqBSAS8vIRZaX7YAS0BRff6wpg09A6al
         KcVuJIL7qKb/EztyqAz28nUy2V2R0EZ6uRyabOy69rUQTqJCiEtQAKT3umiQpenpOtpJ
         BjI1MqW9cTI7G4vkMZCDEyC7/ARWzD/dTzkgKB5WVQtaW5KaIIHn/Gwsjbie1yhtatb1
         M/vzFCwsado6rbiPZJgGlWECNmeiQC9kXg/B7td4fMUwYolUvCkZBq6UX6mSB6BAYC3I
         YH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715856281; x=1716461081;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odc+1s3TU5qEstRr4mHfnv2o7wrGMkD8UFQyNruiv4A=;
        b=EmEGG+wbHExIW3fSjj/Q5sy6TQSFVEoFgIxFqBFpVuZUZZTCqiPyvy+wdsp5cv6aUC
         YWKGDeUjr6RTgIQ0tNbKGjDs2fTVOd/Pz0WaqGUftUf9VcIbjcCNO17mPEchQCxH59CJ
         V2bNNqHjhm07TuZXItW8Cr7hW3whQB7UbFG9rL2REaHs9Vuqted/59dmf0CT6GnGcOdH
         BSlhbhYZ3t9pa1jhaYx8GksEoTSAlvDuQM6x2hljbX/mTuEu4r5Ezh2VDV83aZviLs/B
         VUkHiAEgm/UW5IjufXzj3i5yxjuqloK1sjI24yjkReJ/hf6GYpLaRrZdwWsAi4r9g24Q
         LQdw==
X-Forwarded-Encrypted: i=1; AJvYcCUGWg714XwES37TjOLbnD9POCAfQJuKjPee88iwVpnlhrNmd8dj6V4XdUJ/3QXyc3ZxwSZzWo25cCPjDv7o80Pc+759RKI/Oj283QJQliImAJxr
X-Gm-Message-State: AOJu0YzoED2qTPoTKYK2lJ+CbNE9/LebDRHT90Pb9Jg9Ja8q6crhDEIY
	8EJcACVv4JA1PofaijfkQz887SZ4ODX134IzphdlCwxrLrq+YWOYv8YEXVhq6qg=
X-Google-Smtp-Source: AGHT+IGc4W9anY/Ok7tCtxfeeTNTCqptWKd1JUnjCEvpDFURgnWnplCK8xvXGfi6PFSRUHhgN9TA+Q==
X-Received: by 2002:a50:cc9a:0:b0:568:a30c:2db5 with SMTP id 4fb4d7f45d1cf-5734d6b2e5fmr10275856a12.40.1715856280925;
        Thu, 16 May 2024 03:44:40 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c322c3csm10441844a12.83.2024.05.16.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 03:44:40 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Thu, 16 May 2024 12:44:37 +0200
Subject: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Remove filtered
 mode for mt8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240516-mtk-thermal-mt8188-mode-fix-v2-1-40a317442c62@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJTjRWYC/42NQQ6CMBBFr0Jm7RgGLFZX3sOwaOkgEy01LSESw
 t2tnMDdf2/x/gqJo3CCa7FC5FmShDFDdSigG8z4YBSXGaqyOpWKFPrpidPA0ZtX3pq0Rh8cYy8
 fZKVrdzE1OUOQC+/IWe/1e5t5kDSFuOxnM/3sf92ZkJAb1diaStuc+5s1y0ts5GMXPLTbtn0Bl
 FlS98kAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715856279; l=2498;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=0Idu940agGS+y36TO2/QtyC3yMbEY7iqlAyR1r26iUs=;
 b=SHXUPUedcFXL8PeWXiY2328X9uItNmQDRG2jo5LUSO/Mu1dC5oMQ/x5QTGgqCZqa8F5RUuZFR
 QJB8iWzOZ4YD49AGKHecQBW6PlXDlNyIpx1+haBh9xfiJrWqMzqX3Mm
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_034443_855816_C403BC36 
X-CRM114-Status: GOOD (  10.21  )
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

Fixes: f4745f546e60 ("thermal/drivers/mediatek/lvts_thermal: Add MT8188 support")
Reviewed-by: Nicolas Pitre <npitre@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Filtered mode was set by mistake and difficulties with the test setup
prevented from catching this earlier. Use default mode (immediate mode)
instead.
---
Changes in v2:
- Add the Fixes tag.
- Link to v1: https://lore.kernel.org/r/20240515-mtk-thermal-mt8188-mode-fix-v1-1-e656b310b67f@baylibre.com
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


