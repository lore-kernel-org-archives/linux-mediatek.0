Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rEQNEzjdRflv4WxAwJfuukwWtvikOWj/f9ORdiiA+94=; b=x8zBvNG0gsQbJH
	ymSBhoJKd7IJyZCBnMULVB8xQNSfnfhagoatgWWdQ9XHXw7GWJv+Pl+wtm7WzMS5KzSyG33P6qRg3
	bneRDgeWAWvzSV56SwNbhN9dp+yd5gJXu3xrcnv49Jfr/p6JjDtAg2z8EIIbiDwOhlX0csjGMdy9d
	Gbe5E6rRiJrnnRw0j7ni85PR0MsMiYXubpNZc53Gt11xgvwRxQIb9tnbVmUQ50A26hkDsZy+cRxQ5
	Dme1YqW5bInpXM+5JktDFYD/2jPRbZ+j+s4qFmBZYH9yA3H4d+c6S/WfEOHrV5Ar4oBmfnoDzLTzZ
	wPi8gQoyME3PfXE+idZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEXUp-009a4k-2m; Mon, 31 Jan 2022 14:17:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEXUc-009a3E-O8; Mon, 31 Jan 2022 14:17:20 +0000
Received: from benjamin-XPS-13-9310.. (unknown
 [IPv6:2a01:e0a:120:3210:2ed0:139:90e3:dfa5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 110431F433EC;
 Mon, 31 Jan 2022 14:17:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643638635;
 bh=oQeYQnRXQUqnbqQFQgb/37k7wXUdazy3hfN1laLB+Lk=;
 h=From:To:Cc:Subject:Date:From;
 b=L7deuu4aR2RlGFj1lAojoy+j3ez7MsMDwljPKt63ue2hcm1nxoSJXsyJABkSJPoK6
 usHml7nZaiwvoxg1jWn4ZvWAN8wh5pu0x4Phxsm0iAR6GZ4lNeaiFTy6E0xVbHnr0p
 4wpaUYA0fQ1sn53l1n5HeNay1uNaKczEH3t9f/sdzzjNFPpzJcmobwy3gyGfN2tMvr
 LnC5TqT2e0iiUvj+X40hDx1YcP4Cm1R4HlmGx4d0SKpI7ott5anBwu2ciox9I/kn5o
 7yz8buHkX7tO07/N/4mak/paJMOKRLhSH/n8AhsELs3YuaXkvYz17K8CloQODV5POS
 7H6NLkM+rTXvQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: broonie@kernel.org,
	matthias.bgg@gmail.com
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] spi: mediatek: Avoid NULL pointer crash in interrupt
Date: Mon, 31 Jan 2022 15:17:08 +0100
Message-Id: <20220131141708.888710-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_061718_959766_D007B06C 
X-CRM114-Status: GOOD (  13.61  )
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

In some case, like after a transfer timeout, master->cur_msg pointer
is NULL which led to a kernel crash when trying to use master->cur_msg->spi.
mtk_spi_can_dma(), pointed by master->can_dma, doesn't use this parameter
avoid the problem by setting NULL as second parameter.

Fixes: a568231f46322 ("spi: mediatek: Add spi bus for Mediatek MT8173")
Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index a15de10ee286..753bd313e6fd 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -624,7 +624,7 @@ static irqreturn_t mtk_spi_interrupt(int irq, void *dev_id)
 	else
 		mdata->state = MTK_SPI_IDLE;
 
-	if (!master->can_dma(master, master->cur_msg->spi, trans)) {
+	if (!master->can_dma(master, NULL, trans)) {
 		if (trans->rx_buf) {
 			cnt = mdata->xfer_len / 4;
 			ioread32_rep(mdata->base + SPI_RX_DATA_REG,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
