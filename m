Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D49D1AD55
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 13:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TREUo1lQfvBhTYNzvxLnSAftCI9jNyXaG87hpbR/7a8=; b=EHPt6ChPfQdzUDNJOSdC/A5ec1
	Y0EsdVZAzzfbP8+5lcgNbr/JGRzxX9ZL83GlW7XBgrOphyIfNtafguiXXfGY/JXSi4rInCr8TaU3x
	7hvq4MdLth5dNrlgDzVIbZhEbE+o1O2/vREWGjL3PSPy9D2lqkARwDjV8RmYPf6PWT6lsxI32FU23
	uVXo6fTX5Ql5Yaqc+qY9KpNMMI/FfRBTzvEL+QXlNYtihNN3VT+OySRKJL2kmkAdSPU04uqMULPzw
	/3G49yta2dltmt71/0AZgwrBXOycNuJsUC2aD1gm9swrhCTl1rIvKXBP3sARHJkjyqMkw5nj8x1oz
	phD+R05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t148a-0000000BwRE-3S4o;
	Wed, 16 Oct 2024 13:32:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1476-0000000Bvvt-08mz
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Oct 2024 13:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TREUo1lQfvBhTYNzvxLnSAftCI9jNyXaG87hpbR/7a8=; b=SWCtMCRx8uIuf77TCpGNsMmMuN
	gbBq05+yqX52MTCnm181y1XZymMTbgPHsTRlN/WdqrlckZi98nFK3DpRWuklk2nwRhMyhe/w/Xy0y
	ZT14bjkcBCmp8ilxEkoafYI/ucPkF09IbFT4j4alNDZzBBSX8o0I6aJby1IYtDXzDXJkxLdz7DWUf
	d/wzQuupbPHnkQ4V79Ijc7E2oLt/0vBIbnXoMeTYau5qYqVd4ocHseaJEJD/6cjFuvTUCwsx7zsCX
	IAm2uu/222IJTeb88dqZAVgUWGwgkuL1pa3H3nrEVrBNZBnwpaxkJ9yJpr7nhoamSeXcry1MpyZVF
	4oISfAIA==;
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1472-00000006oZ2-1Qs0
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 13:30:54 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4a470d330a5so1937843137.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 06:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729085448; x=1729690248; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TREUo1lQfvBhTYNzvxLnSAftCI9jNyXaG87hpbR/7a8=;
        b=DdZjynuII81rv8G38/28puTADKR+mcKLjaZhnXnDVI+7EAoNj9AiF7VuGfZ532kf9w
         btqyGvkq6YZ5ETk6zgGmg7f+ZCMsO2RzUxxzp/oueI26UPlYjDYE8FmCLXE9NrhLxngE
         3x2+ueFmolvOtLFqTs64mrnHAl0bne4YFrCJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085448; x=1729690248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TREUo1lQfvBhTYNzvxLnSAftCI9jNyXaG87hpbR/7a8=;
        b=Wejhp2eX9bUWOvqtGqhF0lwIduDa9Ezzyw2DGqg4p4wkW9LYmbhZJ+zwLfXfyCxhi0
         i+XK5LEMR42Z5SOeXhdVqN8Mlc3sQOjoKPlIF5u04wXod9eSk3qczRmqWu6vqUoeH4j2
         UQfjUhYpAoSG1Sp7tQwt5yuv1HO8zbRXEb+e1FtyqzbsGmWSFGHaJqsX7kqpA3QJ5W4P
         28LUhaoFDN1yJZNwLM2NMXvZAGLwfiOgX8xITxhR2p1X0xFRbgb1NwroE4D5lCpOoq9l
         rsNxOksNQy2atq4JKqMgS3yluvWKkCGdOsbagQRNCH8a3h0spZvg80wormTjtnD2/WUa
         kTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoNG6BsxECcDF1hKja9emGCO6NhL9+bOX5hKMvYbj5pVsRaS1FhoSF1ytMfBxmZVwWNZZt4aYs3wnHTXADjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmGNdKKuJ3UCD55lqW8UQ4uwuurUIT/eve1idNAg6UxWpWpqmF
	eVWdhGuRAMMWOlFSgPPjgNNNQNIE07VZCfHQtpEm4/zqpP35yBgdaDCyFUoOdb/ELYVHzTJ0cWo
	=
X-Google-Smtp-Source: AGHT+IEubIzUiZVCOnXc3khpkeo5pu8MIbQWxvTL3L7pJHEL2d1zkwwxzk/HHpGZEvOmEsJ1avrFEQ==
X-Received: by 2002:a05:6102:3053:b0:4a4:8651:3c2c with SMTP id ada2fe7eead31-4a486513e43mr10874464137.20.1729085448434;
        Wed, 16 Oct 2024 06:30:48 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a5acedd60bsm534042137.23.2024.10.16.06.30.47
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:30:47 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-84fe454176bso1625489241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 06:30:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJkzII7t7cce8TiIg6UPnPfB0yGTGdwNDE4WoEvPN+g0+ToVSJ81kbJIQKxoj6664xuDfrPZ21yEWaVLLfVA==@lists.infradead.org
X-Received: by 2002:a05:6122:469b:b0:50d:5be4:c39d with SMTP id
 71dfb90a1353d-50d5be4c7a8mr9674315e0c.0.1729085447232; Wed, 16 Oct 2024
 06:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-color-v2-1-46db5c78a54f@chromium.org>
In-Reply-To: <20241016-color-v2-1-46db5c78a54f@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 16 Oct 2024 21:30:10 +0800
X-Gmail-Original-Message-ID: <CAC=S1niFFuKiw1hC-pV-dSVP_cd6YiAU+7a7xLYgokLc-DtOcQ@mail.gmail.com>
Message-ID: <CAC=S1niFFuKiw1hC-pV-dSVP_cd6YiAU+7a7xLYgokLc-DtOcQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Fix color format MACROs in OVL
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
X-CRM114-CacheID: sfid-20241016_143052_822943_0DDA43E4 
X-CRM114-Status: GOOD (  19.19  )
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

On Wed, Oct 16, 2024 at 7:10=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.o=
rg> wrote:
>
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.
>
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
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

You missed Doug's R-b tag in v1:
https://lore.kernel.org/all/CAD=3DFV=3DXrrhUoB9=3DJuPY2erLMA7S-EREqvP5t8NNu=
BuUiA4rZjQ@mail.gmail.com/

Can you resend v3 with both R-b tags this time?

Thanks,
Fei

