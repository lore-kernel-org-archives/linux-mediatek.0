Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111BBC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylSdmFuyCc+9KDOOxXXjE0UQFqteZdWuTwe2OKpGJD8=; b=llygj/B/xdYOjsbHYyLOviuF69
	EQ3DIO5Zbq9ABniCunr0kkYb/eZI1TkJWDqcjE3hHOUMwCi8zRVvPUUachQXebVhGC1aJaIIJ2bld
	QREoNxWvoumJH43q1P5mXhGYZ5fG7faEbLAeTJlRtUkZRJkkT5WHSuDjPZmwJ0cbdem+SEL6iWSJQ
	yBfsoviSJb+CRMHtHX1BkYwBYS9H74Ode1KC/gGONVxsjWJbYXjLxyVObNN32Mx7iO9DH6G9PRgjc
	JLSPDeo7FTmt8aYo1i/ApvrCmNIWDPW/HfNltUhViSL6GpzHOTNqZgnIvwvaB3GDJlQmg8aRSwY2i
	ZfSiVHeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSo3-00DnAv-2W;
	Wed, 15 Mar 2023 15:12:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSkI-00Dk6s-1L
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ylSdmFuyCc+9KDOOxXXjE0UQFqteZdWuTwe2OKpGJD8=; b=TA+0Z8Pn4MBhGW0BPh6LyLr4o0
	WvLqlobmxSgWTP6AccbJB6cHnq9WQMCvE0cXZ7rC/bn+ur9vuVzxkvCyX8GFqRmLVNTYOEbW/9nuK
	3pHAFjbqe77Crtm2Q64EKpQa+bmVTcBzT7H3nSn+vKYyKwTOjur6CzVHFgYrjRknAkawS1qs3F5MI
	yHIkdY75IraLQVw0LFbBSvI6vnU4tUtuDLqO6bb3D3p2x9m8Sm5gC27iv6wRCM5B87SJdm4vCU0XK
	l9lqEgJeBLjy8g2Sgk6/ruOcw8HhOvcCGDVEc2jX3VnxZ/QQDhgwAh3oR0v0wtZKEe0uETegDp/iI
	EgrHLhEQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pcSkC-00Dw1L-Fe
	for linux-mediatek@lists.infradead.org; Wed, 15 Mar 2023 15:08:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008SR-JL; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004KcI-Fz; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-0057iy-AK; Wed, 15 Mar 2023 16:08:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Dan Carpenter <error27@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 111/173] ASoC: mediatek: mt8188-afe-pcm: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:43 +0100
Message-Id: <20230315150745.67084-112-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rg/ZjAXLV7+w8zhdF1+AVjHUTlMZxTtIj2THNFeshK4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5/fru44LZHAAv4PCDovgzr8zNvOxmz7AIS9 c1cgADxPSKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHefwAKCRDB/BR4rcrs CekrB/9BOlZfG9QLl7wV7Cu5kKBKyhpVi5qBSnjGYfECrdBABxkug2YMjP9qnOrR2Bmfp4hsL37 5aMQC+zS1yy673slw25+yuYa2EWew79TG+zzKhHWUGavxsJ0+c+5HMxAcGov/e6DqSxBd0AhBb8 ApOs09b6SsvVE+X002ZZBQS1fczVd2LLBdLJJmQp3jtHeiWPqhJAmIfON90yyaRomb1KQVHNH/O iNh0U79qwnDRCrj/eu3D4b08h2SeTEGvMdSgdsP0yxRtfgcS0mhT3hKJ1mnpjP/qIZ43pDtNiwa kfVSV9li0tdl1XipV9ztHWczAUvvIDTseXHKnY60O3bngPts
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150849_051535_9773F9F5 
X-CRM114-Status: GOOD (  12.41  )
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
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index e8e84de86542..e5f9373bed56 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3323,11 +3323,9 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt8188_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt8188_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	snd_soc_unregister_component(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mt8188_afe_pcm_dt_match[] = {
@@ -3348,7 +3346,7 @@ static struct platform_driver mt8188_afe_pcm_driver = {
 		   .pm = &mt8188_afe_pm_ops,
 	},
 	.probe = mt8188_afe_pcm_dev_probe,
-	.remove = mt8188_afe_pcm_dev_remove,
+	.remove_new = mt8188_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8188_afe_pcm_driver);
-- 
2.39.2


