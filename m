Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D238EC43334
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jun 2022 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I3vLvoxct9ByslXluWgixU2nw8J89XIf2S2ZSHXcOsQ=; b=zIoY1EYqETQNaH99piA6/kgbRb
	4wHvpmRMhE+ZCkGp0vDlaXhChohu+/uEP8Enxn5jotM7ixb/PT1BaSqAymrrARRLGm/Q0dJVLLt2O
	QYtlveFcN9ZY3fTpGXpJb5Ikfb9MSJzI24+oX5q27vAi1lrPoPPhzvpwuLdL+Sp6SMIANVU6HLfgY
	6ticTeZl6xyl0RHi2quzPsrchP3eKFkQmcb6+SC1jVgMSec31LPyAieZvpuEhJtkH46uNws+32sKb
	40vzniSxl0pI6LagQkdM8eqOnpJO0Fnnm+sbAYSxBqiUvvdaHKvPJe0+11tnWOlUZOrveRnfBIHis
	PHVB8Z2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Y5u-00BOv8-Vk; Sat, 18 Jun 2022 13:02:31 +0000
Received: from smtpbg138.qq.com ([106.55.201.18] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Y5g-00BOps-5I; Sat, 18 Jun 2022 13:02:21 +0000
X-QQ-mid: bizesmtp90t1655557292terbxivu
Received: from localhost.localdomain ( [125.70.163.206])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 18 Jun 2022 21:01:27 +0800 (CST)
X-QQ-SSF: 01000000002000D0I000B00A0000000
X-QQ-FEAT: hAQ2xUxVESxJFg0WB9u41LXUwqDfZn4GaCTsfAn4T20imGjVopH5O7LZcG2lH
	nj3VQsAkX8YI6WJm6qWWUnXouOAsWJI88i9rmIdFy6SD8V0r3UDlxwgXI71nHAnfErpgte9
	/TyOSxv+tOPKA3qw280CrncSF/dvl6JzYL+inSCk1rRNRdtag0n98wPkcUQ91FsM1D4ma7d
	bPrH7xQ8Auz0QFh/Od7tqXS1VoQ+pnlf60XzopBAYm13ZvuJiSu6dQ8/k7VY39d/+XaHQJC
	KquW7J70+KIsdlNd6a54cAmiJAf+/WzaA8Z2mCXsMC37lvUdq70WNAKFg=
X-QQ-GoodBg: 0
From: Xiang wangx <wangxiang@cdjrlc.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org,
	matthias.bgg@gmail.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH] dmaengine: mediatek: mtk-hsdma: Fix typo in comment
Date: Sat, 18 Jun 2022 21:01:20 +0800
Message-Id: <20220618130120.9783-1-wangxiang@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_060216_590037_B4D5E6B5 
X-CRM114-Status: UNSURE (   9.38  )
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

Delete the redundant word 'be'.

Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
---
 drivers/dma/mediatek/mtk-hsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index 9ebd9231f62f..a72e5a096c5c 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -761,7 +761,7 @@ static void mtk_hsdma_free_active_desc(struct dma_chan *c)
 	/*
 	 * Once issue_synchronize is being set, which means once the hardware
 	 * consumes all descriptors for the channel in the ring, the
-	 * synchronization must be be notified immediately it is completed.
+	 * synchronization must be notified immediately it is completed.
 	 */
 	spin_lock(&hvc->vc.lock);
 	if (!list_empty(&hvc->desc_hw_processing)) {
-- 
2.36.1


