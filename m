Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40583C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SSlEzI9dOr5Gb+bXUrwKe/SM3sgeh+BRkYfXpwz2G9E=; b=fufJemfIqC85tM
	wa983tb/5zUv7s4yflulha7NlEtNTmcL69Qiv2YMtp6q1rDZvsuq7uJbWWfPTcP6kUxcVPT/lr1wz
	ck5K1RejgbpSkVK/V8hs0GAX8JtZIexDunD27TXnB0Cvjnz8p0uFODnkPghqUKcBaVtRrRhn3Wyup
	RW/G2hjN5NccsBqYdEPw4ej+JyOotawws58UlFeCgc0l1H4Cnzs8P37oo0+DEjew8zUT8/5ayKNxy
	6ObrdH5qFbdd+zVIEG5pcd5FhMCsvlL2BvulSB/6PfFKgc1e0H6Nh9ChqRWHphlo/y4Lt4mRdVeCw
	xZJpskIYdIatOi0+BKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0Kg-004bE6-AP; Tue, 30 Nov 2021 10:25:54 +0000
Received: from mta-p7.oit.umn.edu ([134.84.196.207])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms09Y-004XOX-9y
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 10:14:26 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3J3g5GK4z9vCDg
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 10:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVppHfF5NL3t for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 04:14:23 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3J3g3BtPz9vCFK
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 04:14:23 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3J3g3BtPz9vCFK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3J3g3BtPz9vCFK
Received: by mail-pf1-f199.google.com with SMTP id
 y5-20020a62b505000000b004a804839861so8756587pfe.7
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 02:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ezPDMyg4z6FUtdCtlSvrXZjWSKm8o+6pNXDt3YFkKII=;
 b=Q54MRiSiawsPKrbhwo2sZaqpTRa/egZ01MFGeAUM/DZ82+sJerdvNIHnksW6nM/pta
 QVvvv3AOILqpqIUGAsZnGjhDuZUxY8mAyX0zTIx80kN8PEb9AEsRK5jJGHWUMLXq/+9p
 18FLISF6m1jmgoMj7A59ud8iJTJv5unr1HFInzCEsKS+QB+t/YR4V3rzZ1LvapFYGkbM
 QXfePCn+j3l7xY4BDmkJJY2XL+0JaBjQlw6vW+JCLzuLiPZgyoEb13RWjnpJptvj6N8Z
 a8f7HWlh5y7VeizpsvQbTZpU78wh84cs8PkNO9HlyMA53OgdVR/HBwqSynVvwZI04iP4
 0joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ezPDMyg4z6FUtdCtlSvrXZjWSKm8o+6pNXDt3YFkKII=;
 b=latavW2YTVcKLdN5GaeCGOmW56dwLtuZwscGAfBij4HJwOePjru6/noGVBRfK3ZlkF
 H9RF5Iz2JaKAbdZqRzHyFeDp7+zbrKp5IzqyFnpu65WqHHRG5kmtnTGSapMh4yhjs8l2
 TPjERNRjGN1gbxukxVbktpOYqO/4hbhq9sqsrAsfRKjW4B1vSwTm1DQHtWjzdff+tFmm
 D+2MLrzCPRqtWpo14rEiFXXMsyUHlDSKCN9+JbOSTqbaS+yrzfUtYW9S2qax1RS4ZS3x
 LPf2PMzHbO+SAqeBUYheR37BS7vhcjq9tkXnnS/ZOBupDTItJ0V5VlE7M60T4+cGjdj0
 WNOw==
X-Gm-Message-State: AOAM530w0eRNjuTjjCAxcweTd3qtNsey4/EC7yHkTEqengfnCF3vntfE
 v/codCTM2LXLSZoAclxZlQYBACtzDAl8Qw8lOpKDRktCpBV4uMAm4qXBMJez/FPrn/Q1SSokV2e
 5z5djzro4R1l1C/n6qP7FFX/w9y1rXITs1eEF
X-Received: by 2002:a17:902:ce8c:b0:141:d218:954 with SMTP id
 f12-20020a170902ce8c00b00141d2180954mr66086314plg.1.1638267262769; 
 Tue, 30 Nov 2021 02:14:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZhxN9ocyihGfNCGLMaz0RjGDMqMGBOZyUXuyOBDhzdCoh/2u3iNSfs04TgQLOMNklWxKYFw==
X-Received: by 2002:a17:902:ce8c:b0:141:d218:954 with SMTP id
 f12-20020a170902ce8c00b00141d2180954mr66086293plg.1.1638267262561; 
 Tue, 30 Nov 2021 02:14:22 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id t23sm12504231pgo.35.2021.11.30.02.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 02:14:22 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8183: Fix a NULL pointer dereference in
 clk_mt8183_apmixed_probe()
Date: Tue, 30 Nov 2021 18:14:14 +0800
Message-Id: <20211130101416.102608-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_021424_494489_87978A8C 
X-CRM114-Status: GOOD (  16.78  )
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

In clk_mt8183_apmixed_probe(), the return value of
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

Builds with CONFIG_COMMON_CLK_MT8183=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8183.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index 5046852eb0fd..9eca62186ec5 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1158,6 +1158,8 @@ static int clk_mt8183_apmixed_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
