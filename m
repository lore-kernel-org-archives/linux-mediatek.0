Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5DFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=prUgY3+KCc6JMUHa26ttd0ducaUKHa57A83eG7IuuzY=; b=44tKNqbikLaiJO
	9J3xnbZXGHGl5gry3o/weYWg+Y3AJ5Aiv3HO98LUtpmJbqd6ohrfRO9gWmYj6tyfbWZvqkTQv2Up/
	iL2aLNgASx8q9HHL1w3RRlsho2BskvnfZ1Olw0M7wFKjsLUeniLo1pWSiZILfMdycoWWWVs5i70Rs
	TmQ2lh59FwjF4MC3ApCUuzaMlmfvXQGbDb+jkJVWF2NVJeYdMi8aNXVeuZpgWm/S9aNrsrOUfwWB2
	pyZNR+CG/CRLyDH1Eim7Qu1Sv8lI9mc9+aktGzw7ORkbh88bV5ytp5h5SV2BfAo5jtiCO6nxLVdiT
	svPmFUMzcUqUs+mpYrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrzH5-004IXA-6C; Tue, 30 Nov 2021 09:18:07 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzGr-004ITv-7n
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:17:54 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3GpR3lDPz9vBqq
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_fHHKZljPGU for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:17:51 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3GpR1j6Xz9vBqZ
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:17:50 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3GpR1j6Xz9vBqZ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3GpR1j6Xz9vBqZ
Received: by mail-pf1-f199.google.com with SMTP id
 b26-20020aa7951a000000b004a815eb3a3aso6064282pfp.16
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIZ6/hw1XbXKmzO5MEDGHAzLrrUD6afmSXwxKYg8s/I=;
 b=D9KCbyPE8cbAAhjSIS3q2zIbB/si0IkVOWglgG0AtZmAnW1IKHFfoy2WJdoDi2jGX+
 QznQAlGRyDJG5WSjdQY5vMjgU0LqT8EQh+Kx3Gq1cyfNCNvg1XdAmr0U4omKWQQqBEOE
 UUUmF+LPHpvh2bwgooNOx1oLjvqBZaFdvFtEyAZ2so+LqJj1VOJQKYx6QhfJuqeQAE2h
 7pcSGCVua1F9BGvchX36yapYJvOVEQjMHCYYM6gnVM0eAGDtw+gFqIz1HBvyxHjCCecN
 q0ZHRBLsVU8E1Hs34Dq73AOxo8ql1lGT0GlFpeAr+1kjs3uR9K+X+PE2dgFGr3efJh7r
 CQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NIZ6/hw1XbXKmzO5MEDGHAzLrrUD6afmSXwxKYg8s/I=;
 b=7FdmgkHLm1cfFCBN+sQ54peHQWwXKr0t58HuXzmpqr+djOtpXxKXPq5akSsaI7+Myy
 jR6+XWAAbvmoloyb516PsvTAvG+Fy9/Ch3S/5SZxezkleP/klTLisGDU3bIEsdFam4by
 K5VWBtzOpilqDDBwIYrCgh5rza3ZS8abQQFITsiDbHuTkJzHGw3oC0brnpG2oFY4gLmY
 nXvZO5HiymnkLjxgty5MXzXgCKqAHFPgbxQmpng26mEwvoFReN6rDIiClEOsvovdbql3
 kvrIJM+Z2/lAwQ5qsV+Nm0g67bzFuyLOjMYzPbuSxkUz7XAjKOgB1cYZonHXmwDfbtQs
 HuCQ==
X-Gm-Message-State: AOAM533p5GiBZ6zWiYYKFe1hqfYnOM5fkLzrWaYeBwm0ivtSqDfclkOK
 cooS/f25u1d5xP8aHZth9t80V9t9oee4HoZrxqJgl2ivS44YACJjCkPz5+Depup0KkWfeTi8Lfq
 YaI2h6l4+1JSGFEa1T52Jk3yrwVhKOWaM4nHo
X-Received: by 2002:a63:9b12:: with SMTP id r18mr36848727pgd.367.1638263870231; 
 Tue, 30 Nov 2021 01:17:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwE9GjxEfwgileQZRn/vK5o6v6tvFGZ9TQmfO803I9D8llMPNWOFqVq3X0eX5DM9fIdE/TGtA==
X-Received: by 2002:a63:9b12:: with SMTP id r18mr36848718pgd.367.1638263870052; 
 Tue, 30 Nov 2021 01:17:50 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id h21sm14275844pgk.74.2021.11.30.01.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:17:49 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Owen Chen <owen.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6765: Fix a NULL pointer dereference in
 clk_mt6765_apmixed_probe()
Date: Tue, 30 Nov 2021 17:17:19 +0800
Message-Id: <20211130091720.80514-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_011753_374474_8FDDB73C 
X-CRM114-Status: GOOD (  16.86  )
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

In clk_mt6765_apmixed_probe(), the return value of
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

Builds with CONFIG_COMMON_CLK_MT6765=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 1aca9939bf72 ("clk: mediatek: Add MT6765 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6765.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6765.c b/drivers/clk/mediatek/clk-mt6765.c
index d77ea5aff292..5f723906675b 100644
--- a/drivers/clk/mediatek/clk-mt6765.c
+++ b/drivers/clk/mediatek/clk-mt6765.c
@@ -785,6 +785,8 @@ static int clk_mt6765_apmixed_probe(struct platform_device *pdev)
 	}
 
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
