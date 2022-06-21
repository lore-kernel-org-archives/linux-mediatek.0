Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Us5unMMOUBPzuFEiHM0v1mwK/JxXZgMtN7G9faNpjJY=; b=h+CYbWYYPIBa9pzivrfxBOlTm0
	fzgiAPVb2Sv8u88SiQd4ybc8DgGuawwPJZtkwSOXOd0TIVT40uYfJWFnLNK7PCAoaH4vq1JBfq68+
	HMOL7b/ManBUV8PQjn2o/vUQz0FMFu2w5tOkyf3qjurxX2P4kQp+7mYLneU3msrRvsvIB5plrQv8r
	DonOZwQSf/LcODjiKSYUJ17TRl1Ud0MJq/zQpz/369RUboFqA3obSXeDnvwNbTlWln3h8YOMisQOi
	JMSUO6Q+NDk05YMKGUbz5SINBO7PVYzFQGfwbuuDYyxv5uF0KopCbjozfkimtt0oSYsi6peOx0PHG
	9TMG88mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3emA-005qdw-Fg; Tue, 21 Jun 2022 14:22:42 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3em8-005qc6-02
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 14:22:41 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 88so17026351qva.9
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Us5unMMOUBPzuFEiHM0v1mwK/JxXZgMtN7G9faNpjJY=;
        b=fpezBkIMLFOFzWxjpswbf4s/HCObOkBJEpbZsvdUKYst5H6NWHqDs8wBlp+Kfb3t1J
         WCDbDD+W/UILz5SULbQBeGw3zI42w/R4iGfGDceX2IxLMvHjycu9J3rzltECOtAqK5zd
         S1VwMo1hmgkAV9BgjIH2JNXUnwPJ0g9l9A0OUp5EUD74cvr9H2fAOYpCBaLrEqsMq2aG
         BjAyJBstblU/2hrODyjaqJ1T88aTeVDZu/kgxbdpXnGnuUvJ8CuKi3RbMVG/rZ4CJD5N
         vFRg0q+IwMcigLgjeZJ3cSC4SO0B9gHReKtaB326ru1FkYNJe+F2WeYBPM6Zrclav4oK
         FvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Us5unMMOUBPzuFEiHM0v1mwK/JxXZgMtN7G9faNpjJY=;
        b=CC9ggxf850xkyHLdVOfcX3TY7LH/pm+lItKuVX2R8UpHxy+p+cIlepQ72Nm/hWJe+X
         +Eq7QRPM4z1d9uJza1lNkjePGNHDKTme0Dz+ZnMcZ7DbrVpzrRdNQjzWTAfgj8UqnNeA
         xHEz2aBEvFmGMKJq2/k73xTnUGvv9PllTA2FK+oXiJZHLJtQ2vBgkMPrnlZ6oqFRa6L3
         lyr6v4KNAMs+fhJS+01qvdaYKwSr3U7TQFM1LR30HSQ3vl52TVtl75Plqbgp+cL54Pg8
         1YNjwxHCdwQojgv5j1Vc+iC96TvXexy2FPNKI85p4QKGhm9KAauM1IqBxIPPX7oY9RcK
         mO7Q==
X-Gm-Message-State: AJIora/i0yfU8rU+5EtscJU3TGzUBvSCdyyjRCf1wkWqf4PJoEsGt/sB
	ifkRbfA3vxpqXlWzGiV7roZKOg==
X-Google-Smtp-Source: AGRyM1vWXzMwB6hYFPiRehDN/2RBDuFRyqd4NGtand04O8n4nIKe/fYzERyGTr9do0RK2hCoRoE2Rw==
X-Received: by 2002:a05:622a:412:b0:306:74e9:869c with SMTP id n18-20020a05622a041200b0030674e9869cmr24545108qtx.230.1655821356013;
        Tue, 21 Jun 2022 07:22:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id q13-20020a37f70d000000b006a91da2fc8dsm13809503qkj.0.2022.06.21.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:22:35 -0700 (PDT)
Message-ID: <9f37792d9de58cf88c3b21d6d96fc83ff30768da.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Skip SOURCE_CHANGE & EOS
 events for stateless
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chen-Yu Tsai <wenst@chromium.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Yunfei Dong
	 <yunfei.dong@mediatek.com>
Date: Tue, 21 Jun 2022 10:22:34 -0400
In-Reply-To: <20220620063349.2754116-1-wenst@chromium.org>
References: <20220620063349.2754116-1-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_072240_072671_21366DCE 
X-CRM114-Status: GOOD (  17.81  )
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

Le lundi 20 juin 2022 =C3=A0 14:33 +0800, Chen-Yu Tsai a =C3=A9crit=C2=A0:
> The stateless decoder API does not specify the usage of SOURCE_CHANGE
> and EOF events. These events are used by stateful decoders to signal
> changes in the bitstream. They do not make sense for stateless decoders.
>=20
> Do not handle subscription for these two types of events for stateless
> decoder instances. This fixes the last v4l2-compliance error:
>=20
> Control ioctls:
> 		fail: v4l2-test-controls.cpp(946): have_source_change || have_eos
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
>=20
> Fixes: 8cdc3794b2e3 ("media: mtk-vcodec: vdec: support stateless API")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>=20
> This should apply cleanly on next-20220617. The other media patches I
> have on my branch:
>=20
> media: mediatek: vcodec: Initialize decoder parameters after getting dec_=
capability
> media: mediatek: vcodec: Fix non subdev architecture open power fail
>=20
> should not interfere, though the second is required for proper operation
> of the decoder on MT8183.
>=20
>  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/dr=
ivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 62f29b6fa104..a5fbc0a1c6bc 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -234,6 +234,11 @@ static int vidioc_vdec_querycap(struct file *file, v=
oid *priv,
>  static int vidioc_vdec_subscribe_evt(struct v4l2_fh *fh,
>  				     const struct v4l2_event_subscription *sub)
>  {
> +	struct mtk_vcodec_ctx *ctx =3D fh_to_ctx(fh);
> +
> +	if (ctx->dev->vdec_pdata->uses_stateless_api)
> +		return v4l2_ctrl_subscribe_event(fh, sub);
> +
>  	switch (sub->type) {
>  	case V4L2_EVENT_EOS:
>  		return v4l2_event_subscribe(fh, sub, 2, NULL);


