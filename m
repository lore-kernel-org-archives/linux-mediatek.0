Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F08C4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 11:39:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DCE061355
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 11:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DCE061355
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SMS5GyeIajG6fXtE5uP5IUmMwsaW06LoZM816x3tt50=; b=1XsWFQbFr9iEDa
	r4DVHktyVKRqqJk+NZFGG4lpU+u+M6u3Y8jA4UybbLjhH3mqDvePeC6rc9SfrA0U3OJ0PVGRbsoFC
	AoVP4bLAa0WYrqi71dC3+mppk4k+nSD+AIzRKOomXDogxDv1eNT3SRbwa0HW4VqoziuNvrtvQ/W04
	XnptXkalXITUYsjscKW+i/QqQmN+zVSP8isjUkrxaq8gbUa9pWbpj+GmccnRSYcNNDfr7gilVlQmn
	sKjoNNYg1lMteLOxcXimmVNdBcSMrlwl2pHujrVNwu2pgb2B0BgKcp3wufAv/AHSnowp7UTIZKBZs
	bgPvv+Vr3pagUjFXPMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmEML-005MVu-3A; Thu, 27 May 2021 11:39:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmELv-005MGd-R0; Thu, 27 May 2021 11:39:06 +0000
X-UUID: 939abcfcb25b4d0890d4cf79a567ffba-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O1BkcKCnTvCbuoEYkLMRDYyeDiUJ63VH5SsbNsf6VCo=; 
 b=YocAv/NYRX09jAQa8QV5zKFy4kDPKlyD2uwkfV76WJf5AyHyk0kMsL4ESe8kf/lChfdjm5DhZY4Dq7Xnu/tNV7qoQWWgLQto/d7Qx/baW0R2FGvAJiqTjzEfMhGO0MRh5DjjR84YFrLbEh6kCHlS2PZ6NRDxxWCDNlXVqX3pR+E=;
X-UUID: 939abcfcb25b4d0890d4cf79a567ffba-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1553752353; Thu, 27 May 2021 04:38:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 04:31:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 19:31:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 May 2021 19:31:57 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>
Subject: [RESEND] i2c: mediatek: Rename i2c irq name
Date: Thu, 27 May 2021 19:31:50 +0800
Message-ID: <1622115110-7051-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_043905_316340_2704F58A 
X-CRM114-Status: GOOD (  11.42  )
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

Rename i2c irq name with dev_name() which can provide unique
naming in /proc/interrupts for each instance of the I2C IP core.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e..ea337ba 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1281,7 +1281,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, mtk_i2c_irq,
 			       IRQF_NO_SUSPEND | IRQF_TRIGGER_NONE,
-			       I2C_DRV_NAME, i2c);
+			       dev_name(&pdev->dev), i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev,
 			"Request I2C IRQ %d fail\n", irq);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
