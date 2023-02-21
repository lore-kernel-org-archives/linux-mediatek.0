Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB06C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 18:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxOjXV0BQvNs4//4eyybGdilzG1LzEaF0NAq/aqNM8Q=; b=eFUVIYyLdKY6UgpsBA7w1ngBV/
	O34eX9IpewxqRz+6qr61ZxKS3i+ahdGGHFvjogJNWv665G6Fd5kv8umzBNSHaFZpkeFk4gx1U5E2l
	aXrD/RcZRGP8QmMYgUvx7IhzhXB6FX8L8OATeqS3T99XBVs5UsIiR2rQsLWRDi7gCdmZJgbMR/T+A
	P4rYXmXXCQPEwUrcW21tlPlrMAD+KceiDD4CGjeXSYmImobsa8sktHppvOClOW9uWlQTP5cykNXpm
	weM2hJdXoQ4EFq2yVqU9jGNSxUEzDW1Ze5zCElOlTM2up/CscUkEnGVBpmeTHEM0X4/CQ74cPLbsK
	8bmLD0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUX4b-009IyS-TY; Tue, 21 Feb 2023 18:09:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUX3c-009IDt-1g
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 18:08:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o4-20020a05600c4fc400b003e1f5f2a29cso4348086wmq.4
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Feb 2023 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxOjXV0BQvNs4//4eyybGdilzG1LzEaF0NAq/aqNM8Q=;
        b=JT/vx6hFSQYN4c2jk7Stt6InjzZQMM0mhvzlKkKPuYT9DPtfKOsHXrx+sSqzXKmhV4
         HN9xhbOFiCrS189gTkrTh3E/RW3s6hpY+u7m940QJwtr7wmvT2sHJgPehcPVIAtCT9Ar
         UvMyL2S1IWn42TvYQkGPwwU2DBDYMgEKb20wEvg9ToEv2NoLp3mQIxqQuWfeiY3V5b/I
         2zg1mNJz3D0JZ/hfVvnCeFQxlgDbwpf4fEKFFTn1Cai6l+oQ4gBe3C4iqhC5UlQd3siB
         bXcwe4EyQwybr4voCX90kNGpz+328NTLLnNegXxxDf/8Vb5ETwX+XfqbHLZlVLoRRRe5
         z12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxOjXV0BQvNs4//4eyybGdilzG1LzEaF0NAq/aqNM8Q=;
        b=cQm7l0vXfOcn5WPk27AmTPNj+D35HThRJ21dcm7YfxZL8+Y1eBy4fiUnZvQWYPf/rd
         9s6kk2D9gqqKwaUh94MA9qF6LH/e7d6OH6F4EvInLBvf16c+pqoh87w6SnW/ExmAK7UC
         xBcm7IIj0Uzi8xcFFBYfBm4eK7HQ3vXglp3AoJ12DsvisAlAGNTHa8y4P7teW/xWkFL8
         ELuMNfrVmECjJk+/6aFsDow1xLHtdUQBLFcaQ0+v2EroCgdbF14hZugY3sJdgBmKAE1u
         +R1U9NH8uhBgtZUNZO6DS8cwfacy4ySqLrIZsgBkBRjVNj2JZBWcg6bKCIS4i3LKgK4G
         Fylg==
X-Gm-Message-State: AO0yUKXHsVcWLvd8u2fI2mDagumnSmXOnOAJg8r5OiFOLb+9pR1CXaA5
	JheVZZMY7wM3/ESsHKXFWVXCxg==
X-Google-Smtp-Source: AK7set+UvfuNbt1xzTlvl99AbwSUpW97o8x8EsfSehdVbZk/s/8pp5dlcoJQQ7YQr9U5gVjvwA4sTg==
X-Received: by 2002:a05:600c:16d3:b0:3dc:5950:b358 with SMTP id l19-20020a05600c16d300b003dc5950b358mr10858363wmn.14.1677002883410;
        Tue, 21 Feb 2023 10:08:03 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1e9:315c:bb40:e382])
        by smtp.gmail.com with ESMTPSA id c128-20020a1c3586000000b003e21558ee9dsm5107815wma.2.2023.02.21.10.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:08:03 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ido Schimmel <idosch@nvidia.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
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
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-acpi@vger.kernel.org (open list:ACPI THERMAL DRIVER),
	netdev@vger.kernel.org (open list:MELLANOX ETHERNET SWITCH DRIVERS),
	linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v2 09/16] thermal: Do not access 'type' field, use the tz id instead
Date: Tue, 21 Feb 2023 19:07:03 +0100
Message-Id: <20230221180710.2781027-10-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_100804_188104_42F46F11 
X-CRM114-Status: GOOD (  15.14  )
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
Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw
---
 drivers/acpi/thermal.c                             | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 4 ++--
 drivers/thermal/mediatek/lvts_thermal.c            | 5 +----
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 4 ++--
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 392b73b3e269..b55a3b0ad9ed 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -842,7 +842,7 @@ static int acpi_thermal_register_thermal_zone(struct acpi_thermal *tz)
 		goto acpi_bus_detach;
 
 	dev_info(&tz->device->dev, "registered as thermal_zone%d\n",
-		 tz->thermal_zone->id);
+		 thermal_zone_device_get_id(tz->thermal_zone));
 
 	return 0;
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
index 722e4a40afef..a997fca211ba 100644
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
index beb835d644e2..155cef8ed3f5 100644
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
index 060f46cea5ff..488b08fc20e4 100644
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


