Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FE3C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AokByfxq/9/1p7aA4w7xmzK83wi3RzezUaeIZ9xrIBw=; b=QcdQhiSNJ77OuczEnkiDvMyoto
	f3mhPygs3glGquagJXbpvXGupTm82UT6ZsftD4uaR9llUgY0VSjFXUV4Hk3JRwSnPSXJyORza+3zc
	M3FPBpUpar10yf8jEhNGbt9OtXjoVcc4JQev5X1yy9s/5/CgWr5Nsz/wCtS1MWTmX9HL++IUHgwQ/
	fPzVKAYX2vCiJATQbHE2HctITBgqbO4myued5FjvLoBoqXCgLtvB0rl/XdTGoC22snzstIq3V0+Lg
	icxTR5ft622JSMxyCXQsoKTEomR3KX9QxzljDmqs1SNoDjHf2RB5xxu8NuqZ6rNOsBUrviUdFo44N
	lYpsyc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9U1-00000001JsB-1hLu;
	Wed, 31 Jul 2024 13:35:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ9TK-00000001Jfl-2qh7;
	Wed, 31 Jul 2024 13:34:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 937FE623C4;
	Wed, 31 Jul 2024 13:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B98C4AF0C;
	Wed, 31 Jul 2024 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722432869;
	bh=A+80YZ1JEr//DzbbfCPYd8sgD69akjqIYMI4pV9hTXo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZnHFNj3VxhaEY5RPZEthUUpJti6CuGvrzLT5UiOZjIqeBX6sW8OshcUR3VfVPpdkA
	 SQmCMXJlsQDYqdmtoJ1/cpwhOimBiBUalB+KOO45moiDx2mPC+3zINLaWJnGND6N/B
	 AYVlpy+hyWUiZqxGXR5hP/nDn5yq/Bhs/BPtLplu1QhNPBMbFj/jUF2eTfMSPWMsdl
	 t6nRWKjSTASv/54p/b53VsXUxdgwJqonT4gv9PvBxNBw28tAdUivjVe456TuyLJqZz
	 LX4x0RgYav53nNo7zRnTd/TqWiqEwFRCQuJmQWh3zuT8ZQIOvo/CcXFPBz/hrTZgBP
	 pW/QmB7x/TbIw==
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70f5ef740b7so1815320b3a.2;
        Wed, 31 Jul 2024 06:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhuYR+8Vi2yo2w3+yQaUcstZUWmi7WQDqW1GYI9oQPKEixkAz2fyoYLkVlDsMxu+sVbMj8SifSJ8GoqtxIfIMaNeL0I7blGuyhkitbenF13L7Cz9sEWP3ngfD0P5Z9LBpTPleN7EFj4mEc0LiYfdU1bftlq7C4XB8=
X-Gm-Message-State: AOJu0Yzei3kHoJD5m9FaiIQDABu6q8LTCQ4RMvtKPqguDvfycTf/BtfR
	qyoCXylu+qSUP/OPNloxSSnJG99Sy+oXH2AdwyKRViNd4VQUCtoSWw0S/xU450CYzxXlGoo6zbD
	32Ar+pCbqJV9ep4MtkAHIRuUj5w==
X-Google-Smtp-Source: AGHT+IFcXLX+kvOqT2wFnw1+ymXM2RCkqARP0iez8K/CuS6OcnyEGO/v4tJGIFKipqmPugj8auqSb13TYf9e2F5nJRc=
X-Received: by 2002:a05:6a21:328e:b0:1c4:6be3:f571 with SMTP id
 adf61e73a8af0-1c4a13a375fmr17120024637.39.1722432868814; Wed, 31 Jul 2024
 06:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
In-Reply-To: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 31 Jul 2024 21:34:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
Message-ID: <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
To: shawn.sung@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_063430_832189_AA06274C 
X-CRM114-Status: GOOD (  13.99  )
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

Hi, Shawn:

Hsiao Chien Sung via B4 Relay
<devnull+shawn.sung.mediatek.com@kernel.org> =E6=96=BC 2024=E5=B9=B47=E6=9C=
=8817=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=881:24=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
> adding correct blend mode property when the planes init.
> Before this patch, only the "Coverage" mode (default) is supported.

For the whole series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.=
com>
> ---
> Changes in v4:
> - Add more information to the commit message
> - Link to v3: https://lore.kernel.org/r/20240710-alpha-blending-v3-0-289c=
187f9c6f@mediatek.com
>
> Changes in v3:
> - Remove the Change-Id
> - Link to v2: https://lore.kernel.org/r/20240710-alpha-blending-v2-0-d4b5=
05e6980a@mediatek.com
>
> Changes in v2:
> - Remove unnecessary codes
> - Add more information to the commit message
> - Link to v1: https://lore.kernel.org/r/20240620-blend-v1-0-72670072ca20@=
mediatek.com
>
> ---
> Hsiao Chien Sung (5):
>       drm/mediatek: Support "None" blending in OVL
>       drm/mediatek: Support "None" blending in Mixer
>       drm/mediatek: Support "Pre-multiplied" blending in OVL
>       drm/mediatek: Support "Pre-multiplied" blending in Mixer
>       drm/mediatek: Support alpha blending in display driver
>
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 36 +++++++++++++++++++++++++--=
------
>  drivers/gpu/drm/mediatek/mtk_ethdr.c    | 13 +++++++++---
>  drivers/gpu/drm/mediatek/mtk_plane.c    | 11 ++++++++++
>  3 files changed, 49 insertions(+), 11 deletions(-)
> ---
> base-commit: 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b
> change-id: 20240710-alpha-blending-067295570863
>
> Best regards,
> --
> Hsiao Chien Sung <shawn.sung@mediatek.com>
>
>

