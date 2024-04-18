Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53269C10F15
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 19:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRd5d/6ItoWaQFashnY5yCc8o0lGG6zGkujr2DrEiIk=; b=VgMd95DVCDJSxJkxpAp5x+JtQX
	hKGLzkrN7u0hcIUvBYzSf4hWJKHxMNTGlKjXlNbLQ/yaUazQI2Qw6zcuQQJUFPy3eQPyIeFKRhGj9
	SPRAF/5ojAiefA/po9nmQddYUnYF5pJoBiGTjuPuKgIRZQt59HN1okgqhBMBNHCVS5YWran2sELQM
	dlc/TSWDMT8Q3gTo0P100846xrKiMwr1lCpVMRbt7sq+eaGlJh8oWV97DNeC3QJOQFEYNm0vZLSsk
	RmJFhy03VHYVlsP5TU73qo0nQbE0FfPkSLBw0Kn68GwaUnnyvZMmNYy/rmvC2gdYwRKWo9vtXTHOj
	PBFdmawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryzMx-0000000Eo1m-3wMb;
	Mon, 22 Apr 2024 19:30:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyQ3-0000000EbAG-12u2;
	Mon, 22 Apr 2024 18:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IRd5d/6ItoWaQFashnY5yCc8o0lGG6zGkujr2DrEiIk=; b=PF/zUvj/dy5aVVbigjC3RApZuK
	5XfoK/GXR94RtW4MocXnef/rZC/xFfrRXxoOLhIvrIC0GwxCbGLXDR97+iL8MJ0NQju8KVLUEq3NE
	Al8834Rl2PyfHMcK+qn+NdVUKq0ctmOvdcPSERpgUaVNjHBUR123GjqggrvbDNV4+WO0gcmZmv2Fu
	eoYV7QolgHza9Berojj7WfEcGhERRaNttOvrvFb8E1C/+OI9JPu/mX0UVMOe9h/BORhejz8+CgXt9
	i9H7GHJI5StlBcnE4xeqg7FGeZZrRKisapp0j2+UtvG22NkFmcIK7pbvs6pXdORTxX65P0Jm6fLkm
	2zDnVf4g==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryyPy-0000000Dkh6-3sZ0;
	Mon, 22 Apr 2024 18:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713810570;
	bh=lFyqqsTbvpBevoPN6/NMC90GOUXMW6KIKKFAoQiAmFs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=KyLetmpfhfD1CxoIRlN05i1koDUuorqGDIwBeQ6ZOKcqCiovB94RRm45TZ9YUy2SD
	 Bs8DpHi+gVhLVVGm66EZXc49DACSnsYF//3WRj2sSehAdCOP9sZrXjbLTW5C/fQ+ZI
	 l/+3dgVEJp1YzHGak+pZ1nx6/0WsmiFC2h3vrb3kbkqfRib35sRAiBnRXZ4PgmBMPu
	 hWrTYCPiDnFfGs8EveixzyGMTRAicRjDbFuI4FAj2jS6x+tMPpRLcxxA/VJLJXCfad
	 Dr4dXAuSPgo0tihp+8cGPWJu4Svu7pp9Jdnsnl7h536iIPeZQ/8Xlql54Si6J9LXgU
	 AkDzdSyTckINw==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF1D13782139;
	Mon, 22 Apr 2024 18:29:27 +0000 (UTC)
Message-ID: <345e7b0ce96b900725e086f550aafd6ecf0dbc7f.camel@collabora.com>
Subject: Re: [PATCH v2,1/5] media: mediatek: vcodec: fix incorrect MT2T
 format information
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
In-Reply-To: <20240409064431.16909-2-yunfei.dong@mediatek.com>
References: <20240409064431.16909-1-yunfei.dong@mediatek.com>
	 <20240409064431.16909-2-yunfei.dong@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Apr 2024 16:17:46 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_192931_151187_A51C024D 
X-CRM114-Status: GOOD (  16.71  )
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
> Changing the bpp and hdiv values to make sure the bytesperline
> of plane[0] and plane[1] are the same. The width and height are
> 64 align.
>=20
> Fixes: 6afcc2b0aebf ("media: mediatek: vcodec: Add capture format to supp=
ort 10bit tile mode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index d34d210908d9..8587cd14741c 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -265,8 +265,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_VYUY,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_Y212,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_YUV48_12, .pixel_enc =3D V4L2_PIXEL_ENC_YUV=
, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_MT2110T, .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp_div =
=3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> -		  .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 }},
> +		{ .format =3D V4L2_PIX_FMT_MT2110T, .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 5, 0, 0 }, .bpp_div =
=3D { 4, 4, 1, 1 }, .hdiv =3D 1, .vdiv =3D 2,
> +		  .block_w =3D { 64, 64, 0, 0 }, .block_h =3D { 64, 64, 0, 0 }},

The code that calculate the info you are fixing:

plane->bytesperline =3D
	info->bpp[i] * DIV_ROUND_UP(aligned_width, hdiv) / info->bpp_div[i];
plane->sizeimage =3D plane->bytesperline * DIV_ROUND_UP(aligned_height, vdi=
v);

hdiv is 1 for the first plane, and 2 for second plane. Let say we have 1920=
x1080
video, bytesperline for that first planes would be 5 * (1920 / 1) / 4 =3D 2=
400.
But for the second plane with your change we have 5 * (1920 / 2) / 4 =3D 12=
00. For
me, you failed to achieve your goal, or there is a bug elsewhere.

The second change should have its own commit, but I think it should be drop=
ped.
The driver is hacked to be compatible with the Mali GPUs (64x64 textures), =
but
does not need this alignment. And in any case, the block should represent t=
he
pixel format required alignment, so I'd suggest to leave it like this, and
simply align width/height before calling the function to calculate
stride/sizeimage. The 64x64 alignment can be applied using
v4l2_apply_frmsize_constraints() during try fmt (or v4l_bound_align_image()=
, but
first is preferred).

Same comments apply to the following patch, which should be squashed.

>  		{ .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp_div =
=3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
>  		  .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 }},
> =20


