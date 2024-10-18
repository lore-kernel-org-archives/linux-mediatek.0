Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E714AD3C55E
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 07:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IlPybqmG9m/ZAU4ubVutLFbdpffPKHkEonNeryEzP1o=; b=zM2yNPmRNfBuSauV2k12WNiZrM
	1aHp2S3mx5lVYPmJAr2xiP+dCEXSM0XxYffsxa2LuPienXXePZXopA5b8Yr/B9l9m/UgJxYy8MR52
	u6ZQYLdA7hGgEpnTZ9C+TdhhSZ78oo10ctKlb4pBF2GmIIIbPQ1UcE+lOxU+SmyPLIXYyNSY+hxGM
	xQCT82SqfXTRZNPkrwpLZ1VGzWpTD5eqwUa07xpGyCFLGYxfsDHAKcEvapp5744RvFfaqPsvLPXeG
	ct5GMR0mEuXazgg9+2V5XU9l4yGZFKBOpfhJPX/MGZTiOYQyBoab9Y5PFpXREIwSMdUAXMQP2/oUf
	tr25nAeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hUA-0000000HLP1-3P8w;
	Fri, 18 Oct 2024 07:33:22 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hSf-0000000HL66-3bXN
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 07:31:52 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-656d8b346d2so1218332a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 00:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729236709; x=1729841509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IlPybqmG9m/ZAU4ubVutLFbdpffPKHkEonNeryEzP1o=;
        b=i5AN6uTuQRThIjZPvF2hSrrE6k+ztpv2QxXY6jKbN9n2VrzLzH5XYN8KtRflhBLTbQ
         kUeqI7j2bbfVKgqTmVatPxSJoRaNfakEReiP6c59ESaOI2fyUqETfhXka2K3eSuoeXZG
         hkVXhoGRbZsbiol9PFv0hnnNep68xqJNsxr7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729236709; x=1729841509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IlPybqmG9m/ZAU4ubVutLFbdpffPKHkEonNeryEzP1o=;
        b=VLFqkoIhXdNjQG973d/POpv3UNwLz+IuLbfTugEnDVJoUHYCnhHj1W6o2UyvzCVvxw
         8v79u441dZAerJTDz7/sc2mBxyJASn/FLnqs4s1G4fKnTEbUwSiAPQ6MZ3MRMpYQTrUr
         Qp1kSX8mkWbRs32Oqle9vk7s45pJ9SKcNHGcZiV6sLrfR+OKRvQ/HXIH9CFC1Dls225Q
         mWwiMH9wwywglCay645H91Hwpe36qKk/vmACjRfSrJf4Ts5mmDc4xrM6Eu2pyHh1UcHC
         FV2+rkAqc798+B//WAPilkQYN8+dQ5SnIPW4on4A0olsVg+ZJuqORdWB4TDSHFFh+8M5
         xNBg==
X-Forwarded-Encrypted: i=1; AJvYcCU8TKhRHp7y97ciG4b8JTLezI8liJqj8SnBPo9uXZbR0rjDWCTgaJlZ563Wu6q7fhbKCzg42mBO2CK1XEMxnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJPKRKJ3G4/Fo2TETG/Kc/bSL6cQbESMZjmBs4JzJZUzrfPVLo
	S4BtkcEKGe645O+ES40QSiIquCd+cxP2vmHFZ3cMp4vCH+X/hF6sqLh7MnJQmg==
X-Google-Smtp-Source: AGHT+IHLIrR9ytIHJoh0tpY7PloSKaVtl6gokdxvrnHnBae8s/7gjJhQ59rft77DxeV3cTP3OmeRAA==
X-Received: by 2002:a05:6a21:70c8:b0:1d9:575:6659 with SMTP id adf61e73a8af0-1d92c58fa40mr2750256637.49.1729236708639;
        Fri, 18 Oct 2024 00:31:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5e77:354e:2385:7baa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc229a7dsm745320a12.20.2024.10.18.00.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 00:31:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Mark Brown <broonie@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v4] thermal/of: support thermal zones w/o trips subnode
Date: Fri, 18 Oct 2024 15:31:36 +0800
Message-ID: <20241018073139.1268995-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_003149_907906_11B1E4C6 
X-CRM114-Status: GOOD (  16.35  )
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

From: Icenowy Zheng <uwu@icenowy.me>

Although the current device tree binding of thermal zones require the
trips subnode, the binding in kernel v5.15 does not require it, and many
device trees shipped with the kernel, for example,
allwinner/sun50i-a64.dtsi and mediatek/mt8183-kukui.dtsi in ARM64, still
comply to the old binding and contain no trips subnode.

Allow the code to successfully register thermal zones w/o trips subnode
for DT binding compatibility now.

Furtherly, the inconsistency between DTs and bindings should be resolved
by either adding empty trips subnode or dropping the trips subnode
requirement.

Fixes: d0c75fa2c17f ("thermal/of: Initialize trip points separately")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
[wenst@chromium.org: Reworked logic and kernel log messages]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This patch is based on Krzysztof's cleanup patches
  - thermal: of: Use scoped memory and OF handling to simplify thermal_of_trips_init() [1]

Changes since v3:
  - Set *ntrips = 0 and return NULL from thermal_of_trips_init() if
    no trip points are found in the device tree (Rafael)
  - Dropped log level of "no trip points found" message to INFO
  - Reworded new "failed to find trip points" message to "no trip points
    found"
  - Reworded existing "failed to find trip points" message to "failed to
    parse trip points"

I dropped Mark's reviewed-by because of the new changes.

Changes since v2:
- Stacked on top of Krzysztof's cleanup patches
  - thermal: of: Use scoped memory and OF handling to simplify thermal_of_trips_init() [1]
- Adjusted to account for eliminated error path

[1] https://lore.kernel.org/all/20241010-b4-cleanup-h-of-node-put-thermal-v4-2-bfbe29ad81f4@linaro.org/

Changes since v1:
- set *ntrips at beginning of thermal_of_trips_init()
- Keep goto out_of_node_put in of_get_child_count(trips) == 0 branch
- Check return value of thermal_of_trips_init(), if it is -ENXIO, print
  warning and clear |trips| pointer
- Drop |mask| change, as the variable was removed

---
 drivers/thermal/thermal_of.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 93f7c6f8d06d..abafce22c91f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -99,14 +99,16 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
-		pr_err("Failed to find 'trips' node\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("Failed to find 'trips' node\n");
+		*ntrips = 0;
+		return NULL;
 	}
 
 	count = of_get_child_count(trips);
 	if (!count) {
-		pr_err("No trip point defined\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("No trip point defined\n");
+		*ntrips = 0;
+		return NULL;
 	}
 
 	struct thermal_trip *tt __free(kfree) = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
@@ -386,11 +388,14 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 	trips = thermal_of_trips_init(np, &ntrips);
 	if (IS_ERR(trips)) {
-		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
+		pr_err("Failed to parse trip points for %pOFn id=%d\n", sensor, id);
 		ret = PTR_ERR(trips);
 		goto out_of_node_put;
 	}
 
+	if (!trips)
+		pr_info("No trip points found for %pOFn id=%d\n", sensor, id);
+
 	ret = thermal_of_monitor_init(np, &delay, &pdelay);
 	if (ret) {
 		pr_err("Failed to initialize monitoring delays from %pOFn\n", np);
-- 
2.47.0.rc1.288.g06298d1525-goog


