Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD6EC25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxBggYn36aUANZ5T1t5p/Wr+AXY12fYlFg1jkVkyc3A=; b=wfP0FAG7i2QKtf8tlBfdmD281B
	0V9G9jkbFfli9V/lUFMbh9HRSP8MSqD66liHa0D0dfePg9eB1zWL1kpRTE3c7F2vZBr49CHgHiGJr
	cuBE+TsRHxNN/cJG7E595vC8huDbaTick3KCEiwgRFdsjq9HcpYSxSOtMh31yL7nMaN2hXkQkY9hK
	2wGinESAMiE1ay+Zbdil6xdBMZqDSZnNhBF0ww/dwYor8eF4Zva/0HtZYSUgyLFzN3kcWXtlUhwCT
	/Y8Cbgj0gchCDTZTOCB7+2dgyAS5DwDpukMabkhxVu9wY7LLEguJrYEpluwNjpENdbT1ZZsCZKQAb
	JorzNN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yX1-00000007Ucz-3amI;
	Mon, 06 May 2024 13:37:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWH-00000007U0T-1BnU;
	Mon, 06 May 2024 13:36:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KxBggYn36aUANZ5T1t5p/Wr+AXY12fYlFg1jkVkyc3A=; b=Q3oVOOvrROPeDy1dedkzviKc3B
	KJDautcePzVxNswFo9bf/ZLPGPfKOVPZIpeVPBUfgMWOgRPCaRpRSGezUH278GtlhuvAtAO4NEDky
	uPtKh0Qx28m5dbvJGUTO/LgZH0tROLOIcOQNOzyyri0SndxATVgnTRfl908EGDqAiennEwbD8tLpk
	LYeguBGVjMXCUS08DOShhp2mBZb87jpw5VJskkIVPCPtmAWn6GSvCoD4TM78n4Hp8Sjl3fNbQ1lVp
	yxPMKP87rI8KqwmQ2IMeN4/vVmrvrjVa9+xKg3XuT+m4DLRqvLc4mEk/Le0CchUkNp1WPBYm0zD73
	TQWbPeEg==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yWC-00000001jES-43jy;
	Mon, 06 May 2024 13:36:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CD60CE0E74;
	Mon,  6 May 2024 13:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062EAC116B1;
	Mon,  6 May 2024 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002591;
	bh=CdCWrZhe83V0sESOJK7U77pyux4Xw5LMdp8ycoT3WUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MQlzbcin9J88aETS0zLDb0nvobS3wtLI2Y4BBLQYro4df7gUI0X62eehQlcKCMs9K
	 WzNcODU+CgRa7rRgSlZR2PuZy/juDvvKr2lyV7KBnids0vcCKxinOR55C1pha6uQZy
	 pqhtmhvqQ3aNOvtmJLcr7CO0vbwcd9m5eT1d1rccugbqf89CHBIJmAdTtGhnqwrCSC
	 gxtn3C9GumjieD7KwgVLmf/H/GEYj6kGebzI6Dt52QbdqE8wyjHv8AwnQ4QdFdcdhg
	 Gai+zjxlTch4LRJBulxLPBOxb6dED1DZOygysJFpsJ5sS4d0sWRi8dBJl54Mw7abqd
	 pUu86gTg+hSrg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:47 +0200
Subject: [PATCH 18/20] drm/bridge: tc358775: fix the power-up/down delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-18-545dcf00b8dd@kernel.org>
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
X-CRM114-CacheID: sfid-20240506_143638_065498_AB689EA2 
X-CRM114-Status: GOOD (  10.94  )
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

Implement the delays according to Figure 8-10 and 8-11 of the datasheet.
In particular, the datasheet states that the *maximum* time between
enabling the VDDIO and VDD is 10ms. Currently, as implemented this is
always violated. Of course, this is only a best effort because we cannot
be sure enabling of the two regulators will be that fast.
The time between releasing the stby GPIO and releasing the reset GPIO
must be at least 10us and not 10ms as it was before this patch. After
reset is released, there must be at least a delay of 200us until the
first HS clock is received.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index d5b3d691d2c1..99dbbb1fee78 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -242,18 +242,16 @@ static void tc358775_power_up(struct tc_data *tc)
 	ret = regulator_enable(tc->vddio);
 	if (ret < 0)
 		dev_err(dev, "regulator vddio enable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 
 	ret = regulator_enable(tc->vdd);
 	if (ret < 0)
 		dev_err(dev, "regulator vdd enable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 
 	gpiod_set_value(tc->stby_gpio, 0);
-	usleep_range(10000, 11000);
+	usleep_range(10, 20);
 
 	gpiod_set_value(tc->reset_gpio, 0);
-	usleep_range(10, 20);
+	usleep_range(200, 250);
 }
 
 static void tc358775_power_down(struct tc_data *tc)
@@ -265,17 +263,14 @@ static void tc358775_power_down(struct tc_data *tc)
 	usleep_range(10, 20);
 
 	gpiod_set_value(tc->stby_gpio, 1);
-	usleep_range(10000, 11000);
 
 	ret = regulator_disable(tc->vdd);
 	if (ret < 0)
 		dev_err(dev, "regulator vdd disable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 
 	ret = regulator_disable(tc->vddio);
 	if (ret < 0)
 		dev_err(dev, "regulator vddio disable failed, %d\n", ret);
-	usleep_range(10000, 11000);
 }
 
 static void tc_bridge_pre_enable(struct drm_bridge *bridge)

-- 
2.39.2


