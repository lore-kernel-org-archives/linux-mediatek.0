Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1853DC54E41
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 21:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b8veZe+ArOW7mptaOkubroVG9abZeXubxgwKMP/T/k=; b=PvVe8TSJGzzMnCjxQ7y/SVRha6
	1bEJK6lEwioI2YRQH8EEqGg1+2mNq24/ChwbLgqyWpOCG31mZyxZehUDhY3Tjts8M7rarqmZWVDxg
	U/jqIfPf9SFRmJ/nxQT2h/9HHPkwgRdo+pHWZqtKZh06XfIiLLo0kHTt8GGWbK2Kn1IacTYCEb5EL
	DHO3scWuQ2+pl0zulgDepoubW1B/YOiBBPzXWRNwrOOrPLmGZJ8r2YPLaJZtFeFl+i4sECqXU0Flf
	ijVkWC+D9qxAEszHk+DJ0eauVargJ90HhtNT6IaPdtGE5PpTeXZVbb/kdCPpZ1+gj1iQ+YgtJmKqw
	oh37jImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFs4-0000000AlyQ-3gkd;
	Mon, 04 Mar 2024 21:29:16 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFry-0000000Alve-0AmB
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Mar 2024 21:29:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrl-0002hd-8k; Mon, 04 Mar 2024 22:28:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrk-004QhS-GL; Mon, 04 Mar 2024 22:28:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrk-00H4uN-1L;
	Mon, 04 Mar 2024 22:28:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/5] PM / devfreq: mtk-cci: Convert to platform remove callback returning void
Date: Mon,  4 Mar 2024 22:28:41 +0100
Message-ID: <fbc7b0a577de0c0fc46cf1b9e1a03a9c46bf79e0.1709587301.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1709587301.git.u.kleine-koenig@pengutronix.de>
References: <cover.1709587301.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1957; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=R9sXnYv3VfRGcrZ5/KZOGdZaFSWQmEEW5PecCI0UwYU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl5j0KB0prRkwFiMOZlnfNuNGvP6+/rMnxv/n7N Rmyl6mVSe6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeY9CgAKCRCPgPtYfRL+ TjNaB/9VL/XniiKx+uwHc1n1ORgvJTG3GMwQkthaAmp6NBA7F9+JeNaXgtRvl59DQZC8L7KrFyz P5xxfmwd9/SrqLwyOjlYWVp7VTiWVwIUil+TSfKbclPOoJtue895UU9sTr9MzG8H5WXFmEflXxU Q1uQCZ/tsrq9oiJW8wlESgE5ftBzjo37qa5yFSCqC/Oj2TIN+m4xGUJlLmpnzvops+1CpFfdsck IWWx+YFUUDtp0jJf/In7RhQMkwXbTLWppXoUfY4JWifAMEBHYKyfA0F7euWxvPJh5Prk2ZCK5nQ Ionn2GSnLV5jqXltxa6FI2/q72Zc/IDm7wIUSVt2oaG8ZucS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_132910_087067_30DDDFC0 
X-CRM114-Status: GOOD (  17.68  )
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
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/devfreq/mtk-cci-devfreq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 11bc3d03494c..7ad5225b0381 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -392,7 +392,7 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int mtk_ccifreq_remove(struct platform_device *pdev)
+static void mtk_ccifreq_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_ccifreq_drv *drv;
@@ -405,8 +405,6 @@ static int mtk_ccifreq_remove(struct platform_device *pdev)
 	regulator_disable(drv->proc_reg);
 	if (drv->sram_reg)
 		regulator_disable(drv->sram_reg);
-
-	return 0;
 }
 
 static const struct mtk_ccifreq_platform_data mt8183_platform_data = {
@@ -432,7 +430,7 @@ MODULE_DEVICE_TABLE(of, mtk_ccifreq_machines);
 
 static struct platform_driver mtk_ccifreq_platdrv = {
 	.probe	= mtk_ccifreq_probe,
-	.remove	= mtk_ccifreq_remove,
+	.remove_new = mtk_ccifreq_remove,
 	.driver = {
 		.name = "mtk-ccifreq",
 		.of_match_table = mtk_ccifreq_machines,
-- 
2.43.0


