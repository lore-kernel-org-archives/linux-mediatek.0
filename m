Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403FCD21261
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eq4DcLX81xhHJQxcCvF71zsYnZphDuzGs7+nmZig8nY=; b=OfP16C8lCTfAO30BcMB5FDmEBW
	MF3lc9BWkUlRm19DkshLgmRfg/F5ne99WeTPjw0Qn9eYuQQoKAqTA4Vwndj76nD0YR+ECDFD2JyxP
	Z3RjK/XxlovDQGYUTnxDORfYw3groPGicIs/Wq6NRY0rcHoIm1xhLdm+NV8scRp8FBfR7QVutwSo+
	X5oYU6Bz+pX/7qnigAGB//9EhhXGttSaU4Ly6XSBuHG9M3m/36kW5WdLX2FwcddYlotsy2mw6LHMe
	c7F0U8VkId86/9oz17BsJSfsb2zb3Ii0zFzRIwqdZdBthNHAnyBSM2Pz+A3wq26O9cg8GbwB1rATs
	Yd8762sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MT9-0000000EHAq-14kk;
	Thu, 17 Oct 2024 09:06:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1MRd-0000000EH1Y-33IL
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 09:05:27 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso430497a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 02:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729155920; x=1729760720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eq4DcLX81xhHJQxcCvF71zsYnZphDuzGs7+nmZig8nY=;
        b=av+YH6ujsgmAiTscY5JwQlD5dOvVrVA80dltlFYUn36ms5RhIGvqFsRWt5EENtNPFU
         jmCEMO6boxfjqeWX8ksThqifeo2xvwYWTIsHXODo1MXzcs8z+HuZQ6AXALGToND8WLLm
         fIexTxai9Mm3y6QC0raiSQ97c3ybmPs4NvRyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729155920; x=1729760720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eq4DcLX81xhHJQxcCvF71zsYnZphDuzGs7+nmZig8nY=;
        b=ZOS+Ps5D17GCLZ5WA8AeCHR7QwfZGs+nnpUhl0DAEqBAFoErKeCEhmihdxiR5bx/0x
         Wy5SzWuy0eHfxvvJQVIPjKPJmQ0u94xNxXnngua4eR08ldLRe90yHTlQPEbAJzAgdl5e
         gUDJsArxlaieFdRs9LVUWb+YOA8evJv6gJvVBc9XfsCXv1i/TBKycSZEhj1qHWWmiCC/
         H+Uk409yf/2L+8cgQxWrwYTxK+VlDLfv4nMddsEIMUolvfKF4m+G1Y1EbxjckMl1aLlz
         oedFtv9p0awFAeeuRonb/279qPOYkuBgdSbUC7+x+J24cnX9o2H9gzhqeJNL3SU1tfP2
         bo+w==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1Vg7RPH7cjSJGiU68yoCzVbzEvHw03Axi7yf9hdPUSFJbERdcuky7I8/76Rg0SeGvYLe3pL0TVDT4jWlaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ZdLDvc6q73BPdaUg1Puq+RmPBHKuRt6tqHCyVVTCORK7GNIn
	fmxjSSy2Mu5XpAU7qWFmN1PWVk0iInkxLrhiEI1dcntqeT4Bj7MzXZvh3vRo/g==
X-Google-Smtp-Source: AGHT+IE8sc7gGXO+epscpZQ4+3ix7OqJhkRjhM95PD83qJR77jaGJm3mMk8J1ijNb16KGYomMx1MwA==
X-Received: by 2002:a17:90a:fe18:b0:2e2:af52:a7b7 with SMTP id 98e67ed59e1d1-2e31536e834mr19968279a91.34.1729155920193;
        Thu, 17 Oct 2024 02:05:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08c0405sm1344305a91.14.2024.10.17.02.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:05:19 -0700 (PDT)
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
Subject: [PATCH v3] thermal/of: support thermal zones w/o trips subnode
Date: Thu, 17 Oct 2024 17:05:02 +0800
Message-ID: <20241017090503.1006068-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_020521_931513_CB9E15D6 
X-CRM114-Status: GOOD (  15.18  )
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

I kept Mark's reviewed-by since the changes are more stylish than
functional.
---
 drivers/thermal/thermal_of.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 93f7c6f8d06d..be1fa6478c21 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -99,14 +99,14 @@ static struct thermal_trip *thermal_of_trips_init(struct device_node *np, int *n
 
 	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
 	if (!trips) {
-		pr_err("Failed to find 'trips' node\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("Failed to find 'trips' node\n");
+		return ERR_PTR(-ENXIO);
 	}
 
 	count = of_get_child_count(trips);
 	if (!count) {
-		pr_err("No trip point defined\n");
-		return ERR_PTR(-EINVAL);
+		pr_debug("No trip point defined\n");
+		return ERR_PTR(-ENXIO);
 	}
 
 	struct thermal_trip *tt __free(kfree) = kzalloc(sizeof(*tt) * count, GFP_KERNEL);
@@ -386,9 +386,15 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 	trips = thermal_of_trips_init(np, &ntrips);
 	if (IS_ERR(trips)) {
-		pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
-		ret = PTR_ERR(trips);
-		goto out_of_node_put;
+		if (PTR_ERR(trips) != -ENXIO) {
+			pr_err("Failed to find trip points for %pOFn id=%d\n", sensor, id);
+			ret = PTR_ERR(trips);
+			goto out_of_node_put;
+		}
+
+		pr_warn("Failed to find trip points for %pOFn id=%d\n", sensor, id);
+		trips = NULL;
+		ntrips = 0;
 	}
 
 	ret = thermal_of_monitor_init(np, &delay, &pdelay);
-- 
2.47.0.rc1.288.g06298d1525-goog


