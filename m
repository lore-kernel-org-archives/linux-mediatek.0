Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2ADC18E5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 10:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7FC2051A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 10:50:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UF3tLZCq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7FC2051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DA1e5Adsfzut8E09MU1Gzol5D0NgUnCkodJxzHwF8E=; b=UF3tLZCqoW0UAM
	vbtRGMRKnB4qlSyAy1EgmGbueo71b1thuhCqqT2i1hE9pkZiuJPtrSzUb7Ksi5kdirW3/o7wo0chx
	mD15ENk6aQe8MwNAcOpPlSoLN5qOp6IRW/hTcIOn/0vXb444iLuZQ+GSNEs6kFFapgKPR7bupBa6P
	GkA+dgCQLNX6PKac+nk1i6FkANuRQK728CfnmhsRVpLaseXKjmipwf1McyGO3hd/ZW9wnUMMYHAzP
	Bt04YWCHgeYJ0z+bptMoPfwoHnPWm5B5tq94XR4dIbjq6ycRNEUOgwXY/52uawCXgG0Y0lxEQc5O1
	+fUjdfxwBeDtECVprv9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDnK3-0001FA-5O; Mon, 16 Mar 2020 10:50:15 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDnJk-0008H6-T1; Mon, 16 Mar 2020 10:49:58 +0000
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr
 [86.202.105.35])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 140FD24001D;
 Mon, 16 Mar 2020 10:48:29 +0000 (UTC)
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2] rtc: mt2712: remove unused variable
Date: Mon, 16 Mar 2020 11:47:01 +0100
Message-Id: <20200316104701.209293-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
References: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_034957_076211_6080DC07 
X-CRM114-Status: GOOD (  10.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

irqen is not used in  mt2712_rtc_set_alarm, remove it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-mt2712.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
index c2709c1602f0..617e397dd820 100644
--- a/drivers/rtc/rtc-mt2712.c
+++ b/drivers/rtc/rtc-mt2712.c
@@ -232,7 +232,6 @@ static int mt2712_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 {
 	struct mt2712_rtc *mt2712_rtc = dev_get_drvdata(dev);
 	struct rtc_time *tm = &alm->time;
-	u16 irqen;
 
 	dev_dbg(&mt2712_rtc->rtc->dev, "set al time: %ptR, alm en: %d\n",
 		tm, alm->enabled);
-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
