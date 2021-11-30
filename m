Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDF3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 18:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pf7KOOoTgNBZ/00MCpDOYtLJenldUrw3X94gp4aTq7U=; b=rs5A2GNjSBLAht
	bx245OWfY/GSufNJaliJ0yuSeo9gWcDBcZLo7PUmXbPKIsFRsSOpBqeHNm/tnnAOVI+vUWkzM0VY/
	U3l4xTuG9y/XZkXp/tT5AiIWzH3OfAJdMXhvk6+xKIrT3cc7uI6D2RnyWGKd0Pli9482vGqx5eR1r
	NAp37JqEKGAN2tkaXjbpT9QNvvGDx6FCK/RkDhMuI8OffxmZIDNiBIUup2yuf8ZFVdyAUyTxLxvnl
	vC388Yib1c8BwBoOICFUSVYNPDGkxqAoQzODCP35eHSyXIGlElomUrtbAOroFTaSkqvaZKVZRrlDI
	kzdcxD5aTSeAyLxOBLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7dE-006S7i-CK; Tue, 30 Nov 2021 18:13:32 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7dC-006S6b-IB
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 18:13:31 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3VhV0fR8z9vwpy
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 18:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWMTmpq5ztby for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 12:13:30 -0600 (CST)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3VhT5h4cz9vwq4
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 12:13:29 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3VhT5h4cz9vwq4
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3VhT5h4cz9vwq4
Received: by mail-pf1-f198.google.com with SMTP id
 184-20020a6217c1000000b0049f9aad0040so13259245pfx.21
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 10:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=220zujd2LnwZ+qWoN2OFoXSWEsex+z6W8IrJCkY4jhY=;
 b=ZGyfpYm35uM7GtoYgg0W5R/GsfxmodWoxbIFpG0XbdXLx7umNFD/3t6jA5ADPmZStW
 yoCZlWAH7xuftrqPs/n50g/MwgWebKFWTI8XIov+C8yH9mhSQW2TZsO+VJTx0W0P409g
 1tVXAIFz6VfAofRhpiu0hNUcumbQUCl1Bl/81JJKBKjDO4b7DbPlBRpffuCWQK45WeWp
 BA3AReN9ibCT2CxihTONnorU3IU7nvezwp+2wrRgVAOtoLtZIV2uXPmXHrXhKC42HnGv
 NEbKk6uUH0ysWIaKoIDCkN9GkPAH1qwyuHJfkmVrFlaB+8MQpYbzJXCtye4fP4zzUaU3
 /w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=220zujd2LnwZ+qWoN2OFoXSWEsex+z6W8IrJCkY4jhY=;
 b=ds9S8ZIkkevhONTrmv3YXTTEaeupwT29tNkcabxFOUM0DTA4wHP4dkFge1Xvs8vBb7
 KXsfIXTcOhj4LYM7eByW9mv0CzGjn5OrdWoNvmmDSbqdQIRKNAq6twMO8hfWxZNPUJ2M
 Pw1DTHIxLK8X2s0FHFq923DOX54SQNswG2LgWnabxGKrzF/6nGOVyCELICjHM6m45ciO
 LLcdA38ITEOWzL+95Mq+7j5kqqSNbHzHvlavC1QfF9/MyD4TlC4BlSPspitnXzw76we4
 6HeXtl+QvLFOxXLBvUQmiJTXaNver5wPnIL8RNFoFBI7JeV5BXA7CXSZZZ9xHgApPnvo
 Onvw==
X-Gm-Message-State: AOAM532d1Vp4lOjORC4+gg+79WGaNA6AyF0gc/W7AI6Tz2ja67MQyNHr
 a1WmQxUOANCnyCDroP28FtKglROLn2Gubb7YDBISBBEXLCbrHXctcRB29ioF3xOaVO9veStrKbQ
 ojkwGT2Lh00aDfCcuYhOu6cQLLme+BYJ+U7gz
X-Received: by 2002:a17:902:b712:b0:143:72b7:4096 with SMTP id
 d18-20020a170902b71200b0014372b74096mr877723pls.25.1638296008900; 
 Tue, 30 Nov 2021 10:13:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgW4A3Ixgqz8PI+64TVMK7ojwTAntrTP8fA/jFfS7xXKT5qCeh/rTbSqa900wm32oO2zIfhA==
X-Received: by 2002:a17:902:b712:b0:143:72b7:4096 with SMTP id
 d18-20020a170902b71200b0014372b74096mr877683pls.25.1638296008605; 
 Tue, 30 Nov 2021 10:13:28 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id n16sm3230348pja.46.2021.11.30.10.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 10:13:28 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7622: Fix a NULL pointer dereference in
 mtk_topckgen_init()
Date: Wed,  1 Dec 2021 02:13:16 +0800
Message-Id: <20211130181318.221401-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_101330_693732_4206CAA6 
X-CRM114-Status: GOOD (  15.09  )
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

In mtk_topckgen_init(), mtk_alloc_clk_data() is assigned to clk_data
and used in clk_prepare_enable(). There is dereference of clk_data
in clk_prepare_enable(), which could lead to a NULL pointer dereference
on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT7622=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7622.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index e89acef5768f..4968b227b4ab 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -620,6 +620,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
 				    clk_data);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
