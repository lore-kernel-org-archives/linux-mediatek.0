Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9B7C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 01:49:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C21E76101C
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 01:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C21E76101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WuKiZBMq6meBRxY96xdsnH1RatfSJRs3KlgwcKWF7WM=; b=M5t5FBTo3OSfus
	WlyaXyEGhXvZD5ySP5XwFV482ce9JsIMRciXzVbHwX62AGICkWDWZyfenVQBEBOY4r/7yERKC9Nte
	WDpLNUHvTsMBdpUoDMuSt7UFJbHNqGQ+8t6jgl2KvNfsNY7YvpmpAjnAPiIJm1IMsPc006oWRmmuc
	Uc2AMiDwowtXmqw6eZSAb1i9Pu/ZDDmI9KB5kyftVMSXrh790SsJql4+mjhRay379zMw9Xr60luuE
	R8F1XPxCt+7auUlNCXDnTMkt1VRawL7MAYV9SBu5wXHApGSGOBGy5la7RPG7wTvRKqVCHW/C5NEpF
	BIvXJPBoq1Ccgr6IeosA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8vAT-002ptW-T8; Thu, 29 Jul 2021 01:49:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8vAQ-002pt3-3o; Thu, 29 Jul 2021 01:48:59 +0000
X-UUID: 5c857897cf49451bb2fc08fb1676fe6a-20210728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5SBhqj0TCbQ/ZjxOccKF0h22E7GaZaGFdB+oidsI2MY=; 
 b=QZTPY6fB3OvZ9Lp3TzfU/byh3N5ZNjc5P++2OlIxoupKMgimXt5JHL5dsXTvxJ2rDaDA2CD7FbN+z9MCrBGaxrriqUH4kMXkhkjW/L5CPAYSFtXEeAfzkjN0XCpXI9vEjO0Dht0GL4sJgK5X6v/Y+HN7Tn7URD0QKmjjvcNSb3U=;
X-UUID: 5c857897cf49451bb2fc08fb1676fe6a-20210728
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 595230326; Wed, 28 Jul 2021 18:48:52 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 18:48:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 09:48:49 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 09:48:48 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <timur@kernel.org>, <linux@armlinux.org.uk>, <alcooperx@gmail.com>,
 <tklauser@distanz.ch>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <yuchen.huang@mediatek.com>,
 <huihui.wang@mediatek.com>, <eddie.huang@mediatek.com>,
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH v1 0/1] Mediatek uart patch 
Date: Thu, 29 Jul 2021 09:48:16 +0800
Message-ID: <20210729014817.11879-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_184858_209956_5D91870A 
X-CRM114-Status: UNSURE (   9.34  )
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

This series includes 1 patches:
1.fix uart corruption issue when rx power off

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
The code path:
https://elixir.bootlin.com/linux/latest/source/drivers/tty/serial/8250/8250_port.c#L1917
mtk8250_dma_rx_complete is a task of mtk_uart_apdma_rx_handler.
mtk8250_dma_rx_complete priority is lower than uart irq
handler(serial8250_handle_irq).
if we are in process of mtk8250_dma_rx_complete, uart appear BI
interrupt:1)serial8250_handle_irq will priority execution.2)it may cause
write tty buffer conflict in mtk8250_dma_rx_complete.
So the spin lock protect the rx receive data process is not break.

Changes in patch v1:
1. remove processing mechanism which count value is 0.
2. change patch title and commit message.
3. explain the detailed reason for the patch in changelog.

Zhiyong Tao (1):
  serial: 8250_mtk: fix uart corruption issue when rx power off

 drivers/tty/serial/8250/8250_mtk.c | 5 +++++
 1 file changed, 5 insertions(+)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
