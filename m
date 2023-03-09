Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B279C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGYiUAmnk47Hv7Q+f4omBNkRuSOtH6bMrBhbXrmSme0=; b=ZKwkp2FtMCEJkdm6tSWhYBVLX0
	I62hK03oYaKvK1177VfV6YhJiM/kR9I5JIkIuuflBoDHqPOB7+9YDugcvAg1wL1Bgq0mVEfKVxClO
	zohi1Tp8CsMy/xPgylQskpIrJ69gYU6GpvEtuslJAs2K3Y1rkKURAC2TVr3UVlTeLeB+7ue2FiSgI
	5tH706QzIu9VHbRgr7fK785y90+U9OBdpVvR0YeokcFcO6WORUh7nxoEWVgkCBhNtdJ+Gedp2Yumw
	/2TGMVUYwniMVUNZI46UZApXCDMYQu4XjRYU9rITLQYK9EWy+DCeArIp0x6UcOzBv87Cz09m3Kphp
	eX1bjp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCrx-008tmU-PB; Thu, 09 Mar 2023 09:47:29 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCrm-008tgv-9U
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:47:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrc-0007g1-K6; Thu, 09 Mar 2023 10:47:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrb-002uvG-OY; Thu, 09 Mar 2023 10:47:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCra-003VnN-PA; Thu, 09 Mar 2023 10:47:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] spi: mt65xx: Don't disguise a "return 0" as "return ret"
Date: Thu,  9 Mar 2023 10:47:04 +0100
Message-Id: <20230309094704.2568531-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
References: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=719; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4ZsBC//oBmMrgEk5xvSD6NYRRsiV5c5ra/OtiZrxzxs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCasUb7W/iSx+xSTQlRXV0Bcy3BSJmEvj91w2M oqZhz5kw++JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAmrFAAKCRDB/BR4rcrs CeHoB/46zjiVBXgAvaDNTZdU0d0778ZqugvMQiN75MH5QGw5b4rQ0xmV7sxX/yH5GJPlp0AM6gN K3bW9q1x/6JYntYsgmUU5ntZUOmopmKOsF7PDhftbd/wxTOk7O4OfkymSKh1kni87OLL63VfjIN xg8l6/g+Pg7AyoLPHjOm7mpoWIY2shjABVXoCfgm10KNThnm5i7KibEr1kfeffJ37NEmdkshbFd oBM0brj9HrlJTfPL2qqqj0glFziojM+7BBkodl1yIv2djtWVTMo4CKlqqPOQs+hIm7D/MFcFsGX 3JNFTxgqLhgY6Obwk6lDkFo9Vn8l5j7Yyxo9uiN8zfLDbq2H
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_014718_373275_220AAF5E 
X-CRM114-Status: GOOD (  12.80  )
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

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index f744cb97aa87..2216d4e00c7a 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1311,7 +1311,7 @@ static int mtk_spi_suspend(struct device *dev)
 		clk_disable_unprepare(mdata->spi_hclk);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mtk_spi_resume(struct device *dev)
-- 
2.39.1


