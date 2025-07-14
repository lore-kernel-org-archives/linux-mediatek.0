Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD6DC83F1A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yry2upj+ByeYrrNjZKRJ8sVD88C6f2FVJf/Y5Atdgbc=; b=C6YoaFO8u4sTPrBUm3D9aGc4oB
	6g51/oTg1ECelvRVWjKlpZ5k3cQmsMU9dwRED9kG1E8Z9I90SuTFbvK17/GzopUmpN2YeH87PtTkX
	mR2NysxLdzU/31auHCRK/RFuWu9x4Aj44N+GTodDyLW8KMFnTM0iBfThIQlPj+y1UuO8/5pRyA/8x
	zJ4CJh7Yiq2U0DGgrRD7jlqJqE5dp/CjqpxuFLwsQDtBneDmqZu9zC+upr9bNJqLHp9+eg4elzsr9
	V9FoOt3sI2FFIQkz0CEevQHJdKBod0rRjNPvTmnguMryjkQOr7XVEcDkymVeIYtOOTcQLZcbcRRgp
	HzD/TKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubP02-000000039Nb-00Ii;
	Mon, 14 Jul 2025 19:38:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOzy-000000039Lm-2AKA
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Jul 2025 19:38:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-235e389599fso45285ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Jul 2025 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752521882; x=1753126682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yry2upj+ByeYrrNjZKRJ8sVD88C6f2FVJf/Y5Atdgbc=;
        b=FSeqgznoUBeGWHUs51C/1lUwY4l52TscfUirWXst78S2uu/fHtV86Jo6wIKxlZkKw9
         KqAXp6xc2v9of61Sc47QjPC0Khc502Tyvx0yS64urkrmlJ/oHTWm9mn1QGT1K+R/5u+E
         G7kra5BdxX6WdNlBVxCntcrvIt+DT+3KT3XlpfIRFKvAmq7jLz1qoyUNo5k4g+uj8Aqc
         ZZWL2BrxyYJejoVhGVyWM+nVjPt52pd1g5v6JwLJYpqbHd8+KI5ykyz7AXLT3xDDpcmb
         zVMrS7LiorbzXYsbXSpNMwQ+5jjtaqXuNWZrCW+Ie3j2jRHToUyVC59VA++eQGemlodS
         6XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521882; x=1753126682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yry2upj+ByeYrrNjZKRJ8sVD88C6f2FVJf/Y5Atdgbc=;
        b=kWUtzCsdcmMo9zfkndR2I0VMfsUVUQ2Xbk43P5Jpw76H3N/HihU2jNWsf+62PweNhv
         3E+i1PjPZjJUWaJ6vRfQfrOGsEjiK/9gb2YWn2zqjAj2kViXYnj/8kjRyQtX3hzCh/OF
         +WlSrx3/SjWtrfoTsxvyXwUlNUMN02oLVRlMZk3LzUfT2qx2DF/CQdqxkh67bjKtiqxL
         /IL47ExoLBgNvpoRTnGnLR+FYU+HhVcXJD6j/H5U3qFDNIoHnDFfdtlz2tephxIEC4Ki
         a76PN3Y7YQZ1owl4xYtXmwCx2m149rxsjFjqEKgtZ2ctJUg3q/y85bUTp610JLCseTk6
         w38Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQrZfvZ5yrJp7nAY6DI9ogvSwKq+78Iw3fDWK7IAInaE2IzjKPZNLy/mtx18SrYGb38tDCYHiI3NGN3yfm5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxetGDW5LaJ/2aynTG0Xwukmvp2cPk1U2WDhd1eRgH+031UTaHy
	RIYwvJnWpvPZzgId2Kiz8yk905deeHuvwt6NIf5mGdFR1epMmVWGCVnQ30nfKEyp6d41kWFvg6Q
	ucXrxQO8wBqtz4XTjaSOSUWMKmIQIlhSQ25LJSGOD
X-Gm-Gg: ASbGncvcuf8/ynBZtlR3F1DtkNAj4h/b0MDr494ZEvzPo+heZUywBFVbd5xBtd2XhMY
	qPy/dzWNHqHwe5KHYBZNLg62L3f9axFETlNCCtCrValfvzIZdvbU4+ypjeYcKyQY31+qaUNUWFg
	LJYCuRMv9OeUZWyPLNNtNjByDpEnNNPn3Nv7Zp3xjnhnJwM0HMuKwyJUCf39Hh4pH7C3pAx3ymd
	ot2HyIS8hZrQh4xQcY5+9RjI6Ootq6iPVFnhg==
X-Google-Smtp-Source: AGHT+IHZoWQ8pLUOjiCQlGlcYIPNmYT9TX3giO0kqF0O3T+xtLnHFh+M02Pq+s3+TLFDvQ9elFBdwtzpJc9HYJVxyEM=
X-Received: by 2002:a17:903:2484:b0:234:b2bf:e67e with SMTP id
 d9443c01a7336-23e1ac4613fmr298445ad.13.1752521881303; Mon, 14 Jul 2025
 12:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250714120047.35901-1-byungchul@sk.com> <20250714120047.35901-3-byungchul@sk.com>
In-Reply-To: <20250714120047.35901-3-byungchul@sk.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 14 Jul 2025 12:37:48 -0700
X-Gm-Features: Ac12FXwrdXtLbiJlmPY9vk8GjB7CqgoZsH_hsU8OuZVjZ5CbRybhtkUh-Kkp2jg
Message-ID: <CAHS8izO393X_BDJxnX2d-auhTwrUZK5wYdoAh_tJc0GBf0AqcQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250714_123802_550871_97C25C26 
X-CRM114-Status: GOOD (  27.47  )
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

On Mon, Jul 14, 2025 at 5:01=E2=80=AFAM Byungchul Park <byungchul@sk.com> w=
rote:
>
> To eliminate the use of the page pool fields in struct page, the page
> pool code should use netmem descriptor and APIs instead.
>
> However, __netmem_get_pp() still accesses ->pp via struct page.  So
> change it to use struct netmem_desc instead, since ->pp no longer will
> be available in struct page.
>
> While at it, add a helper, pp_page_to_nmdesc(), that can be used to
> extract netmem_desc from page only if it's pp page.  For now that
> netmem_desc overlays on page, it can be achieved by just casting.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  include/net/netmem.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 535cf17b9134..2b8a7b51ac99 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -267,6 +267,17 @@ static inline struct net_iov *__netmem_clear_lsb(net=
mem_ref netmem)
>         return (struct net_iov *)((__force unsigned long)netmem & ~NET_IO=
V);
>  }
>
> +static inline struct netmem_desc *pp_page_to_nmdesc(struct page *page)
> +{
> +       DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page));
> +
> +       /* XXX: How to extract netmem_desc from page must be changed,
> +        * once netmem_desc no longer overlays on page and will be
> +        * allocated through slab.
> +        */
> +       return (struct netmem_desc *)page;
> +}
> +

Same thing. Do not create a generic looking pp_page_to_nmdesc helper
which does not check that the page is the correct type. The
DEBUG_NET... is not good enough.

You don't need to add a generic helper here. There is only one call
site. Open code this in the callsite. The one callsite is marked as
unsafe, only called by code that knows that the netmem is specifically
a pp page. Open code this in the unsafe callsite, instead of creating
a generic looking unsafe helper and not even documenting it's unsafe.

>  /**
>   * __netmem_get_pp - unsafely get pointer to the &page_pool backing @net=
mem
>   * @netmem: netmem reference to get the pointer from
> @@ -280,7 +291,7 @@ static inline struct net_iov *__netmem_clear_lsb(netm=
em_ref netmem)
>   */
>  static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
>  {
> -       return __netmem_to_page(netmem)->pp;
> +       return pp_page_to_nmdesc(__netmem_to_page(netmem))->pp;
>  }

This makes me very sad. Casting from netmem -> page -> nmdesc...

Instead, we should be able to go from netmem directly to nmdesc. I
would suggest rename __netmem_clear_lsb to netmem_to_nmdesc and have
it return netmem_desc instead of net_iov. Then use it here.

We could have an unsafe version of netmem_to_nmdesc which converts the
netmem to netmem_desc without clearing the lsb and mark it unsafe.

--=20
Thanks,
Mina

