Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5708C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 11:56:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 867C061178
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 11:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 867C061178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SMS5GyeIajG6fXtE5uP5IUmMwsaW06LoZM816x3tt50=; b=gtn+QioovLx4I+6LfeIDTDWUmK
	Hf3vePxKuKGdp8a/u+dPDEobHwS+YZonyqjxqtX4R+5jSJPpTATvfi9hoF6K8H6CCmeprA15eksFt
	XZoR2n3Wmz6MyZP3jP0lJj5GFvqq4JD0Fl5hxhBWIqJ1lfnJGFboVQvmsy0yeC7xKPbTFJEpNSyb6
	lVVs2zi746RfAJeunBeW5FIEbPOnuYbOKpPDsYCQr1MEYPML+/ucz+6/iour+qhz5qmMHTb9SW1AQ
	97Q25ewwwdhIG3hOrZqY5Bbq8oSIl7XLYEZ949L6NJQ92Z3LTQFOK1a9tYrW+A3gW83IuvQst3vff
	b2l7dt3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lazr5-007Xnr-FR; Mon, 26 Apr 2021 11:56:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lazqt-007Xle-7K; Mon, 26 Apr 2021 11:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=O1BkcKCnTvCbuoEYkLMRDYyeDiUJ63VH5SsbNsf6VCo=; b=npofQ9uYfsj7uQaRoViO4JEVX3
 nOknsDHlRjo/csDgQaH5W/ftML28RjytD3/FQiCsDNosYq+SAyngr1uyNB5htSEYglK8WYYb+836X
 s8hLaQmX/eKA73qOeAR+5YyjUyI/0cXE+L0kAeBEVeybVhqLvo8qNGsIL+QDLLAUjn8KmOSU2RdSf
 U6jrb/V8SE9FIjX2DwbtKD0iG+EWURobqggdfi0ojsAhy8g3CnmdllkW7xu5P3F/0rMYIMByMKEeh
 oTBvyS/Mc5pV6GvRO/EG9oC6XtkJd3T5Z/qDRz9xzSxISatgsUBBN2XDJpnBoTYeIRpUeJ1dsjxQH
 r01arbiQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lazqq-00FwAX-0o; Mon, 26 Apr 2021 11:56:33 +0000
X-UUID: be7bbb99c41d4ed79e0178e6a4d59f6a-20210426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=O1BkcKCnTvCbuoEYkLMRDYyeDiUJ63VH5SsbNsf6VCo=; 
 b=tCSTRGJbWdh2QTCOWp01Fde8j73Fd0iRs8oTE4OEUxJyhx7uYqDfAJ7Du5Y9jBy+MLYFy8wNTy43Mz7UH9QTQWFptzw/6QU9MKFWsSW9M997rjD1Sa+JjdO4V2j6DPsG+IdMpiI6OkiLcfM+loWSURmILBIslt1C9QK6W+LdzeI=;
X-UUID: be7bbb99c41d4ed79e0178e6a4d59f6a-20210426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 720530267; Mon, 26 Apr 2021 04:56:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 04:46:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 19:46:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Apr 2021 19:46:19 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>
Subject: [PATCH] i2c: mediatek: Rename i2c irq name
Date: Mon, 26 Apr 2021 19:46:15 +0800
Message-ID: <1619437575-23482-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_045632_091125_41951C2F 
X-CRM114-Status: GOOD (  11.22  )
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
