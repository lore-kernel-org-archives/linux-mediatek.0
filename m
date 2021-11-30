Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9615C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eaimBhKLB5ywcD0UZbyedHqwt866Rhcid2VWLNW8uKY=; b=EOwn88qzCUgQ1i
	Zr/PMxfZJCMoTp1wMIJE2BP6eBTSMY3VFCHgpVIrREPcynAWOp7yHlnGFjcBDWnbuGnj19zySNrpT
	xfCNJPtps+MZ+GWyNR21Og6q856PDcNtxC3gGHVRF6a8uzs+DRd2wNwPc37OR7Zd5DPVX3kQtJrbR
	pYd1OAqpfXPCpJMZu+5nYR1PIjqBP1CE4UzXYIdVP2ozueS1jxBLaqGVQDlkpY6roX4tkJnROamiy
	mTqke4OtTEz0E+lrGsNAhn/ie3PTWaAQPx7QgFZx9wf/zsgDVkkVeS12PrZqvQWvFrn0uyBlObH+m
	KK7SUh4K0aI+prrlwXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7RD-006Q5X-4Q; Tue, 30 Nov 2021 18:01:07 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7RA-006Q3w-Gl
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 18:01:05 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3VQ80zXTz9vtYs
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 18:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YemycqhODuNd for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 12:01:04 -0600 (CST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3VQ7603qz9vtYl
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 12:01:03 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3VQ7603qz9vtYl
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3VQ7603qz9vtYl
Received: by mail-pj1-f72.google.com with SMTP id
 lj10-20020a17090b344a00b001a653d07ad8so11926176pjb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 10:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NL0IN42+vhkt/BQxOMaS6WGBCL/vDaM2/NJLkQGW6Vk=;
 b=IaCGRRGoGX4BQNCdCbpZEfJZm3PIHsvhvVBLRoPiWw+RvC37CMC3NTitW531yMPkaT
 O1Yq1i9zlKp/5yaP6of6CLu9qm5hg00DvTmSt6b2AsmJAjXby8IoZ6eS/SIVksrnKeIs
 BNoqrLWZdT6Fc/tMq1nxhbvYi+oSQ/SNJ40+S6Hd1bEdXwPSevtc/PGCT15t+Pn1oZZ1
 zj/x6V2r5Y38YhkMqTFobafEXF7iAL/0SXe2ep6OR/s83D+04N/iDxc8WAoM7wKy6Tq7
 HsZZevzc4mf6pvRSmith9h3i6OwDTgLFyGmNbm2KQA2GHcl+kgrZSMDEadxymDZFqy4H
 z7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NL0IN42+vhkt/BQxOMaS6WGBCL/vDaM2/NJLkQGW6Vk=;
 b=Q+w7kZk20zsajWNKEu3dNpyRFXNQkAXTjGqe7yq0aevkIYdlrFG0UaRekxb50T80UD
 ydQBl3lqAqyNpi0P0hTzv/obI6y01+tjUx/LUVxhrUZD35WDaE9umvsPt5mwzIFcA/iu
 lhHxG3p1u5zbS8358VbkNu2mwC3eFNuGYTp03kYRDGforGc9VsHFy0NeyVQXQ6FKq99O
 37IZQwh7rwdOQcEBgEmCjSWToiyt/Tju8+K2+u+eXnpA3SRSqY6pdzw4aRDaIjqgMt5z
 z0Cntp+z7bT/fiPDfrnG0xVo/QLb+S1eJFudCOmaJRFknQmzzhYu4dK7cQJlGCw3ipzB
 foqA==
X-Gm-Message-State: AOAM532QTNFuUryaLYKSSxDOwmsgt8xqqU6rWz2EswJONBHze9BuJuYG
 eZYLowYJehxSMnlX+GQwk0OBVP9Bj+ecDFBbkLEE5joMsFPPE0aUpa0bfjMQo1lbzFPWXDFqbGQ
 8t+wWnMGakEaWhiITPV8oViGZWc2RNRxF1Q4h
X-Received: by 2002:a17:902:c78a:b0:142:1b7a:930 with SMTP id
 w10-20020a170902c78a00b001421b7a0930mr800474pla.8.1638295261897; 
 Tue, 30 Nov 2021 10:01:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqLTafcr/AGzb9we55yXJTEdf36evhqdpEWPD52bvrAmxYJsSWPtReDc97dx8xlqMJehP4Tw==
X-Received: by 2002:a17:902:c78a:b0:142:1b7a:930 with SMTP id
 w10-20020a170902c78a00b001421b7a0930mr800290pla.8.1638295259505; 
 Tue, 30 Nov 2021 10:00:59 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id s19sm22444973pfu.104.2021.11.30.10.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 10:00:59 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenzhen Yu <wenzhen.yu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7629: Fix a NULL pointer dereference in
 mtk_pericfg_init()
Date: Wed,  1 Dec 2021 02:00:20 +0800
Message-Id: <20211130180022.216947-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_100104_670512_75F7D816 
X-CRM114-Status: GOOD (  16.47  )
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

In mtk_pericfg_init(), mtk_alloc_clk_data() is assigned to clk_data
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

Fixes:  3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7629.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index 30fe4b9b9fda..856929f94ebd 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -628,6 +628,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
 			       clk_data);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
