Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ECAC3DA79
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jan 2024 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A626LluLqavc8Rba7QE8gq+rDsxDvpizm68IdXwWAE8=; b=yJVonQXM8jYX8Z/me1sZVtmo1H
	gGuJOzkGBP8zHl2QatdodLGRi+mDPVSinAUTHe4r3eBZqiJ3089BNVZwdzdTtcotisMiJrmkwBBiM
	tPgOar5oDI+TtOzInGTgNFdRuTxkj0K0za46NJSh1XlhNYpuLQRk3JnQE8CoJxS4TLI5pGAWBo25a
	TTI+SN7idsCJetwe/uZ5vsdRd8CUeW89r8KqICXx1ybeDqoqzwuqIKmtfRkXrA03f9THvWh12UsZO
	IIVPE9qt3VfDZv6vDPbQbijhWKJGVTf6YAasJldTkEm/RuOrZr8Iv2Faqakwq0ZVGNyn3qjCvAyqU
	aHGoKzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKnX-008dmp-1R;
	Mon, 15 Jan 2024 11:06:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPKnU-008dlo-0k;
	Mon, 15 Jan 2024 11:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705316784;
	bh=9McWAV60PkhZi7zD5efm3VtPNye+yEcAzKdSklegtGg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BrASkF+HM2Gm7Wsa52sDK8N9HzfyyrdcZxgzb42a/CyxwcT2wUo9E+pQdDnc9Cn4b
	 Rdc+Ajh+t8fQH/aPj2vvCSsFvsk+knr+fDDupQ30g+kf3iktme0u3B77VWK9FQku+A
	 rFjz1wbp8RJHLUrljs90IBQmOQh/hMYW+FCBQbrOfD+95GLrwz6+Bd/bBR0RCaXVf7
	 SiOpewF/4s7ZnjYHWvkfgfCWaVbXlareuQxg1VJScbj/pKDlax2SByf4jA0AJSiu/b
	 5V4MLbyCwlpb92VXdI1DQLPCAqYQTS2Ujv7/a3in5QPR08c+G9ow0WUMxBwzkzJhuN
	 Hh5Zwaj6/cgow==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0FACE378134F;
	Mon, 15 Jan 2024 11:06:22 +0000 (UTC)
Message-ID: <2b28421b-d3a9-46f5-a60e-bed84191c9f8@collabora.com>
Date: Mon, 15 Jan 2024 12:06:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Add MT8195 HDMI support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mac.shen@mediatek.com,
 stuart.lee@mediatek.com
References: <20220919-v4-0-687f09a06dd9@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v4-0-687f09a06dd9@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_030628_401075_C89E9E5A 
X-CRM114-Status: GOOD (  27.11  )
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

Il 29/05/23 16:30, Guillaume Ranquet ha scritto:
> Add support for HDMI Tx on MT8195.
> 
> This includes a split of the current "legacy" hdmi driver into a common
> library of functions and two dedicated compilation units with specific
> code for mt8167 and another for the "v2" mt8195 SoC.
> 
> Support for the new mt8195 dpi/drm_drv adjustments to support hdmi.
> 
> Based on next-20230523
> 
> Still in my TODO-list for v5:

Hello,
sorry for bumping a year old topic; are you still interested in upstreaming this?

Cheers,
Angelo

> 
> - Removal of the 'is_internal_hdmi' flag in mtk_dpi. [1]
>      I Couldn't find a way to get rid of it with the way things are done
>      in mtk_drm_drv/mtk_ddp_comp.
> - Do not use a "virtual" device for the ddc v2 hw as it is embedded in
>    the hdmi IP. [2]
>      Seems that a lot of work is done by the framework when using a
>      proper device-tree entry that can be linked as the ddc-i2c-bus of
>      the hdmi-connector.
>      I will keep the virtual device unless I find a way to avoid
>      rewriting the framework code that handles this.
> 
> [1] : https://lore.kernel.org/all/988b0a7a-69bb-34e4-e777-1d9516221077@collabora.com/
> [2] : https://lore.kernel.org/all/7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com/
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
> 
> Changes in v4:
> - Split phy related patches to another series (merged)
> - Removed regmap wrappers in mtk_hdmi
> - Removed colorimetry related changes as this initial version only
>    support one color depth
> - Fixed dt-bindings properties
> - Removed some now useless clocks from mtk_hdmi_v2 and mtk_dpi
> - Link to v3: https://lore.kernel.org/r/20220919-v3-0-a803f2660127@baylibre.com
> 
> Changes in v3:
> - phy: Grouped register and bit definition together to add clarity
> - dt-bindings: Addressed comments
> - Link to v2: https://lore.kernel.org/r/20220919-v2-0-8419dcf4f09d@baylibre.com
> 
> Changes in v2:
> - Removed syscon requirement from the hdmi node
> - Use as much as possible bit FIELD_PREP/FIELD_GET macros across all the
>    patches
> - Make cec optional dynamically instead of hardcoded with a flag
> - Renamed hdmi variants to v1 (legacy) and v2 (mt8195) while waiting for
>    a better name
> - Rework hdmi v2 code to use a connector (same as v1)
> - Remove "magic" 0x43 addr special handling in hdmi ddc code
> - Link to v1: https://lore.kernel.org/r/20220919-v1-0-4844816c9808@baylibre.com
> 
> ---
> Guillaume Ranquet (8):
>        dt-bindings: display: mediatek: add MT8195 hdmi bindings
>        drm/mediatek: hdmi: use a regmap instead of iomem
>        drm/mediatek: extract common functions from the mtk hdmi driver
>        drm/mediatek: hdmi: make the cec dev optional
>        drm/mediatek: hdmi: add v2 support
>        drm/mediatek: hdmi: v2: add audio support
>        dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8195
>        drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
> 
>   .../bindings/display/mediatek/mediatek,dpi.yaml    |    1 +
>   .../bindings/display/mediatek/mediatek,hdmi.yaml   |   59 +-
>   .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |   45 +
>   drivers/gpu/drm/mediatek/Kconfig                   |    2 +
>   drivers/gpu/drm/mediatek/Makefile                  |    5 +-
>   drivers/gpu/drm/mediatek/mtk_dpi.c                 |  121 +-
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |    5 +
>   drivers/gpu/drm/mediatek/mtk_hdmi.c                |  773 ++----------
>   drivers/gpu/drm/mediatek/mtk_hdmi.h                |   18 +
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |  437 +++++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |  208 ++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c         |  362 ++++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h        |  276 +++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 1303 ++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.h             |   32 +
>   15 files changed, 2955 insertions(+), 692 deletions(-)
> ---
> base-commit: c8a64c6a78c54887da437098d97dc2accc689e89
> change-id: 20220919-hdmi_mtk
> 
> Best regards,


