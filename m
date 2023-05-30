Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C969BC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uct5Rd2fOgS3ltRxnO3//jzkezQj+hNKkaRvD7gAumE=; b=xWVHeVGlbZlHClRoxgp18meAMh
	FjQxqOS9DRJJhMdg0CUDqjOZj7nZ8oVup/gm3cnIUWd0NUex0QO99gG8i1WX00ZQslx97KXs1+5Yr
	Y1ipXiwuiPEHeD3uwBWKhj8lPA0vFps2zdpRmeIGBzYkEPuT8qjraR0Ww2eUjJMURi4FXjfV00Q4D
	AMZmFPRcmx2ZloyC6TuLUh/pd/Ah80dNLKKlK/w5RPQM0lPoIKQU0Wr0gE+gKbM9TK6rOTsScOxnN
	/OETl3zweYYg6sRIwXYNBFGIkXiTRWQQP/38amhPhe0EdOXoa4HEyHhzgVZ6PnTFo3gKF8SMQrkhs
	/ob3WXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXQ-00CtGS-1T;
	Tue, 30 May 2023 08:17:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXJ-00CtCN-3A
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:16:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXF-0008MQ-Hy; Tue, 30 May 2023 10:16:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXE-003pV0-SO; Tue, 30 May 2023 10:16:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXE-009PLt-0L; Tue, 30 May 2023 10:16:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 3/3] spi: mt65xx: Don't disguise a "return 0" as "return ret"
Date: Tue, 30 May 2023 10:16:48 +0200
Message-Id: <20230530081648.2199419-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
References: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=802; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ew7u2vVjRGswRnJ0Le+vSh/UTGZDw0qmYIiCRc9OzYk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdbDv3hfrWqOKRbA5eyKpO+36tm6FOWuuaFq4T Pi1bwKRRpeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHWw7wAKCRCPgPtYfRL+ Tt/DB/44PJgEduak7dCLH9t+Dlt0HWOfr/wUwjV5gRjJpu54mmJ+Fc7FsX+IAcebhW7VO0iIhw9 R9ywW8VC5j3j9jZ8gjAmVyINoWg0yDoGAsAfcb0HyFmORXOyJudhrSSs5+nXU1t1gBL4LSaJ9bI BP6kOw/VhrTRIKwZCkrNNCTC7yfc7ejl/nKFIBQVjV1hPHcZJ++rONpsaDOe8a0WtCNIxc6BUNl Vwmi8FSfYAdHK1ui6c15iBcydFR90DdWHCrnPPKlrwf6wTyY1RYsbHZYEqojKrawNl8ZkjSicTQ Djp2FbivQCAauxYQu+S2UhQ84pVZJPVJ0BtSQeG3r2Wtdyu1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011658_020189_95125808 
X-CRM114-Status: GOOD (  12.86  )
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

Because of the earlier

	 if (ret)
		return ret;

ret is always zero at the end of mtk_spi_suspend(). Write it as explicit
return 0 for slightly improved clearness.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index f532cee3461e..5a0b04c1c755 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1312,7 +1312,7 @@ static int mtk_spi_suspend(struct device *dev)
 		clk_disable_unprepare(mdata->spi_hclk);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mtk_spi_resume(struct device *dev)
-- 
2.39.2


