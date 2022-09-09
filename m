Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219ACECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WAXuAdMYCi1g4B3dZtIrUPbn2Rjq0LvUklClvaIr8b8=; b=3JXIQIFdfuZ81looDBZXdSyavO
	rwLTKJt2zvtp7ahULDPymb9WqNMu0cS+SO8bxWYLskvyv7v6r7FUbO1DGEQRV+5caXMEO+C6U4I/b
	DSKznGNZMrLi2vMZ9gQbZWeknZ2RwjZt1QEWuDJ1hmjAnZqZ1bmX8o4H09a+i57oGhK9fpT585Y8l
	/CTUkUEMzGecibWN/yWQKZAGjmLzAas9nYYhTj6qLjM7stmKYtM5+2mBwuxcay4kaR+36OzLoBx3L
	5Nr7Swom9UCy3W+ieqnKMtePjr7bnqvVzpFRxTIaDmSVfb60wepjD87qChMu+lP/kA7PG/sEXX2dt
	UjBT/wBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYgS-00E5JX-SY; Fri, 09 Sep 2022 07:44:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYa1-00E17h-QL
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 07:37:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id k9so1359586wri.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 00:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=WAXuAdMYCi1g4B3dZtIrUPbn2Rjq0LvUklClvaIr8b8=;
        b=hixeKMNDSjZK3KfMycWsysM82K7TRLETak/YdjVEpPzYcAiTEyk1am1Y6ucG8fceex
         gOBbgIHZEWeBRdgDLIHXwL/X4Bl2ustyrVlJlTITV9SlwE6ZstmXh/kthIVTS1Hbo6Ty
         4LOP/ZaSecGllpo7+qyebW78n6H7y/TICy3iRg5GW/WwK/8Fv/2mNWFX3zxZYwolR+OQ
         +GfGCLfmC1vuUWsIIvGsq8HPALZUPSB9sR7qLw4yZHU0Jx0FWdVZcDQoahIOb6A9giT+
         KDtlJQdeSPKs98fcE/Y9nj/GIKcWMT9HMZn7fsw0bzoCfE9lN9M4UuiDtHMoxgTcM6O9
         mq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=WAXuAdMYCi1g4B3dZtIrUPbn2Rjq0LvUklClvaIr8b8=;
        b=YXAIarVnOnPkSBN5a/MLYNAWIXmM3f0vUXzjK/0FUtiolbE+Dz+8D8cPkjPDLghmjZ
         7LlLITerk5qRx7Nvh2UNwP6l/zTp83aTBPIqiwDC8zMr9Ygek1Lw1J/RQRqSeoRWA0jv
         gHkteKq/OHkn9NiXywCPR/vU/MYFB4OW6CQLLrNxfkkBl4FKz1pHsmpDYodebY8ibYK8
         /gDx+xP5b2NdjFPuWmdZMal3H6GDLJfqukdsdFiZVvJjRkEm2TNKafn3UULDxE/fC904
         DpbOXa8/SyuVhgkQkTfqbQPXZQlpg1cNoNP20kwOhIDIWjB4QQKTtZncVr7yj2KoHgc8
         2BwA==
X-Gm-Message-State: ACgBeo2RsZzWsiGx/7TogiKW6a7hs8Gk8cedEoYPg66a7B8wFsWvR328
	W9Ee0J/qOYxLkrcFBhcKgfdJjA==
X-Google-Smtp-Source: AA6agR75OF2EH+cFAiCFUtN0kMdkH9+f5B4FNPLDQ7a3iVi2EQXbEUCBkPoYSszQ+aDBYO//mF1y4w==
X-Received: by 2002:a5d:494d:0:b0:228:d840:99f5 with SMTP id r13-20020a5d494d000000b00228d84099f5mr7203566wrs.458.1662709053950;
        Fri, 09 Sep 2022 00:37:33 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h7-20020a05600c414700b003a83ca67f73sm1252976wmm.3.2022.09.09.00.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 00:37:33 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	rafael@kernel.org,
	fparent@baylibre.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v4 2/4] thermal: mediatek: control buffer enablement tweaks
Date: Fri,  9 Sep 2022 09:37:26 +0200
Message-Id: <20220909073726.32423-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003737_879325_1CCABCBE 
X-CRM114-Status: GOOD (  13.91  )
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

From: Markus Schneider-Pargmann <msp@baylibre.com>

Add logic in order to be able to turn on the control buffer on MT8365.
This change now allows to have control buffer support for MTK_THERMAL_V1,
and it allows to define the register offset, and mask used to enable it.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 drivers/thermal/mtk_thermal.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 8440692e3890..d8ddceb75372 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -271,6 +271,9 @@ struct mtk_thermal_data {
 	bool need_switch_bank;
 	struct thermal_bank_cfg bank_data[MAX_NUM_ZONES];
 	enum mtk_thermal_version version;
+	u32 apmixed_buffer_ctl_reg;
+	u32 apmixed_buffer_ctl_mask;
+	u32 apmixed_buffer_ctl_set;
 };
 
 struct mtk_thermal {
@@ -514,6 +517,9 @@ static const struct mtk_thermal_data mt7622_thermal_data = {
 	.adcpnp = mt7622_adcpnp,
 	.sensor_mux_values = mt7622_mux_values,
 	.version = MTK_THERMAL_V2,
+	.apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
+	.apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
+	.apmixed_buffer_ctl_set = BIT(0),
 };
 
 /*
@@ -963,14 +969,18 @@ static const struct of_device_id mtk_thermal_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_thermal_of_match);
 
-static void mtk_thermal_turn_on_buffer(void __iomem *apmixed_base)
+static void mtk_thermal_turn_on_buffer(struct mtk_thermal *mt,
+				       void __iomem *apmixed_base)
 {
-	int tmp;
+	u32 tmp;
+
+	if (!mt->conf->apmixed_buffer_ctl_reg)
+		return;
 
-	tmp = readl(apmixed_base + APMIXED_SYS_TS_CON1);
-	tmp &= ~(0x37);
-	tmp |= 0x1;
-	writel(tmp, apmixed_base + APMIXED_SYS_TS_CON1);
+	tmp = readl(apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
+	tmp &= mt->conf->apmixed_buffer_ctl_mask;
+	tmp |= mt->conf->apmixed_buffer_ctl_set;
+	writel(tmp, apmixed_base + mt->conf->apmixed_buffer_ctl_reg);
 	udelay(200);
 }
 
@@ -1070,8 +1080,9 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_auxadc;
 	}
 
+	mtk_thermal_turn_on_buffer(mt, apmixed_base);
+
 	if (mt->conf->version == MTK_THERMAL_V2) {
-		mtk_thermal_turn_on_buffer(apmixed_base);
 		mtk_thermal_release_periodic_ts(mt, auxadc_base);
 	}
 
-- 
2.37.3


