Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA953C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Feb 2023 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDzCeDjhe5THr9kYy7urFayWf0fqGV769f7YqEQHSUI=; b=qwA0EhadxQAoxa+rF4w4QBylJv
	bJsBcEXs/sm31N8wka1ZNe/V2qt5Dn6+uoIPfiJqTd1ltHZPLg86wj+OLSZ/YK7xKKZVo2s1usRjG
	JSuMZtXu95C6/8qCu7kyBeiiL1VBmQu0phXFmqlS/V+y3Kn6xD0PdzyJQ1SScWeP3rjBqnIHG9ebq
	/Z0KCpQhWBdDST6AaxljNvo5jMjys7fI+HhLlaHR/xyavaXl1psQ7EmL6MtOwhRI7fBQHCNJ6YDNv
	0rLP0Bkd2RQxISK2MzfOv/WEmW6i44OJa36J6DgkqzHP4JHJM04vHKXGNH5u/UVy4Kweh0EzOoLFg
	H2oqN7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTkqS-001gn8-Nq; Sun, 19 Feb 2023 14:39:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTkpP-001gDr-Nr
	for linux-mediatek@lists.infradead.org; Sun, 19 Feb 2023 14:38:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id g7so387198wrd.3
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Feb 2023 06:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDzCeDjhe5THr9kYy7urFayWf0fqGV769f7YqEQHSUI=;
        b=Z8AUw1H7XELv4lEQit2NEoHxzkJGSQ9zsP1UD7S8vitx8spwRUH0oFv8bdDtDUB7q2
         SNRmLHoRxwEVKUl/VsrqK9RNCaH1gzMo9ynsfKIN7MspMhv2+OTXNw37ASDMyG5rXg2S
         E4Z8d+o6VcMFeBKRdCVTonKE+IY8nNVYPK2nknixLzkYkiwB0kOvd3pxmsL81HwsRRyQ
         FMb1mye/6YaO4vwnZKZHlVFKOf2bqSAxGetjMoXF4eR6pMEN9xUyRa8XwLBt76MGZ8Ix
         JC0hsXx6gJMOWvCqGmj33vrE4QmloGXxa3PKyoElUOscBWJHqe2D7w8dhVej9RVybn8O
         JXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDzCeDjhe5THr9kYy7urFayWf0fqGV769f7YqEQHSUI=;
        b=RwkzIEku7CEIn7OJKEIo/aq4Q147OUC2jV8rHawmmY6w423+R4MazCX6X+dQltuBGO
         tuKzZFWqsbVgHm2VcsHMW1BX1XkrdgAtbx+GWYnsJqUjD43ji33x6KFq60WD37OAqJ61
         h1S+2L8TdCPtnXcc5FCW/qBO1D9MFH3Y0ZUBomwkIuTh/wn4zMDLo1rqgMgTnzuw4NL9
         Gpymr3xloQulYVji0Vr5ObcBQTmtlPCZox+RvxggU231osq1Dajjb3Hf2vwkRt5rGfSk
         26uUWkNgkXaxBjlBwqJTxQSmdXlABFvuCPlJ2/ExA9ZbVSNFvE0iLNtdnFo4s/Z0MRNJ
         3pWg==
X-Gm-Message-State: AO0yUKVipEJ9bad+Sj/G59+awmiGBqwoNZjhpYJLu5D0dpfPbWkcoiwj
	bdLpbOeQsxMsy4MH5mWN/WUXgw==
X-Google-Smtp-Source: AK7set9gOvB2cw69asE5RVyB9RUwaoIIbKR7PwzhRSmLV9VgO/U1+dASYDHK4cogBEzlHi+x69Yx6A==
X-Received: by 2002:adf:db01:0:b0:2c3:e07d:46cc with SMTP id s1-20020adfdb01000000b002c3e07d46ccmr1488574wri.41.1676817489911;
        Sun, 19 Feb 2023 06:38:09 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6f43:b92:7670:463])
        by smtp.gmail.com with ESMTPSA id a18-20020adfe5d2000000b002be505ab59asm86176wrn.97.2023.02.19.06.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:38:09 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Amit Kucheria <amitk@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-acpi@vger.kernel.org (open list:ACPI THERMAL DRIVER),
	netdev@vger.kernel.org (open list:MELLANOX ETHERNET SWITCH DRIVERS),
	linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v1 10/17] thermal: Do not access 'type' field, use the tz id instead
Date: Sun, 19 Feb 2023 15:36:50 +0100
Message-Id: <20230219143657.241542-11-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230219143657.241542-1-daniel.lezcano@linaro.org>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_063811_800967_BE217BD5 
X-CRM114-Status: GOOD (  14.94  )
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

The 'type' field is used as a name in the message. However we can have
multiple thermal zone with the same type. The information is not
accurate.

Moreover, the thermal zone device structure is directly accessed while
we want to improve the self-encapsulation of the code.

Replace the 'type' in the message by the thermal zone id.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/acpi/thermal.c                             | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 4 ++--
 drivers/thermal/mediatek/lvts_thermal.c            | 5 +----
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 4 ++--
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 69d0da6456d5..4b5afaf843e2 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -842,7 +842,7 @@ static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz)
 		goto acpi_bus_detach;
 
 	dev_info(&tz->device->dev, "registered as thermal_zone%d\n",
-		 tz->thermal_zone->id);
+		 thermal_zone_device_get_id(tz->thermal_zone));
 
 	return 0;
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
index 228b6ffaef98..8dbb1c15b842 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
@@ -176,8 +176,8 @@ mlxsw_thermal_module_trips_update(struct device *dev, struct mlxsw_core *core,
 	}
 
 	if (crit_temp > emerg_temp) {
-		dev_warn(dev, "%s : Critical threshold %d is above emergency threshold %d\n",
-			 tz->tzdev->type, crit_temp, emerg_temp);
+		dev_warn(dev, "tz id %d: Critical threshold %d is above emergency threshold %d\n",
+			 thermal_zone_device_get_id(tz->tzdev), crit_temp, emerg_temp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index a65a81114cc5..90aab92a4185 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -304,10 +304,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 *
 	 * 14-0 : Raw temperature for threshold
 	 */
-	if (low != -INT_MAX) {
-		pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
+	if (low != -INT_MAX)
 		writel(raw_low, LVTS_H2NTHRE(base));
-	}
 
 	/*
 	 * Hot temperature threshold
@@ -318,7 +316,6 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 *
 	 * 14-0 : Raw temperature for threshold
 	 */
-	pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
 	writel(raw_high, LVTS_HTHRE(base));
 
 	return 0;
diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 8586cfe92df6..eda6d3af7b67 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -43,8 +43,8 @@ static void ti_thermal_work(struct work_struct *work)
 
 	thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
 
-	dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
-		data->ti_thermal->type);
+	dev_dbg(data->bgp->dev, "updated thermal zone id %d\n",
+		thermal_zone_device_get_id(data->ti_thermal));
 }
 
 /**
-- 
2.34.1


