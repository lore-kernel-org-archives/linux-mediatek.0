Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0B2ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stpnIznClyFbSSAZ9XIBAQVJVqGJPgWnuEIsfvw/Kgw=; b=4t3ZdxpeT9oclB7AP+u8wjJeqW
	SEwGnKpVDPhJ4IjP1WO7BWfCPnh606Jb1PNGyXQRd8Bx1Oi5W+9fX75agnX/Tb8qm+2nRxgXpf2gb
	tkWYZOZZNOP1IFEavbjM4P5/CkX8EYJCSlQKXwsGjbuiy1vdJ+VkSQArLEtOuEDqIlOstaWGYIlPq
	fOg9yb4Bgd5sDgnckBE6PIMtxRDQssEDv/b3xcfpS9NgiiLgkGg6yOOV+7ln0/YzqNYWBZKPqFlQa
	AeFa/QBGu05wBwPE85ON8tQQpSe41iQf1tWHG/i6PveddkLb7XjbbLkXXA/szgSqBBYXjJJYSuNMD
	0wgxfs9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkQY-00C95o-Mp; Thu, 01 Sep 2022 13:40:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkQQ-00C90V-3S
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 13:40:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id b16so14793998wru.7
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Sep 2022 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=stpnIznClyFbSSAZ9XIBAQVJVqGJPgWnuEIsfvw/Kgw=;
        b=SgocxATs9nG+dO5eC5Ry/p9RAchwAh7Dpb52+4CBAMfh5whV5zASWzF3gBuq1hnzwp
         M+7JtEjt88ret/I+CXbQ/8eC7JhJZZYpUMr9LIXHTG//b8nmupFzHkcA4LJTWam7pZbN
         QBEVv+DsJY1rMjqi9UwKNxes6DzYt2FsHkrUVjyhamtSGhaNqs25BKDjTXNKk09vaU3e
         5Yey/AIv9z1PeDrbwbxvkjhbGh/JUK1k7rdBskyuIVcMMC9wZb8GxUwSHKfubs+QiSld
         cv+od58WOfHDtJuJll+69LK2+7eNURITPegLYKastnotHmlVwhKrU1nx5L/e+r0bg/SB
         S5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=stpnIznClyFbSSAZ9XIBAQVJVqGJPgWnuEIsfvw/Kgw=;
        b=A45MvBXeTpFBPo2Q9lHnmGxJeZU5tR4kjdOd4Zxeu9lT9O7hlvthi8c99ZqP7OzZxj
         RoEwTZmuS8OzptxQPiVJ4Jwbl6vqGhOy9wNw+KmTdLqGQUidgMwEzcVEA4SfFbI/j28r
         STAFTAFNYdztw6MKvCvjgSyZ7is7C+b/tVL89OR21wwA7qz/EYn8JMMq3xyzQMurPdM+
         RomSrB2P9KfPFweVyBBUntZRoN81vT+1gTdc+KElYG2eOAukEXTXVlCVNGfwkHwh1e1v
         aTzdCbilbyVS98N8fm7sG9Tqa8DTmBRUuX+ONh6TxnR1+0NejflDXGyqHj2bF78SP/5/
         6/cw==
X-Gm-Message-State: ACgBeo1zypEBHWvpnqf/vKR2YUkJ54sGiNXxMzMVYvtPBFsYhzsXhSSd
	DT1vrVqkrlCZCRtpspHYWzNW1fsIFUruvo9w
X-Google-Smtp-Source: AA6agR63Bzb51JkQHDsQML106QA1SRbThkvFgEfcZxG1oTuPekWXu06XLjwe2W8lGlgpYHROZLAeqg==
X-Received: by 2002:adf:a702:0:b0:226:e205:fa56 with SMTP id c2-20020adfa702000000b00226e205fa56mr7815687wrd.637.1662039604363;
        Thu, 01 Sep 2022 06:40:04 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id e3-20020adfe383000000b0021ef34124ebsm15399016wrm.11.2022.09.01.06.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 06:40:03 -0700 (PDT)
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
Subject: [PATCH v3 2/4] thermal: mediatek: control buffer enablement tweaks
Date: Thu,  1 Sep 2022 15:39:48 +0200
Message-Id: <20220901133950.115122-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901133950.115122-1-aouledameur@baylibre.com>
References: <20220901133950.115122-1-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_064006_217450_42D56B7D 
X-CRM114-Status: GOOD (  15.69  )
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
Changes in V3:
- Use GENMASK() and BIT() instead of hardcoded data.
- Use u32 instead of int for "tmp" var in mtk_thermal_turn_on_buffer() 

 drivers/thermal/mtk_thermal.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..b5b4401249e8 100644
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


