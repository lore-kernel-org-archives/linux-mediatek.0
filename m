Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F10C6FA86
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 04:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+joaMY7hqrcCPOaz1s4O/2dULBa1V2QHlCVuiQ9Hdm4=; b=h/2E5BhZpwsb82p4EB7oRyfk/Y
	rpdLUVY3s2EHfJ4fzPVAkNpPfT1k1sEsckv5toSVs5VgIQ1nMBJd2qdfcE11lVoARIZbjUpv9AxLB
	EDFtbrZuFQesBRWNW4h707cMldugYAkfhTmbqhX2pgJtOG1lBLf8/kDXE3QWgxVej2MoVBmRhKq7J
	m6ezwaeqPsEgHOsr+oRX3iYGx/uRKx2/lHyEu4ei6WoCHdo4U/OW9K7AgTN0yZgbfOTvccV9UmnLw
	fpKTnNmcrhO5Ehn3OotrTwE0m3KWFg2jhrjpKJiJ5uCPDJZEjz/b72VGIgotFaAP355XYN94ZtX0J
	9mOIBZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZlz7-00CEiP-UA; Sun, 18 Sep 2022 04:32:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZlyw-00CEdR-Ts; Sun, 18 Sep 2022 04:32:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7768360B45;
	Sun, 18 Sep 2022 04:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490D0C43141;
	Sun, 18 Sep 2022 04:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663475554;
	bh=eM/QQQyukAm+XDVeiBT7gGoM5l7VFfdhk5Bm7ROWEdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SZKRRMjt8D0ds+0o4jQfDeDLuNMEVbYhWGfQduOMBba6Tyxen36J+XRRDS1jQCUsG
	 oyk6AEwWBlh875ulYgRpDVgmWBjMj47DMPA2g9VCdVunWKNdQJ+/KfBfukrMr/E2Vj
	 WiG2AMp4e+QUeQUPRWx2V4av/Okw4Ya39Rx4nOgecASpDa+SPKtPOg/bWjth7cZpqG
	 7P7A8rkjm364pE8xNYwFjIUkuUJCV030DV2Pmi/2sUk2x9IgvQH6W+JBYeSirrUrMx
	 1wDIwVRBC5VhI9qzTojR9srZq5gzs/4hJR4iR0gSaJA6zpVXiuF/8PBFdxTKhqU6YH
	 3gyxqSI1hkyZQ==
Received: by mail-ot1-f48.google.com with SMTP id ck2-20020a056830648200b0065603aef276so12241137otb.12;
        Sat, 17 Sep 2022 21:32:34 -0700 (PDT)
X-Gm-Message-State: ACrzQf2mvhCDNlX5pgSsE2xpBIO7xFWorUOjSJtvdSj8r9X1vZju3dfg
	HPSanoST6APLYiTLGySxSsHrhXu4acUn4LL3lQ==
X-Google-Smtp-Source: AMsMyM5lCD6u07Sps3gffTwk531S2XxDTgJmBJz+g7D+eRtOqwZIMdUqFL+Yn4Cdx4x2A+ifxluvekYLL60ONhN94q4=
X-Received: by 2002:a05:6830:6999:b0:61d:26f8:94c1 with SMTP id
 cy25-20020a056830699900b0061d26f894c1mr5511290otb.278.1663475553315; Sat, 17
 Sep 2022 21:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220914140031.18578-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220914140031.18578-1-allen-kh.cheng@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 12:32:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_92F5WgCedZOvg_qtkHLorTCXiWtuGgoJ=9gRryYHi7TQ@mail.gmail.com>
Message-ID: <CAAOTY_92F5WgCedZOvg_qtkHLorTCXiWtuGgoJ=9gRryYHi7TQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: mediatek: Fix display vblank timeout when disable dsi
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_213239_063918_984880E2 
X-CRM114-Status: GOOD (  20.07  )
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

Hi, Allen:

Allen-KH Cheng <allen-kh.cheng@mediatek.com> =E6=96=BC 2022=E5=B9=B49=E6=9C=
=8814=E6=97=A5 =E9=80=B1=E4=B8=89 =E6=99=9A=E4=B8=8A10:00=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> Dsi is turned off at bridge.disable, causing crtc to wait for vblank
> timeout. It is necessary to add count protection to turn off dsi and
> turn off at post_disable.

If turn off dsi in post_disable(), you should turn on dsi in pre_enable().

There is another patch fix this problem [1], do you have any comment
on that patch?

[1] http://lists.infradead.org/pipermail/linux-mediatek/2022-August/046713.=
html

Regards,
Chun-Kuang.

>
> Fixes: cde7e2e35c28 ("drm/mediatek: Separate poweron/poweroff from enable=
/disable and define new funcs")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
> Change in v1:
>   * Rebase to kernel/git/chunkuang.hu/linux.git, mediatek-drm-fixes
>     [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 5b624e0f5b0a..e30f4244c001 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -768,14 +768,6 @@ static void mtk_dsi_bridge_mode_set(struct drm_bridg=
e *bridge,
>         drm_display_mode_to_videomode(adjusted, &dsi->vm);
>  }
>
> -static void mtk_dsi_bridge_atomic_disable(struct drm_bridge *bridge,
> -                                         struct drm_bridge_state *old_br=
idge_state)
> -{
> -       struct mtk_dsi *dsi =3D bridge_to_dsi(bridge);
> -
> -       mtk_output_dsi_disable(dsi);
> -}
> -
>  static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>                                          struct drm_bridge_state *old_bri=
dge_state)
>  {
> @@ -803,13 +795,15 @@ static void mtk_dsi_bridge_atomic_post_disable(stru=
ct drm_bridge *bridge,
>  {
>         struct mtk_dsi *dsi =3D bridge_to_dsi(bridge);
>
> +       if (dsi->refcount =3D=3D 1)
> +               mtk_output_dsi_disable(dsi);
> +
>         mtk_dsi_poweroff(dsi);
>  }
>
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs =3D {
>         .attach =3D mtk_dsi_bridge_attach,
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> -       .atomic_disable =3D mtk_dsi_bridge_atomic_disable,
>         .atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_st=
ate,
>         .atomic_enable =3D mtk_dsi_bridge_atomic_enable,
>         .atomic_pre_enable =3D mtk_dsi_bridge_atomic_pre_enable,
> @@ -829,6 +823,9 @@ void mtk_dsi_ddp_stop(struct device *dev)
>  {
>         struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
>
> +       if (dsi->refcount =3D=3D 1)
> +               mtk_output_dsi_disable(dsi);
> +
>         mtk_dsi_poweroff(dsi);
>  }
>
> --
> 2.18.0
>

