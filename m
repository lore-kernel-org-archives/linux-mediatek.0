Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E74C282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b78KlAfyXKoBfZcmMN7ECuBnSEo3W7UZ1w2TCHUTUXU=; b=F0sqcNNrIlvUvPmcxQ+Ogt4lv/
	yZOsvyYFj6kenEzbgvIwo9RHkn/MVKPQlOYir32EMxHyNF/en5mpDxX/SDa3f+N7g69nOivGevei2
	EvucW/P5Kwiz0ZWmknEiIkJqQbgULMEgNTsqI36ceuEbz/jueNNtHPwTNZZ8L5Ft1MVldqE6G0FwH
	eCxGDZ9fo5fjg/d4R0wmaL24Jw/ajFKvJofrL0RJvy81Q0IYGLQfjPoFOIVVG4z/w8wDAefMut2yQ
	DojDuIIjjK/06tC9k/HHRC5sn3Q9xD+2R/2TbwTL2XTXx6M5bL7ptoz2BGWUXxE4RpCDjS7tkP2q+
	YsP5TmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgzU-00000003VRi-3HUD;
	Mon, 10 Mar 2025 17:32:36 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgxz-00000003VFL-1eUV;
	Mon, 10 Mar 2025 17:31:08 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8fc176825so34515866d6.0;
        Mon, 10 Mar 2025 10:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741627861; x=1742232661; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b78KlAfyXKoBfZcmMN7ECuBnSEo3W7UZ1w2TCHUTUXU=;
        b=TMvSDF/V7ru60/qnSx2ILW0+sF4HjPd6tIlPd7PIV8lfYEUFTwMOl7KvG7cpTxIUnE
         O727jz8yOjj3fLnP/GuvnVErSXAHlCeQvHsVO0X6UsChVH/3183Oc9eTpGBMWBtN3zxR
         hH0ZSLIYm3+bZKTkm+iovZ3WrCzgSsJLyLPBnHbmxooTo0Uykx21T915UpJqpUOdSkOY
         /o3DpeRn5n9gE3DZw5/xt2gT5PmhNO+FJwGXEzvhk4y7Gr91SheTxsQ31gqiPClAq+jK
         Jg2TcMkyTlaIcrvVdL2VUZ7USQB8q/CMZZJd852mhXDlNFgMwjH4Fw0YBkcqf74kjkxi
         vVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741627861; x=1742232661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b78KlAfyXKoBfZcmMN7ECuBnSEo3W7UZ1w2TCHUTUXU=;
        b=Tj+Mq14D8ixkhglns+0/pDZmaVK++rRceIavzqpJ7bwlG5IgeAsWBGK8vA0WZgZadQ
         AALicj1ja+Fs08v0AeoVsN77heYcwRHktQxp/h94Uc96vzxrrgG/ASmqQvmwlUkA30Ap
         GeiPxGscn2d+YWJi+dEfzUWkOoK1JuTw+oFRB+739kX5+SRySwgHmf8Ol+pzuHc9H3Lp
         WZL9t0lC40i4N4/kH99b8NGWC564z44w7/kr1NsZvDYuPQLKIJ7I7TH8stHrRjm345Xa
         Sm4KiocuWSV34Zr54nFRLQPxtNMGlveg5zp5pAb9ifk/ZUQ+R9Yvi9DJJR/K+zuUip4F
         WlJw==
X-Forwarded-Encrypted: i=1; AJvYcCUBoGfSoBruXPwHoWEBJqMkSU7y3yol8Od9anjXBXMs+FKbZuGmsrx3ZWk+gIF9cEJzu8ZP8XMLX2BFHBCYtXE=@lists.infradead.org, AJvYcCWNMkhVQWZs5cjy/kT4n5eLNjXLhIyx5NvoDV+PiiePjlzL0YYtwXQhhi41nbIEuzRgylujP+fcantK6WYeXK4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxknUrNYKx167AEOMq2V7bUA3HAwZv5CGgunq8sAkkMLaqtBbK8
	ccRNYJ19DPRz0iwDsXllQGkizjvCbtudanKAfqc1iXf2gyf9fYRVAdTF/XgsexEbc8UXUvS+jHY
	NdtGtgBkj3CbKNezDCj5zJM/SFTU=
X-Gm-Gg: ASbGncvvh3yhnA7oYf47KihIKKlrVDoUxhCzz1XXnRg0DV9qbNDtR5WZGiSjFD+TYJW
	y36XCImLyYBwxnUBpEE98Z+7Qb2WV/zVEiTBkdgLKFCJrDawu4+S0o0FxdsQIIdiGa+vRnX7BEg
	jSw/cYYm5YIsdQM0/AxFR9IJyLbm0bI4h93NqRfAqg9tRRM0e7TVyAKtYIsA==
X-Google-Smtp-Source: AGHT+IH1LLSAI/+s4Zi9zEGfRKSLEY80Xhq1yNJSxRKUtitCQBu1/cEDGmenPOC3lpC07sG6xvj89oLC5RUraLQQ57A=
X-Received: by 2002:ad4:5945:0:b0:6e8:feae:929c with SMTP id
 6a1803df08f44-6ea2dd25b7dmr6779506d6.21.1741627861048; Mon, 10 Mar 2025
 10:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
 <CAGsJ_4ysL1xV=902oNM3vBfianF6F_iqDgyck6DGzFrZCtOprw@mail.gmail.com>
 <52896654fa07a685707b11cfcc141b038a13b649.camel@mediatek.com> <CAKEwX=PNHik8O6swwRPsuDovtCNLxXRQUsiXZSSq8ZbzFvJV0w@mail.gmail.com>
In-Reply-To: <CAKEwX=PNHik8O6swwRPsuDovtCNLxXRQUsiXZSSq8ZbzFvJV0w@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 10 Mar 2025 10:30:48 -0700
X-Gm-Features: AQ5f1JpRFqqTBM7MTZvYEz_bClOJNrcAPr9qIUA-7zONYB5oqdusO9tVlggAxPY
Message-ID: <CAKEwX=Onwhy7FkB97tw4JonN3POj=dDp3ixsfS14=_3x3=KvuA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>
Cc: "21cnbao@gmail.com" <21cnbao@gmail.com>, =?UTF-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>, 
	=?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>, 
	"chrisl@kernel.org" <chrisl@kernel.org>, =?UTF-8?B?SmFtZXMgSHN1ICjlvpDmhbbolrAp?= <James.Hsu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"dave.jiang@intel.com" <dave.jiang@intel.com>, 
	"schatzberg.dan@gmail.com" <schatzberg.dan@gmail.com>, 
	=?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang@mediatek.com>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"minchan@kernel.org" <minchan@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "kasong@tencent.com" <kasong@tencent.com>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, 
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_103103_435917_257166BE 
X-CRM114-Status: GOOD (  35.87  )
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

On Mon, Mar 10, 2025 at 9:58=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Mon, Mar 10, 2025 at 6:22=E2=80=AFAM Qun-wei Lin (=E6=9E=97=E7=BE=A4=
=E5=B4=B4)
> <Qun-wei.Lin@mediatek.com> wrote:
> >
> >
> > Thank you for your explanation. Compared to the original single kswapd,
> > we expect t1 to have a slight increase in re-scan time. However, since
> > our kcompressd can focus on compression tasks and we can have multiple
> > kcompressd instances (kcompressd0, kcompressd1, ...) running in
> > parallel, we anticipate that the number of times a folio needs be re-
> > scanned will not be too many.
> >
> > In our experiments, we fixed the CPU and DRAM at a certain frequency.
> > We created a high memory pressure enviroment using a memory eater and
> > recorded the increase in pgsteal_anon per second, which was around 300,
> > 000. Then we applied our patch and measured again, that pgsteal_anon/s
> > increased to over 800,000.
> >
> > > >
> > > > >
> > > > > Problem:
> > > > >  In the current system, the kswapd thread is responsible for both
> > > > >  scanning the LRU pages and compressing pages into the ZRAM. This
> > > > >  combined responsibility can lead to significant performance
> > > > > bottlenecks,
> > > >
> > > > What bottleneck are we talking about? Is one stage slower than the
> > > > other?
> > > >
> > > > >  especially under high memory pressure. The kswapd thread becomes
> > > > > a
> > > > >  single point of contention, causing delays in memory reclaiming
> > > > > and
> > > > >  overall system performance degradation.
> > > > >
> > > > > Target:
> > > > >  The target of this invention is to improve the efficiency of
> > > > > memory
> > > > >  reclaiming. By separating the tasks of page scanning and page
> > > > >  compression into distinct processes or threads, the system can
> > > > > handle
> > > > >  memory pressure more effectively.
> > > >
> > > > I'm not a zram maintainer, so I'm definitely not trying to stop
> > > > this
> > > > patch. But whatever problem zram is facing will likely occur with
> > > > zswap too, so I'd like to learn more :)
> > >
> > > Right, this is likely something that could be addressed more
> > > generally
> > > for zswap and zram.
> > >
> >
> > Yes, we also hope to extend this to other swap devices, but currently,
> > we have only modified zram. We are not very familiar with zswap and
> > would like to ask if anyone has any suggestions for modifications?
> >
>
> My understanding is right now schedule_bio_write is the work
> submission API right? We can make it generic, having it accept a
> callback and a generic untyped pointer which can be casted into a
> backend-specific context struct. For zram it would contain struct zram
> and the bio. For zswap, depending on at which point do you want to
> begin offloading the work - it could simply be just the folio itself
> if we offload early, or a more complicated scheme.

To expand a bit - zswap_store() is where all the logic lives. It's
fairly straightforward: checking zswap cgroup limits, acquire the
zswap pool (a combination of compression algorithm and backend memory
allocator, which is just zsmalloc now), perform compression, then ask
for a slot from zsmalloc and store it there.

You can probably just offload the whole thing here, or perform some
steps of the sequence before offloading the rest :) One slight
complication is don't forget to fallback to disk swapping - unlike
zram, zswap is originally designed as a "cache" for underlying swap
files on disk, which we can fallback to if the compression attempt
fails. Everything should be fairly straightforward though :)

>
>
>
> > > Thanks
> > > Barry
> >
> > Best Regards,
> > Qun-wei
> >
> >

