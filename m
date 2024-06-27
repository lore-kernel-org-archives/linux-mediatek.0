Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A826BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MN72FiSm1l877kcDA+FSwFlukw5OFpZ5dI2/3fbGW4=; b=4YqP0hiPnKAGbR
	HaBW9epI7TElWzl2GEgGtqVuaW1y2cNrHAMF9wfBCm65Vc7awTFpIpyuW9ugPmIR0HjUNWxj9MbnE
	+5tZAuL7Ft+8kCsNe7e+rHbpn/JDD4XWYXLl8pk+pToFoctLnD15HqcFp/+N+D4h9rQlR2L8JMVFG
	pFeP7pssUBUjH22zYEsOEO/o0g7yUorBfW3gFW7l6D+USv9iUkn0vdEGaWAaomHFPeCqrcqcf0bBf
	TmBCgU/cqwSAY5Erc2oVC225A2cTsCd54zgfJ39oTsvnxcc4Bvm/fPG9nTaV+ku14rkzX6dqGMDJI
	v4su2W3xJsOYtUvYq1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpi4-0000000AYil-2Z79;
	Thu, 27 Jun 2024 14:02:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMphk-0000000AYcn-49hL;
	Thu, 27 Jun 2024 14:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5FDCCCE2C2A;
	Thu, 27 Jun 2024 14:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42067C2BBFC;
	Thu, 27 Jun 2024 14:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719496942;
	bh=haqyinA5O0jrPvPaCY+hTYShEe3D4xzEGz+XqJKudOE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tDsWygWPG1UvEl1yw4KL3p/fKQSq64X/uqzYplsAs9Esq0Mw45Dzza291RqO0N/85
	 GWM6bXdxmjIAoW9nbMVNTJE3+wXTInsHSNsW8su78Tvf1mc1g6wn1Wk6iDDZPJXNVa
	 3i4MHufhu/EpzNi2b6LeOL16/6Mgb3FP5fDCFXKLO8Z2bbPJGiBAe9qSMDqNRuZfHK
	 7i9K3Ha1627W+KrPkqq+PEN+G3vFNHp5rwKLbsL83myrFcYO3l76cF79/Iad4lUva7
	 AHc9Rh559yc09gfr7JEV/jjaqebG2kIBLArT/bQDxpzGfLcsUkn+1YgPji9isbIjon
	 LXh4xJKnrbaqw==
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-71910dfb8c0so3667273a12.3;
        Thu, 27 Jun 2024 07:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGIMc2vPb4ODZEet6EG3fOb7dKNzNoN4pv6fb+Xrfx8CVa6A4fTWITbRwbWnh6wQ1cwpV+z3YHc65zCzbz3u8PmRtNfWWUQGOVW/xCG7NWE3V+0QXcwxzkxI3p59fp7sLPVeBfsTbQ6WZcBjyuIhuQ4sEf4XkJgbg=
X-Gm-Message-State: AOJu0Yynlznbw6PfOvHAtRbkfibTKLtl1UHp1YDWCXraLflwfL+1HEKQ
	NFeNDT52zRyqTtWH/HrNQjYhWiOJeQVzyav4mIlvrdn/a3wMHCresYeeESyQ0XjVbfI/bpiQasT
	2rA0hHYbalslw6wUA79c7Ha2caw==
X-Google-Smtp-Source: AGHT+IEjPuF+8KUmWpQykLG9Tjg3oIhhxWtBXJcsgAy4abavUazUPTIucmfl5lTNX0+gcaeiTabgHFx4AqJjfR1buSs=
X-Received: by 2002:a17:90b:1d12:b0:2c8:1e54:4d39 with SMTP id
 98e67ed59e1d1-2c8582dbfa4mr11861140a91.48.1719496941350; Thu, 27 Jun 2024
 07:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
In-Reply-To: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Jun 2024 22:02:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8pSGOhuRt=swb7o8zm6swnuXqyzPeASRppGCfi032xbQ@mail.gmail.com>
Message-ID: <CAAOTY_8pSGOhuRt=swb7o8zm6swnuXqyzPeASRppGCfi032xbQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_070237_587404_78F1BA9F 
X-CRM114-Status: GOOD (  31.78  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Douglas

Douglas Anderson <dianders@chromium.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=881=
2=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=881:28=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> This driver users the component model and shutdown happens in the base
> driver. The "drvdata" for this driver will always be valid if
> shutdown() is called and as of commit 2a073968289d
> ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
> noop") we don't need to confirm that "drm" is non-NULL.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> v1 of this patch was part of a series [1]. It got tested and reviewed
> but never landed. Reposting separately in the hopes that Mediatek DRM
> folks will land it. If, instead, Mediatek DRM folks want to Ack it I'm
> happy to land through drm-misc.
>
> I noticed that this was missing when I failed to add "mediatek" to my
> patch series IDing which DRM modeset drivers did this properly [2].
> Assuming my patch lands, that means that Mediatek devices will start
> getting more warnings printed.
>
> [1] https://lore.kernel.org/r/20230901164111.RFT.5.I2b014f90afc4729b6ecc7=
b5ddd1f6dedcea4625b@changeid
> [2] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b2=
9f746b93621749c@changeid
>
> Changes in v2:
> - Removed NULL check since it's not needed since 6.7
> - Rebased on ToT.
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index b5f605751b0a..de811e2265da 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -952,6 +952,13 @@ static void mtk_drm_remove(struct platform_device *p=
dev)
>                 of_node_put(private->comp_node[i]);
>  }
>
> +static void mtk_drm_shutdown(struct platform_device *pdev)
> +{
> +       struct mtk_drm_private *private =3D platform_get_drvdata(pdev);
> +
> +       drm_atomic_helper_shutdown(private->drm);
> +}
> +
>  static int mtk_drm_sys_prepare(struct device *dev)
>  {
>         struct mtk_drm_private *private =3D dev_get_drvdata(dev);
> @@ -983,6 +990,7 @@ static const struct dev_pm_ops mtk_drm_pm_ops =3D {
>  static struct platform_driver mtk_drm_platform_driver =3D {
>         .probe  =3D mtk_drm_probe,
>         .remove_new =3D mtk_drm_remove,
> +       .shutdown =3D mtk_drm_shutdown,
>         .driver =3D {
>                 .name   =3D "mediatek-drm",
>                 .pm     =3D &mtk_drm_pm_ops,
> --
> 2.45.2.505.gda0bf45e8d-goog
>

