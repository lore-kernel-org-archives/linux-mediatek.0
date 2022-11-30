Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575F6C4321E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=POXigpl8APO9IUP53K10fp0GXszPMpqd75en0jJlNCI=; b=po+8wnQcJfG5qHuuxObLWms7x3
	sBSl8zh+UM+tMQFE5AsRedvb0Jw4D3RrOERc2F40yMgJFaK26eY+QVYC0nDm29GFrhKHObFBC8MwJ
	hio0FJcOY1aFSSUcPa8C0F5E77wgUGDTurhs7P4pfLVqy+CbdCcFlPTJuErFDXA3n//hBYYNtEzMh
	2wO4mnI9SNoyzO9RYSXAGlLy8G9mdJ7oxBjBev5qW6ZeVpzGbMw7XgFX4R61M7U7ZIcaxVanVI/g7
	ryWecQlHM1UlT6kW/Ey72qSEXbvwRFoKGIcuNFLl26W943z3BAZmdkUGNNBCzgGq7gfxCiVBshrGA
	V0FJUCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IcO-00EcWa-Il; Wed, 30 Nov 2022 08:39:00 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0IbN-00Ec1O-0e; Wed, 30 Nov 2022 08:37:58 +0000
Received: by mail-pj1-x102e.google.com with SMTP id k5so15060951pjo.5;
        Wed, 30 Nov 2022 00:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POXigpl8APO9IUP53K10fp0GXszPMpqd75en0jJlNCI=;
        b=BKEb7vdqAI7Q9DB9QLXxAXPXGy0HSu3VCUUJO+kBh9DXhs9RShE0maxetIm2uaEfvF
         v/Eb5rGCEJus3URWVvtttM9RWHID8ZNd5d6DLcA+HZfUbgHKq4bDV1DVn2bJGXfqfE1H
         9ZkBU8e4wJjq+/WUYHdVZhuc05qAzdeypWGQ6+qUuxIeQh6nXVJDbVk2LpAMF3hSh4LN
         2ymjUXn0qPaLupxSJRLn2bp4jOrvuqzZ6uqnvZpZR4VLrmXCNSmmt6BeYSA31cc7J2PH
         ZQ4MwCEtAKowKrtwFq/jvfEH7nbHci7F92OxCTXaxnDmepS6pBBet6hnj5wvkHFVOyhi
         YTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POXigpl8APO9IUP53K10fp0GXszPMpqd75en0jJlNCI=;
        b=gUzZibTZ9NvUYb4H7HJudRxW6fVAqFVnUe3JW4SdGQqD8eleQYkl8lzJ2uS9K1nrFs
         SoECpoquBpB5+0R5684CZsOmtXTtLCSHeWAFVwwe1cGkfZHXPnvYtzw9DAURE6COi6md
         +yprADlY/8ggf89uttmog3am3/hMUOfl/6FK6Pg3yuvQ1RD4jFACG7+rVeV4Z5S8M7Xn
         WOX5KXV3Jsdb9VUQxfkBz9necg1xb681NkFvupbnZUhWuquRiryA9yqpFDUWgXEjlI2N
         N34v/5USJzYQDAMbewg1bBI/xd2DpovPmXkFFgRGmGIusA6sqM7WNdtsw63XaqfK4s4U
         nQhg==
X-Gm-Message-State: ANoB5pkgZA4ewkKYpiaaIsIzh6u8QoVsR2jGKTmdGkLkF1dcmhhoqoH3
	hyNaTuzRE1KRCkFTZMD4QTs=
X-Google-Smtp-Source: AA0mqf5WJiR8VoV02b5F/zM3g0jGxJVYY6WftuvLBETu2TT9GBNn3c+sOCMDgGX9NPeUP+QiFVQZbA==
X-Received: by 2002:a17:90a:4605:b0:218:7dd7:ad4c with SMTP id w5-20020a17090a460500b002187dd7ad4cmr61548048pjg.224.1669797473202;
        Wed, 30 Nov 2022 00:37:53 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:486:4b30:18c:3eab:7c3:c142])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00008a00b0057255b82bd1sm817583pfj.217.2022.11.30.00.37.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Nov 2022 00:37:52 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	lee@kernel.org,
	matthias.bgg@gmail.com,
	yangyingliang@huawei.com,
	chiaen_wu@richtek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH 2/2] regulator: mt6370: Switch to use dev_err_probe() helper
Date: Wed, 30 Nov 2022 16:37:43 +0800
Message-Id: <1669797463-24887-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1669797463-24887-1-git-send-email-u0084500@gmail.com>
References: <1669797463-24887-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_003757_108180_80F597C6 
X-CRM114-Status: GOOD (  14.19  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Use dev_err_probe helper to simplify the probe function.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/regulator/mt6370-regulator.c | 39 +++++++++++++-----------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
index c2b589a..e090fbe 100644
--- a/drivers/regulator/mt6370-regulator.c
+++ b/drivers/regulator/mt6370-regulator.c
@@ -303,11 +303,9 @@ static int mt6370_regulator_irq_register(struct mt6370_priv *priv)
 		ret = devm_request_threaded_irq(priv->dev, irq, NULL,
 						mt6370_irqs[i].handler, 0,
 						mt6370_irqs[i].name, rdev);
-		if (ret) {
-			dev_err(priv->dev,
-				"Failed to register (%d) interrupt\n", i);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(priv->dev, ret,
+					     "Failed to register (%d) interrupt\n", i);
 	}
 
 	return 0;
@@ -329,20 +327,16 @@ static int mt6370_regualtor_register(struct mt6370_priv *priv)
 	int i, ret;
 
 	regulator_np = of_get_child_by_name(parent->of_node, "regulators");
-	if (!regulator_np) {
-		dev_err(dev, "Could not find parent 'regulators' node\n");
-		return -ENODEV;
-	}
+	if (!regulator_np)
+		return dev_err_probe(dev, -ENODEV, "Could not find parent 'regulators' node\n");
 
 	ret = of_regulator_match(dev, regulator_np, mt6370_regulator_match,
 				 ARRAY_SIZE(mt6370_regulator_match));
 
 	of_node_put(regulator_np);
 
-	if (ret < 0) {
-		dev_err(dev, "Error parsing regulator init data: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Error parsing regulator init data\n");
 
 	for (i = 0; i < MT6370_MAX_IDX; i++) {
 		const struct regulator_desc *desc = mt6370_regulator_descs + i;
@@ -355,17 +349,14 @@ static int mt6370_regualtor_register(struct mt6370_priv *priv)
 
 		if (cfg.of_node && desc->of_parse_cb) {
 			ret = desc->of_parse_cb(cfg.of_node, desc, &cfg);
-			if (ret) {
-				dev_err(dev, "Failed in of_parse_cb\n");
-				return ret;
-			}
+			if (ret)
+				return dev_err_probe(dev, ret, "Failed in of_parse_cb\n");
 		}
 
 		rdev = devm_regulator_register(dev, desc, &cfg);
-		if (IS_ERR(rdev)) {
-			dev_err(dev, "Failed to register (%d) regulator\n", i);
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(dev, PTR_ERR(rdev),
+					     "Failed to register (%d) regulator\n", i);
 
 		priv->rdev[i] = rdev;
 	}
@@ -385,10 +376,8 @@ static int mt6370_regulator_probe(struct platform_device *pdev)
 	priv->dev = &pdev->dev;
 
 	priv->regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (!priv->regmap) {
-		dev_err(&pdev->dev, "Failed to init regmap\n");
-		return -ENODEV;
-	}
+	if (!priv->regmap)
+		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to init regmap\n");
 
 	ret = mt6370_regualtor_register(priv);
 	if (ret)
-- 
2.7.4


