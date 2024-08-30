Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC05CCA0EE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjDU8SQTmKK/G7tRsKNeXWmyDKNqd21oMmlCsoUCz3w=; b=2ETnHgepumdu+fUpYnhQ8nv1n6
	xR9mWeivd3u/5eV+yoAvXiczhG1FIeE6GyVuitcUVVhzQptLik1HdcDHBtebbHAtYBdjgVXTIl5CN
	9343Q0bjZCrLcRBCooXONn3B6zmaeO0zOxYQLyzFzM3xS+CI2SK3ZDQ6ULjTbzfum0Wks4PZKWznA
	qUasxpfBJKDwQ6oJ/JKpfKl//w/8T1fDNBJcKDQD6Ys3mAW5T4PhpTYv/jvS14kVlRPTDdVPXHf4o
	+qeeThjj9kV9+XlJ5n1yXmWJtc4llzThLdil0xhUsgmGzANmCZxrcrUsLvDSxpY+78gHGexr3rglE
	zLoXbbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw9n-000000059IK-1YHo;
	Fri, 30 Aug 2024 07:34:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjw93-0000000598e-466Y
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:34:11 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5334c018913so1350215e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 00:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725003248; x=1725608048; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjDU8SQTmKK/G7tRsKNeXWmyDKNqd21oMmlCsoUCz3w=;
        b=al1wYLCHCfyqt9Wqpo0TZ5IxXyBPDna8dZj54arW7pllxu+isF0GrOSSHOFhAqGyQD
         Kbj+NFrNRk4wWxk+gQ/L9D9YT3t2pDpI8L6sVRHJjbpIMKcifal5ODZDtCwVCCgedqiX
         ZsvyfuRbilmLYoYfHoOvwM4Il05a+HJSb9/uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725003248; x=1725608048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjDU8SQTmKK/G7tRsKNeXWmyDKNqd21oMmlCsoUCz3w=;
        b=tNltIaH/uboUpylif8Q0ELVuEjZQijZs+ktRMA/efAVOljug+ZRtW4or5E2bzsI2QI
         pv32xf9ssEiFfwXt/rBhkizpRNK1NJFMlGHIqcmqZYAEEFlzJbgMTa3MHGu0jOUYpyE0
         c5mzk2xtPoeSOaKwuNJ8vi0cNzTJ+C6sGiMZ5ucMM84h4S0hiyPgU0sF0wY8OL99NUG3
         UqEDlsCH3+xWJnCcvy1hA9Xy5/HSrkmh9O5Ob+HIr+/36nB3GGcLFzLauFINDr7wN5Vq
         lyz95c4sCDuTwwpF7MNhqYd0rPBBylAE5Oc3mOrjOd2UlHvltr/0VnwtXNscTK1nzR6z
         w6HA==
X-Forwarded-Encrypted: i=1; AJvYcCWM/+nPhWzusKGOzLb0Yj7bH8yy7PzQUpIB9rtUgCQ9PnZhl5l7qQzam+xeK9PLcQdJUbuWeRzynFDWQt+kCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo0skVtOuBSAHhRAszyLJWMXpbv99zKRSLqw8u1ZcamkbirWRh
	t+VO3IajyFS2uLgT6h+aWsVtSOGBC1+OceF6hW/KH13vOB03AdU3bauHZTORZ1AwBihBwh8YXuJ
	a4ErE0lx1q09O7pB03XtCh8Tmv1VRHzwSNQFc
X-Google-Smtp-Source: AGHT+IH7wPgJ8Pq7AE8R2q3EPuMVp2JyMekh2CKFeRsvF5v6qHF2reC1sUgRVhEZPF19o77fSOnVpNkjJfV9Xd2yI9Q=
X-Received: by 2002:a05:6512:3c85:b0:52e:9a91:bba3 with SMTP id
 2adb3069b0e04-53546b0ba84mr856388e87.15.1725003247536; Fri, 30 Aug 2024
 00:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240830072611.332886-1-yanzhen@vivo.com>
In-Reply-To: <20240830072611.332886-1-yanzhen@vivo.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Aug 2024 16:33:56 +0900
Message-ID: <CAGXv+5HtbAUvC0v5bnJrxD50Tfmb+i1h956-aJkbi+i_BWXcBg@mail.gmail.com>
Subject: Re: [PATCH v1] soc: mediatek: Simplify with dev_err_probe()
To: Yan Zhen <yanzhen@vivo.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_003410_100499_69A4CE44 
X-CRM114-Status: GOOD (  20.54  )
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

On Fri, Aug 30, 2024 at 4:28=E2=80=AFPM Yan Zhen <yanzhen@vivo.com> wrote:
>
> Using dev_err_probe() to simplify the error path and unify a
> message template.
>
> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
>
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
>
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 938240714e54..2f2aefd4d830 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -399,8 +399,7 @@ static int mtk_mmsys_probe(struct platform_device *pd=
ev)
>         mmsys->regs =3D devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(mmsys->regs)) {
>                 ret =3D PTR_ERR(mmsys->regs);
> -               dev_err(dev, "Failed to ioremap mmsys registers: %d\n", r=
et);
> -               return ret;
> +               return dev_err_probe(dev, ret, "Failed to ioremap mmsys r=
egisters");

Nit: I would just get rid of `ret` here.

>         }
>
>         mmsys->data =3D of_device_get_match_data(&pdev->dev);
> @@ -413,10 +412,9 @@ static int mtk_mmsys_probe(struct platform_device *p=
dev)
>                 mmsys->rcdev.ops =3D &mtk_mmsys_reset_ops;
>                 mmsys->rcdev.of_node =3D pdev->dev.of_node;
>                 ret =3D devm_reset_controller_register(&pdev->dev, &mmsys=
->rcdev);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Couldn't register mmsys rese=
t controller: %d\n", ret);
> -                       return ret;
> -               }
> +               if (ret)
> +                       return dev_err_probe(&pdev->dev, ret,
> +                                               "Couldn't register mmsys =
reset controller");
>         }
>
>         /* CMDQ is optional */
> --
> 2.34.1
>
>

