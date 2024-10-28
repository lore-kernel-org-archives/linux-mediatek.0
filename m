Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB423D339A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 17:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fkTku/2hlfLuFEUEbfmaTEX5P1Wden2mB6YLijG1sA=; b=UPSAOKY6fhxatizN09UcU2VMf6
	w/BWj3YpQMR9yqKp9imz29FNpGrNXaXng8QRTgVKPht8itD8IAe6vJCeSFEVxzoOBU8teBJxyGLmY
	d9ychq8RfDB/3nPrJEIhdsvzPWxb7kZdO/6PDPrBAJLmBH1J8c3COTdR7xFTooxiGg1HR1P5gRo+l
	GLXLQAezQZFaEclXB+uUGIP6m6GHg5Ar7FBoHwa2OfxtXTlZcdA+KX/DAVtUxmPdgIkbJa08xILeB
	wPjuimTm5VtPa/N+Y9+lr772NyHFoXOCIDH3pzOdR7y0QdXSeJn4H31Usfcuo/Eipkmu0WrKvnve/
	PCoTocnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TP0-0000000BdYS-2nsc;
	Mon, 28 Oct 2024 17:19:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5TOd-0000000BdUT-2hj4
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 17:19:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso61143365e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 10:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730135954; x=1730740754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fkTku/2hlfLuFEUEbfmaTEX5P1Wden2mB6YLijG1sA=;
        b=GMkIrOKI28ctAjiKBqYVoSu8ko777jLOti8Y8l7Vt5kiap6ueIPw6mMWb++AkOMJGS
         duAK8TBdswduVJoz8buNGKxBAlU8+9sGy/Uc4MBvRclFAYxwFyz955IEFLO39901C6At
         ht8EIxOTvT5Ez61PWOmA2Xi+bGF6X1FkcAQstAEsQ7DBGrhhy470w3NeDEGWZQ1dxw16
         wZVqRDo9e0vOP4zXsQRFo/YBa2DYDnHSlXS6f8LnhJHR4T5a7/T0G0TEjjLIcTE9Oihz
         23df5+mH/KhRddvYIPnjDr6WDDUACV7n71ZNv1ASfHkCSyo50tuktq8HM2Fj9KgVjJZW
         b9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730135954; x=1730740754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fkTku/2hlfLuFEUEbfmaTEX5P1Wden2mB6YLijG1sA=;
        b=scK7T5jDQvpaHKvBTz8iQtVJ9L5hO1t6jfrLW0khL9T+VIMAo/GorIIEGIlPycoM6b
         IhiXe12+U2bKKbqIMyR1/y3njs3cMP7lZ1/HSZneRWQqnGz7SjuXves2SrQyb78TBPTf
         u3uq3Vy+R3PTVP+CgImwnF1jjHAaKjRZ+qbIy+RlcTcS7eo/jjcqeCHqavddzsTcWm7D
         pNq0ffcEkomZEtZ+JqjR3KLIzUfxu7r/0JI8qVV8SXLJ4P/FCswGZRRMzzOc94jdU3na
         oDb8gjGxyjWygDPecjzGBV98rgQO7JYO87Zdb5VOMgjAquoJ6v0dVfBkUptgVEAkMntY
         +vHw==
X-Forwarded-Encrypted: i=1; AJvYcCU/tq73o2J5rG0oYG1GHVdGUK0yw6LHDRPmrPfpXA0hreJpX1u6zFAdCdXk5K+5WEnGp14u5vd5qBORMq1Vkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3mJtAXIJCEW9DQGc9KIQzcXKWrEAmYorsWce+KZysY5SUJGXW
	SRoLu96dSgsYhmXEJ+DDtKdneMqH2QTzYbd/UhHveUIZ/Q5CZaYDSxhBxu0orqo=
X-Google-Smtp-Source: AGHT+IECm76pRbyYpp6SjkcMtCuO1SyMDPfHW0X9U1Tuvf/svqN92ChLfU5gRa1/AIweI4/7e+k+4A==
X-Received: by 2002:a05:600c:1e03:b0:431:555d:e184 with SMTP id 5b1f17b1804b1-4319ad06917mr98125275e9.25.1730135952130;
        Mon, 28 Oct 2024 10:19:12 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c8a9sm10096153f8f.12.2024.10.28.10.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:19:11 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wenst@chromium.org,
	rafael@kernel.org
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] thermal/of: support thermal zones w/o trips subnode
Date: Mon, 28 Oct 2024 18:19:01 +0100
Message-ID: <20241028171901.2484882-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018073139.1268995-1-wenst@chromium.org>
References: <20241018073139.1268995-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_101915_692653_B857F7F9 
X-CRM114-Status: GOOD (  13.13  )
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
Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
Link: https://lore.kernel.org/r/20241018073139.1268995-1-wenst@chromium.org
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/thermal_of.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index a4caf7899f8e..07e09897165f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -99,18 +99,15 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 	struct device_node *trips;
 	int ret, count;
 
+	*ntrips = 0;
+	
 	trips = of_get_child_by_name(np, "trips");
-	if (!trips) {
-		pr_err("Failed to find 'trips' node\n");
-		return ERR_PTR(-EINVAL);
-	}
+	if (!trips)
+		return NULL;
 
 	count = of_get_child_count(trips);
-	if (!count) {
-		pr_err("No trip point defined\n");
-		ret = -EINVAL;
-		goto out_of_node_put;
-	}
+	if (!count)
+		return NULL;
 
 	tt = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
 	if (!tt) {
@@ -133,7 +130,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 out_kfree:
 	kfree(tt);
-	*ntrips = 0;
 out_of_node_put:
 	of_node_put(trips);
 
@@ -401,11 +397,14 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
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
2.43.0


