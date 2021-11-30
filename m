Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KrtBeNEI18/1WpII3op73YzELa14bXYM5LSW2I6jvWM=; b=URwBgdfbUX3juN
	cF755HmkijSgL1Mzq1Pxjt4Y1qe4u/MwpTWbWIZXZ5yXyFM//0iyqYCSaxy+imCC954xZLcsvhS7c
	qOCAhsu5ImtXaq0+zOosBeEAW9cg5tHm0YuedYf7zLypAQL22hPX0DIf7QoDcLpR8BJ7kFd3ErdZr
	iWF6uDmySh9vLPKc0h0kSinRplU+upAALLJwrw9Xto4s92+UDYcoNLmmaB3TJycP3xAjfm+/Eip1P
	Nzp8V9KSshkvDgG1A5eJa+ritYVtnztcEIwEOH+XdB8KUOFr9UPFcxYFSQWo3h4yIOuz6p4ReDQME
	bxu84EA1iZJcSWS/++Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrz2W-004FbH-Ra; Tue, 30 Nov 2021 09:03:04 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrz25-004FV7-Ol
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:02:41 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3GSs1yVMz9vC9F
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qSWruVDv26RX for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:02:37 -0600 (CST)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3GSr6z50z9vC9D
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:02:36 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3GSr6z50z9vC9D
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3GSr6z50z9vC9D
Received: by mail-pl1-f197.google.com with SMTP id
 e9-20020a170902ed8900b00143a3f40299so7892229plj.20
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JB/xnaYRERTHfThz3BeKOjYTQVcTowsU7QWWYd5kA3k=;
 b=OS2U0S97KdtYbru48E9PVinKaS8ajlz38Gs67N+WmxDHN5E7BtqqyV5aIK2NPvJQ7x
 JnMQ/apjMmGUkZ92r5R9HAojVBAZhdTKUh6DPCIMJNouHmuw1p9EJGxa0RcvhBle6/Kx
 m786DzGuNV2R4f4fbq/yI7qy7m4befRm+Q8j/QuytpySgeWe1rwPHQox2XB3lM7JXAB6
 zX8OGrkXmsbxg4lSPTuyHi0R1uEzWSlbeHJbaBszcw1K3NgSSbAP0cUln+bLUYSjBOsO
 93LxR8K4FvuTe0lJsLNRItn79ygLkvNyK6dxH/ZulD7Z9yhJOqhETWx97nB+lS33YKkw
 Pjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JB/xnaYRERTHfThz3BeKOjYTQVcTowsU7QWWYd5kA3k=;
 b=jHeMnulghhx9KP+YCNE+pvd8KU0repFUvuYkY3/3mYLPt4qkIQTJe4tch1B3wwkC5h
 pvGaZUEefMLFf0aTMpaszNu4ogRxeOXLPHVDFMJnD+Xf82O5AjVyqrQToKM0J9wNlHul
 NbbnGsODywSRbgJY6LWVABoLjpA7FpaFtUs7xKKZJIRIFUZZcLQmIXQVWEubHLWx1I7m
 bDfZ/aW+44lNMABJ1uuNfBnxSuQ53JHibuXWTJYrYTf0JljT2R9y7k6+UDY02jFu75Jc
 W0mS6MlXiGxn0yTXYOVo4GEpsEYwNCqsVVkyeLEbwacQuPUJJFmzzn7K0I+Hk4aHcXcH
 YlCw==
X-Gm-Message-State: AOAM532OOtd2boyKVBUa4k1brZ7S22dUwTz1j0SiFmybIXxWJJ6dzfkz
 FPHifyG6hJuCT4fuvnl3gP1LQpxMEYatUG38bhW1mq8BZb7dBIsI4zU+vtpkdvV4eP/ZwzHBsm2
 rPMR3SMHeeoxVKnnLTVhEYmqyC/aWibxwydRR
X-Received: by 2002:a17:902:9349:b0:143:88c3:375e with SMTP id
 g9-20020a170902934900b0014388c3375emr66274425plp.16.1638262956009; 
 Tue, 30 Nov 2021 01:02:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFrEQrsuwZ277titXaqT8fk1JaMbrMsWZ/xVKNYBxWfn8JVIFmUsszxNKjkAxJJjqUoJjMLA==
X-Received: by 2002:a17:902:9349:b0:143:88c3:375e with SMTP id
 g9-20020a170902934900b0014388c3375emr66274403plp.16.1638262955785; 
 Tue, 30 Nov 2021 01:02:35 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id j38sm14209940pgb.84.2021.11.30.01.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:02:35 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "weiyi.lu@mediatek.com" <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt2712: Fix a NULL pointer dereference in
 clk_mt2712_apmixed_probe()
Date: Tue, 30 Nov 2021 17:02:28 +0800
Message-Id: <20211130090230.77618-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_010237_911899_15F84C6F 
X-CRM114-Status: GOOD (  16.91  )
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

In clk_mt2712_apmixed_probe(), the return value of
mtk_alloc_clk_data() is assigned to clk_data and used in
mtk_clk_register_plls(). There is a dereference of clk_data in
mtk_clk_register_plls(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_plls(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT2712=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: e2f744a82d72 ("clk: mediatek: Add MT2712 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt2712.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
index a3bd9a107209..08ef56f68c7a 100644
--- a/drivers/clk/mediatek/clk-mt2712.c
+++ b/drivers/clk/mediatek/clk-mt2712.c
@@ -1266,6 +1266,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (!clk_data)
+		return -ENOMEM;
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
