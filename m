Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F94C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 18:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c8YbSusausL1AtlaTMXOxgle+thLmlQnAajcjsaNeeY=; b=xptDVYxv9WyP5V
	ES+9NED+Pab3U3r+KQynlRkWqxMv1X6gqWClYxCw8sBkSi75AMj/zvj3XLmJNy83HZMILYX8s8bat
	LEN3JiebKc0YCSHTgCgiw/JLOOV3NVNt/H5z1aa/8SXsz5AFsnte4ikJ02ytDSn292me0GJxCN9aE
	Fwo9fB4nOdJQ3WQasuWh0621P1+gs3dAyFPRoD6vhMzpPPz9JHQeUV44HIEJBl62mX5/MS3flw1G5
	Y5nW8FRR4/VRuu2p4znPY3O3t82WN4OsGDdbQ0pQUolriaRrkDGxsn4jo0GraJfP/0Pc2ZqSql8km
	pO0EYGZIVwsOdrjXBDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7Sq-006QbO-Ms; Tue, 30 Nov 2021 18:02:48 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7So-006QaF-Ou
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 18:02:48 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3VS62kf8z9wjXv
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 18:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dfY75d9UMQRS for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 12:02:46 -0600 (CST)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3VS60hPMz9wjXf
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 12:02:46 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3VS60hPMz9wjXf
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3VS60hPMz9wjXf
Received: by mail-pg1-f197.google.com with SMTP id
 m129-20020a632687000000b00324df4ad6c7so9396590pgm.19
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 10:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94FUHYbL48FTKXxIcPe01xLMBfPTMNQQ7bJWYC1FWVY=;
 b=XQ1yQvWlIQV8/P81taYysSBz9syihh9z8HDlaEZRaz951rIA9xY7Bhwyv7EjeJWsPm
 YE2J1EoHPYroJ1cOI6/l4hnz4tO1dIMRlFr1It3XDEGcFB9DL2F02ieuyTuNW95NKcoQ
 Uqfy9bsgL8B0/Up8f4KXOEL8Mdu3uA5mzhBE/venDBWqRCvEDDTHEO1+9d/OLLQbcNlp
 u6lH7Zxha8YyVSh/UuR0t1EjZhI+8XerFwlN+oUAHV9dSphllgXJKGFjhlR+zV6jQiUy
 guF4RFfDKbfNns7AsC7WzSS1RTKITHIBCUX6NwQLA8Xjf2fr+dgIaMIc063hvmnxpoHf
 QB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94FUHYbL48FTKXxIcPe01xLMBfPTMNQQ7bJWYC1FWVY=;
 b=CvjoJnRfIOTQtaHCwcYo/z6UBFl6mKTCjCU5k2qv2ivmU455wghnLReWpvIQCMqChy
 gbI/pJQBMGjS7jskQkgy12bbY17WZ2poGto8nQy5fPL81SkjFSfXm+r+Uo+c5sa3gVod
 fqGQJuO3rN2ypT6k6JCPD81cVag6v9iLC3oQgS80KA/7ema4ThTftZE9YhP2vlps4O7B
 bHeljJk/OY9TbvgtOOX2vM3uDd/Z+1tacpy2qZZtq/3xJKjQ0dsvvBgTGSsHXv6PcJaB
 1BkURtiZa0yv5ne7l0xlKhgOni0UT69utqdaNwVTovgwH0yQ8liG8l7lJnd8aG0PapAz
 kx+w==
X-Gm-Message-State: AOAM530jWKr0hZjE0YQq4KURAxVXdodOX+tZ15AdxKt5hqzEmzpwoVLx
 nqStjOIa/KPLPbdOnspNimzk1X+GhMCFxsjv3F6slBD1wqRAG7pgHtq6oA8eHLhuWAHCB4D/r9K
 k/S6wNLi00tejsu6aQaHCWh/nalbPtVjnkPSA
X-Received: by 2002:a17:902:aa89:b0:144:ea8e:1bd7 with SMTP id
 d9-20020a170902aa8900b00144ea8e1bd7mr907530plr.65.1638295365188; 
 Tue, 30 Nov 2021 10:02:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbCSXQBUYQ9W478PfO3HLXqUjgvGStEcVvVvDkr1fi99WW7iwMEvkwA+RyYe74PrMkLotyzQ==
X-Received: by 2002:a17:902:aa89:b0:144:ea8e:1bd7 with SMTP id
 d9-20020a170902aa8900b00144ea8e1bd7mr907505plr.65.1638295364975; 
 Tue, 30 Nov 2021 10:02:44 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id lr6sm3595044pjb.0.2021.11.30.10.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 10:02:44 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Henry Chen <henryc.chen@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 James Liao <jamesjj.liao@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8135: Fix a NULL pointer dereference in
 mtk_topckgen_init()
Date: Wed,  1 Dec 2021 02:02:36 +0800
Message-Id: <20211130180238.218178-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_100246_907425_F6F1E211 
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

In mtk_topckgen_init(), mtk_alloc_clk_data() is assigned to clk_data
and used in clk_prepare_enable(). There is dereference of clk_data
in clk_prepare_enable(), which could lead to a NULL pointer dereference
on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
clk_prepare_enable(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is
changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT8135=y show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: a8aede794843 ("clk: mediatek: Add basic clocks for Mediatek MT8135.")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8135.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135.c b/drivers/clk/mediatek/clk-mt8135.c
index b4e20bd7680e..556153379c3d 100644
--- a/drivers/clk/mediatek/clk-mt8135.c
+++ b/drivers/clk/mediatek/clk-mt8135.c
@@ -526,6 +526,11 @@ static void __init mtk_topckgen_init(struct device_node *node)
 	}
 
 	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
+	if (!clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 
 	mtk_clk_register_factors(root_clk_alias, ARRAY_SIZE(root_clk_alias), clk_data);
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
