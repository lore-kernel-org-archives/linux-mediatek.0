Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F2BC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=463+jZc1SwwU5dLnkJuI6XEsKfsLcH9JXONEkR0chgc=; b=5B3e56XcPgN29Mp6VrqkyqZqV3
	AAGEKZKIWJ9Qvg+3+JuzRvHfp6u2NgghazsBP7t2N9d+HrHFpqATrPpZlZuYCTlIUZXSHmAs0WmQs
	VZ/WoQ37K+k6HyN+BeUhOzunTR2g5hl9SS8J8lfIcSNPY56xVHky5FV6vZgdZFHGmtIT30OCkItkn
	bzdneTioKm5BHatPP1YcMIQHpeTmQUMJXHeb54j8/nXfMf14lOX6gO3oMa3dnAav2g0XewLd/AbP4
	eO6yD7Avvh2Wc8vN3pYNV8wGRvcTDHSvTw0qTJb48sL5KN3Em1yks1eQ+sn3QfV2ojfFUcQCPS/32
	R4u+1Prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDQh-0093NC-1q;
	Wed, 17 May 2023 09:26:43 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDQe-0093Hr-1v
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 09:26:41 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4360e117b7cso139353137.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684315584; x=1686907584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=463+jZc1SwwU5dLnkJuI6XEsKfsLcH9JXONEkR0chgc=;
        b=RTGq+QqJxYy7xeDFAit4vzaKELbLA36E0UzlE08wsYK6eLKFfbF2GkFnwLhz1m8eSQ
         VH8Ub22Ag9n5Z4MAdl2pmlAYpKCeZ2Y87GWNObQmYeAWwsZo/Ww2yljN54aRFCZR3jzh
         ManuXTZEbtdQH5i4shA/+zZZ6Fobi7suRF6XqWLFHnotR4ClCMIoD1CcybnDia3xqgKI
         ug4xMNdIYYKwR5CvQtLdK7QFw+HmMV+L3zh56RgjtfdbbEFsrddyx9aGaVfC8v9EdI1G
         6XdlCJOBA3YOXBngguDulzJ1HcRzO92hi7lU9+wXuSz5FGfFnxPidV40yb34KQO6Xa/r
         CyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684315584; x=1686907584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=463+jZc1SwwU5dLnkJuI6XEsKfsLcH9JXONEkR0chgc=;
        b=dAigaDon0dK2Ih4VQl1VsbaY4HI7e1uQ2iFNXDukybf1uuYRBNtHN9ODOhuExjRgSP
         Mgb/6LYZHtixlFTdkde3VU9Wm0ACMHCoa9K+gxDLAIgnXYTTBmsIB2AYZMuLAFD1+8n0
         vUvReSYFNnFRGHlcXD0wOBOH2Q4gZizfBM51IzAmX4f3+RaoA1M0e6g/3lzLzeVeC95C
         OT1w+sbT0Q55OnEz8yGWnntEe3Bbxuo2EPOAyB3rMbqfyMldnxm16qiC0mtE7xrqxnV/
         MDIvME3xqPl3ghnkh5vnC3uaqI0dEwmsAJnqtTLLM1PJ6xJEn6p0WcM4papms+y1ycfH
         czjw==
X-Gm-Message-State: AC+VfDw5gkr6iur26BwHPGJSwFs9c4qtAzq6e1Svc5PYgBFkL0AQZpEi
	Ao9bP4579W2Y3DivzmwHrisSL3UjERv+F4+mRtp8Lg==
X-Google-Smtp-Source: ACHHUZ7PlEf9sZpsVL8yIFKgry46KtQDWkG5cMNReUJNl/yajmdY8zfYgicaCu9oahkhryydSeLIJRfBwHvVgdFTVqg=
X-Received: by 2002:a67:e3c3:0:b0:436:367:4ac0 with SMTP id
 k3-20020a67e3c3000000b0043603674ac0mr13539923vsm.19.1684315584095; Wed, 17
 May 2023 02:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org> <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org>
In-Reply-To: <ZGSLiiK/JzD5KMd7@infradead.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 17 May 2023 14:56:13 +0530
Message-ID: <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
To: Christoph Hellwig <hch@infradead.org>
Cc: Xiaoming Ding <xiaoming.ding@mediatek.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com, 
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_022640_635753_5A021281 
X-CRM114-Status: GOOD (  17.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 17 May 2023 at 13:38, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, May 17, 2023 at 01:22:51PM +0530, Sumit Garg wrote:
> > > > +#if IS_ENABLED(CONFIG_CMA)
> > > > +     page_flag |= FOLL_LONGTERM;
> > > > +#endif
> > > >       if (flags & TEE_SHM_USER_MAPPED)
> > >
> > > If this mapping is long live it should always use FOLL_LONGTERM.
> >
> > It depends on the userspace application needs. However, I think it
> > should be safe to use FOLL_LONGTERM by default to serve cases like
> > secure media playback.
>
> long term is defined as won't automatically go away during the same
> syscall.

Do you mean a pinned user-space page can be paged out automatically?
The documentation [1] isn't very helpful here either since it talks
about "short term" vs "long term" in abstract terms.

Just FYI, the underlying use-case for TEE registered shared memory is
that the references to pinned pages are provided to TEE implementation
to operate upon. This can happen over multiple syscalls and we want
the pinned pages to be always in RAM as otherwise the physical
addresses may change if they are paged out in between. If this is only
supported reliably with a long term flag then this patch should be
tagged as a fix and requires stable backports.

[1] Documentation/core-api/pin_user_pages.rst

-Sumit

