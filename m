Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66464C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 12:08:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070CD2087D
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 12:08:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zimn/1ND";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Rm4KKLoT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070CD2087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=32gESO4Jjf8AOrslbzZ0TxEZY5E7vkc02ESMmxHJEM0=; b=Zimn/1NDXGUlVR7hpmSem7s3T
	LbupiuMtsjb4JGlm1Bn1DbKTVLj6OlgefqxaVIvu57SL8lXoi56Tm2yajOi1sRhHiPtFuICtLmtQ0
	BbLNaBVxzCZt/G5bZsKyybIsmvyqMsi+IEOqTLGibEWauND7TW2++ER3ALhHDWIh7ZiVxEoMSOTGa
	eGBULBWzWFiytrU9flKFOyICH6lLgf+tqdPcnKdZ9Jpn2h1OjnwU85dO7XcgQtpCTBoDAdp2VrxWL
	QrlzXPPA/hdXD0w3fZvtkg6n4cTnoo6QYwaxlxQBtNh/qRe9LMKkguGU+HzKbo5pbJLy9BQER+Nx5
	7765KsgWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIsiX-0000RC-2r; Thu, 17 Sep 2020 12:08:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIsi0-0000AK-W3; Thu, 17 Sep 2020 12:08:18 +0000
X-UUID: 21331b402c9240568768ac62261daa2c-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/UJsD4aGQKHNNlqhauTDQNH407lOgYDSC2QDQ6aS8Wg=; 
 b=Rm4KKLoT/jbqBs2wZFipna7q4iSgc+QEylFgeR1uxwR2Kd0WMW9krrzP7RY2KeOKnD8UQR/GE6GQaAwZfPchZDnm0mSYFach38y3zpI+OOzss516hB1LtEoH5SW3xJ01QkH6bp8PLimyU3vdgSEKp7LyEPXWNChBs+tDpV/Oe2w=;
X-UUID: 21331b402c9240568768ac62261daa2c-20200917
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1759163; Thu, 17 Sep 2020 04:08:05 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 04:58:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 19:58:00 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 19:58:00 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH 1/2] i2c: mediatek: Fix generic definitions for bus frequency
Date: Thu, 17 Sep 2020 19:55:41 +0800
Message-ID: <1600343742-9731-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_080817_294197_CA9A72A2 
X-CRM114-Status: GOOD (  13.37  )
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
Cc: qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The max frequency of mediatek i2c controller driver is
I2C_MAX_HIGH_SPEED_MODE_FREQ, not I2C_MAX_FAST_MODE_PLUS_FREQ.
Fix it.

Fixes: 90224e6468e1 ("i2c: drivers: Use generic definitions
for bus frequencies")
Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index efc1404..a1978eb 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -681,8 +681,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int cnt_mul;
 	int ret = -EINVAL;
 
-	if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
-		target_speed = I2C_MAX_FAST_MODE_PLUS_FREQ;
+	if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
+		target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
 
 	max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
 	base_step_cnt = max_step_cnt;
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
