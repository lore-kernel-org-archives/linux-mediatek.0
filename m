Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9B1C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ueu/6JLu6V1sRM/DIHRQASjRIZis0cew/mqtKtyCxHg=; b=Cs9W7R9jUHmAA7fZp1DtSO6omI
	40HUxlWRfIlVdBNVJ9Ek69/dvDsOVFHVLKHH4AONeDw64aA5yUS4BJ0wfhfjHAt7WrQhnJKwPWulA
	zmQOZLiofvd1pbVNQS4uBuSo0EJu77UIKJmErx/Mlrd7VKgyj/p3/sIvlrbCkqGTZj0STl5C8n+He
	WV2POuP45St0tuIqevPvLY8Re2EfFAbgmz5nM5fxeXUubX3/YP4y1nBD5DN8UVwT3AXSvdsXtbm4M
	ra0uVGCXUIHP/QGU5ODejqEqpSsNGRL6EQp0HhH8+yVowRSEqPO7vhT9lqX2N/YqksLSa4AFDJEj2
	/pMNZkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFs5-0000000Alz1-46Xc;
	Mon, 04 Mar 2024 21:29:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFry-0000000AlwB-2DpD
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Mar 2024 21:29:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrm-0002ha-4c; Mon, 04 Mar 2024 22:28:58 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrj-004QhJ-Rw; Mon, 04 Mar 2024 22:28:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rhFrj-00H4uB-2S;
	Mon, 04 Mar 2024 22:28:55 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/5] PM / devfreq: Convert to platform remove callback returning void
Date: Mon,  4 Mar 2024 22:28:38 +0100
Message-ID: <cover.1709587301.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=I8FrXbA0yYPCBU7whuLuGnZASBBwSsmETYGw/S5pQmY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl5j0HnQ9HbZZ2kPQg87lTw1l0aHXNyWwhnhsnF Ze2WEkKiWiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZeY9BwAKCRCPgPtYfRL+ TpwtB/9gDVqajzBWr6Yq2hzHvcBIPncZICpIow1WLn3frJrifgVnMYr8KCoL2Syo+Wp1V/UkKLo Ys1yqZP7AnZh6IKp78Npuk7YMFgidKtO3Vhx+zzIirOxSTs1tGnhmaYy2SFs6NGUjQsIZGg8FSm b/PPvk0shfxxxVbfryhvsZLHJ+VXY7kyZgZpsv4YlbPRJRuadTF9GyZskOy542wl5jvE0F9UI/X XeoQIioJNbpQWlflc3xqke4/O83jhaQs8b0ofFGKNZ5Ei6btSXes5WNOHP3tM1EOU8rkPm794OA 6xJ96LXSxqWLgYXcg6lHBlIttaq6IRp40Rau9hrup3/gPFLE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_132910_580497_86CBF0DE 
X-CRM114-Status: UNSURE (   9.79  )
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

this series converts all drivers below drivers/devfreq to struct
platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Provide a
remove callback that returns no value") for an extended explanation and the
eventual goal.

All conversations are trivial, because their .remove() callbacks
returned zero unconditionally.

There are no interdependencies between these patches, so they could be
picked up individually. But I'd hope that they get picked up all
together by the devfreq maintainers.

Best regards
Uwe

Uwe Kleine-König (5):
  PM / devfreq: exynos-nocp: Convert to platform remove callback returning void
  PM / devfreq: exynos-ppmu: Convert to platform remove callback returning void
  PM / devfreq: mtk-cci: Convert to platform remove callback returning void
  PM / devfreq: rk3399_dmc: Convert to platform remove callback returning void
  PM / devfreq: sun8i-a33-mbus: Convert to platform remove callback returning void

 drivers/devfreq/event/exynos-nocp.c | 6 ++----
 drivers/devfreq/event/exynos-ppmu.c | 6 ++----
 drivers/devfreq/mtk-cci-devfreq.c   | 6 ++----
 drivers/devfreq/rk3399_dmc.c        | 6 ++----
 drivers/devfreq/sun8i-a33-mbus.c    | 6 ++----
 5 files changed, 10 insertions(+), 20 deletions(-)

base-commit: 67908bf6954b7635d33760ff6dfc189fc26ccc89
-- 
2.43.0


