Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F4CC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQEmHzY8ZZMMLHXXnVhruEj7RvOhJxGqMBvT+cou0QU=; b=INbQzvh44ywNYarEV4c5Uknj0B
	xUsJkgSMS4vk+Nqf4nfiKz91IPTQLp8YykUSQn7wzVC5AcA72X25Z72T+KvYzGl74dnn6A3M/zJfd
	h05S1NeEAFi+XhXwoY1z9CNJ3RKLEvt4fF7YzX9dgyM3zIEctN0vTiBcF6+XV+s22w10+bdlSQRp2
	KwU6Zn10NvNV7/xsBEMp6wHZ7paW3SnSExgHRLVn6bjm7LjD2D03qll9dKKY9eZ4uMEl9g0ETAmQV
	eI7ac60dZckbFFY+EtivSdce/ETdQ5IUVmYepwAaVQ023+YWuhj5k91FJWwksZ8ykyi1i8sYk8/ic
	al6vEUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqAW-0000000AeST-0I4J;
	Thu, 27 Jun 2024 14:32:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqAC-0000000AeOg-2Wnk;
	Thu, 27 Jun 2024 14:31:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 04713CE21E1;
	Thu, 27 Jun 2024 14:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A24C32786;
	Thu, 27 Jun 2024 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719498709;
	bh=je/gF3c5IjwDHUi3yQuh6iBacgL+GUzWMlTEUFbmCos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gf8T+SCHxjuVdwuzAwoq818CHZlsMx63I1NkNIeSMFrAhnI3pdbg0n5v8L4bobAit
	 RecOip5hCy0mZgOo8ukiqQRERRQKu2SELiU2GlD4IQevFvu9rutFwqtcWvPYCSQQtq
	 ARuCV4hCsDcYx+4oCBs7kPE9mVnPtqz8lSWEqgh7Hp1j4Ef9AhxDcgOarImhlNGXGV
	 IuRO4hwoL4dhppvRgA5I3b++obw9IejkqvkG0cgpK5l7uXP+5+20yu3sFaN3+QJrQ/
	 HyMAHxx8FXa0yQOkr2EOyYBmZIzEXqjG99z94tcSy2iHM0xz0t+iPniaSEWOGnO3XW
	 isAZl/n9J0jcA==
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7065e2fe7d9so4651144b3a.3;
        Thu, 27 Jun 2024 07:31:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaELCuNAb/WZO1E79UVGboFaS+hwv/PoILi6JvmsEeXl9FuPuEcojTjMjqzXfVL9iyY8Rl2qrfJvn2Kh6b6P9Mn3BkLKLcjyBXNG2C4rPnruqoq1Nu76xTj68LgO9p7EyTLE6kZqv74YfRq7j+Z4uo/kKJo0fEX48=
X-Gm-Message-State: AOJu0YyOIZ6fPss9m5GeQ4hInSrqMErQflOe6zKpjNbD2sXPhau+Q4yP
	Vqw7SodqUW7j/Mm98a+KotPyKZCPhSjEwnq+9XXrL08InZ2sZB0clmCVgPzqwo6OTGK1o2Nr7uX
	fCiEZtSrE6TiSwc2wM8MGrRN+aQ==
X-Google-Smtp-Source: AGHT+IG1LSbB2re1qaPNE2onF1geh2vffld0C/9Blwt0TFmZDtnZln8OhUpXrzl1P1UTbercZENutaEyhnCFpRLApUc=
X-Received: by 2002:a05:6a20:b20:b0:1be:c33e:1357 with SMTP id
 adf61e73a8af0-1bec33e1573mr3624391637.34.1719498708836; Thu, 27 Jun 2024
 07:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com> <20231023-display-support-v4-11-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-11-ed82eb168fb1@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Jun 2024 22:31:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-8XzHg_pYkj_u3q_Jgzg29wiJbz5qMkySVRxL=5P69qQ@mail.gmail.com>
Message-ID: <CAAOTY_-8XzHg_pYkj_u3q_Jgzg29wiJbz5qMkySVRxL=5P69qQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] drm/mediatek: dsi: Improves the DSI lane setup robustness
To: Alexandre Mergnat <amergnat@baylibre.com>, Shuijing Li <shuijing.li@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_073153_170624_DD65E3F4 
X-CRM114-Status: GOOD (  17.50  )
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

Hi, Shuijing:

Please help to review this patch.

Regards,
Chun-Kuang.

Alexandre Mergnat <amergnat@baylibre.com> =E6=96=BC 2024=E5=B9=B45=E6=9C=88=
23=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:49=E5=AF=AB=E9=81=93=EF=
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
> index e036d9394c23..cb546a9e9419 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -643,6 +643,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
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
> 2.25.1
>

