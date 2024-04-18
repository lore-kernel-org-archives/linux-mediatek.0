Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621F7C41513
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16jkLD/Jb8wlNCarypqSg5A9BaF21KaHsxOGivdahY0=; b=YigotPmLUfS8phVEB2sDd6bYdg
	KwJZj8lss1V8+C0nNJjbew/ZDCJoWVHLqRgQ2he5iLQQ1YbhwLZKGqHk3x3/D2An+G5bMgTY8/LlF
	PazMXPAapLL38gMF9eVpKEDqpLTHBemCFaWEcYL+xc5Rc7XiunY5lirXKF32DXdwivn9xnWvygGAT
	mdO0H/3okZOJlPs7xl3lN4ZnHBvcfBsLptWjjXSuPZmoAArUPwZBRDx5BmN0KyYC2OnvZUVIrsUvo
	mDe17MWjTC/YMGUEd0xRkAbc17sNRR0nLrnlFwczoCApMRi3kkpIffcKlSTLw062CzZ60MCYlyuhp
	TUfRhDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryzMw-0000000Eo0y-2K30;
	Mon, 22 Apr 2024 19:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyPv-0000000Eb7d-3RqB;
	Mon, 22 Apr 2024 18:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=16jkLD/Jb8wlNCarypqSg5A9BaF21KaHsxOGivdahY0=; b=cUnqu5jf32oW6GsTv/+4jkZvWW
	ynV/0vyukFJ+JU60+CgzUxJTKwiilTcny0+Dw1XevxqdOFMQRv5HoXxml3sY6yAasuHgv0k42XKWN
	yjzAN9u9p4d49R7C5BJ3K1b05lFmJj9YUFoX1YxWfXhgD2yts7bU7GoLETMJl/JGwBjVIHQJWHqFE
	nEodM5NyEah1C3L3ZxNI8vFr3D4gpO6e88El3nsIWK0Gl2/VV0YgT90rrPai986KsLNcbmqIik2zt
	2bfbhZz3WUAfzmgTrbq93zlJQYWxto35il1OvEfyc+cilwhEcG2e8UzNcqUZ0JU03S/xi9Lyy983P
	q4b/b/2A==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyPs-0000000DkgK-3M5W;
	Mon, 22 Apr 2024 18:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713810563;
	bh=m+nDW6b/eB4Ha2+acNVpqHBPt12qJH/nspZVysjD1q8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=dFKQQzcqL3PMbXRFFReTEpOOlhADJXPHtqrNvfqzovYraekxDkSD4sLqBhrQ7bYk8
	 Wnt8SLyDC/53tyZHsS8/WeGMjjWK2gdSeQEe5Vr1d6TM3v4Pci7shq45sWI0nyCnwR
	 BJhw6o8IGw6AD5dbobgFkfhvUYwsHWggjeM0xtO5NxWk05J8vuDdjyc03a6X8HL8Gy
	 oJzW446QdV5YjLrHW1+mzg/iUU/uvmXZWWTax9CBoacq6F3bRtZOgzZ+9rbaCaH/ZB
	 TsvbdhEOQ7zxqaNaGj2YleH4n9Php2ciZIR5z6/a3gnGUBvg7Nd7jhJceKXMGL9Tu9
	 noeCzla1EaK8g==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 98DAA3782139;
	Mon, 22 Apr 2024 18:29:21 +0000 (UTC)
Message-ID: <a41517666159cfd64959b4a88d5b06452ae4bf36.camel@collabora.com>
Subject: Re: [PATCH v2,4/5] media: mediatek: vcodec: add MT21 format
 definition
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20240409064431.16909-5-yunfei.dong@mediatek.com>
References: <20240409064431.16909-1-yunfei.dong@mediatek.com>
	 <20240409064431.16909-5-yunfei.dong@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Apr 2024 16:24:48 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_192925_022838_4555A15C 
X-CRM114-Status: GOOD (  14.58  )
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

Le mardi 09 avril 2024 =C3=A0 14:44 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> Adding the definition of MT21 format to calculate bytesperline

MT21C in the subject and description.

> and sizeimage of plane[0] and plane[1].
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 0d5de132e07f..6dba989c2291 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -271,6 +271,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		  .block_w =3D { 64, 64, 0, 0 }, .block_h =3D { 64, 64, 0, 0 }},
>  		{ .format =3D V4L2_PIX_FMT_MM21, .pixel_enc =3D V4L2_PIXEL_ENC_YUV, .m=
em_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 1, 1, 0, 0 }, .bpp_div =3D =
{ 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 2,
>  		  .block_w =3D { 64, 64, 0, 0 }, .block_h =3D { 64, 64, 0, 0 }},
> +		{ .format =3D V4L2_PIX_FMT_MT21C, .pixel_enc =3D V4L2_PIXEL_ENC_YUV, .=
mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 1, 1, 0, 0 }, .bpp_div =3D=
 { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 2,
> +		  .block_w =3D { 64, 64, 0, 0 }, .block_h =3D { 64, 64, 0, 0 }},

As you may notice, we have no support for compressed formats yet in this he=
lper.
I believe for these formats we need some extra code to add the header size
calculation. One way could be to add a ops in that table for when a header =
is
needed. That ops would implement the format specific extra space calculatio=
n
which would be added to sizeimage of each planes (in in one of the planes
depending on the specifics of the format).

> =20
>  		/* YUV planar formats */
>  		{ .format =3D V4L2_PIX_FMT_NV12,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },


