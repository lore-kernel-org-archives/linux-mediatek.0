Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8421EC5B543
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 May 2025 17:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=; b=2WgSxBNBI5+fJywSJBdiSvhzjX
	/1Y1IAUdrThqTMHdsXrfy4cs0HxuCEFeY++ehHvoy8fi/RXVIUJEHmoYHvU6HAHaEhvFbDsJpLH7d
	RnYwmdynM6YveDLFDKpgERax20Sm3/X/6s1vLb5fkMqXKtO1wvXVkfNZDVgkbQQl8rfaBeJgcayfz
	VsjcOeTRjuJMG7NUTUg/VKJ/sqr7UzxBEK9vTvLRXglOBHzvw/JtUAhuVhOpfq9R6QfbeZkMXnGV3
	4p/rXLtSH4UPAPfYP40wHh3AQh7U2tmgGPFmmBLZZPcjNGm2RdvjPckuqhCvbX5MzRMt2qVAwS94p
	jpN1lGig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3ff-00000001Py8-44Xw;
	Fri, 30 May 2025 17:37:31 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3cT-00000001PfB-1pcq
	for linux-mediatek@lists.infradead.org;
	Fri, 30 May 2025 17:34:14 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6fabb948e5aso25721466d6.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 May 2025 10:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748626452; x=1749231252; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=;
        b=gjKA658CBbgpSx96RxZm0IsS4T0vbOIOqmP5ZtdjpWyH0HG9Q4srvdVk4j8Tetlc7t
         8kNZqimfH/YZ8itLl+98W3A3p7idPFZblc1vIuP1ecFMnjEgnr7bVlD12SLNR/7dzpXS
         5DQRDkDXsuDw0uKXfnUWYPTEJG7LlSBcicwjCsg/ukn4MzywHaA4vXjpWPHAu+uAYbYb
         q2qPjqHaGSAp6hntyY8myyWHLsL+/ixjf5c5LdN1duglWmi3sk2U7ZEPwUZhffM0JVj0
         OS+GIvjijDVVErKxsJzBuyIlexDNiS1uDFUVaW6P8dCacg3fxZmHbTO3baGkWHPMFteY
         6hKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626452; x=1749231252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=buVLTLGIIGSDQEPVaBKvvla56/HpfEM5pnwMP7FjQZ0=;
        b=NyRdHpo7Slw1w8c8pH1wtYwcTnluRrUFjXawU6l3ipwWs3V9JJmsdyM7mpmOsWKg1b
         QE1KqQm2oUZxg3whs7fcuk7TW8oP3Vb4UlUx/bZr7JjzzVD+xl6WIzrJPDPtBTV4twrO
         4YSMMgqMAxTbePkLBitnx/drA5cbaKrZHiG1KWDTq/1Ql2ZFkKciKQp0KAMM19z7M6NN
         HSKkRffc3fYhCE/TSNurWr/Gfq2++Q6SK7K07WQAfrpO4KMqxQe6bVIUt8Vmi2NBSa2/
         0AVwWLk97UA8/9aIi0jEQfn1RdrZ+UCH1owkVr9fqBrNlHYiSQBkWDvyJHq/cCdIg2EB
         z4ag==
X-Forwarded-Encrypted: i=1; AJvYcCUVCv6umkP+1fAU76euYshAg0xdYcXLc+iZWbCjPaZoBJ2gsaQ7PbTcz9SoLrrq3P3gToGJlmq0kk3eO0ZnbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG1WFUaGw2OPvVRmwJFzU+18K8Rc443m4yrMVls6knY8M7hkmq
	2Q4Em+JRmgZdSG4tSCFmZOwaZCZSHHdbA9FEe7fRi48Md/oIH3vwBV9xaNh22ygl7L+oo5eltHy
	GRWaOcTI=
X-Gm-Gg: ASbGncvnngdWFI5rJllwtQOh5ETJ+yBb2701J2oByfwCSh0QfSB48EcdTHhFQGDL2K+
	BAH9c0w+4XCsERopMn1chnMK6KmyPlI4f28cbH/9Qi7apoee4uRHgnQ1Ud5UK5Ffqjk9x9q+vvU
	5BRtxnOZxWtBtc8vFGQNv5hJipxypx+Zpfd8IR22+87HXncf9us6PrcsCToFSL0HiOV+KQYkNJZ
	IPyi2hJEpFQuUi5rU0KzVs7XjqM+tpP7Cy8/oxLByaPJNUGzaMjlXF59f5btDjGEgFBOy/jML3L
	vBBUB8rlNDfHVOx4xOuqE14XKdRqRpImZkjx8EhwWMUwa9d6YnpD3wq1H07PaTUbdb0=
X-Google-Smtp-Source: AGHT+IHjLHOAn3d1xA8OLMjNNh0KseItAA4qflnmZwhssThdabG4QAR2XR2GIUqKvALq3wp6IsH/tg==
X-Received: by 2002:a05:622a:260a:b0:4a3:d015:38b9 with SMTP id d75a77b69052e-4a4400c18cdmr80240681cf.39.1748626441532;
        Fri, 30 May 2025 10:34:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a633c8sm23319031cf.70.2025.05.30.10.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:34:01 -0700 (PDT)
Message-ID: <ac655c582609b7887381e1b68ed99f6b128fd794.camel@ndufresne.ca>
Subject: Re: [PATCH v5 06/12] media: mediatek: jpeg: refactor jpeg buffer
 payload setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:33:58 -0400
In-Reply-To: <20250530074537.26338-7-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
	 <20250530074537.26338-7-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_103413_713683_BA825DDB 
X-CRM114-Status: GOOD (  18.20  )
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

Hi Kyrie,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> 1. for multi-core jpegdec:
> =C2=A0=C2=A0 core0: |<-------- decoding buffer0 and resolution changed to=
 smaller
> =C2=A0=C2=A0 core1:=C2=A0 |<-------- decoding buffer1
> =C2=A0=C2=A0 core0:=C2=A0=C2=A0 |<- handling resolution changing
> =C2=A0=C2=A0 core0:=C2=A0=C2=A0=C2=A0 |<- vb2_set_plane_payload
> 2. the payload size is changed on the step of set format. Because core1
> is running and streaming has not been stopped, the format cannot be
> set again, resulting in no change in the payload size.
> 3. at this time, the payload size is bigger than buffer length,
> it will print a warnning call trace
> 4. set payload size must less than buffer length

You'll have to rework the text in this commit message, I must admit I don't
understand from this text what exactly the problem is, make it really hard =
to
review your solution.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0=C2=A0 =
| 18 +++++++++++++++---
> =C2=A01 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 0074d1edb534..52d59bb5c9ad 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -720,10 +720,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *=
vb)
> =C2=A0		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> =C2=A0		if (ctx->enable_exif &&
> =C2=A0		=C2=A0=C2=A0=C2=A0 q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> -			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> +			if (vb->planes[i].length > (plane_fmt.sizeimage +
> +			=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE))
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_fmt.sizeimage +
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> +			else
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb->planes[i].length);
> +
> =C2=A0		else
> -			vb2_set_plane_payload(vb, i,=C2=A0 plane_fmt.sizeimage);
> +			if (vb->planes[i].length > plane_fmt.sizeimage)
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plane_fmt.sizeimage);
> +			else
> +				vb2_set_plane_payload(vb, i,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vb->planes[i].length);

Is this the same as ?

		unsigned long max_size =3D plane_fmt.sizeimage;

		if (ctx->enable_exif && q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
			max_size +=3D MTK_JPEG_MAX_EXIF_SIZE;

		vb2_set_plane_payload(vb, i, MIN(vb->planes[i].length, max_size));

It is unclear to me how this isn't just a workaround though, looking forwar=
d
your reworked commit message.

Nicolas

> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;

