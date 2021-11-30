Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C0DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AJBTDO5R+Q5vcIi9lnX3OFyBJ4a8WfndHBQUD8ytYy0=; b=ZpSJUnAPjuq2Gf
	uPDeGa+BRDhG+V348f3qfR7oWxycFAT3g1ctaBDVHkPHdqhYg7Ad4k6+KDVkBybocxhC5sPO0Iu7j
	5/8XCoUh33YcJ36X1oxMTNajFj8xbd8FK9F2Mk0zypFRZNMp3K5KfK0LUC/Zv5I0m5IpD0F201m+L
	oqui2iMALGB7WRc8BEYXTTrs9YZt6oRiHJelGA6jVwYaBWRZBHu3IBmhw1VtCJw6djj0NcocJY1cL
	lSq32Hpi1q8vL2Q9dNY8JCsqBaoMPwPL+MjCp+WASMvwyZF0BudE/2/MLVJikoZEWl/ma/CSPGQ8N
	LsGtZDf3Armv921yletw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7f9-006SWP-Fa; Tue, 30 Nov 2021 18:15:31 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7ev-006SSO-SR
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 18:15:19 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3VkY2H2Lz9vvMv
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 18:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GABz4CJUXW7j for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 12:15:17 -0600 (CST)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3VkY0GW0z9vvMp
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 12:15:17 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3VkY0GW0z9vvMp
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3VkY0GW0z9vvMp
Received: by mail-pf1-f197.google.com with SMTP id
 a23-20020a62bd17000000b004a3f6892612so13286426pff.22
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 10:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8aLbqDVidZ+7wdd4GicAjvyHH7eASjXq9vZdA7OEF94=;
 b=h/zqG5CfkaTPj/bhN4usylXAlQ5g3qbkk70kfXHrteu7ovjt/eVh76QH8Bi0XLCdey
 Lf+TKwTx+LZRn+z5ZdGRTqc8PDJOux825xOZBFTdsbOGAKEYBhkKT7GULROrT2rOQ4NX
 Bo0SzKsQ2P+RpvQZNxmig4beiRzO8jxiMDmnUVPlgM6pobobo16jj9RTxOd8x/k8Bx6l
 v/L4zJiGIKdaWmgOhrQZt4v5rnT8nGpTShtgfrSAdtNG9UhWjwagJr2Kjo2p36ViCVY6
 hYBJH7k5zlfIq8v/iTS2MND/PLDf+4AlUkWy6MC7snl8knter3gEJV+sl52xlobTbYGR
 uP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8aLbqDVidZ+7wdd4GicAjvyHH7eASjXq9vZdA7OEF94=;
 b=r+AXKd+nv/r8GePveNmS+spH2bLDC7IMT6j2qOYtZVtp4pXTvz7bcp8EwsEU4mjZwj
 THwskTfxzp77ZhMtJZkOnbU9XtUtYzhijntCT4bshvcjRCEb42PWrcl44XcKu5LEUbvD
 oDNuyfMG14RBmZGtGrduoDNNuRmrINXjUPUtpRN38vylodPeUsJe2qp1fFgiNYyNu0se
 gAzKD481NyOdm0wiUxmjQ0E+nHaDcMt2buP0+J524YV1iRH1tKj6z5xs4XmArAJvKUB2
 RI9Rsk2TIP5k2N3L24sGSFUGINlfwLjitVc5lJNQtNXUnXmPaWncnsdkULDcrVay8dlY
 S4zQ==
X-Gm-Message-State: AOAM530fta2bXS5RPVatBjPFC6/4QQWNMm6JLyaui8bu/bLUqNyfiuRq
 2tpelVBJ67sO/syT6QUmiwWVEDRYn+GHiKlruWnygAvsL6zHo6zvkEWVbfGfeG1jyjXPiHMsP/v
 4M8uf8Fe6jppoCM4GpcDJ1fycOxvquXIfiUKJ
X-Received: by 2002:a17:902:e749:b0:141:edaa:fde1 with SMTP id
 p9-20020a170902e74900b00141edaafde1mr1041433plf.72.1638296116222; 
 Tue, 30 Nov 2021 10:15:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFonit7jQbQqW7wbtpwt79Yj99amZxiuzPUHMEFm11chH74+RimyI/4fW4yprB8GZxNrvZFQ==
X-Received: by 2002:a17:902:e749:b0:141:edaa:fde1 with SMTP id
 p9-20020a170902e74900b00141edaafde1mr1041407plf.72.1638296115986; 
 Tue, 30 Nov 2021 10:15:15 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id y8sm22530397pfi.56.2021.11.30.10.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 10:15:15 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Wenzhen Yu <wenzhen.yu@mediatek.com>,
 Rob Herring <robh@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7629: Fix a NULL pointer dereference in
 mtk_topckgen_init()
Date: Wed,  1 Dec 2021 02:15:07 +0800
Message-Id: <20211130181509.222496-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_101518_012305_CFFF4CC6 
X-CRM114-Status: GOOD (  16.37  )
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

Builds with CONFIG_COMMON_CLK_MT7629=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7629.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 856929f94ebd..f791e53b812a 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -580,6 +580,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
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
