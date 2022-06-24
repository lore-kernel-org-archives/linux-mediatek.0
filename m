Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E18C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juJPwPR296pSJZwsH9/Iy+TMiLjsg5L/e3X7qop/D3w=; b=AUabQmUyUt+2597g2pNtj4Fj+g
	rPDxfu9x1oOkV/7xxhc55w0L179+ZlPatA8FPdp15DxGuKoMb/cZv1Zo13RVwCCvvqi/ma2kVUfEv
	fNvGAaSpn8WVFr5ceXapjri6OOI9LMSDFmbuIwuw6VLhJ/mCsArciClZk2ddOJT/vSidG6ofUngbI
	rbQvcIkYGKzlyGpwzU2L7nldC0VCBs9Z/Z14zHBSQSBhfe3mdvvHogW7vkwjgoZjdQL4ygwuhOQiH
	+wR1GfuTQry8r0f/noBKSBE1giRRD1A1jvuDfmihFpHu/FkjW765YsvAwjw15MI0nC13B58NU429q
	jzTvFDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4egM-001Ah6-CR; Fri, 24 Jun 2022 08:28:50 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4egJ-001Afa-DX
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 08:28:48 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-317a66d62dfso17677247b3.7
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 01:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=juJPwPR296pSJZwsH9/Iy+TMiLjsg5L/e3X7qop/D3w=;
        b=Yen0y2jHteguKUwEE6qaiTm+lhM9bjOuVD5af9lqIfB669iZhRqRU+TC8W6kj0hI3M
         YG3d6JOmMQ5+s1J+K+s4D6C8jualhWVv70vHc3EkNIE2cpKal4D48l0vJAiqwcX0p2CG
         F9tUhwi2kPg0X5cHoKyCGOO5FHxcxGuBLhgT0QoAI2A/xvHiRMrTQNktW6/o3SyyOGSK
         pe7IfdAY1PfZmHSU+A1FKLxfXQUSfCB1OwSiEcWDkbmxneFZUS5YCvsT9jJQ2M4ERlt8
         kPX6xhEblEjJUoujRI3ab/ZUqtI7zEGzWjZOQNFJU6vWPcfzfjwowpBy4gWsCdzgdpcr
         dpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=juJPwPR296pSJZwsH9/Iy+TMiLjsg5L/e3X7qop/D3w=;
        b=ubCDtkRVZy2d6Q6UG0GSVJm1GW1QBYOc8SxZC1Pr42sT6rE5GISogUSQ2PBKycGHlf
         45HBK7ktfapYAwBPDShIRIR9JxAHjU9Dc6eTr5gfi4VECFbu9z4xz9y6kcdKXS3gLI9d
         39np2cxA+eLqo9tsmFmPT+YeTYaoKA+/afGes2MGccg3PH14MPZIiHUdenMDaSg2EEyw
         9rHklA/ohdNMGt+40WLq7fRcCicc6lKeT9qeAcTFtOiorWRwTfxHWTHyVX1PvCV2l6te
         jaEhVloTqIoYo2m57Dz4aVWyspREAletcn7s9J/QewQpgtk5VRImf9iVu5U0HaxWkY3r
         gxSQ==
X-Gm-Message-State: AJIora92Abk2+Ancja+9r4f5vo+Ate2hiIIH4MeyhImELo5fLxrG455m
	60qTyomZGBg+/iudp97V5Zyd6RaTB3b4mI0+NomHYw==
X-Google-Smtp-Source: AGRyM1vpXuHX/b68bS4ayavud0a5eakM5MhbMfcsLJodMJUZ4whj1SvXh17eHSaMDiWAQlCGApLgvLq0yCqBlwuOVj0=
X-Received: by 2002:a81:3a12:0:b0:314:6097:b801 with SMTP id
 h18-20020a813a12000000b003146097b801mr15576175ywa.512.1656059324577; Fri, 24
 Jun 2022 01:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220623111937.6491-1-yee.lee@mediatek.com> <20220623111937.6491-2-yee.lee@mediatek.com>
 <CANpmjNN-jsZoVmJWD2Dz6O3_YVjy0av6e0iD-+OYXpik1LbLvg@mail.gmail.com> <bdfd039fbde06113071f773ae6d5635ff4664e2c.camel@mediatek.com>
In-Reply-To: <bdfd039fbde06113071f773ae6d5635ff4664e2c.camel@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Fri, 24 Jun 2022 10:28:08 +0200
Message-ID: <CANpmjNPfkFjUteMCDzUSPmTKbpnSfjmWqp9ft8vb-v=B8eeRKw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: kfence: skip kmemleak alloc in kfence_pool
To: Yee Lee <yee.lee@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, "open list:KFENCE" <kasan-dev@googlegroups.com>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_012847_495401_5E5558F1 
X-CRM114-Status: GOOD (  26.44  )
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

On Fri, 24 Jun 2022 at 10:20, 'Yee Lee' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Thu, 2022-06-23 at 13:59 +0200, Marco Elver wrote:
> > On Thu, 23 Jun 2022 at 13:20, yee.lee via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> > >
> > > From: Yee Lee <yee.lee@mediatek.com>
> > >
> > > Use MEMBLOCK_ALLOC_NOLEAKTRACE to skip kmemleak registration when
> > > the kfence pool is allocated from memblock. And the kmemleak_free
> > > later can be removed too.
> >
> > Is this purely meant to be a cleanup and non-functional change?
> >
> > > Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> > >
> > > ---
> > >  mm/kfence/core.c | 18 ++++++++----------
> > >  1 file changed, 8 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> > > index 4e7cd4c8e687..0d33d83f5244 100644
> > > --- a/mm/kfence/core.c
> > > +++ b/mm/kfence/core.c
> > > @@ -600,14 +600,6 @@ static unsigned long kfence_init_pool(void)
> > >                 addr += 2 * PAGE_SIZE;
> > >         }
> > >
> > > -       /*
> > > -        * The pool is live and will never be deallocated from this
> > > point on.
> > > -        * Remove the pool object from the kmemleak object tree, as
> > > it would
> > > -        * otherwise overlap with allocations returned by
> > > kfence_alloc(), which
> > > -        * are registered with kmemleak through the slab post-alloc
> > > hook.
> > > -        */
> > > -       kmemleak_free(__kfence_pool);
> >
> > This appears to only be a non-functional change if the pool is
> > allocated early. If the pool is allocated late using page-alloc, then
> > there'll not be a kmemleak_free() on that memory and we'll have the
> > same problem.
>
> Do you mean the kzalloc(slab_is_available) in memblock_allc()? That
> implies that MEMBLOCK_ALLOC_NOLEAKTRACE has no guarantee skipping
> kmemleak_alloc from this. (Maybe add it?)

No, if KFENCE is initialized through kfence_init_late() ->
kfence_init_pool_late() -> kfence_init_pool().

