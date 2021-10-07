Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD34C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F9A60FD8
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 23:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8F9A60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0qjRRLcpEE1lpINsNfkT537x1uCnVOy9EZFmu+JfXIY=; b=dGR6yOi9ja7dK6
	ODQ48HjPFIEUNhOI5cILVMFEtTwzF6PNv6898t3cq/Sk7REXeriJ7QK3DvYc+acDeOxzjNWBEjHCv
	2L73tyqmftjNnLfKgD2CXze0arADj4+T1jnHHQk2qO5Ydgdf0+vKJM7CS8DJtUSYkCqu4MqZapAHM
	VOCCQq+X6CCRugHZsjsK4ooRwVYX5Ncu5g25Vp1kKHGdHbCdwt1o1UEe6UrNqqvxz5mxy/anZRq+8
	IUwNDODjSWnzMtHPPxMZcEvmeOgeMpDhY/7FJOWnA+hP/4sEC4Czi+0/HXIMkGtaaci+isRxmGv28
	Ttdn5UqNhxfOwrrbm/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYd4g-0012bc-He; Thu, 07 Oct 2021 23:45:18 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYd1U-0011Om-Fi; Thu, 07 Oct 2021 23:42:02 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id BEA443F226; 
 Thu,  7 Oct 2021 23:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1633650113;
 bh=xcI8ZGeSFCk6ZEUuzxl7/qYwHZsqf/PSG6Ov6OHHj+c=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=BQiKBs9mshkGku5TLdxn8jGHo9Yi/4GPqHXGx1oRJUNuRW8z1ZcHZyP5tQZ86tRi6
 TlQb5HDR9kPEYFEfEY6EZT7iAG1vMiZbd+1+YYwU/SWlTjkmquB9O+sjrwtfebBmJI
 Ck5rfbED65Ls+eA5fWWPc752AmcyL2HNWLUCjH26DmqHKwpJxGtN9JrI1opsQUQcAx
 W0nJ9Nn1HurvlZRVkQez9WPti919HJZQMgW5kBRDe+KwgS8znuVMjTbevPqmJAdJlA
 uoXfVOeH1j4khNn+rVZiHJB6p6F5qhUoXeCmyN1CZtHdq8x54DB1vB4QPQFejn+hA8
 9VDH23jU9oBBg==
From: Colin King <colin.king@canonical.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@codeaurora.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mt7601u: Remove redundant initialization of variable ret
Date: Fri,  8 Oct 2021 00:41:53 +0100
Message-Id: <20211007234153.31222-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_164200_724291_E3719C24 
X-CRM114-Status: GOOD (  12.77  )
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

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read,
it is assigned later on with a different value. The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wireless/mediatek/mt7601u/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
index ed78d2cb35e3..457147394edc 100644
--- a/drivers/net/wireless/mediatek/mt7601u/dma.c
+++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
@@ -515,7 +515,7 @@ static int mt7601u_alloc_tx(struct mt7601u_dev *dev)
 
 int mt7601u_dma_init(struct mt7601u_dev *dev)
 {
-	int ret = -ENOMEM;
+	int ret;
 
 	tasklet_setup(&dev->tx_tasklet, mt7601u_tx_tasklet);
 	tasklet_setup(&dev->rx_tasklet, mt7601u_rx_tasklet);
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
