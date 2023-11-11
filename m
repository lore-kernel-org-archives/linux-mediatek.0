Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F181EC41535
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 19:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1Ok56Rxa7o9YZFTQsUYiUo6ZSUFj5ZWmdayEaAumNY=; b=xOny8TA9BDLL6yzPymYHwtNoHM
	M+EMC8fEgDklUcp9x2FyNq0Y23a85qqrmlWQHB+KHISBOYI43rHH3yt9iTQDskUrXe5e5wP+VX1ft
	Tos4g0z1ncTEa+WKLmm44KH8xTDRKjFyu1OgjjiQT2KEN3lZ7+fmHzv4/+r5iexhPrP6i6j1bAY63
	5+axG7r1gMXRm6VPhN4qUGjZkAEF4cdQhEhHYxLmRcaKbFcbKJGXbfd2TvPNMx5F5DuitYx15bNfL
	nW+LjyTwPIM0UNkrNe1BqIAyiUFCxtP9sbJPM6W2HKNmAsZq9kCMZuC7m8zofFHrVA24M4yusn7yK
	MudRPhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1tJQ-00BHix-1K;
	Sat, 11 Nov 2023 19:06:32 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1tJI-00BHhC-24;
	Sat, 11 Nov 2023 19:06:29 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 2E62D1C0050; Sat, 11 Nov 2023 20:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1699729575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l1Ok56Rxa7o9YZFTQsUYiUo6ZSUFj5ZWmdayEaAumNY=;
	b=Tmi4ac1VEDo6wc6Mo8igDplIbkAxQ/bOiCnwI7pi2lGAPxUEeGgaXR/dmjl5/nmOquANIi
	HIgMqgvcj16ic44ldaffG6S/UxLOF5DM7Ns+LavMunfDtV+qcHwVJ6xUs7+Puhc4yo/5WN
	Gbth6dbsNfDu1w5T7TvK8sFf8CgiJFw=
Date: Sat, 11 Nov 2023 20:06:15 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Jeffrey Kardatzke <jkardatzke@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	John Stultz <jstultz@google.com>, Yong Wu <yong.wu@mediatek.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2,04/21] v4l: add documentation for secure memory flag
Message-ID: <ZU/D3iDxIW6Q8bOq@duo.ucw.cz>
References: <20231106120423.23364-1-yunfei.dong@mediatek.com>
 <20231106120423.23364-5-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ju1/ro8SjlcVrbE1"
Content-Disposition: inline
In-Reply-To: <20231106120423.23364-5-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_110626_141381_4B8323D6 
X-CRM114-Status: GOOD (  12.98  )
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


--Ju1/ro8SjlcVrbE1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Jeffrey Kardatzke <jkardatzke@google.com>
>=20
> Adds documentation for V4L2_MEMORY_FLAG_SECURE.

> --- a/Documentation/userspace-api/media/v4l/buffer.rst
> +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> @@ -696,7 +696,7 @@ enum v4l2_memory
> =20
>  .. _memory-flags:
> =20
> -Memory Consistency Flags
> +Memory Flags
>  ------------------------
> =20
>  .. raw:: latex
> @@ -728,6 +728,12 @@ Memory Consistency Flags
>  	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
>  	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
>  	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
> +
> +      - ``V4L2_MEMORY_FLAG_SECURE``
> +      - 0x00000002
> +      - DMA bufs passed into the queue will be validated to ensure they =
were
> +	allocated from a secure dma-heap.

Could we get some more information somewhere? Why would userspace want
to work with "secure" DMA heaps? How exactly are they different from
others? What attacks are these secure against? What is goal of all
this? DRM?

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Ju1/ro8SjlcVrbE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZU/QpgAKCRAw5/Bqldv6
8l8+AJ4oQv5JySuz32NLbVDCZIWsPN9wVwCfRl5hbQ5bVuuW7/o0JdBhSJsRFeA=
=R/8x
-----END PGP SIGNATURE-----

--Ju1/ro8SjlcVrbE1--

