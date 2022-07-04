Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLHDvwxSL0MxiarCghH6aFWwN83AHjX1ErBV85VRL/c=; b=0aeoOYwdclE9qKlbhCAG1BKwtt
	oHhyKs28F/ob6HTQGeVE1ilFEKaHJJTDmDwdz7outs1A9C/K/yjcdSmUYTi9EUEQHIMFThR7U16QC
	xZ8RW7m/Ol3vtaNn53Wfw6RSofPAcsDyo2gHqeSGiyQkfk3Vk5dcHCef5Amr5Mt4W2CaNTZa+U6Bv
	rs43ldJ2z+vKDBbDc2W5ragWTLixICK9ylWleWyl21+pguQU2drigLWll8JKa/rcJBVz2J9/+/m+v
	2QfEioNatUE2aP1RGL2P0WC3gr1HrOKk1CNgc1Ut3ALkHQy3HUX/UWMbyGdRu0XvymSPqmFDnuP1S
	9fltchow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8MUY-009JX2-1y; Mon, 04 Jul 2022 13:51:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8MUL-009JM3-Mg; Mon, 04 Jul 2022 13:51:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0D5BBB81017;
	Mon,  4 Jul 2022 13:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE62DC341CD;
	Mon,  4 Jul 2022 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656942699;
	bh=hAfuMRpk9TdhPZKHaCc+WuV8OqufS7bLGsHXotM88Ho=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jxq9RUGXnffQs7/NqBRif/E6Maxq+B+XEABUVLFoONhdTRJeiTn9q99B4qRUQbW/6
	 S6su4yTThCr+kM3+DjkYD/7RbOyE2vWp6tGTi0lHWF4dTvYyUTe/O8hA3qsFDfCcYl
	 H+4iC778OmdLvCYid6PETCJ9D9ia2f5CLaW+Xrq/KAZu11MiOGcwOJtr8pBhXu1xls
	 jZ0eWPyIqFgDfzIBf57zbOGqicaKXAkVTvo0OuH8yHIJnK4pXoPLjiu0Wt9IzQhoZI
	 cAz+FrN6WVLMgoZj76qfUB17Ld5rYZP1fR4Hq8hzPi2KZnDGl2eJJj9LfBfVYWOF5i
	 wPAIgNdUo0VvA==
Received: by mail-wr1-f52.google.com with SMTP id d16so7278006wrv.10;
        Mon, 04 Jul 2022 06:51:39 -0700 (PDT)
X-Gm-Message-State: AJIora8Wy7/gY7MLgL9DiMyY1xr4DOnr+SbUGEqMx8usvxx7UFWFzX+Y
	enjf2ptWtyTOsiorl8Z8GWGS1lpzHy4IS3fIrw==
X-Google-Smtp-Source: AGRyM1uKp2lrpW6u+5cY6RUsSDjtF0VW1MATP4aMMyHLV7iUskweguBh2vAeN6OdOJ6Qu9KV7S3kduEtUTEV6H8/NnE=
X-Received: by 2002:a5d:6c62:0:b0:21d:2235:d800 with SMTP id
 r2-20020a5d6c62000000b0021d2235d800mr27450391wrz.381.1656942697923; Mon, 04
 Jul 2022 06:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220629190545.478113-1-hsinyi@chromium.org>
In-Reply-To: <20220629190545.478113-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 4 Jul 2022 21:51:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__F2Ms6tfYgU=5wXS==0qVivo6OT=8txq9yA3XQLfqh-A@mail.gmail.com>
Message-ID: <CAAOTY__F2Ms6tfYgU=5wXS==0qVivo6OT=8txq9yA3XQLfqh-A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: ensure bridge disable happends before suspend
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_065146_064340_E016D3B1 
X-CRM114-Status: GOOD (  21.00  )
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

Hi, Hsin-yi:

Hsin-Yi Wang <hsinyi@chromium.org> =E6=96=BC 2022=E5=B9=B46=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E5=87=8C=E6=99=A83:06=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Make sure bridge_disable will be called before suspend by calling
> drm_mode_config_helper_suspend() in .prepare callback.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> The issue is found if suspend is called via VT2 in several MTK SoC (eg.
> MT8173, MT8183, MT8186) chromebook boards with eDP bridge:
> bridge disable is called through mtk-drm's suspend, and it needs to be
> called before bridge pm runtime suspend.
> So we move the hook to .prepare() and .complete().
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 13a1bbe7ead7f..a42812e490007 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -828,8 +828,7 @@ static int mtk_drm_remove(struct platform_device *pde=
v)
>         return 0;
>  }
>
> -#ifdef CONFIG_PM_SLEEP
> -static int mtk_drm_sys_suspend(struct device *dev)
> +static int mtk_drm_sys_prepare(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
>         struct drm_device *drm =3D private->drm;
> @@ -840,20 +839,21 @@ static int mtk_drm_sys_suspend(struct device *dev)
>         return ret;
>  }
>
> -static int mtk_drm_sys_resume(struct device *dev)
> +static void mtk_drm_sys_complete(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
>         struct drm_device *drm =3D private->drm;
>         int ret;
>
>         ret =3D drm_mode_config_helper_resume(drm);
> -
> -       return ret;
> +       if (ret)
> +               dev_err(dev, "Failed to resume\n");
>  }
> -#endif
>
> -static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
> -                        mtk_drm_sys_resume);
> +static const struct dev_pm_ops mtk_drm_pm_ops =3D {
> +       .prepare =3D mtk_drm_sys_prepare,
> +       .complete =3D mtk_drm_sys_complete,
> +};
>
>  static struct platform_driver mtk_drm_platform_driver =3D {
>         .probe  =3D mtk_drm_probe,
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>

