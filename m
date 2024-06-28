Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B35C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 12:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/VQJz2hM3Y4F448nQxVS0VxqvpF+TwhJySiPDWqGzs=; b=d3O+6wI8hEx215n8FzK1LhIefs
	CVwqhc+VQUfDfVIEU1CaZVkZeYw7+XfUiTtj7Rmcql9aRh18PcrYhgxiTdqG0cVf6W4cIkIXg/oGW
	2Ynyg6McwC6aAHwczH/a2MrdEtA6E3rWjwLc+wYCwjGU4ocTIz3n6j189mpCZOv6MudQlux41BS4Z
	9mlIiyQBRN5+quWT6yCnu/2AvUPvCrH0L6UuyuO2VhG5pD+d/GWdbOxnHpb6FsiVSPHw4em2/DwBY
	eWecQUhHOsyG9daE4x/Vv+ZMrgVuqoz/RgyiVWai7ogjlUEQvxpSYV5Z88GJxS87X+BxMG19aZPCD
	cdE8S2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAgs-0000000DgLa-2dDJ;
	Fri, 28 Jun 2024 12:26:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAgj-0000000DgJp-1Fiw;
	Fri, 28 Jun 2024 12:26:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-361785bfa71so469430f8f.2;
        Fri, 28 Jun 2024 05:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719577608; x=1720182408; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/VQJz2hM3Y4F448nQxVS0VxqvpF+TwhJySiPDWqGzs=;
        b=GVjvDcQbdVIHNl4UDe6SA/mrOgCWrEbHXfhkaTu2k6ef6zc6AQQU0rT07PAnDM1Qum
         UipGvIwGKALCGBFGFw8l+65pPNAORTbGTLIl/e/yCSR7OTAJi0mUPxp0g0Wp1ExMZr8m
         k1wUpTC5xuNLJ2G5S3UqqyoRO1Bc8k4Kfuk9MrAKGPtFRzaumWWMWEbhSTmxBcT0QjKS
         Z9euKb7a1qYKiaFqt8tGYjR4ZfVpJeWMXvHcHqmmQRNauK9WIoGCt/ElhTmQPnosxg8u
         y2C6ONEjHECmH5+4l6vMGLCotBJ88AXSZg9miPVPZV4blfJJFwuQXoJyn+ZlyJKrE8vq
         oqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577608; x=1720182408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/VQJz2hM3Y4F448nQxVS0VxqvpF+TwhJySiPDWqGzs=;
        b=U8k3qwbTeNUb+3Vr2qVq5BZ74SLVncvyp06D6z26QIPtUAFJgih+/LXpNB/odqefmb
         rjSPZjDY2YUSm+g5/tCPjiWko43zn1Di3b8RzvA/3th5Bg/b1wq89E5nCesKgNmKBXZn
         rEbTFRIu3qIbPx/wX39z5NU9DoEII3Eu48Px8okcAOZxXX6LP11x0rdcWM0v5RE4fzsS
         CpLgkPxrCxrOQWjmBs8sm1Gq583osJLrSPoAX6JsKXJTVRlY1qC6vzm88CVUOyrn8rLY
         6rPmjATmrdT1OmckuryLPHDtGmAIXUMBgVv8DVgGk2G/VC8FQUiEZfCFAldAKVIQEySQ
         7tOg==
X-Forwarded-Encrypted: i=1; AJvYcCWM4bFWmPbAhq+3iBW8ZviZzbQ8/BBqY/70maxvtO5GMuhMkRIkMJtYKWYATiZOXTaz6w3Sqy0uUGlNe3AM+7sX9p3ZEBzLyNiGeCo+mwmLwjRI1zhUqMWXYBsA00Tq8iV5OzbC8qGniiau+iY0I7THiA8IxBVxXww=
X-Gm-Message-State: AOJu0Yy+oqCcNC+Sd8pcRswJUTXOw+7eoCkqk3Y/YwRPRVc1YZQhkGaL
	2JbjduZqc+Ok8QJKa3ge/IVli3EiQJuJqb3CVlpZxxzLbvWXdOyA
X-Google-Smtp-Source: AGHT+IEBnJj0jcIPr2SKFxa+XB8hdZdf8p61oiEXssLzKDdbv2pquDD9+yIevx/3N4QZrH7J7OMy0Q==
X-Received: by 2002:a5d:4c43:0:b0:367:403d:a1ef with SMTP id ffacd0b85a97d-36742bd156cmr2987417f8f.62.1719577607204;
        Fri, 28 Jun 2024 05:26:47 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd784sm2204336f8f.7.2024.06.28.05.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:26:46 -0700 (PDT)
Date: Fri, 28 Jun 2024 14:26:44 +0200
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
Subject: Re: [PATCH v5 5/9] dma-buf: heaps: restricted_heap: Add private heap
 ops
Message-ID: <gbj6vakab74yuhbkazlxvrz3x3bia3nb7loo7c74fadlh4wc2q@qjf44kr3mrqe>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-6-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vbf3vgeqgslvvuj2"
Content-Disposition: inline
In-Reply-To: <20240515112308.10171-6-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_052649_378606_C496D854 
X-CRM114-Status: GOOD (  25.60  )
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


--vbf3vgeqgslvvuj2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 07:23:04PM GMT, Yong Wu wrote:
> Add "struct restricted_heap_ops". For the restricted memory, totally there
> are two steps:
> a) alloc: Allocate the buffer in kernel;
> b) restrict_buf: Restrict/Protect/Secure that buffer.
> The "alloc" is mandatory while "restrict_buf" is optional since it may
> be part of "alloc".
>=20
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/dma-buf/heaps/restricted_heap.c | 41 ++++++++++++++++++++++++-
>  drivers/dma-buf/heaps/restricted_heap.h | 12 ++++++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/he=
aps/restricted_heap.c
> index c2ae19ba7d7e..8bb3c1876a69 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.c
> +++ b/drivers/dma-buf/heaps/restricted_heap.c
> @@ -12,10 +12,44 @@
> =20
>  #include "restricted_heap.h"
> =20
> +static int
> +restricted_heap_memory_allocate(struct restricted_heap *rheap, struct re=
stricted_buffer *buf)
> +{
> +	const struct restricted_heap_ops *ops =3D rheap->ops;
> +	int ret;
> +
> +	ret =3D ops->alloc(rheap, buf);
> +	if (ret)
> +		return ret;
> +
> +	if (ops->restrict_buf) {
> +		ret =3D ops->restrict_buf(rheap, buf);
> +		if (ret)
> +			goto buf_free;
> +	}
> +	return 0;
> +
> +buf_free:
> +	ops->free(rheap, buf);
> +	return ret;
> +}
> +
> +static void
> +restricted_heap_memory_free(struct restricted_heap *rheap, struct restri=
cted_buffer *buf)
> +{
> +	const struct restricted_heap_ops *ops =3D rheap->ops;
> +
> +	if (ops->unrestrict_buf)
> +		ops->unrestrict_buf(rheap, buf);
> +
> +	ops->free(rheap, buf);
> +}
> +
>  static struct dma_buf *
>  restricted_heap_allocate(struct dma_heap *heap, unsigned long size,
>  			 unsigned long fd_flags, unsigned long heap_flags)
>  {
> +	struct restricted_heap *rheap =3D dma_heap_get_drvdata(heap);
>  	struct restricted_buffer *restricted_buf;
>  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>  	struct dma_buf *dmabuf;
> @@ -28,6 +62,9 @@ restricted_heap_allocate(struct dma_heap *heap, unsigne=
d long size,
>  	restricted_buf->size =3D ALIGN(size, PAGE_SIZE);
>  	restricted_buf->heap =3D heap;
> =20
> +	ret =3D restricted_heap_memory_allocate(rheap, restricted_buf);
> +	if (ret)
> +		goto err_free_buf;
>  	exp_info.exp_name =3D dma_heap_get_name(heap);
>  	exp_info.size =3D restricted_buf->size;
>  	exp_info.flags =3D fd_flags;
> @@ -36,11 +73,13 @@ restricted_heap_allocate(struct dma_heap *heap, unsig=
ned long size,
>  	dmabuf =3D dma_buf_export(&exp_info);
>  	if (IS_ERR(dmabuf)) {
>  		ret =3D PTR_ERR(dmabuf);
> -		goto err_free_buf;
> +		goto err_free_rstrd_mem;
>  	}
> =20
>  	return dmabuf;
> =20
> +err_free_rstrd_mem:
> +	restricted_heap_memory_free(rheap, restricted_buf);
>  err_free_buf:
>  	kfree(restricted_buf);
>  	return ERR_PTR(ret);
> diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/he=
aps/restricted_heap.h
> index b448f77616ac..5783275d5714 100644
> --- a/drivers/dma-buf/heaps/restricted_heap.h
> +++ b/drivers/dma-buf/heaps/restricted_heap.h
> @@ -15,6 +15,18 @@ struct restricted_buffer {
> =20
>  struct restricted_heap {
>  	const char		*name;
> +
> +	const struct restricted_heap_ops *ops;
> +};
> +
> +struct restricted_heap_ops {
> +	int	(*heap_init)(struct restricted_heap *rheap);

It might be worth moving this to a later patch when it's actually
getting used.

Thierry

--vbf3vgeqgslvvuj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+rAQACgkQ3SOs138+
s6EcbxAAiZuHIyjN3NZQtDif4ifUoMPGxGZ4nEdFZbnDVkpJtKmk85RLLw6vq+8j
DggReAg+weGgbc+4qVdxZP8GKJvRcXUi9RIwQIj7/9U+R+VG+YCBwkoY81PnkYFF
DDCTn9dfvf/r6SaJPj8mWase4q61go1K7R79XU7SwJ5SbCz7BC0RI89lSiUShJQ4
PGDa1AQgNlKaYlMR6qjs9RFD6IHFt2Shge4S2/lbKcMgHxy3nbAZOULriFyPtkkg
PYKZlsje5AAUR4pnABwU6qhZMp7svIiuUJX1+zldt+LCsyqMScvBnUfe1QijtiBn
gg4sL1TTb1PVuUHPg15eyS5K9GHQilys2UXzCf+V8WT0Crr0gFz9+ClLYSSZh9NV
phSCQY9YRUhAC0c7xwc8Ov1IxgJ0nqL6Ig8BoeZnhQkVf3wPzPk9B8hVvJMVZ13s
blUxWO8qPdIzT6NsFK+A4RhN30gfqC8uy4DzyvhQR7+OWywHEaCZm3EdUZg0VHJp
U51n4uVREXlO8/a4GwgvwWmc6Y7oiHjH9n9iYM2ua6EYc0HW+YvmJp4FbWBa3VRL
e/ta+yMQWQYH1jfTqeQE1DJhBYEsKsgDjL7wv3USp+yMCkURiKWkos4b7ZXzCNVG
Z6xBSJbmND7bujopIY7A81K15p0SM787q9XHn1MaAMJrk2Xd0lY=
=OWnB
-----END PGP SIGNATURE-----

--vbf3vgeqgslvvuj2--

