Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC422C7EE30
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 20:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=; b=xbMIULYDnxkxTkqAgh+rZgRVbJ
	DBYSIcMKPvN5Tpmhb3D08gBtzd7Cn/MM873+XU59b5eNdK5kEwc+ZdO8PTzB7I6KIa2ACBaeX6e8p
	cB8XjBeIx3aSoQDXC0aCmdkOdeuRDbZceT7dIlCgPlsLXyxoGmq2eBLgr6iG10J8FpUQ1WUTZI/3c
	j9aiw1/3M478rBsiwSzFjPhd1dlk5zADda7swLgSFr6AGepioMTrWbh5dgd4NxQuZZkW710smnc5M
	lb/xREThufkP9iHkj8+4aK3R05gN2YIQmhETlUsBD72N0S9gcd2sWLGHUPni5sxQER2llmNhwU6rx
	O8Iw+VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSsh-00HTtw-KV; Wed, 01 Mar 2023 20:16:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXSrn-00HTMd-8G
	for linux-mediatek@bombadil.infradead.org; Wed, 01 Mar 2023 20:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=; b=j9z3+0+LxisoR9eDjMukIN5hdv
	EXi5QDU/e8L0zI0CxIS1dUJCXQe0QY/HoQYUWxaxqxpQSEivxSAERATfwMUUpIj/36NvghNSsBigk
	KtGkv+urdXFRoO70avsMZUS8mizsT9H1W+YLKE6UAFOVXJV7yOJm6bB5Qa6qDgXz25nTgjXlKKnzm
	6dwevtsoUZGpUQXpXr3BFPuKSNv6cHo+Yp5ttAUSqd0/ZWzZRrUsIdQ6ZfRKCFFNLn/9j4Jk7uPh+
	r75JbgWM/VJsyu4dDJy049FNvvjH3IzrPPaKCyfwf4S6FylqOidaBObcPtQBzazMAZ2nuawm8gTXn
	HRJItZ0Q==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pXSre-00F0IH-0d
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Mar 2023 20:15:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id az36so9395331wmb.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Mar 2023 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677701746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=;
        b=ukkjFNfgK59eu1LeshuNmpkbqUe+57GbYmcQvpYODW4eZc+/Eq6TviqWeezCFCnshm
         virQlpn5g0pq5dm0tCb4La0RxiEepuXJ0ATEarJnTRo5L8kW0LuVLeL/QTLb/cYJ2876
         cQbDvyf6N2XuYiBCXId7qImjTLXYL2KmFERCHLCfpfWgff35YPxmw669uMYTZEI6Od5x
         u0AdvvvxIOdT5F0INCtrz755ZtjnqQ6UMFMVp+avsAlis1j1mLMZYvb8AB88hrq18UWh
         HlmsLFhEVn9Xin7EvoiMYtCOV5K6vMHyJsJZJ8i3AV3jxXkr2z/oBGTV8Eow78dq+qQs
         GVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677701746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=;
        b=zUW8LxF6Q7ZdhtrkM8gFm7afj5+MRys98s5b/w40U8bOlV8QMTXD3kKckReC2Hqe16
         feHRsIlNrW3bP5v6856MO3iBg6W/HZEarwCeez5f8epBtgkiKMkDlbTDlmAuGuCIv44Z
         cDBQYpAQ3eXBwcD1ZgAsYFKHtobpH+X/alPa2imXad1VY+sledJsyqR6a1goDAgTdD/N
         OWkZIISQRkvQ9kmZWx7YhPfVK/PMRjYW9S8O86BM6HiS0FwdU8h8slNWq/NotmEiF7W8
         854r9mUqfqRampGIg2Hajqu6pKkF3aP5qQB4RsaQepjflaKY22hCLg7H7zCLnmPUWY61
         ItvQ==
X-Gm-Message-State: AO0yUKWOBtHQhoSRpabD40m7qnRFLsbl+WLpZK2HEotcKfprl5gHInaI
	3cUPjwWsm6uyd1/a1J6OlOIs7A==
X-Google-Smtp-Source: AK7set9sVSbQhQevjSNopAXDfJiA3HK0YMzMlVoLJ/jyJ4/SWnabQbYwdqwMzhMc8PU0zFG7/gjZ9g==
X-Received: by 2002:a05:600c:30d3:b0:3eb:376e:2b9c with SMTP id h19-20020a05600c30d300b003eb376e2b9cmr5682213wmn.36.1677701746296;
        Wed, 01 Mar 2023 12:15:46 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6ffe:ce4f:bd31:1e6d])
        by smtp.gmail.com with ESMTPSA id x16-20020a1c7c10000000b003e70a7c1b73sm576546wmc.16.2023.03.01.12.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 12:15:45 -0800 (PST)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mark Brown <broonie@kernel.org>,
	netdev@vger.kernel.org (open list:MELLANOX ETHERNET SWITCH DRIVERS),
	linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v5 13/18] thermal: Use thermal_zone_device_type() accessor
Date: Wed,  1 Mar 2023 21:14:41 +0100
Message-Id: <20230301201446.3713334-14-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_201552_447792_A75D641D 
X-CRM114-Status: GOOD (  12.31  )
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


