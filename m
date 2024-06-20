Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47CBC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 14:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiZWULjmV11jey80egMbSewa4MbXTpIvnDZLw3YlHvI=; b=l25K465InvoUkNTcGNiS1k6JhN
	IDe81u/YlPMOY/LvaLDNEsy+3fnW6gySaKMcSWkBPMxjaoaR2FUB9VnX6ue8tX8kdE47cssZPDSZr
	Fr3WFr9o9GcmwSooHZSCRLBn39MF0Mtl4PpwQ3MFm8vuUxo9WVsVrHY6Xyd8OCTbJNUoynZTboSiM
	frETaDyOlh6UoXPgJjLGVPYQFBGf/AKwsKEZhV1qZTmXgg5Yua+GeRmF6nT7cbHX9dHbDk+ZC6vGF
	RqRnQcwchZ5gF67A5Nq2iPAkz7iavLfafZ8AkCzgo3gyIb9yHrytDIjBwxrNoj9OSF7+voHP2/Ufc
	lBKy11OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIaA-00000005OSy-28ee;
	Thu, 20 Jun 2024 14:16:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIa6-00000005OR6-1NW7;
	Thu, 20 Jun 2024 14:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A795BCE26AC;
	Thu, 20 Jun 2024 14:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7F9C4AF10;
	Thu, 20 Jun 2024 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718892960;
	bh=UDlJ6uLcQXogt2mDuKEBiU38jh5c6vLlukjhWBH7Qus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e27YZAb0SMdNORc0WySWr9ulPPrWxTmGmIK9z9T8ITooSDkm1xorl8oSgUZ5H/5J+
	 hMnEFJMXiRe96lQjKRmkI1KXuDtR7Z7iDwwEXjV+kmbgm6Wzim3ZDa4yXBKsFrmB32
	 /XHF05+C26eOP3qMWBQ+8kjFJ4G1ONK9cZEjzp+mLkieG6YAFbWgoX0/Bux8YWCMU/
	 A8vRk23XCWyKJ71G3slZyldPyqlkss43JWT5A3VAe4/3Z4y2+lQmtJWhxk3kMmh+j7
	 tfDWAYHKR6crv2eDs2D0+HLHvH8adlW77wIdnXZ++Gvxl+OgI+daXE+VVY1zKy2vqd
	 QG86MjRwcW+fA==
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6e3741519d7so669436a12.2;
        Thu, 20 Jun 2024 07:16:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHauJ8RFvczAII+1lb2ix+lvxQNaL5LUqMJfyX6Ud5HK8qruzDyUQMtB791YxHkE748LMWPT+UQ1foA8Jyurv9L5SS2NTN1OD3ga225NNmLQ3AihfSHqoXTOaTmSkZ/aW5dEiPm8fu5PPbF7oALA5qAfQ6d9LgZW4=
X-Gm-Message-State: AOJu0YwPSVo9X128g3kbp8aHYHyam/CruBWYTdRfqs1PikPZ+/EOTGlK
	O75eC9b45giDhaUy0RIoXYeDtpFGD03qjlmjoG3+HnVvqQIORROmPF+octB45hvDVP1sOBfl4o7
	l78XIjSQKjYrS3qNJLSJYSi5+Bw==
X-Google-Smtp-Source: AGHT+IEEZFaOQJqaaP4A/njE5e03nG3bYOqRCA6i8KrbRzqY6VJo0X1EoekNnT5l58n8C9MKT0tRhbdT264LedQgUWQ=
X-Received: by 2002:a17:90a:db8e:b0:2c7:e24d:f688 with SMTP id
 98e67ed59e1d1-2c7e24e2bf0mr2108904a91.7.1718892960167; Thu, 20 Jun 2024
 07:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Jun 2024 22:16:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9w2j9pMQAkE7mVR1Rcjw8QgrSvEqjk=db2imf6kBTNBA@mail.gmail.com>
Message-ID: <CAAOTY_9w2j9pMQAkE7mVR1Rcjw8QgrSvEqjk=db2imf6kBTNBA@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] This series fixes the errors of MediaTek display
 driver found by IGT.
To: shawn.sung@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Bibby Hsieh <bibby.hsieh@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, 
	Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
	YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_071606_761907_03756B42 
X-CRM114-Status: GOOD (  15.56  )
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

Hi Shawn:

Hsiao Chien Sung via B4 Relay
<devnull+shawn.sung.mediatek.com@kernel.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=
=8820=E6=97=A5 =E9=80=B1=E5=9B=9B
=E4=B8=8A=E5=8D=8812:38=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

For the series, applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

> ---
> Changes in v3:
> - Modify the commit message
> - Add a patch to fix destination alpha error in OVL
> - Link to v2: https://lore.kernel.org/all/20240619-mediatek-drm-next-v2-0=
-abf68f46f8d2@mediatek.com
>
> ---
> Changes in v2:
> - Seperate the changes that belong to another repo (driver/soc/mediatek)
> - Move the fix patches to the front of the series
> - Link to v1: https://lore.kernel.org/r/20240616-mediatek-drm-next-v1-0-7=
e8f9cf785d8@mediatek.com
>
> ---
> Hsiao Chien Sung (14):
>       drm/mediatek: Add missing plane settings when async update
>       drm/mediatek: Disable 9-bit alpha in ETHDR
>       drm/mediatek: Fix XRGB setting error in OVL
>       drm/mediatek: Fix XRGB setting error in Mixer
>       drm/mediatek: Turn off the layers with zero width or height
>       drm/mediatek: Add OVL compatible name for MT8195
>       drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
>       drm/mediatek: Add new color format MACROs in OVL
>       drm/mediatek: Set DRM mode configs accordingly
>       drm/mediatek: Support more 10bit formats in OVL
>       drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
>       drm/mediatek: Support DRM plane alpha in OVL
>       drm/mediatek: Support DRM plane alpha in Mixer
>       drm/mediatek: Fix XRGB setting error in OVL
>
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |  6 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 93 ++++++++++++++++++-=
------
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 24 +++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h          |  4 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.c            | 27 +++++--
>  drivers/gpu/drm/mediatek/mtk_plane.c            |  4 +-
>  7 files changed, 126 insertions(+), 34 deletions(-)
> ---
> base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
> change-id: 20240615-mediatek-drm-next-ad601b349f23
>
> Best regards,
>
> ---
> Hsiao Chien Sung (14):
>       drm/mediatek: Add missing plane settings when async update
>       drm/mediatek: Use 8-bit alpha in ETHDR
>       drm/mediatek: Fix XRGB setting error in OVL
>       drm/mediatek: Fix XRGB setting error in Mixer
>       drm/mediatek: Fix destination alpha error in OVL
>       drm/mediatek: Turn off the layers with zero width or height
>       drm/mediatek: Add OVL compatible name for MT8195
>       drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
>       drm/mediatek: Add new color format MACROs in OVL
>       drm/mediatek: Set DRM mode configs accordingly
>       drm/mediatek: Support more 10bit formats in OVL
>       drm/mediatek: Support RGBA8888 and RGBX8888 in OVL on MT8195
>       drm/mediatek: Support DRM plane alpha in OVL
>       drm/mediatek: Support DRM plane alpha in Mixer
>
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h         |  6 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c         | 95 ++++++++++++++++++-=
------
>  drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 24 +++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h          |  4 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.c            | 27 +++++--
>  drivers/gpu/drm/mediatek/mtk_plane.c            |  4 +-
>  7 files changed, 127 insertions(+), 35 deletions(-)
> ---
> base-commit: 62fe4b067581d480e863191305f108bebffbc0e9
> change-id: 20240619-igt-49195e21404d
>
> Best regards,
> --
> Hsiao Chien Sung <shawn.sung@mediatek.com>
>
>

