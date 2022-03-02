Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C23C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 23:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjfWPHbx8unO9+qTUp/geqlltTtV4mvTUK7Y9u/ZyVc=; b=CGYoHyaP1/epNJ
	3mjBjnLH1gi887sezklkfDgcN8yOCQvHWirWBcJSaahI8W+xFwH0fbLkmRYi5VvR+P9sghhzf6y9/
	tDnNts3+jo80ANRyFCUibyikHb2+IEfYXFekgCnm7XU+kE14jG64c70AkDXVzXd5Ps8fHBrALQG9A
	CPIByjtun6SrrPi/oXGHXCUrFKIyRy4qPqHD/FX5cYMezKAYat2BhkML6YIkJb4nMvQKJOaiVJY3y
	UzRZqCJz073zF/78G8F/QvCTdDaxL89FHy+iE7iSIg6CIpxPIsT7uTMKt0a2SC0cuQCYClF3YYk39
	4Eaq+w7OulXv0KH6F/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPYm4-004nRD-Kw; Wed, 02 Mar 2022 23:52:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPYkN-004n1p-MG; Wed, 02 Mar 2022 23:51:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47244B82259;
 Wed,  2 Mar 2022 23:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F77DC340F1;
 Wed,  2 Mar 2022 23:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646265064;
 bh=5xLrGpY62nYRCu13K/OIwB4PVpVGnEDLpAk67ymdxVU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eBbSYreyGTVWkKyO4T3IcevV+V+mTuhI76+73sHVV9zMgXVbT5mYyZk0c83VY0z1z
 5aB2yrMvo4nMHSePlUhss7XZwDA+lE4c0gdGQC6Z1gHXEkS4O4G98C9gx6w7aOkIEm
 I1HPlEhl6TcfOnqHU+SnGR7L64iAI26ckTxtQiDryPBQOxD/hze9Xgr8knmWrx6Hb/
 fwdS1M2ENB8fR1RCSiIRxoyzLnKJFwFVXvSJi132Wi1gzuw05JNec5KNDAN/NQ9XWB
 XzicY3bPx6u3SaLhjAQggJ5g7mgw4IHH3R9Q4Uwn2DUFx6hxLMXrQsvrqWZm3LMxFY
 K+Xh0LNtfLFdQ==
Received: by mail-ej1-f45.google.com with SMTP id dr20so7074035ejc.6;
 Wed, 02 Mar 2022 15:51:03 -0800 (PST)
X-Gm-Message-State: AOAM533aXTqbfs1d7hVUkvQPJquuOMsJG/pT2vaAmu5Y1GEBog5K19Yu
 SXgUI2TURc8ys+BcEL4kuao0IG9Rh6DCLpXfjA==
X-Google-Smtp-Source: ABdhPJy8BgFbiNpA6fAc8G8dJGtH6TqNMNEYUYJ0+kAz+CWpXAxOiVbGxTudEMr3eo2aAfAGkSAGo/sKnwcUwjG/P7Y=
X-Received: by 2002:a17:906:af79:b0:6cf:6b3f:5b3b with SMTP id
 os25-20020a170906af7900b006cf6b3f5b3bmr24918369ejb.14.1646265062254; Wed, 02
 Mar 2022 15:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 2 Mar 2022 17:50:50 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
Message-ID: <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
Subject: Re: [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0) support for
 mt8195
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_155108_087253_7BC1B80D 
X-CRM114-Status: GOOD (  29.14  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, nancy.lin@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> Change in v15:
> - remove mt8195-mmsys.h comment for mux settings
> - define the mask macro to replace using value as mask
>   to fix zero mask problem
> - add EOF setting comment for MUTEX sof register
>
> Change in v14:
> - rebase on mediatek-drm-next-5.17
> - rebase on "Add mmsys and mutex support for MDP" series
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=602528
> - rebase on "media: mediatek: support mdp3 on mt8183 platform" series
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=602834
>
> Change in v13:
> - remove dts patch
> - rebase on kernel-5.16-rc1
> - rebase on mediatek-drm-next
>
> Change in v12:
> - add clock-names property to merge yaml
> - using BIT(nr) macro to define the settings of mmsys routing table
> - fix clk_get and clk_prepare_enable error handling issue
>
> Change in v11:
> - rebase on kernel-5.15-rc1
> - change mbox label to gce0 for dts node of vdosys0
> - change ovl compatibale to mt8192 to set smi_id_en=true in driver data
> - move common module from display folder to common folder,
>   such as AAL, COCLOR, CCORR and MUTEX
>
> Change in v10:
> - rebase on "drm/mediatek: add support for mediatek SOC MT8192" series
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=529489
> - rebase on "soc: mediatek: mmsys: add mt8192 mmsys support" series
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=524857
> - fix some typo and "mediatek" start with capital in every dt-bindings
> - move mutex yaml from dfisplay folder to soc folder
> - separate merge additional propoerties to an individual dt-bindings patch
>
> Change in v9:
> - separate power and gce properties of mmsys into another dt-binding patch
> - rebase on "Separate aal module" series
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=516463
> - keep mtk_ddp_clk_enable/disable in the same place
> - change mtk_dsc_start config register to mtk_drm_ddp_write_mask
> - remove the 0 setting of merge fifo config function
> - add CCORR driver data for mt8195
>
> Change in v8:
> - add DP_INTF0 mux into mmsys routing table
> - add DP_INTF0 mutex mod and enum into add/remove comp function
> - remove bypass DSC enum in mtk_ddp_comp_init
>
> Change in v7:
> - add dt=binding of mmsys and disp path into this series
> - separate th modidfication of alphabetic order, remove unused define and
>   rename the define of register offset to individual patch
> - add comment for MERGE ultra and preultra setting
>
> Change in v6:
> - adjust alphabetic order for mediatek-drm
> - move the patch that add mt8195 support for mediatek-drm as
>   the lastest patch
> - add MERGE define for const varriable
>
> Change in v5:
> - add power-domain property into vdosys0 and vdosys1 dts node.
> - add MT8195 prifix and remove unused VDO1 define in mt8195-mmsys.h
>
> Change in v4:
> - extract dt-binding patches to another patch series
>   https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
> - squash DSC module into mtk_drm_ddp_comp.c
> - add coment and simplify MERGE config function
>
> Change in v3:
> - change mmsys and display dt-bindings document from txt to yaml
> - add MERGE additional description in display dt-bindings document
> - fix mboxes-cells number of vdosys0 node in dts
> - drop mutex eof convert define
> - remove pm_runtime apis in DSC and MERGE
> - change DSC and MERGE enum to alphabetic order
>
> Change in v2:
> - add DSC yaml file
> - add mt8195 drm driver porting parts in to one patch
> - remove useless define, variable, structure member and function
> - simplify DSC and MERGE file and switch threre order
>
> jason-jh.lin (12):
>   dt-bindings: arm: mediatek: mmsys: add power and gce properties
>   dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding
>   dt-bindings: display: mediatek: disp: split each block to individual
>     yaml
>   dt-bindings: display: mediatek: dsc: add yaml for mt8195 SoC binding
>   dt-bindings: display: mediatek: merge: add additional prop for mt8195
>   dt-bindings: display: mediatek: add mt8195 SoC binding for vdosys0
>   dt-bindings: arm: mediatek: move out common module from display folder
>   soc: mediatek: add mtk-mmsys support for mt8195 vdosys0
>   soc: mediatek: add mtk-mutex support for mt8195 vdosys0
>   drm/mediatek: add DSC support for mediatek-drm
>   drm/mediatek: add MERGE support for mediatek-drm
>   drm/mediatek: add mediatek-drm of vdosys0 support for mt8195
>
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |  32 ++-
>  .../display/mediatek/mediatek,disp.txt        | 219 ----------------
>  .../display/mediatek/mediatek,dither.yaml     |  76 ++++++
>  .../display/mediatek/mediatek,dsc.yaml        |  71 +++++
>  .../display/mediatek/mediatek,gamma.yaml      |  77 ++++++
>  .../display/mediatek/mediatek,merge.yaml      | 106 ++++++++
>  .../display/mediatek/mediatek,od.yaml         |  53 ++++
>  .../display/mediatek/mediatek,ovl-2l.yaml     |  88 +++++++
>  .../display/mediatek/mediatek,ovl.yaml        | 103 ++++++++
>  .../display/mediatek/mediatek,postmask.yaml   |  69 +++++
>  .../display/mediatek/mediatek,rdma.yaml       | 117 +++++++++
>  .../display/mediatek/mediatek,split.yaml      |  58 +++++
>  .../display/mediatek/mediatek,ufoe.yaml       |  61 +++++
>  .../bindings/soc/mediatek/mediatek,aal.yaml   |  72 +++++
>  .../bindings/soc/mediatek/mediatek,ccorr.yaml |  46 +++-
>  .../bindings/soc/mediatek/mediatek,color.yaml |  81 ++++++
>  .../bindings/soc/mediatek/mediatek,mutex.yaml |  77 ++++++
>  .../bindings/soc/mediatek/mediatek,wdma.yaml  |  47 +++-
>  drivers/gpu/drm/mediatek/Makefile             |   1 +
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   8 +
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c     | 246 ++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |   6 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  63 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  32 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   1 +
>  drivers/soc/mediatek/mt8195-mmsys.h           | 130 +++++++++
>  drivers/soc/mediatek/mtk-mmsys.c              |  11 +
>  drivers/soc/mediatek/mtk-mutex.c              | 103 +++++++-
>  include/linux/soc/mediatek/mtk-mmsys.h        |   9 +
>  30 files changed, 1832 insertions(+), 233 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_merge.c
>  create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

Looks like this is in linux-next and now:

Error: Documentation/devicetree/bindings/display/mediatek/mediatek,aal.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,aal.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,dither.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,dither.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,od.example.dts:24.30-31
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,od.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,color.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,color.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dts:35.50-51
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,split.example.dts:24.35-36
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,split.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,merge.example.dts:27.35-36
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,merge.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.example.dt.yaml]
Error 1
Error: Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.example.dts:27.27-28
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:386:
Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.example.dt.yaml]
Error 1

Please fix 'make dt_binding_check'.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
