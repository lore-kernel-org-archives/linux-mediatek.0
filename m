Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09929C54EED
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFVYW1O2xATTJriM1RmoRREy/G+c337SmUDoCitpzco=; b=p+oDDXEiDvYZfchYUjzF4VaNkL
	kTBX2Dda+0cM6WT0SyJ+5StPbA9i+abm4I/KysWODDw5TbYDqPt2OkGNPaG85m7wcuBTEbe7FsVvq
	bGp787trdGrPi0RKwFHRJexXFkikDAq3Vqpwd+3DdRLPofeqbPQe5NcSYlK/YaR/GutFDPqHccGJe
	ZA4UQ524ekYghu/Yq/c+BhYhUlnxcaZkZRKxFmbhTrr9vtWHjhb+E469B2AyM9Lc68Fam9WAC7O2J
	uR6tddRepz/exQgFiAlQ0pgy7zqA5ZKSsro+U7UsVpaylma7tAC0Ald/leQ2XIaBH0gpXnXAbbddw
	pJLAsczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcVq-006kzY-3m; Wed, 25 Jan 2023 09:56:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcQv-006j1l-8f
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 09:51:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so815437wml.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFVYW1O2xATTJriM1RmoRREy/G+c337SmUDoCitpzco=;
        b=kHYJJNAhyMxJs8rkZvXLxWwfNTqjAfmgeTQtNCp+pVmtiHt3Btxu1d51Qr9n5mnFP4
         AEVq9BdfmEOyr2Z5LFxjbteGEHhVu39IkOS1Js+eLiU15JOQEQvVPQcpih8Tq4VZ9Buy
         AxTyr9W6afzaSmaZhNSSNJRXlamcFEi92QU9UrWUd7O0Sd+7+CRkV7WgTMw4HdtcgWHB
         DlmkE1v+nySG8zIJ3ISUVWqIFgTQSzd/1OgGNclv/5bld3QHriKJ+oJ9BtuUg6VED7Ac
         A3VmR0eflI6+PAGi51W9ERZtd/1qH5k26oAfqdgM3RoHATBOnm2cyxoSJejkRUdcHQWd
         nGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFVYW1O2xATTJriM1RmoRREy/G+c337SmUDoCitpzco=;
        b=f+PYlTvg0td1ZyMgjuDQGu03np6SoxEDQK31dTJUJMazPpRpIM4D2n9S2VtDBCnUhq
         /O8riW9apm6c0oT9us13uiLAYJeUx+dj10Ku70PUSqn/CoK37FhSQBfvG2kFK2Oz2a2j
         7wwv9ribglYe+ArmLpIZ1LjhtI6K6xRihyknZoq7WP30je0QwKIvGKUDv1wwzN1CLZmb
         u7oqTb2Kz3grwFHlqTq0rDno+BtMBe+sfW7iNA7cF+ZzXp5JqKhK4X4/JC+7McckBZtf
         qq2ngI/SnR5buZA3LBgONZpgsrMxH6yQjSw9XrKBpGxCRWd5sOQfy+T+lbcy6XCQGb/V
         uEtQ==
X-Gm-Message-State: AFqh2ko0PmD7Tzggt+Ro2n/NV4/6/sIt3du32xFbrlQm7IENU4JUZaNH
	FkM1yBu4luTaD6ojaupOcSr0fQ==
X-Google-Smtp-Source: AMrXdXtA0Nn0nf947A5sN2hj321whK94v/6tvKmmHq+k8ZtS0NuCX+YbPAErtq0itIP8sXDcBvF2eQ==
X-Received: by 2002:a05:600c:3d8d:b0:3d2:bca5:10a2 with SMTP id bi13-20020a05600c3d8d00b003d2bca510a2mr30621063wmb.22.1674640265478;
        Wed, 25 Jan 2023 01:51:05 -0800 (PST)
Received: from [127.0.1.1] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.googlemail.com with ESMTPSA id j26-20020a5d453a000000b002bdf3809f59sm3955072wra.38.2023.01.25.01.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:51:05 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 25 Jan 2023 10:50:32 +0100
Subject:  [PATCH v8 4/5] thermal: mediatek: add callback for raw to mcelsius conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-up-i350-thermal-bringup-v8-4-23e8fbb08837@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Michael Kao <michael.kao@mediatek.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674640259; l=1727;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=oneS0GOcwyJu/jpresdHeaeVd8flLXASRISr19OSr48=;
 b=ZV5aCgX9PkZJa0Sypvo2hM4krEb1MLQZDO4q5TsQiehLB9e0NmzlMDH9KDCXcuqTkcNTPHu0QxdJ
 +O/VpQoWAYxYvRvjtEkQUXuX7tCJB33JiSrJaQOk25Vd5W+U1S1h
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_015109_342902_325F747D 
X-CRM114-Status: GOOD (  13.61  )
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

Set a callback at probe time instead of checking the version at
each get_sensor_temp().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mtk_thermal.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 3a5df1440822..b8e06f6c7c42 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -307,6 +307,8 @@ struct mtk_thermal {
 
 	const struct mtk_thermal_data *conf;
 	struct mtk_thermal_bank banks[MAX_NUM_ZONES];
+
+	int (*raw_to_mcelsius)(struct mtk_thermal *mt, int sensno, s32 raw);
 };
 
 /* MT8183 thermal sensor data */
@@ -726,13 +728,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
 		raw = readl(mt->thermal_base + conf->msr[i]);
 
-		if (mt->conf->version == MTK_THERMAL_V1) {
-			temp = raw_to_mcelsius_v1(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		} else {
-			temp = raw_to_mcelsius_v2(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		}
+		temp = mt->raw_to_mcelsius(mt, i, raw);
 
 		/*
 		 * The first read of a sensor often contains very high bogus
@@ -1150,6 +1146,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	mtk_thermal_turn_on_buffer(mt, apmixed_base);
 
+	mt->raw_to_mcelsius = (mt->conf->version == MTK_THERMAL_V1) ?
+				raw_to_mcelsius_v1 : raw_to_mcelsius_v2;
+
 	if (mt->conf->version == MTK_THERMAL_V2) {
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}

-- 
2.39.1

