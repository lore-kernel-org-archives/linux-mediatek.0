Return-Path: <SRS0=9f7n=PJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EBCC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 08:42:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F974610C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Oct 2021 08:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F974610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=acdo6OFLiEtkZRCt6NClNIPViStMQQYwCUajiAlNSm8=; b=KV6OIz4rxIRjIY
	vW4I5zuCam5yfDc6IfRhuVh8Dd/RNIwSGQZNDGiuzmCCzV9cMtutZsmR9z8DbchTtAuyF2wPwf1Ay
	TnMChfC+j5M+Mx1ADz776WA0q0wRENNTGX+6GgOL1/4lJ+XzA6OMjf0CFTKavT2UnZXuqRjha18I8
	52Jz3z0YsA9UlCEv/7OypIGR2Bi5tgw+ZsqlidaD1GraA5pFRPkbJrB2FpAOS+HHhmTIJUcAJZOtY
	3T202P9usGJTWzCfwFKFnYtOZY675zHMns6ulHnap3eEijh7Pn/ifALlb/r8ZiX1lJZ9O92/4Pjxp
	FEt8KWD/dsRVFDpYKbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdTeP-006s1T-Mm; Thu, 21 Oct 2021 08:42:13 +0000
Received: from mx24.baidu.com ([111.206.215.185] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdTeC-006rwj-RS; Thu, 21 Oct 2021 08:42:02 +0000
Received: from BC-Mail-Ex10.internal.baidu.com (unknown [172.31.51.50])
 by Forcepoint Email with ESMTPS id 3E3446DF737E714A94FD;
 Thu, 21 Oct 2021 16:41:53 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex10.internal.baidu.com (172.31.51.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 21 Oct 2021 16:41:52 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 21 Oct 2021 16:41:52 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <caihuoqing@baidu.com>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi83@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, "Kalle
 Valo" <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] mt76: Make use of the helper macro kthread_run()
Date: Thu, 21 Oct 2021 16:41:49 +0800
Message-ID: <20211021084150.2130-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-EX02.internal.baidu.com (172.31.51.42) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_014201_118711_620ED5F1 
X-CRM114-Status: UNSURE (   9.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Repalce kthread_create/wake_up_process() with kthread_run()
to simplify the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/net/wireless/mediatek/mt76/util.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/util.h b/drivers/net/wireless/mediatek/mt76/util.h
index 1c363ea9ab9c..49c52d781f40 100644
--- a/drivers/net/wireless/mediatek/mt76/util.h
+++ b/drivers/net/wireless/mediatek/mt76/util.h
@@ -70,17 +70,15 @@ mt76_worker_setup(struct ieee80211_hw *hw, struct mt76_worker *w,
 
 	if (fn)
 		w->fn = fn;
-	w->task = kthread_create(__mt76_worker_fn, w, "mt76-%s %s",
-				 name, dev_name);
+	w->task = kthread_run(__mt76_worker_fn, w,
+			      "mt76-%s %s", name, dev_name);
 
-	ret = PTR_ERR_OR_ZERO(w->task);
-	if (ret) {
+	if (IS_ERR(w->task)) {
+		ret = PTR_ERR(w->task);
 		w->task = NULL;
 		return ret;
 	}
 
-	wake_up_process(w->task);
-
 	return 0;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
