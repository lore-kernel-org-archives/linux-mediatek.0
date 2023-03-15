Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655FBC7618B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RK7MYjHCpmf5gCNBsNMMEU85AwiavIw9SVthyTMh9O8=; b=HSJVIRQPzUWnixSDdCFn4gW5eM
	K7BtABBiKkFzz2mC1BIbtIMzmPdq8Ae3oXtyNBRzYPmwJAdmZcxvLPJt5i4NLIplQu907ycSs20US
	3CO7dpmGbW9Rd04xWLX93DObT4eUGf4xXOHTaEimv5WFruYvIYkSzgZDTd+zLfYoDpnOCBMtO6shJ
	mcBTGhzpJx2olnaRJKP6iJSmvUF1DTaD2F5FOI0dPVlFbnK3qkqEQ6LVVg9usR0sR2HBu71r5DXeI
	QHO5bZeRpNKPjfHSOmD43aOasmlpVluDDvjnU+tdS0heJ04OPSk6c8W59/deJHItpM1s1ZtOVK/jY
	3gn5LK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSq0-00Dp47-33;
	Wed, 15 Mar 2023 15:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSkS-00DkFy-2O
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RK7MYjHCpmf5gCNBsNMMEU85AwiavIw9SVthyTMh9O8=; b=C6LYA5NnuwjExocnGAkpM/vaEL
	6JaZJXxhHWDSsx8f5OYgpJyYOEGu1WbJHGoUBG4350SUEhX9G5juh3AxJT11kgpMhPVII/jsGt5Cd
	PPC5iCsv0K1dValqsTtUv8lkQc0H8CvTlM6jPE24DJWTSKqe8dmuk02+HjO9VCSckRF0P4YbSfIt6
	YrEYqaGLIRNlwR0F7QuINEALRyvssdfknKlO1zSV730+f/z9kqMk7tLjvkW8TGORvDiArdun9F6NW
	dqKEXoxUih5ROmSIGsWnDYrid0169FC7Bg0v3pU4re4Gii4JIeEOtB/sOzu9V+L3wMp1LNDHu7P3b
	BJ9X1EAQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk1-0028d3-1E
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 15:09:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008SQ-Hd; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004KcH-Fr; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-0057j5-O5; Wed, 15 Mar 2023 16:08:21 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 113/173] ASoC: mediatek: mt8195-afe-pcm: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:45 +0100
Message-Id: <20230315150745.67084-114-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Vrevh/9+Tt9NBTkdA3ayadMtrznBbxNATV0c6JUQjk8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6FPMOFGppFQCVABceDv/v8niyN69Vxw1dPW t1vVl8VttKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHehQAKCRDB/BR4rcrs CROfB/9cn1lQZJZwq/BhnTEC7pmpcbvVu6MtU9rYrHSQOGFOlTJgeHY+o3jrkDezY2n6GGRxv77 A5y6LSFfENIfLl63FiSEcffYanjqtLo4RT19eJdXfaRbPfgE6yHOqKAeEsjY8Ub0kSS0MgG0ZRY u0evzAnY0guqz33nlb9dNaf5uThRrCVCpOZG/xOD6jbP88DDOgdIX8eYCkLJfqk0D/JIU98PvdL Kyk0SXvSAUL9PkW96Fn40F7SNm8o3KLuDVOKWNBZju57X1zCVv9spZtcN17bGGVywKxOgGCUOSY tJrlX8VFULBs8lKcYpY4feO33SfXKPRapCo69sle/NXefRGC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150901_776223_B45D5147 
X-CRM114-Status: GOOD (  16.26  )
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
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 72b2c6d629b9..9e45efeada55 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3253,7 +3253,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
 
@@ -3264,7 +3264,6 @@ static int mt8195_afe_pcm_dev_remove(struct platform_device *pdev)
 		mt8195_afe_runtime_suspend(&pdev->dev);
 
 	mt8195_afe_deinit_clock(afe);
-	return 0;
 }
 
 static const struct of_device_id mt8195_afe_pcm_dt_match[] = {
@@ -3285,7 +3284,7 @@ static struct platform_driver mt8195_afe_pcm_driver = {
 		   .pm = &mt8195_afe_pm_ops,
 	},
 	.probe = mt8195_afe_pcm_dev_probe,
-	.remove = mt8195_afe_pcm_dev_remove,
+	.remove_new = mt8195_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8195_afe_pcm_driver);
-- 
2.39.2


