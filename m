Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C18C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717A2611CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717A2611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tEXT3BNDr3tn1X0fbR33FUqEUzUxrk5mNLDinyYRarw=; b=TMgRsRTZ7i67SYIIutCvKre1V
	ITkFqHpG7Dbu3D4BJD309LDm+9IOhUZJyVXA+bSNxOxi0LeNrDIk0bKaXlZ/cdyOVYY29nps7LqlL
	IcgZdKuAUgsIV8YApY057GzbOD08Y5Q0TnqmIvDa/P/xO91adlxhHUDf/KFZEJM7z3SfBoH4axP4Y
	PZIBwRbIP/KBayvTcQlHBmmmrpwv2ES7TrOqoups5YKvRmvsjJ1XRMA9fDbf1xpOljoHUaAsB2hOw
	ROHuiwAWZIGn1ZF+CBotaoCjJJFl6mw2MSqLNYIFBHqCrk02i6q4XFEqSq0hbhVG21YYlFOSoEY99
	EqGZsqcdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXekb-004ZdI-JI; Sat, 17 Apr 2021 06:48:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXejl-004ZWz-8A; Sat, 17 Apr 2021 06:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=2BszMA+s/npWpdp2FT1NrrT0cLZio+y8nB6lxrcnBao=; b=aVjZShzUHMeTW2GTeGwRATAq/a
 4sY5LhFS0uQTFFvXH+GcbLl+nU97mOakQfO9OcsTuvU/QEonVOmiWr3+QS0iJpUWLK52O8x8of6aV
 eTva9k2pYzeyau23Gk/4znOMZ65cuPJgdo07TaoROxN/d4fvABlrpLMKHxNnxdEfUqgUsgg6e44nh
 sJpOwaxYoeXytyVX58Np3U0ReBtMWA+GgqhSb29E/SyE5gmDum1dEtmLPteCPCZLcetVMMeHDOEcy
 Mjku2kCPWvAumgNZfFSAxHqLlN9vXyw2NJJ+/+8b3drOyqPRfQqfZxI7uU5jVxyCwKtwAd6JA2cT1
 slvJl/Zg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXeje-009uBt-QC; Sat, 17 Apr 2021 06:47:24 +0000
X-UUID: efc626556fbc4525afae1b9be9a5d15f-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2BszMA+s/npWpdp2FT1NrrT0cLZio+y8nB6lxrcnBao=; 
 b=M6+KM2DxghT9Y4SkBI/1KIMCr0suF/Z/GZ4ad9WOoEbjFZy/CTDOuRoVItFl1AcZMK4H/LB4tHLMpHnlwyRaKVHqfZQKfw/ndjjBJ19oAqoKlCZQa8pEmefDTFf6l18ZldMfimrYV/us9sISr76pWG1BSllqg1CBdvs7ceEesJg=;
X-UUID: efc626556fbc4525afae1b9be9a5d15f-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1758574514; Fri, 16 Apr 2021 23:47:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 23:47:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Apr 2021 14:47:09 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>
Subject: [PATCH 2/3] i2c: mediatek: Fix wrong dma sync flag
Date: Sat, 17 Apr 2021 14:46:51 +0800
Message-ID: <1618642012-10444-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_234718_890290_009446F3 
X-CRM114-Status: GOOD (  11.38  )
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

The right flag is apdma_sync when apdma remove hand-shake signel.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 3e34261..bf25acb 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -479,7 +479,7 @@ static void mtk_i2c_init_hw(struct mtk_i2c *i2c)
 {
 	u16 control_reg;
 
-	if (i2c->dev_comp->dma_sync) {
+	if (i2c->dev_comp->apdma_sync) {
 		writel(I2C_DMA_WARM_RST, i2c->pdmabase + OFFSET_RST);
 		udelay(10);
 		writel(I2C_DMA_CLR_FLAG, i2c->pdmabase + OFFSET_RST);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
