Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Feb 2022 01:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z3k6YN3Ue8/me4qARu0mO30zDrQUvKRi741nE7DHoEQ=; b=f2THX6tLeeAhyS
	i3kk5Jb4s/qSIT9LxqMq/Hpt5mT37z3KSAL5X94Cud9oU/02Rll/2U4EvRA11FDAIO8QxLjKm//LJ
	gAZQjCipSb38kIey1LTHdRgtiJt3KeELUzdlUDtwzjU6W1ckjTn70ZpEL5C+uxqsYhApwiQCq+z7+
	vDGVAunYfEHxOBohuIAU3nXKlfr2hD8QGf5nhrOTJUoiqLZiMZn8Aix+5BlNzP7DLK+9IoQNJqhMh
	QOOrhp8hKgV+NQ/TVnsaS+b/uUhOqV9Wrzmi35ZzBhpbKj8UlBoBGi8NAkP6sUCmyzf5XgR0QFlaK
	GvmKdpDnWObWfqlawJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGABT-005vyi-7X; Sat, 05 Feb 2022 01:48:15 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGABG-005vxZ-Gh; Sat, 05 Feb 2022 01:48:04 +0000
Received: by mail-oi1-x22a.google.com with SMTP id i5so10642274oih.1;
 Fri, 04 Feb 2022 17:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZwqiOxP9YHS7gWZlUy/Ide8I7ik75+E4L6SkE9qurM8=;
 b=SX/r8oivOKBmjoQGeU3nT0z9H54wk6+8Qa7bljk+63UOjxZcK/6NnqNHZFUHg7WVWb
 E3v+9gEV8s3ampzbdfmLyiLQGD5ZTXFho8wem7UQMnQQiTWOFEUrjkpGoOEpqCx+tKuR
 LlbVGCBtSpo3XWGtEyyQOSk9MQwUuWo58mv6m0OKtfTDN1aqDxvmcdPdBHDcBe4BGS9w
 c3oJ2afAsToUv4Qxv2CZEBfrYiHgJLHlLYOizaFgTs/Z4ImKVsRaFwZdp1vKZc1igZyo
 4RNAdg0iS5g/yVSFyRqgqdDp4C5ki0krTzMYKPBsXIhiwa5farpPM9bNzAiFVQgIEzpn
 iwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZwqiOxP9YHS7gWZlUy/Ide8I7ik75+E4L6SkE9qurM8=;
 b=m+LRy6URcEHS74PxTrxRUzqEP8FuItCerR4/4JSpbi9TY7LgOBToDaetwQam+wY991
 cPG/4IvBKdVtLFRYX2h1LCCNbJbDsb2MuKYnYzwue78PbeCYTlWQzrY7Wp7kmsSKRalB
 1hfKJVoq1K5CKzCmmwWwN2HMalU9ZBfjk95AXcDnqqi8wGC9p8rWux7ypQiNtSyKYgjo
 exbUf4ek304ogvzjuyB41pZDXR9qLU1RNxjur5ZNtyXCkd9n3g+zj16Hu1g8ChcwxUDv
 /JMWTmiPNycteTCNs29czArtXjCNv1F7FLH6KOgRq9E8VmBVHlbwTDJdOq2yapgEiLKo
 kYRg==
X-Gm-Message-State: AOAM533lCuUNUvJ0tZY/GhhKvFtV8hWiBE8ZDvvcLyeT2R0E0mPgKfw2
 FcStej7cYxAm1RiTfiGhmgg=
X-Google-Smtp-Source: ABdhPJxkpdnDdeyiK3lUeHlxYFtvl95BTBfOP8qe7nRcTa/6HHnRa20lNjWX7rVjOgbQPJ9grHzYhQ==
X-Received: by 2002:a05:6808:17a9:: with SMTP id
 bg41mr852705oib.41.1644025679729; 
 Fri, 04 Feb 2022 17:47:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v31sm1422052ott.25.2022.02.04.17.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:47:58 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] Revert "ASoC: mediatek: Check for error clk pointer"
Date: Fri,  4 Feb 2022 17:47:55 -0800
Message-Id: <20220205014755.699603-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_174802_634781_EFE7DFBF 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Kevin Hilman <khilman@baylibre.com>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This reverts commit 9de2b9286a6dd16966959b3cb34fc2ddfd39213e.

With this patch in the tree, Chromebooks running the affected hardware
no longer boot. Bisect points to this patch, and reverting it fixes
the problem.

An analysis of the code with this patch applied shows:

        ret = init_clks(pdev, clk);
        if (ret)
                return ERR_PTR(ret);
...
                for (j = 0; j < MAX_CLKS && data->clk_id[j]; j++) {
                        struct clk *c = clk[data->clk_id[j]];

                        if (IS_ERR(c)) {
                                dev_err(&pdev->dev, "%s: clk unavailable\n",
                                        data->name);
                                return ERR_CAST(c);
                        }

                        scpd->clk[j] = c;
                }

Not all clocks in the clk_names array have to be present. Only the clocks
in the data->clk_id array are actually needed. The code already checks if
the required clocks are available and bails out if not. The assumption that
all clocks have to be present is wrong, and commit 9de2b9286a6d needs to be
reverted.

Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: Mark Brown <broonie@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com
Cc: Frank Wunderlich <frank-w@public-files.de>
Cc: Daniel Golle <daniel@makrotopia.org>
Fixes: 9de2b9286a6d ("ASoC: mediatek: Check for error clk pointer")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/soc/mediatek/mtk-scpsys.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 670cc82d17dc..ca75b14931ec 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -411,17 +411,12 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	return ret;
 }
 
-static int init_clks(struct platform_device *pdev, struct clk **clk)
+static void init_clks(struct platform_device *pdev, struct clk **clk)
 {
 	int i;
 
-	for (i = CLK_NONE + 1; i < CLK_MAX; i++) {
+	for (i = CLK_NONE + 1; i < CLK_MAX; i++)
 		clk[i] = devm_clk_get(&pdev->dev, clk_names[i]);
-		if (IS_ERR(clk[i]))
-			return PTR_ERR(clk[i]);
-	}
-
-	return 0;
 }
 
 static struct scp *init_scp(struct platform_device *pdev,
@@ -431,7 +426,7 @@ static struct scp *init_scp(struct platform_device *pdev,
 {
 	struct genpd_onecell_data *pd_data;
 	struct resource *res;
-	int i, j, ret;
+	int i, j;
 	struct scp *scp;
 	struct clk *clk[CLK_MAX];
 
@@ -486,9 +481,7 @@ static struct scp *init_scp(struct platform_device *pdev,
 
 	pd_data->num_domains = num;
 
-	ret = init_clks(pdev, clk);
-	if (ret)
-		return ERR_PTR(ret);
+	init_clks(pdev, clk);
 
 	for (i = 0; i < num; i++) {
 		struct scp_domain *scpd = &scp->domains[i];
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
