Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DD1C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fNcwcyqeCTP7AtXCBd3m7Qb7ImNpCK5iJ5vh8zaihA=; b=SC+xIgCWclneMPUGEJjZfSxV6T
	4bZBo8f0MAYHgiTekGushlWg/MOemyJd4BXQ/BCbS+EVX0RLvFWOxuQRz7U+P+gwHe08oWLSPu/8t
	T9TlnuXCivxn9BQkiZHZ38Yt2I2pP1TKBu0npetp58Rq00uVF62EbjOYYMTMAVXGeI2iLz9oLJ1UJ
	mJLqN6ER8273HbqigFLNn8T9qaGmPuVWnb3YQ3NnXmY3lJSf7BNSM1WjjHX6XfGxe1ZsCxmmKCB5D
	ZJTN+lW+eEs9n9LQ8coOIZO6DfA6wKj26eVFZutuJ8esb7rLw9bUssg8cdM4wezqeyecXNXx6o8kx
	7QQnL0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzY6-00GoSr-PQ; Wed, 18 Jan 2023 03:55:42 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzXu-00GoPd-D8; Wed, 18 Jan 2023 03:55:31 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pHzXs-00032R-2C;
	Wed, 18 Jan 2023 04:55:28 +0100
Date: Wed, 18 Jan 2023 03:55:22 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/2] thermal: mediatek: use function pointer for
 raw_to_mcelsius
Message-ID: <69c17529e8418da3eec703dde31e1b01e5b0f7e8.1674012985.git.daniel@makrotopia.org>
References: <cover.1674012985.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674012985.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_195530_465205_23B3588B 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: John Crispin <john@phrozen.org>, Steven Liu <steven.liu@mediatek.com>, Chad Monroe <chad@monroe.io>, Henry Yen <Henry.Yen@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Instead of having if-else logic selecting either raw_to_mcelsius_v1 or
raw_to_mcelsius_v2 in mtk_thermal_bank_temperature introduce a function
pointer raw_to_mcelsius to struct mtk_thermal which is initialized in the
probe function.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/thermal/mtk_thermal.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 0084b76493d9a..992750ee09e62 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -292,6 +292,8 @@ struct mtk_thermal {
 
 	const struct mtk_thermal_data *conf;
 	struct mtk_thermal_bank banks[MAX_NUM_ZONES];
+
+	int (*raw_to_mcelsius)(struct mtk_thermal *mt, int sensno, s32 raw);
 };
 
 /* MT8183 thermal sensor data */
@@ -656,13 +658,9 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
 	for (i = 0; i < conf->bank_data[bank->id].num_sensors; i++) {
 		raw = readl(mt->thermal_base + conf->msr[i]);
 
-		if (mt->conf->version == MTK_THERMAL_V1) {
-			temp = raw_to_mcelsius_v1(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		} else {
-			temp = raw_to_mcelsius_v2(
-				mt, conf->bank_data[bank->id].sensors[i], raw);
-		}
+		temp = mt->raw_to_mcelsius(
+			mt, conf->bank_data[bank->id].sensors[i], raw);
+
 
 		/*
 		 * The first read of a sensor often contains very high bogus
@@ -1075,6 +1073,11 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}
 
+	if (mt->conf->version == MTK_THERMAL_V1)
+		mt->raw_to_mcelsius = raw_to_mcelsius_v1;
+	else
+		mt->raw_to_mcelsius = raw_to_mcelsius_v2;
+
 	for (ctrl_id = 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
 		for (i = 0; i < mt->conf->num_banks; i++)
 			mtk_thermal_init_bank(mt, i, apmixed_phys_base,
-- 
2.39.1


