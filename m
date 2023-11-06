Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26E5C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 12:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBiZ40+L8OaKbN2XyU0U37YHmdlHtpq55WRGb60TjvI=; b=AvdDB9xr1cBK5SUXQwGgFnSyRA
	XPEdu/W4+uTjrmJMGJ/F+k0LZwbJYX0p6QbFckw0htFOEX+IjHU1MoVVLNjf3NL8BpH3qB6o1rft7
	DSInTiBzpImFhnglSwetKe96RLJZjV4YkFuXM7qnDIZv3io/OPULGCj31XcedySChCq48ifv0/R9C
	va9vpPSYjCTaXpwrlaTv/PO6+X+k9tGGaL0kKFaG8yER3pzqFhkANgLSQg+eWM11vcXQQYe6V/C4x
	ZdptsB+NTw1D9n1eX4qpzUasMAU9y0AcY/lf+9I/73q/qMCwX1zgNeROXAzeobMdO2idb94b4m+v5
	eiRCQYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyym-00GfaX-13;
	Mon, 06 Nov 2023 12:45:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzyyi-00GfVj-1w;
	Mon, 06 Nov 2023 12:45:18 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E4F03660748D;
	Mon,  6 Nov 2023 12:45:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699274715;
	bh=IZ5sRu5ZB8QlbMlKzbR2HpoB5MIw6ONqWmWF6csTMas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Az2KZY+o+wvZ9fBcZcv9AIiSZ99w7vR7RAcnpC5akxEst/P8HePevq+ZcVYM5tdrT
	 gIcdpKjOAW1aIcmMlSFF6UxjMqaMLWV2ESSjmtotMgpPnO3ztaYU1IU7BkyIZttpVF
	 ziL80JQb4wMnXB4TIpjwVMaMuSh6EW+KrMCzmp6+y35ElBPOhnGBG+dsM4scfcyYPO
	 lFnuAJjMig+H8Ghz1Q80vmXaoJU6r313uIEIKoeII+TPlK1sjA/0HCYa3KMdhrZ8pr
	 S8xqhf+zbQt8gv0AYjn34/s+wrESl+LLcS9/qwb4yJU3XNAv8ND0W0cMkypPx/m74V
	 XarvBsrDC+8yA==
Message-ID: <813b3a54-f973-410f-950b-d99f6e563f1f@collabora.com>
Date: Mon, 6 Nov 2023 13:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/12] add support MDP3 on MT8195 platform
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231030100626.12564-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_044516_899991_EA74EA44 
X-CRM114-Status: GOOD (  19.72  )
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

Il 30/10/23 11:06, Moudy Ho ha scritto:
> Changes since v7:
> - Rebase on linux-next.
> - Dependent dtsi files:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=797543
> - Dependent bindings:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=797555
> - Patch [9/12] has made corresponding adjustments in response to the changes in
>    the compatible name of the PAD component in DTSI and binding.
> - Adding WROT compatible name in the MDP driver's of_match_table in [9/12] to
>    avoid deactivating 'pm_runtime_*' functions.
> 

On MT8195 Cherry Tomato Chromebook, whole series is

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Changes since v6:
> - Rebase on v6.6-rc5.
> - Dependent dtsi files:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=792079
> - Dependent bindings:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=792477
> - Move the patch that fixes compile warnings from this series and
>    create a separate standalone patch.
> 
> Changes since v5:
> - Rebase on v6.6-rc2.
> - Dependent dtsi files:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=786511
> - Dependent bindings:
>    https://patchwork.kernel.org/project/linux-mediatek/list/?series=786520
> - Integrate MMSY/MUTEX structure in "mdp_probe".
> - Fix the build warnings that were detected by the linux-media
>    build scripts tool.
> 
> Changes since v4:
> - Rebase on v6.6-rc1
> - Remove any unnecessary DTS settings.
> - Adjust the usage of MOD and clock in blending components.
> 
> Changes since v3:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
> - Suggested by Krzysztof, integrating all newly added bindings for
>    the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
> - Revise MDP3 nodes with generic names.
> 
> Changes since v2:
> - Depend on :
>    [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>    [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
> - Suggested by Rob to revise MDP3 bindings to pass dtbs check
> - Add parallel paths feature.
> - Add blended components settings.
> 
> Changes since v1:
> - Depend on :
>    [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>    [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
> - Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
> 
> Hello,
> 
> This patch is used to add support for MDP3 on the MT8195 platform that
> contains more picture quality components, and can arrange more pipelines
> through two sets of MMSYS and MUTEX respectively.
> 
> Moudy Ho (12):
>    media: platform: mtk-mdp3: add support second sets of MMSYS
>    media: platform: mtk-mdp3: add support second sets of MUTEX
>    media: platform: mtk-mdp3: introduce more pipelines from MT8195
>    media: platform: mtk-mdp3: introduce more MDP3 components
>    media: platform: mtk-mdp3: add checks for dummy components
>    media: platform: mtk-mdp3: avoid multiple driver registrations
>    media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
>    media: platform: mtk-mdp3: add support for blending multiple
>      components
>    media: platform: mtk-mdp3: add mt8195 platform configuration
>    media: platform: mtk-mdp3: add mt8195 shared memory configurations
>    media: platform: mtk-mdp3: add mt8195 MDP3 component settings
>    media: platform: mtk-mdp3: add support for parallel pipe to improve
>      FPS
> 
>   .../platform/mediatek/mdp3/mdp_cfg_data.c     | 729 +++++++++++++-
>   .../platform/mediatek/mdp3/mdp_reg_aal.h      |  25 +
>   .../platform/mediatek/mdp3/mdp_reg_color.h    |  31 +
>   .../media/platform/mediatek/mdp3/mdp_reg_fg.h |  23 +
>   .../platform/mediatek/mdp3/mdp_reg_hdr.h      |  31 +
>   .../platform/mediatek/mdp3/mdp_reg_merge.h    |  25 +
>   .../platform/mediatek/mdp3/mdp_reg_ovl.h      |  25 +
>   .../platform/mediatek/mdp3/mdp_reg_pad.h      |  21 +
>   .../platform/mediatek/mdp3/mdp_reg_rdma.h     |  24 +
>   .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   2 +
>   .../platform/mediatek/mdp3/mdp_reg_tdshp.h    |  34 +
>   .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   8 +
>   .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++
>   .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
>   .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   2 +
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 440 +++++++--
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   1 +
>   .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 895 +++++++++++++++++-
>   .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  93 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 139 ++-
>   .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  50 +-
>   .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  15 +
>   .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  18 +
>   .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   1 +
>   .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |   3 +-
>   25 files changed, 2744 insertions(+), 178 deletions(-)
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
>   create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
> 


