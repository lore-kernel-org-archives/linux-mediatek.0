Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424CAECE582
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiMIK8K+tyHKozmztV2/CvAPF0ELMWXt09xgTQVIEVU=; b=1DzoLaGQchCP0U6nLW/k52fyB8
	EvRPH5/tRR7pEI6zlBhzwL/nvqlKFG3jeSjvI3psNLCra9TLhAV+1JQ1IpRYCVBHXJ7MBYvLH20Xq
	gg2JZ9GM58mm25GJmCEk1d3PPOUK9JgdW/OyPdcDUnGJtKqp/g9RM2tesfmCwajqma33WAAutrDC2
	ZHXRHBiOwJsxcFJbLP/qkyi5y5953CN6UGGsoiIWOOlMbqxG6sDsw5HeHBuw19kT8w6Du9aAI19XE
	kjPLDj9pGHX+frOAUI/HQt7w1w5NeEI21TY7JUgorxnyMv3Urxm9VbqtH64PAFj9fgMf+rfA0Z/KD
	1PFeJWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxM8-000000053QH-1OOf;
	Tue, 10 Sep 2024 09:40:16 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snxM5-000000053PE-0ybr
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 09:40:14 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f761461150so41434331fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Sep 2024 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725961211; x=1726566011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiMIK8K+tyHKozmztV2/CvAPF0ELMWXt09xgTQVIEVU=;
        b=Z8fiLZxhiFG4vSL4mvOQ8u8P3Zkg5CdIvw2FTQ4WRABlJ41vPFqeqVQXUyyw/u8nJA
         NOFah+TXsfKtVT8Mzu2e0ZViAPqlC20lgKWUiUXHwevuywAwwiep5RoBriQ+5ayTImXa
         uYA5HMMhurokQ4RBthIDi/wMfVsxfTbVYG8mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725961211; x=1726566011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LiMIK8K+tyHKozmztV2/CvAPF0ELMWXt09xgTQVIEVU=;
        b=ge/RcbcGTxW5DXIDu4+EHjfZPBF2y+zarYP4th+JUILJuSP9GiyZ6usKizclTuo6EG
         YK7+NVoEW1Z2vutftoypOw2tj0kWM7g5lZHHaAelxPfbksfx2bmtcZwOkBid2tQPPPv5
         gG54EUmccbvVDD4sGAcFLL2QVMU2fKLL6U4/Sa1PwyiO4Ix2Ga70kbz7i9zx7F4d7uxR
         +ajwh0gZId08mPuJO0MrgvRsVp0QZGMprBD8hWagiNRvPYo3FlXnPWGkk/x9xC56RgJ9
         QAdfttdH1hzZm5PNxW/PoI2h1PisGn8l84eDqQTXX209vZBYOp6AbLl/gOCgz3zsszKp
         Zeww==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9x0N+dMoEbNqO/Iep59aeMaeV/N0TXB6s0qiZymlL9HGNJLWxVB+ZfbxIoYyymeLzyk8FM4NOy9jixZvXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl5TjqF78KIGbbTkdoX7afPrk/XhTH6KWREiVdfdY0s1jZ2Z8O
	pYsnbzDDt7dbRPcr+Lm8CEBWkm5mJ7J8Gn3wYwjpznZ2OESCVUhzTmQ849iuu85trwTJMf6VKHo
	LbAyTmV4AgW4nBc4GqkvFgImoOYZZw5L0jRgw
X-Google-Smtp-Source: AGHT+IFVWniz1szQqlEAvk8g6KrRou2Nr2F1RqJkqQy9ONZmeOXzv2coEQAazzrYAJ3S9J3p1AzhEH1YxuZKWYYev7I=
X-Received: by 2002:a05:6512:3ca2:b0:533:45c9:67fe with SMTP id
 2adb3069b0e04-5365880bbbemr13331488e87.48.1725961210575; Tue, 10 Sep 2024
 02:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <01020191db2ac439-4e2dc95a-6323-4f0f-b9fc-c482948018a8-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020191db2ac439-4e2dc95a-6323-4f0f-b9fc-c482948018a8-000000@eu-west-1.amazonses.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 10 Sep 2024 17:39:59 +0800
Message-ID: <CAGXv+5Ff4+HS5_DSTX2U7SaCnZhWMWTN44wr+4_vYNrQQm_mDA@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] drm/mediatek: Add support for OF graphs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
	ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, sui.jingfeng@linux.dev, michael@walle.cc, 
	sjoerd@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_024013_309761_718606EF 
X-CRM114-Status: GOOD (  32.94  )
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

On Tue, Sep 10, 2024 at 5:01=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
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
>  .../arm/mediatek/mediatek,mmsys.yaml.orig     | 140 ++++++++++
>  .../display/mediatek/mediatek,aal.yaml        |  40 +++
>  .../display/mediatek/mediatek,aal.yaml.orig   |  93 +++++++
>  .../display/mediatek/mediatek,ccorr.yaml      |  21 ++
>  .../display/mediatek/mediatek,ccorr.yaml.orig |  88 ++++++
>  .../display/mediatek/mediatek,color.yaml      |  22 ++
>  .../display/mediatek/mediatek,color.yaml.orig |  96 +++++++
>  .../display/mediatek/mediatek,dither.yaml     |  22 ++
>  .../mediatek/mediatek,dither.yaml.orig        |  87 ++++++
>  .../display/mediatek/mediatek,dpi.yaml        |  25 +-
>  .../display/mediatek/mediatek,dpi.yaml.orig   | 122 +++++++++
>  .../display/mediatek/mediatek,dsc.yaml        |  24 ++
>  .../display/mediatek/mediatek,dsi.yaml        |  27 +-
>  .../display/mediatek/mediatek,dsi.yaml.orig   | 126 +++++++++
>  .../display/mediatek/mediatek,ethdr.yaml      |  22 ++
>  .../display/mediatek/mediatek,gamma.yaml      |  19 ++
>  .../display/mediatek/mediatek,gamma.yaml.orig |  96 +++++++
>  .../display/mediatek/mediatek,merge.yaml      |  23 ++
>  .../display/mediatek/mediatek,merge.yaml.orig | 110 ++++++++
>  .../display/mediatek/mediatek,od.yaml         |  22 ++
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  22 ++
>  .../mediatek/mediatek,ovl-2l.yaml.orig        |  78 ++++++
>  .../display/mediatek/mediatek,ovl.yaml        |  22 ++
>  .../display/mediatek/mediatek,ovl.yaml.orig   | 109 ++++++++
>  .../display/mediatek/mediatek,postmask.yaml   |  21 ++
>  .../display/mediatek/mediatek,rdma.yaml       |  22 ++
>  .../display/mediatek/mediatek,rdma.yaml.orig  | 122 +++++++++
>  .../display/mediatek/mediatek,ufoe.yaml       |  21 ++
>  .../display/mediatek/mediatek,wdma.yaml.orig  |  76 ++++++
>  .../bindings/gpu/arm,mali-bifrost.yaml.orig   | 250 +++++++++++++++++
>  .../bindings/leds/leds-mt6323.txt.orig        |  60 +++++
>  .../bindings/ufs/mediatek,ufs.yaml.orig       |  71 +++++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
>  .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  40 ++-
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  21 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 253 +++++++++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  14 +-
>  39 files changed, 2433 insertions(+), 25 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediat=
ek,mmsys.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,aal.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ccorr.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,color.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,dither.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,dpi.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,dsi.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,gamma.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,merge.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ovl-2l.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,ovl.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,rdma.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,wdma.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-bifros=
t.yaml.orig
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.tx=
t.orig
>  create mode 100644 Documentation/devicetree/bindings/ufs/mediatek,ufs.ya=
ml.orig

It looks like you accidentally imported a bunch of files from Git.

ChenYu

>
> --
> 2.46.0
>

