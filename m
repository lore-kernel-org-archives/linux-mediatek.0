Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E579C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itURF0xQnb8RoP1grg8Az4WICimBb7VTHFJnEE7qJ00=; b=vBp038o1A66nqH/FCpQEef+RMU
	e5c3d00Tn3cIaqeIhFoDKPSdurPakSspQPLF2rIWwyzJ7MwfTOYD/WZYbjtgo6Q9VIWwckv51BTsk
	n82Da3lH5DB7haJaon1+NS3qiNDqY0iMAZLcewnTDNX0eWuZCkLWqvCFy3AHwc3cRWBZAhYsH1BJw
	nsWMsevslf51KwWZJtes6Sk3wj712AsXs2spqoHa00QgUkZhOdTB1uLoiKB8fuvZJs8K5VbHl6iaR
	jZHqeprHJetKGrfVwJHRU8WoCOvTKFPt51ja2m4oSzPGchAc3Wd6v+sS92oTHkhmI9M6BU/6GVVcQ
	h3px636Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0R3-00000000GVa-4C6O;
	Thu, 25 Jan 2024 14:10:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0Pi-00000000FbC-1pfJ
	for linux-mediatek@bombadil.infradead.org;
	Thu, 25 Jan 2024 14:09:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=itURF0xQnb8RoP1grg8Az4WICimBb7VTHFJnEE7qJ00=; b=kxB3lldsmS30eSG9k5IZB7/nPO
	RG7MXCPjhlbV4Jawb1ARKJRHHRhljSt6z+T4S3bDhEKIF0KRrDlowQoLptmygtbMiOTxCUTR1VHVG
	GUZLFuSUEtDazRUv2Sox5Spe0SydJ/nXfgwD3pWL2dUiT3r1Op1LxBxYm61ldx7Ojqk3iNdXIrLAI
	3QhnaDzZZjIfbKzQk1UvtC0h0HRmvPc9TijfAO1ieaxKxOQKJEd+gp8PamVKkq3Zsz4QUaFDPPeFI
	OBoEh2wXsMHbVuET81TDP1ZUoH755AvJRvRTe+8BkMMVXaDKMY7FxwKfC2bmReGle4orxmFnJEzg9
	mpdSzMhQ==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSybU-00000009sDU-2Dr3
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 12:13:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ9-0003iz-R1; Thu, 25 Jan 2024 13:10:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ9-002HPp-Df; Thu, 25 Jan 2024 13:10:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ9-007mzJ-17;
	Thu, 25 Jan 2024 13:10:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 018/111] pwm: mediatek: Make use of pwmchip_parent() macro
Date: Thu, 25 Jan 2024 13:08:40 +0100
Message-ID: <a8659059ce62805d5a499edb823ace388f374d6c.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=u3GNrzdZ0E6VhvixW9xjo+R0sSVqJ6WMNnaZDq30XSE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9OmFrBGbhFht5Thk81FH0FpaFGolMcp7/J6 C6IpjBvbTaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPTgAKCRCPgPtYfRL+ TljzCACbatZ+qvtz/DkM39dSpNt8mCZBcG3gGoIJumxpmQWDQKS9u/tVmbD5QiiDapasn50JKaC JYrHAROuEMyVO1hDSoZLQPhSGzlTJW0lhwhtVTDKEiTUZ1gy2vdCjxH/NI9d+2lyuGsWhvs/w5m joYWO05vgVrbB6Z5Hw4QDsDw9Zv3NL3u1tRoDkwGk+H/EQ7ies9ArY+92pIl/z4tTn585jXXT1o twBTa5tiE3O4lbsF7PPM8gxjwGsOQiPJmuZwCXY0NCUmTWJ0CMPNgZ4GhGSAhgbXFszVfrREqnK z9HYAyt3i6OJEim6eLUrWSsxVMVdGh/gjLYaL20S+TH2lhfA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_121309_934022_B629600A 
X-CRM114-Status: GOOD (  10.48  )
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
driver in the same commit as struct pwm_chip::dev, use the macro
provided for exactly this purpose.

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


