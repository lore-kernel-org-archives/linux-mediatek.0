Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BABC83F21
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 19:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDa5D0A4lwaiBKd2JNzdgebIMAD7+wg9x+lwbfz747o=; b=GnXdOULVtXf0xZ0aceUm7/se13
	A7/Pt0D1Wa6qf0wGZxFnln9ik1U37fMzjKHnIgebnPz4SbkfTlw9IcvRmo9EqPETdqR2BuXQXJGnk
	xbvcgU8Zy+x2z8WFGPQ+CRFsgCWzgiwOsuxoh1vxLvlI165Ax4L7CumUGCBjbp1n7eFZeFOVhfySR
	JTNhnuHfszD78pchdAXy/Xn7UsoxLv2j6c2UQA2kEwsFUsvr59huAQeW9HvDTW5HCNsG5hH3Dd1/Q
	sZ98p1rYfO73/I9w2OH6FuekHfccof9Wa0laYzJgsQMoJB9E2/8XMXP0GudlYwzNYVRshlF3YC2/s
	c8N2QZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPJo-00000003Arj-02VE;
	Mon, 14 Jul 2025 19:58:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPJk-00000003AqH-3mdu
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Jul 2025 19:58:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-23dd9ae5aacso7395ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Jul 2025 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752523108; x=1753127908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDa5D0A4lwaiBKd2JNzdgebIMAD7+wg9x+lwbfz747o=;
        b=xWEWz6LK/plO7UB0Tv+215nphovZxrRFRyh5v8qCOvE0Rt5BakuxQ0Ctxf542pE+YE
         fbhHCXGwlCqEZJjICPMAvsiSTy15xOo4+CbeK5GK4c+EBhuMaFw2BzKnl0Q93aS7Hdpp
         3pvw2f7PgFHcpJIHF1FAdFODWPEYjAVrWIvqVcF91VZfIs/bCREkRsLQA1jy2skIgZ1F
         acXqGT5f06jWyIpxsUEGjGhLycgB/hZiyqKO+ogwrq+Dg/hDW4Gxyt7n9SNp4YDE6qES
         /YhKFxUYC/ktS1Dkp5uIkrxpU/4fgHR+lbBeXT3yHWVneneadFVMKy0Wgr2AokmHR+S7
         q1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752523108; x=1753127908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDa5D0A4lwaiBKd2JNzdgebIMAD7+wg9x+lwbfz747o=;
        b=haRIH9f12TKRbSwpcAe+2iGE5qhnatM8VYjOgeAZ6/BADPL7wBrBYUt0paxxV9uQVT
         K7gnBrBnpXwLLBoLJudmgB7ZKx1QR0488mdGm/5KbW76Nw9cQfsoDpuAXadrB8LHh3Ro
         Fi3d6QTctS62b5U2G1XnzAusWhr8lb8DUqHfz+8M24/7xLOdN+TOFAcYAuk478mCFQ+F
         IBJcFVT/ie29MrVYafsm4immjO8O5OeL5mRnTi8mOnKr3tsu8IDWMkOqcyC4B32yhM8b
         Cw+WkhsIeEZrL2Ud2iZhH3NHz5H5CTQGuuhQxUMSQa++z56HqRYx+1D7WkWxoEJ7GNSx
         fdNA==
X-Forwarded-Encrypted: i=1; AJvYcCUzRkICsNafkdj8FEC1pkNE+aKHUb0Blj4/SwlH83MarfZbn97nI2WCcO4ZkVpO6pWl+bZLrdrpRUytxeSW4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKt5Y5qAf5LnPgzVKrVRPBgS1Dtt8XkdCnPDscA54QUr5ucf5K
	VxlbaYtISfGPB/ClxlzacWu5xlehGp7yR4OoaqogZ36lpfbW8ajTJfM9sxruihXqB3hPVqTgjy6
	Zo9CctKwtOthMbBgDnpXsxrVrJbfqZEeKXeHS+5Iy
X-Gm-Gg: ASbGncuMYvdhrDo7ILoQEOxJVtoxKB8KM2ZzcQbkfX7rVBck2ZXLrKXYye9Xi58iL+V
	BRICAvZmEKaWlu6Yj7/EHRQMHmcJh0jLQsrAQMZOxM34sGG11rMAWlqz8OjIRG0siqgVCe5P8GJ
	ztQ3ixUoSlnkuUkb2iXtLgTh3PdC7ToOcVAF4w1k+XG/vrDMrGmcQ00Z9TTD48AHoLzU1BaJWAG
	eRSheNZYYoZGaU7rMADN76vk5aRJK/2yvrDiaj70yojgMdw
X-Google-Smtp-Source: AGHT+IFWnfMDtJC2CezIF3KnAbgH/pbj3O5jwVGjDMwdXbeGoiYAzNm9r+9HSREvdPvfvdh1fRM05JSSpaSXXTed5k8=
X-Received: by 2002:a17:902:c40d:b0:235:e1fa:1fbc with SMTP id
 d9443c01a7336-23e1aa6bd1bmr603895ad.0.1752523107669; Mon, 14 Jul 2025
 12:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250714120047.35901-1-byungchul@sk.com> <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
In-Reply-To: <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 14 Jul 2025 12:58:15 -0700
X-Gm-Features: Ac12FXz5nYW9H_RK0Nw_oICAspVAx9135uss8L0AQRp8qp4a_9a4RkfhL6o4a4I
Message-ID: <CAHS8izNh7aCJOb1WKTx7CXNDPv_UBqFyq2XEHHhqHH=5JPmJCQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250714_125828_942034_8FFD5DBC 
X-CRM114-Status: GOOD (  40.24  )
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

On Mon, Jul 14, 2025 at 12:37=E2=80=AFPM Mina Almasry <almasrymina@google.c=
om> wrote:
>
> On Mon, Jul 14, 2025 at 5:01=E2=80=AFAM Byungchul Park <byungchul@sk.com>=
 wrote:
> >
> > To eliminate the use of the page pool fields in struct page, the page
> > pool code should use netmem descriptor and APIs instead.
> >
> > However, __netmem_get_pp() still accesses ->pp via struct page.  So
> > change it to use struct netmem_desc instead, since ->pp no longer will
> > be available in struct page.
> >
> > While at it, add a helper, pp_page_to_nmdesc(), that can be used to
> > extract netmem_desc from page only if it's pp page.  For now that
> > netmem_desc overlays on page, it can be achieved by just casting.
> >
> > Signed-off-by: Byungchul Park <byungchul@sk.com>
> > ---
> >  include/net/netmem.h | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/net/netmem.h b/include/net/netmem.h
> > index 535cf17b9134..2b8a7b51ac99 100644
> > --- a/include/net/netmem.h
> > +++ b/include/net/netmem.h
> > @@ -267,6 +267,17 @@ static inline struct net_iov *__netmem_clear_lsb(n=
etmem_ref netmem)
> >         return (struct net_iov *)((__force unsigned long)netmem & ~NET_=
IOV);
> >  }
> >
> > +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *page)
> > +{
> > +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
> > +
> > +       /* XXX: How to extract netmem_desc from page must be changed,
> > +        * once netmem_desc no longer overlays on page and will be
> > +        * allocated through slab.
> > +        */
> > +       return (struct netmem_desc *)page;
> > +}
> > +
>
> Same thing. Do not create a generic looking pp_page_to_nmdesc helper
> which does not check that the page is the correct type. The
> DEBUG_NET... is not good enough.
>
> You don't need to add a generic helper here. There is only one call
> site. Open code this in the callsite. The one callsite is marked as
> unsafe, only called by code that knows that the netmem is specifically
> a pp page. Open code this in the unsafe callsite, instead of creating
> a generic looking unsafe helper and not even documenting it's unsafe.
>

On second read through the series, I actually now think this is a
great idea :-) Adding this helper has simplified the series greatly. I
did not realize you were converting entire drivers to netmem just to
get rid of page->pp accesses. Adding a pp_page_to_nmdesc helper makes
the entire series simpler.

You're also calling it only from code paths like drivers that already
assumed that the page is a pp page and did page->pp deference without
a check, so this should be safe.

Only thing I would change is add a comment explaining that the calling
code needs to check the page is pp page or know it's a pp page (like a
driver that supports pp).


> >  /**
> >   * __netmem_get_pp - unsafely get pointer to the &page_pool backing @n=
etmem
> >   * @netmem: netmem reference to get the pointer from
> > @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_lsb(ne=
tmem_ref netmem)
> >   */
> >  static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
> >  {
> > -       return __netmem_to_page(netmem)->pp;
> > +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
> >  }
>
> This makes me very sad. Casting from netmem -> page -> nmdesc...
>
> Instead, we should be able to go from netmem directly to nmdesc. I
> would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
> it return netmem_desc instead of net_iov. Then use it here.
>
> We could have an unsafe version of netmem_to_nmdesc which converts the
> netmem to netmem_desc without clearing the lsb and mark it unsafe.
>

This, I think, we should address to keep some sanity in the code and
reduce the casts and make it a bit more maintainable.

--=20
Thanks,
Mina

