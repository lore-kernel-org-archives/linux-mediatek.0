Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E45C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zyuvq3O8CXHRjlTYRf7CwN3pztUKSzOVWUoLoffPYEA=; b=1TgEECV5ca2ADt8yA4WmCnbs9K
	Q5X4GjpggzcBrYRNnn2LHeS0/lwUKWQPs+ysCscC+v3XN5SsHbghtJO1m1rvrvHkqpjAX4eLJFjJr
	PWIthlUMh6y7u5pSKzkWK7eutzpgjlQKqdXEALt7UL1B3G3+JhKp5VyNMvRReBl09NyBNxzffkSkK
	Kh5nc0KaiX7GScjo+FhLEETdbf+oGyvBcC3m7yLuasn22bhxuvsMRkp+MEioBInuaDjMkZ537F5C2
	t9xTmqpx3T+SKL1r5PN9ZlCfz7l92XwD/Vuab8ooQdgcdCpdoMW/Gpv+EgT1vyvdHLRyabtYQtbGn
	ZRPdhGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OwV-00HNoX-8i; Wed, 30 Nov 2022 15:24:11 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OuY-00HMoJ-MG
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 15:22:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0OuN-0000AW-0c; Wed, 30 Nov 2022 16:21:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0OuL-001Ldw-I8; Wed, 30 Nov 2022 16:21:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0OuL-001Vr1-DG; Wed, 30 Nov 2022 16:21:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 08/11] pwm: mtk-disp: Propagate errors in .get_state() to the caller
Date: Wed, 30 Nov 2022 16:21:45 +0100
Message-Id: <20221130152148.2769768-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Oif9jO/ANaV2n8mI1Wq5VGoWZKNoCZbLOMG3XU4Hj2w=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjh3T7YqPl7JZhWa8Pa2lUKahY1hm5Te0uFIv3uqcp pRHSC+SJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY4d0+wAKCRDB/BR4rcrsCc8fB/ 47kl5AVu6pGuHI/CsRRxJJS4Dskp2blmJE5duNo9j12Cpt3gsaP2ZuE7z4Lu0nwEQL/Ak6JBUkDrvl 0Ka3WDtNz8PRWRowPY1oqoi6s7hn/4zwBaMOks7f4qJvUyBtitXgDCA/8jgQ4KZyla8XhwnLAyncCq vK7iRM7lq4hurTEtxtzu0yY2ReLKJ1tk27EMBSo53Wv3HzbjnKEaluegwUcSnmlpiiZgjk1Oj1hFQt LR43Bne71SZH96jscnRGgSwh191M8po5Zcp22LHIreoGGSsPWtEAmd5SxuQl6WxnQL/Mp9dY7nTk7r QCx73jbJyahSah2nbNjRHy5aoXSqGi
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_072210_757628_D1E98120 
X-CRM114-Status: GOOD (  13.52  )
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

.get_state() can return an error indication. Make use of it to propagate
failing hardware accesses.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mtk-disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 9a6bb334a31b..67e5799dd157 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -184,14 +184,14 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	err = clk_prepare_enable(mdp->clk_main);
 	if (err < 0) {
 		dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n", ERR_PTR(err));
-		return 0;
+		return err;
 	}
 
 	err = clk_prepare_enable(mdp->clk_mm);
 	if (err < 0) {
 		dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(err));
 		clk_disable_unprepare(mdp->clk_main);
-		return 0;
+		return err;
 	}
 
 	rate = clk_get_rate(mdp->clk_main);
-- 
2.38.1


