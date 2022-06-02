Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 04:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=du4v6sgY25vzOFiPwR7mzc67bWNdQxr4UZh93EdjBwY=; b=wwJ01RxgVyEfH9
	L5nvK2IGfB+t2O0Y+ciQcng/NvoBklKPxwglr8EJn6+Bk4K4Ka7hvCO0vFIRffiqAQyJwcJJhonR2
	s/BM2CHmDgFKORQhe23VHYhqJcq/zs0CLaFDQL55UbYz5F3DyGLTNEM+8Ecd+JFFBMa3k+n4ZJlXS
	3qisoNFZtCsne5sk9Fo+XVYKnM6/ePGIBTV2iv6iAW8yvAlPRaoaCUN6CDbkPbAupOaxcoHZ4hEY3
	EzDopddw+xtBkZz8pOHeWSmaImm78fJJtuLka8fZFCZ2O6hnXjSY8drbg5itHPjy/U2jiEXXaBhyC
	SCASkboWkk2fSz0IwhMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwc11-001JWj-4K; Thu, 02 Jun 2022 04:00:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwc0h-001JSa-6p; Thu, 02 Jun 2022 04:00:36 +0000
X-UUID: fafa8720c2184edc8fc8b8bb20a75b2f-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6b302013-5ab1-47ed-b525-e771c36e42cf,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:050c8d0d-3a0d-4bbe-9d72-0e5d26d57423,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: fafa8720c2184edc8fc8b8bb20a75b2f-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 367703003; Wed, 01 Jun 2022 21:00:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 20:50:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 11:50:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 11:50:00 +0800
Message-ID: <358b183faed73672e8fa4f6eb0d48fb067aec87d.camel@mediatek.com>
Subject: Re: [PATCH v10 00/21] drm/mediatek: Add mt8195 DisplayPort driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>, Jitao shi
	<jitao.shi@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <maxime@cerno.tech>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>
Date: Thu, 2 Jun 2022 11:50:00 +0800
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_210035_284335_C8A2FAB7 
X-CRM114-Status: GOOD (  31.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> this series is built around the DisplayPort driver. The dpi/dpintf
> driver and the added helper functions are required for the
> DisplayPort
> driver to work.
> 
> This v10 still has some un-answered comments and TODOs for v11.
> 
> This has been tested sucessfully on a 5.18-next based "vendor
> branch".
> 
> There's a missing dependency in the mediatek clock framework to allow
> a
> mux clock to change it's parent automatically on rate change.
> Without this change, the dpi driver won't properly set the clocks on
> mode change and thus nothing will be displayed on screen.
> 
> Changes from v9:
> - The DP-Phy is back to being a child device of the DP driver (as in
> v8)
> - hot plug detection has been added back to Embedded Display Port...
> as
>   after discussing with mediatek experts, this is needed eventhough
> the
>   Embedded Display port is not un-pluggable
> - rebased on linux-next
> - simplified/split train_handler function, as suggested by Rex
> - added comments on the sleep/delays present in the code
> - removed previous patch introducing retries when receiving AUX_DEFER
> as
>   this is already handled in the dp_aux framework
> - added max-lane and max-linkrate device tree u8 properties instead
> of
>   hardcoded #defines
> 
> Things that are in my todolist for v11:
> - retrieve CK/DE support from panel driver instead of hardcoding it
> into
>   the dpi driver
> - refcount the dp driver "enabled" status for "future proofing"
> - review the drm_dp_helpers for features/functions that have been
>   re-implemented in the mediatek dp drivers
> 
> Older revisions:
> RFC - 
> https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
> v1  - 
> https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
> v2  - 
> https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
> v3  - 
> https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
> v4  - 
> https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
> v5  - 
> https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
> v6  - 
> https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/
> v7  - 
> https://lore.kernel.org/linux-mediatek/20211217150854.2081-1-granquet@baylibre.com/
> v8  - 
> https://lore.kernel.org/linux-mediatek/20220218145437.18563-1-granquet@baylibre.com/
> v9  - 
> https://lore.kernel.org/all/20220327223927.20848-1-granquet@baylibre.com/
> 
> Functional dependencies are:
> - Add Mediatek Soc DRM (vdosys0) support for mt8195
>   
> https://lore.kernel.org/linux-mediatek/20220419094143.9561-2-jason-jh.lin@mediatek.com/
> - Add MediaTek SoC DRM (vdosys1) support for mt8195
>   
> https://lore.kernel.org/linux-mediatek/20220512053128.31415-1-nancy.lin@mediatek.com/
> 
> 
> Guillaume Ranquet (15):
>   drm/edid: Convert cea_sad helper struct to kernelDoc
>   drm/edid: Add cea_sad helpers for freq/length
>   drm/mediatek: dpi: move dpi limits to SoC config
>   drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
>   drm/mediatek: dpi: implement a swap_input toggle in SoC config
>   drm/mediatek: dpi: move dimension mask to SoC config
>   drm/mediatek: dpi: move hvsize_mask to SoC config
>   drm/mediatek: dpi: move swap_shift to SoC config
>   drm/mediatek: dpi: move the yuv422_en_bit to SoC config
>   drm/mediatek: dpi: move the csc_enable bit to SoC config
>   drm/mediatek: dpi: Add dpintf support
>   drm/mediatek: dpi: Only enable dpi after the bridge is enabled
>   drm/meditek: dpi: Add matrix_sel helper
>   drm/mediatek: Add mt8195 External DisplayPort support
>   drm/mediatek: DP audio support for mt8195
> 
> Jitao Shi (1):
>   drm/mediatek: add hpd debounce
> 
> Markus Schneider-Pargmann (5):
>   dt-bindings: mediatek,dpi: Add DPINTF compatible
>   dt-bindings: mediatek,dp: Add Display Port binding
>   video/hdmi: Add audio_infoframe packing for DP
>   phy: phy-mtk-dp: Add driver for DP phy
>   drm/mediatek: Add mt8195 Embedded DisplayPort driver
> 
>  .../display/mediatek/mediatek,dp.yaml         |   99 +
>  .../display/mediatek/mediatek,dpi.yaml        |   13 +-
>  MAINTAINERS                                   |    1 +
>  drivers/gpu/drm/drm_edid.c                    |   74 +
>  drivers/gpu/drm/mediatek/Kconfig              |    8 +
>  drivers/gpu/drm/mediatek/Makefile             |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c             | 3419
> +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  570 +++
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  272 +-
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    8 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    8 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    3 +
>  drivers/phy/mediatek/Kconfig                  |    8 +
>  drivers/phy/mediatek/Makefile                 |    1 +
>  drivers/phy/mediatek/phy-mtk-dp.c             |  200 +
>  drivers/video/hdmi.c                          |   82 +-
>  include/drm/dp/drm_dp_helper.h                |    2 +
>  include/drm/drm_edid.h                        |   26 +-
>  include/linux/hdmi.h                          |    7 +-
>  include/linux/soc/mediatek/mtk-mmsys.h        |    4 +-
>  22 files changed, 4765 insertions(+), 81 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

Hello all,

Due to the resource issue, I will keep upstreaming Guillaume's MT8195
dp/edp series.

I will check the comments for v8/v9/v10 and have some discussion with
you.

Thanks for your all comments.

BRs,
Bo-Chen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
