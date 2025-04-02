Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A86AC28B20
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 10:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=; b=vGIjUS77q8tX32sqPm4cNF5gy8
	Zy3UvV3eIUsJTiOqm7GK0KCkSoSjWVVXm47pl5Y+XsPT1/IKwR/TLcrf+1PXUefPAVEuAbX7+uqXo
	jxqQls5w5Jra9sLopQE6HOAshiSOKmrjbmUA0gv3SNnAd0FiortptrJMeTnhr7WTtUbT0X8zsBegz
	afbPldvLIPglIMhmKVTOokePq6/oHhhO9w6KpGc0vino0RBjdTbtP5D3gc+wv0DkdG29wpOW0N40z
	2x4gHM5Va4zAMNTaqD6GCOsVSH5RIxuzAOcNlA8gpmnK6byT+UNBqvPblpH7ag/CTBs4dNA7azdCs
	D4D4ZqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvDB-00000005meQ-34o6;
	Wed, 02 Apr 2025 10:20:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvC7-00000005mMJ-2Do6
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 10:19:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11457088a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 03:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743589179; x=1744193979; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
        b=JZiB/afUjeL65J4X1qi3B2yEy0ycN3JeUWQGJ7joDzVsDy9HBLPmpp4G84GmUJVNC9
         s6OjPilNArnBIbMnx3Zeo7kPq+PLqK44JdC9clo8Z0PMPH8rHmFe5i7YPfrTreoXsgjD
         yeDgCZmZsjHBnjEVQAH0RuwdbfJjw0EDdo7R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589179; x=1744193979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTVP9DTsW3vnY5FLKNjx74F5/L54TED0U9Vc1dT3Vbk=;
        b=XF20hoTF6k/g2aEOImXxJxis8/bzxpovTi1GDQEHW5lXWuu0mkVSEc7ucl+613p4DH
         t6b1uyZ86fPhBRfnZGSEs+sGT9AhGb0NdSIg4zZ+89yTNzVTWPnTktzKWwZl+Jn/dG7L
         PeIpHbd/93Nt1C3puPEwL4PmW2h/gx2H83u5LeGJREc3Rw1+CyQ120goUcZHbVVklEcs
         Y9tP2xjy3/1jex3eYuT4zZ3qfkwpK9szfciuG1IBsJFlzi4IOUNlMTNIjYNuVCrbXh9j
         hAM74Qs0Dztebtmfd51DFhABsV2DJgFliZV2X8FOmoezI7uG2PeKdUjNULLog/m4vM/X
         S7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWlha92S8p5ib6UfRG11Zs9XS0eOjX/iPuguPXRAmnYZEVcKOvrBOayVvw1Qynwz/UDY8pf0dArlMKFgybTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2zgTd7a07/4Iie02BDioM9UT/4BG9oW+TrQfEyy4ayQcua3Y7
	W7FcKZA43/J8ChDqk7HxF9AAyh2+eThxr9JSPXZJy9wGaBKJHNiZ8lpF6oUjvTA1SmWPJbkRB21
	Im6lPBoU5iz7UsP7rqsZF5FAIoqU3ognSnK+3
X-Gm-Gg: ASbGncuETzBmSu8ANAwfzCDejxNQRWFBwgsk7Cjd4F63NtNvqhXVX9DasagQfcjFfbS
	fNlN8P4pG7XZT1D2KTaDzK4brVVV4pSf6gDITza/cqgIJ1vsFxok5RLQnmpDfm47qwgGPmRpl5a
	szkf4XbMcVc2OV33KrKaMiPGNdtxCVegrNqPmjWT0LkEh4X34QUYb8
X-Google-Smtp-Source: AGHT+IFc/gdat5Dr87A+81uJRFZWgnUw8FjScnpjhEXBVgVwotYa3CxXqBYBb5s66JTrRULG7QmLlhlnerHeo7QspTI=
X-Received: by 2002:a17:90b:3b50:b0:301:1bce:c258 with SMTP id
 98e67ed59e1d1-3053215e7femr19031005a91.22.1743589179070; Wed, 02 Apr 2025
 03:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com> <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 18:19:24 +0800
X-Gm-Features: AQ5f1Jr24z9TQrfYXn99ssRwXfkIHJUxBLD8IHIrUHUVmb0Bwvezsgoy_EISkMk
Message-ID: <CAGXv+5H1aww6Adf=EKCkpC8oCkdRLEHP5_fwtfU1BzEsnyi7NA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] drm/mediatek: mtk_drm_drv: Unbind secondary mmsys
 components on err
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_031939_598738_ABC51434 
X-CRM114-Status: GOOD (  24.56  )
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> When calling component_bind_all(), if a component that is included
> in the list fails, all of those that have been successfully bound
> will be unbound, but this driver has two components lists for two
> actual devices, as in, each mmsys instance has its own components
> list.
>
> In case mmsys0 (or actually vdosys0) is able to bind all of its
> components, but the secondary one fails, all of the components of
> the first are kept bound, while the ones of mmsys1/vdosys1 are
> correctly cleaned up.
>
> This is not right because, in case of a failure, the components
> are re-bound for all of the mmsys/vdosys instances without caring
> about the ones that were previously left in a bound state.
>
> Fix that by calling component_unbind_all() on all of the previous
> component masters that succeeded binding all subdevices when any
> of the other masters errors out.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Makes sense.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6b31df587507..2d6562b29755 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -482,8 +482,11 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         for (i =3D 0; i < private->data->mmsys_dev_num; i++) {
>                 drm->dev_private =3D private->all_drm_private[i];
>                 ret =3D component_bind_all(private->all_drm_private[i]->d=
ev, drm);
> -               if (ret)
> +               if (ret) {
> +                       while (--i >=3D 0)
> +                               component_unbind_all(private->all_drm_pri=
vate[i]->dev, drm);
>                         return ret;
> +               }
>         }
>
>         /*
> --
> 2.48.1
>

