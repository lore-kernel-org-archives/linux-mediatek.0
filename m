Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5AEC48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcKeOMFeRyLt0DNwQC4iOgRvHayp0Kf3VhyAm9cl0A8=; b=acDwPPwOkRSCUaPZBCsG3ZOWdY
	AOZUo0JXveIIoU86pDUhHUFuCMFvmWxE0keqIW43M/AGiE0ov2mbBtU1ZJ/ap9TBV7/5BcRm2nSZb
	6RrlDEi4DY8kfoRbnwfIwQhwLw+LqKVYtT299WmhYZfMW/VGTN3QE4zHUxLBnP23YFQgYjdLtszVR
	hMsPBPdIMB2FqyQ83gHDT1l1Dekm3m5jRAK9327ZK4d4iEbzianQDb6zCDdoWcJsqVkSMxmwZM3c0
	HjfAqMmWqk5GlUZqPYK91ytP76avI9pHCOeRLnkaSLDs5W0JQBgnGGrR5NPFauvYm1UNvZS//HQqY
	h1M+w3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBhU-0000000CMd3-3r8L;
	Wed, 14 Feb 2024 09:37:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBf8-0000000CKRR-0vaB
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 09:34:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBex-00052s-I7; Wed, 14 Feb 2024 10:34:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBeu-000fCx-Er; Wed, 14 Feb 2024 10:34:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBeu-004Y4N-1C;
	Wed, 14 Feb 2024 10:34:28 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 068/164] pwm: mediatek: Make use of pwmchip_parent() accessor
Date: Wed, 14 Feb 2024 10:31:55 +0100
Message-ID: <819996ee175bec0ab71acc385c78e7233617e136.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=n8WkmK8zXwx0gmZde1hbERzcObCWJ/WjRRDw6pi2QYM=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtQzHTNqnCdu5w6NzOSoYjL7v00q3Pd7/NxNi/zrWKxDV laFysV2MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRV0Hs/xPiQ72OXtl0mivD +1RIt0HttdWHC8XEjvzSPPJw0UTHk87cnSk3YmPW7642fL44ps725xw/gZZNHVk/HqpNqRWPNGG ssXW+19+7jK9m8WqtqGuHtkiv4pm0LJGlIrrN76HpQX29SW4iX9Qdoh//V6vcle7zw8/hepHq09 TnghF7f/wMNXs/50b+KpW37Q9zY3W3d0w1czSW4fS/uEctdVvoLuFItU8TL/M112yWzvTY75Zl6 fv11Tkl86U1fn/icx9VFSzcKanbLNi8Rcq9c4bv1BP8Px2k/QIvNxg/m3ur3/+IIWvpD/GSjIcu xn9XNRfkb3qpWLC3+yGXxQyFC+lui28ER/m/u/P+rN4jAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_013442_431924_60F291D2 
X-CRM114-Status: GOOD (  12.45  )
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

struct pwm_chip::dev is about to change. To not have to touch this
driver in the same commit as struct pwm_chip::dev, use the accessor
function provided for exactly this purpose.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 562102a47ac0..6cf7543a3826 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -149,7 +149,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	if (clkdiv > PWM_CLK_DIV_MAX) {
 		pwm_mediatek_clk_disable(chip, pwm);
-		dev_err(chip->dev, "period of %d ns not supported\n", period_ns);
+		dev_err(pwmchip_parent(chip), "period of %d ns not supported\n", period_ns);
 		return -EINVAL;
 	}
 
-- 
2.43.0


