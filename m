Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CAFEE6455
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQ/01aew1qXzMNO7SmTHRnfMVx9Y6BAE55dlbg5SypI=; b=V3LXzKyZAcoyYBgI/ECrlZXIiN
	NcO1oieCogFMDM2TN1DfRv+vzMK4jwgzQ1RKmBug3Xpp6ixdJmA0ucY8E4PJ4WLmdCO+benpUNdDI
	DxSylMBZZOm1WQsWjqEyWMpr9R1+Z6JJd7PgymCDC94U/gOa2GzSmTeT2LzQN3sdBjzBmJpC2OejR
	YWhyOdos/ZgBwIMD66kMx+CgTsX7uVRb+gp9oD1FTsPnAK7yylgFhn6edqB4GnGlViype9x9+UJk9
	hHYlrAY0Zy7oSTdnl6lsb9ccZlzChYmxIt8kMfm43D0wb9qo872NPv5t+H+zPZQOR3G4R14g8yhzz
	dnvc/rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh62h-00APxh-2r;
	Fri, 15 Sep 2023 10:27:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh62e-00APwM-09;
	Fri, 15 Sep 2023 10:27:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABF3E6202B;
	Fri, 15 Sep 2023 10:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15EFC433CC;
	Fri, 15 Sep 2023 10:27:10 +0000 (UTC)
Message-ID: <7d882edf-4ae7-4521-a5b2-2781422cff1a@xs4all.nl>
Date: Fri, 15 Sep 2023 12:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/14] add support MDP3 on MT8195 platform
Content-Language: en-US, nl
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230912075805.11432-1-moudy.ho@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230912075805.11432-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_032716_175324_9E4FFC01 
X-CRM114-Status: GOOD (  20.53  )
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

Hi Moudy,

On 12/09/2023 09:57, Moudy Ho wrote:
> Changes since v4:
> - Rebase on v6.6-rc1
> - Remove any unnecessary DTS settings.
> - Adjust the usage of MOD and clock in blending components.
> 
> Changes since v3:
> - Depend on :
>   [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
> - Suggested by Krzysztof, integrating all newly added bindings for
>   the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> - Revise MDP3 nodes with generic names.
> 
> Changes since v2:
> - Depend on :
>   [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>   [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> - Add parallel paths feature.
> - Add blended components settings.
> 
> Changes since v1:
> - Depend on :
>   [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>   [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
> - Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
> 
> Hello,
> 
> This patch is used to add support for MDP3 on the MT8195 platform that
> contains more picture quality components, and can arrange more pipelines
> through two sets of MMSYS and MUTEX respectively.

I ran this series through our build system and I got the following compile warning:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c: In function 'mdp_path_config.isra':
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:449:51: warning: 'ctx' may be used uninitialized [-Wmaybe-uninitialized]
  449 |                         out = CFG_COMP(MT8195, ctx->param, outputs[0]);
      |                                                ~~~^~~~~~~
drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h:137:25: note: in definition of macro 'CFG_COMP'
  137 |         (IS_ERR_OR_NULL(comp) ? 0 : _CFG_COMP(plat, comp, mem))
      |                         ^~~~
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:402:30: note: 'ctx' was declared here
  402 |         struct mdp_comp_ctx *ctx;
      |                              ^~~

And also a few smatch warnings/errors:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:871 wait_wrot_event() warn: variable dereferenced before check 'mdp_cfg' (see line 864)
drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:1024 reset_luma_hist() warn: variable dereferenced before check 'mdp_cfg' (see line 1015)
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:447 mdp_path_config() error: potentially dereferencing uninitialized 'ctx'.
drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c:449 mdp_path_config() error: potentially dereferencing uninitialized 'ctx'.

You can run the same tests yourself, see this announcement:

https://lore.kernel.org/linux-media/18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl/

Regards,

	Hans

> 
> Moudy Ho (14):
>   arm64: dts: mediatek: mt8183: correct MDP3 DMA-related nodes
>   arm64: dts: mediatek: mt8195: add MDP3 nodes
>   media: platform: mtk-mdp3: add support second sets of MMSYS
>   media: platform: mtk-mdp3: add support second sets of MUTEX
>   media: platform: mtk-mdp3: introduce more pipelines from MT8195
>   media: platform: mtk-mdp3: introduce more MDP3 components
>   media: platform: mtk-mdp3: add checks for dummy components
>   media: platform: mtk-mdp3: avoid multiple driver registrations
>   media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
>   media: platform: mtk-mdp3: add support for blending multiple
>     components
>   media: platform: mtk-mdp3: add mt8195 platform configuration
>   media: platform: mtk-mdp3: add mt8195 shared memory configurations
>   media: platform: mtk-mdp3: add mt8195 MDP3 component settings
>   media: platform: mtk-mdp3: add support for parallel pipe to improve
>     FPS
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   6 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 378 ++++++++
>  .../platform/mediatek/mdp3/mdp_cfg_data.c     | 729 ++++++++++++++-
>  .../platform/mediatek/mdp3/mdp_reg_aal.h      |  25 +
>  .../platform/mediatek/mdp3/mdp_reg_color.h    |  31 +
>  .../media/platform/mediatek/mdp3/mdp_reg_fg.h |  23 +
>  .../platform/mediatek/mdp3/mdp_reg_hdr.h      |  31 +
>  .../platform/mediatek/mdp3/mdp_reg_merge.h    |  25 +
>  .../platform/mediatek/mdp3/mdp_reg_ovl.h      |  25 +
>  .../platform/mediatek/mdp3/mdp_reg_pad.h      |  21 +
>  .../platform/mediatek/mdp3/mdp_reg_rdma.h     |  24 +
>  .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   2 +
>  .../platform/mediatek/mdp3/mdp_reg_tdshp.h    |  34 +
>  .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   8 +
>  .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++
>  .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
>  .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   2 +
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 447 +++++++--
>  .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 860 +++++++++++++++++-
>  .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  93 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 103 ++-
>  .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  33 +-
>  .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  15 +
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  18 +
>  .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   1 +
>  .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |   3 +-
>  27 files changed, 3051 insertions(+), 174 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
>  create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
> 


