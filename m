Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C153CF855A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBM0vMiDNwiISlSqiUYRbEjMfws20AOgbrL7/x0ufw0=; b=c7DdRGn0IJ0fLs0JlIVzNuM3K1
	4vAOBAthN3JAeAVAAhzeWpezSb/eJ2UW+HH3X2PLOBdRu/e4IsXxXBjlF6LsqLlO5uOeLSlv+op+U
	T0cOO+FiCXjA6Chu51Csgvr/dW22VxblYq7VJi1XMXoX6PXET72dC7+8c3GuRgWHSVua1g5fnsuAZ
	S3QbFAzhjtjSUytnYSk1pp3WzcDqAw+/6MgE6+lAxOjjJ5dpqoHItaTf88gogoGkSgO0Uusmt+JCD
	svFomwuT7SpaoFy2hp6eQXEqBtzAzJAjjvijhmrnT7DtxX/yOMsXmWXceTg/9jZYnCFv6NgCaWAdl
	9Mls/6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swG57-00000008NNx-1Jsk;
	Thu, 03 Oct 2024 07:17:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swG1p-00000008MoB-0TId;
	Thu, 03 Oct 2024 07:13:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60203A43209;
	Thu,  3 Oct 2024 07:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B27BC4CECD;
	Thu,  3 Oct 2024 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727939615;
	bh=JhZKiGtQJ3zymd/WHqllXr0LMe1u0429Jy42xFeCp7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kaxd3lJ25rkQajgmz7cQN8bDKn6xrj7OzSOtHfn8uH4EjOnJl1D9S+R5irC6GrrDU
	 qaiRpJJpeMDcDyvWLjlcsf7YPsExEhhXOdxOUkJsbSb0hF5ljMlQaccLs9MGOVjIs4
	 T07US2duiGJyfSvyps8auPPRECrs2CdTanUNzbrzk39yc7aiR8AkK7EOZscPeoeWiB
	 YnZotNZBMuG9quNjZbeo0/vC6dxalac0MqejTpFccgxzVERgPtCGg2wlgpk7XykI5E
	 BRddwweGoeGpXcwu66CUB/t+x0dwqGyAl1iidQuEZieU3X4s/Kt55QfpgTSSvn1Plm
	 a+x8wkatdrz4Q==
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso535888a12.1;
        Thu, 03 Oct 2024 00:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUazaUjS/ri4sYTaglxlMvHqPsDln5F7tVV3dFPgMySkDEgtWoihORJb/ZF5GqGS1oEQbcxRCtLbaAiVxhrV08=@lists.infradead.org, AJvYcCXWQyKjEeLAXEV/7vExyGOqDMyzJ2QbofqA+whxRSCRxltaQXIE7/wDGB3acKA7O5/5fZE0GTwlupFPrxV2mFf6@lists.infradead.org
X-Gm-Message-State: AOJu0YztNYAyQAlaWPjQ8esiH8U6ngS9LmvjxYQRqGK2oYLdhwHPMikn
	Rtjb7JdbtR/P3BhnRrF4HYhofMsgIkEaoakpCxQWGGc1c+ljnai7ce7t1JWKhg3gpZqN3OWE7ew
	SIXBd+esCn8F7BLQ/A4UEdLTAsg==
X-Google-Smtp-Source: AGHT+IHaAo5eZ05/dh9oa9JP9QZga/GAqhHnubzaK7kWFsvBL+T5Ll6XOf4RZb+dNKFMS4YkePxJqv4X4Xs3SvAUasY=
X-Received: by 2002:a05:6a21:7746:b0:1d1:88bf:dff6 with SMTP id
 adf61e73a8af0-1d6d3aab4bbmr2809735637.15.1727939614998; Thu, 03 Oct 2024
 00:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20240928161546.9285-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 3 Oct 2024 15:13:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9V+BFV0fCahzn2qNBAmLrY-cwRQAKzorTdRYGCFv5+tw@mail.gmail.com>
Message-ID: <CAAOTY_9V+BFV0fCahzn2qNBAmLrY-cwRQAKzorTdRYGCFv5+tw@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_001337_334949_CEA7B206 
X-CRM114-Status: GOOD (  18.46  )
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

Hi, Jason:

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B49=E6=9C=882=
9=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=8812:16=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
>
> Some SoCs not support pre-multiplied pixel formats and extending
> configuration of OVL pre-multiplied color formats, such as MT8173.
>
> Fix the SoC degradation problem by this sreies.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> ---
> Change in v8:
> Remove blend_modes for not supported pre-multiplied SoCs to fix the
> return error from drm_plane_create_blend_mode_property().
>
> Change in v7:
> 1. Add the remove color format comment patch for OVL
> 2. Fix warning: 'const' type qualifier on return type has no effect
>
> Chnage in v6:
> 1. Use blend_modes instead of function pointer in OVL
> 2. Use ethdr instead of mdp_rdma to get blend_modes
> 3. Add 0 checking for adding blend_mode property for mtk_plane
>
> Change in v5:
> Add fix patch for mtk_plane
>
> Change in v4:
> Add lost cases of mtk_ovl_fmt_convert_with_blend
>
> Change in v3:
> Change MACRO approach to function pointer in driver data
>
> Change in v2:
> Fix build error and typo
>
> Change in v1:
> Add fix patch for OVL unsupport color format settings by driver data
>
> ---
>
> Jason-JH.Lin (3):
>   drm/mediatek: ovl: Remove the color format comment for
>     ovl_fmt_convert()
>   drm/mediatek: ovl: Add blend_modes to driver data
>   drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 +++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 44 ++++++++++++++++---
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 +++
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 +++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
>  drivers/gpu/drm/mediatek/mtk_plane.c          | 15 +++----
>  drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
>  10 files changed, 76 insertions(+), 17 deletions(-)
>
> --
> 2.43.0
>

