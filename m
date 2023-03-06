Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50616C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B3JDl7HsvcM+bR33AI6/Y1tuCPT7EaV42mkmNvh9ewY=; b=KB4V/IadGU9YHeGN9+Fd2oJQ2h
	quI9TMXotPgTlIcEubFE90Fqha0RDZVUBXjRdj+aD7bprngK7Ohv0C27Ukq3FiERmssh6Dv4fIKK0
	ymunao+hc7SStaJa9aBvG3APR5nhkP01YQKWBOdZ/byNL82Ha+SW75vaTW8+379qr2ndvh1d/dg9f
	o16cLPViTs+mkPEd0gW9PlQXqEb1YIWgHlGpN9L5GwM/ZHQSkKCxf08T7sv+SIwXasWV51nQfZYP2
	xdtYmbno5TzmfP+siNCYiFxMAe7PGcfs6S6Ss32QnFKTX0/TmFIXxc5KxV1XpCouCPfVg34jF0xCY
	C2KPa7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ5NU-00BfVZ-VL; Mon, 06 Mar 2023 07:35:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ5NC-00BfPU-1c
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 07:35:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZ5N2-0008Os-NA; Mon, 06 Mar 2023 08:34:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZ5N1-002C0m-Gw; Mon, 06 Mar 2023 08:34:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pZ5N0-002bam-No; Mon, 06 Mar 2023 08:34:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 0/3] spmi: Convert to platform remove callback returning void
Date: Mon,  6 Mar 2023 08:34:43 +0100
Message-Id: <20230306073446.2194048-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LDehB5gsx29IvbmffavsnSV8Eu2SN5vC8ARQBx16fdE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBZeGXJt15Yv/ivjvwz1ZXiL3FL+DYlk2Ho0rZ BuAMxOa1WqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAWXhgAKCRDB/BR4rcrs CW3AB/9vd0mEZbajImYQ7YcxspnZ2asSFbRlMWaqXKeQms/i2l3cKZBq26qcx882t9TpiwyDxpa vw5OxyLIMJp5dgDjXeTTssEpYY12XhMTh8TJTVsbLYklA+9Q0JBPQkgoVJds4WCdJd8qpO7A+IU Q8ECg2+oDNQRdZhXP7IR+8MduOzvpzrPaGaCPedZqNUY4eTuLEbdNNZEF+sjncofHacPc1KDmWl 4h5e/x8C0GMrGC8NWVoVvIZ1uYJpmNdO1ha2txwHaUqvk2Hwz2VyuP5xdPDskW2JI5heJK+rPcf WAmEuKjeyACjDX5GrRlqEgLMvnx5woR95e08sBOv4xFH3zwM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_233506_305959_A5BE4CC4 
X-CRM114-Status: GOOD (  10.66  )
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

this patch series adapts the platform drivers below drivers/spmi
to use the .remove_new() callback. Compared to the traditional .remove()
callback .remove_new() returns no value. This is a good thing because
the driver core doesn't (and cannot) cope for errors during remove. The
only effect of a non-zero return value in .remove() is that the driver
core emits a warning. The device is removed anyhow and an early return
from .remove() usually yields a resource leak.

By changing the remove callback to return void driver authors cannot
reasonably assume any more that there is some kind of cleanup later.

All drivers in drivers/spmi returned zero unconditionally in their remove
callback, so they could all be converted trivially to .remove_new().

Note that this series depends on commit 5c5a7680e67b ("platform: Provide
a remove callback that returns no value") which is included in v6.3-rc1.

Best regards
Uwe


Uwe Kleine-König (3):
  spmi: hisi-spmi-controller: Convert to platform remove callback
    returning void
  spmi: mtk-pmif: Convert to platform remove callback returning void
  spmi: pmic-arb: Convert to platform remove callback returning void

 drivers/spmi/hisi-spmi-controller.c | 5 ++---
 drivers/spmi/spmi-mtk-pmif.c        | 5 ++---
 drivers/spmi/spmi-pmic-arb.c        | 5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.1


