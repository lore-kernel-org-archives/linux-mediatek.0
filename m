Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08DFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/9YYj3qTMNXR16n5+7s6G8g7vwt+yBWVqfh9VFTbpwI=; b=p0H5asa8/pAekU
	BMLotWoM8MGTG0idV5BJCLTQ3mEXuZ3N3+pBySvjwWC5O1B83TR+cW8nBBgyGuOUL4ct1FPRPzwSl
	aLdWWQtoF6c+0lhamyTpsycMxBU0aSCmwMRYKpDFHel8m79bBb2SySBkYrcJ7A7ZuGtfjf+SxfE62
	I83XDz77vkpqNEydpC9nNJxpvqqEmtTZho8Sp6T/lsrHtEQTwAq1iETCf7waD3/HIdgxAZ1nPk+GG
	mF/R/QLn8dc19JyYTwEqs5eLWFatpXokgkao2KvigzcC+01shyHvZ/ofdiLScFifC8gGvlVL0fS04
	YqApmXiShURtJJ7DhHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms05R-004WBy-68; Tue, 30 Nov 2021 10:10:09 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzqf-004RYc-Vq
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:54:55 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3Hd93WPDz9vBr0
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpKSUyb8Ib1t for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:54:53 -0600 (CST)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3Hd91NvVz9vBqZ
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:54:53 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3Hd91NvVz9vBqZ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3Hd91NvVz9vBqZ
Received: by mail-pj1-f71.google.com with SMTP id
 a16-20020a17090aa51000b001a78699acceso11230577pjq.8
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8j2IMMmZh3mhChTW+5ogwreaS6weI3fhZ/Z5pd7AGBg=;
 b=FMhc1rlTm/IViESaAtBZ+npF0jJTpxJuTw7HU8LxFn9REZlDSCmqb+hvzeR0mxjL0G
 7+SfrvvS7eEee3J66f0CyIl14d4u15dSFqRcUDUJ05n5EQQl1Fx5XUhbsH5Ep2LPv+yH
 yHkDmV138czSFtjMnPcZgiozuAIskHN5Ht+UH1mG55785eqtYbrhT/mtkUEWagePtEzS
 ZU0o5nF8SXaHItSL1bBcqZH3Iot6FHBfcKqael2maPR/HXcJ58RxLNVstlI1QI+hapxr
 7sUXow5z01JfeVCFLinwrrl+leW1+Y1KbBUu2izTp0jUyjvGnyef6mgJxRI6Vv6wD0rd
 eaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8j2IMMmZh3mhChTW+5ogwreaS6weI3fhZ/Z5pd7AGBg=;
 b=gtGjRaVOE4EJZlmzyhG5wkcPwkd1tVDQdKfO1xDV6EvRPCqyQeFekmpBTqMNwelIdu
 2V0KTnEjlvRcWvrrJdIA7MrJPIMuifvMir8KUW+r/wsGluK7ASKwU9673UVatfzEGfL5
 ycVc8XOvPU5TM8RkMMvByhNEyNmO2Ey+diQuP9m5WjoWF/3soecAYlplcq9XG30XoN3D
 u2WljyNr8YnZ3jrsDvBDfvJyPtFbtHYztCWc7Eb/lQwX/TBPy4f/LdT/59+yXpN55fua
 tpqePuIqyuSKDEKaJMU0JwPsyoRwW6kkbGc6ikGzV19fivXWNwZMTZVIK4hoN11qgOEm
 8QaA==
X-Gm-Message-State: AOAM5311CNDwSvSDCe+2H7DW9wHrbAbn8SqTFBjWB33DRc5H1Rts8/cQ
 2t09A8RjBKBaubVBwl5CtB1Ta4VHcI7uQI7zXVPFlw04Ytv8PIzfPq5IySUOXN2A6uBFv9+oXzw
 hqiR8NzyVBvRqjXFZAyFjNpyaEsqDpXbvkvkr
X-Received: by 2002:a17:90a:df96:: with SMTP id
 p22mr4731678pjv.129.1638266092410; 
 Tue, 30 Nov 2021 01:54:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzD2Ed1coxhmeojB7a08fyyA3nzo3B45XUiYIE5WseZnbq6NvpuCZVBmmjco4vlGCpgh83KdA==
X-Received: by 2002:a17:90a:df96:: with SMTP id
 p22mr4731651pjv.129.1638266092206; 
 Tue, 30 Nov 2021 01:54:52 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id d19sm20459573pfv.199.2021.11.30.01.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:54:51 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 James Liao <jamesjj.liao@mediatek.com>,
 Henry Chen <henryc.chen@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8135: Fix a NULL pointer dereference in
 mtk_infrasys_init()
Date: Tue, 30 Nov 2021 17:54:44 +0800
Message-Id: <20211130095446.97423-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_015454_163982_EC228C79 
X-CRM114-Status: GOOD (  18.19  )
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

In mtk_infrasys_init(), the return value of mtk_alloc_clk_data() is
assigned to clk_data, and there is a dereference of it in the parameter
of clk_prepare_enable(), which could lead to a NULL pointer dereference
on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
clk_prepare_enable(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT8135=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: a8aede794843 ("clk: mediatek: Add basic clocks for Mediatek MT8135.")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8135.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index 9b4b645aea99..b4e20bd7680e 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -547,7 +547,11 @@ static void __init mtk_infrasys_init(struct device_node *node)
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-
+	if (!clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 						clk_data);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
