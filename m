Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A2FC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwobtvlu1ApCEa1mWvDaiiIx0D8/aosKTXPfSOE5S6o=; b=Wdejr1d4mpuKQ7xozRfilawjPj
	TDO1hsLhK/bwwR1/gsm9cqFOtdWgrBXEtEj9Wb0xoJi/KHDbAlTMdUTFy05ssijy5Bea4+mWam1AY
	+WyCtaBdBjO26mhuaOnoN6qI5u+Y+h0iOtoAQUrc93QcB5HO0b1eWMkgDswUeqT1yYMhOgMVEvXai
	KdIJzKCPbkiLPm3Sj7DTak4M6hDdscBgKOTPaWNXyLvL9QaP92Of+2qFIzD5AdXzW7WHLfxTkJReB
	KJioxdkAyRpZBZZ7Fr5zi06rlGW+7qCJF2L/8rwlzdkcFNAWScRlQuk5sLA56vsh+Qy3d+oj+lwbX
	dZIazC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piGY3-007tsr-2c;
	Fri, 31 Mar 2023 15:20:15 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piGY1-007tr2-0V
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 15:20:14 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id x8so16515982qvr.9
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 08:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112; t=1680276012;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cwobtvlu1ApCEa1mWvDaiiIx0D8/aosKTXPfSOE5S6o=;
        b=QJSPoywaO0m7h68iu3eDbeHedBVSgLj+mDP5AeRmUcQQBFoA1dRd8/32uNuU5OQoYw
         APXYxRRawaw/eWkf40t+JgcrS6Pngh3q1jAmNC31QF0yiKmLo/S/MoAO3V+TyxS50/uO
         qoDM5EeuK6iZDK0ZefkIuyyh66Lp7idbaP/tDSwOHkQxLplswBqrAmuEKbu1hJhIJ1w4
         X7zpq4C9qnPM2JlRTfzaKjYF7GYQWEz6E0d2xJiLtwuP46VYvO2XyRSJpNbDTHp7B/eQ
         3wuBes6k2WJ9mQuuih8+dzN4rQlbbuV5SNe7qAm+J8j4P9uvE7ib/HX3G6XB3tuAlqSh
         z3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680276012;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cwobtvlu1ApCEa1mWvDaiiIx0D8/aosKTXPfSOE5S6o=;
        b=GaYVLZH1r3oUL5sxKvB8mNvrhLev0z7q3ohO21RPIUiEqEqSjXXnRTkuO7KOhK6mbV
         9Ihr4VRlMH/iCJc9PRObBvGihfRTBvMdNcGtkWyC/2ZqCeHGEL9J+3MZKyWxjbeWwxce
         ZQlFRovDRjYiNXVb+9I9AEwJCXQTV3OGGsoUF3vByX0igWW6LH3FDclXzxV54Qy4BUDo
         CvdD2LzTV+jqzPml8t0d0i0LML+Q8jgq/e9KrYgn7QHK+4lfE7ilwGpvGh8IDQ2exEMs
         NMFJsEC8OulBvQ53KIfMdgo53a8Ep6NKzFFTQGxBHo7YKvPQOAMmmUjbfJRJKvVxQsNc
         OK8A==
X-Gm-Message-State: AAQBX9fH2Tg5BWaLByNIRMbCB7sKiiZ4WbH4M0dCixFVI6IL2aSssjIq
	gQkqY+e9OWwtQMyJS4Dfrodw0A==
X-Google-Smtp-Source: AKy350ZLa5XcprT/+Eis3sIfxUEgg4anw3KcRdAqzKFKQ+/JzSzTBaKU52DQJgcOf72oHNOKmWeACA==
X-Received: by 2002:a05:6214:27e5:b0:5df:44f2:e97d with SMTP id jt5-20020a05621427e500b005df44f2e97dmr15254434qvb.19.1680276012017;
        Fri, 31 Mar 2023 08:20:12 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:a07e::580])
        by smtp.gmail.com with ESMTPSA id ml11-20020a056214584b00b005dd8b9345aasm653254qvb.66.2023.03.31.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 08:20:11 -0700 (PDT)
Message-ID: <df3e49a5f8c03cf9b67698d008cd1b99578835a2.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix potential array
 out-of-bounds in decoder queue_setup
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wei Chen <harperchen1110@gmail.com>, tiffany.lin@mediatek.com
Cc: andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
 mchehab@kernel.org,  matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,  linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Fri, 31 Mar 2023 11:20:10 -0400
In-Reply-To: <20230328100951.536955-1-harperchen1110@gmail.com>
References: <20230328100951.536955-1-harperchen1110@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_082013_198373_D3240352 
X-CRM114-Status: GOOD (  17.16  )
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

Hi,

Le mardi 28 mars 2023 =C3=A0 10:09 +0000, Wei Chen a =C3=A9crit=C2=A0:
> variable *nplanes is provided by user via system call argument. The
> possible value of q_data->fmt->num_planes is 1-3, while the value
> of *nplanes can be 1-8. The array access by index i can cause array
> out-of-bounds.
>=20
> Fix this bug by checking *nplanes against the array size.
>=20
> Signed-off-by: Wei Chen <harperchen1110@gmail.com>
> ---
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 641f533c417f..cae34cc7c807 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -753,6 +753,13 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, un=
signed int *nbuffers,
>  	}
> =20
>  	if (*nplanes) {
> +		if (vq->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
> +			if (*nplanes !=3D q_data->fmt->num_planes)
> +				return -EINVAL;
> +		else
> +			if (*nplanes !=3D 1)
> +				return -EINVAL;
> +
>  		for (i =3D 0; i < *nplanes; i++) {
>  			if (sizes[i] < q_data->sizeimage[i])
>  				return -EINVAL;


A bit of context, *nplanes is non zero only when called from VIDIOC_CREATE_=
BUFS.
I think this highlights a bigger problem around the format in
VIDIOC_CREATE_BUFS. The format should be validated through TRY_FMT in some =
ways,
notably to apply the HW required alignment, but also to avoid having to val=
idate
that lower in the stack.

Nicolas


