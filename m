Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90AEC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jv2ulP3IGtGZteC7L2dYgJOoEEgP8yexp1pp55O6hJk=; b=hnyv2ZX2UfcVPP2A7zh7lb8hxG
	MNuJQUcjCVY9cybiRXlD8TPTwUZvbq3k7Wm+F1ZHIhEbstIFtCa4S6iddj1NbQZmljndgytxUlcG4
	E5WdvOoypv//daXi+YzAM7jnK+RsU9bAkDsgQNXisVoO5h385ILjs1QIDrrYyKjeL30i6UtnO8F8L
	+9OD2bkmrVvbcKY4k+6+rhvj041cFJ4kCk2XMewxjhzhRa4mlIuQCoSncuHT/QT079Ug0mOTl8fpQ
	DmqHO+RbbORSp8AcxYyfwe5mPvNbekFwmEoO8r8gO3HrZiMpbiXSety6Vwe18BvjdPujNhDTHJVLK
	jeSyaPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JZK-001IKb-0e; Mon, 20 Jun 2022 15:44:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JZF-001IEo-JE
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 15:44:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 42FABB801C1;
	Mon, 20 Jun 2022 15:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2E5C3411B;
	Mon, 20 Jun 2022 15:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655739833;
	bh=FRsip9+0icriLz8iFAwx+5Xu+yMJNijStZ3Xui+swUg=;
	h=From:To:Cc:Subject:Date:From;
	b=J8hdYrXJXaMAraP3Ke+ZPz7Yp9lfihvSY/PBGrZ+OXhYbtEh4akhFUDwsWfl87Q/E
	 YkqvIdHxOJ6c6QMRfXO72S2+NkqravikbY6w+e6mIxjMG1EZ8DqsRV2iwEkp+VxH8q
	 glqSKOpYPkc+XNn5zOsE5Q1+V/nWJuuj0E1c3Naj683ChPAx8opvjIst+9RVIy+mr0
	 4mjqxgKrLhyK1diBXFIDqTsKdBiQQJWBp2MzN6T+8Zvm+RMKsO7chxHMdH3eJDoAf3
	 aTphELwe62mK6fPRsH01MWKf/f/+bz4HWgauJmc9s9JwB1/YlQ6FhHGc3P5N0cHP1X
	 HGP+b2iZakZVA==
From: matthias.bgg@kernel.org
To: dan.carpenter@oracle.com,
	johnson.wang@mediatek.com
Cc: linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] PM / devfreq: mediatek: Fix unnecessary check of drvdata
Date: Mon, 20 Jun 2022 17:43:47 +0200
Message-Id: <20220620154347.14756-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_084357_850680_76A605BA 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Probe function will error out if drvdata 'mtk_ccifreq_drv' is null.
So when mtk_ccifreq_target get's called, the drv pointer will never be
NULL. This fixes a static checker warning.

Cc: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 71abb3fbd042..ad05b152071d 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -132,9 +132,6 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
 	unsigned long opp_rate;
 	int voltage, pre_voltage, inter_voltage, target_voltage, ret;
 
-	if (!drv)
-		return -EINVAL;
-
 	if (drv->pre_freq == *freq)
 		return 0;
 
-- 
2.36.0


