Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CD8C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ormubhlp5rGN7NZ+8QcFtIY5XFie71+48ROSScCbZwU=; b=S27KEuHZ58q2+ICOixBT+q5kZz
	/6cf8MV41F9MRM24/POz3Zkzqlca7SHdqaNk6CRLixcbvh/JkOEO62yI5+4fiFyPdRuvKGFHY+es4
	6iE05aDv4t3UAVpu4MqdW/KDfKWxcIsbOM6B5LX6rTjSAyHKrBjcTwZZ+ofejPvuMGvxnnBUhb6Te
	PjeJ/mnxYcAiDiLRO2WFjpLq5LGONdzInEnDSi3HN9Ry8aai2aRai9LTtiPCPpiNTHYmikm8/tJhH
	3XUhNv59PlobXog6q5lEyJCAO6QrLg6x095S6RnmxYQauE2ZDwI1J0OtSJDpN3igrnOkKUWe50l/U
	sV6GWcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rmK-001sya-B2; Mon, 27 Jun 2022 16:40:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rmI-001sWO-Mj
	for linux-mediatek@bombadil.infradead.org; Mon, 27 Jun 2022 16:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ormubhlp5rGN7NZ+8QcFtIY5XFie71+48ROSScCbZwU=; b=Z6PZNWOJhy7bxPEBewIG+Cgtge
	27q+x8PoCQwHNlUYvhehNraZSZFtEZLLPCemdgAJ71/4HsrBd9BZH7j8+wiaE1eujyrBinDK9RSO1
	lmx9I4nh6AzP+brPof9L88d/SFLHD1173/iuNJ/BHgf854Q6NHy+pBpKxBafCsU1uS1qL/JJwkzpm
	PL9lwVkrt1w0Duz3uiKFgrQaxm+NkYYWyC2Zu3oVrbXZwoNDGf1tIaAkGeT3FsPSAUO1wESCI5U72
	LuQZtCKk0Tas7PCCoHeVACbi1dhgTpERnGzWR3ssx64dbrVGon0XSO7XCJp/03e4du+UsZY1dIaJ4
	HOROqrcg==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5qiu-00DY1c-RD
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 15:32:33 +0000
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net [192.222.136.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4785566015CC;
	Mon, 27 Jun 2022 16:32:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656343941;
	bh=WXEZVvmNgtbo2KYONmvEmxeWXTPTZqzrltifafKJ+n4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=adrQSZ/uZg0suZrYAzozhYTSpFm4WT2vOcUj3+/QOZDUu1fWDlGJl+q6Sg72FzpB2
	 +hCRiC/TyTU53rf3H++EJ1MsA9xUo9gV7B/VmeN+I60NzgARl+y2caDW2Ru+LgFA4R
	 DuukQBQ6BKO6ySxU4PtOKF/hRLGg1SmLdVcDaexoc42vOvr+bJaUwZz1GNge7hSdQF
	 z/AeCT5Rc6+HZ13t74CCLRuV02C8Wp6ZvGSwnxHVQQVHIfbzFmJRi2VGIBCpgw89wU
	 y2dMLOhKivyS1NMECe/gdrFCeJ4T3agBzjlrjy8aXG2gU2LJdj/jqun9V/HPD2f84y
	 FxWNy2i00/pvA==
Message-ID: <f5e68826df868ae5a3cd5737fd9d7f7683bbad73.camel@collabora.com>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: dec: Fix 4K frame size
 enumeration
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Yunfei Dong
	 <yunfei.dong@mediatek.com>
Date: Mon, 27 Jun 2022 11:32:09 -0400
In-Reply-To: <20220627112402.2332046-2-wenst@chromium.org>
References: <20220627112402.2332046-1-wenst@chromium.org>
	 <20220627112402.2332046-2-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_163225_584011_DB1B4FB7 
X-CRM114-Status: GOOD (  22.76  )
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

Hi Chen-Yu,

Le lundi 27 juin 2022 =C3=A0 19:23 +0800, Chen-Yu Tsai a =C3=A9crit=C2=A0:
> This partially reverts commit b018be06f3c7 ("media: mediatek: vcodec:
> Read max resolution from dec_capability"). In this commit, the maximum
> resolution ended up being a function of both the firmware capability and
> the current set format.
>=20
> However, frame size enumeration for output (coded) formats should not
> depend on the format set, but should return supported resolutions for
> the format requested by userspace.

Good point. Though, I don't see any special casing for the CAPTURE case. As=
 this
HW does not include a scaler, it must only return 1 resolution when being
enumerated for CAPTURE side (or not implement that enumeration, but its
complicated to half implement something in m2m). The return unique size sho=
uld
match what G_FMT(CAPTURE) would return.

>=20
> Fix this so that the driver returns the supported resolutions correctly,
> even if the instance only has default settings, or if the output format
> is currently set to VP8F, which does not support 4K.
>=20
> Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from d=
ec_capability")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c    | 2 --
>  .../platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c    | 7 +++++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 5d6fdf18c3a6..fcb4b8131c49 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -595,8 +595,6 @@ static int vidioc_enum_framesizes(struct file *file, =
void *priv,
>  		fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
>  		fsize->stepwise =3D dec_pdata->vdec_framesizes[i].stepwise;
> =20
> -		fsize->stepwise.max_width =3D ctx->max_width;
> -		fsize->stepwise.max_height =3D ctx->max_height;
>  		mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
>  				ctx->dev->dec_capability,
>  				fsize->stepwise.min_width,
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_statel=
ess.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> index 16d55785d84b..9a4d3e3658aa 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
> @@ -360,6 +360,13 @@ static void mtk_vcodec_add_formats(unsigned int four=
cc,
> =20
>  		mtk_vdec_framesizes[count_framesizes].fourcc =3D fourcc;
>  		mtk_vdec_framesizes[count_framesizes].stepwise =3D stepwise_fhd;
> +		if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
> +		    fourcc !=3D V4L2_PIX_FMT_VP8_FRAME) {
> +			mtk_vdec_framesizes[count_framesizes].stepwise.max_width =3D
> +				VCODEC_DEC_4K_CODED_WIDTH;
> +			mtk_vdec_framesizes[count_framesizes].stepwise.max_height =3D
> +				VCODEC_DEC_4K_CODED_HEIGHT;
> +		}

I don't particularly like to see this special cased check being added into
multiple places. Its also in your patch 2, and I think it exist in a third
place. Could it be possible to have an internal helper to ensure we don't
duplicate this logic ? Somehow, it seems there is something in common betwe=
en
set_default, try_fmt and this code.

>  		num_framesizes++;
>  		break;
>  	case V4L2_PIX_FMT_MM21:


