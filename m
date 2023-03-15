Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F266C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ypagvaTyxmSEqknsE7wboDoqjIAlpxphCb1cFmQ0m0=; b=i/Ij4CtY5auEXrHmRFaVWD1jn4
	aFrEKytbqM7Llvc9kHUO46DT92vHQE3XqEaRv5cHDJSeSZctErUlyHdTJmI/SwI26Wqf25qEV9gXi
	T5Obb1amoi+R+k+/+Iwsp5uE8IclQ3ouYQxrcixYr9IOmjad5jPDdMPrSTtcLap9ks0xmWr/VpKH9
	st6OuAqxc7uQ7wy29x+ghLO/nGsxftCDUjuYfc1kIv9AaIq2SzcdLQw6WtG9r9UN4SlqTQ15j4Vuh
	CBi3PeapG9WnePJaIbgqSwvW91Bft/HH7CxTtaXMaNqFUkkF2vP2Yzk9virJmI2WIxlOSKaznhTvw
	DLCa8ynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSn5-00DmP8-2b;
	Wed, 15 Mar 2023 15:11:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSkE-00Dk42-00
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0ypagvaTyxmSEqknsE7wboDoqjIAlpxphCb1cFmQ0m0=; b=ccCE8G7XPb0+CFP49d+2DxDR6E
	Wp89d4D9Tsl48CXLIERabQAp3FiPk094DWLwSZW98Oryzsmo35Xy9FqOUUaq5sop6RQ6BmTAJ6ou6
	3Rqtw4k7grEIw1Bdue8iGlgT25o6mmk9t+Q30MsORdGVKD+4JtygM62joYii1zVwjEjtVbpCFqBnR
	IKYrqS6AdjweCWC8EM0kFqD2ABjKClDK6uAFwLMP9iQ3f4GPRMp1J3ft25l7FuV7LeyJUS8s25vQc
	j8+8TSNmeDR/hFNODEVbcdSHfizvLE0HPub3bgYvtTvQWFQunN6sTPl70+D5Iwq7Ex7NgcCGK1KY6
	BNRcp/yw==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk1-0028d4-1D
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 15:08:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008Rt-Ax; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004KcD-CL; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-0057j2-Ha; Wed, 15 Mar 2023 16:08:21 +0100
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
Subject: [PATCH 112/173] ASoC: mediatek: mt8192-afe-pcm: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:44 +0100
Message-Id: <20230315150745.67084-113-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=oy4WAcFg56RPxM4WdJAbkIaNY2s74SZyhCiy+bdWvBM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd6Cm8pswKLfMzxnzK+YKyJGFeJFqLJyx/NjW hDX4C58WXSJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeggAKCRDB/BR4rcrs CWg4B/9BjBTomz49FUtXlQUBveDcQ04GYri71P24yDuc+2naiaNLblmOFsPC/Vuiz3rQxDHTPt8 95WZRIVjAfudPk652joJo9clCuaA6T1beDGqocTG5/zs/BqAkpfYvqiiEj6ERwmpSSftRv8k0NR sQZ+ZxzsTs/0QP9Mh+hcKAe2r06ShkxwMHIMfRfxLh4cOHdnljqMQEHe7739DqleBaKm3eKRVU6 ULgV5cpgHe91YVUnzKGFwpIQzolTeZyX8kDrZZUk0C8joTPX4DYy+wzP6027wZ+qRykBCG34Gen O7vCXPJkjE5yU3dmuFYt1q6gOyyQOFkViIEDw3W22k2gSu8c
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150844_548972_5FBEE0C1 
X-CRM114-Status: GOOD (  16.32  )
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
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e1e4ca931551..adff3d667267 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2353,7 +2353,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt8192_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt8192_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
 
@@ -2363,7 +2363,6 @@ static int mt8192_afe_pcm_dev_remove(struct platform_device *pdev)
 
 	/* disable afe clock */
 	mt8192_afe_disable_clock(afe);
-	return 0;
 }
 
 static const struct of_device_id mt8192_afe_pcm_dt_match[] = {
@@ -2384,7 +2383,7 @@ static struct platform_driver mt8192_afe_pcm_driver = {
 		   .pm = &mt8192_afe_pm_ops,
 	},
 	.probe = mt8192_afe_pcm_dev_probe,
-	.remove = mt8192_afe_pcm_dev_remove,
+	.remove_new = mt8192_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8192_afe_pcm_driver);
-- 
2.39.2


