Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D342CCED25F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 04:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsgypzMnr8s549OvOvjEHy3rmXs4vBQB+7vyfPc71L0=; b=zB4/AixBamDMehbYny8f4ZvtMS
	uFcYDEh3++q5eAM1MampRDcbgFmKGg+fZXd7YIcEg9xHGeqJS9Ai238KZRfWzNWx9WD9yIlcXeU75
	ZhJICBnkbdWXswwWXpJAD49E/kzjU3SkmeNdlrk8zs1GfjNwYeVxx9HnH+G9GKxm7cl+uylFDO1ey
	rplPHNXwHbdzRICQvWhEJGid8T5yWsKP0F/TvLdqOu1e5RwPRRJuG9pBPXIXqXOCaV/JlkXELtrTy
	6sqASiHHIAF+bjzq6zqprk7Hfao1GI450UbEQYYXiWWqiyivll0UFdp3SYDdi3+LJi0iBB3VqoodV
	18DTyYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy1dS-00000004TAo-2bpc;
	Tue, 08 Oct 2024 04:15:46 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy1dO-00000004T8E-25i2
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 04:15:44 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5389917ef34so5900811e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Oct 2024 21:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728360940; x=1728965740; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsgypzMnr8s549OvOvjEHy3rmXs4vBQB+7vyfPc71L0=;
        b=FCDlEwcjwmVV+hhwXjTNy8CmCMdFAcYSUx0cBiQe1ZtBm/vJwruWaqYBAgg3NW87U5
         0fJfssTL4P31nU2tRSt9eAJwk7vIpTsS7p7s+rZb9CriUFcx008TJ32f/2NuIEDXRzMb
         v34xirfuuFY1wFSWdbtdvUAczST5T9vFRqBLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728360940; x=1728965740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsgypzMnr8s549OvOvjEHy3rmXs4vBQB+7vyfPc71L0=;
        b=hUrPCr2xl3L/XMB/inafRMuua7AXFu4nZZjqfaLJj/wn6U6q/7QI9dUK1YmdDJZji0
         tEmtf4poMWdAGqmQ9GVN75be8lz78GTHjB2dWk/V3FbFuzHraPzG3gJnkon/JYKhtK5F
         wXq3yjdHN9lymZsjR7nn02R1yavzHkpoooYiqcOkcRwoM52DamCkQfLZO8jZP8nm3ZHS
         Eg8831nIGGirlH+0veJXDtL4g4xVkJOqFbGfctB/bFeclpapiE18MMHxKi63y5PxUUnQ
         ebHZrdKBuy1ku+gCQxg6JlTMlgMY0cdmdWYACaMV5FjCzggFNcJWSQ1bxf86zC69vV6V
         pzCA==
X-Forwarded-Encrypted: i=1; AJvYcCV36TG+ZxITTwnEYD63/CNZzbH+1CWoDwA0YFs/x48oowwTni6IO+hDrZGsGFJ3e/3G2hBX6kTTWrYHi8PQ7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPTwHXyJ9+wkQhB5VJi9fQzKxh6TxzjieBX77WtsgZgIoasxoM
	DsFG2uAJ6EC1RIbaFNwjPrhOlaeWljVZjhx2rIufHUKWm+38HO/QuW4I3cL1TTXurUIfdtPFofM
	kt5ao4pSqcUKXd/6XIklXp0ySLnz5OouXreoe
X-Google-Smtp-Source: AGHT+IH5L+vBThATfCj0naB/bXXgVGLsu0H6B6nI/GfouA1KFBjppbhu47esWrYoxk0NZzfhr9MWJDBe2RWeLpV4zC0=
X-Received: by 2002:a05:6512:308f:b0:539:986e:cd68 with SMTP id
 2adb3069b0e04-539ab9ec4eemr6211095e87.60.1728360939666; Mon, 07 Oct 2024
 21:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Oct 2024 12:15:28 +0800
Message-ID: <CAGXv+5GzmWhs1ZiNtty1eH2h9n7bw-EeAdZQvXaBLMUA5cUuzg@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Fix degradation problem of alpha blending series
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
X-CRM114-CacheID: sfid-20241007_211542_593079_DAB41156 
X-CRM114-Status: GOOD (  19.87  )
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

On Mon, Oct 7, 2024 at 3:01=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek.=
com> wrote:
>
> Some SoCs do not support the ignore_pixl_alpha flag, which breaks the
> XRGB8888 format. Some SoCs do not support pre-multiplied pixel formats
> and extending configuration of OVL pre-multiplied color formats,
> such as MT8173.
>
> Fix the SoC degradation problem by this sreies.

The series fixes the display color issue on MT8173. Tested on Hana
Chromebook (Telesu).

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
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

