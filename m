Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hnu6zBH/KyYRkfayOJUXfG14SpMNID9DFKgUFj1ADCs=; b=nNWQ+/iaqfsR4K
	2mt+e/mdp9u+dYPhbkBbTXaCPSG0DDXn16WOL1Qe9H/nrzJe3V7ITQ6WM7QnyewUJh7CtE95y1gOw
	jAuRfq40Dgn6WmUQsUu2HXa7eL6A4u0GiX5u7jeJSOyJtWZMMyXvkfFcKuE1gywujgSX6bkNeZxt/
	HhwKsxhugQSVOGKMVrTgNeoiRERTEyYZXn+Kqd5kW8PNpyIwAtKvtgxeO2TKgaxb/mt4tfSxCqZHu
	qZFxpetiH9hwIoANXz1jrVYHp8tipRYub1FjpuOAXZM6p1p5FM2QXZpU+LfN5pQmNmwipLPYZVByg
	FA9zkGVhEDTq33MaYcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms73n-006LGp-Pq; Tue, 30 Nov 2021 17:36:55 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms73Y-006LCt-Fq
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 17:36:41 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3Tt00l2sz9vf8P
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 17:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GgCupW8ec4d9 for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 11:36:40 -0600 (CST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3Tsz5pkLz9vf8Z
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 11:36:39 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3Tsz5pkLz9vf8Z
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3Tsz5pkLz9vf8Z
Received: by mail-pj1-f70.google.com with SMTP id
 b11-20020a17090acc0b00b001a9179dc89fso11879520pju.6
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P5cblcIjdeCMfmyjDsX3UotdjIWrFfTaBh8mADY3+xM=;
 b=FUENcG5Qe/ALF7PQ2LjG97LD8lSia2k26JzFlv+uX/u62oSjm42FHUVXgzDNpMkPff
 b+1cGw+QgNft8C+iUuJ52UTC32B4yNn36j7BggIjztyZ81A+fUghF53m7zlmyEg1x88u
 HUQyh3qvPmWS0N+6rlDm3OnFmuhZ9eEmu4OTK7LS93TlNVBFWCnLMVIG4m4g4YxlPf4H
 OidgSdguEzAr2iu/h2ob1vYA0T9ZRt2KnaoG51I6SOvA9ykg/5wJe3JSmW612o7xmLGF
 vrAmyJFq8ixnbHaHeUkB65gfeOwjDIgmTc25Hjt+SBV38hwrDcYzL6jSkiXJam/A1AkF
 7BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P5cblcIjdeCMfmyjDsX3UotdjIWrFfTaBh8mADY3+xM=;
 b=RWa1Wm5podsEieHGbzimmqCkM5drMUtYKm7yOkHnETCRW1Nc3nDkvjvIPxQy87FmdF
 9ExcpLCJgcKkKKwX7jib8f/yE6WONsF9DesV91SmbBdDXISltt/ubSTYTkBX2umvWuE5
 NZ/7nkl60hpxC/V8I1qMmeec+/BiBrCVJSNuwe1RH2P132CRHmR+hMfCdNSfUtwD3s28
 fNRt9O2A4jtBUicW8H2dtd3zV53CZXkHBLjQwiJ5vClArB3qHJNKcry3O3CxQwBYVsHx
 zg3XFBqIpSEP1qyqtWjsUV6ZqHkKppGW1+Bn695n34OlD8WGvKAJnBtDfSt8zet6ijTK
 vd8Q==
X-Gm-Message-State: AOAM5330G9F5j7FRNs3fc3dkJcUZBeHAciGdVWZvx5AQVYj0+IwzAqmB
 Nhlkic2/p7fs1AGERTTgd3EztzQNRCii6KmmDgr2qQx0h7pJhSHijJ/hobxkdn6T/FTjs+ID2Yz
 XaS/7anwI3HGMZ36LfjO+FCVB+xEMdmbjPAqG
X-Received: by 2002:a17:90a:e7c2:: with SMTP id
 kb2mr434897pjb.200.1638293799028; 
 Tue, 30 Nov 2021 09:36:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw187bYFOnFYXpjl7iwYSNqNVZ0EgJuuUWNuhT3gfgeEjsME32I8/ofS4pvOfIww2f6a5taZQ==
X-Received: by 2002:a17:90a:e7c2:: with SMTP id
 kb2mr434878pjb.200.1638293798822; 
 Tue, 30 Nov 2021 09:36:38 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id y8sm22470105pfi.56.2021.11.30.09.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 09:36:38 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6779: Fix a NULL pointer dereference in
 clk_mt6779_top_probe()
Date: Wed,  1 Dec 2021 01:36:32 +0800
Message-Id: <20211130173634.212143-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_093640_635949_F34E235D 
X-CRM114-Status: GOOD (  16.05  )
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

In clk_mt6779_top_probe(), mtk_alloc_clk_data() is assigned to clk_data
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

Builds with CONFIG_COMMON_CLK_MT6779=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6779.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index f22bf4025f55..fb43d23b715b 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1239,6 +1239,8 @@ static int clk_mt6779_top_probe(struct platform_device *pdev)
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
