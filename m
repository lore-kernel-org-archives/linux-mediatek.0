Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733FBC48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCbkaHP288a5yrdhun50bmJZYdjOw3WPCZ9sfVUzD6g=; b=IrDvPXK/IV+KwHCPijxA3A/0JL
	q0nqGqOLoy6XYnZFLvSiHgKBgBIks5yZJB81w8UtTAPFPChet5DMCYhKY/oekJNDfWIAH0AudGpT6
	sJwReChDGZ6xOAA0t8gyerkFBGwoqVn4vx1aqCSMjkIrNmBxWH02nrhifcrOx3g6ayo/JvhkVR9qX
	37Nj69S7w9G245VrcfFq/qrNkLVxxxLWu9joPkv3+E/o+rwJ+heTncFBVPCBziwxOoExFkpyGEtOr
	JfT0i9w/Vb6rz/6ni0FtDfNGO/TKqBzPbieHt7tc2Wv0xkhHkalO0NpJ28e2kGHb8y1Gzu+SgUe4n
	xq3Tyz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcAto-0000000CBai-1gCf;
	Mon, 19 Feb 2024 21:10:04 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcAtj-0000000CBZa-0IuT
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Feb 2024 21:10:00 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6868823be58so14514326d6.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Feb 2024 13:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1708376997; x=1708981797; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCbkaHP288a5yrdhun50bmJZYdjOw3WPCZ9sfVUzD6g=;
        b=VFU7soF3SoY+z01O2aSbyCJgC1C1mq5f0jY921hMRTF9gSDRV1h/Hed0lkao0dJtx0
         vP3xax6qToPhKgGvITnNQiBOpMS7wmlfK/Aq7BiJxIQqN98rw6lw1pga2u7Y2De4UyeA
         6bBwoT373bbvaQ1Q8BYoK10x0nqqXchyJcy8I8FVCQ+StTpXncSkNY3xTX33TUfTdxZk
         8yN3cKJyLHtF7u2KARbS+ec+Ccg5DaQcYaRtWM9h5PIHFADkr4LbEdqva3/gmGF/N93A
         gXPfrqCaEbtoMNrNE8W+tPu5om7gKTTY7a9rAmIxjpjgbyklY4tN/uK/THgTSSGaiDQf
         0knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708376997; x=1708981797;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCbkaHP288a5yrdhun50bmJZYdjOw3WPCZ9sfVUzD6g=;
        b=rVBu9JDLwwWpzIwaaRNZD9vRS4L8D4qCKRwfOenrn6LZXUxIvKfRCIJRfG/tp5G8og
         yD8oggXxR3/JQJOcG4p3u3qb6RoWaSFnJE2JNDoWkWNR/DcEiBs9plIvYau/l1CmvX+w
         nTUIGcLWazZD3QxJ3LxzAHnN+Xrn3uhVDVtjCNvIz0Lnw+K10rCRrjUvgQdGYDFy5r9q
         rYXSfSB4qDfdXYkHSD2tJJv+YRWRFUM1tXGZw/1IJhnAQ4jzZEuF2EuPAyfYjQqm+mFc
         9ruQFRewln8RQD54LJIfWb/OgXgdBu6CAMD/EXx/9DLSTcw9+lle9/c7Nzol5BDSHnZU
         tnlg==
X-Forwarded-Encrypted: i=1; AJvYcCW0SvjLwOdYpvx/JLXoymc+IYTM7O2QlGwdOuCd3dGkb7MwHV9lhj+O0eFWlTcSUusB4VHuJDfJ7IglCHcyy4JrOWlPhAcEY31MdOOVJFMBju+r
X-Gm-Message-State: AOJu0YwXc0J+RJvOHvVXfx/6Td0tqzOwTcQkoQkcE3XLbqs6l2ME2tuA
	XedB0GcQaFNLQBRzwTsQZrVGU/am8ujm7q3k3eOK93MmGpoPpx6TKZwvMJhTC4RV4J7NLpSM4YZ
	H
X-Google-Smtp-Source: AGHT+IE4nG1woNYcCJfdWwaumNGm4a6aorUD4KZhgabmwl0ONqKwgzR9HsQOTqEqXF6MlUwntWWu4Q==
X-Received: by 2002:a0c:db0c:0:b0:68c:7f24:efdc with SMTP id d12-20020a0cdb0c000000b0068c7f24efdcmr15617434qvk.53.1708376997287;
        Mon, 19 Feb 2024 13:09:57 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:3354::7a9])
        by smtp.gmail.com with ESMTPSA id t5-20020a05620a004500b007876fd0b878sm666361qkt.53.2024.02.19.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:09:57 -0800 (PST)
Message-ID: <6bed645bc3ddd51092ed8f6e49672af40735c83d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Handle VP9 superframe
 bitstream with 8 sub-frames
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 angelogioacchino.delregno@collabora.com, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
 <longfei.wang@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Mon, 19 Feb 2024 16:09:54 -0500
In-Reply-To: <20240218115954.4038-1-irui.wang@mediatek.com>
References: <20240218115954.4038-1-irui.wang@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_130959_331704_8E9AF95F 
X-CRM114-Status: GOOD (  17.72  )
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

Le dimanche 18 f=C3=A9vrier 2024 =C3=A0 19:59 +0800, Irui Wang a =C3=A9crit=
=C2=A0:
> The VP9 bitstream has 8 sub-frames into one superframe, the superframe
> index validate failed when reach 8, modify the index checking so that the
> last sub-frame can be decoded normally.

When I first saw this patch I was concerned, since we don't allow bundling =
super
frame into the stateless API, but now I realize that this is for the statef=
ul
decoder. Perhaps you can help me and possibly other reviewers with simply
stating that this is for stateful decoders.

>=20
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> index 55355fa70090..4a9ced7348ee 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.c
> @@ -526,7 +526,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *i=
nst)
>  	/* if this super frame and it is not last sub-frame, get next fb for
>  	 * sub-frame decode
>  	 */
> -	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx !=3D vsi->sf_frm_cnt - 1)
> +	if (vsi->sf_frm_cnt > 0 && vsi->sf_frm_idx !=3D vsi->sf_frm_cnt)
>  		vsi->sf_next_ref_fb_idx =3D vp9_get_sf_ref_fb(inst);
>  }
> =20
> @@ -735,7 +735,7 @@ static void get_free_fb(struct vdec_vp9_inst *inst, s=
truct vdec_fb **out_fb)
> =20
>  static int validate_vsi_array_indexes(struct vdec_vp9_inst *inst,
>  		struct vdec_vp9_vsi *vsi) {
> -	if (vsi->sf_frm_idx >=3D VP9_MAX_FRM_BUF_NUM - 1) {
> +	if (vsi->sf_frm_idx >=3D VP9_MAX_FRM_BUF_NUM) {

nit: I'd propose to define a new maximum (contractions allowed):

  #define VP9_MAX_NUM_SUPER_FRAMES 8

This way you can revisit bunch of `VP9_MAX_FRM_BUF_NUM-1`, and make the ove=
rall
code a bit more human readable. There is no relation between VP9_MAX_FRM_BU=
F_NUM
and this maximum. The limits simply comes from the fact
frames_in_superframe_minus_1 is expressed with 3 bits.

regards,
Nicolas

p.s. your change looks good otherwise.

>  		mtk_vdec_err(inst->ctx, "Invalid vsi->sf_frm_idx=3D%u.", vsi->sf_frm_i=
dx);
>  		return -EIO;
>  	}


