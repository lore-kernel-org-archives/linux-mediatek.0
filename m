Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B6C197A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8OlYc0gKuXl4YtvFkNZB2qoW9Zu15CpDv7fGLeeuj34=; b=a+YBLUd9Bfvo5896a06G0Rg6DP
	934vu6qI9kdC9LoXNvs8HrsVzDzUZBsK7nthBEcVvZbwsU1dRfcapF1InAxRolp5GQyVrkWGlMRbw
	CY1eq407T4WiyfvughHSggrLEwA3ftANFtdj++MspPS1DFHC0wFPy/NoJUsicUDIp1JcxsAC3j3RE
	x/5KNwHpor8C6LnsefNuYYcOg7AAV3P/QkkY/Ugitj54uT1pc7oxp/lYwuNLibuEOl4mcDDlTfEqz
	8IlbVQRRxnN+GnUpCk2VAv9fhw+AFit1rsWuuYG9DESWSfYGm2H78Z4Yx3NX/zFmp1VhhGZnpejF9
	QuDCdp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vCe-0065OL-0s;
	Fri, 17 Nov 2023 09:31:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vCb-0065MJ-1x
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Nov 2023 09:31:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBy-0002W0-M9; Fri, 17 Nov 2023 10:31:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBv-009e8J-Bm; Fri, 17 Nov 2023 10:31:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBv-002yjW-1I; Fri, 17 Nov 2023 10:31:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	kernel@pengutronix.de,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Loic Poulain <loic.poulain@linaro.org>,
	wcn36xx@lists.infradead.org,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jisoo Jang <jisoo.jang@yonsei.ac.kr>,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Wang Yufen <wangyufen@huawei.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wifi-next 0/6] wifi: Convert to platform remove callback returning void
Date: Fri, 17 Nov 2023 10:30:57 +0100
Message-ID: <20231117093056.873834-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=F9Oxsx0QIJmkT38mUHzi9AwJy4rp6SebAFM9G77g8Jw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVzLRhZMpN9DscQc/Acv1vmk3igI2Pvvo9Tzoe 5Cxm2rYGeWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVcy0QAKCRCPgPtYfRL+ TkkIB/9uaICn2CG/t+EHavYz+BD1rZTP1jDpIOy2VAQCFDCmPISU+qpaURWrMPloUJigTbMxhsy a8mKyOTQ1bpLexlOJwAf7P38lZYzZQnIc5jyBa3tI1YQXbMAeBzFP1SahXKBenwwYgEGyA+LryF zS7i6Npvf74UQox7GVqjcYQv1p5mQkb20j/2BHEhMZHNhrOM4VwNqMtmQkAggBrFG5lyXKpQs06 Yq13B4hO1mkEHFrzPrfZRzsYuxdlnYJrSQ0APgQuhbYPgcHKzLwEcPV0wH8CxVgJeLKMY+zq80c 5PvZhGx4TCKCmUY2Jkhdep9dzBu/zH23irbSifSzvsTBm9A+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_013153_640960_7EDFEB38 
X-CRM114-Status: UNSURE (   7.00  )
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

this series converts the platform drivers below drivers/net/wireless to
make use of .remove_new().

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.
The TL;DR; is to make it harder for driver authors to leak resources
without noticing.

Best regards
Uwe

Uwe Kleine-König (6):
  wifi: ath11k: Convert to platform remove callback returning void
  wifi: ath5k: Convert to platform remove callback returning void
  wifi: ath9k: Convert to platform remove callback returning void
  wifi: wcn36xx: Convert to platform remove callback returning void
  wifi: brcmfmac: Convert to platform remove callback returning void
  wifi: mt76: Convert to platform remove callback returning void

 drivers/net/wireless/ath/ath11k/ahb.c                     | 6 ++----
 drivers/net/wireless/ath/ath5k/ahb.c                      | 8 +++-----
 drivers/net/wireless/ath/ath9k/ahb.c                      | 6 ++----
 drivers/net/wireless/ath/wcn36xx/main.c                   | 6 ++----
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 6 ++----
 drivers/net/wireless/mediatek/mt76/mt7603/soc.c           | 7 ++-----
 drivers/net/wireless/mediatek/mt76/mt7615/soc.c           | 6 ++----
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c           | 6 ++----
 8 files changed, 17 insertions(+), 34 deletions(-)

base-commit: eff99d8edbed7918317331ebd1e365d8e955d65e
-- 
2.42.0


