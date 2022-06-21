Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB48C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 14:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOS/5sDSVRe9xVqmGwkJ+5vo/Q8jcVNLwgNXYg2yOQs=; b=bkcZ/Mu5axsrKUd9yWyJFVBkTO
	T7PtIwj//z1krt4oiisgWQdzTb8i38Lc/FkKhRRNNAsvdEGNLaX50exnp7JXuODYVG8Kh0yi2wAJK
	6+SksBB0rGKn4OYUENZluBNGRxLenT5+cwfwwyZIH3XgwOMilXmW1ZOj2yrqgV9CUFKDUEb3LaqcQ
	4QhBH1WDuhYUWb2P+brBnaRwQx0Bs0LYw4hlyBneds+IlyFw9Kbl9KDOdJRxex6AVBbi6KB9ZuIMU
	sqOC8FH0oIT/z7mqHZtmmn9jlUfXspNp5YSEsLBgG5/wAC68bht6EUxDxubl2YXHylMEzDGGu5zwg
	q0opYNlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ekI-005q7q-Ne; Tue, 21 Jun 2022 14:20:46 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ek5-005q2K-Dt
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 14:20:34 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id cs6so16066817qvb.6
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=UOS/5sDSVRe9xVqmGwkJ+5vo/Q8jcVNLwgNXYg2yOQs=;
        b=emm3jY9/JB9YVRuSwlSR8EcjujcyeZKFNlGFlog4esm4Si4/kvzFI1gJg63VkiPZhB
         j1MD+u4stqQGd14DMP+5dGamJdmbnT8IRhcJlTCGmLO4gEe4gE75g1qpPvYU4xE0DjLK
         X9o58/A+0Okx+crl4PLFuhdJWbAoMYgot+WskVbop1eKghHgpf60Ivw0AytMdCkJuzu+
         Z7ygkU1RWLYv/BsTwh/Hbex0EJNa0nBsSvQXwEWbMPCjea7gy3fLmHChFTvdaQJSIWKT
         cG9xaN+pvF3AH3SdCd2MEjhqwzb8q0MQGx+4aZ+zT+fnkZXfOSqfBqtCr7P6DBBdaFRT
         6jyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=UOS/5sDSVRe9xVqmGwkJ+5vo/Q8jcVNLwgNXYg2yOQs=;
        b=QOWhiakFhMAxf1lANp+RrP6pz3rR+D525aGe6W7ZpfsyMEvlGIfwVeWMFaJf8l+ecU
         f8oE3MnL2iSNWjhif4eXEGGMtopF+wO+lKCHCO6n3+RgfpPPQ8oa3o6gzNtfFyqw/DEP
         ciupc/f8VDaX4zYQshJYwmpkvzm/vH8rUdbebt/PXqvsEoJzg9w4ySL5EUyDqeRZwLno
         JhZPQKStSPMgC6JAkmKIDrZzW9iacpIUjeSRASEFmjbiZHWx2QnPWX0bWoLmBKdgN+jP
         ElVrmfZWkyT9NrqpOrGYwk679w4ohdxhFKchH/cO0NL+Ffcvm+0cEAHRu+nKWBQdKVKE
         R6NQ==
X-Gm-Message-State: AJIora9dqvchiuRoib8Bs2YbkKD8tyzSkjyS95u2Fo2TYGNojdj/wNnz
	bUiOuB3Jg+6qv7/nuvIhzJ+aqA==
X-Google-Smtp-Source: AGRyM1unod+k/GpXpVkEZFF0eq7NoRNvCJhHEKKaSOn4oEAAdqMDidqv29b7ax0pQkDjCORmBmQDAg==
X-Received: by 2002:ad4:5c8d:0:b0:470:4649:e3c9 with SMTP id o13-20020ad45c8d000000b004704649e3c9mr6914682qvh.43.1655821230749;
        Tue, 21 Jun 2022 07:20:30 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id d84-20020a376857000000b006a77e6df09asm13286497qkc.24.2022.06.21.07.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:20:30 -0700 (PDT)
Message-ID: <320bf3dd2bef0afec794d610b446d0085dcfe362.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>,  Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,  dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Tue, 21 Jun 2022 10:20:28 -0400
In-Reply-To: <20220618072929.28783-1-yunfei.dong@mediatek.com>
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_072033_533543_71E3591C 
X-CRM114-Status: GOOD (  16.48  )
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

Hi Yunfei,

Le samedi 18 juin 2022 =C3=A0 15:29 +0800, Yunfei Dong a =C3=A9crit=C2=A0:
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.

Perhaps something to improve in the future. On top of describing the fix, i=
t
could be useful to describe what issues is being fixed, and which platform =
will
benefit.

>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

To add to this, this looks like a bug fix, can you relate it to an original
commit and add a Fixes: tag here ?

regards,
Nicolas

> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c     | 2 --
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 1465ddff1c6b..41589470da32 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -112,8 +112,6 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vco=
dec_ctx *ctx)
>  {
>  	struct mtk_q_data *q_data;
> =20
> -	ctx->dev->vdec_pdata->init_vdec_params(ctx);
> -
>  	ctx->m2m_ctx->q_lock =3D &ctx->dev->dev_mutex;
>  	ctx->fh.m2m_ctx =3D ctx->m2m_ctx;
>  	ctx->fh.ctrl_handler =3D &ctx->ctrl_hdl;
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c =
b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> index 4103d7c1b638..99d7b15f2b9d 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> @@ -208,6 +208,8 @@ static int fops_vcodec_open(struct file *file)
> =20
>  		dev->dec_capability =3D
>  			mtk_vcodec_fw_get_vdec_capa(dev->fw_handler);
> +		ctx->dev->vdec_pdata->init_vdec_params(ctx);
> +
>  		mtk_v4l2_debug(0, "decoder capability %x", dev->dec_capability);
>  	}
> =20


