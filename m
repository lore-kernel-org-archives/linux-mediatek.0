Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7065BC87FCB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Aug 2025 23:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzwCwuhZLT/+kj+O3V6lcQiJXb33vcCbaKrtnnQwVGI=; b=BMEOs7W7FPIjlb2h638kfTsv1J
	c2Gsan7U2edqwgZF5Ob4gh+xMw49c9rkGdsR/IX91ybpjeFFRQlg9SUUZBZQ/G3g3UaNXI6AN0Z6r
	BDo0K98ScEzYNG7P3ViRZLiXEv12cISm8OAV8olDaWTV80mDP7cnVgJOeGmNb17GBGK6yXgGfBZS1
	TAhlJHcEbjbexmcK3ZQ/mm+914cqs0Rp6y9dyGfEd9ABlyVihkMzBd1s632Eyht210V12j+Hp73gJ
	g0RvNLdaWBNAwx5TF1kwbPSpMR5gf2FzCG29p3TwDmqauW7Uv9b7nbNn/Uv0Xgnh01LkAFbBnj4Pe
	ygFrBfZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnLU-0000000GnjH-3ng4;
	Wed, 06 Aug 2025 23:14:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujm60-0000000GeQc-1v0j
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Aug 2025 21:54:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-240708ba498so27945ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Aug 2025 14:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754517292; x=1755122092; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzwCwuhZLT/+kj+O3V6lcQiJXb33vcCbaKrtnnQwVGI=;
        b=Jn4wEB6rDRF5qwtylarS5L04O7x5nImf84BuB2blToPQl52kUA0E2czv7phwmEw21O
         or6VCiRAfbRXh7+qThBcI6/3mpdncQx7IHD0nDjXgEjBoGNt1WnNprTDnow6actxcTxf
         SutoCWO8slQlSKCBpo1T/cauW+Hp6PrP3bl4cz1wEKra5fqY/uHWvYEwcu84zxLgJInD
         aTPfBJDGrp7496v/9cAqhbSS0GUb8KcXHqeseNcInur9dUbWZp9Rj75TlfugDeo+zGMj
         0Nb2+V6JxmdyKURGU3G/0whldkwcUgPqzpOo90S2D78DCF6ONgCD64Xfvk+O1fap0hJ4
         Z2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754517292; x=1755122092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzwCwuhZLT/+kj+O3V6lcQiJXb33vcCbaKrtnnQwVGI=;
        b=Vuy9P6EWDRzflSM5a3VIWSfjd4C2e03/QVcJJhsPnGbQxFUyeC/bU6nU5LWNCP7Hcl
         Bd7Nl7P9gvYUF1ZqvtPNpD2+Z2URktcX1QLXM+C7oCR+DXEKlR63u9WPdbS5ddT46RBB
         BQBYsQq5fCEOY3TZcV6QPe84pwIMpaaRdsXm8dPdx71E5K3qtTdQJoxdTIYMF8U9pSgI
         WWntrIhOWu5yXfbzPW5n+63jz0ereDmooiBqxiIoMjJinaL7aP6wvE4QCS7AMaB22gQI
         wggoJ8tFLbOy3CZr4BRdFGQ4k7izJnOdM+3HH9AVkS92imjiKTXrwDfIYGYcGjEVKQn+
         R1OA==
X-Forwarded-Encrypted: i=1; AJvYcCXt3IDZJXManQ6I1SllxQqV2DmtuVVb/epVcnS+LZumVVws/JTiL1adFR3vg0kYghEf/KhFnVmYzSL6pSjguQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQghk8P80XwP/lU4gW5Eh+4JqG6HSvV1YiS/xuTKxExFrfq/bz
	KA9ATuPVR0mIUHDgMgyBZ3FpffRTJjavKB+zIluf1P3gMoBaj4FYsONnUxxmlfzT5l1VZW9fVrz
	X9NFtxvvV+yf7H9ktHFi3yoPtNfRRaMe3//sUK8x/
X-Gm-Gg: ASbGncuVWQ/R0bq4BgMSKtxOOwwtcmNzjqOsSIHxH+e4a8kz2Ik8LAlVX8jx1eX98Gy
	l3KvovRa1aVA1G6OsDQ71ZyiQuhiHM0EiSUF/+8vzRwgGBOKIPjn0Hg1Ucz6LRRMPkMi4QSOug6
	TsGTVP9gHu2cuwqrpmfQyp4G4A19vzhy0D02QHsEjdlGpyefqBZJ9wnjBigPblvt0ch6FX+Ew67
	6xQ2eku9UrmkMUOqNQ0zCdSdOOWnjl9vw3YmI20Pmua0dkV
X-Google-Smtp-Source: AGHT+IFYqrtp7JG0RfEaCFBlvsdX3gPrSrR0w79mzMBohMX0IZtkG8ES6BAULUyIYgI5eIGYjgMK4NZ+91j3WRygSds=
X-Received: by 2002:a17:902:f685:b0:231:d0ef:e8ff with SMTP id
 d9443c01a7336-242b19cdb6emr1226665ad.8.1754517291353; Wed, 06 Aug 2025
 14:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAJDx_rgzkZognxWzOXJ-ZxdTtUaM3FT6bmpkwxMz03XiX3fKAQ@mail.gmail.com>
 <d395b14a-9a84-4f25-b4f0-45e8500fc5fe@redhat.com> <CAJDx_rgrp1TpOt-iDcsSGRTL=qZZsK_dpKL1bSkyunPGcGXt5g@mail.gmail.com>
 <4566222d-6b91-4789-bdd6-61e3769f5dbf@suse.cz> <CAJDx_rjvYdjPYHbBDKvkaWV=-OPJG=oRdSAugaOyJAXaOVu-9w@mail.gmail.com>
 <ee7ba479-4917-4d83-8130-8c247c08d2d0@suse.cz>
In-Reply-To: <ee7ba479-4917-4d83-8130-8c247c08d2d0@suse.cz>
From: Juan Yescas <jyescas@google.com>
Date: Wed, 6 Aug 2025 14:54:38 -0700
X-Gm-Features: Ac12FXzxJB1KJhmM9UUQIP_g3mb-qTY9IZidyxnzraRCfXRqR8AlpzShlLDxEgA
Message-ID: <CAJDx_rgL4bWnftmEfqnt87KuTYrvn-7J+ZOu5fd26q+fi0RVgQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, akash.tyagi@mediatek.com, 
	Andrew Morton <akpm@linux-foundation.org>, angelogioacchino.delregno@collabora.com, 
	hannes@cmpxchg.org, Brendan Jackman <jackmanb@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Linux Memory Management List <linux-mm@kvack.org>, matthias.bgg@gmail.com, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, wsd_upstream@mediatek.com, Zi Yan <ziy@nvidia.com>, 
	Kalesh Singh <kaleshsingh@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_145452_500086_8AAB7744 
X-CRM114-Status: GOOD (  20.03  )
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

On Tue, Aug 5, 2025 at 2:09=E2=80=AFPM Vlastimil Babka <vbabka@suse.cz> wro=
te:
>
> On 8/5/25 19:12, Juan Yescas wrote:
> > On Tue, Aug 5, 2025 at 2:52=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz>=
 wrote:
> >>
> >> >
> >> > Thanks David for the quick overview.
> >> >
> >> >> I still have no clue what this patch here tried to solve: it doesn'=
t
> >> >> make any sense.
> >> >>
> >> >
> >> > The story started with this out of tree patch that is part of Androi=
d.
> >> >
> >> > https://lore.kernel.org/lkml/cover.1604282969.git.cgoldswo@codeauror=
a.org/T/#u
> >> >
> >> > This patch introduced the __GFP_CMA flag that allocates pages from
> >> > MIGRATE_MOVABLE
> >> > or MIGRATE_CMA.
> >>
> >> What kinds of allocations would then use __GFP_CMA?
> >
> > The __GFP_CMA allocations are used to allocate userspace anonymous memo=
ry. This
> > was done initially in the alloc_zeroed_user_highpage_movable()
> > function, now it is done
> > in vma_alloc_zeroed_movable_folio().
>
> So that means you perceive the risk of anonymous memory being temporarily
> pinned and thwarting a alloc_contig_pages() device CMA allocation lower t=
han
> for file pages? The pinning can be a gup(), or a compaction migrating the
> page, etc...
>

I think that was the assumption when the patches were sent :(


>

