Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64967C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:34:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3076122BF5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:34:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x04khlVI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YksGN/Kl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3076122BF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sh8gkAzPd5wCd28w8o7AHRjYP+O/BTKMNjbH0hXCzqE=; b=x04khlVIXHJfpYu0edUIOKkk8P
	JT7x4lSFfMQsFfRywF+lLhhPIALxU3l7CRNAxnm8cUx9c6Zh3kj18puPyzlJzRR70iXrChdoROuqm
	x/GcernEdqmUbpcv+f2+NWNG8+AcPvi1ARvrSjEDLd6brwHVwIseTEJ3bUBmMlkdJ0WHmm3R6BW4c
	ixql2W08vm8rPENQVKmWrJbktOGERNQ1Tyh29oHgyKF8jjzXQzem50zvBw54g3f80p4WmAZSl9rq8
	hYXxmQbHZw89VVNp/Ya1AlwwIEOacdsjt4LRgfQ9xw0XxJly0VPzL2Vp7Jdns8Wxm7vpmAU/cN73Q
	C5GEhRyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBI2v-0003xU-WD; Thu, 27 Aug 2020 13:34:30 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBI2s-0003wR-13; Thu, 27 Aug 2020 13:34:26 +0000
Received: by mail-pg1-x542.google.com with SMTP id d19so3377609pgl.10;
 Thu, 27 Aug 2020 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7FCj4eo3j3GbtsvklB0HEapcPiKhwE+p6XCZdQG51e0=;
 b=YksGN/Klz2U+5jSTHMCPwt8j9/PccIZtdyUnCZPwiqSlVHBB11ioUNakcTTduFyQ1y
 3J3ryZ6OL/8b/1G4InuP8fts5scbP9Rz+uVvn07RU/CiWdWpz/hUraeORbm/9Pqsit8t
 MqV63uHdwpuilQpBtjmGOE+Qz2Pq8NkRtGzzH2UplzOkGcjaXfWVewgS+sI7FRIFDjhE
 fXqT6333zDssmhtV7ZdJds10qlWWv+UgN/kZHjtMjf2q1Y1NHOCBJWmTv5bJole94Dl3
 flpUIjSVbZ69engbbNzyXrrtDASe0RHxwX0TR+3CVbeIcekxBno+13S3JuNZYPHAnqNf
 9OGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7FCj4eo3j3GbtsvklB0HEapcPiKhwE+p6XCZdQG51e0=;
 b=c5Ubnz9ZJIQ/u4J8Klm+oMuHiUHeFtBm1QQZ0dRnAHK1noECGWzisMAG8XqpslXjBJ
 IZAaUJfSSB7sUzidnnCHXSegtPOG2TDWahbsEJSAfzxt5gB/IlyZqdn+2XFMY1Iv+e61
 Nicms0eCsOreB6Eo8bwhM3QlrWqN9KMlaiJvz5zOfEoghymuwiGBou9o1MdEpWl5yvxU
 VeE3SR7pouZwzw1JgyLI1vzwt1mGk0cOkLNeGhQNZz/EwUIutJQuAS2KyPQJEr8AvxWI
 5k9vvJ3ilId69nQpQZ0BUZDMRA54NV6X15t36O2dIJtkvDl8R0eNoFVbF4Pmccoa4xBr
 UJmA==
X-Gm-Message-State: AOAM532rfrp1B+okeyUj8Y7Az4bY9gGN4SXp/2X8sxZnub6Bkp1W6QkC
 k6i+zezahr9og9Y/+asQ+XA=
X-Google-Smtp-Source: ABdhPJy++A+Fs7bmmkIIIXiQU73QEHegDmjLB1wLcIEz7+TuVA5U8OYW5f3vRllozVKeE/uPCntAXg==
X-Received: by 2002:a17:902:bb93:: with SMTP id
 m19mr15808911pls.77.1598535262252; 
 Thu, 27 Aug 2020 06:34:22 -0700 (PDT)
Received: from localhost ([2405:201:4007:804a:5550:a563:c2bb:823e])
 by smtp.gmail.com with ESMTPSA id 65sm2815345pfc.218.2020.08.27.06.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 06:34:21 -0700 (PDT)
From: Piyush Goyal <piyushgoyaliit@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH][next] regulator: mt6360: fix spelling mistake: "regulaotr" ->
 "regulator"
Date: Thu, 27 Aug 2020 19:04:19 +0530
Message-Id: <20200827133419.36151-1-piyushgoyaliit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_093426_126004_DA11AABC 
X-CRM114-Status: GOOD (  12.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are some spelling mistakes in two dev_err messages. Fix these.

Signed-off-by: Piyush Goyal <piyushgoyaliit@gmail.com>
---
 drivers/regulator/mt6360-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 89ce379520ed..15308ee29c13 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -424,14 +424,14 @@ static int mt6360_regulator_probe(struct platform_device *pdev)
 
 		rdev = devm_regulator_register(&pdev->dev, &rdesc->desc, &config);
 		if (IS_ERR(rdev)) {
-			dev_err(&pdev->dev, "Failed to register  %d regulaotr\n", i);
+			dev_err(&pdev->dev, "Failed to register  %d regulator\n", i);
 			return PTR_ERR(rdev);
 		}
 
 		ret = mt6360_regulator_irq_register(pdev, rdev, rdesc->irq_tables,
 						    rdesc->irq_table_size);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to register  %d regulaotr irqs\n", i);
+			dev_err(&pdev->dev, "Failed to register  %d regulator irqs\n", i);
 			return ret;
 		}
 	}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
