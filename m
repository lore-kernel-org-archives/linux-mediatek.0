Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1F7C47DDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Jan 2024 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RvZ5Io0RuJBaQqGXuTB/cV5lrPQkLLFNN0oKaea8T94=; b=sCSMv0bx81KV5Nz3oWWdziqSjv
	XmGgxyW17f7Q5E8+sMPzarxZeEmIJbE6JrHSIk8VXEZr6pVDv+qnRRZWCRoKwl/13wQ8ue9uBNTfe
	tTYQvNx+Yi02DgUtXtttpmoAprn0RXo5UQdZIhkOI0q+PtjRWeJeYZ4dermPEASrJ+pKv5PmteCED
	96i2PA7g6Iw0vvalaGp0EGYvM0MnOus97JPGQLoSMkAOYdMVVBGYjDhCO8JRSmB775rmbRISohr21
	d4OjwmKak0JTPZ0jtapLFNq0PQQi3BcV1YbZ115fIzYi4DKpHCCrIcUpk/oOAnlIbnYFwtx9z1QQ5
	PGoMSEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU0gN-000000094X7-0YRN;
	Sun, 28 Jan 2024 08:38:27 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU0gK-000000094WD-0MQ0
	for linux-mediatek@lists.infradead.org;
	Sun, 28 Jan 2024 08:38:25 +0000
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id U0gBr3CH8wnxGU0gCrvtYv; Sun, 28 Jan 2024 09:38:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1706431100;
	bh=RvZ5Io0RuJBaQqGXuTB/cV5lrPQkLLFNN0oKaea8T94=;
	h=From:To:Cc:Subject:Date;
	b=KkY1L1xm+CslAfCnBetSSorAkB+OaeXBaDHr4YV0PRu1JZB5Sy18yYAWI0OuvejoE
	 3yheer7k0bQlVvFFjbEDuXIbmoRotWyrxMNWW7Ec601FRIW8wTVOdGABkn69BH9iCh
	 7HyNoeovoBD7ul9yGBW3W9Tp2IRShtHCquEJOZNo4M/AiKlyOol1dh8MRF+wHc32Ib
	 YTc2anfLqXfHzeU3Kr38LtT2sWYHe1fJPDAL04XrgyX6GKl1mAzSIKCN6RkfcTrmST
	 fePLWsovz0bloH1y8a84RQHIPdcyjTj7Bs4/pGsc8bMJNvvsKQgbWOKqpy4q23lwnm
	 iTzRs1HT1NB+g==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 28 Jan 2024 09:38:20 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Fix a memory leak in an error handling path
Date: Sun, 28 Jan 2024 09:38:10 +0100
Message-ID: <481d345233862d58c3c305855a93d0dbc2bbae7e.1706431063.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_003824_285923_682A4AB9 
X-CRM114-Status: GOOD (  10.22  )
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

If devm_krealloc() fails, then 'efuse' is leaking.
So free it to avoid a leak.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/thermal/mediatek/lvts_thermal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 98d9c80bd4c6..fd4bd650c77a 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -719,8 +719,10 @@ static int lvts_calibration_read(struct device *dev, struct lvts_domain *lvts_td
 
 		lvts_td->calib = devm_krealloc(dev, lvts_td->calib,
 					       lvts_td->calib_len + len, GFP_KERNEL);
-		if (!lvts_td->calib)
+		if (!lvts_td->calib) {
+			kfree(efuse);
 			return -ENOMEM;
+		}
 
 		memcpy(lvts_td->calib + lvts_td->calib_len, efuse, len);
 
-- 
2.43.0


