Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86731C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Nov 2022 23:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Udd6WTp2umwAPYXfvMRhpES8InMqdWaZEzJ9lzfHkEw=; b=D9cYm6PzgAP6BGz+hfmVdFdXiI
	FmcPg8AmE21uEdLmzmtlqOx3me5h8+zKUnToTl2rnuWUXiNHp5i9VNfyRKqyAi6jFDzafu3qpm4jz
	YtqeHd6ga7w+fF71MSoZn+wdVlBKDjqOIyMLOqa4+qgk0C6pOdu3BW/T08Iq/o2wz+6ySGLdpK77b
	x/4Pc1Zhj/bmibnGWzzW7i6w5SagqSu9CvplvvJ3wsjWllfQZR1p/dpmQ+S2+11Ie2z3YgQwrdDqM
	esZOhbqB9wBfraJK1t7qt8myrQiRo7Z3e7vVD/tD80oxx6pE0aBlB15jKN+CPayi0+8qh+apRzXw2
	u8RidSqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouMd0-00Etet-9p; Sun, 13 Nov 2022 23:43:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouMcw-00Etde-U2
	for linux-mediatek@lists.infradead.org; Sun, 13 Nov 2022 23:43:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5ED80B80C9D
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Nov 2022 23:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8112FC43144
	for <linux-mediatek@lists.infradead.org>; Sun, 13 Nov 2022 23:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668382979;
	bh=YhBmoJClwwLaG6pFbcXCvtNj02bEMXAJKc5YoyE2/Jc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HxCqNJWzpYW1U+TSAAQAX+WeVsEjCgsDGJdviA3dQ7LpSjrAIzBy5rzGRjUk7Dw0M
	 Va40tirMy4+1T5yBgECF5+g4FIEY5F/FTmhpPdB34IQAeP0t8WLjfNX8CJpl9tBO1C
	 fijT/pOL/34tI7KVgtHiykEMFio65Z71Hx88JRClkKDtRLUtydSaPzYPrMiLwdsPl0
	 y6VsEwsKg56PqHTFQ+cTwmRs6TAgWYjFNAhRMTmRpwgXjSu4HKta1XT31RxIoqEOum
	 nqmxiEl3BdeagjFxLAH4IIx8jwJ2hw/bCOfGpOGHubZafbRXYLyShxu146WaF7utal
	 vGmqFG3g+cgug==
Received: by mail-ot1-f43.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso5801800ota.12
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Nov 2022 15:42:59 -0800 (PST)
X-Gm-Message-State: ANoB5pl5IrW7jnm+mQ6QUoo4fjU8QwdbS0Tui7iecs5UEqLE4pQPxCGf
	+l3Rm0/Zl6BljE+aAwFqUV9zBuKV1L17bc6E3Q==
X-Google-Smtp-Source: AA0mqf4dw9k7/aX3sr0Epp+vMlFAUJPtXt/UgGNulv9B+nEzFDMr/G+7MbLXsPPm/jw0m3bmJ3ETUacg8e5jpvNkA3w=
X-Received: by 2002:a9d:4b02:0:b0:661:b04c:41d9 with SMTP id
 q2-20020a9d4b02000000b00661b04c41d9mr5389182otf.92.1668382978648; Sun, 13 Nov
 2022 15:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20221110184852.1848917-1-gildekel@chromium.org>
In-Reply-To: <20221110184852.1848917-1-gildekel@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 14 Nov 2022 07:42:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY__b1uOkX9Tb--tq7YwjgZHftNxUUMZe1op6HiKjb2qXWg@mail.gmail.com>
Message-ID: <CAAOTY__b1uOkX9Tb--tq7YwjgZHftNxUUMZe1op6HiKjb2qXWg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: make eDP panel as the first connected connector
To: Gil Dekel <gildekel@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com, 
	daniel@ffwll.ch, daniel@fooishbar.org, seanpaul@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_154303_281747_A7DFDBE1 
X-CRM114-Status: GOOD (  21.37  )
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

Hi Gil:

Gil Dekel <gildekel@chromium.org> =E6=96=BC 2022=E5=B9=B411=E6=9C=8811=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> [Why]
> Some userspaces assume that the first connected connector is the "main"
> display, which supposed to display, for example, the login screen.
> For laptops, this should be the internal connector.
>
> [How]
> This patch calls drm_helper_move_panel_connectors_to_head() right before
> crtc creation to ensure internal connectors are at the top of the
> connector list.
>
> Tested by ensuring the internal panels are at the top of the connector
> list via modetest -c.
>
> This patch does to mediatek what the following patch
> https://www.spinics.net/lists/stable/msg590605.html
> did for qualcomm.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> Tested-by: Gil Dekel <gildekel@chromium.org>
> ---
> v2: Fix copy-paste errors in commit message so it's relevant for this
>     patch and the mediatek driver.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 91f58db5915f..76daaf6a0945 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         if (ret)
>                 goto put_mutex_dev;
>
> +       /*
> +        * Ensure internal panels are at the top of the connector list be=
fore
> +        * crtc creation.
> +        */
> +       drm_helper_move_panel_connectors_to_head(drm);
> +
>         /*
>          * We currently support two fixed data streams, each optional,
>          * and each statically assigned to a crtc:
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

