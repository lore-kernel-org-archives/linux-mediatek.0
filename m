Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF5C4707C
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 20:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xjz205kwzJuuh+fas2NR1g2vtuEOc7c6hwbFjh9AJSc=; b=2vq/NfQEeesN2gn80mBrO9FFWr
	pDSnOghf/XQWWuPp35NL3bEN/GkupjZuIIpnkgp6BBoEocCixzkDLJKggD+mw7DIAJwH5wuEUZnWt
	fk6zpvXv562gD5sc2SXTndhP7trevtJd7DQMUUx2UNzRSwAKzE6jeFd177NUaVP1/YNlQq7mDvfXV
	X+9KVTr9HiFak4qaTRGFT/P+VoHkMB+e/HZ9yz3yCzoX8l9f9Ve40b+KWl4cPjHK2EztuBK20BbME
	aIq/GDSN+0LXwDxxSMjMyosdI72cbRXZ+qC+GnvvVjrW2FmQVj/jeSfo1EfOR3OJD0bH1r57ACbsd
	Wr0cfftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPTSV-00A8Dw-1L;
	Mon, 15 Jan 2024 20:21:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPTSQ-00A8Ae-2y
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jan 2024 20:21:21 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSH-0004v8-U7; Mon, 15 Jan 2024 21:21:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSH-0005hM-Fr; Mon, 15 Jan 2024 21:21:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSH-000N8h-1J;
	Mon, 15 Jan 2024 21:21:09 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 23/33] spi: slave-mt27xx: Follow renaming of SPI "master" to "controller"
Date: Mon, 15 Jan 2024 21:13:09 +0100
Message-ID: <ce0557861684ad5b6c51cf8f537c69b5a59947f1.1705348270.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=9RamQld7ehDahTK1UAe+GkwrSp24P4ucFsRrUBlQgRI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlpZHaQqGDl7ik5LslfQtscg1JcQlYlHu/HR25p /4gsc45q1+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZaWR2gAKCRCPgPtYfRL+ Tn0oB/9yfU3PrYZgymgA3AjxI3ghhDkjbhz19h9alePBnaKB2qt3J/u/318cz1uV5grRhFgxBAW udtVfwAn/Ls6FT17y0F0k6viqivc1r4PKbUYMUZycFyx/gsoJyh4sQc3+UG4lky+G9CgXInAqUQ cX3yeENuM7DcLWR6q/bqfPr1MKGs1/vWmYAWt5oYAW/4T6K5syMJs1huJhAqXiJaxzhRmky4lRM dFsknCqm8cIn+mHi6VmZvofo4ZD5aRzHt69G3yqz2X4KOkJv76OkA1CcSvK7ys+udvFyPWNa61L 71AO8dSpzIzuHujiofr7V71fWSzLy/nkH25pFTN5j78CcBsQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_122118_958105_A35CA549 
X-CRM114-Status: GOOD (  11.79  )
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

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/spi/spi-slave-mt27xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
index 6d6772974783..f1ddf4c099a3 100644
--- a/drivers/spi/spi-slave-mt27xx.c
+++ b/drivers/spi/spi-slave-mt27xx.c
@@ -297,7 +297,7 @@ static int mtk_spi_slave_transfer_one(struct spi_controller *ctlr,
 
 static int mtk_spi_slave_setup(struct spi_device *spi)
 {
-	struct mtk_spi_slave *mdata = spi_controller_get_devdata(spi->master);
+	struct mtk_spi_slave *mdata = spi_controller_get_devdata(spi->controller);
 	u32 reg_val;
 
 	reg_val = DMA_DONE_EN | DATA_DONE_EN |
-- 
2.43.0


