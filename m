Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E12C47088
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE/q8OTGX/vukPXHLJF5f0ZobL7IbidYs5xkC1/4Glo=; b=BDy8HBCzZctVqYcKyWBoQ7PUNt
	546Y9jreIuFRdjXCC3JforamLdOKQXsTE9ooHSq34OK9gMbBbgf77wi3vTaCoTssujeDeE9EThJaR
	5xpeaShQFRXqVJycyFchyqgM7kWl0kKYiclGmtJWUUDMOljay5k9WKG5xWNyQevDpRK1yCrJxh75m
	hMJs0EbKGXH7K32ql0gnMCL8vb/MHE6EAO0y2DVs5wxs8jWR5t+BMimPstDsr8YrkA8d4lB19aavD
	/pABbJf/jq2SfgIdP0af7Uea5VKH32XuYkNlGy6Koo8ZaQhW19pDmLvOCoxM0KiiZiCBCOQNgfBAF
	oJBu7fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0i0F-0078m1-Ow; Thu, 01 Dec 2022 11:45:19 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0i03-0078gi-OB
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 11:45:09 +0000
Received: by mail-vs1-xe34.google.com with SMTP id 125so1276613vsi.9
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 03:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE/q8OTGX/vukPXHLJF5f0ZobL7IbidYs5xkC1/4Glo=;
        b=EzvNjsK/64biWBOqAzlM7ZmFo/qswGF8E2psYeSj0xdD6287yOJeqmtxtWiDCeeRne
         HLae+HG1stNZu59moUdMxeVYOQDp9sfWFNA6V3VypSXCAVupelhw74Ch1etHO5XDWI0m
         ybBlh0c2Z/irb2/MSL4MDBPlinBeHrffEoJ60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE/q8OTGX/vukPXHLJF5f0ZobL7IbidYs5xkC1/4Glo=;
        b=j9zuqOJfb5vAFp09Wtl3S9QjvyZM/KqvMucAiUwdKCHJFVGvtOc+5x0s4WhkSqSwgg
         gZqHANCltjwenhkaCD3SJDlFLWVONM8L46enBNJJ6ISp5gxEacJgcTfk7pDKXdh/lBVN
         oNu9/PPMCGLiapMPWClXZVkZRdhmKkv/0uY+IbY8F7YCgUU5tsdd6uBO/gunHzx3Y2gE
         oMGw8jEbLaAsbV5Ig5JsMwkeqjEXPljyWo3tjd5vEszjbVHE3Is1N9lAW0lPX0eBVPnH
         1wyeUCyTk9Y8V+zLR/XqhNfk8f7OFCAuwIPsNze96Gs4IkQ1k5PB2KLTck2nH8Js6Oh8
         csng==
X-Gm-Message-State: ANoB5pkP37jY7t7tjh1oWEOxi7E6YKys0pNMZwrrKIAOD5sQ2XKgxRwL
	gYIk6bsQnrGdrRlZXvajVPODtuIkjd6lR801FIGA5A==
X-Google-Smtp-Source: AA0mqf4u5I2OZaSiq21veOJJ1DavEQccozE6Z/lEVW/v7HrTmm4H19hg9RZ5yAmVKH9lnRtk1UUPSAMKL03w0XsTCgg=
X-Received: by 2002:a67:c98e:0:b0:3ad:3d65:22b with SMTP id
 y14-20020a67c98e000000b003ad3d65022bmr28646035vsk.65.1669895106580; Thu, 01
 Dec 2022 03:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20221107072243.15748-1-nancy.lin@mediatek.com> <20221107072243.15748-6-nancy.lin@mediatek.com>
In-Reply-To: <20221107072243.15748-6-nancy.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 19:44:55 +0800
Message-ID: <CAGXv+5Hj-H6Q3N+j2tEntd9M=9p0o7TxWYn_4aawhqFUbX7+PQ@mail.gmail.com>
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net, 
	nfraprado@collabora.com, devicetree@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_034507_828333_4325169E 
X-CRM114-Status: GOOD (  15.27  )
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

On Mon, Nov 7, 2022 at 3:23 PM Nancy.Lin <nancy.lin@mediatek.com> wrote:
>
> Simplify code for update  mmsys reg.
>
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
>  1 file changed, 16 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-=
mmsys.c
> index 9a327eb5d9d7..73c8bd27e6ae 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c

[...]

> @@ -124,27 +129,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  {
>         struct mtk_mmsys *mmsys =3D dev_get_drvdata(dev);
>         const struct mtk_mmsys_routes *routes =3D mmsys->data->routes;
> -       u32 reg;
>         int i;
>
>         for (i =3D 0; i < mmsys->data->num_routes; i++)
> -               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp) {
> -                       reg =3D readl_relaxed(mmsys->regs + routes[i].add=
r);
> -                       reg &=3D ~routes[i].mask;
> -                       writel_relaxed(reg, mmsys->regs + routes[i].addr)=
;
> -               }
> +               if (cur =3D=3D routes[i].from_comp && next =3D=3D routes[=
i].to_comp)
> +                       mtk_mmsys_update_bits(mmsys, routes[i].addr, rout=
es[i].mask, 0);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>
> -static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u=
32 mask, u32 val)
> -{
> -       u32 tmp;
> -
> -       tmp =3D readl_relaxed(mmsys->regs + offset);
> -       tmp =3D (tmp & ~mask) | val;
> -       writel_relaxed(tmp, mmsys->regs + offset);
> -}
> -
>  void mtk_mmsys_ddp_dpi_fmt_config(struct device *dev, u32 val)
>  {
>         if (val)

This hunk now doesn't apply due to

    soc: mediatek: Add all settings to mtk_mmsys_ddp_dpi_fmt_config func

touching mtk_mmsys_ddp_dpi_fmt_config() as well. It's trivial to resolve
though.

ChenYu

