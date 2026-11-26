Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF3606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t4IZPWKc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=muSkL4Kn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T7Pd4931K5KCtp4eGPlP6wPvgfOQef2+z9ExSwkByuw=; b=t4IZPWKcQGa1cAB4N8myX1AABC
	o3IsW2I3tz93NhoEMQY6rIt3pXBlLznFUngriRmPwACOE2f2F7jenuOo1cbWJEX5YEeDsRPOyqD12
	PIJz9ftuHdgFIhFRy0FpZl2OHXnMtofMQOlXoZVKrLvS9f+gN6VbYH9WWVNCWP00wv0Yz4e0DI/WH
	xKequDgIEpYgO78fdUPMPk6B7gvTKgKARXv7bjHGYKb9h0ef9w75nUK7oIChoOva5XC4DfosfyJZB
	5FKlk5nLQMJ1RdD1zta+5Sa4VZNqLp+Zan1fK3i9FVypqaHW+iUFY4ehZ1ipBLogKSXhdUEvyKzi+
	PfFE2DDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkd-0000000Bikl-1Eou;
	Thu, 26 Nov 2026 00:54:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNk4-0000000BiKf-3030;
	Thu, 26 Nov 2026 00:53:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F0D662165;
	Thu, 26 Nov 2026 00:53:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654419;
	b=u8MqaOk/92z62Y3jN1u3v+zP6e5NxhYISeuJnrkQQtGIwxQRnQTeb1p5njQu+7eYCeUY
	 Htj+iAOwrff/LRIKjZNjuLHv1xs56fwuKrCkcGl0vmHU7yFjTGxgtysvxiks902Cy/Hh+
	 ZWTvmJqyu7r9LzjtQbUgKR+FmLhL1awApFhSL499a53D1I189Ipu07jUacmTaNJ7ZfHk/
	 BOILjzFTr21OxKDYeMZiFBqHkThK88S8kCAm5mRrclpIpkH71swazlDroEs3Wjt1d62nr
	 um7K/FPzcEiw8hYVsDkvh8fYvzOURnCWUnRj/6i9iDJ8vfLiSw0OBa7SsravGOFcl9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654419;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T7Pd4931K5KCtp4eGPlP6wPvgfOQef2+z9ExSwkByuw=;
	b=3lEAbmVx3TgbZnA0tbhEJpDHJFWlXK6MHAGQnWO4KSIUSPZgaOLwamSaSYg6mDbHc1i5
	 2w3s6xkc+WNGXvmvXI9RCPh9UIkoesj+Hm9hQ9qDUkM3gpK54viiffr2oVI4ux13eR+c0
	 L3zxu375g0+MGcrGZIGeL56tQTsLVTi7qu5MVT8GLNsNVtMoL35yzd6wp1KyiE5RkeYAW
	 AvRI1fygUMzeduifOoSOhCKojhdmIUjbTxOS/cwtHPiXBlpZsGbced7DTCPGvKNsXVmph
	 2uuDoNtrZwobrQeI/4bcKWS4P+IEdI2Y460QUyZAqcHviFnA21kgqT641I3iFArzjAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87CD91F000C6;
	Thu, 26 Nov 2026 00:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654419;
	bh=T7Pd4931K5KCtp4eGPlP6wPvgfOQef2+z9ExSwkByuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=muSkL4KnIc/YiM8rsmzIfQbB+Ep7mZCdmDPSLm4bHVQNRvjJ2A9LdRb1Te6DEGp7B
	 grdotYw2GX3ozF4TBczWmjovgY4nwofEm2swRXB0VZCiMj+nim6wp2qMWcS3DC2zpq
	 nIJ+2IkR4bhBHH2vXWCYo232q5fXzMzEz3oiS3diaw7bGdNRJRIVVUC5vqA03IK9gF
	 VjKHrmd5sXNbMMG+qq6IHCaSB+ia+Ic+nAYgT+9eLrr4Orb1rq+UoB3m5KIx7XVkXm
	 Osqn/vYlcntJE0oyuvTG7hcEgro47ID0I3O62pItMZzQ1T5pZ/fsDRm8//zHb+Idx2
	 UYudiNDT//NRQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4A3024D13C;
	Thu, 26 Nov 2026 00:53:23 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com, 
 lukasz.luba@arm.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] thermal/drivers/mediatek/lvts_thermal: serialize
 lvts_set_trips() per controller
Date: Thu, 26 Nov 2026 00:53:24 +0000
Message-Id: <20261126005321.71799-4-iasnezhkov@gmail.com>
In-Reply-To: <20261126005321.71799-1-iasnezhkov@gmail.com>
References: <20261126005321.71799-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654402; l=2401;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=gkAgfTt9QdjOaikRkLcp8sO69zHNfxvhjZ7a53W/8uU=;
 b=gviRhqdPcdcSYCl9gslZUIi4rn5/AomBFOAcPTeJ4yvj3U6BZZYu7oXI5SNCljFJdopSgeIOa
 2TFeAVSlGCvAJREN01iav2aYknFNmG7w3D3FtqAUmwFXwUm6t7rbhV4
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

Each struct lvts_ctrl manages up to four sensors, each registered as an
independent thermal_zone_device with its own tz->lock. Concurrent
lvts_set_trips() calls for sensors sharing a controller therefore run
without mutual exclusion while updating lvts_ctrl->{low,high}_thresh,
performing a read-modify-write on LVTS_MONINT in lvts_update_irq_mask(),
and writing LVTS_OFFSETL/LVTS_OFFSETH.

Two concurrent callers can lose each other's LVTS_MONINT enable bits or
leave the programmed threshold registers inconsistent with the stored
controller thresholds.

Add a per-controller spinlock_t to struct lvts_ctrl and serialize
lvts_set_trips() with guard(spinlock)(&lvts_ctrl->lock).

Found and drafted with an AI coding assistant.

Fixes: 2bba1acf7a4c ("thermal/drivers/mediatek/lvts_thermal: Manage threshold between sensors")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 9b8b653..f0b7caa 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -4,6 +4,7 @@
  * Author: Balsam CHIHI <bchihi@baylibre.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -16,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
 #include <linux/thermal.h>
 #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
@@ -181,6 +183,7 @@ struct lvts_ctrl {
 	void __iomem *base;
 	int low_thresh;
 	int high_thresh;
+	spinlock_t lock; /* protects thresholds and LVTS_MONINT */
 };
 
 struct lvts_domain {
@@ -453,6 +456,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	u32 raw_high = high != INT_MAX ? lvts_temp_to_raw(high, lvts_data) : 0;
 	bool should_update_thresh;
 
+	guard(spinlock)(&lvts_ctrl->lock);
+
 	lvts_sensor->low_thresh = low;
 	lvts_sensor->high_thresh = high;
 
@@ -989,6 +994,7 @@ static int lvts_ctrl_init(struct device *dev, struct lvts_domain *lvts_td,
 
 		lvts_ctrl[i].low_thresh = INT_MIN;
 		lvts_ctrl[i].high_thresh = INT_MIN;
+		spin_lock_init(&lvts_ctrl[i].lock);
 	}
 
 	/*
-- 
2.54.0 (Apple Git-157)




