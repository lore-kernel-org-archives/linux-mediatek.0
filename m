Return-Path: <SRS0=5MtA=2T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8267C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C17C20722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yy2NFjyR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bssl8EsN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C17C20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kPlMWoqKzcBVy+1+OesWuZSlaGCJr5R5a7SJ89c30fs=; b=Yy2NFjyRwDTpQtb8Nknm4NBPBX
	REe9mQBTgR1O0Iz+BPhT3YlzAKzseOFudd8BJ/aT38lmHzt9xtqaMYl1kDTxV4jr0/DEQP+yHVOWU
	K3Cf2WVi75cRxLY2frm2kqogS0TAz9Dbqtzu2XpmCYdN471fpnwDqsQLDzg/15Iet7oAEsZ9eF7pd
	aCQHaKu6qM00krBuIAdhfu/kGmmzg3nwiFYz1Eaa87t9MRp+mcdw9GZ/ycTOchzcTTJMg+0WFcymW
	3df6kc3Tj0YgJSfKb4hpYrZ8ZbIBGVzvqk06S1EUy7A6fBU8Ptqc9s7FCGxN8lGXX5zvys1fZDJIJ
	T3QDHyqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTo4-0008TP-SK; Sun, 29 Dec 2019 08:20:12 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb8-0001Gh-Ad; Sun, 29 Dec 2019 08:06:52 +0000
Received: by mail-pl1-x642.google.com with SMTP id a6so12765826plm.3;
 Sun, 29 Dec 2019 00:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CJr4HqPkZ3pPTSYRcWOsbHXVxGnqGh2WnBscj80axwQ=;
 b=Bssl8EsNZrOgZVwJDooD7AhI5/dzQdq+ZTBUU2dvaMZSgYTCPJU3Yz/3DLrUeaKs+G
 +6FliSf51Fd2rj9rX9QwjoIItp4EfY7B3nNLhzaz+KmaT6TwRRPzv5xkeMHNkUhF/RAw
 To0N2ay9kdtzm3eGOklyBFbKtIHYz4pox4UduOryF4FiXnNUjORl27obUdurhX4oF6sf
 7Q6JnRHAdm9g4PdcQQR4yjSLoJOxTQuCvjPo6ofwb6ykDGj+5X+H5OXKv5j0zAehUEYd
 WaGLC2L4XSGjjLBLj9C75l10/Jk6/z+MDRhSUiQMn54Lg8Duz4tsplT4Ppk8xHjFyLFX
 tIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CJr4HqPkZ3pPTSYRcWOsbHXVxGnqGh2WnBscj80axwQ=;
 b=U0LC7F4hWFZXsQhk/dzeEWT2hzYqEFs2sqKyu5q29qfYriPMPh9TmykUPCww7nYPUp
 LeU25s+fKIWBxKP4+XIXO6iTpZzyU5ZcV5r33c2MHHBBxmII+a5+0/OUy0wRA0Qdo340
 E/lcoA6Z6chlsejLYO6fAGDSc4vAWU0Gku/fRvb3hfkhnkoI54wMDRez+fZwd5mQs2zo
 Pc6Idv80eIj5ICqjwJgJ3aZrtzNOSG3N28GLnMzRGEE2Dnhy2uhLH0uHsUsC8ZyIPwwM
 UCJtxr8uu98bGerHD+buPFN0t7Efhm93m+SgbVhffcp1k77kMDcmEMRp7wl+uHYi4x8I
 V74g==
X-Gm-Message-State: APjAAAVYpPzlq3P3OwbCshcoYz1BWJCwxeeARhAco04lBOFaq37nxqSg
 Xa7lqZ/VDW4G5yTrqUPyryE=
X-Google-Smtp-Source: APXvYqwAyE3gieezb7OcD6zcyUg+EE5n2ZTOPezezbkBULlCQmyLEcIJI5oqgk7T4KhbBdJCruCC+w==
X-Received: by 2002:a17:90a:930f:: with SMTP id
 p15mr38599124pjo.2.1577606809372; 
 Sun, 29 Dec 2019 00:06:49 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id s1sm42817742pgv.87.2019.12.29.00.06.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:48 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: claudiu.beznea@microchip.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de, shc_work@mail.ru, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, vz@mleia.com, slemieux.tyco@gmail.com,
 khilman@baylibre.com, matthias.bgg@gmail.com, heiko@sntech.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mripard@kernel.org,
 wens@csie.org, jonathanh@nvidia.com, linux@prisktech.co.nz,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 30/32] pwm: hibvt: do some cleanup
Date: Sun, 29 Dec 2019 08:06:08 +0000
Message-Id: <20191229080610.7597-30-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000650_406908_007D9C79 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.
'i' and 'ret' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/pwm/pwm-hibvt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-hibvt.c b/drivers/pwm/pwm-hibvt.c
index ad205fdad372..a1900d0a872e 100644
--- a/drivers/pwm/pwm-hibvt.c
+++ b/drivers/pwm/pwm-hibvt.c
@@ -190,9 +190,7 @@ static int hibvt_pwm_probe(struct platform_device *pdev)
 	const struct hibvt_pwm_soc *soc =
 				of_device_get_match_data(&pdev->dev);
 	struct hibvt_pwm_chip *pwm_chip;
-	struct resource *res;
-	int ret;
-	int i;
+	int ret, i;
 
 	pwm_chip = devm_kzalloc(&pdev->dev, sizeof(*pwm_chip), GFP_KERNEL);
 	if (pwm_chip == NULL)
@@ -213,8 +211,7 @@ static int hibvt_pwm_probe(struct platform_device *pdev)
 	pwm_chip->chip.of_pwm_n_cells = 3;
 	pwm_chip->soc = soc;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pwm_chip->base = devm_ioremap_resource(&pdev->dev, res);
+	pwm_chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pwm_chip->base))
 		return PTR_ERR(pwm_chip->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
