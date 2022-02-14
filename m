Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6843C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b2gO5E3ZKZtJ2FcFvPaxzimXKdHyFLi09de97YHF4LU=; b=Qfq+Ob+J7FtyNd
	zNAfszlLtmBo/PytQueOZIP510UtNgeYL1I9N3nFokMmDtRgDzpSj6cUuJWbVKUaQPS9TZgKcpPiu
	2nWKGmlX2E+IZPQRFjxQY6kCP3gqcrhBDjzjf91hmlxBDcpfeazRsmv843keqBBn88VRejMecFWI4
	iYAcSFMz6I4DwXK6GuthmICKWZFj/HHo14wZw8hgilTnE4FFcXZ8Mkbi2oWqJV4vyg/WDHLSXiyg1
	doxpc7IYZAKqH6iHC+yMPn5YJtucnAGF+rDMUfHbF0amcSYFpSAi7KVFjQwFb9sdFyisBe1w48lkV
	q0zA2qEIMYz2BOAKH/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJaMT-00F6Ig-NG; Mon, 14 Feb 2022 12:21:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJZZ7-00EpXa-UF; Mon, 14 Feb 2022 11:30:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E338D1F437F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644838244;
 bh=QaLaTj9ziNtqxf12oz66KYW1D7p03OX8Bk66flIHsxs=;
 h=From:To:Cc:Subject:Date:From;
 b=ggZon2tzhy2Vqc9LmMHVOVLHNWSS7LUED7MTJYersNyW0PsnvLKnLdtvJtCUxt5Bw
 qIpDJmh9DzTonS45VhdVbnFEXOWOuCYIImcW9l18+iuCLiPeGi5lf43gC0fLIm04dR
 3d9F5v7UI37CBTZiQnq4QmmGdHxu8t7PNOX4k2yYZHkgSWiJOID55Pnyx4wOa4RmXf
 F+Y8lg+bfeeuBe+gU0GBFK3P+RoWPoZQLIn10DOtQfU6fsaRoPI1GnhID32s488D3P
 anaw2Ro3+yCn0mJwvTWrAmm7gkZmDSdI3A4KhQqvONpnmIavSdnfb2zmYD+JwwH3tf
 Fi4Pk3cQn8faQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] pwm: pwm-mediatek: Simplify error handling with
 dev_err_probe()
Date: Mon, 14 Feb 2022 12:30:37 +0100
Message-Id: <20220214113038.79130-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_033046_148710_E676A072 
X-CRM114-Status: GOOD (  10.43  )
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
