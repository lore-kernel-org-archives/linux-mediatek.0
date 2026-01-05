Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55F5C79FB3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 19:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDDvkHfL5SsDyjmtGrwtC4U8Vp9VsmLY6KqyAaQnAtw=; b=eofcBLvqCpOdu82525S2/07ID6
	R3v/1ZFkCXZkAgeYwIBFR5HC+YwngleHzzCc0VjMWuXEID7LAG2GgQDPLc4dBKDnAr25J8kCjk2Os
	wuPCABIh9D5pX65PNeZGxbaLQsDv3ZPWVsyULgylsw6dS0M0ZcJOoMYduJujfLHq9XfAXNRVBVasB
	OHaUkNFiaqDkL4cX/vZ1icgnEdgU9dRJ1lrstoPZn/uA8czCdKnCVocL0gGa1J5Gc41eRz7K8v/RR
	2OXVHzP5UgzNcrOH6Izj8SpndQf2KdQnL6WSX+Mg9iTNthdmz3U55/GOQqcZOKyX5ZBWNgst/0qfg
	HKMAu2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcq7h-0000000ByAf-1GZV;
	Mon, 05 Jan 2026 19:20:13 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcq7d-0000000By9m-1BcN
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 19:20:11 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-8b22b1d3e7fso23197185a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jan 2026 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767640808; x=1768245608; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tDDvkHfL5SsDyjmtGrwtC4U8Vp9VsmLY6KqyAaQnAtw=;
        b=pACYwJmy6s9WdIr5SOSDqqofo0ebtZP2AByvC038tahYFmbLYM7LHs/SIA159XJock
         Q4YCfufXCsleXXkJD+J67KiSPKwcF9ebeWE9hfOWS8eDL8eNoRrKAWCph7HPa2AhQeId
         xffQ8g2qF5j1FyXeI4yYnDkCVn6lP2q88f6NOgSJoUaxd/hd4DyN2H0hH/CEOjSFAzmm
         RBnNY4UW7r4EATeKuIAESOGSHrjRpubQ7AtmqbVIT+A20eVEpUOrw5W1CP2oZNW7jxBD
         unYqzFMdfzAwBh2Z+k3VSIzeuRx70puTDsTj3dPkI6FsTZL0GVCIeXy215l1v8LhbfE4
         sAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767640808; x=1768245608;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDDvkHfL5SsDyjmtGrwtC4U8Vp9VsmLY6KqyAaQnAtw=;
        b=cYC0C9eJWzCWHcCEc8+h6RWXP2Y9ipkJbFUcS3lQ5xy3ASQp2gBUvmImNhEDKoTJj4
         Mytvc2rwxh2uJ4R2jbn5oUfJ32zGFUx5HPd7R5kc8oc8qhs1KniDE2MFKHr1MTkDi3j+
         3nk0BeDxg8RNndMIHLdI7md8O9Mqs4iX/+0UzptvbAc+8njHE1Sz3ykbworvV8MW6Cw7
         Yvd4RaGNQeJrSWSfAoJ2Wxjo0MqZcvx04+qGkDVSEHo72cTaeE0GLkStrKfIphEZfSwv
         +F8gbVb9JtPJIsL/RgQ2eSGHGTLorD2OLHVNiqjqH6Xpm62J4yfjFP63ao6jmRRL0nnM
         +sPw==
X-Forwarded-Encrypted: i=1; AJvYcCU3a4udCaQooEXuQhiw7h1RjWXSG4NgtsD6xGMMDugCuoOK+w7+6nPvtkewlWeQd+ofuOxMMqk9f7Mwrm8wJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx39DlDKKjUJNkcObr2nrpwppFL/gc5EbNrrr0SSQ+tHrx98gDK
	DTuUjDzZVvsMCquz4khx4AyOWen2QHRZATWt3vLCeDTRiK+7B6jdwUf00/+zdNICM74=
X-Gm-Gg: AY/fxX5Gzz8QwR46SV03ndxEeCABbB2Nmq+nAA7891+dZKBo4YGvsiGzOoRMo4HxHq2
	8cIBTQohIgDCD+cfO1cpphK4Zpk30l9IrZfR/ko3otnxR+ZV9u9uMNksss6PM9B4DQZXtggnre+
	vunAjYQ7l6AYGXvHt/cq1FpC9s6oCeKxdWlRL7hHt/AF3wop5wfu+uAI2ezDXW7lY6PjnUI0nxC
	INA+ldqTfNrpV7x+kgyPl4sSyR93L5PmynZ5yWikTdHLSySD2TLSxlG++csSyxyqcaG1gYQZDWa
	xyqFRm+alKtZkcZ/lZZsTEfDUWCyNtCZC4scM+DzSe4NDjTbRRTk5dO2K8il8z8yeJUSzsDphs0
	i/iPnVcVqBZ7TLs/3+DbUTOE2ZSGmoJR5IAUbZY16psYuhFvaXwxOlD9W4EzNkRL+UD/C5bReJS
	IT53XPW9zgvrl8v1Lr
X-Google-Smtp-Source: AGHT+IE5ziBUA1L6ZAL+rkRAZxmOcXQvbxBtmVTb5t38TGd5tiHW8FkBWpqUQMf/N8PhTT3xc9qk1w==
X-Received: by 2002:a05:622a:250b:b0:4eb:a6c5:f6c7 with SMTP id d75a77b69052e-4ffa769a084mr8345811cf.2.1767640807852;
        Mon, 05 Jan 2026 11:20:07 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa708853fsm4201461cf.9.2026.01.05.11.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 11:20:07 -0800 (PST)
Message-ID: <415509d2c4639d086614e9a473b09be16442648a.camel@ndufresne.ca>
Subject: Re: [PATCH v11 03/12] media: mediatek: jpeg: fix jpeg buffer layout
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, "linux-media@vger.kernel.org"
	 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
 "hverkuil-cisco@xs4all.nl"
	 <hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	 <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 05 Jan 2026 14:20:05 -0500
In-Reply-To: <714f2e57521e990d77b80d23a9eb773ca878b07a.camel@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
		 <20251202094800.6140-4-kyrie.wu@mediatek.com>
		 <89f845b45405bbf985a5e92c195078074bcce0e2.camel@ndufresne.ca>
	 <714f2e57521e990d77b80d23a9eb773ca878b07a.camel@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-4+oXkLqgBdCrGoVfdxJj"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_112009_486239_B9E40642 
X-CRM114-Status: GOOD (  35.70  )
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


--=-4+oXkLqgBdCrGoVfdxJj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 25 d=C3=A9cembre 2025 =C3=A0 06:05 +0000, Kyrie Wu (=E5=90=B4=E6=
=99=97) a =C3=A9crit=C2=A0:
> On Tue, 2025-12-16 at 16:22 -0500, Nicolas Dufresne wrote:
> > Hi,
> >=20
> > Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9cri=
t :
> > > For memory alloc operation of jpeg dst buffer: the mallocing
> > > memory function interface use vb2_buffer as the base addr.
> > > If structure mtk_jpeg_src_buf wants to be allocated to memory,
> > > it needs to be placed vb2_v4l2_buffer at the starting position,
> > > because structure vb2_buffer is at the starting position of
> > > vb2_v4l2_buffer, and the allocated size is set to the size of
> > > structure mtk_jpeg_src_buf, so as to ensure that structures
> > > mtk_jpeg_src_buf, vb2_v4l2_buffer and vb2_buffer can all be
> > > allocated memory.
> >=20
> > Please correct the wording, "mallocing" is not a word, addr ->
> > address. I tend
> > to do the same, but refrain from giving the code a personality, the
> > vb2_buffer
> > have no will. This is overall complicated way to simply say:
> >=20
> > 	Fix the size of the allocated mtk_jpeg_src_buf structure.
> >=20
> > >=20
> > > Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker
> > > interface")
> > >=20
> >=20
> > Drop the blank line.
> >=20
> > > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > > ---
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> > > =C2=A0drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h | 2 +-
> > > =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > index 0cf3dc5407e4..bd0afc93d491 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > @@ -1099,7 +1099,7 @@ static int mtk_jpeg_queue_init(void *priv,
> > > struct vb2_queue *src_vq,
> > > =C2=A0	dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> > > =C2=A0	dst_vq->io_modes =3D VB2_DMABUF | VB2_MMAP;
> > > =C2=A0	dst_vq->drv_priv =3D ctx;
> > > -	dst_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> > > +	dst_vq->buf_struct_size =3D sizeof(struct mtk_jpeg_src_buf);
> > > =C2=A0	dst_vq->ops =3D jpeg->variant->qops;
> > > =C2=A0	dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> > > =C2=A0	dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > index 6be5cf30dea1..148fd41759b7 100644
> > > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> > > @@ -85,10 +85,10 @@ struct mtk_jpeg_variant {
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0struct mtk_jpeg_src_buf {
> > > -	u32 frame_num;
> > > =C2=A0	struct vb2_v4l2_buffer b;
> > > =C2=A0	struct list_head list;
> > > =C2=A0	u32 bs_size;
> > > +	u32 frame_num;
> >=20
> > I like the change, but this shouldn't be an issue if you use
> > container_of, which
> > is safer then a plain cast. Please review the code and make sure to
> > use it. It
> > may be confusing to include a cosmetic change in a fixes.
> >=20
> > Nicolas
>=20
> Dear Nicolas,
>=20
> The driver requests memory space for mtk_jpeg_src_buf in the
> function of mtk_jpeg_queue_init,
> and it used struct vb2_v4l2_buffer b as the starting base address,
> the parameter,frame_num, will not get a memory if we keep the old
> structure. And a unknown memory would be get if we used container_of
> to get the starting address of mtk_jpeg_src_buf.

You are right, and the documentation says so:

 *              The first field of the
 *		driver-specific buffer structure must be the subsystem-specific
 *		struct (vb2_v4l2_buffer in the case of V4L2).

This is inconsistent with how other objects are overloaded, notably the req=
uest
object, which does not have this limitation. We should probably fix that
someday, meanwhile.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>=20
> Thanks.
>=20
> Regards,
> Kyrie.
> >=20
> > > =C2=A0	struct mtk_jpeg_dec_param dec_param;
> > > =C2=A0
> > > =C2=A0	struct mtk_jpeg_ctx *curr_ctx;

--=-4+oXkLqgBdCrGoVfdxJj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaVwO5QAKCRDZQZRRKWBy
9JQpAP0dnUFHHjrwSdklIXv0iM9Mn2ffy7uO4iLtFZ1F13veZwEAxFlPuKq8bjib
yxKl4rlCUkzH3EGoWvZd1nccuFKJ5Qw=
=uGnL
-----END PGP SIGNATURE-----

--=-4+oXkLqgBdCrGoVfdxJj--

