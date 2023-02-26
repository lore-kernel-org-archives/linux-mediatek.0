Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147B6C7EE30
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Feb 2023 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=; b=zNfdazLNRt7jZn1gaHfuwxe3je
	O6+2oVPbLOz6LsfdfKcK2FCuK1ZSPEs7cje5Ht95uJeQ1n55zN8rYMmDMO+ksF6a29E/sIb03GUeY
	251Chzg7sLGsK3EGLxEtPeFXqKrpE7YefrEtEm23FLyOdkubxrw/WM9l0DYQ28Excs4s8NzR9P5Yk
	XTogrTZF8ZFdD+GHbZ50ErbQxPT4ink+BbmmIPn9y8RBrSnJJwMbNljTBEQdPpObOq058ElaOBd1Q
	xtIx65NFnt1LtrXaGXnxQbggpNcTl3qoLijuQnO8Mv2VHxK+msL8PvI8X72ZAHicFMi3bLbaP5jBI
	yNu02CCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWPwK-007xfd-OZ; Sun, 26 Feb 2023 22:56:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWPvR-007xAU-5c
	for linux-mediatek@bombadil.infradead.org; Sun, 26 Feb 2023 22:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=; b=gj8LNPnxnqrriHqQGFRgOWiBxg
	6PhhA6mXER18ZIKJjVEaMTLXbiWsDfe0YiqFqO/YPvranWloQmVRFZosCPJT8L8V6Lr0iYP5kRdif
	AR+SJ2t88M3Qlo/jF63FH/uMyO19cxx7ZITL8CsFqrZNf5VPdJksLHUbH3sLcorVTY+A5+tWlrOFb
	S9AzR39+OoKIggzKYCIi84q6eTu/wBNqui8cWhThCS3CKyvRmeT5LNwcvHi8uvt7kxSNu1amUFGoc
	htU5yf2q0aXAC93qF2lLuhGoWft12ENwktFbHa1kll1ZVHr+t1/59sv5d3i/4Gh/Vr/tg/4BQFRaa
	EFC73zMw==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pWPvK-00E37r-2D
	for linux-mediatek@lists.infradead.org;
	Sun, 26 Feb 2023 22:55:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bw19so4377926wrb.13
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Feb 2023 14:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=;
        b=OHQGVxYUDNZxeRnZqcRN+uMUSgX2YZfaD26tyEg/q5/y5/W8rIqtESjkMaDxMvTyXM
         14fXI+DfYB1jlOG85VuFrAvlgnZnGQzr3a+bCM025odzMOonRnE0+5erpzWFbT4beu1O
         uFy6JmlEH8UqFlEgmgLJulXxxEu2M7bXfEDcMOa8SYeqTJXe07+SeHPQaWW8NfompTht
         vlrsbABafmS0ubMqA0WJ+IQzOLnyqAGxcxQgbf0x7Bw5iybB0k0HSE+JYdGnFSumzUYO
         u7gZmzF4hWOi3QiL+4/5p1eCUxVvfeVNa/zOgO15PdO5qpcmFAYqGJwWccswC8JHnBIa
         IO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=;
        b=u4TLKCy7IxIWwwVtrr57e1n2ut8cdOS7QzEJXexVihBEVGcGTqod4epmiOHyVYqRXG
         GySJnc75EaN4JS+ggkXqKr/J3aM7f3iGLPjwnvDrS8qFYCa8S4NUq0iih3KyjN9McZns
         hCDfMMyd8b7o3/FAC2LerQjWCYoFGEnqpdxahhjeaNuexljXbH5BkHMw40VJ3TwW4Fa6
         hPg/Umd17Ea7ItBsm8BpfHSMu2MgUanJYA3T86qHybfI5Yg+uz6lHBQdgKISFkR3Z/ML
         GpZ2XJpPBFk5zuRlVOCAWbubSeIsFpaz2BTWVYAe6tOB7CRBv70DwXDHJSNn0RSmBhFx
         phCQ==
X-Gm-Message-State: AO0yUKWHFMd3xAn9lY0/ZMd8uxzwsBzHmsniumBiN12W3pQDX0i7WwZn
	ELFBp2uXE6V41+EXSWe3/Q3MHw==
X-Google-Smtp-Source: AK7set9HlGkC9SZA4cKWEzZ4LPrqJg0BCucqxyFxYbvbS4WkLoFy2G2Zb56PXu9VcB3ZfJBDVcTVvg==
X-Received: by 2002:adf:ed0b:0:b0:2c7:1e16:57cf with SMTP id a11-20020adfed0b000000b002c71e1657cfmr7898234wro.67.1677452115247;
        Sun, 26 Feb 2023 14:55:15 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8baa:6b32:391b:62de])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b003eb369abd92sm6138074wms.2.2023.02.26.14.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 14:55:14 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ido Schimmel <idosch@nvidia.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Petr Machata <petrm@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	netdev@vger.kernel.org (open list:MELLANOX ETHERNET SWITCH DRIVERS),
	linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v3 13/20] thermal: Use thermal_zone_device_type() accessor
Date: Sun, 26 Feb 2023 23:53:59 +0100
Message-Id: <20230226225406.979703-14-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230226225406.979703-1-daniel.lezcano@linaro.org>
References: <20230226225406.979703-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_225519_153129_6F9FE3BD 
X-CRM114-Status: GOOD (  11.83  )
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

Replace the accesses to 'tz->type' by its accessor version in order to
self-encapsulate the thermal_zone_device structure.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> #MediaTek LVTS
---
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 2 +-
 drivers/thermal/mediatek/lvts_thermal.c            | 6 ++++--
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
index 722e4a40afef..b0a169e68df9 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
@@ -177,7 +177,7 @@ mlxsw_thermal_module_trips_update(struct device *dev, struct mlxsw_core *core,
 
 	if (crit_temp > emerg_temp) {
 		dev_warn(dev, "%s : Critical threshold %d is above emergency threshold %d\n",
-			 tz->tzdev->type, crit_temp, emerg_temp);
+			 thermal_zone_device_type(tz->tzdev), crit_temp, emerg_temp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index beb835d644e2..216f53eb1385 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -305,7 +305,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 * 14-0 : Raw temperature for threshold
 	 */
 	if (low != -INT_MAX) {
-		pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
+		pr_debug("%s: Setting low limit temperature interrupt: %d\n",
+			 thermal_zone_device_type(tz), low);
 		writel(raw_low, LVTS_H2NTHRE(base));
 	}
 
@@ -318,7 +319,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 *
 	 * 14-0 : Raw temperature for threshold
 	 */
-	pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
+	pr_debug("%s: Setting high limit temperature interrupt: %d\n",
+		 thermal_zone_device_type(tz), high);
 	writel(raw_high, LVTS_HTHRE(base));
 
 	return 0;
diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 060f46cea5ff..0c8914017c18 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -44,7 +44,7 @@ static void ti_thermal_work(struct work_struct *work)
 	thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
 
 	dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
-		data->ti_thermal->type);
+		thermal_zone_device_type(data->ti_thermal));
 }
 
 /**
-- 
2.34.1


