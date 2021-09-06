Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622BEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 09:31:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2241860F3A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 09:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2241860F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juf3ANqmUFxeCaFpxHXgC7enoQB5m+tEIKfe8z9hJWU=; b=pohLRGct+Ocm/e
	lZB57cz/M0D5xdJziLy6AJfjRZEnXDMnnBKlX+rH84j3LnURN+M8aShpKJo9dZumbhVga8FdtwBDP
	srxBUMMA8WELJmpXx5sHAeTGI7LQjD8Neg5IdUtDE0nOq8Z+34/eRad5B2RBHp56Z0KmMBJuoJnd5
	PlXaPEahd6/lOYRQ423OKC1HY4/jqpOJoNhaIDgOfnXnMAwRtIQU6zm7plGc1Bod/5zF1KoK60AxI
	1z1JFEytcmqsZFfG7L3pL5C6WdM6wxKm4+WJA5RxixLEvqcmkchWuLvJ1br/Tmm4+XgxyNZdjzoK9
	XQqoUyKMOnlJ4ZdwHYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNAxn-000Nh4-US; Mon, 06 Sep 2021 09:30:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNAxa-000NeY-Mn; Mon, 06 Sep 2021 09:30:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id j1so3921542pjv.3;
 Mon, 06 Sep 2021 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LjYsgygAO0K1MY/VaooktkjgOc7TVHV/8M0HRrCiZ9o=;
 b=qGINo34jZzIe3ddUptsVSMZTPVfMpDQa1T8GU5Glzxf42LqmDQSCiE1Ye4gnSDc94t
 ogCHzB4Zscgg4yFKCw3lPWc8Y1DYPUqxHdrFr305xiZ12lRT6zfluwzMh2EmJxWU4ES8
 pcIbs5/INz69t6bya7yW0utgUuJb4+iPi0Dv0BuzleYHE0+FggejvABCB0rKRPDsrBPC
 cRtq/zpXdXoKoRZIgIs2pmPJ0/ah6+nziSy8aVuM/Het6txCcqG7ieD80KTBZQ33D/kD
 hgOkLK7+zsHEqsB6wsWYj2ZQIBhsiP98Pn/OTvOLWugtd7qsMj91vQnyg48yy/SKkYVh
 9jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LjYsgygAO0K1MY/VaooktkjgOc7TVHV/8M0HRrCiZ9o=;
 b=sWV3U5uOXf1YTcxSGkwSFjIVaekGk3zHPrpbUCw9HNPdo95nPEobbOYKu+ZBCHd7kB
 /fA1y7NcwYh7UHNPgtjzyeZCzY+NLyOfXFvKTPI9VMNeeLbAT8mHMbXseTxNIzEZYbrD
 IHBKVF2J87k94jyz5209GjvumbTNuc1pN9u2hfnrGgfYPuO88ab0zqfNAiT1TcZLt4dH
 WOXfYKOpO6rg6C2fYumFP1FDExEAkaUgU/5PdUL/v9nGtOX3cK2ab2omPURXo1k/Ek5Q
 6yYvRubyf7tzZGi9UHvsvFg2818aNzmBTqkUnFy3lFOuhzrbDH43ghQflb9Z22N1Ko/z
 nXEw==
X-Gm-Message-State: AOAM531lWSjhEr7BZWh1uDjFyjBszG4EwIqOiOGmXeKvtk8yrD+efMwQ
 me04fkh0BvgVI9Nj1YoF19M=
X-Google-Smtp-Source: ABdhPJzSSp2bZxsFmV+MsX0O5bZuK0Ac9nFgFzjLb0XwxaxzfvF8a8BFu+DEkTbeABmkkcQoOW6euw==
X-Received: by 2002:a17:90b:a48:: with SMTP id
 gw8mr13148112pjb.145.1630920637596; 
 Mon, 06 Sep 2021 02:30:37 -0700 (PDT)
Received: from localhost.localdomain ([111.207.172.18])
 by smtp.gmail.com with ESMTPSA id p30sm6989361pfh.116.2021.09.06.02.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 02:30:37 -0700 (PDT)
From: zhaoxiao <long870912@gmail.com>
To: thierry.reding@gmail.com,
	lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: u.kleine-koenig@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, zhaoxiao <long870912@gmail.com>
Subject: [PATCH] pwm: mediatek: Simplify using devm_pwmchip_add()
Date: Mon,  6 Sep 2021 17:30:30 +0800
Message-Id: <20210906093030.459-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_023038_786507_264CE2FE 
X-CRM114-Status: GOOD (  12.71  )
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

With devm_pwmchip_add() we can drop pwmchip_remove() from the device
remove callback. The latter can then go away, too and as this is the
only user of platform_get_drvdata(), the respective call to
platform_set_drvdata() can go, too.

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/pwm/pwm-mediatek.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index b4a31060bcd7..0d4dd80e9f07 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -253,13 +253,11 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 		}
 	}
 
-	platform_set_drvdata(pdev, pc);
-
 	pc->chip.dev = &pdev->dev;
 	pc->chip.ops = &pwm_mediatek_ops;
 	pc->chip.npwm = pc->soc->num_pwms;
 
-	ret = pwmchip_add(&pc->chip);
+	ret = devm_pwmchip_add(&pdev->dev, &pc->chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
 		return ret;
@@ -268,13 +266,6 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int pwm_mediatek_remove(struct platform_device *pdev)
-{
-	struct pwm_mediatek_chip *pc = platform_get_drvdata(pdev);
-
-	return pwmchip_remove(&pc->chip);
-}
-
 static const struct pwm_mediatek_of_data mt2712_pwm_data = {
 	.num_pwms = 8,
 	.pwm45_fixup = false,
@@ -335,7 +326,6 @@ static struct platform_driver pwm_mediatek_driver = {
 		.of_match_table = pwm_mediatek_of_match,
 	},
 	.probe = pwm_mediatek_probe,
-	.remove = pwm_mediatek_remove,
 };
 module_platform_driver(pwm_mediatek_driver);
 
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
