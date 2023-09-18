Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6099DC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GdSFQnKtQhM4Z29/3fhy0d/uHpMx9pYLFZMW0BJlPEE=; b=EEZjHCZJn7/HspzqTwrjQsi2wt
	+x9cu9L9p7ZGCiu69ZFNy9tkxPvulZtyotFPk/ArRpslqKoN+qZ6TiFCPflTj17cjygDJeXRWm5g5
	JjD36m0tBxwxkRmjZk8rfFOhNK15iMrfVNtYe2VfJD0tKWb9GQdJslfLeDZPbxRTHr8HOfG07qPYe
	eMfK8ZUbLy/lEjAATNJ/YzXBhC84XfvjZ0+QfVm1yFwutjl+FQkUHKolJ7bNZU8VoycwxLUcG5iso
	Sxhq3PYLmD9GrMWtM57mYmV2Kq0jdXHwpLMVEgju/mL11BRBy86hrnut2kTabMCHBr7IslG1MCu2p
	uTGkVBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJmj-00G9u3-0I;
	Mon, 18 Sep 2023 19:19:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJmg-00G9sl-2b
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 19:19:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiJmK-0002o3-7g; Mon, 18 Sep 2023 21:19:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiJmH-007I2a-6K; Mon, 18 Sep 2023 21:19:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiJmG-002m1w-Sq; Mon, 18 Sep 2023 21:19:24 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 5/9] net: dsa: mt7530: Convert to platform remove callback returning void
Date: Mon, 18 Sep 2023 21:19:12 +0200
Message-Id: <20230918191916.1299418-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
References: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nO1JWmSop0L3veRkZxK9FkMgjch0he5qMND8E1/M8rk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKKsVuBOwhhRc+2qQ1z6c9j3R2PGT592utBCs T+D0rcKz0GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQiirAAKCRCPgPtYfRL+ TnYCCACYBOI5eMvlX1tSsKtJ7iSGZj0yp5ZSBreERbC1/sXAjGBclH7MRs2BXhRYYCkUXYLUseU W54pSAcSLJNzQyEral5s5L54GTbJgPBMmcFJJ4gNAsFgj8uEpA0I5yULuky0+xCB4DXkWiRVUS4 FACHjbnYHahpOI8ZE+pCbLssgL2+xxsdMb79HuujSLJzJDPzdcTir+2wUp8gDNbdaWTDnUZst2s vYUM7wnhzqiuTGJq4sPHE9HcrOO1vxdIhISUq4AOE7lJRkVl9wqcKSPRXRAAMnAB2SucPbUrRsJ 2lIPuDbSxpctjqqZM4nOgmvt4Z2387pgbsTR0273AU/ba4XX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_121950_843588_47DCBD52 
X-CRM114-Status: GOOD (  15.56  )
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
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/net/dsa/mt7530-mmio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index 0a6a2fe34e64..b74a230a3f13 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -63,15 +63,12 @@ mt7988_probe(struct platform_device *pdev)
 	return dsa_register_switch(priv->ds);
 }
 
-static int
-mt7988_remove(struct platform_device *pdev)
+static void mt7988_remove(struct platform_device *pdev)
 {
 	struct mt7530_priv *priv = platform_get_drvdata(pdev);
 
 	if (priv)
 		mt7530_remove_common(priv);
-
-	return 0;
 }
 
 static void mt7988_shutdown(struct platform_device *pdev)
@@ -88,7 +85,7 @@ static void mt7988_shutdown(struct platform_device *pdev)
 
 static struct platform_driver mt7988_platform_driver = {
 	.probe  = mt7988_probe,
-	.remove = mt7988_remove,
+	.remove_new = mt7988_remove,
 	.shutdown = mt7988_shutdown,
 	.driver = {
 		.name = "mt7530-mmio",
-- 
2.40.1


