Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3491C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jj4XQV1n2ucT7Q83GpWjQCTXZWQ8wtW852fhY2uC0s0=; b=L/gU24sxfPqPatlmxK9dskeqZo
	fGGyIGzQ6fWGm2B9e67GjQLLt7hqu+d2Jq0oh2zKLMLFtmP75t80X4p0i0wYUoWRK+dzjCPcv0Nu6
	HLRSmvN/yFnChNsUzseqV+6q0eLQrI5pGzYPCYejJMRdHkQP+dw40chCmU1dseR4TKoiWq8KKWRJ8
	fj0EqtdmdeEpJ6jX6MoXE0cLc2prxgTpX+0aTj7S8h5aC+GfOGWtQX55RkJg7nOMj5Kp2bLhQksyG
	xli/VTBO3Q4+lyzWg4Nsy2+P9iSyAe0XKTsqa8ZSZ77a5wCJ4nDKOpoLxc88GxF83A7BX1TEp81F0
	2eXn8spQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXM-00CtEX-1R;
	Tue, 30 May 2023 08:17:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXJ-00CtCK-1h
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:16:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXF-0008MP-By; Tue, 30 May 2023 10:16:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXE-003pUv-MN; Tue, 30 May 2023 10:16:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXD-009PLn-JI; Tue, 30 May 2023 10:16:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/3] spi: mt65xx: Properly handle failures in .remove()
Date: Tue, 30 May 2023 10:16:46 +0200
Message-Id: <20230530081648.2199419-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
References: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=HeehL14pDk9cEx04aGTWKlwLKl717iunpcSw/+seL1U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdbDswY5j4sTDtudQWCDRAEvAbQJO6XPfc5UaE Io3N3SICICJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHWw7AAKCRCPgPtYfRL+ TiZdB/4qbqDn949mm9Z6UcMZ5URKLHmLfdgTSpsrMQYRdqh5z+2fv5PeoU+2/qjFFX0vFVpTDZ2 JJxoLprnB071k/LkxnJSEzfk0X7hmrxOXyO1CNEhjL5pQqgm/j8ZGgXCuZtvJG/IUjPdez9SWR+ u1a3d3AZ8Pw3e6TbPbz2f+d0GdO86hMAbRHJ80UVW7IeRbs1AcmvZiuC6Xp5SC2OX2rrInpM3wS 29OgCPy7HsWIpCy5LbUbx6u5KYUsaMiTGQ+jHXjYFzPrR2X0C2lt9iTPpCXkikAEUC9U8nweBmO PhbfYbwWB3sKC8iLIqIBVX3u5W4qvcqCfTS2/0/eT3aRmnF1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011657_557768_0F6E9E4F 
X-CRM114-Status: GOOD (  15.82  )
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

Returning an error code in a platform driver's remove function is wrong
most of the time and there is an effort to make the callback return
void. To prepare this rework the function not to exit early.

There wasn't a real problem because if pm runtime resume failed the only
step missing was pm_runtime_disable() which isn't an issue.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/spi/spi-mt65xx.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 21c321f43766..9333a0e8204d 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1275,15 +1275,21 @@ static int mtk_spi_remove(struct platform_device *pdev)
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0)
-		return ret;
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "Failed to resume hardware (%pe)\n", ERR_PTR(ret));
+	} else {
+		/*
+		 * If pm runtime resume failed, clks are disabled and
+		 * unprepared. So don't access the hardware and skip clk
+		 * unpreparing.
+		 */
+		mtk_spi_reset(mdata);
 
-	mtk_spi_reset(mdata);
-
-	if (mdata->dev_comp->no_need_unprepare) {
-		clk_unprepare(mdata->spi_clk);
-		clk_unprepare(mdata->spi_hclk);
+		if (mdata->dev_comp->no_need_unprepare) {
+			clk_unprepare(mdata->spi_clk);
+			clk_unprepare(mdata->spi_hclk);
+		}
 	}
 
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.39.2


