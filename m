Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F032E728C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZMRSMKnlrD1U3dbDKV3ZsfG+9Qa09KW7w4mJFQSQLNU=; b=pnRtqQmCZ3hiRsi4aGfleQqJSy
	gXUr84NsBG4Ivbk7qT7PARen25JHicbUjps/27Gs/TIGVHKudIxNvDL9PN8dbdxktvi/csh04hazG
	2J7doTAzVDK7H6bNZlu+ddmy2fY7HYD98SQx/5N7ifcg/qkJb+OPJryk7Iy+/UbPKT4xjDs6rkPfZ
	eAdNQ3804BjDsIRKZPiUNLCMjs94WMT1A1WQk15IUDyYOG35rA0lUG1ZIt595ipmXgYOJo2aaSUtb
	aTrZXQrwQ9+b9KK3OkRfknfNdD0ir5ejcHKiPaaP/U63cPBL2hk+zVcpD6ZLdd0zRAS9+JOlhDIai
	1d3sqVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmGDm-008HIX-11;
	Fri, 29 Sep 2023 16:20:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmGDD-008H6r-2T
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 16:19:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmGD6-0007mo-1p; Fri, 29 Sep 2023 18:19:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmGD4-009r5J-2y; Fri, 29 Sep 2023 18:19:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qmGD3-00615m-Ou; Fri, 29 Sep 2023 18:19:21 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev
Subject: [PATCH 00/11] pwm: Some random cleanups
Date: Fri, 29 Sep 2023 18:19:07 +0200
Message-Id: <20230929161918.2410424-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EU2LjIzzIEw1uOSkgKF6jDTiS5CXMLB75+qFfOk57jI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFvj0VfUlmGHNT0hrh6Yv9rwSiuxTi4ATgbZcq HPOTBZ67PiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRb49AAKCRCPgPtYfRL+ TlSiB/9Njt9Jdg9B7UzciPo87WQq9tGAbpUf6QFamH+saJ1AQm4yHL6lCd2oMFbBFlkLpalWp5Q Ynhb2OC//zWV/w66/9erqdkKn5LTizfPsEJWy5ED6PvZi4fUxWdYy+oihDDO5fnq0xCqXClqL4t W38Mvf9eGBlF+7GR+xlsYLtTgFvLoCHgWXvshv0IbIxpNGWL5ECEeZLNLWODax95gD2jb4vhIQS jtStovnFEYHljix7uE8O6A8ls/IcFj2TQ/Lr9HJ3hiUIjgYRLCLnOIvb4mdZllSmudbdVQAlKqN gBs2FuQnXjr2XEPOQhb9hEh41lHHoB9/iMUdDKfXZP/hw29+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_091931_842493_36472B1F 
X-CRM114-Status: UNSURE (   8.46  )
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

this is a set of patches I based my efforts for closing a race condition
in the pwm core on. I thought I already sent them out, but it seems I
didn't. So here they come!

Best regards
Uwe

Uwe Kleine-König (11):
  pwm: bcm-iproc: Simplify using devm functions
  pwm: bcm2835: Simplify using devm functions
  pwm: brcmstb: Simplify using devm functions
  pwm: imx-tpm: Simplify using devm functions
  pwm: mtk-disp: Simplify using devm_pwmchip_add()
  pwm: spear: Simplify using devm functions
  pwm: sprd: Provide a helper to cast a chip to driver data
  pwm: sprd: Simplify using devm_pwmchip_add() and dev_err_probe()
  pwm: vt8500: Simplify using devm functions
  pwm: samsung: Consistently use the same name for driver data
  pwm: cros-ec: Simplify using devm_pwmchip_add() and dev_err_probe()

 drivers/pwm/pwm-bcm-iproc.c |  37 +++-------
 drivers/pwm/pwm-bcm2835.c   |  27 ++------
 drivers/pwm/pwm-brcmstb.c   |  42 +++---------
 drivers/pwm/pwm-cros-ec.c   |  33 +++------
 drivers/pwm/pwm-imx-tpm.c   |  29 ++------
 drivers/pwm/pwm-mtk-disp.c  |  24 ++-----
 drivers/pwm/pwm-samsung.c   | 130 ++++++++++++++++++------------------
 drivers/pwm/pwm-spear.c     |  40 +++--------
 drivers/pwm/pwm-sprd.c      |  28 +++-----
 drivers/pwm/pwm-vt8500.c    |  42 +++---------
 10 files changed, 137 insertions(+), 295 deletions(-)

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
-- 
2.40.1


