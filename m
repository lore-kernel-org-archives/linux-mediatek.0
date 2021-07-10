Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C5FC07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 09:01:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81AD1611CD
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 09:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81AD1611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+rsLokMiL1w6/V/JWI0NswzQyNqIMbPm1apUpDDsvs=; b=g730F1vPuUOveA
	Jkkil0UNCpVrgvoN3T+bVgsonaQVjXVGV5PKxdAp5b7RVdekIw2MnT/oHLnXEV8B6QRFzKQs7HsC4
	2Djd6ZkBTBtyOFq6mu1hAmyuQl207SL7nZAW0TNRAXuUrwpGJNjv197cb/knM2u0ch928wRR4e8is
	LoZ+T3EAX+o1R7Bn8916+Ix/Wc9+Ls7mloAIK2d/lyJemFKrZThkdjEacVjXkojYgkVb7BYH/N81f
	UONLHDoKz0uh+C2VS1/yeOA/G577O7R1HRw2n+VOACw06iOPqJpZJhklnZyTGENN3u5aKJHMHrp7v
	eSErdUvgv19BtqwsJMkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m28ra-003Pe1-LP; Sat, 10 Jul 2021 09:01:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m28rR-003Pby-0n; Sat, 10 Jul 2021 09:01:22 +0000
X-UUID: 170370b4af8740cfb6c70c6a38192913-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CSbWgXbhqSuJgriKSy6ecczMWFwLOB2XqObfMGjC9wk=; 
 b=LGhnJ0d//zBb0to2v1junF0gxcA9H1VnI79al6G1lS16nzQtmgRmbn2S4/o0UxIUqFDTJs7uLj4F8tGdBsZjI2jTr3xirfk7YeA4Ldp3q4HU/3vHYoIhV/cs2fLQ9YbAbUHV0/EchkQkncnAl/SehZNjMj6ybYOKRp+zjY9GGCI=;
X-UUID: 170370b4af8740cfb6c70c6a38192913-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 858932090; Sat, 10 Jul 2021 02:01:17 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 02:01:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 17:01:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 17:01:05 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <timur@kernel.org>, <linux@armlinux.org.uk>, <alcooperx@gmail.com>,
 <tklauser@distanz.ch>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <yuchen.huang@mediatek.com>,
 <huihui.wang@mediatek.com>, <eddie.huang@mediatek.com>,
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH] uart: mediatek: fix memory corruption issue
Date: Sat, 10 Jul 2021 17:01:03 +0800
Message-ID: <20210710090103.2643-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210710090103.2643-1-zhiyong.tao@mediatek.com>
References: <20210710090103.2643-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_020121_467030_62BD52DD 
X-CRM114-Status: GOOD (  12.90  )
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

This patch is used to fix memory corruption issue when rx power off.
1. add spin lock in mtk8250_dma_rx_complete function in APDMA mode.
2. add processing mechanism which count value is 0

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index f7d3023f860f..09f7d2166315 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -91,12 +91,15 @@ static void mtk8250_dma_rx_complete(void *param)
 	struct mtk8250_data *data = up->port.private_data;
 	struct tty_port *tty_port = &up->port.state->port;
 	struct dma_tx_state state;
-	int copied, total, cnt;
+	unsigned int copied, total, cnt;
 	unsigned char *ptr;
+	unsigned long flags;
 
 	if (data->rx_status == DMA_RX_SHUTDOWN)
 		return;
 
+	spin_lock_irqsave(&up->port.lock, flags);
+
 	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
 	total = dma->rx_size - state.residue;
 	cnt = total;
@@ -104,9 +107,11 @@ static void mtk8250_dma_rx_complete(void *param)
 	if ((data->rx_pos + cnt) > dma->rx_size)
 		cnt = dma->rx_size - data->rx_pos;
 
-	ptr = (unsigned char *)(data->rx_pos + dma->rx_buf);
-	copied = tty_insert_flip_string(tty_port, ptr, cnt);
-	data->rx_pos += cnt;
+	if (cnt != 0) {
+		ptr = (unsigned char *)(data->rx_pos + dma->rx_buf);
+		copied = tty_insert_flip_string(tty_port, ptr, cnt);
+		data->rx_pos += cnt;
+	}
 
 	if (total > cnt) {
 		ptr = (unsigned char *)(dma->rx_buf);
@@ -120,6 +125,8 @@ static void mtk8250_dma_rx_complete(void *param)
 	tty_flip_buffer_push(tty_port);
 
 	mtk8250_rx_dma(up);
+
+	spin_unlock_irqrestore(&up->port.lock, flags);
 }
 
 static void mtk8250_rx_dma(struct uart_8250_port *up)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
