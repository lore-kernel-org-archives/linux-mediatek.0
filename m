Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F700CA0FE6
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Sep 2023 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4f6bHYegSQwLCn6VtkijdaC7TwfrnHHXgXJt1Fm7i68=; b=mWJ3fqzkkXOtdfeHmyaLCjFlxy
	wdpnS8B2QbMRPWtLlq6VbtrxFDX6Zez/gBE7/bQEyE2JIUWmysqKyf0c7a+1tqYYjNYAErILilAZB
	BXyQXongtC3ztizVkXEwAnqb612txNVOXNsYsKBMijsPSxD/SYbNsD4y/SL1K3wGRAjD18SZjIXQ2
	E2O8S76JKyX1RyzqikxychY+4HLFOvhT2vPOKqN5HQFdqJsIPawIUex5Oef8XZs4UaeTCYnomTDo4
	y+iKh58bigtMOGBGpEOwKKE+6cXOu1Ff4a9aYNqL8A7/8UE2Gkzt1luCngxDx1wXPh+VSjvjWcmWM
	xnIsq34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzPv-00GgM1-35;
	Fri, 01 Sep 2023 08:22:11 +0000
Received: from forward103c.mail.yandex.net ([178.154.239.214])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbzPs-00GgG9-1f
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Sep 2023 08:22:11 +0000
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:9396:0:640:dd2a:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id 392406028E;
	Fri,  1 Sep 2023 11:20:56 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id sKOYUPfDWSw0-6NnMzerT;
	Fri, 01 Sep 2023 11:20:55 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1693556455;
	bh=4f6bHYegSQwLCn6VtkijdaC7TwfrnHHXgXJt1Fm7i68=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=KgCaNl7Y6g+eBCudZcpYO/5ZhQpfYFR4NkSA11lbg0KPmcxZ+SpjU5BdWNlZ1dxBK
	 /IDSYj0SeBY7VVx8NZ9HQ/AlqVjz2twZSEJ+khIrmiGdTIwl7ek8hBS/hag/cLXCMf
	 EfppGVUpL8uHO1SAKSwwIUr4klhxIxMQ7yKRM5gE=
Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Felix Fietkau <nbd@nbd.name>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: mt76: add DMA mapping error check in mt76_alloc_txwi()
Date: Fri,  1 Sep 2023 11:19:04 +0300
Message-ID: <20230901081908.44399-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_012209_006883_8CA7634B 
X-CRM114-Status: UNSURE (   7.65  )
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

Add 'dma_mapping_error()' check in 'mt76_alloc_txwi()'.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/mediatek/mt76/dma.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
index 05d9ab3ce819..5af666f03398 100644
--- a/drivers/net/wireless/mediatek/mt76/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/dma.c
@@ -53,6 +53,11 @@ mt76_alloc_txwi(struct mt76_dev *dev)
 
 	addr = dma_map_single(dev->dma_dev, txwi, dev->drv->txwi_size,
 			      DMA_TO_DEVICE);
+	if (unlikely(dma_mapping_error(dev->dma_dev, addr))) {
+		kfree(txwi);
+		return NULL;
+	}
+
 	t = (struct mt76_txwi_cache *)(txwi + dev->drv->txwi_size);
 	t->dma_addr = addr;
 
-- 
2.41.0


