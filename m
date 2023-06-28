Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ABFEB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRMvRzciheSMPxqEeLs1MPeKatJtRFHaAr3+taJ0H1s=; b=n/CTUJ12YEK8LlmwHlOOjDQUyP
	KKQ5d8zLroe7yzRJUoBz4sJx9q97FMK68TCY9LDeEwbD7YLrLEszB5la/iJpNcdyWqFXTQYsbN3Ez
	aWYWBIhzRBT6SeCfG9aHF4gUW6lDTdjMsBQqS1XuHkOF9pq27rRTa7I7i8FJpXhcOSyqFIShDldt0
	M/3uAXZheTTDAjmdja0oL+kPtHy0jXY8pmdInaNwnmt+DzcwUm8pVtVrd0lUJ1zn00hwxuPqj+pVa
	c50F19PaauX+veKMR6dQX00PLok5IWdXrZm4kFc1vf+/SzOyICAXUucfCFpgwcTYeuuvv8cEBsUpU
	Qut/MvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEXhQ-00G4WR-2L;
	Wed, 28 Jun 2023 16:07:20 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEXhN-00G4UU-0D
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 16:07:18 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-76595a7b111so306787785a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jun 2023 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20221208.gappssmtp.com; s=20221208; t=1687968435; x=1690560435;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PRMvRzciheSMPxqEeLs1MPeKatJtRFHaAr3+taJ0H1s=;
        b=X5gRfGpJl0fCNovVOCUFaAjGIjHfoePTMkXXjjRYW34vOUt3n/8GQPpsXdtQAWH6In
         +Sf5LPsUj1SmG8LCkyKwT+1b3hagwRZpAc2z5byGKYR+qj65EdYEgQXw+tXvDdehAN7o
         s8ix2BLcZPRevZJ6kXs4UcAZZC2//59zllWlC4My4ZmhNvVxx+qK7Hh/AsPaVkoS03Xa
         4dX+27M5DeInqVWze4Te4zM1E/xMlIKnHYu1RBaMGqFauneaC3JZ+QgKHFxXd6iEnjza
         n+94w1Id3VfqG7goI8txmM73s8HEc2oHujaE9ceufKfvxnDS1mkRjHsPtphIHnPJspgp
         Y6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687968435; x=1690560435;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PRMvRzciheSMPxqEeLs1MPeKatJtRFHaAr3+taJ0H1s=;
        b=ewfj9pOUpIFmwmrc/2JTQgajh4OIjRMH+6qcHqrjxIS+PI9IbwgS6fUkGGhBJXoLsp
         K59VzmNcrIO48eWJfnMfoCNzfK8FmW9MCw37kkYLIjKNKlEATioe/8AM26tKZDUrQk/N
         XrbPwxugFlyjDcX/DEDV1h9sp5OfF5kv8pf55usX2v0qm9t5eiBj/m0fDL7k38Axq6KE
         DyfbRibY16WQxZTVR8ZeMAC1idxpPhcZTxGvD4k3ozNY67EgVWjMPlpaRyDI/ev4vTgY
         UyJPlfk1shR3BEnArD88BiqyiRWCfY74eDVz5TVxwOUAJ5PKmumpLO2FQb9qjb/wUswr
         rYnw==
X-Gm-Message-State: AC+VfDxQMOsoQQLilczhpHy9LPzzfcXJTs9MPrD+V18hGGKzWLbXKnCu
	eNug8hPfhSdkDxi/c3x4ogMPCg==
X-Google-Smtp-Source: ACHHUZ7tc3t3VaLka2U5MShSYYU35PWuFk9aHK4lZk99Xtvm6W+REG5Rq8KCmhpzyO/ZB3ZAH+BcFQ==
X-Received: by 2002:a05:620a:270e:b0:762:5ad0:59c5 with SMTP id b14-20020a05620a270e00b007625ad059c5mr32001170qkp.60.1687968434789;
        Wed, 28 Jun 2023 09:07:14 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:15:c623::7a9])
        by smtp.gmail.com with ESMTPSA id u14-20020a05620a120e00b007659935ce64sm3947704qkj.71.2023.06.28.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 09:07:14 -0700 (PDT)
Message-ID: <2cf1d6d7396a9b08b95d2f534c4bf9f7b3117459.camel@ndufresne.ca>
Subject: Re: media: mediatek: vcodec: fix AV1 decode fail for 36bit iova
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Alexandre Courbot <acourbot@chromium.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>,  Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 28 Jun 2023 12:07:13 -0400
In-Reply-To: <20230628054111.8967-1-xiaoyong.lu@mediatek.com>
References: <20230628054111.8967-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_090717_353504_2C333D62 
X-CRM114-Status: GOOD (  17.34  )
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

Le mercredi 28 juin 2023 =C3=A0 13:41 +0800, Xiaoyong Lu a =C3=A9crit=C2=A0=
:
> Decoder hardware will access incorrect iova address when tile buffer is
> 36bit, leading to iommu fault when hardware access dram data.
>=20
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 deco=
der")
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
> ---
> - Test ok: mt8195 32bit and mt8188 36bit iova.
> ---
>  .../platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat=
_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> index 404a1a23fd40..420222c8a56d 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> @@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct=
 vdec_av1_slice_instance *ins
>  	u32 allow_update_cdf =3D 0;
>  	u32 sb_boundary_x_m1 =3D 0, sb_boundary_y_m1 =3D 0;
>  	int tile_info_base;
> -	u32 tile_buf_pa;
> +	u64 tile_buf_pa;
>  	u32 *tile_info_buf =3D instance->tile.va;
> -	u32 pa =3D (u32)bs->dma_addr;
> +	u64 pa =3D (u64)bs->dma_addr;
> =20
>  	if (uh->disable_cdf_update =3D=3D 0)
>  		allow_update_cdf =3D 1;
> @@ -1673,7 +1673,8 @@ static void vdec_av1_slice_setup_tile_buffer(struct=
 vdec_av1_slice_instance *ins
>  		tile_info_buf[tile_info_base + 0] =3D (tile_group->tile_size[tile_num]=
 << 3);
>  		tile_buf_pa =3D pa + tile_group->tile_start_offset[tile_num];
> =20
> -		tile_info_buf[tile_info_base + 1] =3D (tile_buf_pa >> 4) << 4;
> +		tile_info_buf[tile_info_base + 1] =3D (unsigned int)(tile_buf_pa >> 4)=
 << 4 +
> +			((unsigned int)(tile_buf_pa >> 32) & 0xf);

I'm not clear on how this works. In the original code, it was a complicated=
 way
to ignore the 4 least significant bits. Something like this would avoid the=
 cast
and clarify it:

		tile_info_buf[tile_info_base + 1] =3D tile_buf_pa & 0xFFFFFFFFFFFFFF00ull=
;

But in the updated code, if you have 36 bit, you store these 2 bits in the =
lower
part, which was originally cleared. Can you confirm this is exactly what yo=
u
wanted ? And if so add a comment ? It could also be written has (but this i=
s
just me considering this more readable, I also prefer | (or) rather then +,=
 and
hates casting):

		tile_info_buf[tile_info_base + 1] =3D (tile_buf_pa & 0xFFFFFFFFFFFFFF00ul=
l) |
			(tile_buf_pa & 0x0000000F00000000ull) >> 32;

>  		tile_info_buf[tile_info_base + 2] =3D (tile_buf_pa % 16) << 3;

Is this the same as ?

		tile_info_buf[tile_info_base + 2] =3D (tile_buf_pa & 0x00FFull) << 3;

>=20
> =20
>  		sb_boundary_x_m1 =3D


