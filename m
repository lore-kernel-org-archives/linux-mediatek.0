Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9999ECCD1AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Oct 2025 13:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrRSPxugKfBRbwb38s0reG3tqtJvi6mHZloAZZkTJtM=; b=bBt/VHCkg6tRlRilPu+tApePmJ
	koQloT0AcXjQBSjgla6ieuyeAYO/l9AMd0LBG9Aucs6UQRzqEsn0PvEXFdimjVExqACmW1NVBIFdo
	4hLfBLqPnVR3lNn7RHDsp6H4/SIiT5X3nLK+dvJuqs7V+cM4BFN/shYLqPHHOJ7/Yk/559ZC9AgAj
	hMZB5ICE77jigVjLt6jQbW/oVpB7U/Bu+1DcRPExaYBnrMqyBY5uIJm1ssZjCnaGlt0R0upaEZB0K
	23IOfbuIhfgsr4dMjFhWfUQcpCLVtCpcRyoqA7+jksc0zpNuYikkkPH8qeqr7ggAYG2/UiuvjLeMN
	vulCSTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZCA-000000035Pv-0YBz;
	Wed, 22 Oct 2025 13:48:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZC7-000000035Ou-3hnc
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Oct 2025 13:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E64D62136
	for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 13:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBE4C4CEE7
	for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 13:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761140883;
	bh=jbBJWUa2D5mD4FO+YopVcu+7lzL7qETV1oQuE65ZYas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WvqXYva6pkQEoRMq5LvT+1+kG7B1Kz3PS02C1kUmogBm+k2sURFt38z6U9PPVW78p
	 eDhGToTKrnnX79xe4DaP20mVy0Q0HozDY+D6ackoKN/oJg8N7w+BOkoUbOpE02PrCj
	 go3SZVQq44RBgnGlCmKuFWNhqXWMmS/yzSePWuvXIvcxPE8XyNlGI8JS9cStg1O72W
	 D3VWhcUPE5mDtWalOrZEfvMuUsBfb8u/+vSZvv8weiP9E6zyiaJeVjgYXvpzum49V8
	 yIPutGD06uxQzesDA77BHQ4Uj0fUPOX9wYv4n9ycS0vsk61OthhucDnBKJHUqtUw01
	 NJHEw1hLMo9VA==
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-339d7c403b6so6570293a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 06:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxTfDkvv16Ea51F/jGRskQgA5K3GH/NQgXpljupd9gu4/GsSc3zs0WsRF3s9XC3wnGgtDGZNRe9c04Zb9qiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFE9uWc9ENtGDIxcph1aAfzwQQa8tulm87860RX+MxWInlEcmU
	pWYpbfSLZ1Gfbt4Ukj2gy7qZTm9eH+RkDJ2xrO4sGHnGJ8W2CssXNA5mMsd1Wox9dxTnKl+npCi
	pvjmnMFgwyRLxvdZVVdNISvayofaSmg==
X-Google-Smtp-Source: AGHT+IFy1XRD8bUn3Ht+foWFb4onBy3I0BzeduV4i7PqazihqftsGN1m+bW8yLWYlxF6eUIqhNEGG1eW7HknFBsv3Jk=
X-Received: by 2002:a17:902:f552:b0:290:6b30:fb3 with SMTP id
 d9443c01a7336-290c9ca32eemr287339455ad.16.1761140882431; Wed, 22 Oct 2025
 06:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250808-mediatek-drm-hdmi-v2-v10-0-21ea82eec1f6@collabora.com> <20250808-mediatek-drm-hdmi-v2-v10-4-21ea82eec1f6@collabora.com>
In-Reply-To: <20250808-mediatek-drm-hdmi-v2-v10-4-21ea82eec1f6@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Oct 2025 13:47:50 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8-W8XRsTFDKH69BRA=hurgZ2KOHeBDnixL-LgHObqhXQ@mail.gmail.com>
X-Gm-Features: AS18NWDLymwzfszmU7JKmhTu0CgDInQdk-IxVHYP20sloO1fgKFGR0uo2gWdNLY
Message-ID: <CAAOTY_8-W8XRsTFDKH69BRA=hurgZ2KOHeBDnixL-LgHObqhXQ@mail.gmail.com>
Subject: Re: [PATCH v10 04/10] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Louis:

When I apply this patch, conflicts happen.
Please rebase this series base on latest kernel and resend these patches.

Regards,
Chun-Kuang.

Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> =E6=96=BC 2025=E5=B9=
=B48=E6=9C=888=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com=
>
>
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
>
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>  drivers/gpu/drm/mediatek/Makefile          |   1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c        | 539 +----------------------=
------
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 428 +++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 188 ++++++++++
>  5 files changed, 633 insertions(+), 534 deletions(-)
>

