Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0C4C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 01:47:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56B5E60EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 01:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56B5E60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3cCezwHAg5x25piVaqsSpSaDgChFtB6oPZV+Kh+Ioc=; b=EWa1CiB0zALMhF
	+zepxXbdmScGdkoWW0zDWoBNpfVCEey1ehnQbpZide2uHx/DJja4KGhbK9R2XscbXm7kwI7kcTr8+
	TGihYkIzsr2S3iKaZLq1s6TEsO9sgPxAvQrStR1ElkDGPh1xF1SQRszqNnWq8PpvyE83sha3fuIzh
	R2VS6/0+/My9lLEO9fKsWskWuVHnEk6kJvIAZLy1UzG9whKkFs9/gX/LtPnOENUiP5FNLDReDQJFB
	myj3q17eJaCs2wBxrlSM+SqS7kBobatU3BHengFwUGlGvIVbY8ozyKF4hf1xXqPq32eX+oDyRe4FY
	kI4tXbMKPfnYE1uall5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGtcU-009sUz-TA; Fri, 20 Aug 2021 01:46:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGtcF-009sUJ-Rl; Fri, 20 Aug 2021 01:46:43 +0000
X-UUID: 1bf3c984dc134133acae760e468e9ca3-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=f4hvDwhqEUNQqaUdzqx9Yg5oEvR9HIx5XMJ/rdqRR2w=; 
 b=MVqYUImiV17zJfNo/YVk/zMTYfrMEjStPBLSyYH9a7Osvh0OOLWzRuGdv1lz7YbaJpGPKkEmCyt0TH+N8J5iOrOZPen53aZSEWwtAs2L6A53MfUEStpKy3uyX7TxTtOzCpHddr1EpzxxLUFNmcHwWxclGAUReJrvSsU0fS2ed5Q=;
X-UUID: 1bf3c984dc134133acae760e468e9ca3-20210819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 118981650; Thu, 19 Aug 2021 18:46:36 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 18:46:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 20 Aug 2021 09:46:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 09:46:21 +0800
Message-ID: <1629423981.19334.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/5] i2c: mt65xx: fix IRQ check
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@kernel.org>
CC: Sergey Shtylyov <s.shtylyov@omp.ru>, <linux-i2c@vger.kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-mediatek@lists.infradead.org>
Date: Fri, 20 Aug 2021 09:46:21 +0800
In-Reply-To: <YRwXZVxORTpddj2k@kunai>
References: <3712e871-bf2f-32c5-f9c2-2968c42087f8@omp.ru>
 <bab29007-8d74-0a68-2378-9db6ba0bc576@omp.ru> <YRwXZVxORTpddj2k@kunai>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_184639_946523_5C77B0AC 
X-CRM114-Status: GOOD (  17.90  )
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

On Tue, 2021-08-17 at 22:09 +0200, Wolfram Sang wrote:
> On Sun, Jul 04, 2021 at 05:38:45PM +0300, Sergey Shtylyov wrote:
> > Iff platform_get_irq() returns 0, the driver's probe() method will return 0
> > early (as if the method's call was successful).  Let's consider IRQ0 valid
> > for simplicity -- devm_request_irq() can always override that decision...
> > 
> > Fixes: ce38815d39ea ("I2C: mediatek: Add driver for MediaTek I2C controller")
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
> 
> Qii Wang, do you like this patch?
> 

It is ok.
Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Thanks

> > 
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Index: linux/drivers/i2c/busses/i2c-mt65xx.c
> > ===================================================================
> > --- linux.orig/drivers/i2c/busses/i2c-mt65xx.c
> > +++ linux/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -1211,7 +1211,7 @@ static int mtk_i2c_probe(struct platform
> >  		return PTR_ERR(i2c->pdmabase);
> >  
> >  	irq = platform_get_irq(pdev, 0);
> > -	if (irq <= 0)
> > +	if (irq < 0)
> >  		return irq;
> >  
> >  	init_completion(&i2c->msg_complete);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
