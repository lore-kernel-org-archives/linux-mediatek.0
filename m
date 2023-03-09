Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6354AC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2mn89HVNEJENMJTeBUWh0VLNIJkC8ONnn7Jk84qQrhA=; b=XWx4X/pmpa7C8XDqqSdz5GR/nh
	MxgdZqrFsP6FYPNtY5qoMh9zBmU20qAKEk8sGeugrCOMNi4gD0hx+wkFLT6cYQrzdgBKmokVqcON9
	RqK8aoZnZkIceVaLn2XDHlYAOH8uMXajHC2Zy4QYC0F0oPzeiqa6kl6NsbAJQkjkmuktQ5JF/zIq7
	6XyOImYZdqQjQBCNJkY9BNLxXvvPNACPKrN0RoIcuFxvzBrJVXD393iLIcQFnOcJ0nvtjq53GZZav
	AQKeVo1Lhh4bwCC3zHE7LUfpy9E6CL97h2TgP+pxcOxMmGML4x0sst+p2ZxByM5e4WnwWAf1WAQI7
	glUwutYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCry-008tmi-Ed; Thu, 09 Mar 2023 09:47:30 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCrm-008tgi-E0
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:47:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrc-0007fx-K7; Thu, 09 Mar 2023 10:47:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrb-002uv8-3P; Thu, 09 Mar 2023 10:47:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCra-003VnH-C3; Thu, 09 Mar 2023 10:47:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] spi: mt65xx: Properly handle failures in .remove()
Date: Thu,  9 Mar 2023 10:47:02 +0100
Message-Id: <20230309094704.2568531-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
References: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=yh/+04G2mPy0dKpao1v1bYKj6AZtMwDC3Z1eft87mk8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCasNEPvAeZV5KK/fHmPsGkPJLZO1RWfvtok0y vsIcxFeGvKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAmrDQAKCRDB/BR4rcrs Cdu4CACSHiTTHFcll04uCZUeJeS6AR0504iswcnVvtXCR0dvRFXwtXIAj5DvGLMrkygpvLzy8Fz D4SbbRNC4So/Ceks6J9QWMLbZ/IKNoxLop7z7vEEYHIsHzLcwsbj37ayJy11VQhRQB37LhGwfu5 0r02zYlvSfCIqn/AFLhxgS69bCZ3IueW2KOj7pAxeatoSKbsOpo3HfXw2Lb9n8gLNM8RDC77c5H VBLIk9vUpn4LB4uvVkM+esu6R9MjHz2AXoagZuSWSbkWyoNjqFFRpWENSLur8yKpsurqFHBPdqb R5Ayfg7SUenHGDpwcIcube0sXIbKW32Ym15STa+1XDXKVqBM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_014718_522696_46783B89 
X-CRM114-Status: GOOD (  15.51  )
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
 drivers/spi/spi-mt65xx.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 9eab6c20dbc5..b1cf7bbb2c08 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1275,15 +1275,20 @@ static int mtk_spi_remove(struct platform_device *pdev)
 	struct mtk_spi *mdata = spi_master_get_devdata(master);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0)
-		return ret;
-
-	mtk_spi_reset(mdata);
+	ret = pm_runtime_get_sync(&pdev->dev);
+	/*
+	 * If pm runtime resume failed, clks are disabled and unprepared. So
+	 * don't access the hardware and skip clk unpreparing.
+	 */
+	if (ret >= 0) {
+		mtk_spi_reset(mdata);
 
-	if (mdata->dev_comp->no_need_unprepare) {
-		clk_unprepare(mdata->spi_clk);
-		clk_unprepare(mdata->spi_hclk);
+		if (mdata->dev_comp->no_need_unprepare) {
+			clk_unprepare(mdata->spi_clk);
+			clk_unprepare(mdata->spi_hclk);
+		}
+	} else {
+		dev_warn(&pdev->dev, "Failed to resume hardware (%pe)\n", ERR_PTR(ret));
 	}
 
 	pm_runtime_put_noidle(&pdev->dev);
-- 
2.39.1


