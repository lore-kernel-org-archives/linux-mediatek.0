Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648DAC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1VZwjtAuiJ88M0knX58TqtKJUlUC+YUROqaBj4NvpWw=; b=tjlBgrmJkrQSjx9fNmONsqeRih
	Wx5PFgRkCrCHcPts5jNv5hXbVpbIElfKnfEtml8OwuNz710H6nknKP3bp12+DUuAT+xtsfEPiREKs
	rfu9uODOhOyMLC4spCIo+KHlVvaseUKsPxZR4FNhKy3taf5nxoYuqwnGDccnrwjO5k1oH3/nV+DqO
	MJN9xwvr/hMrmHVOqGgTfDDAp8rM0JwG/OOQeDWU3yyPd76v/ulxJwFkp3L0TTthFZJ6xGDzMleEB
	U3OkTy1Iftis6P+6nv8NJSgq9tzKlMc05sybic5FJaJxJ8Ay3W/JxMkDDoE9E+xQ2pSG44c7WaReW
	Jym1KsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCrp-008tjY-IB; Thu, 09 Mar 2023 09:47:21 +0000
Received: from metis.ext.pengutronix.de ([85.220.165.71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paCrm-008th8-9R
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 09:47:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrc-0007fw-K6; Thu, 09 Mar 2023 10:47:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCrb-002uv7-34; Thu, 09 Mar 2023 10:47:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paCra-003VnE-5J; Thu, 09 Mar 2023 10:47:06 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] spi: mt65xx: Convert to platform remove callback returning void
Date: Thu,  9 Mar 2023 10:47:01 +0100
Message-Id: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=885; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=GAA9NNA1eTFeCZToI//iP4zdyMxlzjlonJ6Yd3JZGzQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkCasJ9by57QrgVJwLr1WcRX1JKly2s5tmgWY3O DIuR5ioHueJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAmrCQAKCRDB/BR4rcrs CaBiB/0fKV7QCeyHztzEj87HC/VU6N9POqBn12jkY8NtAyfwaoqSDxR5EdEbMZIOdPlYwvGCeQF jeiU8B1nPmmxhZ2fCdiu4zPayo1sS1vYgzeY26wnoujisQw/C2/0J0lrSES7Bld7jscEjYWyasa WXDAbnb5dIM040gTbEJ5ZArw+45HVfYprK+uXWjSGbpDLF+P5+56/tePMp20q/e6367mlKxBcFc /7AnS2O9SNKtDraviCwv31VUIbMZ01jHxxq/oS45cFn9b/h2EaSAm3Dlmm0jOk68YL69u/zowKk AOB9vY4u38uXGFhfM039u3en76/Kk+0oAf/4SUl+6dTos/Ep
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_014718_371234_CA346A04 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Hello,

this series converts the spi-mt65xx driver to .remove_new(). While the
preparing patch that gets rid of an early error return is in many cases
a bug fix, it's not tragic here, as the early return only skips steps
that are not necessary after resume failed. Still rework the code flow
to prepare for conversion to .remove_new(). The 2nd patch actually
converts the driver. The third is a small nitpick cleanup the I noticed
while working on the driver.

Best regards
Uwe

Uwe Kleine-König (3):
  spi: mt65xx: Properly handle failures in .remove()
  spi: mt65xx: Convert to platform remove callback returning void
  spi: mt65xx: Don't disguise a "return 0" as "return ret"

 drivers/spi/spi-mt65xx.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1


