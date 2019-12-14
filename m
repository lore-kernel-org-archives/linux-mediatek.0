Return-Path: <SRS0=Zwng=2E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C175C43603
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C109820724
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PMytdWLn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uwDo3TMv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C109820724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gwsxdX9ZavFkU1VFAiaBT0ELqjGQyMiBkXK7D2JE67A=; b=PMytdWLniOcEcTQoSnJW8QQrh0
	52ED5QfcMxK6ELY5NmaBL/EJ9jWskRhd/UqFck25DrebASQr4P4Mo8iz9LnbZfDusnJ3zyS7KqcGf
	V27LGvpCF5AkZiICYI5Bx2LHzCsxX49FrDr1T7+eNCQ6p7dY5IlHHDFEvdqzP4T9NyJCNBR2Kc9Ql
	EpH56ui1G/eMaF+FWXn4RMBfeV/9YRvfK29kH7NzbqqUSpZJNXv02i0OKcyzt7GEXQcgs5YrIyNjE
	TuC8LuHBFK1IqRxBuXb3ZlVU54tJkuIojbNiDRRJyzMgrz8yhuADd/ZnuILJjabQU7iRa45BfEbyk
	eXvyJ+lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBfX-0006sL-Tu; Sat, 14 Dec 2019 17:57:31 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBdG-00044D-EA; Sat, 14 Dec 2019 17:55:11 +0000
Received: by mail-pj1-x1041.google.com with SMTP id r11so1113918pjp.12;
 Sat, 14 Dec 2019 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ng8Q0G8vgCj6uZQhSm10VUxj1CLBc6zwwLxL5iSkIvg=;
 b=uwDo3TMv8S2LoOFtW4JVpy1MDe4ohxY3mDft8b066gcYOSuhrz7Vn+cChfAtY3zyqn
 IAyetRDDXThqE289VVS2YvJOiNym3+wHdqebZAOj/+de9OBlKY5zjjmSIqBB9ae1zcyE
 QsjU0e36EmG8HlZAn2z14x2grKm00ym36TewLzHqvcoWKlXNBvO36kzVqFZ+C9rdQ5vB
 8psuuCLMuKqOqlZxA2CdL8otclGnRw8GGN4mAppdWQKbQOEHr6G//zV1s+vOZGE2ysCF
 yfb7BEDTYGm17ide1ziXmZvv3fdOSWOiBnjE8djoQeQ9JuszfdfL9RNemPFm4yVxJLYK
 IpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ng8Q0G8vgCj6uZQhSm10VUxj1CLBc6zwwLxL5iSkIvg=;
 b=WTPYYcNBwIA+wodTFKRkna1xL+H181mB7lRaQlBKGXklVcqS/XFyo7MnpvKBOSZf4d
 nBE8qtDrDcE7+pW06JqFznWxdggX7j+lMs96uxFbzUYjd2rfifGzrii8CSzIAvrSFcz9
 6i45OR0eTkSnASwYZJ7wJiyRJXEE0eZb1zVEIo7vrxL69AzToy706zO3tBJb4SQL5cGu
 nCnaXHUQ1CAyNH557QOBgGNs+Dy7YA/fL8Ua47NHeLdyiyK0ITN04cmOso9bZ0rFvjm1
 ThbQAGJeFKrkTIk3UM5LfQyFNlSqzz6G9+jq7btinxKmTZLNzPM3/g+yC7yVxTi4nJ80
 0lqw==
X-Gm-Message-State: APjAAAVyb9/Y10s4qiGMdUoCYzYJuZU26rAly8YxZ5sixzhaTjlDLMN2
 IkDETx7t9g1EpMOn+xI4wPIJPn4mr5U=
X-Google-Smtp-Source: APXvYqw4NxLBs8k/N3sZ95qNmbftyGzDAHq+3kcbBnLjVVt0Sw+VMa4Kzi1WhBK/Tx84u07Lwngzfg==
X-Received: by 2002:a17:902:8501:: with SMTP id
 bj1mr6375383plb.84.1576346108088; 
 Sat, 14 Dec 2019 09:55:08 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id u2sm15056755pgc.19.2019.12.14.09.55.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:07 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 06/10] soc: mediatek: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:43 +0000
Message-Id: <20191214175447.25482-6-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095510_566533_F0FB6020 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index f669d3754627..2aa2afdc9ccf 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -425,7 +425,6 @@ static struct scp *init_scp(struct platform_device *pdev,
 			bool bus_prot_reg_update)
 {
 	struct genpd_onecell_data *pd_data;
-	struct resource *res;
 	int i, j;
 	struct scp *scp;
 	struct clk *clk[CLK_MAX];
@@ -441,8 +440,7 @@ static struct scp *init_scp(struct platform_device *pdev,
 
 	scp->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	scp->base = devm_ioremap_resource(&pdev->dev, res);
+	scp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(scp->base))
 		return ERR_CAST(scp->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
