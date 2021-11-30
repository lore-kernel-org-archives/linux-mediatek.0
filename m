Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F99C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Av1Crb5JILWRh8WPFAAPylvDSm0QfNT1rzLHzUdepys=; b=3zV+D62f23jjd5
	KG5GXv7C3MykOivbUobhmu9Ww9QJJXB/BHysWHuAeEIHMInFioZRLjB4/zz8OfSEEmdY5s3JDDPVL
	Ijo8kO4n53opXLx58x7VN6kyO3wKFqiHsAGQsLH7pSqYIhFoW1EgrerUYnzp6ok5maBtGcveQzV9K
	Bv93mOL96pC4f9ODEmJBneXM/cjNyarWD1YJm3ZvRNKVmDAxYyLn0b3XpXw6zDMY4kT0t7gHlF4qd
	oGqe13WPP/hO/e+a5Bt3DZX91TVBxQwFRQ2PYnwBbE84Lmu54AcZp/aDj1LMP6/Nzv63c3dwBQRM+
	jEe/5yEntZwe3WoRVIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0wr-004lMb-B4; Tue, 30 Nov 2021 11:05:21 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms0we-004lLA-6b
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 11:05:09 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3KBC4fMVz9vKYB
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 11:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjU8ZrMKYObs for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 05:05:07 -0600 (CST)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3KBC2ZlZz9vKY8
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 05:05:07 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3KBC2ZlZz9vKY8
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3KBC2ZlZz9vKY8
Received: by mail-pl1-f197.google.com with SMTP id
 e10-20020a17090301ca00b00141fbe2569dso8043276plh.14
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYStvUvCLlqlzrJP1ZcXjQVOD32ssfsnDJadt3mGWKM=;
 b=lFthXgcyVrcbqYBoATpa5XDWbmejulAFFfM9XZLlakuL7daf0/mlgAfWFUgerg3dq6
 3Q5xI5rGgBmVevdeIK3lUwtxxfqephqSkN8n9zebZ/r3e0kyu7hudrL9iIpPJTRstcxQ
 lUziE4gN2a8aJpXnUzluq8+AnfI+jAWLJivmPkAHjIZRoSMNOzp+KKaYmfQsTrgQWKpF
 AXqgVGvHIOE/0XwIQR/iuVKeVHhbxxeHKQIa79yp400jQxw8FELSm0Dr7S2jpgZhZdpK
 nx7D0/VnEUlljbs+Ib0ri7pMI77Os9ligCbBe+rQ6ThngsT8/TsTANrrC+xVl187gnBH
 7lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mYStvUvCLlqlzrJP1ZcXjQVOD32ssfsnDJadt3mGWKM=;
 b=da5l2DlpeBtS3ewNvq/fPSOjCgFpTMF2UtcKnXYEK5x8X9K00BxbwjXS0h0SXy+x0i
 Fj3JHe1GM1oFpZMKhykQHNi7tZ/3mIq5LA90Nvn6duZ7hkihh7uBHB5FY9+rYf7SXkVX
 X3rH/zHBj2a3gmksJ1uzQJ0izv4/HDUypIW6xal+2A9sDr5L2L1KorgjfkuJzN4Eoq33
 Q3FQCUsVhSumPVh04wBX9UCeE+y2Iw3RK6ZGOq0MElwG46tVLD+tr00G6cWWTbu7flvL
 4nHsVOF5x7D/IBOnMdq9F3mlrm30NWYNpNtSG3ODvDnLJawZzkMdXCS/YwwFgbNpzM0B
 ZI4A==
X-Gm-Message-State: AOAM533HWFrYy3g/HRbdP3lBJbFIHYYzdRYel86O1AyXaHl9eGMBcfLW
 8Sbh88dfkATtklm097QVOh9GLIMq1aPxZDzFWmWgPqiLy+y/1O0wvNnubMyHCCD1I3hxrNSjNeC
 XL5PhS4ATsrm5vEJCDhwH2lh0faRZiXtANiQn
X-Received: by 2002:a05:6a00:1741:b0:4a6:3de7:a816 with SMTP id
 j1-20020a056a00174100b004a63de7a816mr46192554pfc.29.1638270306501; 
 Tue, 30 Nov 2021 03:05:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwn1J4uGsH9bOXbYC4WdRrabZwYPOV9g2tM96wV0janBLZf7MKyPwzEO7JdaXL78rb0c2Ua7w==
X-Received: by 2002:a05:6a00:1741:b0:4a6:3de7:a816 with SMTP id
 j1-20020a056a00174100b004a63de7a816mr46192519pfc.29.1638270306176; 
 Tue, 30 Nov 2021 03:05:06 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id h22sm14774116pgl.79.2021.11.30.03.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 03:05:05 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8516: Fix a NULL pointer dereference in
 mtk_apmixedsys_init()
Date: Tue, 30 Nov 2021 19:04:27 +0800
Message-Id: <20211130110429.107577-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_030508_357627_2FEAE7A7 
X-CRM114-Status: GOOD (  17.03  )
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

In mtk_apmixedsys_init(), the return value of mtk_alloc_clk_data() is
assigned to clk_data and used in mtk_clk_register_plls(). There is a
dereference of clk_data in mtk_clk_register_plls(), which could
lead to a NULL pointer dereference on failure of
mtk_alloc_clk_data().

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

Builds with CONFIG_COMMON_CLK_MT8516=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: db077febb774 ("clk: mediatek: add clock driver for MT8516")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8516.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 9d4261ecc760..1f209f569f3d 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -797,6 +797,11 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	}
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
