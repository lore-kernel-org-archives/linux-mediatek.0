Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC020C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AKBQTT1KcI2QX0vPtHqncNj0iuqDI/bRTeinDoc9y0k=; b=nUog4jnjk3mOY9oFFXwXO6Xj+E
	uV9Q+j1Okh4YwJ/b1X48xQz8WskQP/idRvJq8VF/pdWdDjB8I8Fle4XvttU+w3sC+2KZlFDRXsgTX
	cwt7K43mR2MwNL+YV/3/ZvhmY7rSeJ+8KNJ8UMK/CiXiyLlhZkjtyx+zpmm+QFLxzAJMqj6LdZohD
	10zB/RiBfP/Z2F4MK9penbVyorooCRiej8YceZxbKlItsvXhksu17ysSXvFzoCjagnSD1n8KhJpbz
	D3x6G191zIKvTan3NMAaYghiXMvwbPnCbOhtp79iJgyHtap/P7l5bqYrKs9HRfkwcV5XWBnLth+yw
	jOZZ2kPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvXr-007PxR-2J;
	Thu, 25 Jan 2024 08:57:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSvXp-007Pwi-2e
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 08:57:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSvXg-0006xo-HG; Thu, 25 Jan 2024 09:57:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSvXe-002FDN-Nt; Thu, 25 Jan 2024 09:56:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSvXe-007hEY-25;
	Thu, 25 Jan 2024 09:56:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH] pwm: mediatek: Update kernel doc for struct pwm_mediatek_of_data
Date: Thu, 25 Jan 2024 09:56:49 +0100
Message-ID: <20240125085649.1571268-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=LgAKJbOYZ3rv7aqdPZe/a5Rf0IWWlx0GgvDlWM9aPR0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsiJSPNz4mUO5rzm4585pLiubJTxJQ2Ceudupx I5A4wQr1GCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbIiUgAKCRCPgPtYfRL+ Tuf3B/9ofxPplTuOVfAlQiGOiwTd6JsF+EpstZ9JS1ccDxb6d80IwkTzJYuMxwKdhtjnnuPH9IE tfOLXpC85kKKyZcVkyiPatghz5uBappQ3eOMs6nsU4nfb0720SwbY7jhnlJOGSTjz4TTlwuVD1T pwm8OQ9YP2+Gw4jLvJdYSdbcwaN2SdipOQKBKNWz7RFO/+iGY4jV4bz7FJomawqtZL2ITdW4keY 6y6RJP78NTg7VVxB99UlOFrA3xETZUUFzL/eazyjDuRQGDHMXnBMNa8iD7RX3qgQ40tu/ahkPet lz9b8PpM/GWK6c6lAUF4D6x9aXavMxKXxYRtigiSzFq5j0yT
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_005709_857125_7EB2EE84 
X-CRM114-Status: GOOD (  10.80  )
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

The struct never had a member called clk_freq. This fixes the W=1
warning:

	drivers/pwm/pwm-mediatek.c:60: warning: Excess struct member 'clk_freq' description in 'pwm_mediatek_chip'

Fixes: efecdeb82f21 ("pwm: mediatek: Allocate the clks array dynamically")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mediatek.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 17d290f847af..562102a47ac0 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -47,7 +47,6 @@ struct pwm_mediatek_of_data {
  * @clk_top: the top clock generator
  * @clk_main: the clock used by PWM core
  * @clk_pwms: the clock used by each PWM channel
- * @clk_freq: the fix clock frequency of legacy MIPS SoC
  * @soc: pointer to chip's platform data
  */
 struct pwm_mediatek_chip {

base-commit: b578dc69e6b1be72909b6f961f20c41019b233ee
-- 
2.39.2


