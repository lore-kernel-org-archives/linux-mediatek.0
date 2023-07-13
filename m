Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C508C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyEkQpgIXNpGAjYikyKRrMbeGwRnjSnhMc5RNVKg7IY=; b=TdYHcrcGuPYyJrnLzjSMNhsNZn
	oLkYE4ygLsX73gPu0q9gKpEugO4t89AxbIpmP8w1lPrrnvttQXRWDweotZoFMP9Tr7i/CKNRL+yE0
	OhFOXZS/9TWRyEuviXDAteAdPHLd5BKL67feqenin8Gw/gt9jGPQwnsNdsBJ+vgBvFVkgC1r/A+uI
	g6V8xEewwXgOfhw7bFUSRaXx6RiDyS9PEy19s717myA14r8zbQyKH5l+9MxvoyXw/N9XfG0umRh+D
	sdXXYwNRrBURgcKline7oZgwjKXgRYRIdCtcg8n1jj7i8x6sU6eW4N++A1VSEKYZOtiVYJeTyCF68
	WXzUsPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrmr-002S3x-04;
	Thu, 13 Jul 2023 08:34:57 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrmn-002S2C-2k
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 08:34:55 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3465ec72cc8so1776225ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689237292; x=1691829292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyEkQpgIXNpGAjYikyKRrMbeGwRnjSnhMc5RNVKg7IY=;
        b=SuN0gI3WYHAX8shoQNwqeFprlVQ8IlcjG4+vVg3/k+WlhXvoKWl8Oyqp7BzSja8Ovm
         rflXUmOOO+A+Cbj3R1HjaMCxbrjQP8ZDFsfHR2jV5q3MQTS/n1V0JUV4KbPwR7GEzZZE
         mzHZd9R7IuWNDglILxglP65SjFO31Vrc0dfrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689237292; x=1691829292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyEkQpgIXNpGAjYikyKRrMbeGwRnjSnhMc5RNVKg7IY=;
        b=bUr7xp/gY8XIJoCjUTajwbypnTxd8jgLBzEQ2y1stbmg8vLBoFVMEvpsHMMNcAGKT1
         9NVPm+mxE+uRHvgq8z5LIXKz2PPlIzIDFDoOa6aJcfnTxDZ8ZtbV3WLepQgHGdhY6jR3
         XvAdhmTgpTF3T66jBbonsTAcZLah8seJimCV4aLAF0oW9LfHzsjXrdg0/i4yRedQdC5K
         K/y1DPJZavmsdqO+9v8v6mTdOYRrZN9vxySUcF1Pam6IG3swHm+0BLD6Nu1ze9J95I6K
         3LTNjBYNBt99U1kqQsFE/I1+N0FuLQHJ7wTF33mf+LOKsCeRfawzDPmuL4nIE2Hnau7y
         ntAw==
X-Gm-Message-State: ABy/qLad2dAVTLFKTgFkdDv+Jiecnoz4OMm5QeVjwDSLjBFnf/MuZAtZ
	SzQl25uQkhn5EKe33bkx95g298KQNU8Yo26IpCk=
X-Google-Smtp-Source: APBJJlFXpTGOzQMxs/lTyjduxaugTasj2zn6PzWi9o2MEEh4acta8VMMUsb7pLp9eb5zJqQTxAjFHg==
X-Received: by 2002:a92:d28c:0:b0:345:acab:98dc with SMTP id p12-20020a92d28c000000b00345acab98dcmr1064947ilp.11.1689237292722;
        Thu, 13 Jul 2023 01:34:52 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com. [209.85.166.42])
        by smtp.gmail.com with ESMTPSA id z25-20020a02ceb9000000b0042b39f1c3d2sm1784423jaq.144.2023.07.13.01.34.51
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 01:34:51 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7872d448c5aso13858639f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 01:34:51 -0700 (PDT)
X-Received: by 2002:a5e:c918:0:b0:786:f10e:a473 with SMTP id
 z24-20020a5ec918000000b00786f10ea473mr1591076iol.16.1689237291411; Thu, 13
 Jul 2023 01:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230412115250.164899-1-angelogioacchino.delregno@collabora.com> <20230412115250.164899-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230412115250.164899-5-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 13 Jul 2023 16:34:15 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
Message-ID: <CAC=S1ngkoQJKi6AozAOQY1WKvMhMrgKfA8S7MdbqmzSD5rRmdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/mediatek: mtk_dpi: Use devm_platform_get_and_ioremap_resource()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_013453_889172_EFB578FF 
X-CRM114-Status: GOOD (  14.65  )
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

Hi Angelo,

On Wed, Apr 12, 2023 at 7:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of the open-coded platform_get_resource, devm_ioremap_resource
> switch to devm_platform_get_and_ioremap_resource(), doing exactly the
> same.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index 9025111013d3..45535dc7970f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -1038,8 +1038,7 @@ static int mtk_dpi_probe(struct platform_device *pd=
ev)
>                         dev_dbg(&pdev->dev, "Cannot find pinctrl active!\=
n");
>                 }
>         }
> -       mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       dpi->regs =3D devm_ioremap_resource(dev, mem);
> +       dpi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &me=
m);

"mem" appears to be unused elsewhere, so I assume
devm_platform_ioremap_resource() would be a better fit.

Regards,
Fei

>         if (IS_ERR(dpi->regs))
>                 return dev_err_probe(dev, PTR_ERR(dpi->regs),
>                                      "Failed to ioremap mem resource\n");
> --
> 2.40.0
>
>

