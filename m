Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347ACC32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o78476BCBNeXUUh8dYtk1P5K0AodHpMpcG8B/jLfRgU=; b=BneMTgreCg3bjR8020KH41yhiO
	VUAeo8JHgpoMPXESdcaQM/j/kW+2yxAlGu+lytiuSqFVXz4knyow29N9em+RwSu3BGQgoLXtzitNn
	NTHqYM2DiCs+CYIvlGhs1rl50OJ2DzQmbnUbbACW36vi72Jrr/Cnp6/l4HqXMzJG4ziGzBCP1b/H9
	MtjUQKP04jYHWzyv7jMhqUxh2RfuIDTubgDAGzUI8VsIRX6HGgMSIUwUC9gtSuFZlhU8pDO8S/fLc
	dfa9jXabzN2APNwH9f1Yqpb0lWhAx1zoF0jcKbxi9qTy0oDPL59PVY9pg3i5Fgg2gdSiZmmNS+FsR
	0WoO/GcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAYf-001bl0-Ud; Wed, 18 Jan 2023 15:41:01 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIAYR-001bfc-1q; Wed, 18 Jan 2023 15:40:48 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pIAYP-0007gi-0q;
	Wed, 18 Jan 2023 16:40:45 +0100
Date: Wed, 18 Jan 2023 15:40:39 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Steven Liu <steven.liu@mediatek.com>,
	Henry Yen <Henry.Yen@mediatek.com>, Chad Monroe <chad@monroe.io>,
	John Crispin <john@phrozen.org>
Subject: [PATCH v5 1/2] thermal/drivers/mtk: use function pointer for
 raw_to_mcelsius
Message-ID: <69c17529e8418da3eec703dde31e1b01e5b0f7e8.1674055882.git.daniel@makrotopia.org>
References: <cover.1674055882.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674055882.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_074047_137680_C12F4C6C 
X-CRM114-Status: GOOD (  14.10  )
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

Instead of having if-else logic selecting either raw_to_mcelsius_v1 or
raw_to_mcelsius_v2 in mtk_thermal_bank_temperature introduce a function
pointer raw_to_mcelsius to struct mtk_thermal which is initialized in the
probe function.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


