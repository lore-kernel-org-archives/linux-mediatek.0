Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D29C47DDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 10:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4GCbKfYyD6ptgAm+sXKVmXZcenmRjeT8moSc4KEcTk=; b=whEYHhHvT1aRAg
	y6LZQwBrUmMkAMmre8hprd5nA71oDJuvo/GDRrthQI/DDF4U+2oH/863s5VBSVInqEs87o/GBSVvD
	fSzzaxZcDjLkHedc8EuOuBXLgSXDhJ5zLY+0enQy1dlC8Rm3qJ5JqekaxsAHdkeQKy8gm+44zpyAs
	H7UwpGEZxpMneu8zbutggcOGqe3fWHzLJLpagP+LL0+jj2ntNSszbg9h+7txwrklPohdwpaR1qefn
	ko5xf5Abcy90EWQH8sRKZl5mD/XrsaRlbOu9mqj5Mj4PqdT74ozHhRXGdp8i3AtAbKGJPeEPO9AW6
	mMPASozKTi/JOicTkbLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVU7q-00000007QAU-0AQy;
	Thu, 01 Feb 2024 10:16:54 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVU7m-00000007Q83-129g;
	Thu, 01 Feb 2024 10:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706782607;
	bh=o1wVIMmJ520BEQsqM1zAURXL/Zn0xmObwP0BDMXU0tE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OyN24PAmgPssyDz6LNpoS4vKe68IhaXzpboE/QWs9lBIfLX3OKEG0tWptllPgBmXe
	 5wbN1U84A9sgPBUaw7OG1MKf3+2nED7MU9/1HmNvwZziLcV+umKeH3o1GyXpS+dcIJ
	 kZfE069dG1fXd3nautF8hE8Fz6WmkMob3LfE1PBks0EYWXhQ/R3h4bCl+OxphF/jXU
	 FM68yojo/8cYHUrfFi8eJHbz3uqQqkHBCi9JqCCjTAEbxgpvm1+fcmr7cFIU0aptss
	 uadO8A5LRV7aLlTCn4TDCyl3CQxdN0ZWDtWFI3E+tR7lTNv1bpB0PRrbeVOecoJUVc
	 vzIPOyvY3HKBg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BC29E3782081;
	Thu,  1 Feb 2024 10:16:46 +0000 (UTC)
Message-ID: <488c6f38-02c6-4e62-b90b-d2ac112541ae@collabora.com>
Date: Thu, 1 Feb 2024 11:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] Support IGT in display driver
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-1-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_021650_471791_E5331FF5 
X-CRM114-Status: GOOD (  21.68  )
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> This series is based on mediatek-drm-next.
> 
> This series adds support for running IGT (Intel GPU Tool) tests
> with MediaTek display driver. The following changes will be
> applied:
> 
> 1. Add a new API for creating GCE thread loop to retrieve CRCs
>     from the hardware component
> 2. Support hardware CRC calculation in both VDOSYS0 and VDOSYS1
> 3. Support alpha blending in both VDOSYS0 and VDOSYS1
> 

Hello,
is there still interest in upstreaming this?

We're interested in enabling more comprehensive IGT tests on MediaTek SoCs
and this series is definitely useful.

Regards,
Angelo

> Changes in v4:
> - Seperate the patch into smaller ones
> - Change the title of some patches
> - Revert the changes that are not related to the series
> 
> Changes in v3:
> - Modify the dt-binding document of Mediatek OVL
> - Set DRM mode configs accroding to the hardware capabilities
> - Replace cmdq_pkt_jump_absolute() with cmdq_pkt_jump()
> 
> Changes in v2:
> - Simplify CMDQ by adding commands that are currently used only
> - Integrate CRC related codes into new APIs for Mixer and OVL to reuse
> - Add CPU version CRC retrieval when CMDQ is disabled
> 
> Hsiao Chien Sung (17):
>    soc: mediatek: Add register definitions for GCE
>    soc: mediatek: Disable 9-bit alpha in ETHDR
>    dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188
>    drm/mediatek: Add OVL compatible name for MT8195
>    drm/mediatek: Set DRM mode configs accordingly
>    drm/mediatek: Support alpha blending in OVL
>    drm/mediatek: Support alpha blending in Mixer
>    drm/mediatek: Support alpha blending in display driver
>    drm/mediatek: Support CSC in OVL
>    drm/mediatek: Support more color formats in OVL
>    drm/mediatek: Turn off the layers with zero width or height
>    drm/mediatek: Support CRC in display driver
>    drm/mediatek: Support CRC in OVL
>    drm/mediatek: Support CRC in OVL adaptor
>    drm/mediatek: Add missing plane settings when async update
>    drm/mediatek: Fix errors when reporting rotation capability
>    drm/mediatek: Add comments for the structures
> 
>   .../display/mediatek/mediatek,ovl.yaml        |  12 +-
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   7 +
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 326 +++++++++++++++---
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  32 +-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 261 +++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h       |  39 +++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |   7 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  35 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  30 +-
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |  16 +
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c      |  15 +-
>   drivers/gpu/drm/mediatek/mtk_ethdr.c          | 106 +++++-
>   drivers/gpu/drm/mediatek/mtk_ethdr.h          |   5 +
>   drivers/soc/mediatek/mtk-mmsys.c              |   1 +
>   include/linux/soc/mediatek/mtk-cmdq.h         |  10 +
>   15 files changed, 834 insertions(+), 68 deletions(-)
> 
> --
> 2.18.0
> 



