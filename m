Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49196C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 23:35:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E7420848
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 23:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0uN7MLSz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tcd-ie.20150623.gappssmtp.com header.i=@tcd-ie.20150623.gappssmtp.com header.b="z5afeT1u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E7420848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tcd.ie
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nf6Dv1+8KRjRXujLtf+QVPEiu0b0TQWceqFK/bql37E=; b=0uN7MLSzXdjyOxABzbP0FAYBF
	cPMLmJOTqH2tRpScfQd2xEwEXfqW222dHuHyvJ5fjBytE8BWHCFKit1E7qBIjy5CMN7aWcCintheb
	/7qJWDfFwRPjPg7ymOxnF6eMrt7dJUPGR4Ied+Gsy2vpxC7BusyokoxQreZ30yjBD+y4I9R3wc8WL
	XIP4g1Oo7itcKmK+2UgqoZlDOXZOdQFHJjBv8DLN8ilyIzTUCTNWMvhyGv3VU7/o3fFOcRA6DnB69
	xwoz2H9VCc2Xy8e7WG1ZRa8t6CmO5FWB/zh2B8N79b7BTavOHn3iWxXHVD1U9m7c+tj3DYodwqN2W
	2spGvpQJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBRQ6-0005kJ-CH; Thu, 27 Aug 2020 23:35:02 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBRQ0-0005gY-KN
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 23:34:58 +0000
Received: by mail-il1-x141.google.com with SMTP id q14so6419705ilm.2
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 16:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WedloSq7WEmmdLIoMis0OnTbQ3vwipQyHuMeYXqSrtc=;
 b=z5afeT1uAO8r4nUnyvdyA9XOFk/fx4rNEV7OzYIxSzIyRPXSSuP0kLR0uFLb5b32/u
 2F9MWfvV9WNZ+AXIi+QLZ8p0NAvNTBNro8XHBAkvaJyY3ufO9Q62GJ4oCd3Mw0z1agKr
 qFAx/HdJ+EmG1djyMZ9CSGcKQmWFu/zVKz5vJDxg6Nx++SMMng1dGMX9Fmd/wZDTKzHU
 hK7p1r057Z3QOjx4Tgjjmk5k/beu18E/9gkjDnfpmsN6+7UO8xqzHsjZBJhd37zZ1RdM
 prBipf1AI2muUbFcyfU3La5FJDcrT8wuyB+danzKbVnftQC2AzrWmBaIjshroZB9Cb96
 Llhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WedloSq7WEmmdLIoMis0OnTbQ3vwipQyHuMeYXqSrtc=;
 b=MTxmVKSTyZ8bZ2oQH/SIgsyp9383e3TzLn5Nn5HjAxxiSizaQbaJ1E8hhm5j7lbF49
 Ye6J753HddblIQxltdLnbQoEDi+bnHzaDzstvI/Jczjvd+SUm88PSCbG7111Ox1vcYct
 cgKEGjOdTXqmnXjH+SbYglii9c7KYrph5wcBcKJC8w6LcOD3/D1sf0bxyMLnpmdqGZJW
 cJUO1qa+7Ww99QdbTdQ1J3RpbE+5nwPqph+d/NR3iNyGrjcIZ+i3UBRky14PF4ZcQVGv
 pgtKq61uTl0MbACKGwDynxPkIzZn2dOlGKsn8MnmPpGUdVvMQ/U8UbeZI6dF4GZoRKL9
 piQQ==
X-Gm-Message-State: AOAM532D6eVxJLITxNKE8QeQnU2fntxUDrllxEeiaXK3bBMkskNMlaZK
 K92c7OdTfp7bYCwV6y4POSVOfJGDhBMebPyvKXpq0Q==
X-Google-Smtp-Source: ABdhPJw0W2KNMSiVDCp6qP+D3bxqQi5szrf3hiteZz0kvkkYuvF0+Qn7lDLtjb0Ko+kJMcKtvMnZ3YU+iAfoJmlGVTk=
X-Received: by 2002:a92:4f:: with SMTP id 76mr18588367ila.11.1598571293162;
 Thu, 27 Aug 2020 16:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
 <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
 <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
In-Reply-To: <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Fri, 28 Aug 2020 00:34:41 +0100
Message-ID: <CALQxJuuS8KKUX_eWWSE81gsq5ePAETB-FoqRUSWFfqgr+B13gg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Logan Gunthorpe <logang@deltatee.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_193456_767576_2818A1F0 
X-CRM114-Status: GOOD (  26.83  )
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Aug 2020 at 22:36, Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-08-23 6:04 p.m., Tom Murphy wrote:
> > I have added a check for the sg_dma_len == 0 :
> > """
> >  } __sgt_iter(struct scatterlist *sgl, bool dma) {
> >         struct sgt_iter s = { .sgp = sgl };
> >
> > +       if (sgl && sg_dma_len(sgl) == 0)
> > +           s.sgp = NULL;
> >
> >         if (s.sgp) {
> >             .....
> > """
> > at location [1].
> > but it doens't fix the problem.
>
> Based on my read of the code, it looks like we also need to change usage
> of sgl->length... Something like the rough patch below, maybe?
>
> Also, Tom, do you have an updated version of the patchset to convert the
> Intel IOMMU to dma-iommu available? The last one I've found doesn't
> apply cleanly (I'm assuming parts of it have been merged in slightly
> modified forms).
>

I'll try and post one in the next 24hours

> Thanks,
>
> Logan
>
> --
>
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h
> b/drivers/gpu/drm/i915/i915
> index b7b59328cb76..9367ac801f0c 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -27,13 +27,19 @@ static __always_inline struct sgt_iter {
>  } __sgt_iter(struct scatterlist *sgl, bool dma) {
>         struct sgt_iter s = { .sgp = sgl };
>
> +       if (sgl && !sg_dma_len(s.sgp))
> +               s.sgp = NULL;
> +
>         if (s.sgp) {
>                 s.max = s.curr = s.sgp->offset;
> -               s.max += s.sgp->length;
> -               if (dma)
> +
> +               if (dma) {
> +                       s.max += sg_dma_len(s.sgp);
>                         s.dma = sg_dma_address(s.sgp);
> -               else
> +               } else {
> +                       s.max += s.sgp->length;
>                         s.pfn = page_to_pfn(sg_page(s.sgp));
> +               }
>         }
>
>         return s;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
