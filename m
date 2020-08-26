Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02008C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 18:27:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE0F020737
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 18:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J4iLzKtF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aATDp49D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE0F020737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=miRaGL3OXPzBxuoLkETO0p61vyNGn5N5MzzBV7BYEqE=; b=J4iLzKtF88jKIh56/R2sSHSRa
	23xpRzL23WlrEBJsb9A0rcdlpoih8fb0CcekzImo6zR02ZdIMi2dulwsRO9/m9UWstcjvEnL3Mr1V
	s7JmCeiyxjXToj2uoNUO0w3Y9CcN3+DmgXBJNA071WwOg4J62slRmOjyVIxU3tmX+tQ1MBKTRq8cU
	lh+4YxSp04C722JBBVykc9VFUXZ+55Xjn1mbuNKxrNRXnUtkBKxn0BLLLtAFmXDG/5n3imnzVdTX5
	xi9PYVacWVBBfktuB1Y76I1bugpJuK7wqC//nv2EdNgwzci6XfqGEW2SYM3SG1xbd9JHfY5PQyCBi
	s1K6kM3BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB08R-0002i7-OL; Wed, 26 Aug 2020 18:26:59 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB08M-0002fs-S4; Wed, 26 Aug 2020 18:26:55 +0000
Received: by mail-wr1-x444.google.com with SMTP id b18so2813200wrs.7;
 Wed, 26 Aug 2020 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bu4pOYOLpF8hHIWAO8QllDzn4fIcc5GK3Fq1pOjr02M=;
 b=aATDp49DrNEi4o+dQ3aZilAVzYRQBAblxtl0UNdBGXKSmVRdFgpISE1zQyc7cNSsZ9
 lW/EYpEmbA0Lu3HCV4gTg4WJlfsP9Ucv3zSATOZO1HiWK3Xl7zEtjeqoNbC6i1Ns4mAR
 ZRq0r3vG4sM3xbUlDy8LPAizO4V/iBIepvQgRwBNTOXvKWuZklWHI7dz6KPp6mM5pW+8
 e4/LtEjr5E3izgeXPBOlpPbB1jJpfchAVzL6KSrkYYKPwTjqCaTuOMWV4ujlyA488gay
 4N7boVhG1b57UDIcUR6HQBrmSeSXAtmip16JCAoNV2oOOh9NdAZhe34FxbbIB/ucho4E
 KVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bu4pOYOLpF8hHIWAO8QllDzn4fIcc5GK3Fq1pOjr02M=;
 b=QxtgaX1m5DnG/VLkoSaTBHdJ3k/H5Xww5OqRC2gxAhFSRE33Bl3vd9G6Ip7+Ss6zaf
 321t7Jmzd1HMzorfLkrIwf8NzF8+YxJ9lEmN7l6yXtu4aDg2m+kGqzxL0xVuBTZ00Nap
 nkv1hrGBJMbi/J13aUqHhAAR5Ca8kctCU0yoEUkK+SzfBHOJ4nV58Pp7nF3pM5+RoinB
 39SXXKfm3tVTwxvwLj4SJe7rtshtt3MWLqT+Zz9hkRXsjFFBglpbzeZVhUezmdtjTLFK
 FNgEq6y6rbUaSgcsO/Vz3L1T4mpNXMrORYA87x6mBmYKJv521t2k6as9EcaTYHui4gSv
 SRvQ==
X-Gm-Message-State: AOAM533YniA37uTumhj5Y67xFZyRUnC0SQA2CpHdEIy9jqs29jg6sFg2
 Ux4n30Dfv38QcbZQHPIwVN+KDujn60NFYIi1AtM=
X-Google-Smtp-Source: ABdhPJw6XRhfFzc0ep7oxhqIsPm6hA1ZYk5Rt4Z7Rf4kNW/IcW2BOalXNQMof7JDtDOsechyJwXMAwWd0bJeEtpmfUE=
X-Received: by 2002:a5d:6085:: with SMTP id w5mr16385547wrt.362.1598466412249; 
 Wed, 26 Aug 2020 11:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
 <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
In-Reply-To: <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Aug 2020 14:26:40 -0400
Message-ID: <CADnq5_PRuPtpzR-pCgXARRXVaC0vO=HdcGUkGQr7sDqUmq7G_Q@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Tom Murphy <murphyt7@tcd.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_142654_948642_F92062E0 
X-CRM114-Status: GOOD (  36.69  )
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-s390@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kukjin Kim <kgene@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 2:56 AM Tom Murphy <murphyt7@tcd.ie> wrote:
>
> Hi Logan/All,
>
> I have added a check for the sg_dma_len == 0 :
> """
>  } __sgt_iter(struct scatterlist *sgl, bool dma) {
>         struct sgt_iter s = { .sgp = sgl };
>
> +       if (sgl && sg_dma_len(sgl) == 0)
> +           s.sgp = NULL;
>
>         if (s.sgp) {
>             .....
> """
> at location [1].
> but it doens't fix the problem.
>
> You're right though, this change does need to be made, this code
> doesn't handle pages of sg_dma_len(sg) == 0 correctly
> So my guess is that we have more bugs in other parts of the i915
> driver (or there is a problem with my "sg_dma_len == 0" fix above).
> I have been trying to spot where else the code might be buggy but I
> haven't had any luck so far.
>
> I'm doing a microconfernce (at LPC 2020) this wednesdays [1] on this
> if you're interested in attending.
> I'm hoping I can chat about it with a few people and find how can
> reproduce and fix this issues. I don't have any more time I can give
> to this unfortunately and it would be a shame for the work to go to
> waste.
>
> [0] https://github.com/torvalds/linux/blob/d012a7190fc1fd72ed48911e77ca97ba4521bccd/drivers/gpu/drm/i915/i915_scatterlist.h#L28
> [1] https://linuxplumbersconf.org/event/7/contributions/846/
>
> On Fri, 29 May 2020 at 22:21, Logan Gunthorpe <logang@deltatee.com> wrote:
> >
> >
> >
> > On 2020-05-29 3:11 p.m., Marek Szyprowski wrote:
> > > Patches are pending:
> > > https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
> >
> > Cool, nice! Though, I still don't think that fixes the issue in
> > i915_scatterlist.h given it still ignores sg_dma_len() and strictly
> > relies on sg_next()/sg_is_last() to stop iterating -- and I suspect this
> > is the bug that got in Tom's way.
> >
> > >> However, as Robin pointed out, there are other ugly tricks like stopping
> > >> iterating through the SGL when sg_dma_len() is zero. For example, the
> > >> AMD driver appears to use drm_prime_sg_to_page_addr_arrays() which does
> > >> this trick and thus likely isn't buggy (otherwise, I'd expect someone to
> > >> have complained by now seeing AMD has already switched to IOMMU-DMA.

We ran into the same issue with amdgpu and radeon when the AMD IOMMU
driver was converted and had to fix it as well.  The relevant fixes
were:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42e67b479eab6d26459b80b4867298232b0435e7
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0199172f933342d8b1011aae2054a695c25726f4
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=47f7826c520ecd92ffbffe59ecaa2fe61e42ec70
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c0f83d164fb8f3a2b7bc379a6c1e27d1123a9eab

Alex

> > >
> > > I'm not sure that this is a trick. Stopping at zero sg_dma_len() was
> > > somewhere documented.
> >
> > Well whatever you want to call it, it is ugly to have some drivers doing
> > one thing with the returned value and others assuming there's an extra
> > zero at the end. It just causes confusion for people reading/copying the
> > code. It would be better if they are all consistent. However, I concede
> > stopping at zero should not be broken, presently.
> >
> > Logan
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
