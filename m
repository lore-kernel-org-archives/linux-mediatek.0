Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96223C38142
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jan 2023 01:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHtvIc5FE5l5kDBJhAg3drX6o2TKfiCgHequHzj1uoQ=; b=AGGQ96Tyw3OyYWsJKxm0P5o94z
	Fcf4vd/S9Vfb7YZkdCXnffscYHYC71gPVv9NY9FPf/88j4PXLw8CHlgQ6MoDJByepCPhMNwHHzYcA
	amWYtadyVDmu1/m1j1L0g4Hi+iAp1SO4m0+DTqs4Ck3ktfFMmCAc0xUHuOOpF90aHQkdsxIlNP3tE
	bIKcOy0pO8vtjxebRl0pU/7AhV140b5OdcAJHrXNG5ymqeRnDGOH7y/e+Xqe8EvHVfJkBzAvCF7er
	XR1MugpLt1TWP9vk3yH/EJwNppXcrZDkYhj5je4oJ1lmval8Dknf7MJLonQJBoxm+u/RaimI5/ai4
	BAqZ1O0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLwUP-000qUg-9M; Sun, 29 Jan 2023 01:28:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLwUE-000qSV-AY; Sun, 29 Jan 2023 01:28:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E06E0B80C69;
	Sun, 29 Jan 2023 01:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F5D4C4339E;
	Sun, 29 Jan 2023 01:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674955677;
	bh=mIyF7jlWADkWw9AY8oz5e0Hg7GQ/xOB3nucuRUy5HDM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ujw0AAvn3nhSz0pjY8obTtRU8u3SlS31u9V32QJI5IrFf7b8zy2BG74kDzvZWbnFI
	 Bh2ok86s6aBmi34Fysi5RwdnRQ0KMepnzh7xS9x5RXv9ns79G6n4UHBcht5JazzJL6
	 0TMGFQqeANrF5u1WdCtCtkAha6g+KnzFs3P6YAoaS9ctXUzvt/rva6oHOaRrKF5ljk
	 V/nC/iP/3jNlJg1NkRfirmgv4y+0o+0SVmGIXPeUUzclrmQlLfYf0v1a2Az1afpCbS
	 xSMg5xBaAAMf/mDQXm52WLBos3li9K2P92ZrWtg5dSG32kB4NHD2W8UTpj2IX8GG8m
	 bCuq0IXMeW+rg==
Received: by mail-lf1-f45.google.com with SMTP id br9so14108951lfb.4;
        Sat, 28 Jan 2023 17:27:57 -0800 (PST)
X-Gm-Message-State: AFqh2kpUfbH1qeuZKo1UvQk6NRectcsJUkCgwtyM6NIxuqTR0H6Jz288
	T68bxOnBDhVUS+/Lwiac6AAmePaodsOYcYmQgQ==
X-Google-Smtp-Source: AMrXdXvwYhYIje9oY6RR+/yUIKdNsbwcgB8kH63XKH4ThRsuXe9Yblb+SgpYteGwcOABD+DQnVzUyfOpuQg1MQrqk+Q=
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2aed:39be with SMTP id
 y12-20020a0565123f0c00b004b52aed39bemr5530009lfa.195.1674955675573; Sat, 28
 Jan 2023 17:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20221128-mtk-drm-v1-0-409e7f2352e4@chromium.org>
In-Reply-To: <20221128-mtk-drm-v1-0-409e7f2352e4@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 29 Jan 2023 09:27:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=87WTtsYhjMKi+t8-ffu0FTw2vokzeVBOSsGsWCznjA@mail.gmail.com>
Message-ID: <CAAOTY_9=87WTtsYhjMKi+t8-ffu0FTw2vokzeVBOSsGsWCznjA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Implement shutdown
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	David Airlie <airlied@gmail.com>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_172802_679860_825355EE 
X-CRM114-Status: GOOD (  22.36  )
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

Hi, Ricardo:

Ricardo Ribalda <ribalda@chromium.org> =E6=96=BC 2022=E5=B9=B411=E6=9C=8828=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:42=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Poweroff the device properly, otherwise the device will not come back
> from kexec().
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 91f58db5915f..51dbd85796e9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -829,6 +829,12 @@ static int mtk_drm_remove(struct platform_device *pd=
ev)
>         return 0;
>  }
>
> +static void mtk_drm_shutdown(struct platform_device *pdev)
> +{
> +       component_master_del(&pdev->dev, &mtk_drm_ops);
> +       pm_runtime_disable(&pdev->dev);
> +}

Would it be better to implement like rockchip [1]?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/rockchip/rockchip_drm_drv.c?h=3Dv6.2-rc5#n462

Regards,
Chun-Kuang.

> +
>  static int mtk_drm_sys_prepare(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> @@ -856,6 +862,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
>  static struct platform_driver mtk_drm_platform_driver =3D {
>         .probe  =3D mtk_drm_probe,
>         .remove =3D mtk_drm_remove,
> +       .shutdown =3D mtk_drm_shutdown,
>         .driver =3D {
>                 .name   =3D "mediatek-drm",
>                 .pm     =3D &mtk_drm_pm_ops,
>
> ---
> base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
> change-id: 20221128-mtk-drm-ca6c5ac6b389
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>

