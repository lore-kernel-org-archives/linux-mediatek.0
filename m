Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66413C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pRR3uz2R3Krz8iGM7Wox/vHEPu/gaAbrAoyw4iYryZM=; b=NXYbIz92+WsDf7
	6L88aGSC/Cmk1+O/WsccZ9bZSOyBog/+s/ou1th3DeM/TG1dlqybwkZATmsCTBkYIyyPfSzbp+JD2
	taFQUQD0xEOheSQwHrLcHvnujvJGvZtIOCCwcv3CY3rt5W5Xf31LhqRmI39UCSc8YMRLFx4xeby2h
	Si2cevRIF2WxnHy6rn7A77O/OfitAD8G9eOxjOG3fsFVo2CFUV/HSls35nAGTdQ/ZDlAMd2EhsliC
	ratJyQcLyEKPkcPkW4hEZzqbIJd9Y3RcAVc2jOwA4TeSwPnggEDRc+Eo5LzeCi6CKHlosr0lGjAoR
	6enbkmkxJmyAZ+QeaY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6qr-00B4e6-6y; Mon, 07 Feb 2022 16:26:53 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH6a0-00AzMW-B4; Mon, 07 Feb 2022 16:09:30 +0000
Received: by mail-oi1-x22a.google.com with SMTP id q8so17496570oiw.7;
 Mon, 07 Feb 2022 08:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mAu8pWBtSchKstM5A3tZ7ZHtLl/tvNz8Fm6ONHkwe4s=;
 b=RepKa8SkJ2TUQ+K6b0KJbqwAyCDaePxYPDwzGUi5nkwciUGr7ZHZwqZSinG1w3s0kL
 sLiR9veBA3jd0qenLNT+DSxpEaG+a3C9xFLEiyEiVZFN6iw9sX9cQcB+Ci8/2ZvfLe/K
 ZpsYBGA9k1vB/B0xqULtFLKF05ylVJt9j6+PdearCLo4dpboS53DnpP4NAfjOHyaeAdg
 CsAuUYoWSbqSLQSewLJlxguOw26cO50JBNKZa4+jzPKxPtC8/W5/hDhTWwufqFEq4LjR
 IS76TyW8Dkw+glmy8zymXFRYwbAlkmo6nlpgDGYH9tCbJm3Mpi7EYoQ9kCXDWBTaiXgf
 I6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=mAu8pWBtSchKstM5A3tZ7ZHtLl/tvNz8Fm6ONHkwe4s=;
 b=U5EdqQE5DiQU/NdBNmwHpOKqGgjapFGlocD+W+cS1WCefWnHstwZ9qUYtBaG4+dgan
 bQp6Lw8StfJNOAW/z3UUfDvwJUY3tq7UsDklcDriD4Nug5jRbYbozUL0eQXz8hkOFhB+
 Q43I8Wk9MY9h61bqjh72Dd6A4Sgu6EqIVEyCnW9OuBaPsonNv+KPg+qn76NJ3+RyEzCp
 x/uBJYRlg33dsvWwbxNKTKULLyik3d6rX8eiV/i9QXnpRE3gxdGv+vxPR+IDV2thurUG
 IFXHaPhMdHPsrcdYVnyBoBfW6m9XrqUIH3UQ8PacpvsbFWGnn/PTo+T+8bmTsKi0sOlq
 Fl4w==
X-Gm-Message-State: AOAM533UsGPtQ1zrQMn6gAv7npnBHLOh26rcadoYUcvxkmXjgTCch8zZ
 hqbOvP+kZSLSlF/9ALZJRNw=
X-Google-Smtp-Source: ABdhPJw70VbtPo9y5hLiH62QDpTkOmxvHJ7SHRLlMlw8o8xatBkWtLmjbLHOaoeqGjSilgv5GKiwlw==
X-Received: by 2002:a05:6808:1647:: with SMTP id
 az7mr7522062oib.335.1644250167222; 
 Mon, 07 Feb 2022 08:09:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 31sm4089019otr.13.2022.02.07.08.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 08:09:26 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] ASoC: Revert "ASoC: mediatek: Check for error clk pointer"
Date: Mon,  7 Feb 2022 08:09:23 -0800
Message-Id: <20220207160923.3911501-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_080928_442472_829572E5 
X-CRM114-Status: GOOD (  15.33  )
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

This reverts commit 9de2b9286a6d ("ASoC: mediatek: Check for error clk
pointer").

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
all clocks have to be present is wrong, and commit 9de2b9286a6d ("ASoC:
mediatek: Check for error clk pointer") needs to be reverted.

Cc: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: Mark Brown <broonie@kernel.org>
Cc: James Liao <jamesjj.liao@mediatek.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Reported-by: Frank Wunderlich <frank-w@public-files.de>
Reported-by: Daniel Golle <daniel@makrotopia.org>
Fixes: 9de2b9286a6d ("ASoC: mediatek: Check for error clk pointer")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Updated subject and description, trying to match expected subsystem
    style.
    Replaced two Cc: tags with Reported-by: to give proper credit.

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
