Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B41BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kh9+cYBu7OxiWkWKv6xNAcC0bxYHR2ah9vf7mxoxei8=; b=xTK1x1no/gl1+4RizxgmGoEqG4
	Pmc2c9QmKdlFr14nw8c9u7MGUi9WWQrJFkXwHd6tA/Cfp9VxgJ0TDRDqcVlKL9FXjKFDgts1xYOki
	8CJyr5PjLz/NAZXWgHf+X5Y5S8goY8OtQqt/nAL7M0UPGj4isTLcLY1sMsK+tx1xIFvtzFia89Bib
	XfUmHcV4gUQk6IdgislLYAUdY9ZT1ZOCoh1IeF6T35yGzpomdWIWsYMyxW8ms6NaR0zf61H1+CjFs
	k1ZFip4/MUrXOh5oNGmU87D0MIaCVYoP4spg09CrfR9KoWOrcQVdWjFQv9T3Pk0uxtlrgJwQi0iaD
	htT2/MtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2C6s-007pq7-8y; Fri, 17 Jun 2022 13:34:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2C6o-007pon-Tw
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 13:34:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B044661F9A;
	Fri, 17 Jun 2022 13:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DC7C3411B;
	Fri, 17 Jun 2022 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655472836;
	bh=TUnzWPiJVms4vJ/5uPUiec9lpdYuPGzgrucHaS8uTLA=;
	h=From:To:Cc:Subject:Date:From;
	b=ACCw52riL+V8t6gppRrS6724V4KU95suPQTTscVBTTpBelg4q1pDbZ/JbHDR0eF4V
	 WWaUQeSKLPcFtVUO2r3Ys2mz/MC/ERvSqkLf62qJSKrGuVlCpUDGBSK/MqKDLwXqGj
	 T6jC25z5zQImtR/tmBdu97X0+9b0fCwMMgJ5/STSfRljZKnAPiaTat7Dfd/rfxWcLH
	 7QYsQSE6EMJ7Ar9K3b4t4dS6rRjjZzb5zH+YxQubtHWmWl2Dfip1tGfWsqwVihcPSB
	 s6LftU8eTrpHkIyxyrlfjrKMjlwoonG+6QpW0I51JI6H1eXfNYHPAS5JKFEcYCYc11
	 YKIhq+WKJUieA==
From: matthias.bgg@kernel.org
To: dan.carpenter@oracle.com,
	johnson.wang@mediatek.com
Cc: linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] PM / devfreq: mediatek: Fix possible dereference of null pointer
Date: Fri, 17 Jun 2022 15:33:31 +0200
Message-Id: <20220617133330.6510-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_063359_042646_56F01050 
X-CRM114-Status: GOOD (  12.38  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>

We dereference the driver data before checking of it's valid.
This patch fixes this, by accessing the PLL data struct after cheching
the pointer

Fixes: 07dc787be231 ("Add linux-next specific files for 20220617")
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 71abb3fbd042..77522f16c878 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -127,7 +127,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 			      u32 flags)
 {
 	struct mtk_ccifreq_drv *drv = dev_get_drvdata(dev);
-	struct clk *cci_pll = clk_get_parent(drv->cci_clk);
+	struct clk *cci_pll;
 	struct dev_pm_opp *opp;
 	unsigned long opp_rate;
 	int voltage, pre_voltage, inter_voltage, target_voltage, ret;
@@ -138,6 +138,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 	if (drv->pre_freq == *freq)
 		return 0;
 
+	cci_pll = clk_get_parent(drv->cci_clk);
 	inter_voltage = drv->inter_voltage;
 
 	opp_rate = *freq;
-- 
2.36.0


