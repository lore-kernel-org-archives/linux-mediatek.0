Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D11C83F22
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLN2gDZ9onoCs+NlWLd/HaKyjjBalP3C26bllNaupd8=; b=iRg1S/GOrQFvt6pyFVFIvet1At
	l2XARKtTw9toIy7zY/1fPKFrhrrkGDmrQVdYQF4HWNL0NVncYG9YqxFZRdzuJ6e1hjRWIi6mjmFe+
	Gq7hlJkxJ5K98TWiYEX6+33ly1uGEW/Jxj3LClZ0oCxhlC8o/AVPKvpzfmbmJXpffYrDCGbJLoF1O
	rvnVH3zC5mJbgf1uJdlGzZtLeyf8u8jL7mnwp4vk+ja3G4kZ8qWR2jJujonnzSw4GlHlEr0b2IvTt
	zS5Pr77b8r/cq4FLoC7EVWuix+ZKOJgnfJrcY5qVzhiNBGkDnvhhdSdl3nxUZGI1pw5JKzLx+juMA
	6NUisx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublD7-000000063ou-0p9v;
	Tue, 15 Jul 2025 19:21:05 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl2C-00000005x92-13nc
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 19:09:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23dd9ae5aacso37275ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Jul 2025 12:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752606587; x=1753211387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLN2gDZ9onoCs+NlWLd/HaKyjjBalP3C26bllNaupd8=;
        b=Ak2r+ryBU+TAxG44qNCMfA7fy9IKVlRKl+QmuVbnV9YLB/Vu+4BHt7CNbyO5rDhvjK
         XGCQtxfVoOAJqQ0FOjM0VsWaAj7zVxkyFv8STpNhz3oZY7xQzN7cNCPtk0QkxX1mo5Fk
         ioQBeYsVSxkPLLqS/jdEG54YsvowAzEkhlC256drsh/IqAqpQadXjCBgLcOYy9HKuC7M
         bRpmAUF8ve5pJWZJTiImRfTeZMygpiGL+xzhNenHxZDL1DCCak4UuJV0uL1WMaR2z4Ev
         7Ttff+GlIr4GMC2a1IZZqpIYbsPcMFeyAEhWqZcuMFDaufweD3dGJ84/i+Jt5c9NAne8
         y0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752606587; x=1753211387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YLN2gDZ9onoCs+NlWLd/HaKyjjBalP3C26bllNaupd8=;
        b=YTDow+ziQRXcwLa6SWsTYUl8HQOH9z8CnQxvQ5GISWvVx0H+mYITGydAqe0X6vPirD
         Sp1Srer1KTBFQM1K65EmLlA/tI/jMurxEM9/KP4qDAJe5ZE/6qJDekVbDyn0Qf4TJkvI
         /gzCttqvoBsMtWvYlz8s0gAZuR7rmbfNDzL+fcVkOib2I77eDDFUBvgQsGf7j+UaUqte
         +/iaxYuxTAi1N+fuMb9EshhZnizlJDm8cqQChcgzgFO7MmNbmcYQVoPDKe18wCKV8WwE
         KEYqnCPIUoTmwNw1WKULBB+eSEBk200LniwHkd/Ookl6e0FTvnefZJ/OBzigH8xFZhUs
         L1MA==
X-Forwarded-Encrypted: i=1; AJvYcCU8F8r3wCUKkOoGQl8S7iDEVWl6j6Gg+8bEzxK6FHfsoR3kM/vI8gB1MGJkTzhsA9GeiZ7Et1hh0UGKTwCu0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy44+7DzgoiEc75LisN3crgbj4Sah94AEvccR9am0oQhYWPXBh2
	KJSUPiViFpNW+3ZAHF2ZS9MkoB4S3tSgBBrhyeBZBbCXaC1u8uzdEIELVF6Mx9Y5W0/uKmJQ3iu
	sBVwuO0i912R2DZMFmH74aLsfmW4b94LU3oJ5RWJG
X-Gm-Gg: ASbGncvr7PUG5kbFG/Gqye8ZmMkSkBDpqqgtutANwMj2/lW1i5toeH7Qv7BmqWujpjb
	mQyjFM11UY7LsOFb4aMsCZjIlCFzW3ZTc7lEQXomHXtqTnrvY8VqeGZOzqQnfsVO22T2vEBeLdt
	JK+5y9/UTSIlcUeSYCXTapdFelc9h67vweHLVSTX0WTzNw5OhZEoG0wUMY2agq0zxMe97IoHq3K
	hCEt9RsQIqcnKX25M3PE3b1qBuu78dvGOWP6w==
X-Google-Smtp-Source: AGHT+IHowErSnvUulW5JXQBN4+fmG2zXgFSZ6eFQ/lioc5t7yVKoRiNFwd450XUTKcqJXTXwlIEmOQ0Irhzeefb0YRs=
X-Received: by 2002:a17:903:4b50:b0:234:48b2:fd63 with SMTP id
 d9443c01a7336-23e24d874edmr256525ad.21.1752606586807; Tue, 15 Jul 2025
 12:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250714120047.35901-1-byungchul@sk.com> <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
 <CAHS8izNh7aCJOb1WKTx7CXNDPv_UBqFyq2XEHHhqHH=5JPmJCQ@mail.gmail.com> <20250715013626.GA49874@system.software.com>
In-Reply-To: <20250715013626.GA49874@system.software.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 15 Jul 2025 12:09:34 -0700
X-Gm-Features: Ac12FXzmAscmFtXN7b2_Y3o9_BpXC5L5KXyNze-SOzs8SCUx-lkKZEIKcXC8OLg
Message-ID: <CAHS8izNgfrN-MimH1uv349AqNudvQJoeOsyHpoBT_QokF3Zv=w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
To: Byungchul Park <byungchul@sk.com>
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
	angelogioacchino.delregno@collabora.com, aleksander.lobakin@intel.com, 
	horms@kernel.org, m-malladi@ti.com, krzysztof.kozlowski@linaro.org, 
	matthias.schiffer@ew.tq-group.com, robh@kernel.org, imx@lists.linux.dev, 
	intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_120948_288841_E6DA1E1E 
X-CRM114-Status: GOOD (  54.23  )
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

On Mon, Jul 14, 2025 at 6:36=E2=80=AFPM Byungchul Park <byungchul@sk.com> w=
rote:
>
> On Mon, Jul 14, 2025 at 12:58:15PM -0700, Mina Almasry wrote:
> > On Mon, Jul 14, 2025 at 12:37=E2=80=AFPM Mina Almasry <almasrymina@goog=
le.com> wrote:
> > >
> > > On Mon, Jul 14, 2025 at 5:01=E2=80=AFAM Byungchul Park <byungchul@sk.=
com> wrote:
> > > >
> > > > To eliminate the use of the page pool fields in struct page, the pa=
ge
> > > > pool code should use netmem descriptor and APIs instead.
> > > >
> > > > However, __netmem_get_pp() still accesses ->pp via struct page.  So
> > > > change it to use struct netmem_desc instead, since ->pp no longer w=
ill
> > > > be available in struct page.
> > > >
> > > > While at it, add a helper, pp_page_to_nmdesc(), that can be used to
> > > > extract netmem_desc from page only if it's pp page.  For now that
> > > > netmem_desc overlays on page, it can be achieved by just casting.
> > > >
> > > > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > > > ---
> > > >  include/net/netmem.h | 13 ++++++++++++-
> > > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > > > index 535cf17b9134..2b8a7b51ac99 100644
> > > > --- a/include/net/netmem.h
> > > > +++ b/include/net/netmem.h
> > > > @@ -267,6 +267,17 @@ static inline struct net_iov *__netmem_clear_l=
sb(netmem_ref netmem)
> > > >         return (struct net_iov *)((__force unsigned long)netmem & ~=
NET_IOV);
> > > >  }
> > > >
> > > > +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *p=
age)
> > > > +{
> > > > +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
> > > > +
> > > > +       /* XXX: How to extract netmem_desc from page must be change=
d,
> > > > +        * once netmem_desc no longer overlays on page and will be
> > > > +        * allocated through slab.
> > > > +        */
> > > > +       return (struct netmem_desc *)page;
> > > > +}
> > > > +
> > >
> > > Same thing. Do not create a generic looking pp_page_to_nmdesc helper
> > > which does not check that the page is the correct type. The
> > > DEBUG_NET... is not good enough.
> > >
> > > You don't need to add a generic helper here. There is only one call
> > > site. Open code this in the callsite. The one callsite is marked as
> > > unsafe, only called by code that knows that the netmem is specificall=
y
> > > a pp page. Open code this in the unsafe callsite, instead of creating
> > > a generic looking unsafe helper and not even documenting it's unsafe.
> > >
> >
> > On second read through the series, I actually now think this is a
> > great idea :-) Adding this helper has simplified the series greatly. I
> > did not realize you were converting entire drivers to netmem just to
> > get rid of page->pp accesses. Adding a pp_page_to_nmdesc helper makes
> > the entire series simpler.
> >
> > You're also calling it only from code paths like drivers that already
> > assumed that the page is a pp page and did page->pp deference without
> > a check, so this should be safe.
> >
> > Only thing I would change is add a comment explaining that the calling
> > code needs to check the page is pp page or know it's a pp page (like a
> > driver that supports pp).
> >
> >
> > > >  /**
> > > >   * __netmem_get_pp - unsafely get pointer to the &page_pool backin=
g @netmem
> > > >   * @netmem: netmem reference to get the pointer from
> > > > @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_ls=
b(netmem_ref netmem)
> > > >   */
> > > >  static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
> > > >  {
> > > > -       return __netmem_to_page(netmem)->pp;
> > > > +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
> > > >  }
> > >
> > > This makes me very sad. Casting from netmem -> page -> nmdesc...
> > >
> > > Instead, we should be able to go from netmem directly to nmdesc. I
> > > would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
> > > it return netmem_desc instead of net_iov. Then use it here.
> > >
> > > We could have an unsafe version of netmem_to_nmdesc which converts th=
e
> > > netmem to netmem_desc without clearing the lsb and mark it unsafe.
> > >
> >
> > This, I think, we should address to keep some sanity in the code and
> > reduce the casts and make it a bit more maintainable.
>
> I will reflect your suggestions.  To summarize:
>
>    1) The current implementation of pp_page_to_nmdesc() is good enough
>       to keep, but add a comment on it like "Check if the page is a pp
>       page before calling this function or know it's a pp page.".
>

Yes please.

>    2) Introduce the unsafe version, __netmem_to_nmdesc(), and use it in
>       __netmem_get_pp().
>

No need following Pavel's feedback. We can just delete
__netmem_get_pp. If we do find a need in the future to extract the
netmem_desc from a netmem_ref, I would rather we do a straight cast
from netmem_ref to netmem_desc rather than netmem_ref -> pages/net_iov
-> netmem_desc.

But that seems unnecessary for this series.


>    3) Rename __netmem_clear_lsb() to netmem_to_nmdesc(), and return
>       netmem_desc, and use it in all users of __netmem_clear_lsb().
>

Following Pavel's comment, this I think also is not necessary for this
series. Cleaning up the return value of __netmem_clear_lsb is good
work I think, but we're already on v10 of this and I think it would
unnecessary to ask for added cleanups. We can do the cleanup on top.

> Anything else?

Thank you very much :-)

--=20
Thanks,
Mina

