Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D91C7EE39
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jun 2025 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDcARP6CMmcJuYEL59wH4tdcs7qBxPVhWeD7yb9xdM4=; b=0kDWX/11WXUukzg5ObZu10pHnU
	1tC0dycj/b1iahr157Mk57ycQeMmhHrsGm1Xw7V3ZeqUt4pqPiwrZ6ZXIcprkDB4xoM92NGpUyT2o
	tScqM6z8pWP9n60H1u+8BCh6IIQXEr+ahW3x9q7z528sRWqF8GjEf/OJOXiUKU1g/FkM/nEHfFj0Q
	kDzCsKA67E9jNkB+OkePPj5koW7gShd3S8qrJFGQCI5X9pfCPxym5HlP0kUNw2nSBkPvI0eFcNjSu
	yBh1FE/fekuROAyD0nKPzZopjcfDkfD+6ad0nef1POKrH7orkdV9GjF6IpXgcLw3ADPYjdzITxcr0
	WJBJ4C0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVtQP-00000000Nx1-400a;
	Sun, 29 Jun 2025 14:54:33 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVtQM-00000000NvA-3MUq
	for linux-mediatek@lists.infradead.org;
	Sun, 29 Jun 2025 14:54:33 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751208864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDcARP6CMmcJuYEL59wH4tdcs7qBxPVhWeD7yb9xdM4=;
	b=bg7hi60p2EvQw+jlWo+D3xjgX3zrQRNhTbhDlO2wcFmGjZP6cjHZZte79RK5shv08wZFFW
	Io3C9z+9mSq5aFk4vnqW/l3baxaua94shRPOGy5pkw/B7FtOK25wuGiLe/m+p2BISHHFYV
	GstmwT4CHBvok5WTwh3dVZQDgQooqi8=
Date: Sun, 29 Jun 2025 14:54:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <15a39258ece1eee5f42ef6d244befd88f9671a08@linux.dev>
TLS-Required: No
Subject: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
To: "Andrew Lunn" <andrew@lunn.ch>, "Daniel Golle" <daniel@makrotopia.org>
Cc: "Sky Huang" <skylake.huang@mediatek.com>, netdev@vger.kernel.org, "Sean
 Wang" <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Eric Dumazet" <edumazet@google.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, "Bo-Cun
 Chen" <bc-bocun.chen@mediatek.com>, "Eric Woudstra"
 <ericwouds@gmail.com>, "Elad Yifee" <eladwf@gmail.com>, "Jakub Kicinski"
 <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Lorenzo Bianconi"
 <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Felix Fietkau" <nbd@nbd.name>
In-Reply-To: <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
 <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_075431_577533_EC38AB16 
X-CRM114-Status: GOOD (  11.76  )
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

Hi Andrew,

> Gesendet: Samstag, 28. Juni 2025 um 10:13
> Von: "Andrew Lunn" <andrew@lunn.ch>
> Betreff: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpo=
ol allocator for SRAM
>
> > +static void *mtk_dma_ring_alloc(struct mtk_eth *eth, size_t size,
> > +				dma_addr_t *dma_handle)
> > +{
> > +	void *dma_ring;
> > +
> > +	if (WARN_ON(mtk_use_legacy_sram(eth)))
> > +		return -ENOMEM;
> > +
> > +	if (eth->sram_pool) {
> > +		dma_ring =3D (void *)gen_pool_alloc(eth->sram_pool, size);
> > +		if (!dma_ring)
> > +			return dma_ring;
> > +		*dma_handle =3D gen_pool_virt_to_phys(eth->sram_pool, (unsigned lo=
ng)dma_ring);
>=20
>=20I don't particularly like all the casting backwards and forwards
> between unsigned long and void *. These two APIs are not really
> compatible with each other. So any sort of wrapping is going to be
> messy.
>=20
>=20Maybe define a cookie union:
>=20
>=20struct mtk_dma_cookie {
> 	union {
> 		unsigned long gen_pool;
> 		void *coherent;
> 	}
> }
>=20
>=20Only dma_handle appears to be used by the rest of the code, so only
> the _alloc and _free need to know about the union.

do you mean use the union only for the casts or using it globally for all=
 the access
to the dma struct (and so changing the return type of the alloc function)=
?

first i made here [1]

second was tried by daniel and is much more change.

OT: btw. have you took a look in the PCS decision case [1]?

regards Frank

[1] https://github.com/frank-w/BPI-Router-Linux/commit/ea963012375e4ac989=
47a703b5eaf21fdf221ee1
[2] https://lore.kernel.org/netdev/24c4dfe9-ae3a-4126-b4ec-baac7754a669@l=
inux.dev/

