Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B488CC52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 14:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQKLB7LCoVJwlJRFw8EFiN4YuNjaKKh+p+8DeSR4jCo=; b=klQWqLN3Xq4irVy0+Why97B4pU
	phwnxlfjmzna1O4aeOLGEzXPg9VKafGhphhp6XdgVPiGC0sk9HHahZIls1YSZAp64r91FrolZrmhV
	bPKdj0Mj5NF9SxR7jHmLKRypW/4Xw4W3pw7/UhpiyilX6BKdZll8BuvnttLPZdXZzr1A/34N4sVCs
	yKpNOyFxO/LEcxLNDzSKtUB+UaBt20DM4tAEQil5QtVJZc60+YQDzf6u75/XRzb6HFhGocgkJFoXi
	62J6GHT3BpUz2U4gaH0Jl0Hd8/9UHMej8MBNDjDk0h+oR6KZz7boZLcN5gLGmCBGDj1l039twr275
	PTnTImRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8pt-0000000D9zY-1CnF;
	Thu, 22 Aug 2024 14:30:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8p8-0000000D9q7-2tkN;
	Thu, 22 Aug 2024 14:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F0AFCCE0E85;
	Thu, 22 Aug 2024 14:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203D3C32782;
	Thu, 22 Aug 2024 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724337000;
	bh=EIbyKKjLdJJZGFxhalx33/RF7GG9+9/lkUn6G18mVOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TPnrX6dw3L+LDovQuv/hS4rw5M/MIjwr32NwoybJluXqQXmtVLUYk9f0nBMvk9zyE
	 rbw2c5+E1noh9ol3NxemjLQ8TZxVkF+TUat5RZJJ6ui3WNh8eMmX4lCkpAW2yx51Xw
	 gCtgsIuxHHVj+BpuhM1YUetZAvtz/M5Aw4cXXByE/1yKkIo1CuzxZXL0vcf0TZ7/+I
	 cLbdNlU2xRvZtv2s4vTv8LyzVB5Y5fdDRTv6QJ6BmuBjNh1vF4zn4YaA+rzjqrTBHW
	 kXCuhNo9D6wcPd3A4WNJiS7njYd74qHBWQZU9wfKeTI4/Dc5XbzexarjD3sp3obdce
	 fzOhLoi8l9YBw==
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d439583573so647829a91.3;
        Thu, 22 Aug 2024 07:30:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZC63CqrRsXDaq7uXtB/feOePlzMYjDyy0wWkzFGdogNUqRERBVQKvPdT+FeUO+NDUfNogY1AfkMEqcC0D0owY@lists.infradead.org, AJvYcCXsjVmvGjgG//UZ3FzkwJwJxG9XlUOUC/fc16Lv5pH/FN0QGRrF2uGfsPFhy0B8xTBDD4n3X+uH21opEEjuXRc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEHmdqXJ/TV/l8ZzM5tl5D0wT27c8uJCb8lMA9jzbsRd8ciwrm
	9d3gJoaYVRQsAqkWSUPk+6jxZacTgUCpO7wAtleEl33kCVi6vDKZv3jPbwKeqs0FWriQvvj5VZQ
	D1DgKpbyMAhxMgRRWuBOOpTwkhQ==
X-Google-Smtp-Source: AGHT+IFNd1a5Jn4I/J6gdxNiBFWoik4UOxFcPN5z5dO1KYVQfJeBHZU2AH9pzjwMOeJbBICz51dLQG3eoiE91A8UOhs=
X-Received: by 2002:a17:90b:104b:b0:2d3:c976:dd80 with SMTP id
 98e67ed59e1d1-2d5ea2ca713mr6422970a91.39.1724336999689; Thu, 22 Aug 2024
 07:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240731201407.1838385-1-robh@kernel.org>
In-Reply-To: <20240731201407.1838385-1-robh@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Aug 2024 22:30:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-DT--eLNMzLd0ftoo6e74yV-cfta0C8nB+5k2hifd3dg@mail.gmail.com>
Message-ID: <CAAOTY_-DT--eLNMzLd0ftoo6e74yV-cfta0C8nB+5k2hifd3dg@mail.gmail.com>
Subject: Re: [PATCH] drm: mediatek: Drop unnecessary check for property presence
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_073003_321078_2635F965 
X-CRM114-Status: GOOD (  18.65  )
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

Hi, Rob:

Rob Herring (Arm) <robh@kernel.org> =E6=96=BC 2024=E5=B9=B48=E6=9C=881=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> of_property_read_u32() returns -EINVAL if a property is not present, so
> the preceeding check for presence with of_find_property() can be
> dropped. Really, what the errno is shouldn't matter. Either the property
> can be read and used or it can't and is ignored.
>
> This is part of a larger effort to remove callers of of_find_property()
> and similar functions. of_find_property() leaks the DT struct property
> and data pointers which is a problem for dynamically allocated nodes
> which may be freed.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index 634bbba5d43f..07243f372260 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -341,14 +341,11 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>                 dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
>  #endif
>
> -       if (of_find_property(dev->of_node, "mediatek,rdma-fifo-size", &re=
t)) {
> -               ret =3D of_property_read_u32(dev->of_node,
> -                                          "mediatek,rdma-fifo-size",
> -                                          &priv->fifo_size);
> -               if (ret)
> -                       return dev_err_probe(dev, ret,
> -                                            "Failed to get rdma fifo siz=
e\n");
> -       }
> +       ret =3D of_property_read_u32(dev->of_node,
> +                                  "mediatek,rdma-fifo-size",
> +                                  &priv->fifo_size);
> +       if (ret && (ret !=3D -EINVAL))
> +               return dev_err_probe(dev, ret, "Failed to get rdma fifo s=
ize\n");
>
>         /* Disable and clear pending interrupts */
>         writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> --
> 2.43.0
>

