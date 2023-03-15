Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C18C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJa7tQETX/89P8Y45rgB6tafI8F10YMOIdR9tUUpwY8=; b=Nel4bx6+uCLWks0DnapV7eT0dy
	RUDtD5n+WB+DQvtFi48DMxQR47StArcTigumqSObtMoFDUq7CGypNHqZwR2KV3lZJhug0bec2+rQn
	ojYWTmIokRWI3fopgpkrLj/YUfPSadyVoT2pxyhn7gJ7ekMoyNfZhlTQle6Y7n72z5UG7bIB54GpH
	PXLJwkTIef31UaX509OVUQsdxZ9v6SycsOBHiAz8FLGg9ThxJ5h2Ifpi+KSHhkrQIRo4C3N2pNWYD
	qgKj+rn8cjR5HMpiHV3TT/NeJIWw6R5AOSRBWPp43QNTrrWZJ/zKliX9njqWbVnygMId7/zmdDQJD
	mTZq+MOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSlK-00DkwT-2e;
	Wed, 15 Mar 2023 15:09:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk6-00Djze-22
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nJa7tQETX/89P8Y45rgB6tafI8F10YMOIdR9tUUpwY8=; b=Rasjzy88JKs08JjxaT2L6KeIug
	UoaDvyp/Tx/xKX9p/2JSF0gsl9x3jvJdYmXZNznq9R8sgvpl/zBVXgsnxxaEPRE/b+SNb8SxwLU7n
	oQv6dRkyyBX8cL/Dyd8a6+YkhDbH/+69l2z4BLrC+hf4uewmksz60M44MjG/aJWfLsUpeHP2dY+SI
	Yh5JzTfTMT2ZonvyhYCPDKvkYUGTYV17S9PTaRTc8+Ee55Otk+i5i3ieHyL86tpPOd9QxlfdBxNhC
	8Mc1T0MElH34zbosT/LtjtfafdmXJR0wE3C1gSEpA/svVFK0viG/B6gZoilXLQN97sW8difAthFHi
	iokaqpEQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk0-0028cy-0y
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 15:08:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjp-0008RI-Vr; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004Kc5-5w; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-0057ih-9n; Wed, 15 Mar 2023 16:08:20 +0100
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
Subject: [PATCH 107/173] ASoC: mediatek: mt2701-afe-pcm: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:39 +0100
Message-Id: <20230315150745.67084-108-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1800; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=koWfqNykvz7tdkgZlN4qWKDgHoQvfRsTgvMjWDwhmWo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5ucK4eJxav+CKwEsT01ChAzCaqlzIv8d6dH VVRe7CFjDaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHebgAKCRDB/BR4rcrs CbZgB/9IiPRZCQsk2TcCq8DpBsxbaKQzOJPMb6WfwGKP8e0UNyi6D0TcOWODUdHan56YY07E6Jf WRXUEJR2VvMvmX03OsBOOP/O1YNl0dm6Cnl9YZisPAb89yBxPncJoypGeiK8Ov0Jmea3+ylSBpy SO9AfgDQnkCfot1KYwYFwBV9DOrid9PcYhZsCrDnfa0jV7w3q+wXTcPAs6N6wHc5R+y7phFwPed Sf/s0WmaqN8gcTF0eVHC1IL8S4WpcHiTJcasvbNvFhG9iC6+sOI5IoHII6m8MTf8mA5FWdHQd9t EhBw6LplS8ZgwS7iEaxsI1hp/4eZELOXh9JP2XREj9qavttQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150837_727520_C5BD6DC9 
X-CRM114-Status: GOOD (  15.90  )
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
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 0f178de92a0f..c9d4420e9b4c 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1439,14 +1439,12 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt2701_afe_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct mt2701_soc_variants mt2701_soc_v1 = {
@@ -1477,7 +1475,7 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 		   .pm = &mt2701_afe_pm_ops,
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
-	.remove = mt2701_afe_pcm_dev_remove,
+	.remove_new = mt2701_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt2701_afe_pcm_driver);
-- 
2.39.2


