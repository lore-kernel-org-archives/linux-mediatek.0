Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942C9C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 09:56:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E64235FF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 09:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E64235FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dudrymWd/cUfMWH6TFaKUjlez5CxIJx/8RXs4a6I3qA=; b=yKwx3X3LqxoWbVuILE3uwBCqr
	z6khlByDLrDHW/SPeuHWfQ1BhSrDQBJ8sWI5j/wUN9RhoI3KmEm/Zs3PFY5ZzoexUMKGY05PCaL1u
	wdYJvcH/s6ryRgvGzNDf1WYO9ryyqtAQzsZXmH1UNRKoVVSy6sMW27cfQWuZevZd1I0Chir0zObN3
	pO7sURbSdsGNwBlytTaYVTpZIY8r5R/fNrno8otwp+XrefB/vbo0juAimeEbmE0k5X7hYbyJ78FCQ
	FgKkEsig2fERO18eJtz/H0hwl4Hkofr0xS++8DMrbULZtE6ZwHSAXb5cYhBvY2jra192GvjopwRvV
	WeqfK5h7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxoVQ-0001kH-56; Fri, 08 Jan 2021 09:56:28 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxoVO-0001jW-Ll
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 09:56:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id qw4so13655879ejb.12
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 01:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e8wcnpRjmLqWWPjOlKuS2zxtj825HdJfa315uuBxu+E=;
 b=gwT5kI9b3q1yJSSsmO/r1XGlJqaVWHsjszygBZhjqC7h5N6orJ9UZkWUXXLGVsDCdt
 +tUUsJ/rk4gTyjSeuaNo4p41y92lWxoM0ax4HUNKFNs/mTUR5aZErWWuL2rwygC+0SUL
 uaC5iKH2mNmV2MD9P1s6rwULoDm5+wGLeM9Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e8wcnpRjmLqWWPjOlKuS2zxtj825HdJfa315uuBxu+E=;
 b=kOAbZqONMwCnCRz5H6DmlxyWo92/DcgzZAhwwz4z87299I8JXuKHXggQdONXLypRYv
 FpvV1VEUt4Yu28LDU1rbZwc5QQymE323CW/xrZIAn+ll7KD2OlcK4hM4pVy+FSl7q0ch
 /CgWjG//9IcqDa8g7lL/dU2PmuQZTkDeA/mPx6TOAdqvTM5Qn/VsX3Ylkt6pDcnzJltC
 RJFhr2PAJvZVt9MQbL53fQXtKU7xRKyUGDN9mkwlXPLo24qZKBE5ou1Xd8axkipNIAhe
 NKyiAclzQjCeYAavzQ23akAMAQxrPKf7x7mijHzZ6N8/rttF/gmOuFnbJlB56rDrQe1j
 cZyQ==
X-Gm-Message-State: AOAM530C8nn0Ia1hjMjO/XVwPqS2/UDe/5WVCHGXM7Tyf9kN8Oydg+Iw
 Tdqjz/qYIRTTSMRzVd3NS0h4wNdYbFVv4Q==
X-Google-Smtp-Source: ABdhPJzXSQoQvOhvAcU4IEFIsdcFdfL84EebvehUcHr3A41yZmuwzS6xUTKN0PnWYLLMzvX8f2R3sQ==
X-Received: by 2002:a17:906:298c:: with SMTP id
 x12mr2163448eje.244.1610099784650; 
 Fri, 08 Jan 2021 01:56:24 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id g18sm3591245edt.2.2021.01.08.01.56.23
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 01:56:23 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id m5so8363893wrx.9
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 01:56:23 -0800 (PST)
X-Received: by 2002:adf:bb0e:: with SMTP id r14mr2875978wrg.159.1610099783056; 
 Fri, 08 Jan 2021 01:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-7-yong.wu@mediatek.com>
 <X+MGKBYKdmPNz7VL@chromium.org> <1de76b46-d9c1-4011-c087-1df236f442c3@arm.com>
In-Reply-To: <1de76b46-d9c1-4011-c087-1df236f442c3@arm.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 8 Jan 2021 18:56:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C72ejEEioM=fTeE2=36DgRbDR1cCuWqn-7xnWRVzYPGw@mail.gmail.com>
Message-ID: <CAAFQd5C72ejEEioM=fTeE2=36DgRbDR1cCuWqn-7xnWRVzYPGw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] iommu/mediatek: Gather iova in iommu_unmap to
 achieve tlb sync once
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_045626_733988_6F28787D 
X-CRM114-Status: GOOD (  32.75  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, kernel-team@android.com,
 Joerg Roedel <joro@8bytes.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 8:00 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-12-23 08:56, Tomasz Figa wrote:
> > On Wed, Dec 16, 2020 at 06:36:06PM +0800, Yong Wu wrote:
> >> In current iommu_unmap, this code is:
> >>
> >>      iommu_iotlb_gather_init(&iotlb_gather);
> >>      ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
> >>      iommu_iotlb_sync(domain, &iotlb_gather);
> >>
> >> We could gather the whole iova range in __iommu_unmap, and then do tlb
> >> synchronization in the iommu_iotlb_sync.
> >>
> >> This patch implement this, Gather the range in mtk_iommu_unmap.
> >> then iommu_iotlb_sync call tlb synchronization for the gathered iova range.
> >> we don't call iommu_iotlb_gather_add_page since our tlb synchronization
> >> could be regardless of granule size.
> >>
> >> In this way, gather->start is impossible ULONG_MAX, remove the checking.
> >>
> >> This patch aims to do tlb synchronization *once* in the iommu_unmap.
> >>
> >> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> >> ---
> >>   drivers/iommu/mtk_iommu.c | 8 +++++---
> >>   1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> >> index db7d43adb06b..89cec51405cd 100644
> >> --- a/drivers/iommu/mtk_iommu.c
> >> +++ b/drivers/iommu/mtk_iommu.c
> >> @@ -506,7 +506,12 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
> >>                            struct iommu_iotlb_gather *gather)
> >>   {
> >>      struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> >> +    unsigned long long end = iova + size;
> >>
> >> +    if (gather->start > iova)
> >> +            gather->start = iova;
> >> +    if (gather->end < end)
> >> +            gather->end = end;
> >
> > I don't know how common the case is, but what happens if
> > gather->start...gather->end is a disjoint range from iova...end? E.g.
> >
> >   | gather      | ..XXX... | iova |
> >   |             |          |      |
> >   gather->start |          iova   |
> >                 gather->end       end
> >
> > We would also end up invalidating the TLB for the XXX area, which could
> > affect the performance.
>
> Take a closer look at iommu_unmap() - the gather data is scoped to each
> individual call, so that can't possibly happen.
>
> > Also, why is the existing code in __arm_v7s_unmap() not enough? It seems
> > to call io_pgtable_tlb_add_page() already, so it should be batching the
> > flushes.
>
> Because if we leave io-pgtable in charge of maintenance it will also
> inject additional invalidations and syncs for the sake of strictly
> correct walk cache maintenance. Apparently we can get away without that
> on this hardware, so the fundamental purpose of this series is to
> sidestep it.
>
> It's proven to be cleaner overall to devolve this kind of "non-standard"
> TLB maintenance back to drivers rather than try to cram yet more
> special-case complexity into io-pgtable itself. I'm planning to clean up
> the remains of the TLBI_ON_MAP quirk entirely after this.
>
> Robin.
>
> >>      return dom->iop->unmap(dom->iop, iova, size, gather);
> >>   }
> >>
> >> @@ -523,9 +528,6 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
> >>      struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> >>      size_t length = gather->end - gather->start;
> >>
> >> -    if (gather->start == ULONG_MAX)
> >> -            return;
> >> -
> >>      mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
> >>                                     dom->data);
> >>   }
> >> --
> >> 2.18.0
> >>
> >> _______________________________________________
> >> iommu mailing list
> >> iommu@lists.linux-foundation.org
> >> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
