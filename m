Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8730EC3271F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of5/hG3NJFnyDz8fU+pCsdTaz30Z8DMP81wuZSTZgwY=; b=2TXLfl391tztUQ0Vbyqy4zWstx
	N7M/9FOY9IQ9fTgslKXaojXBEwNE3hb7CY23nHQ4AxOsq1CWPphk0moCHrO6ypvdFBVieNKzoktNe
	9l8dqyWGV35MIdns3EWp8c02KhaK+lnIaid67DXxVr68awvrTgcaUox+gS/k8j/sQp8LujQtQm5CA
	KDgcWwLMfw0q8aHOYVfZAepAU7uTzoyAOsQ4pbfE3nwUEEfIQ3qJKpzvit4yca2XryPL40oUH3t3P
	jvFDdCpaPCp+JxArHY71HBD++rRD1qT+LeWLB2WBvNl0Zfwz9WPeIR7Ofn9TQFnOySJOaxXx8477l
	xH+bta5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHqO-0000000Car4-3fnh;
	Thu, 04 Jul 2024 08:29:32 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHqB-0000000CanQ-1mp7;
	Thu, 04 Jul 2024 08:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720081757;
	bh=Xb9OqD6+/GVH8qm9unNArS1YsYFfzvBFA8JRozIjq00=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ehsEEhNJQ0rXa07J/rGAoOdSDWbfq1DcRdGCdH+ZSSy60uLKLkddciUgPcfBGtmxQ
	 RRuLqNARft/KWI0Vb5HW27m2M5ZfcKEOOEgTaB5uH3Ro8pyCS3BNwTbc9SVjV30wsQ
	 /qzRamrV22MuHFsZXiPk+OSKag45LzxgFYAK60OojJ5MHdEZ89TYkrOrRnKxxMkr8j
	 HWAV8zU9j7u5RDt2ZSxN9jvcyDmFXWTSGDrVMn97jEksK8wJdgvsZuEDbR0Qt3tjJL
	 ud17H2kmKDsqiMgb9zk5HH+Sgvu4o82cFAsWNnWA5ZrJfHCtG0EZFLjewKOTWQN/S4
	 TKCMRmdfI1jxg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EA8F337821A8;
	Thu,  4 Jul 2024 08:29:15 +0000 (UTC)
Message-ID: <eef10e9f-dac5-4a05-a79c-f8026f27f051@collabora.com>
Date: Thu, 4 Jul 2024 10:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] drm/mediatek: Add support for OF graphs
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org, ck.hu@mediatek.com
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev,
 michael@walle.cc
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
 <d84f1469-e82a-42de-94a0-8ee0da0cba02@collabora.com>
Content-Language: en-US
In-Reply-To: <d84f1469-e82a-42de-94a0-8ee0da0cba02@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_012919_630566_BAC01C46 
X-CRM114-Status: GOOD (  30.25  )
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

Il 19/06/24 12:56, AngeloGioacchino Del Regno ha scritto:
> Il 18/06/24 12:17, AngeloGioacchino Del Regno ha scritto:
>> Changes in v8:
>>   - Rebased on next-20240617
>>   - Changed to allow probing a VDO with no available display outputs
>>
> 
> Hello CK,
> 
> At the time of writing, this series was well reviewed and tested by multiple people
> on multiple SoCs and boards.
> 
> We've got a bunch of series that are waiting for this to get upstreamed, including
> the addition of support for MT8365-EVK (already on mailing lists), MT8395 Radxa
> NIO 12L, MT8395 Kontron SBC i1200 (not on mailing lists yet, waiting for this to
> get merged), other than some other conversion commits for other MediaTek DTs from
> myself.
> 
> As for the MT8195/NIO12L commits, I'm planning to send them on the lists tomorrow,
> along with some code to properly support devicetree overlays (DTBO) generation for
> MediaTek boards.
> 
> Alexandre tested it on MT8365-EVK;
> Michael tested on Kontron SBC-i1200;
> I tested on Radxa NIO-12L, Cherry Tomato Chromebook, MT6795 Sony Xperia
> M5 (dsi video panel) smartphone and MT8192 Asurada Chromebook.
> 
> So, is there anything else to address on this, or can we proceed?
> 

Gentle ping

Regards,
Angelo

> Many thanks,
> Angelo
> 
>> Changes in v7:
>>   - Fix typo in patch 3/3
>>
>> Changes in v6:
>>   - Added EPROBE_DEFER check to fix dsi/dpi false positive DT fallback case
>>   - Dropped refcount of ep_out in mtk_drm_of_get_ddp_ep_cid()
>>   - Fixed double refcount drop during path building
>>   - Removed failure upon finding a DT-disabled path as requested
>>   - Tested again on MT8195, MT8395 boards
>>
>> Changes in v5:
>>   - Fixed commit [2/3], changed allOf -> anyOf to get the
>>     intended allowance in the binding
>>
>> Changes in v4:
>>   - Fixed a typo that caused pure OF graphs pipelines multiple
>>     concurrent outputs to not get correctly parsed (port->id);
>>   - Added OVL_ADAPTOR support for OF graph specified pipelines;
>>   - Now tested with fully OF Graph specified pipelines on MT8195
>>     Chromebooks and MT8395 boards;
>>   - Rebased on next-20240516
>>
>> Changes in v3:
>>   - Rebased on next-20240502 because of renames in mediatek-drm
>>
>> Changes in v2:
>>   - Fixed wrong `required` block indentation in commit [2/3]
>>
>>
>> The display IPs in MediaTek SoCs are *VERY* flexible and those support
>> being interconnected with different instances of DDP IPs (for example,
>> merge0 or merge1) and/or with different DDP IPs (for example, rdma can
>> be connected with either color, dpi, dsi, merge, etc), forming a full
>> Display Data Path that ends with an actual display.
>>
>> This series was born because of an issue that I've found while enabling
>> support for MT8195/MT8395 boards with DSI output as main display: the
>> current mtk_drm_route variations would not work as currently, the driver
>> hardcodes a display path for Chromebooks, which have a DisplayPort panel
>> with DSC support, instead of a DSI panel without DSC support.
>>
>> There are other reasons for which I wrote this series, and I find that
>> hardcoding those paths - when a HW path is clearly board-specific - is
>> highly suboptimal. Also, let's not forget about keeping this driver from
>> becoming a huge list of paths for each combination of SoC->board->disp
>> and... this and that.
>>
>> For more information, please look at the commit description for each of
>> the commits included in this series.
>>
>> This series is essential to enable support for the MT8195/MT8395 EVK,
>> Kontron i1200, Radxa NIO-12L and, mainly, for non-Chromebook boards
>> and Chromebooks to co-exist without conflicts.
>>
>> Besides, this is also a valid option for MT8188 Chromebooks which might
>> have different DSI-or-eDP displays depending on the model (as far as I
>> can see from the mtk_drm_route attempt for this SoC that is already
>> present in this driver).
>>
>> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
>> NIO-12L with both hardcoded paths, OF graph support and partially
>> hardcoded paths, and pure OF graph support including pipelines that
>> require OVL_ADAPTOR support.
>>
>> AngeloGioacchino Del Regno (3):
>>    dt-bindings: display: mediatek: Add OF graph support for board path
>>    dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
>>    drm/mediatek: Implement OF graphs support for display paths
>>
>>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |  28 ++
>>   .../display/mediatek/mediatek,aal.yaml        |  40 +++
>>   .../display/mediatek/mediatek,ccorr.yaml      |  21 ++
>>   .../display/mediatek/mediatek,color.yaml      |  22 ++
>>   .../display/mediatek/mediatek,dither.yaml     |  22 ++
>>   .../display/mediatek/mediatek,dpi.yaml        |  25 +-
>>   .../display/mediatek/mediatek,dsc.yaml        |  24 ++
>>   .../display/mediatek/mediatek,dsi.yaml        |  27 +-
>>   .../display/mediatek/mediatek,ethdr.yaml      |  22 ++
>>   .../display/mediatek/mediatek,gamma.yaml      |  19 ++
>>   .../display/mediatek/mediatek,merge.yaml      |  23 ++
>>   .../display/mediatek/mediatek,od.yaml         |  22 ++
>>   .../display/mediatek/mediatek,ovl-2l.yaml     |  22 ++
>>   .../display/mediatek/mediatek,ovl.yaml        |  22 ++
>>   .../display/mediatek/mediatek,postmask.yaml   |  21 ++
>>   .../display/mediatek/mediatek,rdma.yaml       |  22 ++
>>   .../display/mediatek/mediatek,ufoe.yaml       |  21 ++
>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h       |   1 +
>>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  40 ++-
>>   drivers/gpu/drm/mediatek/mtk_dpi.c            |  21 +-
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 291 ++++++++++++++++--
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   2 +-
>>   drivers/gpu/drm/mediatek/mtk_dsi.c            |  14 +-
>>   23 files changed, 731 insertions(+), 41 deletions(-)
>>
> 
> 


