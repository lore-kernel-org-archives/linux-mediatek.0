Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC059C7618B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Esw5hhTU9GDJR+OGAqlBKxrMHCIu3fhUtPy6sZjR8PU=; b=E9Deqxtw/tF/V+TIZnoQ+VjjFC
	jP//atprXeGMsjHGLjgGg/SMUPXqIZuGzFhXGiJcib768l9wSxYfOkMU63pcRe9KqHzPJPDDsX4+Y
	sg8mAi42+r/z8xbHsSENNJ2Kbv7HHcPpNnPwvfGSetRub7dFYIjfM7ICgXtupGY0Ffj6YRPi4TJn3
	uqEkGBK3eD6YihwWrvraRmvgFCB/0vE/iXck2yPooxhjlNnhkyKw6q1nzJPmbN4MKZXpJQWHkH2Jj
	WPpMGtUYtLeZWxEb1Vh+1VhCZMkF+Rab+3qwufORWxK8aFgsdja5ebzBOCvk+TqnqM4bWe6AAU6Gb
	A/XkTB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSoq-00Dnvr-1A;
	Wed, 15 Mar 2023 15:13:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSkM-00DkAI-27
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:08:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Esw5hhTU9GDJR+OGAqlBKxrMHCIu3fhUtPy6sZjR8PU=; b=YbWeyAH4k8U7MRTWuLFXWqXyry
	kwZ/4AVv0ZvHjwUy1Vtrs+hXLpaLqtqjTRe0NF8RyIvW7cyjS+PRRxSdvehwQA/u0Wydjo+j4xAtA
	pgYvJ5rVyPcIyEcPeauY+XwKpQ4AeuotNX56NcIWpnEKMCcLgykdBKcOEhoDQQG6MIJzCkLzbGLav
	b0eSyOPK0SnoaQk0D1nKkOaxQjYgELg1dvLxOveNvOZfX0LAfvfY26LOz70Tv19DjjFwEYo4sjYQU
	a8HZrhe/NqEVtjOLG8Q6bBhtr6JxOdNV0tQRgAnFhLJgWX9g6YVYGzu19l7x8D9m7ExkNoDJPv3or
	kukGfKsg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pcSkC-00Dw1I-Dj
	for linux-mediatek@lists.infradead.org; Wed, 15 Mar 2023 15:08:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008Qn-1v; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-004Kc1-Vu; Wed, 15 Mar 2023 16:08:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-0057ir-Sk; Wed, 15 Mar 2023 16:08:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Minghao Chi <chi.minghao@zte.com.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 109/173] ASoC: mediatek: mt8173-afe-pcm: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:41 +0100
Message-Id: <20230315150745.67084-110-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WZRfua/0LMXioanbvKICWoWXRffy5HNp9GLEsVv6j1s=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd52X0tz+W+r4kAb1tBB28FBdgdferrxE0kwp dT98nc6twyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHedgAKCRDB/BR4rcrs CdGPCACIWmH9Zm7gYX3u9Bay0G3aIjUKWFSjwi5RkDEeVKf4ltfEQTNqlFpDOSSs473x/ZiqyOH SHXqh0A6QO733cT95HhzVvSsiO9V1fAUk+rr8VHvPrw19TTKBzMuqY04Z6ZGLtRiMK7MeD5W1P8 9vcqD3sdtzf2lfpWsUanBb+MRNJ9pC0GR1FS7yfggAkrhHu7dkR5cBlT5yjhqjAVdRL+3o9FQ8S 9VexIb2cbPgF4oMLxO+GmP/+0AA+k2SvogDSm2D4AeTFxiYfHEvy9cRKFuzUO25iJIRb6lT2fvY iQhwvuWPtOnXAWu2pNN+ExRRke/ysd/3IZNz6sNkgHt+xAaI
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150849_001614_DD50954E 
X-CRM114-Status: GOOD (  12.19  )
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

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index bc155dd937e0..f93c2ec8beb7 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1195,14 +1195,13 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt8173_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	snd_soc_unregister_component(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8173_afe_runtime_suspend(&pdev->dev);
-	return 0;
 }
 
 static const struct of_device_id mt8173_afe_pcm_dt_match[] = {
@@ -1223,7 +1222,7 @@ static struct platform_driver mt8173_afe_pcm_driver = {
 		   .pm = &mt8173_afe_pm_ops,
 	},
 	.probe = mt8173_afe_pcm_dev_probe,
-	.remove = mt8173_afe_pcm_dev_remove,
+	.remove_new = mt8173_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8173_afe_pcm_driver);
-- 
2.39.2


