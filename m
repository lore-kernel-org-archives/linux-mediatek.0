Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C64C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 12:05:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 011C6613D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 12:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 011C6613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ERvwdiEMaWbac3m5xIuUmjsKGBQkTNmGmnAz1ERNino=; b=1EtOD036/LhCJZ
	BrZhIoo4DTsCtZNvx0WrfvOMOIYEtLJUqv9gut5xYz9CjLdsrGCT34J+Wpq+4MY1QOkaI5G5WIq9f
	LJOt2gx3cUSLqDltp4RE0fHp3Y12RMIaxQ6fVpLSM4polaTMCAJG5qNtc7znI2upaMPPrsTdvUVfK
	ZQb2FBF81YwH1H281dVLf3Omisnpyy6nFW8SZeCmAP2F7t6oLFQ0O8h8GB8528F6pFmM2KPGPJnhB
	UYT9CBVbCnhTQSWx0VjuI4UXTtJbbdZ8XQz559IPOeydOP0KmN6YvLyiQWAsQpb0aN6lZKKXmI2Ox
	ynR9aWh7CFgSYO+9q7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmEkw-005aU9-B3; Thu, 27 May 2021 12:04:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmEkh-005aNb-7q; Thu, 27 May 2021 12:04:40 +0000
X-UUID: bd51d7d603ee486b96bb974da09acca0-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=iXV1clKuJZGmHnXxbFP2RUidl3KpjxAneLIqQUqlq2Q=; 
 b=KkCXK3VhBIoby6WuS57x3ZMsoczDhZ/5A9zGir2ENekXIRBkHKnuibhIvAj3NrugvhtCxHhva7IKcrutoFXpQXMTbnbSLtlWZXDKurnO+s6RUUydpdjPE+Yl5U1TCrmUJqA/jzS/qpI+5e/uieICbHYzunyF52GT9DuIoPscwDM=;
X-UUID: bd51d7d603ee486b96bb974da09acca0-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 116977869; Thu, 27 May 2021 05:04:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 05:04:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 20:04:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 May 2021 20:04:07 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>
Subject: [PATCH] i2c: mediatek: Disable i2c start_en and clear intr_stat
 brfore reset
Date: Thu, 27 May 2021 20:04:04 +0800
Message-ID: <1622117044-7583-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_050439_328316_C7D40324 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Qii Wang <qii.wang@mediatek.com>

The i2c controller driver do dma reset after transfer timeout,
but sometimes dma reset will trigger an unexpected DMA_ERR irq.
It will cause the i2c controller to continuously send interrupts
to the system and cause soft lock-up. So we need to disable i2c
start_en and clear intr_stat to stop i2c controller before dma
reset when transfer timeout.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index ea337ba..bfd80b2 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -479,6 +479,11 @@ static void mtk_i2c_clock_disable(struct mtk_i2c *i2c)
 static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
+	u16 intr_stat_reg;
+
+	mtk_i2c_writew(i2c, I2C_CHN_CLR_FLAG, OFFSET_START);
+	intr_stat_reg = mtk_i2c_readw(i2c, OFFSET_INTR_STAT);
+	mtk_i2c_writew(i2c, intr_stat_reg, OFFSET_INTR_STAT);
 
 	if (i2c->dev_comp->apdma_sync) {
 		writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
