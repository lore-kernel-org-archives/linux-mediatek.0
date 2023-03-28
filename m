Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC34C76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 03:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f9rtmQf3+/k9brYMpe16mW92eSBX3phAG9+DZr8tElc=; b=nP5b03iCnAF1uC2l0j+uM2Lu+2
	T5O6daJx64oXdSavs3dbm8UzwDK8zXYrMAIYgrHw8GJopZkTtwjJ1GWXFggf1SPBLfgNLxNnxRfNB
	+MYF2uWRJIVDAdAVOVlKTe4N0sNwW/hxy71DaLPDqt4TrKXy6Jhn2CzjkcSZhZfaBu8r58mY562au
	21+PYOjwlci9CauBS5f/tQnZPWI+UM/S5q8DqLtSYHsgLI4pvmoFI+5e6Njqcbdr/V+wy69ut7Sr3
	L5YCcvnVhp6OxfOcC5bGKCZSxsLlMGaOpkbuTIN1CZ+9K6iQMcvQF8whoEL8N5bw5yF2PmFQUzp1R
	b0p4l8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgzjX-00Cyhj-2K;
	Tue, 28 Mar 2023 03:10:51 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgzjV-00CyfG-11
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 03:10:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id j13so9599404pjd.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 20:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679973046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9rtmQf3+/k9brYMpe16mW92eSBX3phAG9+DZr8tElc=;
        b=JuGXT7BWgidqAU+U9NFWmJkcnYoPC6x71wZQlTucGNVG+piuo5sPakfKCZuigoFSjM
         px+Y4vf8GZwNQnHAwMxhFyWA1pJ/A32WcIT58WedWyC9gLDLRe9Q/o8tu0Qb560zZrUW
         yG8VPUBn6X+e/qO69VLkUUlT6I/jjAGJZfIWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679973046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9rtmQf3+/k9brYMpe16mW92eSBX3phAG9+DZr8tElc=;
        b=NpIYdEApXAUsB0j6WHImnAavTcAo5QU7higrK3gtI69qp6lsDXrXOjWVWSXxGeCKPg
         U+pnDg6AucE1fdKw75aj/nnODG+FS7KmACJNRY4DB2wpANSTp2s9jyWrWS+sdy/wCPgA
         lSYGX4vXWqq7GBVWtYHLkRK5p9w9l8azEso9wIdvGib2i9z9cJM+8N1u1G85ifvhLot4
         2VOOex88hNwfirigbQlpncs3OJ4OnaPlDDbbK8Te1A1Wweg0he/lfsi1PRIAQVoLyb3o
         Jsfukv7c0APrA+LwnsrCfHPZ7FqAqGz4ZH4VFzLIud0HI1v6keFDjNzHZwNACK6Vbf5E
         5dRw==
X-Gm-Message-State: AAQBX9fxVWjCxohwK2y5PF0zkI0yoNdBqbSc4fpY3uGJao14KT7hkSkJ
	J3RiyTm/jfUvziIuATeBXpU0wQ==
X-Google-Smtp-Source: AKy350Yhy0dWdjNAmaMv84OP2MovOHhZZoppM+d6gBHQlrg7Kw46jgJNOk74uIpr2rEXrRPToWVjTg==
X-Received: by 2002:a17:90b:38c4:b0:23d:2027:c355 with SMTP id nn4-20020a17090b38c400b0023d2027c355mr16148392pjb.10.1679973046316;
        Mon, 27 Mar 2023 20:10:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:da70:de00:9a3d:7067])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902bd9400b001a2574813b8sm1491784pls.278.2023.03.27.20.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 20:10:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: only update registered thermal zones
Date: Tue, 28 Mar 2023 11:10:37 +0800
Message-Id: <20230328031037.1361048-1-wenst@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_201049_357623_DB271B33 
X-CRM114-Status: GOOD (  11.87  )
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

It's possible for some sensors or thermal zones to not be registered,
either because they are unused or not fully declared in the device tree.
Nevertheless the driver enables interrupts for all sensors. If an
interrupt happens for an not-registered sensor, the driver would end up
updating a non-existent thermal zone, which leads to a NULL pointer
dereference.

Change it so that only registered thermal zones get updated.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/thermal/mediatek/lvts_thermal.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index d87d3847c7d0..bf59174e18d3 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -415,9 +415,14 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
 		if (!(value & masks[i]))
 			continue;
 
+		iret = IRQ_HANDLED;
+
+		/* sensor might not exist (bogus interrupt) or not be registered */
+		if (!lvts_ctrl->sensors[i].tz)
+			continue;
+
 		thermal_zone_device_update(lvts_ctrl->sensors[i].tz,
 					   THERMAL_TRIP_VIOLATED);
-		iret = IRQ_HANDLED;
 	}
 
 	/*
-- 
2.40.0.348.gf938b09366-goog


