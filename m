Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0BCC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 06:43:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE73613F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 06:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE73613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8zINXbP2UE0AO2UOEFghX3nHGaMg+5+k9TeqqXgtNXE=; b=bwLurMNLKZGiuqehCYvY+6hkT
	KDy/N5rmGOBI/eE7lDrZ+rpMNbJklvRMHOhV43aFPxK6hazG5OMdQ28AfO124n4BcA2nhaiZP0Jzc
	6QVQWYH0Zsd5Gx75vqq86L6sIZRjfZ+rlkDXQmQ2NqFBVlFx9ITHkaXYUBRJEycA0Z7S8B9j42R6s
	cv2K3gh+/0Jr6NT1Z7ACm2E8U6iww3FwlZDXxPhVkYuA5e4HJruzBdKyEM2MlKjC1Q1/rjIrQlgjh
	u0Sjyjgr7aqJJ6woSLe/QvvIvtdRTkTb80R5c2kWGm5TIuIkUcE1oWM+M+iHCi4mJ/jeJM+tOcEU0
	EbPGki10A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcMs6-007LxB-Ak; Fri, 30 Apr 2021 06:43:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcMs3-007LwW-2g; Fri, 30 Apr 2021 06:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jroDrDSkc2zjLVJv+XjAib6CMc9iA3RYm71xD9Qkdkk=; b=1uagFJjBWLFCBnDt8SmsoxVDpK
 S6ZP3oFAaZZS+giUXjrOgmT2TT+CjMXnAuWC2vumNfUyIaZoH++e3div04UjatpD4mx9jDb37Rko6
 sNoM4uWd41XfV8igT9e5wMqhJqbpjOAzBEbRkbNdlQkEGq/POwcgAUYSAomQo6QNje1fAVeBN5+/6
 AAQ37v3I7/nw/3rQEY1OFh3V6UjgSfN0HMK8QcUEw05zf+UHiGsvX1k2a/6JnBFWNLQQjLQg7sK2a
 cKTC1F7zNiW79mLYerhL88GpPRGojAoDON5E0iOsglziYS3VeT+AAhT6Kxsys0RUgnznU5ZOBUQ1T
 Q9hIpyAg==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcMs0-001Av1-HL; Fri, 30 Apr 2021 06:43:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id c17so13191410pfn.6;
 Thu, 29 Apr 2021 23:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jroDrDSkc2zjLVJv+XjAib6CMc9iA3RYm71xD9Qkdkk=;
 b=Skt7B+GvmAVrdi+Hp2msdDATO0VSDbFCfoaYKe+1lmHc718uRKbvALjVYuMsZHp8pP
 /B8w5wj6Je1Gc21gVre3lSirzyQNtj3kz6hSgsXS4EXPxTlb6Kb1mwExDBzKxjGXnso8
 fp9rEY180455Hf34uL8fZp+1p6cpnOVdFdvdeHrNr5moYmHPkAg5n7nmhDL2zcc39UpV
 95qWjF7EYnfAup6ZgeR8io64nUBJ6GsM1n4NtDF6kMmWt2rXulY3e6QsCQfR1pLBrmLj
 5rrGNurAWDseAhW1fNbnbLWmU28A9ChFQ79II8TZ1HuSewWAVjJYwnqp0aMZIlFMvImA
 4JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jroDrDSkc2zjLVJv+XjAib6CMc9iA3RYm71xD9Qkdkk=;
 b=qRr6c1y5PWmpRknQstGaOKnssaearNyvOlqYdtJwMCOVoSG5NeW/T9SvBDbZHTJN/U
 tGM6RuVjOs6r1X7F7ZlnjXYlwrBxni4PwvYvrDy3S5MB8PgEt8+PXt2y/eYkROcAWhPu
 5Xv5eBmesz2FKTqnyedqr9mMXfUiwU8jDxFylmHTK9gMR56eHP9QjqHm0zeorxh8WmsC
 Fr+bx9NnD/73WzoFVa/+A0ncHe+GWG5U/V6P4+wxBGNTlHbORK2DFZMceiEBeFYeV+oX
 Ha37oEpwmcnYMTIifBClO02ArIai23Dl6+iAtrWevmaL06kxi3AWzcTJW5NjRp0HR7w5
 HJrQ==
X-Gm-Message-State: AOAM530396JbmVrKJEPQfYmUkZZeYVu0E7tW9GP7jPP+HGbENUdHt+2J
 Xpgwl2bgWvpqIvgjCALAoAw=
X-Google-Smtp-Source: ABdhPJwHPyptjdh+yN/klQVmPmij330PGDruMNhex1YxJLHJ4PmvvYWAEGIfwvcL1mG4PP1/4YvnhQ==
X-Received: by 2002:a65:464c:: with SMTP id k12mr3390312pgr.82.1619765003698; 
 Thu, 29 Apr 2021 23:43:23 -0700 (PDT)
Received: from localhost ([103.248.31.149])
 by smtp.gmail.com with ESMTPSA id o5sm1843662pgq.58.2021.04.29.23.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 23:43:23 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:13:20 +0530
From: Amey Narkhede <ameynarkhede03@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 lorenzo.pieralisi@arm.com, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: mediatek: Verify whether the free_ck clock is
 ungated or not
Message-ID: <20210430064320.ktnr2wjhza4p44dk@archlinux>
References: <20210429134749.75157-1-ameynarkhede03@gmail.com>
 <20210429223838.GA588275@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429223838.GA588275@bjorn-Precision-5520>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_234324_610660_BE6C6699 
X-CRM114-Status: GOOD (  25.97  )
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

On 21/04/29 05:38PM, Bjorn Helgaas wrote:
> Can you make the subject say something at a higher level instead of
> just paraphrasing the C code?  I'm guessing this means resume will now
> fail if the clock isn't turned on?
>
> On Thu, Apr 29, 2021 at 07:17:49PM +0530, Amey Narkhede wrote:
> > Verify that the free_ck clock is ungated on device resume
> > by checking return value of clk_prepare_enable().
>
> Also the commit log -- this doesn't say anything more than the code
> itself.  Did you find this by tripping over it?  Or just by code
> inspection?  I guess without the check, we continue on and try to
> resume, but accesses to PCI devices fail and maybe return ~0 data or
> cause machine checks or something?
>
I found this with code inspection. Sorry for the unclear commit
messsage. I'll try to clarify it in v2.
> > Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index 23548b517..9b13214bf 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -1154,11 +1154,14 @@ static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
> >  {
> >  	struct mtk_pcie *pcie = dev_get_drvdata(dev);
> >  	struct mtk_pcie_port *port, *tmp;
> > +	int ret;
> >
> >  	if (list_empty(&pcie->ports))
> >  		return 0;
> >
> > -	clk_prepare_enable(pcie->free_ck);
> > +	ret = clk_prepare_enable(pcie->free_ck);
> > +	if (ret)
> > +		return ret;
>
> Most callers print an error message when clk_prepare_enable() fails.
>
[...]
I'll update this in v2.

Thanks,
Amey

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
