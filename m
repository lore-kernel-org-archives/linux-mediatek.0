Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEF8C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 09:55:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6BB22E02
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 09:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6BB22E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bBVZ+GROB1QXUrfErVXT3GOUCy+JRNXldGRLdYr0h2A=; b=c7mTw6cy6eUV8JmTgWgymjrT3
	TSEVNdNc6xHdsWhyVAuYBvL5SGUB2g3N0jj1Oci+l9CReYE8lotwH73wJvf/cvqRpan0SJht9AU8X
	y2/wGFsOMr4yRy+o5Gazw51Yyr2GlgitfoBuQUdb4GPknsr+CBjoXODuH88AeDUg2tM6xyYB2nq4V
	sZAv8TTh09pQfQ6sWmJ4iSfBYEtTf2lRNS0xxtCxtyOCJuT4pTfhA2whYMzZeSeNjN5NE7NxBIETW
	wbCi1UxyQklCn7AcPQCpHiOxfRSZqUd86PdlaRS6gdL2eLCpe8Gevf/YyudVIGv4/lRB3L1LCWkky
	wsgWowG/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxoU2-0001Nt-1Z; Fri, 08 Jan 2021 09:55:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxoTz-0001L3-7E
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 09:55:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id h16so10575116edt.7
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 01:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IK+44CzzfVfOGuAwRFDtWTWEbsmnaUyfEbndc+LLII0=;
 b=g5gIR+DZeDOkUgh3bwbifA/QvR8Xca1KXNdDaE6fShDjJgoMxK33BxMUJ56GfRGQUu
 0RBWDEtQW/NL3kY1bH/fXuGS2/yEn8TdrlH9B+UIBprw0cgqUonLVtCVSQrCRz4P6+XY
 pDUnYebAcRC+MTAkyoyGQBgZxuGydzUdulvgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IK+44CzzfVfOGuAwRFDtWTWEbsmnaUyfEbndc+LLII0=;
 b=dlF2juTGx+PjEcTak7XAu15jYFeE1cvUu5n5dmM3OlVZOCg/T/9Xek/JRc3JyDCyIO
 78eE/vuC+dcwyfSu7EegzLRa4BH8unvBhbPtqzsmgnJVp9J37o/BW6V0F8xGoZC2HjEn
 HC63tGjRDBI7EOc3P/I8NFex8JVS1UZHEZovK4EaUBOgFEVIG23HCYOmkPZJRGZYj3XX
 yZN3Zl8D9gLv99dFTjO/DURQ5VCc1eWK09Xl2T665Z54hwF6c3LGdLmka05x+NtN6VAH
 7AR+2vhnF80XbGQEL0ldu0tZTHTYGvtP38RkzsGjWIUiYAiKHYxi+tVMSbyVMg4JBBgx
 xiVg==
X-Gm-Message-State: AOAM533WYIyvO41kNIt3js8MbKLoIG+fDvC0EBSD7SoqVEQdcTF3LYXy
 PjWuIgI1Q7ia79GzXgvXgqSGzwFXEPHrJg==
X-Google-Smtp-Source: ABdhPJwiYEmnSObVq/MgjcsXXlFySoEWvCy5sybYiSEqicoYP7WQrmEPQT4yo2GWATRrPArKCuQa5Q==
X-Received: by 2002:a50:ee1a:: with SMTP id g26mr4749226eds.68.1610099695899; 
 Fri, 08 Jan 2021 01:54:55 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id f18sm3526513edt.60.2021.01.08.01.54.54
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 01:54:54 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id g25so6403087wmh.1
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 01:54:54 -0800 (PST)
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr2296894wml.99.1610099693765; 
 Fri, 08 Jan 2021 01:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <X+MBcmzQn9iQWlVZ@chromium.org>
 <1609239977.26323.292.camel@mhfsdcap03>
In-Reply-To: <1609239977.26323.292.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 8 Jan 2021 18:54:41 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cz5X5_pm3Vef0HcuARXrZPx9FGxeuxtQeqe9vmWcxZzQ@mail.gmail.com>
Message-ID: <CAAFQd5Cz5X5_pm3Vef0HcuARXrZPx9FGxeuxtQeqe9vmWcxZzQ@mail.gmail.com>
Subject: Re: [PATCH v5 18/27] iommu/mediatek: Add power-domain operation
To: Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_045459_321098_5A5E4D5C 
X-CRM114-Status: GOOD (  34.51  )
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
Cc: youlin.pei@mediatek.com, linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 29, 2020 at 8:06 PM Yong Wu <yong.wu@mediatek.com> wrote:
>
> On Wed, 2020-12-23 at 17:36 +0900, Tomasz Figa wrote:
> > On Wed, Dec 09, 2020 at 04:00:53PM +0800, Yong Wu wrote:
> > > In the previous SoC, the M4U HW is in the EMI power domain which is
> > > always on. the latest M4U is in the display power domain which may be
> > > turned on/off, thus we have to add pm_runtime interface for it.
> > >
> > > When the engine work, the engine always enable the power and clocks for
> > > smi-larb/smi-common, then the M4U's power will always be powered on
> > > automatically via the device link with smi-common.
> > >
> > > Note: we don't enable the M4U power in iommu_map/unmap for tlb flush.
> > > If its power already is on, of course it is ok. if the power is off,
> > > the main tlb will be reset while M4U power on, thus the tlb flush while
> > > m4u power off is unnecessary, just skip it.
> > >
> > > There will be one case that pm runctime status is not expected when tlb
> > > flush. After boot, the display may call dma_alloc_attrs before it call
> > > pm_runtime_get(disp-dev), then the m4u's pm status is not active inside
> > > the dma_alloc_attrs. Since it only happens after boot, the tlb is clean
> > > at that time, I also think this is ok.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >  drivers/iommu/mtk_iommu.c | 41 +++++++++++++++++++++++++++++++++------
> > >  1 file changed, 35 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > > index 6fe3ee2b2bf5..0e9c03cbab32 100644
> > > --- a/drivers/iommu/mtk_iommu.c
> > > +++ b/drivers/iommu/mtk_iommu.c
> > > @@ -184,6 +184,8 @@ static void mtk_iommu_tlb_flush_all(void *cookie)
> > >     struct mtk_iommu_data *data = cookie;
> > >
> > >     for_each_m4u(data) {
> > > +           if (!pm_runtime_active(data->dev))
> > > +                   continue;
> >
> > Is it guaranteed that the status is active in the check above, but then
> > the process is preempted and it goes down here?
> >
> > Shouldn't we do something like below?
> >
> >         ret = pm_runtime_get_if_active();
> >         if (!ret)
> >                 continue;
> >         if (ret < 0)
> >                 // handle error
> >
> >         // Flush
> >
> >         pm_runtime_put();
>
> Make sense. Thanks. There is a comment in arm_smmu.c "avoid touching
> dev->power.lock in fastpaths". To avoid this here too(we have many SoC
> don't have power-domain). then the code will be like:
>
>         bool has_pm = !!data->dev->pm_domain;
>
>         if (has_pm) {
>                 if (pm_runtime_get_if_in_use(data->dev) <= 0)
>                         continue;
>         }
>
>         xxxx
>
>         if (has_pm)
>                 pm_runtime_put(data->dev);

Looks good to me, thanks.

> >
> > Similar comment to the other places being changed by this patch.
> >
> > >             writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> > >                            data->base + data->plat_data->inv_sel_reg);
> > >             writel_relaxed(F_ALL_INVLD, data->base + REG_MMU_INVALIDATE);
> > > @@ -200,6 +202,10 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
> > >     u32 tmp;
> > >
> > >     for_each_m4u(data) {
> > > +           /* skip tlb flush when pm is not active. */
> > > +           if (!pm_runtime_active(data->dev))
> > > +                   continue;
> > > +
> > >             spin_lock_irqsave(&data->tlb_lock, flags);
> > >             writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
> > >                            data->base + data->plat_data->inv_sel_reg);
> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
