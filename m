Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B6C76195
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdBxrn4P2ciPFKvs44XmIuoaugwNVtJmk8UA34VSGd0=; b=N0NxuK6iTIznFmGstle6QzsiuU
	MbHOMofGmI7Rx3nJUyMCO7HwpKJ/9Fok6VDPnNKSPRLKAKdgPZ2/gUeHcIj49/jF0mD1EiHZk0YuS
	GfKLIYG3QmD0UP9mhxLQfBA7YAUmKZcI+UzMAOBzk7uP0J96dkZ+i818lFv4ySWzZJA94OOEkO3ZZ
	pWCGd33PYHqYAo1ZoNm6QO26vbPeQArZl8vi12uJkuJflVgkVYJUOX3I1ptSy6Npcd58CRqAkhb7h
	3bYuNtPB4qOu6BZkECENmspRApivspt+LWE9t9/OIAEadyBUm+STiijUmmV4e6rCPhBDjFY7vDGwC
	oRRoSSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSlJ-00DkvH-0O;
	Wed, 15 Mar 2023 15:09:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk5-00Djz3-1C
	for linux-mediatek@bombadil.infradead.org;
	Wed, 15 Mar 2023 15:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cdBxrn4P2ciPFKvs44XmIuoaugwNVtJmk8UA34VSGd0=; b=NsLDkc/267wIBhFRc5O98erQrg
	OWjD63AbIOujUR/ZwUoMZnB11bJEQ1hhh9Et0g8jeAVXUALb/K3syQQ6rWvsPIFZd/nkCDlnwUt0F
	W3vJbe95TVtlgINxhnzS3xuiZEow8WSeyvmtD6A2cEu7wOLvy/8baa4yaxafzSVrr3CmPIaacsiMt
	1Kn0P03kQlmIowplDR0xXLV3nUpEDaJHVz0QfDgdsn54ZUQ0Cm7lBeMQ3NkLLCgx7O1Ov04M1ugeY
	1ts7Zdp+Te22oHRzROku4zb3Gphi+JFURRAHkE881kHYNDVgc+VcOeoAyAaulY78k+rP9mkmHCOn3
	UVxbK/fQ==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcSk0-0028d0-23
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 15:08:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjq-0008RT-3B; Wed, 15 Mar 2023 16:08:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjm-004Kc6-75; Wed, 15 Mar 2023 16:08:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjl-0057iv-37; Wed, 15 Mar 2023 16:08:21 +0100
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
Subject: [PATCH 110/173] ASoC: mediatek: mt8183-afe-pcm: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:06:42 +0100
Message-Id: <20230315150745.67084-111-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Vbc4xUnTL1Y0I7B/wT0bsowfdarYOTW4ugcUlyhtNZ0=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd56cbEdE639c06BbjtIwKcsxlSF18v0KMOjU KcNVzNENRCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeegAKCRDB/BR4rcrs CdMfCACXO8H0LPcx1idndfScu9x9KvAjfBRlRKsCPhrXYUUjpgScQjOLz+GCNqQFuU3+fmLA2r7 /7u4opuAY4ecvMR7uPn+YV6Qywy3UZeYJuVJJsB/uoz+gCHtPX7gbF+AyGKy+WggPtb4LiBN4v4 LZ2F4zzyu6+Vq5hKNd/XFDE8T2LPHS04ot1qNFx7tmCpSzjeLfNfnqrMWISI2RAByyt4grAtt45 TpXXEFTmuudCbuFVrTGk231hw9Kip6LcapIFmfKlX0j5jwRA56sah0vySs57zcwc0M037mgRp9T 92lp6rk/SwLPOXM5g/7JZDOMNSMIribUc7HhDBLSlPj1k+wQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_150837_720805_EAB52751 
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
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 86c8a523fe9e..90422ed2bbcc 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1255,13 +1255,11 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
+static void mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		mt8183_afe_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
@@ -1282,7 +1280,7 @@ static struct platform_driver mt8183_afe_pcm_driver = {
 		   .pm = &mt8183_afe_pm_ops,
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
-	.remove = mt8183_afe_pcm_dev_remove,
+	.remove_new = mt8183_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8183_afe_pcm_driver);
-- 
2.39.2


