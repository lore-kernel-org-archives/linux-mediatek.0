Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D14D15D8B
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DF/BO12+ts7RoX/ebouFC3/2fkk+4LZi8OUglzDXu4Y=; b=vyIdUOxCu0mcLbJGNgmMau+zUg
	UoNDeWHPBq0QuxnV1JBHXuEpADzfYCnsE+5XuYW8Fp+nDVd6IrWMuu3Odlx7zTBEp5z04kep/J8D6
	b+L6dmxhsaeXVF90EudvxH8gARZ5aQXYYTnqWUssjWG68QNiHGvJCawNityTF18JlA6VvjqKVDu9o
	NhC+eHmS3qwU1UKJd2/xoIT9cc7qQRnlML0duWHeJXUNMRTBSma0otHP9LNX6CKHEd865TLgSNGVj
	uRiJgFOpms+TAHK0Es78ZoRhFae3AOya+awmi2h2jIsQOykCs3AfU2fZwLydV8HCrx4ygWybuUDsU
	f10HsvZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s5n-00000007Mey-1uoC;
	Mon, 21 Oct 2024 13:05:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rsF-00000007KGz-0nOL;
	Mon, 21 Oct 2024 12:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DF/BO12+ts7RoX/ebouFC3/2fkk+4LZi8OUglzDXu4Y=; b=SOISRPNaeSDqy0m/1BbEguEcvH
	BmHg/LMKNlsHBL8SKQs1zx14Fv7AVPbRELS5DhYNpdQM1jIerksZg4jPJX7BSQpoMam5tOutHx7+7
	Y2z4jRg73iVhPLCKHMdRcjB3juphoUOpq2AuVzwLV8TZUtbqG9+4GyaKxCMUILnO3hBVlh6IWIM3q
	slQhG456cwHtlMt+5bx0uUdwSZ3UEZ8MjLlcOnE6mWK08ztpzMahl4nJxTER4mElS1qMPCJMGqW8m
	ml5peqdQuNzQJ9YgPn8kxKFPalyswZXVn6O42aCfcsizBWqVMAL5e9PBS7hei48Ji8XeYAw/Uj5jj
	YqlVvBjA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rsB-00000007w0Y-1bTE;
	Mon, 21 Oct 2024 12:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B10F55C466F;
	Mon, 21 Oct 2024 12:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14F1C4CEE5;
	Mon, 21 Oct 2024 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729515055;
	bh=b+6l4BsUolOYut6i6SR1zP3LvfGX7ZQLtQzTjt4qRGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R9muZxnGfQ16qZokoFMHSoTChhKwt9TMd6+wz9u1rSxShnTBYTJKQcB329uFPaT5N
	 oR8x4AqJSWi5t/chUmjmfuVGbp4U1UvtCHM/dJVVXk5iQxdV5DW+jKKdvZl85BqWQv
	 F3PwTZkjRRePZxaLuRUaMZe/pv5lMucf+yUkDx2MHgqpD27wwSyAwLW5ffqRDBfwrA
	 XD5hogI2CZEQsiSbhAh7eJiw5phT20olb2WdfCaKt8X5d0eLzwQkViMtAsGOmKugcc
	 FVi/ib2lUixpcmXnjkEvwgp9OkD5sgDxMeUdHmgf6qWug33FRDGIeUZosBda+zCjgj
	 XFsgy2Dn1JRYw==
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so3038298b3a.0;
        Mon, 21 Oct 2024 05:50:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUp79v87i3IUjJP4xh8s2jx7Qb0tsNenJbZBRK8Wogn0rWn68G9YWxSiHsMcA/Weym8iqRJZmqAY0JTUJyXkCA=@lists.infradead.org, AJvYcCXCG/aUbFvFn16q0GW5heUAKdHTNmND2huYXN3EK+/hfEybYr+1jdm8oDxteaQLTwE3Y6C4gjvQtAzGRBWFeYLT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb8yqXsksOCr4I1R8PIb6SJcg4tP5mek8T2sU+6NyATNTRlx/d
	bv2PyMQdGIu+I07e0YbEqB8AXGYmdMFkXVWa0s39hJ8foROYXPr+BsNLjKMuuH77RH1jvnaTMkB
	/ZujFGzf4WnzUIpJS5qlu9Yr1gA==
X-Google-Smtp-Source: AGHT+IFZ1C5QqluT3ibMGY6cMrOFVa0OCrC4RfXKLBxeIAjailnBblIgy2YF9BWgyqZBpaECWwTu7rQPKp8us5XNm1o=
X-Received: by 2002:a05:6a00:9298:b0:71e:5de:ad6d with SMTP id
 d2e1a72fcca58-71ea323b91dmr16025574b3a.24.1729515055229; Mon, 21 Oct 2024
 05:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Oct 2024 20:51:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY__6CVfnCCMGnbrfi0qdp5qK73TzNLo6T+-+HxqAGYwP1w@mail.gmail.com>
Message-ID: <CAAOTY__6CVfnCCMGnbrfi0qdp5qK73TzNLo6T+-+HxqAGYwP1w@mail.gmail.com>
Subject: Re: [PATCH v13 0/3] drm/mediatek: Add support for OF graphs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev, 
	michael@walle.cc, sjoerd@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_135059_846513_8A1DB8B7 
X-CRM114-Status: GOOD (  33.04  )
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

Hi, Angelo:

For patch [1/3] and patch [3/3], applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2024=E5=B9=B410=E6=9C=8817=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:=
38=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Changes in v13:
>  - Added comment in commit description of patch [1/3] to warn about
>    new port scheme.
>  - The series is now fully reviewed, tested, hence *ready*.
>
> Changes in v12:
>  - Added comment to describe graph for OVL_ADAPTOR in patch [3/3]
>    as suggested by CK Hu.
>
> Changes in v11:
>  - Added OVL_ADAPTOR_MDP_RDMA to OVL Adaptor exclusive components list
>    to avoid failures in graphs with MDP_RDMA inside
>  - Rebased on next-20241004
>
> Changes in v10:
>  - Removed erroneously added *.orig/*.rej files
>
> Changes in v9:
>  - Rebased on next-20240910
>  - Removed redundant assignment and changed a print to dev_err()
>  - Dropped if branch to switch conversion as requested; this will
>    be sent as a separate commit out of this series.
>
> Changes in v8:
>  - Rebased on next-20240617
>  - Changed to allow probing a VDO with no available display outputs
>
> Changes in v7:
>  - Fix typo in patch 3/3
>
> Changes in v6:
>  - Added EPROBE_DEFER check to fix dsi/dpi false positive DT fallback cas=
e
>  - Dropped refcount of ep_out in mtk_drm_of_get_ddp_ep_cid()
>  - Fixed double refcount drop during path building
>  - Removed failure upon finding a DT-disabled path as requested
>  - Tested again on MT8195, MT8395 boards
>
> Changes in v5:
>  - Fixed commit [2/3], changed allOf -> anyOf to get the
>    intended allowance in the binding
>
> Changes in v4:
>  - Fixed a typo that caused pure OF graphs pipelines multiple
>    concurrent outputs to not get correctly parsed (port->id);
>  - Added OVL_ADAPTOR support for OF graph specified pipelines;
>  - Now tested with fully OF Graph specified pipelines on MT8195
>    Chromebooks and MT8395 boards;
>  - Rebased on next-20240516
>
> Changes in v3:
>  - Rebased on next-20240502 because of renames in mediatek-drm
>
> Changes in v2:
>  - Fixed wrong `required` block indentation in commit [2/3]
>
>
> The display IPs in MediaTek SoCs are *VERY* flexible and those support
> being interconnected with different instances of DDP IPs (for example,
> merge0 or merge1) and/or with different DDP IPs (for example, rdma can
> be connected with either color, dpi, dsi, merge, etc), forming a full
> Display Data Path that ends with an actual display.
>
> This series was born because of an issue that I've found while enabling
> support for MT8195/MT8395 boards with DSI output as main display: the
> current mtk_drm_route variations would not work as currently, the driver
> hardcodes a display path for Chromebooks, which have a DisplayPort panel
> with DSC support, instead of a DSI panel without DSC support.
>
> There are other reasons for which I wrote this series, and I find that
> hardcoding those paths - when a HW path is clearly board-specific - is
> highly suboptimal. Also, let's not forget about keeping this driver from
> becoming a huge list of paths for each combination of SoC->board->disp
> and... this and that.
>
> For more information, please look at the commit description for each of
> the commits included in this series.
>
> This series is essential to enable support for the MT8195/MT8395 EVK,
> Kontron i1200, Radxa NIO-12L and, mainly, for non-Chromebook boards
> and Chromebooks to co-exist without conflicts.
>
> Besides, this is also a valid option for MT8188 Chromebooks which might
> have different DSI-or-eDP displays depending on the model (as far as I
> can see from the mtk_drm_route attempt for this SoC that is already
> present in this driver).
>
> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
> NIO-12L with both hardcoded paths, OF graph support and partially
> hardcoded paths, and pure OF graph support including pipelines that
> require OVL_ADAPTOR support.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek: Add OF graph support for board path
>   dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
>   drm/mediatek: Implement OF graphs support for display paths
>
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  28 ++
>  .../display/mediatek/mediatek,aal.yaml        |  40 +++
>  .../display/mediatek/mediatek,ccorr.yaml      |  21 ++
>  .../display/mediatek/mediatek,color.yaml      |  22 ++
>  .../display/mediatek/mediatek,dither.yaml     |  22 ++
>  .../display/mediatek/mediatek,dpi.yaml        |  25 +-
>  .../display/mediatek/mediatek,dsc.yaml        |  24 ++
>  .../display/mediatek/mediatek,dsi.yaml        |  27 +-
>  .../display/mediatek/mediatek,ethdr.yaml      |  22 ++
>  .../display/mediatek/mediatek,gamma.yaml      |  19 ++
>  .../display/mediatek/mediatek,merge.yaml      |  23 ++
>  .../display/mediatek/mediatek,od.yaml         |  22 ++
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  22 ++
>  .../display/mediatek/mediatek,ovl.yaml        |  22 ++
>  .../display/mediatek/mediatek,postmask.yaml   |  21 ++
>  .../display/mediatek/mediatek,rdma.yaml       |  22 ++
>  .../display/mediatek/mediatek,ufoe.yaml       |  21 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  43 ++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  21 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 253 +++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  14 +-
>  23 files changed, 712 insertions(+), 25 deletions(-)
>
> --
> 2.46.1
>

