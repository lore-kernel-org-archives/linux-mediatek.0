Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3648BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXXIBxF8mLd5wnxwHKsy5nAR1zrA3KYGoYChh3A4DEU=; b=zN5TY1dSXjhSo8
	1gp4AIsd0Pna+HHifNAO5L56ZxF0lHL15/fEfzX2WzMuxtiUmDted0x08FyTTqwJPdGph4TI7lEsN
	tlnKoKyPbXCHJOTi6jljs912z2KKFWKZIo+bwKJmPFobmMHhO6OA8+3S0vS33VhEi6fnHEu8Bs9WI
	BIj10wbs282laB8oEkZBdo/rnBH27Kp47+MZrNOboXA9/XwNbIZaRtNeP0uEYKSQAmbRgBVc2Eoar
	uyXdkult3w/ykhhfRIG2fk2vn+/i07CHZH+NtnOYZJCd8Q3kg4Nv9PuTUM+58YhOm7BkRPBqCi6x1
	q/gGxTofLC6RmwJN90PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJby0-00FZAm-Dh; Mon, 14 Feb 2022 14:04:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbxE-00FYn1-70; Mon, 14 Feb 2022 14:03:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6C8D31F437D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644847427;
 bh=wFNgkqGiONoneW7J7GAtmcWU3v7pj9r5c0V0Os6wFU0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OUG+pRD5LFzg0JNUMPwO8D3H1M9GSWqUTPtDByjaPj95ISZWa4Pvs4Fd0wkQWzBcF
 dgJ9fdDzLdJWCXfJpfvfH2uipWAipJtTSKdsA1t6BXNN57RCoE1+ixwBUXhBtR89Bx
 d6hz0MguCsVR07zG1aERD8kW7FKTrABhs41a7UPhKe+3IdEkWw74KtSXTsuK3Dqsfr
 HLz0KaN1BN25jpW0Wz2QihHbm2uHudnjZ45SCZX7g3TzIcsGBI+M93VuT7/Q+HMv70
 YV2qBURT/u4kLKpL9GGXBcF5PW6mL1hGoRoxkh3OItUGA2hF9Kzvwz2L+ENRnV/dKo
 i2hKFQGJ7l7Jg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 3/3] pwm: pwm-mediatek: Beautify error messages text
Date: Mon, 14 Feb 2022 15:03:39 +0100
Message-Id: <20220214140339.112500-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
References: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_060348_412622_10669927 
X-CRM114-Status: GOOD (  11.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As a cherry-on-top cleanup, make error messages clearer to read
by changing instances of "clock: XXXX failed" to a more readable
"Failed to get XXXX clock". Also add "of" to unsupported period
error.

This is purely a cosmetic change; no "real" functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pwm/pwm-mediatek.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 6b39f3d69e41..568b13a48717 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -146,7 +146,7 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	if (clkdiv > PWM_CLK_DIV_MAX) {
 		pwm_mediatek_clk_disable(chip, pwm);
-		dev_err(chip->dev, "period %d not supported\n", period_ns);
+		dev_err(chip->dev, "period of %d ns not supported\n", period_ns);
 		return -EINVAL;
 	}
 
@@ -229,12 +229,12 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 	pc->clk_top = devm_clk_get(&pdev->dev, "top");
 	if (IS_ERR(pc->clk_top))
 		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_top),
-				     "clock: top failed\n");
+				     "Failed to get top clock\n");
 
 	pc->clk_main = devm_clk_get(&pdev->dev, "main");
 	if (IS_ERR(pc->clk_main))
 		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_main),
-				     "clock: main failed\n");
+				     "Failed to get main clock\n");
 
 	for (i = 0; i < pc->soc->num_pwms; i++) {
 		char name[8];
@@ -244,7 +244,7 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 		pc->clk_pwms[i] = devm_clk_get(&pdev->dev, name);
 		if (IS_ERR(pc->clk_pwms[i]))
 			return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_pwms[i]),
-					     "clock: %s failed\n", name);
+					     "Failed to get %s clock\n", name);
 	}
 
 	pc->chip.dev = &pdev->dev;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
