Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06646C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 08:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A01B610C9
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 08:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8A01B610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baidu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WI5UOVZZDgHjpl3bShUCQVe6nLKcWRRmshhCrxfgBUc=; b=ckFhGGbruBzIC6
	6MHNCyaFizUbLlNKATwHMaUdYuZmdtCy2Ho0xSAAK7UPFHHg1xImHr1KJo7EnmdES/Edyz9Hj6ogZ
	NYAOUwngFO3KGNNNc8oKhLIDEYyW7FyOhwOKwMjQk3+owHGN7ELIgFP27vrRuAKmmbdfEbmTLgpO4
	GBcaYjtMputJi07yUa0bJiOMu906P1363Rw35jE9Odb6QhgnnHqZtmuja60D8unfVAoRKOvEisABT
	8IKMnPisX0MY+8WZWjbO7Qu/IyNIKS8RdMSlZEJfczq67QanlsKQH8E5xOgLqE30uliWT+d/kcE3q
	zy2/6jzSVx2R1wZEWoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLhjS-008uEW-HT; Thu, 02 Sep 2021 08:05:58 +0000
Received: from mx20.baidu.com ([111.202.115.85] helo=baidu.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLhjE-008uB4-UE; Thu, 02 Sep 2021 08:05:46 +0000
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
 by Forcepoint Email with ESMTPS id EDEAF2A36F94547B3CD7;
 Thu,  2 Sep 2021 16:05:40 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 2 Sep 2021 16:05:40 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Sep 2021 16:05:40 +0800
Date: Thu, 2 Sep 2021 16:05:39 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: <rafael@kernel.org>, <patrice.chotard@foss.st.com>, <mchehab@kernel.org>, 
 <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <lorenzo.pieralisi@arm.com>, <robh@kernel.org>, <kw@linux.com>,
 <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 1/3] driver core: platform: Add the helper function
 devm_platform_get_and_ioremap_resource_byname()
Message-ID: <20210902080539.GA32174@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210902063702.32066-1-caihuoqing@baidu.com>
 <20210902063702.32066-2-caihuoqing@baidu.com>
 <YTB0vegl2YFfaWzM@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTB0vegl2YFfaWzM@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex27.internal.baidu.com (172.31.51.21) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_010545_224886_7FBF0877 
X-CRM114-Status: GOOD (  26.19  )
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

On 02 Sep 21 08:52:45, Greg KH wrote:
> On Thu, Sep 02, 2021 at 02:37:00PM +0800, Cai Huoqing wrote:
> > Since provide the helper function devm_platform_ioremap_resource_byname()
> > which is wrap platform_get_resource_byname() and devm_ioremap_resource().
> > But sometimes, many drivers still need to use the resource variables
> > obtained by platform_get_resource(). In these cases, provide this helper
> > function devm_platform_get_and_ioremap_resource_byname().
> > 
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > ---
> > v1->v2: Resend this patch as part of a patch series that uses
> > 	the new function. 
> > 
> >  drivers/base/platform.c         | 30 ++++++++++++++++++++++++++----
> >  include/linux/platform_device.h |  3 +++
> >  2 files changed, 29 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 652531f67135..34bb581338d9 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -124,6 +124,31 @@ void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
> >  }
> >  EXPORT_SYMBOL_GPL(devm_platform_ioremap_resource);
> >  
> > +/**
> > + * devm_platform_get_and_ioremap_resource_byname - call devm_ioremap_resource() for a
> > + *						   platform device and get resource
> > + *
> > + * @pdev: platform device to use both for memory resource lookup as well as
> > + *        resource management
> > + * @name: name of the resource
> > + * @res: optional output parameter to store a pointer to the obtained resource.
> > + *
> > + * Return: a pointer to the remapped memory or an ERR_PTR() encoded error code
> > + * on failure.
> > + */
> > +void __iomem *
> > +devm_platform_get_and_ioremap_resource_byname(struct platform_device *pdev,
> > +					      const char *name, struct resource **res)
> > +{
> > +	struct resource *r;
> > +
> > +	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> > +	if (res)
> > +		*res = r;
> 
> You forgot to check the return value of this call :(
devm_ioremap_resource wiil check it and print error message, here:
./lib/devres.c:136:__devm_ioremap_resource(

	if (!res || resource_type(res) != IORESOURCE_MEM) {
		dev_err(dev, "invalid resource\n");
		return IOMEM_ERR_PTR(-EINVAL);
> 
> Which means you did not test this?  Why not?
> 
> But step back, _WHY_ is this needed at all?  How deep are we going to
> get with the "devm_platform_get_and_do_this_and_that_and_that" type
> functions here?
  the function name seems too long, how can I rename it:)
> 
> You show 2 users of this call, and they save what, 1-2 lines of code
> here?
> 
> What is the real need for this?
> 
> thanks,
> 
> greg k-h
many thanks for your feedback.

Cai

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
