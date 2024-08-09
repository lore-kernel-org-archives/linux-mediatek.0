Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981C2C52D71
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 07:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TSZy4qeB9prpZkXZFFSCy09Nr7J/x1zL/3+bFofkJV8=; b=hS26Jj4P0/nRYQG81ckmxrC5kZ
	7NtlKCUkyl45skedAHEaIALMoWMniRiUJJuGeM3XYe4f3a634a0PDo3RZ0uRronLjnBK3p6TiPOWD
	vHz8eTbXi6Uc5diaDwKsXPxpkGvsDyWGFbfs/W9NELD8Mc3Eu/tEueS5gHno+3UlLF6JqLOf0dQLT
	6dqaLoHd2iyy6OQgn5N3nBpiojy6t7e7WvsEjRpY/g2+pmmKFeSRJ2FUI1Yy9V2PRht8fCbeGiryI
	IE6/6FAixgyc+LTnb8CA1AhOxJAKnx33lpDcWs2opX3+V/6oClPHBXKzBf/28+FBHwrsW2QPR0twg
	Vm430QfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJk9-0000000AUyD-2pz1;
	Fri, 09 Aug 2024 07:08:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scJk6-0000000AUxM-0GK0
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Aug 2024 07:08:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fc60c3ead4so14702185ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Aug 2024 00:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723187333; x=1723792133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TSZy4qeB9prpZkXZFFSCy09Nr7J/x1zL/3+bFofkJV8=;
        b=IGlhj1qbYVlzz9+DN4HjBFno8X9BJ/TOJoNdS7k/lcIDQhn1C9A92n/c8H1HZH158D
         cPPJjc1lt+VNBLeFgLh2ks+ll99RGq0IkcrQG10VTwFhUVSRrkuxNGPk/WxqKjDn6HbW
         rS0gzhJeEcwLzkHf/9nDn7/Pe23s0u0cl6w4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723187333; x=1723792133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSZy4qeB9prpZkXZFFSCy09Nr7J/x1zL/3+bFofkJV8=;
        b=MLIA3ZJpnL+vc8RB10LfJiC5sjD0RaP+Hrxp9UjO2QzmVWhitcXAbY1soVscyPMSOW
         x5eWfWtofGJSxphJqnnAkqXSEe7XceFrz2jS+C10eKq9NWRiR8rPpkffCzH4eehDsdlu
         KoL7DsfMyqMvTzhaO4OgfFER/qAJUGWiK+Z8X3km32lflZRL5KL9qxo7LEfZgY4dQGXW
         Vxc/s3ZEK1BHrapWuI6xJO8Hj/ONFFR5l/PrQSqpn0eI/E8aOpfj8ouEzhCOLK5ejvyQ
         YVLhmz236fMSb2I1Tqo0c12dxqDtGkcds/PdrInb6QT3fiB6r7m5J2fn6yVPVFAJ1D/b
         bMcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBl1+ZiR1RNku+VR4UKBpoBHFjQfRex5G9GEsoKWH6YCraDV8uENWqGttzS0RHLVVO2TjHR91yU1GskEO+U/TUdwgc+qpUMltkrV0e1Yf7gSEl
X-Gm-Message-State: AOJu0YyGvmvRxOUXeJyLke724BTfwoa60ucWXlfEyojomIcBQQOhIKn+
	vXF4DIypBMkpVK7fLiIEr6biVrlOboBHE1JkgUPR4ymjaMTwzCly3jNhlzTwjg==
X-Google-Smtp-Source: AGHT+IEojA8/Dm/IiJ94OPxhJiSpOpo4eMo23qz6LSsMPk8j238AnhJYY+ravisXXY3kEbh0Zu1A8A==
X-Received: by 2002:a17:903:41ca:b0:1fb:7435:c2cc with SMTP id d9443c01a7336-200ae5e6889mr6909505ad.45.1723187333055;
        Fri, 09 Aug 2024 00:08:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e48b:2b26:14f9:21cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59294515sm136254215ad.244.2024.08.09.00.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 00:08:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: Icenowy Zheng <uwu@icenowy.me>,
	Mark Brown <broonie@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2] thermal/of: support thermal zones w/o trips subnode
Date: Fri,  9 Aug 2024 15:08:19 +0800
Message-ID: <20240809070822.2835371-1-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_000854_153830_10F5733F 
X-CRM114-Status: GOOD (  15.37  )
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
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Resurrecting this patch specifically for MediaTek MT8183 Kukui devices.

Changes since v1:
- set *ntrips at beginning of thermal_of_trips_init()
- Keep goto out_of_node_put in of_get_child_count(trips) == 0 branch
- Check return value of thermal_of_trips_init(), if it is -ENXIO, print
  warning and clear |trips| pointer
- Drop |mask| change, as the variable was removed

I kept Mark's reviewed-by since the changes are more stylish than
functional.
---
 drivers/thermal/thermal_of.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index aa34b6e82e26..f237e74c92fc 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -128,16 +128,17 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 	struct device_node *trips, *trip;
 	int ret, count;
 
+	*ntrips = 0;
 	trips = of_get_child_by_name(np, "trips");
 	if (!trips) {
-		pr_err("Failed to find 'trips' node\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("Failed to find 'trips' node\n");
+		return ERR_PTR(-ENXIO);
 	}
 
 	count = of_get_child_count(trips);
 	if (!count) {
-		pr_err("No trip point defined\n");
-		ret = -EINVAL;
+		pr_debug("No trip point defined\n");
+		ret = -ENXIO;
 		goto out_of_node_put;
 	}
 
@@ -162,7 +163,6 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 out_kfree:
 	kfree(tt);
-	*ntrips = 0;
 out_of_node_put:
 	of_node_put(trips);
 
@@ -490,8 +490,13 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 	trips = thermal_of_trips_init(np, &ntrips);
 	if (IS_ERR(trips)) {
-		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
-		return ERR_CAST(trips);
+		if (PTR_ERR(trips) != -ENXIO) {
+			pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
+			return ERR_CAST(trips);
+		}
+
+		pr_warn("Failed to find trip points for %pOFn id=%d\n", sensor, id);
+		trips = NULL;
 	}
 
 	ret = thermal_of_monitor_init(np, &delay, &pdelay);
-- 
2.46.0.76.ge559c4bf1a-goog


