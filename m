Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272FDD2C54B
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9fKDedE2t8lKzZ94gbAIeRgRGHHSRcTe1Wt+5mJzNI=; b=JTRmEBxyw/LkjRQeIolLjgd8UH
	IeTrZtSCLIjEpKGpkQTc5tHEC5xIYrN+/wLoKPuV1YsyZ7YEdnGvWfg+MM8MU/7/qNjGSCZl3+i5J
	n0finfZ050JU8rZXBd4VfcbI3OY1GMhgMGLrixRaEC4+KltvaKBQHGEkuKIKw4d0ksXAmWc3mgK+j
	+IkEZQ0gH6oQvizg7R5XnYG65qoXfWsakgZkuGNAL2B95m5ef+ehjcbLk8R5HgAk4zrI161z8r74T
	HIpj2Kg56el1FitM3fLzguXK70cIhrH5BreuiXwie6cXsjsXJSAHqDTmaXtQlLLh5Heu33k2xXmTH
	B/c13oow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EVM-0000000AtS0-17eL;
	Tue, 22 Oct 2024 13:00:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ETm-0000000At9e-3DVT;
	Tue, 22 Oct 2024 12:59:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 750E45C5AE2;
	Tue, 22 Oct 2024 12:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DB7C4CEE8;
	Tue, 22 Oct 2024 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729601957;
	bh=mIEKpBgOrB0FNODaNUzKqQ4blGh+DPNU0es/6NTXQLM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y8u4EqJC2Ld6+xAmGmsDoevkZ9GV8jsXHyWhzMkQuCPUlVgGwGW3IkhegUZ8qmDFg
	 KJklfC25WYGR2pyDl7Kf1Fi1crOKTBdmqkCIeQwSI06Dqw04h535xUpSZ9/Vn5QjWL
	 jUhspehnN9f9d3z4X+3I7TD8KQXReTvtuIR6aX+glkBIHKyolHebOLS4kogHDwv88g
	 JGhdQDKYEsCybYz6/EromjgQZ7oRA/5CAD6Rf+jbV6NdI94MWGmSIxynsJ6vBe1j4p
	 J+Se9/fwrv+ANF4TYCPRIBiwlj0laBV4KdlMCztK3NS3algYSWMiwdxtG9evOv9WSq
	 juXDqpOoIVijg==
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso4108998a91.3;
        Tue, 22 Oct 2024 05:59:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXFdg9p/WdAHBawMb+CZIuf2830u976tM+NAPXuWs1BipFZoGu0Uhgxb47TBXEDUzHK1qAspLNc5EsW4qCPl0=@lists.infradead.org, AJvYcCWMyg3Q6iND58m1//sZG+bMLpCW3ZM6B4eoOWWDWTceUZlCQWb1iUQiOFUnEoys3TBDQG07sm9yheNTacjuHFbq@lists.infradead.org
X-Gm-Message-State: AOJu0YxBt2sahLGFq1564gm3EaMRKx0o3UHreRnNopc2bmnljny9cwLx
	gv3x0uz8HK1/Zui/3Thg+4Mz8rP6tL9+sHNIlKDi8X5nQUl/qs/jeZo7o6Glm0OGDVQn0lZouBk
	LeCbEYEQMKzSrvaTxvd5qEdUvFw==
X-Google-Smtp-Source: AGHT+IEz/fNKcgr+pPCPCQ70QsyRbpxSrHWljw6enWHdqVQbK33wZ/ouEzLGpZFmchdgpySyLi47Yl8GmCTU0qpkJZM=
X-Received: by 2002:a17:90a:a615:b0:2cf:c9ab:e747 with SMTP id
 98e67ed59e1d1-2e5616c4300mr17536808a91.1.1729601957323; Tue, 22 Oct 2024
 05:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
In-Reply-To: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 22 Oct 2024 20:59:38 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9O9BPz0jhd4xM=vMmKZyhYdyOMi2mVhU41Ch2y9pmibg@mail.gmail.com>
Message-ID: <CAAOTY_9O9BPz0jhd4xM=vMmKZyhYdyOMi2mVhU41Ch2y9pmibg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_055918_918200_93EFF146 
X-CRM114-Status: GOOD (  18.76  )
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

Hi, Hsin-te:

Hsin-Te Yuan <yuanhsinte@chromium.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8810:17=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
> Changes in v3:
> - Add missing Reviewed-by tag
> - Link to v2: https://lore.kernel.org/r/20241016-color-v2-1-46db5c78a54f@=
chromium.org
>
> Changes in v2:
> - Clarify that the commit get fixed was intended to be a no-op cleanup
> - Fix the typo in tag
> - Link to v1: https://lore.kernel.org/r/20241015-color-v1-1-35b01fa0a826@=
chromium.org
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9=
cf7864728dcb63b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -65,8 +65,8 @@
>  #define OVL_CON_CLRFMT_RGB     (1 << 12)
>  #define OVL_CON_CLRFMT_ARGB8888        (2 << 12)
>  #define OVL_CON_CLRFMT_RGBA8888        (3 << 12)
> -#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_ABGR8888        (OVL_CON_CLRFMT_ARGB8888 | OVL_CO=
N_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_BGRA8888        (OVL_CON_CLRFMT_RGBA8888 | OVL_CO=
N_BYTE_SWAP)
>  #define OVL_CON_CLRFMT_UYVY    (4 << 12)
>  #define OVL_CON_CLRFMT_YUYV    (5 << 12)
>  #define OVL_CON_MTX_YUV_TO_RGB (6 << 16)
>
> ---
> base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
> change-id: 20241015-color-e205e75b64aa
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>

