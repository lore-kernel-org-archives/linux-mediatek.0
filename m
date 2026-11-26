Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BC606A69A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PWg/yYiX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CVoSkYA4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uU22h3jpaXKv8VPx4Lx9G4sdjfw/2Tu7j5+Bo/KJuE4=; b=PWg/yYiX4d3me+vPZ59VsdBcWe
	QVj42R0G2Sjx5snPZk4I9dWONBCfjQMxfk+gLQ+IXc/UuiagQfGeZ/tPr+zd7P8/9qp2vGc6TcKEh
	oAvah8lJCEfZYsAiJaUZ4/uwigGdYvHsEUMSFQ3uDQhvohTZ7Zryg+LXqAdHCXrrG8R/tK6QNvrHV
	2/hu+J87e56K7/uEe3y0hpr8h/90dFJZg2NrtC6MX+j3OUGfbG4k67ze6599OxpHuWc3cdmxXWMvg
	HUaP9dlRRBEbW3fmCmbXvLesM3p2Wu54WVwD5+ZdtslowsmVseljg6u7sH/TpFw2yztckVzgn7WAg
	p5qQqFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkQ-0000000BiZE-16il;
	Thu, 26 Nov 2026 00:54:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNk1-0000000BiIn-23Hk;
	Thu, 26 Nov 2026 00:53:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4A1862165;
	Thu, 26 Nov 2026 00:53:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654416;
	b=U4eNpPdWjFR3iu4pk9HnKg1T7Nxnc+2ibWelBNLQouIg5XMkJNa2Q6gbb8+sKT1L+kdV
	 oyYKTbY98LqCH/LObfL/2sPfzpajYI6pgc2XECM1lofMGbTqMeC8lEXgJ5uCJ8k9zEeA8
	 uIJ0pm+Xp8ypzCinobrLlQ6VOTV+KMd957cCyU9rL1o7va3iscqZwyEWxzi7uCZUqtQKK
	 0nGlFEDOGu9FL56rBXrjP+w1mmY6GuDU/LatOx/XJ40zD1qZ89Yv/brj2oYLdbs4EMLzA
	 Ds1Gsv8+2Hzhd1GJlKY6Xe7kfM6GsE4MNZTiCF7urP9lVEow2vjM3uGm+aHzs1Iy70A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654416;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uU22h3jpaXKv8VPx4Lx9G4sdjfw/2Tu7j5+Bo/KJuE4=;
	b=iQydiiG/GbQihixLE0A+IaCibQHxTFLJtwsrdVTA3MXf53lhijtZ1vjx6aD61NLsUjAe
	 j8tPBbAAZmtno3dJWSm5MWPOrT0Iyy3tpIYOGrVr8eaBOxVkDWa9Z/Vm4aUDvqrwvQ/32
	 hkP86MsFjy8T1RRPLJmVmtxAuxRoLz9B7mRaQtEsjdq1vIqk7mBND+g+eqLZNYJW0o+qX
	 Yzpef88RspVJpQXIbSbPRRqEnH9eUv3jtNXq8/j4LU/2CY9VkkLka8BdnjXfCnO7ELpd2
	 Vk2cSYkcT9noNvxj0eYhiL0wz+Wmc79snq/gw8+6FadHncQfab1Hk80arBlZT/eEzfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D8B31F000CF;
	Thu, 26 Nov 2026 00:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654416;
	bh=uU22h3jpaXKv8VPx4Lx9G4sdjfw/2Tu7j5+Bo/KJuE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=CVoSkYA4VTpjKgnbLGSLGd3+mjugv5vPoCrVeBkXpqUksIUBIVaLt1Z1rnjmkAtFA
	 p8fhrSXzvEc3KD1rNjsiPWzWYlHzB3ieKAf4AJg7KGw2okvB6cQoZDvJIhMxAPFBPZ
	 y6wQYpEpu/gP/+Eii8MvxE86cyNe5/x9mWOdE4qE++6Szm2qBp8gVHNkBda5k7pqcw
	 tNdyr9u9G7pspwrWen7diFMJAfRZoro8bwq7fBTP9vlITo10yRmHlKcPP8JGlwJVwF
	 Si1Wie9UPDV43ZgvFIqRFtsb5m+qnYw/gBLm9G5XUybiljl3s/ogLIDTPvadSeY/Rs
	 IBvhbUbAhVoJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6E2624D140;
	Thu, 26 Nov 2026 00:53:23 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: daniel.lezcano@linaro.org, rafael@kernel.org, rui.zhang@intel.com, 
 lukasz.luba@arm.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] thermal/drivers/mediatek/lvts_thermal: skip sensors
 without a thermal zone in IRQ
Date: Thu, 26 Nov 2026 00:53:25 +0000
Message-Id: <20261126005321.71799-5-iasnezhkov@gmail.com>
In-Reply-To: <20261126005321.71799-1-iasnezhkov@gmail.com>
References: <20261126005321.71799-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654402; l=1531;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=GQljtqYQ6lcHw8R3VtJICUMkx+Xq1lALWiNrkmGHLgg=;
 b=DH/AUAWu5lnGqPy8+N3l9XPuuvdXd1jikIKHLwpyiWTax2zPR9JKcsvnhDQ2Z0kSFmJa1+W52
 S6YPolMrjUSAe9bNSFd6DBmtwUbgjzO1f7yZdbaIP+h96n3Oxg60u20
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

lvts_ctrl_start() skips sensors absent from valid_sensor_mask as well as
sensors whose thermal zone is not present in the device tree (-ENODEV),
leaving lvts_ctrl->sensors[i].tz as NULL.

lvts_ctrl_irq_handler(), however, loops over all four sensor slots and
passes lvts_ctrl->sensors[i].tz unconditionally to
thermal_zone_device_update(), which dereferences tz immediately if a
status bit for an unpopulated sensor slot is set in LVTS_MONINTSTS.

Check lvts_ctrl->sensors[i].tz before calling
thermal_zone_device_update() while still acknowledging the status bit
with W1C.

Found and drafted with an AI coding assistant.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index f0b7caa..5fc87a8 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -588,8 +588,9 @@ static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
 		if (!(value & masks[i]))
 			continue;
 
-		thermal_zone_device_update(lvts_ctrl->sensors[i].tz,
-					   THERMAL_TRIP_VIOLATED);
+		if (lvts_ctrl->sensors[i].tz)
+			thermal_zone_device_update(lvts_ctrl->sensors[i].tz,
+						   THERMAL_TRIP_VIOLATED);
 		iret = IRQ_HANDLED;
 	}
 
-- 
2.54.0 (Apple Git-157)




