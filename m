Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216AAC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:50:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD85B60FED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD85B60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nRsnWwpGpAmDp+2aJPUHs1DY0ZfQemT1WpxuptrAlU=; b=Zf1ONLsNLzqHS8
	dDZBbqiKxiApNctxFGWnD5jfHv4ijLxdmKroTsKo1KcKoMasvyyeasA28v5D5wlCUO7JQ5/5UwlUV
	/wqD/Up6NYABuqdQy2wULT3z7PKbC1y+z4zTOWAlDKWJUSksP+ArOqCj/RBbqmQTKn9gX3TE2+OGn
	RYvwkN1+Ptj7/dZI2olq8J8eFCgSMi277vj6B1vJuwM27tA+iNjPdxfyWz3hmsFVkc/qNheXnevxM
	q7nhVmjrFRFoOS/WvRI3Fs7pgNORvr36jUJAvolMH2si2rELKZFUv2Sd8zVvqGTBISwbVAxm82ca5
	Pc8fdedSC43LknBPe5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m91kS-003YNN-OU; Thu, 29 Jul 2021 08:50:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m91kP-003YLg-13; Thu, 29 Jul 2021 08:50:34 +0000
X-UUID: 957b2916f4084bc48c8a7dc6e370bdee-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XJ33CG0m+svLNFoWArLdQSxJE17P5OlOxX7g0fXTCkU=; 
 b=Y8RIPEtwV64pjd1iUMeBhD+R2ZEAIU9N0iZOHb1F5HUCw6+3U98pNbWDeVe5ARt9pUweraKJEYWgsGrcCuTM3RngieIc/QwUbplf+cWGqmXImgCHq0fgZMGrqW0ttUAcpgWeolo8rGXhDrAY9mBAA/uh6OEn0yfAZnOhUllK6+g=;
X-UUID: 957b2916f4084bc48c8a7dc6e370bdee-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 125147074; Thu, 29 Jul 2021 01:50:27 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 01:47:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 16:47:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 16:47:13 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <timur@kernel.org>, <linux@armlinux.org.uk>, <alcooperx@gmail.com>,
 <tklauser@distanz.ch>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <yuchen.huang@mediatek.com>,
 <huihui.wang@mediatek.com>, <eddie.huang@mediatek.com>,
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH v2 1/1] serial: 8250_mtk: fix uart corruption issue when rx
 power off
Date: Thu, 29 Jul 2021 16:46:40 +0800
Message-ID: <20210729084640.17613-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210729084640.17613-1-zhiyong.tao@mediatek.com>
References: <20210729084640.17613-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_015033_164701_CFA99E7D 
X-CRM114-Status: GOOD (  11.31  )
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

Fix uart corruption issue when rx power off.
Add spin lock in mtk8250_dma_rx_complete function in APDMA mode.

when uart is used as a communication port with external device(GPS).
when external device(GPS) power off, the power of rx pin is also from
1.8v to 0v. Even if there is not any data in rx. But uart rx pin can
capture the data "0".
If uart don't receive any data in specified cycle, uart will generates
BI(Break interrupt) interrupt.
If external device(GPS) power off, we found that BI interrupt appeared
continuously and very frequently.
When uart interrupt type is BI, uart IRQ handler(8250 framwork
API:serial8250_handle_irq) will push data to tty buffer.
mtk8250_dma_rx_complete is a task of mtk_uart_apdma_rx_handler.
mtk8250_dma_rx_complete priority is lower than uart irq
handler(serial8250_handle_irq).
if we are in process of mtk8250_dma_rx_complete, uart appear BI
interrupt:1)serial8250_handle_irq will priority execution.2)it may cause
write tty buffer conflict in mtk8250_dma_rx_complete.
So the spin lock protect the rx receive data process is not break.

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
---
 drivers/tty/serial/8250/8250_mtk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index f7d3023f860f..fb65dc601b23 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -93,10 +93,13 @@ static void mtk8250_dma_rx_complete(void *param)
 	struct dma_tx_state state;
 	int copied, total, cnt;
 	unsigned char *ptr;
+	unsigned long flags;
 
 	if (data->rx_status == DMA_RX_SHUTDOWN)
 		return;
 
+	spin_lock_irqsave(&up->port.lock, flags);
+
 	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
 	total = dma->rx_size - state.residue;
 	cnt = total;
@@ -120,6 +123,8 @@ static void mtk8250_dma_rx_complete(void *param)
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
