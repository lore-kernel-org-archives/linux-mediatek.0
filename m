Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F177C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pf1f6/tO0mNLKEokYZiZwhqjX9xURtp89z59r8RvStI=; b=z/r8pRvdrovQ+4CsM0Ybm34ARL
	vRC4hQlVy/RPs0Jk64CJID7wo8Bx/wY8LWf1mdjf2LYxCISKAuYOD6IF/j2A5vOmJ82OaQS4eousz
	A/cYFsv0iJiI/35suDiDR330C8J2X/NIBZnIxhbyTLgfN/6VR2NYhKjUjKiYZjqWxTfnN0zknvjb7
	knN5PsQ33yqoXthXA0wEGscJ/6Tn5drCGYogAjqeiPCly5LY2nNf1+Ugm4HK0/8kt7lhQyCeGJApH
	zqBJ3Eyg7ZhfDrFoOOK3e7XaatsNK64Vqo8ti/+LjfiDD6P62w9B5qmUH95iw7AG9FDDQ5J3m+J8Y
	PW4U6Arw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSkr-00DkYq-1w;
	Wed, 15 Mar 2023 15:09:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk3-00DjxR-05
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pf1f6/tO0mNLKEokYZiZwhqjX9xURtp89z59r8RvStI=; b=l9h4jT2v8UgdJ8aPVhMmlU2m6M
	/rgPAUV4ZQnmej1ZU52mGESc/HKkIpkCk8J0iquwayBJDyda+irRonU1iuSnsZ+JZgzdfUuyWQ3eU
	HjnGiZwTgT8+rgXqScAPCG9VnaIUOtlQXvacTRBXQd3Lf2qGtkr27fruVdOH6ZP1aMWuQhr+YIuMs
	ASpLXFyD/UOU2IWu6ssfpNqIT1nIBL8jONMuUJ19rNyr/fv+EFfz2VASgV0t4pRUWBnMBD1kqH/Um
	Nl9olzxnnLqkrVI3e0xc3oEyEtF5+Bdy2TeqM6ng2WCHTkTO6WShJNul8fobiAUc7aJyKO2+enbK2
	X3zVfu0g==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSjy-0028cC-37
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 15:08:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjo-0008OO-PE; Wed, 15 Mar 2023 16:08:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-004Kbs-8F; Wed, 15 Mar 2023 16:08:21 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjk-0057im-Iq; Wed, 15 Mar 2023 16:08:20 +0100
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
Subject: [PATCH 108/173] ASoC: mediatek: mt6797-afe-pcm: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:40 +0100
Message-Id: <20230315150745.67084-109-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=CcBYQ5pQ+b1R38q6a0nA+xt8V3GqdSrNzwGaMGzN1GQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd5yAeixOHswBtO0H+V7OyHXBqnKrU/grjWsv qkVDwGnJQuJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHecgAKCRDB/BR4rcrs CcBVCAChU0f86GTKfll67nh1XsJDDBemWChBAlE0j+6eUqdTFDFKJwHznlAYmaD0vc7ERrmfhej o+86jOK2Cj5lmaAgxprFRLYZfrkm/LLlZ6xbuKL0+ssgtVJbKpFSMV4vq5fM1JJiYWdmhoCA9Th GejMxo+Lfm0lPHhwG4PdgwUUUJHW1Bb0/pfRq0vTO+hTZyj0IYUPlNRHSCi+jaM5kDzPdxQAuZx MbVW3IBP6jmcMdZkZHDZzbKyxNgJ8J4uFZWNNI3kA1nXQCKYSFWFqiDuLfLgDff3p851LKWduyL xly2Hz0+oAYj14BkhbM3uSG1b5U3RoyhyJmFVKM8nrvMv3a9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150835_079687_E379D14B 
X-CRM114-Status: GOOD (  16.01  )
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
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index fb4abec9aa5f..43038444c43d 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -876,14 +876,12 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt6797_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt6797_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt6797_afe_runtime_suspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mt6797_afe_pcm_dt_match[] = {
@@ -904,7 +902,7 @@ static struct platform_driver mt6797_afe_pcm_driver = {
 		   .pm = &mt6797_afe_pm_ops,
 	},
 	.probe = mt6797_afe_pcm_dev_probe,
-	.remove = mt6797_afe_pcm_dev_remove,
+	.remove_new = mt6797_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt6797_afe_pcm_driver);
-- 
2.39.2


