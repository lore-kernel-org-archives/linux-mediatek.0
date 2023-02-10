Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5130AC636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yns5dIgTI6JxWbAph1O5r62njQOhGCrBzKQvo54B6zU=; b=e65mJCeX7FDRiLHAXUhxgp5kK4
	rtRgGLrV95xKzy1eToTY/du7kCwdAaJfoy4biHQyjQt6TOvXNL2urX2ouQBTCg8qU7owwBK+wiHR1
	bbxxEtL+1zyqT8pt5CluN29/Ycss6jrxoXKqOMZ5Wj5oQBXoMJi9GsPDRoJ+L5d7BEE7YwJ4qEm16
	ULnbFUzX+70d/heWfIbdi1YS+un6PPpACSSYgC79/i9phycpKkpBYxrr82UaRgtGsUewAXAXpq8mG
	5U3zt5GYci4xGGNHmHQ8vy1QKsFGnE89YLIRfwXclNxXwF1zc1jNGsvzV2hp3uXQfcLZxj6/6ktpv
	WIM5oKvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVS4-006NEw-C7; Fri, 10 Feb 2023 15:36:40 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVRu-006NBB-19
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 15:36:31 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id cw4so3750876qvb.6
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Feb 2023 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yns5dIgTI6JxWbAph1O5r62njQOhGCrBzKQvo54B6zU=;
        b=qt0dTy3gVXkMeMMY1z1PZwzdNHzVX7V43gDb6L3hzCqa+olBH07sWy3wRrodzDIMG4
         6hhWqr1Vobg7UcTDxPhcBKvvutcBaIlcdZt315xhTaQQG8r5n/M+uOuTOrVicwmwyKAU
         064uvXHrbIh3mtaWOU4aybOMWgkXvkOzKL0b8uQUjc/v2XlzXgc0DQpTPFVMok0FMsQM
         08vESDuFXllzb2iR8QrHNONx/wudIUxbhG5sODlHnj3/KUNblwg71nM5dxt/l0oVqdMr
         /nlLhaPAjSj5IgprhRQcEHPcPMcz3AcuIRCJk9+PrV5mMO/ejuZ4Rbocq4ZekG0vV8P9
         JnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yns5dIgTI6JxWbAph1O5r62njQOhGCrBzKQvo54B6zU=;
        b=Sf7mcuM3CF/oK1weVSCEh4Csk19AmKiktzvWzHBeKf/wqc1KHCAUNKMsh+DcfzEjmC
         OVskldxO/JxnahgQRLVVkDfLhFW98pTbgWOHG6yZ1JdI2txLn3p3KsBVGrCLiInWfZY+
         eMNP0hP7+mvOHxF2rxuurYcvR5Wc2WMfX0r2W6aOrz2ZlA3SLQqfRhrCJ1s+nN1MDTvC
         KKZI2CK3ys4eT3/xcgdj34RwQ1oRYyNfCdqaAqbPtZvdEEewlaexaLoUoupqu0I2QOwu
         Y9gbPi1ocIJWPxvqcF1QanZG3/xIjJxfLx96cMvI2GkX7ARpmfGHSRi1jcVVKcZawucv
         NAgw==
X-Gm-Message-State: AO0yUKUmv7g2G0TLqIU2Eh0CzM3Ru3jD6s9AqRHC0dM2qleUIg3retU1
	PEfuw/9A86F0MkJTH4sJ+mFg/g==
X-Google-Smtp-Source: AK7set/9kH5iClIq96ImXMXxCRZP3o6rb/SFdyOqAvYoxsx641uTIbYLyp0hit6CJig0eeQHDNzzWg==
X-Received: by 2002:a05:6214:1bc9:b0:537:7484:8d1c with SMTP id m9-20020a0562141bc900b0053774848d1cmr29006106qvc.30.1676043388060;
        Fri, 10 Feb 2023 07:36:28 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r129-20020a37a887000000b006cec8001bf4sm3758407qke.26.2023.02.10.07.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:36:27 -0800 (PST)
Message-ID: <e972c2ac1a7a6f0ce258c8056b82bdc87e4d8ceb.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mediatek: vcodec: Force capture queue format
 to MM21
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>,  Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
	 <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve Cho
	 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 10 Feb 2023 10:36:25 -0500
In-Reply-To: <20230210055518.6017-1-yunfei.dong@mediatek.com>
References: <20230210055518.6017-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_073630_080012_79F1DCEB 
X-CRM114-Status: GOOD (  17.18  )
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

Le vendredi 10 f=C3=A9vrier 2023 =C3=A0 13:55 +0800, Yunfei Dong a =C3=A9cr=
it=C2=A0:
> In order to conver the format of capture queue from mediatek MM21 to
> standard yuv420 with Libyuv, need to force capture queue format to
> MM21 for Libyuv can't covert mediatek MT21 format at current period.

Please rework this text, it is hard to understand.

>=20
> Fixes: 7501edef6b1f ("media: mediatek: vcodec: Different codec using diff=
erent capture format")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.org>
> ---
> changed with v1:
> - add Fixes tag.
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 641f533c417f..4f5e9c20214f 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -41,7 +41,7 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx =
*ctx, int format_index)
>  	const struct mtk_video_fmt *fmt;
>  	struct mtk_q_data *q_data;
>  	int num_frame_count =3D 0, i;
> -	bool ret =3D true;
> +	bool ret =3D false;
> =20
>  	for (i =3D 0; i < *dec_pdata->num_formats; i++) {
>  		if (dec_pdata->vdec_formats[i].type !=3D MTK_FMT_FRAME)
> @@ -63,7 +63,7 @@ static bool mtk_vdec_get_cap_fmt(struct mtk_vcodec_ctx =
*ctx, int format_index)
>  	case V4L2_PIX_FMT_H264_SLICE:
>  	case V4L2_PIX_FMT_VP9_FRAME:
>  		if (fmt->fourcc =3D=3D V4L2_PIX_FMT_MM21)
> -			ret =3D false;
> +			ret =3D true;

This makes the VP8 and the other cases identical, leaving anything that tou=
ches
MT21 as dead code. I'm not sure, cause I cannot test it, but it should in t=
heory
render MT8192 unusable, unless a new firmware has been submitted to linux-
firmware with MM21 support ?

>  		break;
>  	default:
>  		ret =3D true;


