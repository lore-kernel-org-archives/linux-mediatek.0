Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6322AC38142
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFVYW1O2xATTJriM1RmoRREy/G+c337SmUDoCitpzco=; b=GJ9Fc8KRcUDf49zi4llglngVYq
	kcdnsIuxrVpdOCsSlpnfSVGwJlKyRuzYwLQYNzFOOECE7G1KtR5ogvCpHndOl5ARXMV3Jctc3cQ9S
	N/A8md7ygunE4v5ybd8Q30rjA7BXKACZVen34Sma3+o+vqakYkvXR5wM8fAs/0OG4ttn/59tphUmc
	9UfLtCwR3kL+Mn9DDBvlc17KojxvU6y6USjtuWJueinWHxB+t1IIXUAKXCKQFzUrjxkONCUy1qCap
	myEsHwuKGYO3a9tmR3ZfutU1CdFZzFvcpwgN/V3sJLuFelG8gpDQh7CsaqGVftNhWpAGd1YR1f80N
	pR3EEb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQwC-00FVXQ-LG; Fri, 27 Jan 2023 15:46:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQum-00FUtt-VG
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 15:45:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id bk16so5318179wrb.11
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 07:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFVYW1O2xATTJriM1RmoRREy/G+c337SmUDoCitpzco=;
        b=491Ky8TrcAcsgeprw2ZEB8sgi6R/oZLzhKDU0+d3vG7v1nc6h3yA74RGbYkvWZUGx7
         Q0tkN7Dadn3um5AJed8e+Uxhes1ERabJDnCU7A/6BYpFnpWWdaXrjj6Il3p1I8VpHSkG
         GcA/06V6Xi9eNuaFlGDUTvJpxTr14Y8ACoeJpbQF/LNMv1Wf6ztmsMWEw5xZ+CFIsPM2
         kvhpuAsK+d+Qf4DWi8UDauaU6DtDoRIbhKjGCPvOGetFluXBsSa2quz3+OMoDtbDdLRE
         9m3F2z8NigSQc5pUGYdpfWr19F6Ur2lAMmbkHomvcHHW3zFYNsJTejBJ00gnD8XDdA2M
         n2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFVYW1O2xATTJriM1RmoRREy/G+c337SmUDoCitpzco=;
        b=a1zW4cB7r7UqpgdXlmugXaRImjv/wsLa5RjoYvlc6YzNQebdGsgCIN+e1utwMR/Gza
         jCAS+SNyvBnd7AgQ8rOM8Fq57h1bVvGM0ieCOU2YLcX5EdHd6/zLxSrGDQe6ooFB8CTx
         rHWAcY7Y5SBSpAOlV+++raYQItOQiR/eqVMPSJ9aSv6j1H6Wa0cJbLppCf3QvPxSMSE3
         T15cQQeb2l6KfKb5eW7AR6YsQBnzlxP+G7UblqqKXOchsMRasifxPFDs9T9dc4nXIHF9
         ZLHconBGHrOSjUbgu3RSwJcOJuoy6S8S/E2F2hcABFVtWF+HGG7aptq4YC1/yS7oKbgj
         2O8Q==
X-Gm-Message-State: AFqh2koqsTJshK5t828b5lHIiaWPrfEoUK5Mm/dAorI3MMeBpC2Z9SQf
	ZHWhvZrBfcb9BIHVqghZp55eIw==
X-Google-Smtp-Source: AMrXdXtQHXWwiOsqOaUoE38vnif7eGDE3q2bHlH287lAZAfafj8qRbLU4OGjDi/NT1osbLuzBAwQdQ==
X-Received: by 2002:a5d:6e8b:0:b0:2bd:d9b5:8191 with SMTP id k11-20020a5d6e8b000000b002bdd9b58191mr35643805wrz.61.1674834318557;
        Fri, 27 Jan 2023 07:45:18 -0800 (PST)
Received: from [127.0.1.1] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.googlemail.com with ESMTPSA id z12-20020adff74c000000b00291f1a5ced6sm4381153wrp.53.2023.01.27.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:45:18 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 27 Jan 2023 16:44:45 +0100
Subject:  [PATCH v9 4/5] thermal: mediatek: add callback for raw to mcelsius conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-up-i350-thermal-bringup-v9-4-55a1ae14af74@baylibre.com>
References: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
In-Reply-To: <20221018-up-i350-thermal-bringup-v9-0-55a1ae14af74@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674834313; l=1727;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=oneS0GOcwyJu/jpresdHeaeVd8flLXASRISr19OSr48=;
 b=PnXR/TW2vh+td5o1N+8uUQCOh9ZzJAzZGpiVAX0YLZpxZwaJwd1lZr59Yb9Anlyb3xTwr21LnY1B
 TWBcJGy7ALBoVPKUNGYbCNIimiZR/rmYuY5AQNwYV5OoL/voXYml
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_074521_141768_CCFD06A9 
X-CRM114-Status: GOOD (  13.38  )
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

