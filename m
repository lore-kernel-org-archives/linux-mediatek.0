Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24889C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ii2L9a7LgGm5B2lSyJXyTDrVlYtG8HCf76CxmpWEszg=; b=qTYvvgWXZzk1vRAxXGXw3KLt/8
	bpu/NACVOwmC2lz0DiXyS9tN3BdR/BqisTjGdth7NCwfUCibbDJElcwmRM3zx+Hexh762hN1qHa0C
	f2uiXp3d5Owpsrw+f7qUZ1g8bnBntiFM7e2ttECNuO96IKE5wq34wLdqYqfPzkQNCcp2SroXPNTrl
	0X1uzVUsJHWpbQhdiaT4jcZcevDtqCkZUnSRnKAeFr3CB6Har0J2fyoN5MMqBVbr03/63uvbmg34j
	HfKq19K1xqnPtCH65INSfmW/KGIK/BbdLTY9cBFiR+fK1FHbPqxqX1VMIxqCOE0DyU/g/jD8xYBJx
	g6B5s3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uwi-0000000H480-2rJu;
	Fri, 03 May 2024 15:35:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uwa-0000000H418-2lTK
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 15:35:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-418e4cd2196so71390385e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714750522; x=1715355322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ii2L9a7LgGm5B2lSyJXyTDrVlYtG8HCf76CxmpWEszg=;
        b=I1BtceMFQgQsmdTrsOeojlFyT8h87u8vNoybp22C5Y9ZR1EVSKTYdsFTxS5lqIdncf
         JC4iEf8YYBPcYoVrg/qMV22ay0EljBMpHY9uHwRHeYSgkoPtRFoOvMRexOUUu2qiLV3w
         x4TMoo3mzAy+8Cpzo//ps+qBfSkExKaO6rHJOMdvXunzRLH9XrHl0lfpKzLoHMYbegND
         wBBqqiZbFRKsPvltHXJKg93vGKfIiXg1gNOhEeWkOBjkABBkDbCh4zCwJyhXUcGFGd/N
         eP2/x5WF2cJG7LqblZpXTRLfnphVMqsjnx343KGqCIhY2Bl0NNJzk8f1U5Xdfa1qz0MR
         6v4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714750522; x=1715355322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ii2L9a7LgGm5B2lSyJXyTDrVlYtG8HCf76CxmpWEszg=;
        b=BWtQfI4gXw9A1zesSgg7e676G/8kFTZ6GokA6qloFdpCt7dYslIcCZAyFFVxzhMkdD
         OmlkVsezmHD914BeTU5RD4oZtusSPzwDtdVN4E3gfCVy3PTdEPyMDuBDK2ap7iRI2459
         m8MLvgeSRPZp/G7AIUQ5gZjS/R+bZE1GCTophTkutxXIe5dwCABcRqdsCN+EcuLk2Y/+
         dffvnwDTL9TEfzNSmW0IiAb9CR7gz9qUlGoMNreNYbC/Ob/U5mMcTmH7AeReeIQsOlKR
         4Rg6nrETFxBwa9qwJCymeWyRb89EWzZjnCHBTqVwqLveT1Bt03QDnEXfXunbEfiBcyBN
         1oNA==
X-Forwarded-Encrypted: i=1; AJvYcCVX/zRF24NYwCNbPHKOc6tu5cud7vphheHbx3rsLoQqcjD8jlvbqDcC8CfLVKg8UzyedKT6lZ2wGRIXYUhQi69Ua+nI4kCiTd0Bkoj7N9QwNkIX
X-Gm-Message-State: AOJu0Yw058jAbSoblZ3BX3SFGxdgtdDnTqj4QqJ4/VHfFzgKzPkk3SbR
	hkrABJUzR4Okj368d40If8Q4A9b+DijUrsags1Zgx8lSVNwsmt7fmDxqyeYoQvU=
X-Google-Smtp-Source: AGHT+IFm2aMinKAIGlz3LTlYrkDzfhhW4AooIKgnWvrQaOqMrThwAfJaBbSv81s4fUC5wecGUrxU0w==
X-Received: by 2002:a05:600c:35d2:b0:41b:82ba:7997 with SMTP id r18-20020a05600c35d200b0041b82ba7997mr2371381wmq.3.1714750521731;
        Fri, 03 May 2024 08:35:21 -0700 (PDT)
Received: from [127.0.1.1] ([79.87.205.120])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b00418e4cc9de7sm9702373wms.7.2024.05.03.08.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:35:21 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 03 May 2024 17:35:14 +0200
Subject: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Fix wrong
 lvts_ctrl index
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-2-f605c50ca117@baylibre.com>
References: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
In-Reply-To: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714750518; l=3124;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=b1HL/jZPMQHwvdCggBwYWudLG2vrv1+NFKL1uOCOUv0=;
 b=A72Gw9WaUfJAIEbb5OzwO7zSEFc7tittIF0gO7OlcYnX0Sb6YIs8fYiU2z6GTT4ehRCuZ4n7z
 ENc0i8f2dlNCwBbG3HHLq21ntVhchbfbc9kuWKwJ80892zxwGXzagrT
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_083528_859678_E0438091 
X-CRM114-Status: GOOD (  14.83  )
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

In 'lvts_should_update_thresh()' and 'lvts_ctrl_start()' functions,
the parameter passed to 'lvts_for_each_valid_sensor()' macro is always
'lvts_ctrl->lvts_data->lvts_ctrl'. In other words, the array index 0
is systematically passed as 'struct lvts_ctrl_data' type item, even
when another item should be consumed instead.

Hence, the 'valid_sensor_mask' value which is selected can be wrong
because unrelated to the 'struct lvts_ctrl_data' type item that should
be used. Hence, some thermal zone can be registered for a sensor 'i'
that does not actually exist. Because of the invalid address used
as 'lvts_sensor[i].msr', this situation ends up with a crash in
'lvts_get_temp()' function, where this 'msr' pointer is passed to
'readl_poll_timeout()' function. The following message is output:
"Unable to handle kernel NULL pointer dereference at virtual
address <msr>", with <msr> = 0.

This patch fixes the issue.

Fixes: 11e6f4c31447 ("thermal/drivers/mediatek/lvts_thermal: Allow early empty sensor slots")
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 18a796386cd0..d7df6f09938b 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -116,9 +116,9 @@ struct lvts_ctrl_data {
 			      ((s2) ? BIT(2) : 0) | \
 			      ((s3) ? BIT(3) : 0))
 
-#define lvts_for_each_valid_sensor(i, lvts_ctrl_data) \
+#define lvts_for_each_valid_sensor(i, lvts_ctrl) \
 	for ((i) = 0; (i) < LVTS_SENSOR_MAX; (i)++) \
-		if (!((lvts_ctrl_data)->valid_sensor_mask & BIT(i))) \
+		if (!((lvts_ctrl)->valid_sensor_mask & BIT(i))) \
 			continue; \
 		else
 
@@ -145,6 +145,7 @@ struct lvts_ctrl {
 	const struct lvts_data *lvts_data;
 	u32 calibration[LVTS_SENSOR_MAX];
 	u32 hw_tshut_raw_temp;
+	u8 valid_sensor_mask;
 	int mode;
 	void __iomem *base;
 	int low_thresh;
@@ -356,7 +357,7 @@ static bool lvts_should_update_thresh(struct lvts_ctrl *lvts_ctrl, int high)
 	if (high > lvts_ctrl->high_thresh)
 		return true;
 
-	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl)
+	lvts_for_each_valid_sensor(i, lvts_ctrl)
 		if (lvts_ctrl->sensors[i].high_thresh == lvts_ctrl->high_thresh
 		    && lvts_ctrl->sensors[i].low_thresh == lvts_ctrl->low_thresh)
 			return false;
@@ -617,6 +618,8 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
 		lvts_sensor[i].high_thresh = INT_MIN;
 	};
 
+	lvts_ctrl->valid_sensor_mask = lvts_ctrl_data->valid_sensor_mask;
+
 	return 0;
 }
 
@@ -1112,7 +1115,7 @@ static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	u32 *sensor_bitmap = lvts_ctrl->mode == LVTS_MSR_IMMEDIATE_MODE ?
 			     sensor_imm_bitmap : sensor_filt_bitmap;
 
-	lvts_for_each_valid_sensor(i, lvts_ctrl->lvts_data->lvts_ctrl) {
+	lvts_for_each_valid_sensor(i, lvts_ctrl) {
 
 		int dt_id = lvts_sensors[i].dt_id;
 

-- 
2.37.3


