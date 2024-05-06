Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603E2C25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/M+nbQZghrYWQgFZi3Igy/SC6rg1+xGJ3oQ4bcPWKQ=; b=oW2J1/SWJAREpKuHMqIYmWPS3b
	2oBvrhw1j8NkeYh5xdY++u32H2iJNMTmlF8cI5xaXsnhKui51qkYYTO++gTiVL5tTtxScwpI2l+xs
	kXm7FLGsPTc7bNZT2NSkPfHlVpxb1jWtJ+sS90+6RaN4uuRzwMbmZO9eYqE13cuOd4sXQeCmn3rvb
	Rj+uowsj2AvBytwojy4Dq/9uUpEQoD1qnOr1Pf7yXyoM/1xISLboJsMTHtozjwdjBorIsri/5T6pr
	XvldgMevk5wa0mEc5gQI2ZUNghUI4OT8A7O4t5LNAbC6a4B1mnLjZVJ4OGSvY426XlifQ+zCX8qpF
	JQ4+lj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yW5-00000007TrU-2Xqn;
	Mon, 06 May 2024 13:36:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVN-00000007TJm-0O5W;
	Mon, 06 May 2024 13:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58A4BCE0E64;
	Mon,  6 May 2024 13:35:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC444C116B1;
	Mon,  6 May 2024 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002542;
	bh=On4XVAth8phH/tpwuPnVAjW8rZ3xEljXuSTJvjxVCxA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ikbmr446+4FNMnf+X2Ixk0yrmfaW3BrQGq12yjTcqCoCnSMkfSMw79qQvU1rgZfqu
	 JcZnBDtaLaFpqmQqg4UdyeA5sK5j3exP0iGyduTW+eyccA9s4j2R2u7Lm954PYjFJ1
	 Q+l9MRMFtFOtcpDQ8ztJ8OYkO3Ce1eEN/UUkyu6VIt2vdXkRs8dxE10Y7teetNDRns
	 cdh+7BrTVQUTngjQ2ZR5sArhQPeeXTR/doaIIdckPjZqmAcuvwIr3bYhciLCreXU9j
	 6zdG+E+/fBgrr4+SEsziVEUOj+pHa3QSTlHgUxUB4CL6ONgrBQh8PAJVMZlOYWzcoi
	 BbhbiM5RK5trg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:37 +0200
Subject: [PATCH 08/20] drm/bridge: tc358775: remove error message if
 regulator is missing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-8-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_063545_628460_4DF438D5 
X-CRM114-Status: GOOD (  10.43  )
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

A missing regulator node will automatically be replaced by a dummy. Thus
regulators are optional anyway. Remove the error message.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index b7f15164e655..54aea58a3406 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -675,18 +675,12 @@ static int tc_probe(struct i2c_client *client)
 		return ret;
 
 	tc->vddio = devm_regulator_get(dev, "vddio");
-	if (IS_ERR(tc->vddio)) {
-		ret = PTR_ERR(tc->vddio);
-		dev_err(dev, "vddio-supply not found\n");
-		return ret;
-	}
+	if (IS_ERR(tc->vddio))
+		return PTR_ERR(tc->vddio);
 
 	tc->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(tc->vdd)) {
-		ret = PTR_ERR(tc->vdd);
-		dev_err(dev, "vdd-supply not found\n");
-		return ret;
-	}
+	if (IS_ERR(tc->vdd))
+		return PTR_ERR(tc->vdd);
 
 	tc->stby_gpio = devm_gpiod_get_optional(dev, "stby", GPIOD_OUT_HIGH);
 	if (IS_ERR(tc->stby_gpio))

-- 
2.39.2


