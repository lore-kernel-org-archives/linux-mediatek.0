Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EB0D2C54B
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 12:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpmCaq26BAB4tD60HxMfnCodU9sI9yR7/v7ZAMT12Zg=; b=c6GOJUWgPwvB/Vg/Czax3qdFA8
	/BFNW6I/LP1VwX2k923hAZS548Z3IvpnZg/ADnzuVDVaDhT3II9OBNcul+EHIed/ptENELubRKQW4
	jGfPmoJ9D3zQ79oZUiMlP5gSgpoUdmrePPSYXDZjaF5+k63m8lXRkKQ4DlZhDPObuVZASb1EKvX5v
	EAfDyWQGHeNhZ6Qjoou/eWyUYCXrH78YLuCQD/DhETx1ezweDdEasqH2sIATjH+4a9dvFrBS1HLyQ
	vwcBsbFHm+XIlWrYlLjUCt3XnJLn0gdvujL9LzhbNGW8T3HCGvgakifb2E6rJur6d1FfNG2CPmpnp
	48qL1CCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ETr-0000000AtCI-3UAJ;
	Tue, 22 Oct 2024 12:59:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ESI-0000000Asxv-1H8B;
	Tue, 22 Oct 2024 12:57:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77F39A432B7;
	Tue, 22 Oct 2024 12:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DC0C4CEE6;
	Tue, 22 Oct 2024 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729601864;
	bh=GhYhjo2Z9FXBqZLMmzftfla/w2fS4jR3pdlc1PSB8Es=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y7Zy40NTxTXzsVIMsT9PJtRoaaQy4RFyKGIWk61W5cmWzS5rRfY0G/Oz0fmT8LXSi
	 wVvAorDhk+7Qvax7NV4h8J/UCddznFam5pyWU6sfWXu+y6ubcTYmUOLXy4rft3JVP2
	 J58AFoY7rC7DLQNBzgdolMPwSOHZ2cwe4Yzn+POs51/QuMElvucxUchAlyn7CAwCOZ
	 rf1IwrZHCLjORkZM3papXb2oVlmNNqjEeQ6M+EX3uqgf13jmph6KtSYBZhgGxBR6o3
	 8RjqK57K09VN63qgbvNT0nlHQ8PbEiQM5dq7lMdJ8r+JHYe/SBeuBD6//elaqTm3Ok
	 i+OwBaejHNnlw==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e2e8c8915eso4422176a91.3;
        Tue, 22 Oct 2024 05:57:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJe8htt6OLoAaQuQzOdPSR1Z/lI9F133sSd+JlOQhAeX26u9cOlsLedX8rCPRRblhlkI8ECr3nir0fZcBB6Gv5@lists.infradead.org, AJvYcCWMILnQSKhQLvKdYCF4JziuQ8HB6OdlblfnFh9CMrW8tNCOaJMtbxh89bZMFfQhCxC7JqTDl60oOAbbH+aL2/o=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLKGdQH8l9WvktxzlxhlPzhvkFd70h6+EE6qZq14z8Etyvl5gK
	0lFopYM2fQOOjpJswT7k5JAzU/V7P3VbJ3TmVsdCrHJm9zwCcJDpVHgNn3fO3ANFQzMPQaM9nro
	d0VHjsS7kMqt+XX6CQBQT7OkBMA==
X-Google-Smtp-Source: AGHT+IHDPBVccyietVt0eoOPH++rNW8m28x85sMWW+Dmxt+0VFr1aS34/bDRGwrVWPxtoil8Pjk3sREsZd5vx2UMbic=
X-Received: by 2002:a17:90b:1649:b0:2e2:a2f0:e199 with SMTP id
 98e67ed59e1d1-2e5616c543cmr16488894a91.8.1729601862855; Tue, 22 Oct 2024
 05:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241009034646.13143-1-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 22 Oct 2024 20:58:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY__fuUpvFeFXZrmvmFAM+92a-UJ9-ye6hQZHS_BHXpbAUA@mail.gmail.com>
Message-ID: <CAAOTY__fuUpvFeFXZrmvmFAM+92a-UJ9-ye6hQZHS_BHXpbAUA@mail.gmail.com>
Subject: Re: [PATCH v11 0/5] Fix degradation problem of alpha blending series
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Adam Thiede <me@adamthiede.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_055746_511146_D85C0BE2 
X-CRM114-Status: GOOD (  19.88  )
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

Jason-JH.Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
9=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8811:46=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Some SoCs do not support the ignore_pixl_alpha flag, which breaks the
> XRGB8888 format. Some SoCs do not support pre-multiplied pixel formats
> and extending configuration of OVL pre-multiplied color formats,
> such as MT8173.
>
> Fix the SoC degradation problem by this series.

For this series, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>
> Change in v11:
> Fix typo in commit message.
>
> Change in v10:
> 1. Fix the commit message and comment for OVL_CON_AEN
>
> Change in v9:
> 1. Add the fix patch for the XRGB8888 downgrade issue of MT8173
> 2. Add the refine patch for ignore_pixel_alpha statement
>
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
> Jason-JH.Lin (5):
>   drm/mediatek: ovl: Fix XRGB format breakage for blend_modes
>     unsupported SoCs
>   drm/mediatek: ovl: Refine ignore_pixel_alpha comment and placement
>   drm/mediatek: ovl: Remove the color format comment for
>     ovl_fmt_convert()
>   drm/mediatek: ovl: Add blend_modes to driver data
>   drm/mediatek: Add blend_modes to mtk_plane_init() for different SoCs
>
>  drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 +++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 70 ++++++++++++++-----
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.c          |  7 ++
>  drivers/gpu/drm/mediatek/mtk_ethdr.h          |  1 +
>  drivers/gpu/drm/mediatek/mtk_plane.c          | 15 ++--
>  drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +-
>  10 files changed, 92 insertions(+), 27 deletions(-)
>
> --
> 2.43.0
>

