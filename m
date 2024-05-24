Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D9EC41513
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5J/C+IDybR4omqOS9SfWx1Ek6B9bW0Uauk6Wgutzds=; b=bf3GDCNGSZcLp1k/7QX5nbe8IO
	X49+dM7fYt2zQAdhlvaAvYu18WfY7/yFSwz3/2VOIWjagX4XeCZnVn6orOOiUv7kfOS7c6YwOhJm+
	hi5zlH2jBzWF4PRkLeLVJUcWqWMdEp5/d2icJVmPlYJrQOfFiXKETyWG9/krL0BcVd0BAR4Mdk3uZ
	WwRDWYgsUDrNBUlhmWct5yh1KUF3T8Q/tty3aetl55f6GXnLpYiAm8ZDvKPhB8Q1ayA7TzuO6XiP/
	uTS8IS/AmxKaUxkE9wlkY1w6HyqnaPCJB+lLzujjVaFAnMTCKqr2KWoZu0w+jx3b4vCQiXGOD/IxC
	Xof3+Bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQrM-00000008T4o-2w9G;
	Fri, 24 May 2024 09:05:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQr1-00000008Srk-2xSk
	for linux-mediatek@lists.infradead.org;
	Fri, 24 May 2024 09:04:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-420180b58c5so27649725e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 May 2024 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716541485; x=1717146285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5J/C+IDybR4omqOS9SfWx1Ek6B9bW0Uauk6Wgutzds=;
        b=xTb/X9sstoFn5eG10JH+IJ9dplAZKxJkX0N5ETOWDq1EpMB6yjLGMjeBkWu67U7Plp
         tpejrSqLCOS51kyhlpJus4QDnokM7GZCFckx/yqnRLg5jKya8+0dciVyzdrhVcEUCdRH
         LrPa5F07llnl0byB0Z9es2jJl5AFVVkJrRxcmpnUOivriScLhMou6VLyij8XZrp1hWBz
         u5jBe+dA6/Gbn0n0B75e7tj8UewVStZyGQaUo6+usKR0WLB+qQ4tq6eEHKKaIbHkknKl
         RNKUIq0A86ra5jMhYfENfuu1VRfK4bVTrtiKbCMdKxGhiXXO6EbLYrMY5dRfGUXe442G
         B2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541485; x=1717146285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5J/C+IDybR4omqOS9SfWx1Ek6B9bW0Uauk6Wgutzds=;
        b=mloBa9y5pCA3KteY6suuIDUSbGg12806CTSaVkdtt3tojQWlMjMHD92eD80Mg07D0T
         sFqE9SrgF5ZqaHwJtXwAzxBuj0CH1MqGeO+SJU8r661pEObmfAccvfdEA+DUSPutyknX
         Z2M5dCBbC8UHi9pnHegs+PGXpmXnSR1ofGCOq79pbkdsKvSkaQFJCjSUxfh0DherreoF
         aQ+UjjPywnIRlfvTF4Y3UQx79Q8/GsP0cJ7OwHSc9hsi897+hy2Uzd5AgHypDsGk5vPJ
         ptN6ELeFah2h7FyorqXBwiFMBCPogMPs1mOjvJBcsQ/Li68Xnt9blYMBggeeTqbhpTTH
         XOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDXq/Aj3UcgYVti7nawOryM7JXx7wwAdo4sKXMJLOwagNVoCvM263u4KqAbLY1kRBv8+4UVtROUQS8qWxbTHyTL/hYy/91xnHHjGyswQIG5Y1K
X-Gm-Message-State: AOJu0YzYkptkg3vtBP8vF3BqGgnv4FuotM5wJJKpPd0tw+jyL53lYcYt
	VAFeBex89kvVG4rYWPTrEbV5WuelkKz5z4OdfMU/QItOHGm9FPKch5Q6rd0CeUk=
X-Google-Smtp-Source: AGHT+IHUDDoW9rQJTdAgLqeGcCRmeKf1PaVW4qpC2XoxgoR1WBGP9ozRpfaWZIwylY04deonHSWDDg==
X-Received: by 2002:a05:600c:19ca:b0:41a:3b7e:2235 with SMTP id 5b1f17b1804b1-421089b1b42mr12560065e9.5.1716541485147;
        Fri, 24 May 2024 02:04:45 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f163a8sm47273045e9.13.2024.05.24.02.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 02:04:44 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 24 May 2024 11:04:35 +0200
Subject: [PATCH v5 2/6] thermal/drivers/mediatek/lvts_thermal: Use renamed
 thermal zone definitions for MT8186 and MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-mtk-thermal-mt818x-dtsi-v5-2-56f8579820e7@baylibre.com>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
In-Reply-To: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716541478; l=1639;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=qOE+NwNH35rMZqPs630S3yw6fUABDjCAXs0E4TU/Lto=;
 b=rwZi7ol8l4OofuhfkYL6KEqAIXdExwo2d+8HZov5y+dHbOYu64V5flumGoI5gw4dW+mdzQGtM
 FSxO+nrBjttB8WDBGhUChWjc+R9hv8Vp/Oe7chcgm12gNpeN7Szpxay
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_020447_752955_DA44E81F 
X-CRM114-Status: UNSURE (   9.84  )
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

Use thermal zone names that make more sense.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 0bb3a495b56e..89fb92666b81 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1436,7 +1436,7 @@ static const struct lvts_ctrl_data mt8186_lvts_data_ctrl[] = {
 			  .cal_offsets = { 29, 30, 31 } },
 			{ .dt_id = MT8186_ADSP,
 			  .cal_offsets = { 34, 35, 28 } },
-			{ .dt_id = MT8186_MFG,
+			{ .dt_id = MT8186_GPU,
 			  .cal_offsets = { 39, 32, 33 } }
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 0),
@@ -1487,11 +1487,11 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 	},
 	{
 		.lvts_sensor = {
-			{ .dt_id = MT8188_AP_GPU1,
+			{ .dt_id = MT8188_AP_GPU0,
 			  .cal_offsets = { 43, 44, 45 } },
-			{ .dt_id = MT8188_AP_GPU2,
+			{ .dt_id = MT8188_AP_GPU1,
 			  .cal_offsets = { 46, 47, 48 } },
-			{ .dt_id = MT8188_AP_SOC1,
+			{ .dt_id = MT8188_AP_ADSP,
 			  .cal_offsets = { 49, 50, 51 } },
 		},
 		VALID_SENSOR_MAP(1, 1, 1, 0),
@@ -1500,9 +1500,9 @@ static const struct lvts_ctrl_data mt8188_lvts_ap_data_ctrl[] = {
 	},
 	{
 		.lvts_sensor = {
-			{ .dt_id = MT8188_AP_SOC2,
+			{ .dt_id = MT8188_AP_VDO,
 			  .cal_offsets = { 52, 53, 54 } },
-			{ .dt_id = MT8188_AP_SOC3,
+			{ .dt_id = MT8188_AP_INFRA,
 			  .cal_offsets = { 55, 56, 57 } },
 		},
 		VALID_SENSOR_MAP(1, 1, 0, 0),

-- 
2.37.3


