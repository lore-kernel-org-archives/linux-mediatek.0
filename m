Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52017C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VgVYJJ+59KgvB9KdrG+GYtdpd4ScOF5/9U78FwBVo58=; b=jGR/sEhrS5ifsA
	rHt4CTX/Z+8R8Q3rf0l0DTUb2tS9S08v+JF6Gros96rDDs5UkhXMVlva9Br8QWTlKv8v3dZ5Hh6HB
	zPqu5MDmHV5Y8FuY7vIHQjo2cXGB1/ZfNGi3RZOViQwx9e+fThcXCLgMp2vuy8xDf0CswmDC5JMGc
	R4y0XbDoq+9dRoioCrvwH6AXaftLsTeXBoui6hHsJuCm1fhu/8PFXWYDXM2NeG3dDPn6S4efGzgkU
	zJwwkUrQsytxW+pTeIzPXD9gl7XJfVFKSmeESMtC401l4sTClJb15p/RXM0l/DOnlRCAbjwX7JukK
	cNS/7eJM5NRtbBQL5sVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms71t-006KqB-Uy; Tue, 30 Nov 2021 17:34:57 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms71r-006Kpp-Sb
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 17:34:57 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3Tqz027pz9wNLX
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 17:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVmbM1rQbRTN for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 11:34:54 -0600 (CST)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3Tqy4y1tz9wNLP
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 11:34:54 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3Tqy4y1tz9wNLP
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3Tqy4y1tz9wNLP
Received: by mail-pj1-f71.google.com with SMTP id
 gf12-20020a17090ac7cc00b001a968c11642so10219653pjb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dOBvN2QUGpMPNx3hDsPrLwgawMqc9DMK+yT23YcRQV0=;
 b=Piw3E/h4nz3Hmm6jMuTe6NyYfw93oH7f6Bk37gJ2JH7leQVc5fgyno5NZs3EnuPxRq
 RDKgy+pCb3cU3+ulIwiCiks/Jcdq9QXy/aCMyIoLC0MZSt0zjFugBSkHToRaiBaR8/XN
 1eEnGjTpU2etzHjW8g/iewBjqLAbvdYNxNFhh8tgeEPF0G3HU/WpE7oDHVmgU7/nFHv/
 CBuq706vQ9bPKZWNvoFL+oCmPOR4NaAfs+6sqoFwHinxNV96b7QSINNm9nQDDn6msrcO
 ANLaVGCld7BFsKvY5MEZh8CESsvwIgu4hMRkX0F/bnd+N2jYA2wko896EIEyd+H2L786
 xuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dOBvN2QUGpMPNx3hDsPrLwgawMqc9DMK+yT23YcRQV0=;
 b=nRzbKM3ACgIjIuh/q8bccjt8gClMAAzk5MToy+gYA0SDxkdf3ZvppEF4B8CoyIfzqu
 UPUuJ7KR2nbpy3/zWWPjk8OGcHzqoKTWHEpc2+rYIJTRt5UbFUnpLoiwgxjxdnDWeZMA
 JrAGbyifHl9RffGPVGK5DDwGZRSQ1MuIby6NlVwLXaAUY7APNkGdayxXtFfmDxpGoljV
 lTzn9A56aaJWfrEaut0TEQZLsSAGAPgRSZmmFKUvSTL1zx2pxdyldO+XOAB9la2om5Vb
 luJFaQ3dhlkS9kuBuO1bhChlstLGo/arP1iNyIseoGWH0NDVe7GQXSjVqk+8R/tv247L
 fR4A==
X-Gm-Message-State: AOAM533xDsh3fm6Hn0EY/n4D/Eb+OC93Kofc2FRCHAYxuFNy9aaADVZn
 YAhGQ5poPOUEyfc2n7+cOIW/FnYQLplksP1P0oOy/iBoOxv/WAZBrcyruwSZYYbn3EZUqZ9ZTOR
 lM95wxXsJb1y/l/s86XGJ0xHsWgtbwzoQ+/3V
X-Received: by 2002:a17:903:285:b0:142:7a83:6dd2 with SMTP id
 j5-20020a170903028500b001427a836dd2mr601093plr.59.1638293693977; 
 Tue, 30 Nov 2021 09:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNU8qSzls16yiH++Ty7UQju3BhW5xo3F9PUbFfgFnOlvAGIsDEDMQXBQuWW3dTCI9wWnfuSQ==
X-Received: by 2002:a17:903:285:b0:142:7a83:6dd2 with SMTP id
 j5-20020a170903028500b001427a836dd2mr601056plr.59.1638293693712; 
 Tue, 30 Nov 2021 09:34:53 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id p16sm22928114pfh.97.2021.11.30.09.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:34:53 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Owen Chen <owen.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6765: Fix a NULL pointer dereference in
 clk_mt6765_top_probe()
Date: Wed,  1 Dec 2021 01:34:46 +0800
Message-Id: <20211130173448.210986-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_093456_036221_909E65F0 
X-CRM114-Status: GOOD (  16.17  )
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

In clk_mt6765_top_probe(), mtk_alloc_clk_data() is assigned to clk_data
and used in mtk_clk_register_muxes(). There is dereference of clk_data
in mtk_clk_register_muxes(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_muxes(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT6765=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6765.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index 5f723906675b..26d367d0e189 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -822,6 +822,10 @@ static int clk_mt6765_top_probe(struct platform_device *pdev)
 	}
 
 	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!clk_data) {
+		pr_err("%s(): mtk_alloc_clk_data failed\n", __func__);
+		return -ENOMEM;
+	}
 
 	mtk_clk_register_fixed_clks(fixed_clks, ARRAY_SIZE(fixed_clks),
 				    clk_data);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
