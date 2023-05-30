Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A46C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1SKlJ/a9xVtl9R8uRqd8E/jPAk2DqGvW/EaS6Paix0w=; b=L5THWMMsVv7qPGfgRo+FMEUV7x
	y96EDlfmOWyF1C7725uJAZ1sBbBDfnVCW7/huB1r5foCkba4+5mROa20y0/Ptr0o9Q/+qt9Mq3Yhm
	eLNaThJ/sr6IMD8hWzlpjv7b0HhDqbRa4hW4E0OsIrBNFsCM4svbzXXI5aBZiQ0opakq1FO7+QCW3
	9DgQUgT8Cxm/mEVhMhau2zbolqKz2HpfUUX9/16S5FXGM8SqOJwd4URsTETu3t3g4zPIM3WOnPbnA
	YbsYU4cWKbq+sRkABJ+/BvoyVYb0iwGPtGLn/4qCWbMxfuFgn9AateUqmE/CGpIU4Ik/eqZtefFE1
	QeeqA7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXL-00CtDn-2g;
	Tue, 30 May 2023 08:16:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uXJ-00CtCJ-1W
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 08:16:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXF-0008ME-5u; Tue, 30 May 2023 10:16:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXE-003pUq-2R; Tue, 30 May 2023 10:16:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q3uXD-009PLk-Co; Tue, 30 May 2023 10:16:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/3] spi: mt65xx: Convert to platform remove callback returning void
Date: Tue, 30 May 2023 10:16:45 +0200
Message-Id: <20230530081648.2199419-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=644; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kg97sQv5DoA+oGSXg9CVV4WclrrXCk1z5GaXBZO/fbc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkdbDlBF4ptq5kTtvb1PybOQI2bkX0sNVhLzsX0 0bcQuOe4KKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZHWw5QAKCRCPgPtYfRL+ TqcOB/9AhWVxKFwFfosZ0BVoPkuGDn+m8RcHe+SrXp9tSPo/AswsaqyMbbopNoTc6xeLcbmz2jk x6L8WmZUOcfBe66hhMdGPk1sTWG0kG38+vWFf5fw+DVsg5MnINClgaMOlcxjfxONgso+ze72ZVp 4M4h7JUFh7A77UPSp14wJ2m5ndFeJXnA41s+9vllPrsy6H1llO+soWemMkshaWhZxNo4Ci3FslU GwP01MBWMW6XshoWZ9/Mtvrgz8gzxnwbVoy2C+6xIbF5H1nhkaLYKWBu/bza9vP0+woAsG0RYP+ cflbLdReu80iikieQ/LFBowo6rBWJ/odoDzzPg2RI1s2sOAP
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_011657_510424_AA58E038 
X-CRM114-Status: UNSURE (   6.78  )
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

compared to (implicit) v1 sent in March with Message-Id:
<20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>, I reworked
patch 1 on feedback by AngeloGioacchino Del Regno. Patches 2 and 3 got
his Reviewed-by.

Best regards
Uwe

Uwe Kleine-König (3):
  spi: mt65xx: Properly handle failures in .remove()
  spi: mt65xx: Convert to platform remove callback returning void
  spi: mt65xx: Don't disguise a "return 0" as "return ret"

 drivers/spi/spi-mt65xx.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2


