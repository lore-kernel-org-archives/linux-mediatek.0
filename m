Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C693AC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tSzIPbcRg52z79bS7K9J3fQblk65VR00TFWvUBKjec=; b=kjc4m6Ou0Af+zKG9jUWNcV8cDF
	zTzfCjVlYmx0jA2krZG2DpSAi4b0CWGQNk/U3xPG7zlx15T6lO4fusogBneFCeeKDWWxA8WSkWG75
	yhyt3Lbu4eyAq3pLYyY+k3d1+XioJX4ucUN4ysLasDN9VSJCKYG4xBeNG6Ycwcv2n0b+R7QeuKY6U
	nD3f7GkdNgyK/4gbs9yxKJkxoMVFH1FUyGT8v3TmPOmWDBAb5B0lvGZq+k04FyUDZ5qjumc/+dNAr
	zrH4kbECdeLOLRIPEFetk9oSwqyd35hBlzRVyl2P4+V1Nr2PvfvNlVObZd5D5+ETYTek2nvbgzo9+
	VgX2MYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgov7-00BZ7W-24;
	Mon, 27 Mar 2023 15:38:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgov4-00BZ5r-0z;
	Mon, 27 Mar 2023 15:38:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 959F86130D;
	Mon, 27 Mar 2023 15:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BCBC433D2;
	Mon, 27 Mar 2023 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679931481;
	bh=3XmuKg7477g2NoJtqEb5iNb4ATj0+FqT6dHhTQ0IQGs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h77Uyo826XxSmu3DX6sM0b4XADQ6cucMcCdMFfq7hWdB9LMN+NZbrVrVR34v9X6t2
	 myxVy3WUwLigNSHR92LJN2VS1wiVsGo0xjSDCNJ+ObeVsK688j/0l1LsLvWSGI31wQ
	 tao0pMm7Bqv3I1jm2g8t9/U29uCUIsKC6VH5qhfCl/kLDW4+3oEuahwHSWpJhdL3bq
	 Qm+yH6ZakaD3gzVKjb8Ms8dsOdev3pdfpMV+720yF88lmTd52ZTdk43rhqTtAFNEuA
	 e4zszYx9LY6unv9pvpgYNEZlvN8wiuq25Q2gWWNPEjjQDlztVbWr+iAq7yszrfWjvv
	 oyjhRwBt5B39g==
Received: by mail-lj1-f171.google.com with SMTP id a21so2308258ljq.10;
        Mon, 27 Mar 2023 08:38:01 -0700 (PDT)
X-Gm-Message-State: AAQBX9cdNwXXKHqSlDge2Q62oA8THu8dT7x/2Ym4emxmW+L9FQNPZQFz
	QZ3+FK6lExSQtOQSEB3NYnd4BsRwavLg81EnpA==
X-Google-Smtp-Source: AKy350a/drZtpde24N1RhyJMimhp9a0kDjKzSFBl49N+1lgOAUv7hKCRbn9292vlLz1kg5xb2w8lratj4rv3wLsalcQ=
X-Received: by 2002:a2e:7017:0:b0:295:bb34:9c2 with SMTP id
 l23-20020a2e7017000000b00295bb3409c2mr3663347ljc.10.1679931479496; Mon, 27
 Mar 2023 08:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com> <20230220-display-v1-18-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-18-45cbc68e188b@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 27 Mar 2023 23:37:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY__=p3pyrX8r55iTR19PiJB3HciS1W9zHF7vR_cVxYgg+Q@mail.gmail.com>
Message-ID: <CAAOTY__=p3pyrX8r55iTR19PiJB3HciS1W9zHF7vR_cVxYgg+Q@mail.gmail.com>
Subject: Re: [PATCH 18/21] drm/mediatek: dsi: Improves the DSI lane setup robustness
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Xinlei Lee <xinlei.lee@mediatek.com>, Guillaume La Roque <glaroque@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_083802_423524_28BD3B19 
X-CRM114-Status: GOOD (  19.45  )
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

Hi, Xinlei:

Could you help to review this patch?

Regards,
Chun-Kuang.

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:23=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
> before mtk_dsi_poweron. lanes_ready flag toggle to true during
> mtk_dsi_lane_ready function, and the DSI module is set up during
> mtk_dsi_poweron.
>
> Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
> nothing because lanes are considered ready. Unfortunately, when the panel
> driver try to communicate, the DSI returns a timeout.
>
> The solution found here is to put lanes_ready flag to false after the DSI
> module setup into mtk_dsi_poweron to init the DSI lanes after the power /
> setup of the DSI module.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 3b7d13028fb6..35c36cc05c04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -667,6 +667,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>         mtk_dsi_config_vdo_timing(dsi);
>         mtk_dsi_set_interrupt_enable(dsi);
>
> +       dsi->lanes_ready =3D false;
> +
>         return 0;
>  err_disable_engine_clk:
>         clk_disable_unprepare(dsi->engine_clk);
>
> --
> b4 0.10.1

