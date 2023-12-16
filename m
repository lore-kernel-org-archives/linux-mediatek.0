Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F19C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Dec 2023 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYXpgaQFZ5S+BMfBxeIHEuMlKrlgZxownhVItmPP2YI=; b=z3VBaBK5PugV1EsC2zt96gedaP
	Dh9/3JRQ0JgUp5nmuKr7kUDVHFswfNaW6VM27jJZf0CK5sMNe3OvcL8v28+OLYMjQPOyvbT2artQB
	rnizbir2KsbYTkFm4H0sBOl/AOHQwn5YtV+QrlGw/akZQ0Czi3kLVX8U2+fiBOo9f/mccnEQvEkW1
	bR1NjUeDb7VDkexlteV40WMdIo4evWRXQ1DOJwYlzGwu08pYGaDh+4yZW1hh3gP+N8ywML22uAqzA
	/e14eiHJU0ntVY5rWqXwDcrHaG9NLNI/pgIxShk6tyan7VxthjxTC0TaQl+TSh35xeoo+o0SHRw6A
	UPR36PAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEOSB-005bhK-3D;
	Sat, 16 Dec 2023 06:47:16 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEOS6-005beS-2f;
	Sat, 16 Dec 2023 06:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702709225;
	bh=hOlNrL4DGi2cD4PMnB8p+gC4Zp2KSXfuHJBo1h8i+7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJX9meyu2VD03BC4Dc5OJ/5zEYAj9IOgeMpuTCD5RDkHWNLb1rMyZzkg0K7AQXFi5
	 JgWOb/Rknet9LBLDIfXbfPWpIssrOs1Q1wBeyG+sGxqqYkAdIy0F8G5oW2etoZlxgR
	 jhJyRnFDhb4JYD5j8lAvl4doP6vZd1wjwm5WQwJKucQL2O2d/UyjOKavOoN4FHcAj2
	 mDx6qUufGKQAGFsrFRMIhimxh5F9kW7iLxXb/kvDhHLViHkzhRUfFYfmzpaiflMdnt
	 vEZ5ttFUZHFLUNGa00n+sOqdFl5SW6Edrmrd299MPSAI++S7fGhD76TkGRHSgmMYLy
	 q9UyTU5QWCngg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3488637811D2;
	Sat, 16 Dec 2023 06:47:05 +0000 (UTC)
Date: Sat, 16 Dec 2023 07:47:03 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 00/12] add support MDP3 on MT8195 platform
Message-ID: <20231216064703.tb7vf3m2ohrbz6px@basti-XPS-13-9310>
References: <20231030100626.12564-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231030100626.12564-1-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_224711_057771_1E9CC2FB 
X-CRM114-Status: GOOD (  19.42  )
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

Hey Moudy Ho,

just as a quick note, as this series is based on linux-next, we will
wait for the patches, that this series is depending on, to be merged into
the media_stage repository (https://git.linuxtv.org/media_stage.git/),
before we merge this series into the media subsystem.

Greetings,
Sebastian

On 30.10.2023 18:06, Moudy Ho wrote:
>Changes since v7:
>- Rebase on linux-next.
>- Dependent dtsi files:
>  https://patchwork.kernel.org/project/linux-mediatek/list/?series=797543
>- Dependent bindings:
>  https://patchwork.kernel.org/project/linux-mediatek/list/?series=797555
>- Patch [9/12] has made corresponding adjustments in response to the changes in
>  the compatible name of the PAD component in DTSI and binding.
>- Adding WROT compatible name in the MDP driver's of_match_table in [9/12] to
>  avoid deactivating 'pm_runtime_*' functions.
>
>Changes since v6:
>- Rebase on v6.6-rc5.
>- Dependent dtsi files:
>  https://patchwork.kernel.org/project/linux-mediatek/list/?series=792079
>- Dependent bindings:
>  https://patchwork.kernel.org/project/linux-mediatek/list/?series=792477
>- Move the patch that fixes compile warnings from this series and
>  create a separate standalone patch.
>
>Changes since v5:
>- Rebase on v6.6-rc2.
>- Dependent dtsi files:
>  https://patchwork.kernel.org/project/linux-mediatek/list/?series=786511
>- Dependent bindings:
>  https://patchwork.kernel.org/project/linux-mediatek/list/?series=786520
>- Integrate MMSY/MUTEX structure in "mdp_probe".
>- Fix the build warnings that were detected by the linux-media
>  build scripts tool.
>
>Changes since v4:
>- Rebase on v6.6-rc1
>- Remove any unnecessary DTS settings.
>- Adjust the usage of MOD and clock in blending components.
>
>Changes since v3:
>- Depend on :
>  [1] https://patchwork.kernel.org/project/linux-media/list/?series=719841
>- Suggested by Krzysztof, integrating all newly added bindings for
>  the mt8195 MDP3 into the file "mediatek,mt8195-mdp3.yaml".
>- Revise MDP3 nodes with generic names.
>
>Changes since v2:
>- Depend on :
>  [1] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711592
>  [2] MDP3: https://patchwork.kernel.org/project/linux-mediatek/list/?series=711618
>- Suggested by Rob to revise MDP3 bindings to pass dtbs check
>- Add parallel paths feature.
>- Add blended components settings.
>
>Changes since v1:
>- Depend on :
>  [1] MDP3 : https://patchwork.kernel.org/project/linux-mediatek/list/?series=698872
>  [2] MMSYS/MUTEX: https://patchwork.kernel.org/project/linux-mediatek/list/?series=684959
>- Fix compilation failure due to use of undeclared identifier in file "mtk-mdp3-cmdq.c"
>
>Hello,
>
>This patch is used to add support for MDP3 on the MT8195 platform that
>contains more picture quality components, and can arrange more pipelines
>through two sets of MMSYS and MUTEX respectively.
>
>Moudy Ho (12):
>  media: platform: mtk-mdp3: add support second sets of MMSYS
>  media: platform: mtk-mdp3: add support second sets of MUTEX
>  media: platform: mtk-mdp3: introduce more pipelines from MT8195
>  media: platform: mtk-mdp3: introduce more MDP3 components
>  media: platform: mtk-mdp3: add checks for dummy components
>  media: platform: mtk-mdp3: avoid multiple driver registrations
>  media: platform: mtk-mdp3: extend GCE event waiting in RDMA and WROT
>  media: platform: mtk-mdp3: add support for blending multiple
>    components
>  media: platform: mtk-mdp3: add mt8195 platform configuration
>  media: platform: mtk-mdp3: add mt8195 shared memory configurations
>  media: platform: mtk-mdp3: add mt8195 MDP3 component settings
>  media: platform: mtk-mdp3: add support for parallel pipe to improve
>    FPS
>
> .../platform/mediatek/mdp3/mdp_cfg_data.c     | 729 +++++++++++++-
> .../platform/mediatek/mdp3/mdp_reg_aal.h      |  25 +
> .../platform/mediatek/mdp3/mdp_reg_color.h    |  31 +
> .../media/platform/mediatek/mdp3/mdp_reg_fg.h |  23 +
> .../platform/mediatek/mdp3/mdp_reg_hdr.h      |  31 +
> .../platform/mediatek/mdp3/mdp_reg_merge.h    |  25 +
> .../platform/mediatek/mdp3/mdp_reg_ovl.h      |  25 +
> .../platform/mediatek/mdp3/mdp_reg_pad.h      |  21 +
> .../platform/mediatek/mdp3/mdp_reg_rdma.h     |  24 +
> .../platform/mediatek/mdp3/mdp_reg_rsz.h      |   2 +
> .../platform/mediatek/mdp3/mdp_reg_tdshp.h    |  34 +
> .../platform/mediatek/mdp3/mdp_reg_wrot.h     |   8 +
> .../platform/mediatek/mdp3/mdp_sm_mt8195.h    | 283 ++++++
> .../platform/mediatek/mdp3/mtk-img-ipi.h      |   4 +
> .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     |   2 +
> .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 440 +++++++--
> .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |   1 +
> .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 895 +++++++++++++++++-
> .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  93 +-
> .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 139 ++-
> .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  50 +-
> .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     |  15 +
> .../platform/mediatek/mdp3/mtk-mdp3-regs.c    |  18 +
> .../platform/mediatek/mdp3/mtk-mdp3-regs.h    |   1 +
> .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |   3 +-
> 25 files changed, 2744 insertions(+), 178 deletions(-)
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_aal.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_color.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_fg.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_hdr.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_merge.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_ovl.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_pad.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_reg_tdshp.h
> create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_sm_mt8195.h
>
>-- 
>2.18.0
>

