Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09977C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 12:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkB9FJLP2us4SWIDZi7Xked72Jv5/nb/0qDRVeIMogM=; b=xeK+y+OMmslRPN71BUnmbmTsLB
	VGz1yy9XeT4XFTlRifkbXoKfXgNpv5k5e6Hsbt1HDY4hTBV5GvnFZm25FGk84PkzsLW4sPcxZLv/e
	Vbo4h6xOZiA0hVaXbKDy44u3dRC6kpbMxxxeGFkIdBgftTgkFTlqAoeIZijbLfMp6aZoT7qfAMXFM
	MRdIRdm4cK6GPhNahxS9i+Yi+yVaPoVeWBqh+aHBF36uYK6Q1g0/LZlEOtmGEe4RgoHGz66lzS9oP
	HmyvpkNu4DWFD4zGEoGBjV1I+1GghwrzdTKv2gYMOR77GplUdcLy2VjVm+1seizGBmYGKzIaGiHeE
	2UxH0eNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAs4-0000000DiDD-2Qc3;
	Fri, 28 Jun 2024 12:38:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAru-0000000DiB3-36Wa;
	Fri, 28 Jun 2024 12:38:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4256788e13bso4318385e9.2;
        Fri, 28 Jun 2024 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719578301; x=1720183101; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UkB9FJLP2us4SWIDZi7Xked72Jv5/nb/0qDRVeIMogM=;
        b=lZ9KuC0x0hcNIZUh9+cWcFbBuKRzKEKhWhixvcUX84IaETK9EZ0Lzq3GwRE5+drk3p
         D7qbcpLV8J/ZrmY4fjqpYuAUp9vc39sVPiD6LxBsJ3g4xBw1rQLzN0DXBefNGS76XjHy
         0Ieh7+QLp7qwhwvOhsTIdTqGVEVCH1+LNFauAKW/12H4B2pv3uULejqRYEliOphZBQur
         GVvgpIqda4llhlg742/0OdRs8+xhE/fMMBXaHFRe75W/zxekPSb85ji5rnlz7TTPL+2C
         c+Kdd0wQYoH6znA3/gwvzAIuoWPVeRcFbELTBxZd1UAgJuqMuGwWfN1SZ4hPnGn3G8cO
         zHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719578301; x=1720183101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkB9FJLP2us4SWIDZi7Xked72Jv5/nb/0qDRVeIMogM=;
        b=qBnxcXB7RIujr+SEs1zcXj/4ZQFu/ouS55rwUq9oCaSI+754/9EIOi0T/L2ODNGL4N
         neZS+jwwy4wSDK2o9EohyJtYTLsUdZRoewIXKl3Oh+S3wc9KcB4VL3LcjVVIa7aQc1Qd
         5xSRc+7b8b5PHoAIHqAdqS17uxWRcZwZyY2T4jVKmnU0NqFb3hYnKGHSJyIJ8MFqdg6n
         exunPKlVBubhQR0SEQq69gN0JJY15Owi6jYeSkbaaMTpGCFUtFhfr3Vuxyh2kIAga1Q3
         bJMj0hpIDbjGggV/TyfmJxMVSa+PrH4QYlpna8VnJLzaX/vYxGAO+QcrsubM4MUcv9Lc
         96jw==
X-Forwarded-Encrypted: i=1; AJvYcCVxUfYJBfnxnhcVBJaFJd0N5WhnEIAegrUcrBL8wV3FPSCC1n1B+sX13b5nKBLQIO4L006ovks8laYdhGTiZGPYdxmPuq63n3F6gclQijehIThB7HdmQWAsPeJpUdT0hetPnZvfvSFqbxv7xHHPUpfTVYlPDWmFCes=
X-Gm-Message-State: AOJu0YzQp9aTxJ7pwvnt73gfqdNHSSzF53d5KhLsWdsOChPgphx6KQzW
	uJ1ayOA4/GX9GRQs47dSD73Iiap5OUhxAYHEv3lJ4zmOzddhSQym
X-Google-Smtp-Source: AGHT+IGKPig1mllBhdyoWDfOAICdvFqpjzxk+CF0oztCa+Z2hIe/+Ak7GWhb6YuhdCYfjXEa57wE4g==
X-Received: by 2002:adf:fd4b:0:b0:367:2ae1:9c4d with SMTP id ffacd0b85a97d-3672ae19d30mr5464759f8f.29.1719578300608;
        Fri, 28 Jun 2024 05:38:20 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fc4c9sm2197872f8f.86.2024.06.28.05.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:38:20 -0700 (PDT)
Date: Fri, 28 Jun 2024 14:38:18 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, christian.koenig@amd.com, Sumit Semwal <sumit.semwal@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, tjmercier@google.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>, 
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Pavel Machek <pavel@ucw.cz>, Simon Ser <contact@emersion.fr>, 
	Pekka Paalanen <ppaalanen@gmail.com>, willy@infradead.org, Logan Gunthorpe <logang@deltatee.com>, 
	Daniel Vetter <daniel@ffwll.ch>, jianjiao.zeng@mediatek.com, kuohong.wang@mediatek.com, 
	youlin.pei@mediatek.com
Subject: Re: [PATCH v5 7/9] dma-buf: heaps: restricted_heap: Add MediaTek
 restricted heap and heap_init
Message-ID: <pmweipswfysn3sjwf7jphwcjkt36s5d2o5ox6e63btqiyj7taj@kti5j36ttfbc>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-8-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5z4oex5oy2lm7v2z"
Content-Disposition: inline
In-Reply-To: <20240515112308.10171-8-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_053822_812928_3D845E4C 
X-CRM114-Status: GOOD (  33.86  )
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


--5z4oex5oy2lm7v2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 07:23:06PM GMT, Yong Wu wrote:
> Add a MediaTek restricted heap which uses TEE service call to restrict
> buffer. Currently this restricted heap is NULL, Prepare for the later
> patch. Mainly there are two changes:
> a) Add a heap_init ops since TEE probe late than restricted heap, thus
>    initialize the heap when we require the buffer the first time.
> b) Add a priv_data for each heap, like the special data used by MTK
>    (such as "TEE session") can be placed in priv_data.
>=20
> Currently our heap depends on CMA which could only be bool, thus
> depend on "TEE=3Dy".
>=20
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/Kconfig               |   7 ++
>  drivers/dma-buf/heaps/Makefile              |   1 +
>  drivers/dma-buf/heaps/restricted_heap.c     |  11 ++
>  drivers/dma-buf/heaps/restricted_heap.h     |   2 +
>  drivers/dma-buf/heaps/restricted_heap_mtk.c | 115 ++++++++++++++++++++
>  5 files changed, 136 insertions(+)
>  create mode 100644 drivers/dma-buf/heaps/restricted_heap_mtk.c
>=20
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index e54506f480ea..84f748fb2856 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -21,3 +21,10 @@ config DMABUF_HEAPS_RESTRICTED
>  	  heap is to manage buffers that are inaccessible to the kernel and use=
r space.
>  	  There may be several ways to restrict it, for example it may be encry=
pted or
>  	  protected by a TEE or hypervisor. If in doubt, say N.
> +
> +config DMABUF_HEAPS_RESTRICTED_MTK
> +	bool "MediaTek DMA-BUF Restricted Heap"
> +	depends on DMABUF_HEAPS_RESTRICTED && TEE=3Dy
> +	help
> +	  Enable restricted dma-buf heaps for MediaTek platform. This heap is b=
acked by
> +	  TEE client interfaces. If in doubt, say N.
> diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-buf/heaps/Makef=
ile
> index a2437c1817e2..0028aa9d875f 100644
> --- a/drivers/dma-buf/heaps/Makefile
> +++ b/drivers/dma-buf/heaps/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DMABUF_HEAPS_CMA)		+=3D cma_heap.o
>  obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED)	+=3D restricted_heap.o
> +obj-$(CONFIG_DMABUF_HEAPS_RESTRICTED_MTK)	+=3D restricted_heap_mtk.o
>  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)	+=3D system_heap.o
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/he=
aps/restricted_heap.c
> index 4e45d46a6467..8bc8a5e3f969 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -151,11 +151,22 @@ restricted_heap_allocate(struct dma_heap *heap, uns=
igned long size,
>  			 unsigned long fd_flags, unsigned long heap_flags)
>  {
>  	struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
> +	const struct restricted_heap_ops *ops =3D rheap->ops;
>  	struct restricted_buffer *restricted_buf;
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  	struct dma_buf *dmabuf;
>  	int ret;
> =20
> +	/*
> +	 * In some implements, TEE is required to protect buffer. However TEE p=
robe
> +	 * may be late, Thus heap_init is performed when the first buffer is re=
quested.
> +	 */
> +	if (ops->heap_init) {
> +		ret =3D ops->heap_init(rheap);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}

I wonder if we should make this parameterized rather than the default.
Perhaps we can add a "init_on_demand" (or whatever other name) flag to
struct restricted_heap_ops and then call this from heap initialization
if possible and defer initialization depending on the restricted heap
provider?

> +
>  	restricted_buf =3D kzalloc(sizeof(*restricted_buf), GFP_KERNEL);
>  	if (!restricted_buf)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index 6d9599a4a34e..2a33a1c7a48b 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -19,6 +19,8 @@ struct restricted_heap {
>  	const char		*name;
> =20
>  	const struct restricted_heap_ops *ops;
> +
> +	void			*priv_data;

Honestly, I would just get rid of any of this extra padding/indentation
in these structures. There's really no benefit to this, except maybe if
you *really* like things to be aligned, in which case the above is now
probably worse than if you didn't try to align in the first place.

Thierry

--5z4oex5oy2lm7v2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+rroACgkQ3SOs138+
s6EB/hAAlquMNwNzbko/vJ18thfHMMKEC/LnnxyK/L6hWo7sf3oV1B8fuUN/r+A5
qzDZZmYdzjgCrR7bY/80cCOUVhJz1/y+eiQXSyBoG/5UM7SDPSSnRHCDYxGk8PUs
6Tl7I1KmB994jWeX3qBUs8jM1EQym+2aYPevhR9E7bmKUfdGaaeBOwOv85Ku0rC9
DhnQfteSJx9jRhnMzQE+ADzjqtnVhR4oSmfpugMPXV/WkVhJ81fMLDr6O3YAfFMy
59NfXGreJN+yG/9FmuF6aIsesBcH8loA6UyM+RIv7eubHAZCCzAbXrHvdBg3neGN
F2lRw/QN3PYdXAayYTDTw1619gN9oABCreu1TMJEPZmxypM8T89h17rSl06wUjxe
tgFwkbvdsYQzpYBT54Jugie8+HCkQAxItrb2uFHI4zHKcg4OuvrlQP4ZLpA2qh4q
2DK34GYRim44TCdKhL+R3LWAGVEIbzdnIUFt69k44rwj0qwTXaFofMQhDC/zS8Z6
H1g4Ls4sNl7iPhnwfxtphdhvtw33ofgAqKtffPYlJKzSR+T08vOTENLDWIWf62NZ
5R0I+LJ8DHBzZKprzeBkA7KL4mlctZKGEaf/d3G2cPoWBoCdBkRDOi+XTFtiVHKa
kuNAR3Rsd/TbSDZYGcozLxD+mGBgZclxEO8kyHNENQR+xvetWiY=
=oI/a
-----END PGP SIGNATURE-----

--5z4oex5oy2lm7v2z--

