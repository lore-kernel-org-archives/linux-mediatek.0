Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8989CC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/P3I/ez21YDg7amSoWE87jvQjiNSKk7RcYzoeglwgM=; b=gT+UkuiCHAyPofGe5htAipF8vq
	YAajD3kOXn3AU5anBodFfIV6x451+C2rtT7bu3/bIOlT8HcIm+QXdFMdVqvqX8HqlnijBS3tB480S
	WPysfRZfNjbxn7xbf8TFteDzIMA+K8z0RXiXLthoV3V0PD8uxsWfIBSq6G7/L6BfdZf150A8c3n0b
	tubivcEUy7ryK2NW/GpM2S+o80C8qavBcMYbX1I5Nw8rjmIK4tWJgkZ+TUndVWSsz+1/enninokIa
	GoKurdUgtaXAPp7/+/rKOUf7XCVFONcMja0lzVjuEi1R12z88XzLpSFfgFYRUd7LMPIUayDqA4sFz
	SyOD3Qkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yXB-00000007Ul4-35wG;
	Mon, 06 May 2024 13:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWN-00000007U5i-35wT;
	Mon, 06 May 2024 13:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=g/P3I/ez21YDg7amSoWE87jvQjiNSKk7RcYzoeglwgM=; b=a7BCjymG5oMuBoBHQOM70gqcXi
	YMutt7isuXDJP+oEGe2f+2nHpGQLiNmZUY8bzuq1UV91e6CC6ldNbt+WM2unKNHitaQdUTi4XWAEl
	Vif+mb0Q9JUjvAVLYmIzzq1QiyN3aktdHCSD+ZR5+ltuX6V7f5CIeO5mpKlKWxI4LUv3GMs38NAcJ
	iUwoYIsfsSjxDVr6Rr82BoFarr1vSaWtv4xeXE/fo+tSkgzlAJU0dgIh3m+KOELqwYYC/Ju2e5my+
	L3IoaecEFiRqZgfKo0n2M3XzihYAdPJ7E9j9msiHstFzYKaolLLmFGCPCm9KmPz3JbYsLsXKT4bOl
	JQnXxnHA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWJ-00000001jFX-1Wvj;
	Mon, 06 May 2024 13:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73423612B8;
	Mon,  6 May 2024 13:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D83C4AF63;
	Mon,  6 May 2024 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002601;
	bh=paegLAtAIiOzY5eKQeauNPYuwsGxSeeUGgOBWr0kV1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DqI6QqBAEh0SLMoX6jxGMlYEF7hX2qBs28XSz8VMiI1jujVuLsNYoAqiEcAspAaz4
	 Zyp+ea/4k4F9fQg4bs2/DWeuY4Yc/FWTDEInQn8XN1MgHgpeGwF8VYsX1NeIcs6ivM
	 xQ3sJb4SWDoKdOYIC80ppCzDUcx7HYU8Ig8tmph0+spRJzQziEZeyuPuySnCn3hxJS
	 OEMPgZx4Bejm8cLNBMRfkb/Oyfu+1rxtZYXfsR82ol9U4DF4tPlZsBEWbTCONNoGq+
	 +bLz1C7cSHzISiOvmcR+xzL93l5nKPDCoOcpVQgg1xR0NePq2Uj5hlocb3aP95yCM4
	 eZGn1TO44UzPQ==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:49 +0200
Subject: [PATCH 20/20] drm/bridge: tc358775: use devm_drm_bridge_add()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-20-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_143643_887510_DF2B5A2C 
X-CRM114-Status: GOOD (  11.29  )
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

Use the device resource managed version of drm_bridge_add(). This
simplifies the error handling and we can get rid of tc_remove_bridge().
Also, add a check for the return code.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 31f89b7d5a3a..1d2547e4c4e3 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -762,26 +762,14 @@ static int tc_probe(struct i2c_client *client)
 	tc->bridge.funcs = &tc_bridge_funcs;
 	tc->bridge.of_node = dev->of_node;
 	tc->bridge.pre_enable_prev_first = true;
-	drm_bridge_add(&tc->bridge);
 
-	i2c_set_clientdata(client, tc);
-
-	ret = tc_attach_host(tc);
+	ret = devm_drm_bridge_add(tc->dev, &tc->bridge);
 	if (ret)
-		goto err_bridge_remove;
-
-	return 0;
-
-err_bridge_remove:
-	drm_bridge_remove(&tc->bridge);
-	return ret;
-}
+		return ret;
 
-static void tc_remove(struct i2c_client *client)
-{
-	struct tc_data *tc = i2c_get_clientdata(client);
+	i2c_set_clientdata(client, tc);
 
-	drm_bridge_remove(&tc->bridge);
+	return tc_attach_host(tc);
 }
 
 static const struct i2c_device_id tc358775_i2c_ids[] = {
@@ -805,7 +793,6 @@ static struct i2c_driver tc358775_driver = {
 	},
 	.id_table = tc358775_i2c_ids,
 	.probe = tc_probe,
-	.remove	= tc_remove,
 };
 module_i2c_driver(tc358775_driver);
 

-- 
2.39.2


