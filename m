Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3949EC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 18:03:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08FF23370
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 18:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08FF23370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qSSHmpK0NZnMrm9CU+Gc1KAkLLoKELI4GFDL3hSzDcI=; b=BkS4dZeRURGyTwg8dHJ0vLoVr
	Et4s95vYANqI4/CEpedYunojRJAbDUHMK3WyXRgqsxl5LpfLDPr3MLiFLa11m5dLlRnnqJIKx1yOG
	4J9O0+SjYLqVcT3eST0i/Pt3wqoNaEcnFgFHIkm29Kw2jJyjkw7k//mq76UrlJHMZs5cF3COpBUVC
	a6254IFJr74ifHYKXgTiU5Jc5XcB0S42Fk0uO0i4YQzO+mQlgRBUcQ0thgrjewf0KMIlTxqh53Gf5
	vbM9sTASgZCJtddcbRfQaypiw3QoBipNCE5W8t4xQRTxzVP527qt3FTmwrRzrWIFzwLN58RRIrHeN
	NwRO6jeRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxZcU-00017q-0n; Thu, 07 Jan 2021 18:02:46 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxZcR-00016f-RY
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 18:02:44 +0000
Received: by mail-ot1-x334.google.com with SMTP id o11so7136372ote.4
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nQ6Ok2qv3kfguUtTE5w7jI9nGycF4ZB8N3EBEUPDAj8=;
 b=GwN3LcQd554wGKPgJZjH1S7VHyf+0nrBX7wmPn3JVgqimfAzoUPQLhWHotgOQe7ajF
 6De7OUFvPfIMGE4dDVzXUKNrYKlmP9OyvJ8fg+47iV01+hf3T+w+TiwAtX3U8MmqxRZr
 LI01MTRfxwQb5EfDfTtAyMCPzm8bkI/S4dL793hljuLJg1vRMtn9lFeX/geK8/3fKbr7
 y8TEAdTkxnpOBjIjtoinf6V66xDyy4CXMzlh2NNGIqf4XUY3tONryrCf35zsvB2lfp2W
 hiu+wCzN8jMKi7gWx391yzyIV6X3ZpdltVMG1arUX114ausrADiHORtjP1XY7AzorT6p
 wVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nQ6Ok2qv3kfguUtTE5w7jI9nGycF4ZB8N3EBEUPDAj8=;
 b=WhWH2tcIuUBvwwCGKHT0ahgkJObCd/UB0PG65/Fp8S/po+YIxovBhop3KsPU4iek9B
 GjnxSsp3xKRcDD5yAu4QrM6oAByn7nsXdmvSpT0PC0WgpqFrH1QxyIN4ZbM3aovw39So
 +FwNJVuLk9qYd+rU/9ys37sCmXSd1WIgUQmTN5N7/4UksfMaCwHspBCIKXtr8AsWTGrp
 fvSpo2raBizInAzqFvlN1cuUQDkYBYpcVfsNmzK/FKiDqfAkGubwglk0fGxn3ZjKH5Lh
 vN9spiw9LCxcM+Gy6WLjbo7Z7VOJ42HAcM81a7GFbi0Og17EXu6gxOhl66lR5pRY+aTn
 3gyg==
X-Gm-Message-State: AOAM530w8aXwKf6gG5Eg0MDdTExB7Nrq7oKczIUaGl+26ZUuDqVeBqVI
 DqkK/sok72mzuLdGKALA5AclvQ==
X-Google-Smtp-Source: ABdhPJw0C/3EMOrNHLY5ELywjkiY+brXvZR5p3DxYWimDV92myKzXZGMLQS8FRc3/VYO9pYkAA4nZQ==
X-Received: by 2002:a05:6830:204b:: with SMTP id
 f11mr7177993otp.372.1610042559828; 
 Thu, 07 Jan 2021 10:02:39 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t186sm1438689oif.1.2021.01.07.10.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 10:02:39 -0800 (PST)
Date: Thu, 7 Jan 2021 12:02:37 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
Message-ID: <X/dMvWdwVfnjsUXM@builder.lan>
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-3-tzungbi@google.com>
 <20210106231513.GC9149@xps15>
 <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_130243_962063_0DD87FEE 
X-CRM114-Status: GOOD (  18.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed 06 Jan 19:50 CST 2021, Tzung-Bi Shih wrote:

> On Thu, Jan 7, 2021 at 7:15 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > >  static void mt8183_scp_stop(struct mtk_scp *scp)
> > >  {
> > >       /* Disable SCP watchdog */
> > > @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
> > >               goto free_rproc;
> > >       }
> > >       scp->sram_size = resource_size(res);
> > > +     scp->sram_phys = res->start;
> > > +
> > > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > > +     if (res) {
> >
> > As far as I can tell the if() condition isn't needed since
> > platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
> > is capable of handling that condition.  As such the code to parse "l1tcm" can be
> > the same as what is done for "sram".
> 
> The "l1tcm" memory region is optional.  The if() condition is for: if
> DTS doesn't provide the memory region, kernel can skip the code block.
> 

People are actively looking for platform_get_resource_byname +
devm_ioremap_resource() pairs to replace with
devm_platform_ioremap_resource_byname(), so we're probably going to have
someone try to patch this soon...

So please change the pair to devm_platform_ioremap_resource_byname() and
treat a returned -EINVAL as the memory isn't specified and other
IS_ERR() as errors.

Thanks,
Bjorn

> >
> > With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > > +             scp->l1tcm_base = devm_ioremap_resource(dev, res);
> > > +             if (IS_ERR((__force void *)scp->l1tcm_base)) {
> > > +                     dev_err(dev, "Failed to parse and map l1tcm memory\n");
> > > +                     ret = PTR_ERR((__force void *)scp->l1tcm_base);
> > > +                     goto free_rproc;
> > > +             }
> > > +             scp->l1tcm_size = resource_size(res);
> > > +             scp->l1tcm_phys = res->start;
> > > +     }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
