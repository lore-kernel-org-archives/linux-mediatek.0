Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B251CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+lZPJQyEICLO+A/fmrHbSHWW9vLnuElJ+ji7TmNWjUQ=; b=Fq5o9d2YCAMHgf8ksoX/PGspKv
	wIqiY8BRZl4DS9HG6Fo37BEE87OR3ojjvO2K07SF3iFsh0dOPJSVmWRbqg6p989u+p/nkiK7/PwBS
	v7SvuFnVQyBXeH9oNo4Rkxrz5hoqFvCEZTVWLZnUNgpdT5TXf8FEHw/ePUcJiO50JhMNIQjQeyCW8
	fFOniCOLfrVLinLUV5ucwpZ3I6mMwwp3Tn+fnX8zW1ji0XrZkivmv6MBhxMHRaBniknAB0GCtluPI
	lx3vkmdBmWcWKWweRPaY0cI9c3b6W6rYDjwo31S+J2htBMRA7XIUX+pa3E93Yi/N1OlrCcB4HKVbe
	hchzXctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJmj-00G9uB-1G;
	Mon, 18 Sep 2023 19:19:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJmg-00G9sm-2y
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 19:19:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiJmK-0002ny-A9; Mon, 18 Sep 2023 21:19:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiJmG-007I2L-0p; Mon, 18 Sep 2023 21:19:24 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qiJmF-002m1d-Is; Mon, 18 Sep 2023 21:19:23 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Colin Foster <colin.foster@in-advantage.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	=?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: netdev@vger.kernel.org,
	kernel@pengutronix.de,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next 0/9] net: dsa: Convert to platform remove callback returning void
Date: Mon, 18 Sep 2023 21:19:07 +0200
Message-Id: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZA7dOFQnSLtrugXK9Bl0+O8+Kz/XLhZGGCrzvWbf/y4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCKKmTnyEQKzVWdf6Nj8Xvf8bg7hDbrstIXHat tgDgTFphauJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQiipgAKCRCPgPtYfRL+ TiQYB/96svIfIe+AAw+Fih3TuSWGmjmLWKi8W8r7Loh8Pu2E6hhlYD0AKX/i5R+7mbQZf9bb8dr oJlDp45nupIK/x0putx4RZpjMqMDxP59wfujefc21r+oRQJsDpYOQKOIpKw/r73+X94GNFFuCHn avBjzZfD6hug7rQ5XOX9WXSc8IsvDvcbDVYZsAW5isS0esbjISA9VmaT0cnI1BjkbgWei0NYRtD bKo2/r2uiYHO7/RObCY8d7Fp6DyHYQNRb+X5JXM0nQ/9GJmzzyUIXs8nJvp6K1znnyOFoQsPTNe /ko6OH3sTs42Eb3UadUrWfTG+04YHysc/Beo6c32crUzEL19
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_121950_961266_D04D05A8 
X-CRM114-Status: GOOD (  10.73  )
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

this series converts all platform drivers below drivers/net/dsa to use
remove_new. The motivation is to get rid of an integer return code
that is (mostly) ignored by the platform driver core and error prone on
the driver side.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are no interdependencies between the patches. As there are still
quite a few drivers to convert, I'm happy about every patch that makes
it in. So even if there is a merge conflict with one patch until you
apply or a subject prefix is suboptimal, please apply the remainder of
this series anyhow.

Best regards
Uwe

Uwe Kleine-König (9):
  net: dsa: b53: Convert to platform remove callback returning void
  net: dsa: bcm_sf2: Convert to platform remove callback returning void
  net: dsa: hirschmann: Convert to platform remove callback returning
    void
  net: dsa: lantiq_gswip: Convert to platform remove callback returning
    void
  net: dsa: mt7530: Convert to platform remove callback returning void
  net: dsa: ocelot: Convert to platform remove callback returning void
  net: dsa: realtek: Convert to platform remove callback returning void
  net: dsa: rzn1_a5psw: Convert to platform remove callback returning
    void
  net: dsa: vitesse-vsc73xx: Convert to platform remove callback
    returning void

 drivers/net/dsa/b53/b53_mmap.c             | 6 ++----
 drivers/net/dsa/b53/b53_srab.c             | 8 +++-----
 drivers/net/dsa/bcm_sf2.c                  | 8 +++-----
 drivers/net/dsa/hirschmann/hellcreek.c     | 8 +++-----
 drivers/net/dsa/lantiq_gswip.c             | 8 +++-----
 drivers/net/dsa/mt7530-mmio.c              | 7 ++-----
 drivers/net/dsa/ocelot/ocelot_ext.c        | 8 +++-----
 drivers/net/dsa/ocelot/seville_vsc9953.c   | 8 +++-----
 drivers/net/dsa/realtek/realtek-smi.c      | 8 +++-----
 drivers/net/dsa/rzn1_a5psw.c               | 8 +++-----
 drivers/net/dsa/vitesse-vsc73xx-platform.c | 8 +++-----
 11 files changed, 31 insertions(+), 54 deletions(-)

base-commit: 7fc7222d9680366edeecc219c21ca96310bdbc10
-- 
2.40.1


