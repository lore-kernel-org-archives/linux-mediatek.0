Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE3EC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 00:43:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A8922272
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 00:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbuRH4p1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14A8922272
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8edlq/nnBjyG++XUn0vAkyRJjFrwwgAETUjgnzmpzh0=; b=CbuRH4p18lJAJIXE1TBN6xzNRD
	SpSaulBQVMUcu079DL+uAmJ37KTaYySzh7Le7IgiYdiRShigDavmuzPIWCuuAGffC2d51pMb4y5QH
	PCSQxzVqZlCvkQ7ds2X2btYYyffE+Z/RFY7q+gNjqmoREKdX4hu/joEZJ6PQv7xlr3J+7H97BJT3c
	FPeP3WmwM8zhUb0iMohI/v4Wg9D+gwA6spwYwwqIzFD8SzJ6DRxOS5r5x0ZDwxFaRSc2vTUdNP3qM
	7EDviib4XykBgLjYU9XmPWBr3pTCrPKpk4xt2raDMQCujroneTat4hFYM3smbQWl1CrVDguYNU4Da
	WggiS2DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUJGB-0004S6-Ot; Mon, 19 Oct 2020 00:42:47 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUJG8-0004RD-KO
 for linux-mediatek@lists.infradead.org; Mon, 19 Oct 2020 00:42:46 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7656D88266D34F4C0099;
 Mon, 19 Oct 2020 08:42:32 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 08:42:28 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <haotian.jing@mediatek.com>, <ulf.hansson@linaro.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.or>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mmc: mediatek: replace spin_lock_irqsave by spin_lock in hard
 IRQ
Date: Mon, 19 Oct 2020 08:43:13 +0800
Message-ID: <1603068193-44688-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_204244_944047_A3CBE2AF 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The code has been in a irq-disabled context since it is hard IRQ. There
is no necessity to do it again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/mmc/host/mtk-sd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a704745..fb3e419 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1536,13 +1536,12 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 	struct mmc_host *mmc = mmc_from_priv(host);
 
 	while (true) {
-		unsigned long flags;
 		struct mmc_request *mrq;
 		struct mmc_command *cmd;
 		struct mmc_data *data;
 		u32 events, event_mask;
 
-		spin_lock_irqsave(&host->lock, flags);
+		spin_lock(&host->lock);
 		events = readl(host->base + MSDC_INT);
 		event_mask = readl(host->base + MSDC_INTEN);
 		if ((events & event_mask) & MSDC_INT_SDIOIRQ)
@@ -1553,7 +1552,7 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 		mrq = host->mrq;
 		cmd = host->cmd;
 		data = host->data;
-		spin_unlock_irqrestore(&host->lock, flags);
+		spin_unlock(&host->lock);
 
 		if ((events & event_mask) & MSDC_INT_SDIOIRQ)
 			sdio_signal_irq(mmc);
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
