Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238FDECAAA3
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 23:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReQy7i48rPmBEDiAIISgilqXl4TFvLvj+B3GTOq8ba0=; b=D4pSDbiIbaJL4Ezydb9AwPBnSL
	RxH1PCkkr4JrKKZwWdmvklufaACnEVObGwXuB5ybtmduf6rJ5zH1j6SkUoF+ovb+QzFO7sAk4tJYQ
	8cYt5Td4KjtuGEn1wbYcp3ovPIkCrDNy2MRjvBpQ3cogvAlTD45CbCiHCTvcLjry4R01/dmKmZnxP
	YCdYjdggSsuEq4Kp7r0uvD9PorBI+oSy/U3uiciTWtWOQ6WyL7Y4Ku1LpuhLCpB6F3Le+/dcpCGKv
	7MZc/POlBckU36H9JsZ0lx3IRh8ZLM2PTmez18eRc9+xyD1f2g+WyLW4QVYZ/hXRrDdx3cMqqMxsn
	fggCzc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMRR-004Db7-7q; Thu, 25 Aug 2022 23:39:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRMRG-004DYA-25; Thu, 25 Aug 2022 23:39:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 125CA61D7A;
	Thu, 25 Aug 2022 23:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689EBC4347C;
	Thu, 25 Aug 2022 23:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661470744;
	bh=VUu5XtDzSApD4jLb7/Kt0DoXKUHclEkJ4teSyXFURGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rD8xvt2pteiCf7B0fVx16f3admXr98oUj03A6jJl33zd/hBrlyoBzEuf62ecPkzn1
	 d0O2JYJRpVthX+cP8GQX4aDEhfPUPAGLYEqnMtUJQhX0X1ATcMMIbHcrG4u2ifqSd9
	 AS2QUhvdNqdXaPwM/0ymaqSZjsCFX12KFHxcqPACKrSID0C98MAfl3L9Bcz8zRtMg+
	 oOqcgpK7sC1h1V331+rE2xU0iTl1/hkYCD1QXXbYdkFujycqruC9LZuXmEvX4+ij20
	 KAMSIQN2C19FDrJAHSwg9naMe0mux8v59pzsDyN6moWW9VoigbqT7oAsMdB/Y4YD8u
	 NjkGnIHGUCdQw==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-11d2dcc31dbso108900fac.7;
        Thu, 25 Aug 2022 16:39:04 -0700 (PDT)
X-Gm-Message-State: ACgBeo1oAy8AVihrvM+aosBMbJFyFwguwLGa+CN7HuFDK+9pTUtHz5k+
	ktCvJKZ8LFrfcVbAIZiyX2r83j4vPcuyW26sxQ==
X-Google-Smtp-Source: AA6agR4yMz40Tc+owCwkA0C1natVNZY/C/63StQqXp7qxYkhIoBcWs+BRlYcrECKpE6WFMhpawFp3BSWiY7+jb/YoyY=
X-Received: by 2002:a05:6870:4690:b0:11c:d599:4f41 with SMTP id
 a16-20020a056870469000b0011cd5994f41mr634922oap.69.1661470743518; Thu, 25 Aug
 2022 16:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 26 Aug 2022 07:38:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-oP0QOpk0Zo_VGrdBoUgn78PhXeYUr-WPvpVcAHx+rEg@mail.gmail.com>
Message-ID: <CAAOTY_-oP0QOpk0Zo_VGrdBoUgn78PhXeYUr-WPvpVcAHx+rEg@mail.gmail.com>
Subject: Re: [PATCH linux-next v2] drm/mediatek: Remove the unneeded result
To: cgel.zte@gmail.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, ye xingchen <ye.xingchen@zte.com.cn>, 
	Zeal Robot <zealci@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_163906_212326_D6B82BB3 
X-CRM114-Status: GOOD (  16.56  )
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

Hi, cgel:

<cgel.zte@gmail.com> =E6=96=BC 2022=E5=B9=B48=E6=9C=8825=E6=97=A5 =E9=80=B1=
=E5=9B=9B =E4=B8=8B=E5=8D=883:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value drm_mode_config_helper_suspend() directly instead of
>  storing it in another redundant variable.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
> v1 -> v2
> Add all the mailinglists that get_maintainers.pl give.
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5f02f8d0e4fc..91f58db5915f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -833,11 +833,8 @@ static int mtk_drm_sys_prepare(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
>         struct drm_device *drm =3D private->drm;
> -       int ret;
> -
> -       ret =3D drm_mode_config_helper_suspend(drm);
>
> -       return ret;
> +       return drm_mode_config_helper_suspend(drm);
>  }
>
>  static void mtk_drm_sys_complete(struct device *dev)
> --
> 2.25.1

