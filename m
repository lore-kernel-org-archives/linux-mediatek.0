Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A642C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 03:47:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16EF61166
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 03:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16EF61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t7hAHk5bTx10u1vKy1xUWasiyq5BYxFNRsyyS25xq0I=; b=Tq0NsAvI4uJVzlSE4F2/7uU7AD
	FSNecgUgwC3yR9cmUuwW+qDMkdfgTgnogpjc6XbV5/PzxTmrZA5XVv9phu2B6RWTJ1+nMEet9IlDN
	+/a4VMxirRtNw/ZI6yc8du0aTn3tNanCunajquhK/57lCjfs5L/8qNG/wl6sJrL7MJMTRrTqFGiW+
	116RxNN/+/j53fh+1b/FNE1fuQ0oS5uD8uleovJBlAx4h26pbvMpe8BiHuhYIo9fxi0M2UwxHp0el
	mb9IK5f4Jkfpjj/IjL0l4WtQQra0r8MUY46pf67+CBytPMUa/EunIi8kYaPUEGojw60YIxEx8+Q9o
	GLoao4DQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXFSH-000fkD-DC; Fri, 16 Apr 2021 03:47:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXFS0-000fj0-A0; Fri, 16 Apr 2021 03:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Jvn+FcPs/a8mF8oTY+ng564VcLse+XohALlgtHB3uwo=; b=dyaNrmK/7KLErMvgA9EP29FLOC
 Nh38404b/y/+sulHjJVJjDuHbT8wIry1y49QwQQ1uOzCj3jRadn4tGjjSlP0Px0vlheNOD6MQSE/E
 okg9bC6u8m8Y+1KWM6F5jTHU7QoDTuYwrH2x5SmxzmFXELaYliLaREirlfkKncKy6zc/FAKCaW/EA
 uDvmeAWOl8Pwo6l79qhZwhexnpULptCPPAjezv0D7A69lA57U27JCoauZgFVSboNPmiB/ndPXWMLe
 VQHHMz3N021DYbfTzWjXV4kuFNxob31ycfZ4Y6AjEvbRf2jxzVX3hm4cdZCr13AJLY1QrH0DixvVS
 Tj35Ru9A==;
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXFRw-0093my-W6; Fri, 16 Apr 2021 03:47:22 +0000
Received: by mail-pj1-x1041.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso15564345pji.3; 
 Thu, 15 Apr 2021 20:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Jvn+FcPs/a8mF8oTY+ng564VcLse+XohALlgtHB3uwo=;
 b=fVtzqO2Oan3mRRwUs6ytpq9WeFjhRKIeSqlX275fOf6HbWmZHvPwxONXFNFxRyatyE
 wZSz2oOyXqRqEvqeOmNaVOFKTwnBlbuMCbXJNqHzeahF10FO2tEU2zteKY5MoRtSAceL
 MJD6S1zb4K6/B8renhWJu4/Ln1ufTBcV8Fo6u37Uea8nEf/Jp/RcYFDe4JsSx4tEADnP
 mcBIN9EMTBmyvZIRhGnJSqRB2+AX2V4QcrDusA7CTyFbXr9bHiGAT6YCS0OrFjNZ/YXQ
 kVaXmTzublVV/LfJ+6rYWRdM1TVTRw85loS9mB4WHpVfpruaKpXZ3S0M2wOXFW16nYuq
 aH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Jvn+FcPs/a8mF8oTY+ng564VcLse+XohALlgtHB3uwo=;
 b=jBTrE3UsnpExeMzcr5XSV2iBvwBjY9H1SB+YqGiOcG0YXTx4bZUKWCDP6+UolfWcZV
 BkRMdJOIYzE97ZI9TFUmCySOK/N8TTRrdvzXsuSxj1f1+qN9/DwoGHyKxEjMiNPRnQbu
 +zMbmKhisy22E9vDV3FQ52G4Frdo78xBcBrBZtNsWXVOStrd2OxOdRjKV4jY5f5zuM9+
 ZkqcOhqdIzuDD52PxgNyBFjSXDNVwtRqRErN2ot5pzh3w4ukbIt3nCXKr+8CyGUNEdK/
 QQx9gulSH/vDCNspBnwnNMgZ4MhGjitLt0+z2W7xDbkscCvLbXkJ4ysEM7cG2Rq2Wqu+
 qFaw==
X-Gm-Message-State: AOAM532oECj726QtWrSSsFrohdJzDzYELTDWImwC64JTQz15hgdQSH1m
 MjAAHP1//YiRl1JD23fefnE=
X-Google-Smtp-Source: ABdhPJyPo6utWxE0Gwapva5Ja+v1DD4LsFNIwStS89Rfk+n5ieosIu/rgOG6S9Fsd8Ze2p2t8fv2zA==
X-Received: by 2002:a17:902:e051:b029:eb:4411:db58 with SMTP id
 x17-20020a170902e051b02900eb4411db58mr7387386plx.11.1618544839034; 
 Thu, 15 Apr 2021 20:47:19 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.180])
 by smtp.gmail.com with ESMTPSA id q25sm3326239pfh.83.2021.04.15.20.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 20:47:18 -0700 (PDT)
From: zhuguangqing83@gmail.com
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Guangqing Zhu <zhuguangqing83@gmail.com>
Subject: [PATCH] regulator: mt6360: Fix missing IRQF_ONESHOT as only threaded
 handler
Date: Fri, 16 Apr 2021 11:47:12 +0800
Message-Id: <20210416034712.7891-1-zhuguangqing83@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_204721_068837_4F64B10E 
X-CRM114-Status: GOOD (  11.09  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Guangqing Zhu <zhuguangqing83@gmail.com>

Coccinelle noticed:
drivers/regulator/mt6360-regulator.c:386:8-33: ERROR: Threaded IRQ with no
primary handler requested without IRQF_ONESHOT

Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
---
 drivers/regulator/mt6360-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 4d34be94d166..34c354721ef0 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -383,8 +383,8 @@ static int mt6360_regulator_irq_register(struct platform_device *pdev,
 		if (irq < 0)
 			return irq;
 
-		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler, 0,
-						irq_desc->name, rdev);
+		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL, irq_desc->handler,
+						IRQF_ONESHOT, irq_desc->name, rdev);
 		if (ret) {
 			dev_err(&pdev->dev, "Fail to request %s irq\n", irq_desc->name);
 			return ret;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
