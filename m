Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA39BC83F17
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzQixld7pSKyZ/Q/HfBpbSkDP1wbVsZogbStCOaFhmk=; b=zqihCQpWTShJ7WRQtGsyn6ooT7
	v1dmf4Bb6cY9Jy+Dmo+YEOiy8MCITCAbY4PZgBKewflqxi4hyeyxd4sefRRxnIStRgcNnt1NsX6j1
	KeesBayl/8g/PWypBJhO0oH+LDbQUuO+RDtw1aax9HmPTeeMEPOCt9LDNlZ8VIJvE9l9Lc3Lyk+4t
	ZX/9YZxgf7iK4omXBp4+H/tOdiU8VezTkCHcbsgIYR9UzYR1FgnJP6Awq5nDf+la+a4k+9RVoL4wm
	HVh7333cZxHCEs4NEfMeZs7jZgdTJjqppjZBxYk8o5tIWHpA4iVb62wR+/T3lqSBdiJfXeK+bs9d4
	JGyFTOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubm9s-00000006AfT-14Vo;
	Tue, 15 Jul 2025 20:21:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubkzL-00000005wqI-49DE
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 19:06:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-237f18108d2so46245ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Jul 2025 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752606410; x=1753211210; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzQixld7pSKyZ/Q/HfBpbSkDP1wbVsZogbStCOaFhmk=;
        b=RoFzOAdKO4a3TxpVjjlxeHTNFe3mJ7mbMb6tMHHzxvQ2PCERQejF9BGsikaMOgoZlo
         RxZFa0H48VVcgXBqmfHwj804cmIXgj+Rt4Niw1DW/607y7h+GyiepU2eDSBd/64kr0Px
         x1Vd9UBNR+MVu4TCI6OdP/gE0mU0SmziFFOyYK/bCtHmNS8Z180evDgvzH7+4yHQAAXx
         bjrp54ZRfapHPzxTrYzLZJPJhqp1tPIwDjJEIEf2aJqSsSwl0i5V7mLnVGDYsYuI5wBl
         /YL17sXkMDjRt1/Ew0FTYriQ/6XCrrzmeslULeUAa1NR4uGNc3gsUaBF+0AODbH2Sohv
         GH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752606410; x=1753211210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzQixld7pSKyZ/Q/HfBpbSkDP1wbVsZogbStCOaFhmk=;
        b=lRhSMceh6G7mJ3qM797s6ezTqwQEiEyOUg6D6cfsNFOJVXqjR0fWG9bD5uJzCtprCY
         g99an1Wo42NGReOJAAaZlmQTgbqKwcLDszaTndcjRvYwVdPGKTihGFKp8FkNAwiFXCmH
         Xl7kCCuXsk7yp7FCZ48S+UvB4ZDokHy4fpfQe2npT1raSRQl23U3REBi2OBC5N0B0DxC
         kYdh/qbw/g+iB7bblAJLeTFn4YLEf3/ulghLPoWx4FP5AV7i9igLoWLqza5CvwmKr1HB
         0F67kE88wIMfOYA78fkqAjjIsk8HUKZj0P+tXlHATYUmGM7ZrZrVSm/l9jYndxxNd9ql
         Gvmg==
X-Forwarded-Encrypted: i=1; AJvYcCXvJKXlCwdxYxXSrh4WMSu7p+leoX3M+7iibZlljUW6bDuOsE2aPwwEA//ipDqGiNMQUpLVQqbTsHDG6lJ9CA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXPDPsXSTw2j3/s/H6S0bK5mxmJS4A+Z5vzGKtNxoFYFQGNCJl
	5fSt0dUsULYhSOtApuBRggP88Wlv1DBcOzDaOn52j4VFPrv4qcQlk3bwwLjs2FVAfYTEZXt5UU4
	RhsH9OndE08lX3TOqZOeGlnLSA1soJ67v6U78RQEb
X-Gm-Gg: ASbGncujveqBBW0/UMLDpC3oMaEJgz6FYSQ1bI/d3dmYG/d6RMKcI2cgx/NGMQKXHOR
	zro+YCO+WGmNsFJhH2AwigLmczzSnlWcG4sRy4EZLggCKRjn2DgoYi5bOwPT8C2BdCgxl9/EUUP
	XHPraDlX4zEZvwa7aIWfL89xHIhWy5Oc0FuDyWZfr3dlTYp1yBfuFbuF2fJyPhiVFl6u6Rh3LOe
	cCGBgJ6TabPGoVDIT4pnDoMJc8wBXjdqu37tA==
X-Google-Smtp-Source: AGHT+IERW8BNAcLICEi0xDHHwbh6I9mZCyIk3Mt306+jQnPwqHCieheEaqBVCmnvb9hqZyStUnuqxe9DuyWkdC9x3QM=
X-Received: by 2002:a17:902:cec3:b0:235:f298:cbbb with SMTP id
 d9443c01a7336-23e24c6e119mr315625ad.26.1752606409905; Tue, 15 Jul 2025
 12:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250714120047.35901-1-byungchul@sk.com> <20250714120047.35901-3-byungchul@sk.com>
 <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com> <9bed2f6e-6251-4d0c-ad1e-f1b8625a0a10@gmail.com>
In-Reply-To: <9bed2f6e-6251-4d0c-ad1e-f1b8625a0a10@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 15 Jul 2025 12:06:36 -0700
X-Gm-Features: Ac12FXwyUUoU8xGdECWjpzai5Qr9bPwFw8HDcAUKWZbO5pnAVYeauYEt5y8_8Qs
Message-ID: <CAHS8izMYLw3JfonoQ7n4ZaWivdBVKqZejgyRiAku5j1rx7gBPQ@mail.gmail.com>
Subject: Re: [PATCH net-next v10 02/12] netmem: use netmem_desc instead of
 page to access ->pp in __netmem_get_pp()
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Byungchul Park <byungchul@sk.com>, willy@infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel_team@skhynix.com, 
	ilias.apalodimas@linaro.org, harry.yoo@oracle.com, akpm@linux-foundation.org, 
	andrew+netdev@lunn.ch, toke@redhat.com, david@redhat.com, 
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
X-CRM114-CacheID: sfid-20250715_120652_026620_5162FDCA 
X-CRM114-Status: GOOD (  30.97  )
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

On Tue, Jul 15, 2025 at 3:36=E2=80=AFAM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 7/14/25 20:37, Mina Almasry wrote:
> > On Mon, Jul 14, 2025 at 5:01=E2=80=AFAM Byungchul Park <byungchul@sk.co=
m> wrote:
> ...>> +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *p=
age)
> >> +{
> >> +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
> >> +
> >> +       /* XXX: How to extract netmem_desc from page must be changed,
> >> +        * once netmem_desc no longer overlays on page and will be
> >> +        * allocated through slab.
> >> +        */
> >> +       return (struct netmem_desc *)page;
> >> +}
> >> +
> >
> > Same thing. Do not create a generic looking pp_page_to_nmdesc helper
> > which does not check that the page is the correct type. The
> > DEBUG_NET... is not good enough.
> >
> > You don't need to add a generic helper here. There is only one call
> > site. Open code this in the callsite. The one callsite is marked as
> > unsafe, only called by code that knows that the netmem is specifically
> > a pp page. Open code this in the unsafe callsite, instead of creating
> > a generic looking unsafe helper and not even documenting it's unsafe.
> >
> >>   /**
> >>    * __netmem_get_pp - unsafely get pointer to the &page_pool backing =
@netmem
> >>    * @netmem: netmem reference to get the pointer from
> >> @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_lsb(n=
etmem_ref netmem)
> >>    */
> >>   static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
> >>   {
> >> -       return __netmem_to_page(netmem)->pp;
> >> +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
> >>   }
> >
> > This makes me very sad. Casting from netmem -> page -> nmdesc...
>
> The function is not used, and I don't think the series adds any
> new users? It can be killed then. It's a horrible function anyway,
> would be much better to have a variant taking struct page * if
> necessary.
>
> > Instead, we should be able to go from netmem directly to nmdesc. I
> > would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
> > it return netmem_desc instead of net_iov. Then use it here.
>
> Glad you liked the diff I suggested :) In either case, seems
> like it's not strictly necessary for this iteration as
> __netmem_get_pp() should be killed, and the rest of patches work
> directly with pages.

Good catch, in that case lets just delete __netmem_get_pp and there is
no need to add a netmem_nmdesc unless we find some other call site
that needs it.

--=20
Thanks,
Mina

