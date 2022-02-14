Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 14:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b2gO5E3ZKZtJ2FcFvPaxzimXKdHyFLi09de97YHF4LU=; b=wwUOMZZVJuK335
	SpAZRje9e+k+M2/frDOeDm/2DJMhmXAOy5WQH0KW59gb698mw/lraMf4laX/HOKREbWvImxBuzNEv
	wyAPBCq0yMhcM8OZocIocRKUJ4hLFnIw394gAn1H935/d1Xijxy+R/ebYBi8BJ8uhraAFi5nzWZiq
	GJduXVFTfXy3MqEoDbcl/p1EvYlxYwZ9j6Wb9sWxxodjriIRj63KPTOr30939/8DiQYPyFe5KC4Jq
	Gye4cAZq5RZyVE7lKr7b024I2w/sJNnbv6sbuZIzhA8avTA4ZyboIOqatyj36DFjagg+TQ4RHuGpg
	hhBkogNVGwdD5sKcFt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbxi-00FZ1I-6W; Mon, 14 Feb 2022 14:04:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbxD-00FYmr-Tl; Mon, 14 Feb 2022 14:03:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E600A1F417FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644847425;
 bh=QaLaTj9ziNtqxf12oz66KYW1D7p03OX8Bk66flIHsxs=;
 h=From:To:Cc:Subject:Date:From;
 b=IiLx73dq4wyKSkdrAxRCsYed1Zpv5mkzLr5ixnDofJ6LIi5Gp/scc2V/6seFoGTbD
 0JeOtZrdJQnmrVFPgJaEcbng/zlJ3X5WkP4zV+bWCJX8DjiRAwkSuquklkDtMCTIXT
 YiBAgFXOzEJ9nW7jRJF0GW28e4FnFDZLrvwYIBiXXp1C6Syw44mn7xtIi9ncE+jAyU
 q2tpv2InOkV3ykX4R398AWYmVyCUmlULeD2I5nqjKcbD1KFnHO6nUAgFXmq5c8/Lp8
 gIyZxUdgDX+LUqn5cYos3bA0FnuNIFMRNfVpILa+Q4dR7r/RvAV5F6MXGF3mu3oMPb
 eRrgGYgpyqz+A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/3] pwm: pwm-mediatek: Simplify error handling with
 dev_err_probe()
Date: Mon, 14 Feb 2022 15:03:37 +0100
Message-Id: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_060348_108943_F6023E51 
X-CRM114-Status: GOOD (  10.64  )
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

Use dev_err_probe() to simplify handling errors in pwm_mediatek_probe().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pwm/pwm-mediatek.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 0d4dd80e9f07..c7d5ca09a684 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -227,18 +227,14 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pc->clk_top = devm_clk_get(&pdev->dev, "top");
-	if (IS_ERR(pc->clk_top)) {
-		dev_err(&pdev->dev, "clock: top fail: %ld\n",
-			PTR_ERR(pc->clk_top));
-		return PTR_ERR(pc->clk_top);
-	}
+	if (IS_ERR(pc->clk_top))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_top),
+				     "clock: top failed\n");
 
 	pc->clk_main = devm_clk_get(&pdev->dev, "main");
-	if (IS_ERR(pc->clk_main)) {
-		dev_err(&pdev->dev, "clock: main fail: %ld\n",
-			PTR_ERR(pc->clk_main));
-		return PTR_ERR(pc->clk_main);
-	}
+	if (IS_ERR(pc->clk_main))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_main),
+				     "clock: main failed\n");
 
 	for (i = 0; i < pc->soc->num_pwms; i++) {
 		char name[8];
@@ -246,11 +242,9 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 		snprintf(name, sizeof(name), "pwm%d", i + 1);
 
 		pc->clk_pwms[i] = devm_clk_get(&pdev->dev, name);
-		if (IS_ERR(pc->clk_pwms[i])) {
-			dev_err(&pdev->dev, "clock: %s fail: %ld\n",
-				name, PTR_ERR(pc->clk_pwms[i]));
-			return PTR_ERR(pc->clk_pwms[i]);
-		}
+		if (IS_ERR(pc->clk_pwms[i]))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pc->clk_pwms[i]),
+					     "clock: %s failed\n", name);
 	}
 
 	pc->chip.dev = &pdev->dev;
@@ -258,10 +252,8 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 	pc->chip.npwm = pc->soc->num_pwms;
 
 	ret = devm_pwmchip_add(&pdev->dev, &pc->chip);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "pwmchip_add() failed\n");
 
 	return 0;
 }
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
