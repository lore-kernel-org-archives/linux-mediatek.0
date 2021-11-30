Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46802C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 10:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ar2EjUm1dqPxniIvWJq3t3BrF+CqJXBpKxbpmtj36CY=; b=0zrMHCwoP4uNuW
	+E/wSr2Xsr924Fcf8PQaMuSYjyvteAMQ3s/Fqh9zKWTn1yJWVq/043CdXv2k9PwIVLDmc2685Tsu/
	4Yvo7KGriRfmd6RQK5y2AvTmGCAmL2b2a/a6t3dyK9cRJ0MI+Y7Wb0UK1EnbSBzlbs1viPxf89cLx
	3vZfBCLBXgBPOaGc2Q6lQz2qS9it8kIvtevz/FjzxvWC86geO0AEJ0GAYracqv8UEuUXXz/4QZ92x
	l0CjIv9L79ymLbaA+cVnJiFo+xjITKo5Ppm9uX8b6ANzYqLMM4/OgJlEuZdQVwF0wnHxSC2srNB2b
	PYrCuXnk7h4f0F+Pt9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0GT-004Znn-RU; Tue, 30 Nov 2021 10:21:33 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms02B-004V3L-4G
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 10:06:48 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3Htt2ndpz9vC9L
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 10:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jqpxhD92m6Sf for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 04:06:46 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3Htt0l8rz9vC9M
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 04:06:46 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3Htt0l8rz9vC9M
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3Htt0l8rz9vC9M
Received: by mail-pl1-f200.google.com with SMTP id
 n13-20020a170902d2cd00b0014228ffc40dso7995622plc.4
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 02:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r7G1TmK41rnyV4TkIbbUQW1TkiKZi87yD3Zt7PBsc3c=;
 b=YCnUhEKkb/jOCfjUjRF0e27/qXa3DYamYPdLTGBf2SvomkMp/VQ0e4cwEBzp/oqLjR
 kx/zhyOcbMXkNiiHOQgaIWpELLwu6gX3QESWnU6z7qrhyNOlWPbm+MtiebPXxJo8eaXg
 zlgTm/4weBP3ORs721TMP06TyZRvhHVgXV3uGggl+4AInBwMfNtq2InBWs+EqEaijWEo
 ZqECz/st6OzilUmwocSLZFrNxBJw9G3Uih0nqqUXMPDisYneHJ9gWrrSGBWYrNY8j8UB
 pwmPNJRgxyKDGgrx3oHVhLKTxPUj74YQEGXS1n/i3ZKML89CpVhH+gIWo4w797PNjkDY
 ETAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r7G1TmK41rnyV4TkIbbUQW1TkiKZi87yD3Zt7PBsc3c=;
 b=QknuiG4LrHNs7EFv0TUZCAc5HingoyJ9YL8bkgzBPTtDZlk3aSO9ohNqVYM9i/KmP3
 mCpndqTJJ4U4/khPZJE8VeD1Sr0bU0PbdyD1RVId/jlAo+6F0PHkXJAJl6Zb1923TF0Z
 NKLfhuIvhbZgpoicidtY429W8gqkyepxZ1mr/SvOKovdkwZj9Vo1XI5Nf2kXMg3dNhtI
 DjEaajHMEOp1oxA3+Mpy/INjOXbdUxDPhGMtj/lGoixeKe0tEwisN5BjLzCCzMwYyms8
 WeBbdhXT3RmZceSR2zQRS+crkGMl64IYaKsM6lCxrIIZm5iN1svxfX6VED5TZmIYojLI
 OFBw==
X-Gm-Message-State: AOAM530vbYcN4g6wH0yOTDMoiIgVAeQUlhsA70R78oSqFfbUMlLMkNkA
 BsNbj6wOynjY75sd9olOJhAv8wnuLRUyR3XS7xcyMHSJfyDxiWSXN1gakD7XBu27oqiT/cg441z
 U8w/483QotSJPe6jfYKedZBTJmqk7OB4YjpG9
X-Received: by 2002:a17:90b:3849:: with SMTP id
 nl9mr4853390pjb.145.1638266805406; 
 Tue, 30 Nov 2021 02:06:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqlVi4gUEZnqMEVQTnjH2GvhflnCPZQmVNPYts+3MdwetGMoE49AEmyYr8Z+B8s90BXPoQRA==
X-Received: by 2002:a17:90b:3849:: with SMTP id
 nl9mr4853350pjb.145.1638266805060; 
 Tue, 30 Nov 2021 02:06:45 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id j22sm21003399pfj.130.2021.11.30.02.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:06:44 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pi-Cheng Chen <pi-cheng.chen@linaro.org>,
 Sean Wang <sean.wang@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8173: Fix a NULL pointer dereference in
 mtk_infrasys_init()
Date: Tue, 30 Nov 2021 18:06:37 +0800
Message-Id: <20211130100639.100722-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_020647_295686_7B33A412 
X-CRM114-Status: GOOD (  16.56  )
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

In mtk_infrasys_init(),the return value of mtk_alloc_clk_data() is
assigned to clk_data and used in mtk_clk_register_cpumuxes(). There is a
dereference of clk_data in mtk_clk_register_cpumuxes(), which could lead
to a NULL pointer dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_cpumuxes(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT8173=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 567bf2ed86d1 ("clk: mediatek: export cpu multiplexer clock for MT8173 SoCs")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8173.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 8f898ac476c0..a350e5c637af 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -868,6 +868,11 @@ static void __init mtk_infrasys_init(struct device_node *node)
 	int r;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
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
