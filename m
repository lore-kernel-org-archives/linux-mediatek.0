Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC80C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rKRjQQFp+TL5u/9okdCZVS8Q04keVLok7OM/X0m5lzk=; b=3iQmBpGcSIfYoP
	jtYM14y6GPVnc61aWRiUYDn3GwDqrnleDnPR21gxO8nhEU66lvHxCfAY6ZgFEgdnuDPP1Z1CfHrB9
	qa048v5FxNwPq8GoKcYd9b3I0bUgYJHL+w+BDYeGHrknX+SttBsh+7a5eERKmcIn/5tt0L2W9SeeJ
	p6szogDzCx8QZaSGITSMpD/TjVGI7eL2bczisrVDTg889hRloYn566H3kzauBU4+YV/ayG7P4Y5kE
	dCtjGM3BkGzP9IEcSU7G8ur7UpM9PiOi3zkN0kTjKdw15aBN6eKGK2ZcTfITo8WoXf56zj5ZnDZ0x
	lu7phI9qxUmu+yMq90ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nG-00Bnfh-1U;
	Tue, 12 Dec 2023 13:27:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nA-00BnbI-36;
	Tue, 12 Dec 2023 13:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702387636;
	bh=xDgSLNOEDoRbx3eokyLAR16GqDH2Uv/Z7DBLvAgMnGg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WwNIE1XK3CLrmcACMu8onN3StZKF02LFMGr5o8eV8qZKQ95qO1394/W7wFymVt/Gv
	 NkzR7gbMzj1tKHer8FN2c3/cXgLdj1kkoUv2/5tUIpTbm34fbyUSq0HftfnnNH3lJU
	 awuTCSDgv2y2LUGmmKRXrqxvBNR2hJFs/g7InuAA1IeqN2GhcAUpmIHivkjXJKIIqd
	 +Giz0c7dI2j3PZ61m/57b2R5OjTiKfqWfi9lUow0b8heqUaEOhJYk2B+UN9C0Vj9aV
	 r37GQLFxz1yYQ05ytLQVo1FmW5hhJkqe13aElSSMa5d6mMP/Wi0PQTDIvlY1epOqM5
	 +DBu82DsKRVPQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DEE23378143B;
	Tue, 12 Dec 2023 13:27:15 +0000 (UTC)
Message-ID: <1e05cb3e-3ef2-45ca-9754-add6d0e185f0@collabora.com>
Date: Tue, 12 Dec 2023 14:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/17] drm/mediatek: Add comments for the structures
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-18-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-18-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_052721_183129_21AC8BD9 
X-CRM114-Status: GOOD (  21.00  )
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
> Add comments for the structures to improve readability.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 21 +++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 22 ++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 32 +++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      | 15 ++++++++++
>   drivers/gpu/drm/mediatek/mtk_ethdr.c        | 11 +++++++
>   5 files changed, 97 insertions(+), 4 deletions(-)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 38d08796fae4..af80c9e50d36 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -46,6 +46,38 @@ enum mtk_ddp_comp_type {
>   
>   struct mtk_ddp_comp;
>   struct cmdq_pkt;
> +
> +/* struct mtk_ddp_comp_funcs - function pointers of the ddp components
> + * @clk_enable: enable the clocks of the component
> + * @clk_disable: disable the clocks of the component
> + * @config: configure the component
> + * @start: start (enable) the component
> + * @stop: stop (disable) the component
> + * @register_vblank_cb: to register a callback function when vblank irq occurs
> + * @unregister_vblank_cb: to unregister the callback function from the vblank irq
> + * @enable_vblank: enable vblank irq
> + * @disable_vblank: disable vblank irq
> + * @supported_rotations: return rotation capability of the component
> + * @layer_nr: how many layers the component supports
> + * @layer_check: to check if the state of the layer is valid for the component
> + * @layer_config: to configure the component according to the state of the layer
> + * @gamma_set: to set gamma for the component
> + * @bgclr_in_on: turn on background color
> + * @bgclr_in_off: turn off background color
> + * @ctm_set: set color transformation matrix
> + * @dma_dev_get: return the device that uses direct memory access
> + * @get_formats: get the format that is currently in use by the component
> + * @get_num_formats: get number of the formats that the component supports
> + * @connect: connect the sub modules of the component
> + * @disconnect: disconnect the sub modules of the component
> + * @add: add the device to the component (mount them in the mutex)
> + * @remove: remove the device from the component (unmount them from the mutex)
> + * @encoder_index: get the encoder index of the component
> + * @crc: return the start of crc array
> + * @crc_cnt: how many CRCs the component supports
> + * @crc_entry: get the pointer to the crc entry
> + * @crc_read: call this function to read crc from the hardware component
> + */
>   struct mtk_ddp_comp_funcs {
>   	int (*power_on)(struct device *dev);
>   	void (*power_off)(struct device *dev);

Please rebase over the latest upstream kernel, as it doesn't apply like this.

After which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



