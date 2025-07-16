Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F1EC83F1B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jul 2025 20:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cBcxFpY+leZiSm2ZlkvHJhd+tn3lpuAd2BWjNqwWsU=; b=kDf3ETkRYGSru9IljpLQiNVfsT
	iya+X4EI/zD5EVnmohIj7iokQmA1VMDmsb+A4Wg0YqDhDovrRht8RbskEFp9IJTfSDqPLjQldTiie
	IehJao+sc9JDVPAngs91128iH8D3F8kF94wDQGu4qzM5Ftrif9TIAT95eCq6A3t1LZqUkmyMPaja1
	G9xfCS+H2DFgkcgNyU4IVyjor9JQAnVkGgXR4lldqB3PEvCzDSP/7iMthEXkDEdBYuhmgaZhIVU03
	U5+efXRUijLUx9l0EXgge5ySdVb9Cr5MYXRZ0B6AwOpEhaIDUVGEv+zscqj8538hHIjO7sEAWm347
	0Yan9XDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc98e-00000008e2v-0wvM;
	Wed, 16 Jul 2025 20:54:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc80F-00000008Wpf-1icJ
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Jul 2025 19:41:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2357c61cda7so2905ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Jul 2025 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752694878; x=1753299678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cBcxFpY+leZiSm2ZlkvHJhd+tn3lpuAd2BWjNqwWsU=;
        b=35hJhka6BrYW9uOJNLWTjmFkA1A0o8NtGHnqE6ayvkn6WM1JTo7yGl30dm/TN9xeb1
         zQHqd0lRjZSgldYIlnAwU6yvZV3Ly65QidAkNAwb3sJes7Y325YJj4lRCDmwGEf7VKTV
         DYldEOSkdjtZUuXzEvpFrVuJrk19TZf8nZBKa5Q9c6DbWbU8eJ545Dw0sCYyfoXs5epW
         1Yvu+LsZJEGWkHfIo9ZdwLEiAI2YCZVfGPNrCwgw121JKyCM4MEhZoTNZfn5i7hLADPv
         gC9SgHm6g4dxEQ1ubf1S0dJykR6xLDTgGDJcqSqkJYrPL+6sTbnKTq5kkjweMByJaR1V
         CMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694878; x=1753299678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cBcxFpY+leZiSm2ZlkvHJhd+tn3lpuAd2BWjNqwWsU=;
        b=DM+lWXOV9AKMr0J+/p3+hIqwXo5gK3q/hbMwIVAlLBgC3xhfTKr+zqJWp/e6Cytqqa
         3IojXx8Y4ymzdOAFXWC+SD2IxpFzyupjNHJFcAHAPIvML9s6Os5n573Dgl4cLUNMHUnx
         E8QZcYvBEst5DVZc8eHk5Qvp5e6Y9+aZTU7iVQP15UqqMCxIGAnJQkTy3BA5ouASEhjH
         FwtPsKrDmNIiaSVJmW6aue9SqbhveeFkswW643dLJDzr785FdWOJ9YwLjSQVY9YwoNHg
         gSRcJ26QiJPbdNq23ys8ylUE2MLoqpvcpfyIIikHAsqWGeh82jS/FFWvCdM20wCcAi4x
         eK6g==
X-Forwarded-Encrypted: i=1; AJvYcCUhAdXQh+74wvhin0QrzYxxv/p/GnGRZJm1yFgEHpfwZ5insJf6xltxlVJNDzHIXktrXIG36LE6ZwUuAPadBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrL7hiZmyy4BWgr7o6CEtY2K91jzcFIOBv78INolCQmsgmFor7
	xUyiW2h+Wc88Vrsq7bj3cc9S5MMyszCkwJfbThWd8LpRnODK4Wgf/GxaCi693a9kRfchNtSoCl2
	zVrmkIImUY5r2h/f84YxV/CpbgwHoDE430fbgapJH
X-Gm-Gg: ASbGncuZK0moA+T1kWLZT3HmBEJm0TjYeHHarVtnPaj1gibjlUCKRO1xUPygC9yLYCG
	Kul81eoim7TiM7/5E41lzMKVRNQBiSOb9jvDfvQv9cjDzpaNqpxK6WFyVKxDv2L7a9T6vxtH2c0
	Bnu9fIBzYWyQSzc5rUnY7L7UzChRgXkVzTqy6KGvsQ5dS2DK4D5kr5zobDKgWLVx7Y/LvbV5IOR
	T02WFm1
X-Google-Smtp-Source: AGHT+IFyX+XCNjY83DoIYD6wz3oMr28OgEv5cSQ9ojCgkzsna4P0DmbzE8rFt2raxHhdvl1dI8tDi1DCHzWnQLePCe8=
X-Received: by 2002:a17:903:174e:b0:234:a734:4ab9 with SMTP id
 d9443c01a7336-23e2fe3a9f6mr605605ad.20.1752694877565; Wed, 16 Jul 2025
 12:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250714120047.35901-1-byungchul@sk.com> <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
 <CAHS8izNh7aCJOb1WKTx7CXNDPv_UBqFyq2XEHHhqHH=5JPmJCQ@mail.gmail.com>
 <20250715013626.GA49874@system.software.com> <CAHS8izNgfrN-MimH1uv349AqNudvQJoeOsyHpoBT_QokF3Zv=w@mail.gmail.com>
 <20250716045124.GB12760@system.software.com>
In-Reply-To: <20250716045124.GB12760@system.software.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 16 Jul 2025 12:41:04 -0700
X-Gm-Features: Ac12FXwMabx4wvazw8X8IufyySuAWIkeeHz9sZZKQ1flAeUQa_1pSj5SZBgkO6M
Message-ID: <CAHS8izMK2JA4rGNMRMqQbZtJVEP8b_QPLXzoKNeVgQFzAmdv3g@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
To: Byungchul Park <byungchul@sk.com>, "Lobakin, Aleksander" <aleksander.lobakin@intel.com>
Cc: willy@infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kernel_team@skhynix.com, ilias.apalodimas@linaro.org, 
	harry.yoo@oracle.com, akpm@linux-foundation.org, andrew+netdev@lunn.ch, 
	asml.silence@gmail.com, toke@redhat.com, david@redhat.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
	vishal.moola@gmail.com, hannes@cmpxchg.org, ziy@nvidia.com, 
	jackmanb@google.com, wei.fang@nxp.com, shenwei.wang@nxp.com, 
	xiaoning.wang@nxp.com, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com, 
	przemyslaw.kitszel@intel.com, sgoutham@marvell.com, gakula@marvell.com, 
	sbhatta@marvell.com, hkelam@marvell.com, bbhushan2@marvell.com, 
	tariqt@nvidia.com, ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, saeedm@nvidia.com, leon@kernel.org, 
	mbloch@nvidia.com, danishanwar@ti.com, rogerq@kernel.org, nbd@nbd.name, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, horms@kernel.org, m-malladi@ti.com, 
	krzysztof.kozlowski@linaro.org, matthias.schiffer@ew.tq-group.com, 
	robh@kernel.org, imx@lists.linux.dev, intel-wired-lan@lists.osuosl.org, 
	linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_124119_449153_3F2D4D58 
X-CRM114-Status: GOOD (  62.64  )
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

On Tue, Jul 15, 2025 at 9:51=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> On Tue, Jul 15, 2025 at 12:09:34PM -0700, Mina Almasry wrote:
> > On Mon, Jul 14, 2025 at 6:36=E2=80=AFPM Byungchul Park <byungchul@sk.co=
m> wrote:
> > >
> > > On Mon, Jul 14, 2025 at 12:58:15PM -0700, Mina Almasry wrote:
> > > > On Mon, Jul 14, 2025 at 12:37=E2=80=AFPM Mina Almasry <almasrymina@=
google.com> wrote:
> > > > >
> > > > > On Mon, Jul 14, 2025 at 5:01=E2=80=AFAM Byungchul Park <byungchul=
@sk.com> wrote:
> > > > > >
> > > > > > To eliminate the use of the page pool fields in struct page, th=
e page
> > > > > > pool code should use netmem descriptor and APIs instead.
> > > > > >
> > > > > > However, __netmem_get_pp() still accesses ->pp via struct page.=
  So
> > > > > > change it to use struct netmem_desc instead, since ->pp no long=
er will
> > > > > > be available in struct page.
> > > > > >
> > > > > > While at it, add a helper, pp_page_to_nmdesc(), that can be use=
d to
> > > > > > extract netmem_desc from page only if it's pp page.  For now th=
at
> > > > > > netmem_desc overlays on page, it can be achieved by just castin=
g.
> > > > > >
> > > > > > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > > > > > ---
> > > > > >  include/net/netmem.h | 13 ++++++++++++-
> > > > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > > > > > index 535cf17b9134..2b8a7b51ac99 100644
> > > > > > --- a/include/net/netmem.h
> > > > > > +++ b/include/net/netmem.h
> > > > > > @@ -267,6 +267,17 @@ static inline struct net_iov *__netmem_cle=
ar_lsb(netmem_ref netmem)
> > > > > >         return (struct net_iov *)((__force unsigned long)netmem=
 & ~NET_IOV);
> > > > > >  }
> > > > > >
> > > > > > +static inline struct netmem_desc *pp_page_to_nmdesc(struct pag=
e *page)
> > > > > > +{
> > > > > > +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
> > > > > > +
> > > > > > +       /* XXX: How to extract netmem_desc from page must be ch=
anged,
> > > > > > +        * once netmem_desc no longer overlays on page and will=
 be
> > > > > > +        * allocated through slab.
> > > > > > +        */
> > > > > > +       return (struct netmem_desc *)page;
> > > > > > +}
> > > > > > +
> > > > >
> > > > > Same thing. Do not create a generic looking pp_page_to_nmdesc hel=
per
> > > > > which does not check that the page is the correct type. The
> > > > > DEBUG_NET... is not good enough.
> > > > >
> > > > > You don't need to add a generic helper here. There is only one ca=
ll
> > > > > site. Open code this in the callsite. The one callsite is marked =
as
> > > > > unsafe, only called by code that knows that the netmem is specifi=
cally
> > > > > a pp page. Open code this in the unsafe callsite, instead of crea=
ting
> > > > > a generic looking unsafe helper and not even documenting it's uns=
afe.
> > > > >
> > > >
> > > > On second read through the series, I actually now think this is a
> > > > great idea :-) Adding this helper has simplified the series greatly=
. I
> > > > did not realize you were converting entire drivers to netmem just t=
o
> > > > get rid of page->pp accesses. Adding a pp_page_to_nmdesc helper mak=
es
> > > > the entire series simpler.
> > > >
> > > > You're also calling it only from code paths like drivers that alrea=
dy
> > > > assumed that the page is a pp page and did page->pp deference witho=
ut
> > > > a check, so this should be safe.
> > > >
> > > > Only thing I would change is add a comment explaining that the call=
ing
> > > > code needs to check the page is pp page or know it's a pp page (lik=
e a
> > > > driver that supports pp).
> > > >
> > > >
> > > > > >  /**
> > > > > >   * __netmem_get_pp - unsafely get pointer to the &page_pool ba=
cking @netmem
> > > > > >   * @netmem: netmem reference to get the pointer from
> > > > > > @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clea=
r_lsb(netmem_ref netmem)
> > > > > >   */
> > > > > >  static inline struct page_pool *__netmem_get_pp(netmem_ref net=
mem)
> > > > > >  {
> > > > > > -       return __netmem_to_page(netmem)->pp;
> > > > > > +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
> > > > > >  }
> > > > >
> > > > > This makes me very sad. Casting from netmem -> page -> nmdesc...
> > > > >
> > > > > Instead, we should be able to go from netmem directly to nmdesc. =
I
> > > > > would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and h=
ave
> > > > > it return netmem_desc instead of net_iov. Then use it here.
> > > > >
> > > > > We could have an unsafe version of netmem_to_nmdesc which convert=
s the
> > > > > netmem to netmem_desc without clearing the lsb and mark it unsafe=
.
> > > > >
> > > >
> > > > This, I think, we should address to keep some sanity in the code an=
d
> > > > reduce the casts and make it a bit more maintainable.
> > >
> > > I will reflect your suggestions.  To summarize:
> > >
> > >    1) The current implementation of pp_page_to_nmdesc() is good enoug=
h
> > >       to keep, but add a comment on it like "Check if the page is a p=
p
> > >       page before calling this function or know it's a pp page.".
> > >
> >
> > Yes please.
> >
> > >    2) Introduce the unsafe version, __netmem_to_nmdesc(), and use it =
in
> > >       __netmem_get_pp().
> > >
> >
> > No need following Pavel's feedback. We can just delete
> > __netmem_get_pp. If we do find a need in the future to extract the
> > netmem_desc from a netmem_ref, I would rather we do a straight cast
> > from netmem_ref to netmem_desc rather than netmem_ref -> pages/net_iov
> > -> netmem_desc.
> >
> > But that seems unnecessary for this series.
>
> No.  The series should remove accessing ->pp through page.
>
> I will kill __netmem_get_pp() as you and I prefer.  However,
> __netmem_get_pp() users e.i. libeth_xdp_return_va() and
> libeth_xdp_tx_fill_buf() should be altered.  I will modify the code like:
>
> as is: __netmem_get_pp(netmem)
> to be: __netmem_nmdesc(netmem)->pp
>
> Is it okay with you?
>

When Pavel and I were saying 'remove __netmem_get_pp', I think we
meant to remove the entire concept of unsafe netmem -> page
conversions. I think we both don't like them. From this perspective,
__netmem_nmdesc(netmem)->pp is just as bad as __netmem_get_pp(netmem).

I think since the unsafe netmem-to-page casts are already in mainline,
lets assume they should stay there until someone feels strongly enough
to remove them. The logic in Olek's patch is sound:

https://lore.kernel.org/all/20241203173733.3181246-8-aleksander.lobakin@int=
el.com/

Header buffer page pools do always use pages and will likely remain so
for a long time, so I guess lets continue to support them rather than
try to remove them in this series. A followup series could try to
remove them.

> > >    3) Rename __netmem_clear_lsb() to netmem_to_nmdesc(), and return
> > >       netmem_desc, and use it in all users of __netmem_clear_lsb().
> > >
> >
> > Following Pavel's comment, this I think also is not necessary for this
> > series. Cleaning up the return value of __netmem_clear_lsb is good
> > work I think, but we're already on v10 of this and I think it would
> > unnecessary to ask for added cleanups. We can do the cleanup on top.
>
> However, I still need to include 'introduce __netmem_nmdesc() helper'

Yes.

> in this series since it should be used to remove __netmem_get_pp() as I

lets keep __netmem_get_pp, which does a `return
__netmem_nmdesc(netmem)->pp;` In general we avoid allowing the driver
to do any netmem casts in the driver code, and we do any casting in
core.

> described above.  I think I'd better add netmem_nmdesc() too while at it.
>

Yes. netmem_nmdesc should replace __netmem_clear_lsb.

> I assume __netmem_nmdesc() is an unsafe version not clearing lsb.  The

Yes.

> safe version, netmem_nmdesc() needs an additional operation clearing lsb.

Yes.


--
Thanks,
Mina

