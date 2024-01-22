Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA44C47DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 18:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xjz205kwzJuuh+fas2NR1g2vtuEOc7c6hwbFjh9AJSc=; b=FZvMpKjCAXtbUmhqL4yXQ1kOhE
	KWH7jBy/p9gZ7MfaCVdqs+iVHck91HJZ/2g62kkjgWTpW7Y6ke7byCxsfheiXMCylZ+A9++kWCTtC
	uWJ9KEUQdVDahSVWCt88RaSuaKYMGIJ0ZyleIOdcpHLlHdsRLxfenGf3J94Tk8PR3s0zje+ijGAse
	S/sw3TZv9spwi4Ymlp3mgMd16ecXzn+GRdSlp0IkHTWMgmj+4of8PRFz6IvBFumt6euhSuvkenSC+
	6KdC5QGUjezjyIa5HX9JapHI+yxG4VKJRC5NZ6WicYrSDg9+/ZO/4KKfQDkTraLA1FGXMjlp9i/Xn
	xZmslDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyiu-00DQnx-0Y;
	Mon, 22 Jan 2024 18:08:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyin-00DQjB-2g
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jan 2024 18:08:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiY-00022q-4p; Mon, 22 Jan 2024 19:08:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiX-001eQd-FM; Mon, 22 Jan 2024 19:08:17 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiX-005ZyN-1F;
	Mon, 22 Jan 2024 19:08:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 23/33] spi: slave-mt27xx: Follow renaming of SPI "master" to "controller"
Date: Mon, 22 Jan 2024 19:07:18 +0100
Message-ID: <5d38a6928cb52f1f72da3a3069636c420be93ddc.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=9RamQld7ehDahTK1UAe+GkwrSp24P4ucFsRrUBlQgRI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlrq7ezVtCxdQJo7xIAHnqBkmO28zJGhR9iaAqW 39326TPkWyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZa6u3gAKCRCPgPtYfRL+ TpB6CACmf7xWf34DoKNKKG5cpSdxgfw2m7go8IrZPUJY5DQGXLgKpbSDElPwAo1tD9jUtQraXk1 FHGu0y7BmPEZBGmFIVM9imtJJ+zAEO2C1Y+06g9zi2sMIv2cNfgIEu6/keKijoXlUuUFWYuIOZJ tlK5AN/phgxZ3AvDEZUsuB2YSf7w/Lf0qD5V4PXd2pWw/wd6HZ7kjEtGRJrkpRI47XRE9mo+e5Y hjrBTN/y8xjwGHMxXWUatlR5FRi3cqV3BsAk9eIIh+ZsaVLkFfq5WHPAaE+05sx1nwkux4yrxt9 FtUtq6P81lgUzCdn4zRTA+4inO+9uaLOs84VQd0BMPM8MrCi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_100833_882511_ED9A8A8C 
X-CRM114-Status: GOOD (  12.06  )
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


