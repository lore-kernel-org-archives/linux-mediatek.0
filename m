Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1074AC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nxGi0k24nBm+pp77hw2HeyZmXNLqL70tekko4fKQWQ=; b=MC15mxnPIVJFBhmVE+tGGPXIGZ
	Cbm10ZPDl4N1khc5lZDjYY0MbJDvILCn5h/6M86CeAE4VKO7XJVO4eBX/0ovkQpLjC0M4HtFaHYFs
	CBuClBKhGZcVtiVMV/ODA7ORlKEAlKu6c1P+CNV3YPeVWinspzpO2QJj2OsjP9o6IZ1MEP/UXjVZB
	yk6dUrCPHHS1YydmSsmcCiGAh7CnGcRbPs8Z7dXBqo/hx6GOUwDKDaJk5ZNdq/HbgWsygEQoTfRHo
	OgmOG5lklIVTJQ4f0iN6wJFCDRsfkfnK7ZgpqIwfmyOpZmmlAkR3iDaTRtsFnDaCEBXltTB5zPnWH
	PeGL3Ixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os01G-00E2nx-Br; Mon, 07 Nov 2022 11:10:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os00Y-00E2WY-Rc; Mon, 07 Nov 2022 11:09:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AC4B6601FAA;
	Mon,  7 Nov 2022 11:09:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667819377;
	bh=et1Jk5J0RJuKh02K+IugMlrxsiloJw26YAWzuRtvXjo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UrnsMhIgjMtKW4rENetK+bxFEC3FL/aNIbsYpIwEp8+m3dTXkvTEXCRhpMM3YXdUY
	 /p0bqsQFgCk8UihV7pWEy+C67PDxYlsm1Jc8vpr1Ov2wQsjXEJRrmYQcBslWsgRyWi
	 k8Tdhv6AUuGwVlZVVwRnlGs7lM9LxWfz1kSSYMk3bRGO9imZBlrvUrZ5NDRmOg6Yid
	 zlDixmJiXjRQS9SCeZgS57w3jNWK+x8u6/IXeKIJ0G3eeCogbX1eYSANsLLGshkzDj
	 Ued5OqcezuIuxQrwjCRWgOclFdo3PICckeKyjurTQJ6yQ78zq/nt3TycQGWk7m35qv
	 DInXP294aLzpA==
Message-ID: <5895f15f-44ae-6164-77dd-c9bae5436a47@collabora.com>
Date: Mon, 7 Nov 2022 12:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 08/12] drm/mediatek: hdmi: v2: add audio support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 mac.shen@mediatek.com, linux-phy@lists.infradead.org
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-8-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-8-a803f2660127@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_030939_228988_7FA82F90 
X-CRM114-Status: GOOD (  28.38  )
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

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> Add HDMI audio support for v2
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c |   1 +
>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c |   2 +-
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 213 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.h     |   2 +
>   4 files changed, 217 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> index e43c938a9aa5..1ea91f8bb6c7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -386,6 +386,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_v2 = {
>   	.mtk_hdmi_output_init = mtk_hdmi_output_init_v2,
>   	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_v2,
>   	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_v2,
> +	.set_hdmi_codec_pdata = set_hdmi_codec_pdata_v2,

Keep naming consistent please:

	.mtk_hdmi_set_codec_pdata = mtk_hdmi_set_codec_pdata_v2,

>   	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_v2,
>   	.num_clocks = MTK_HDMIV2_CLK_COUNT,
>   };
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> index 61696d255e51..26456802a5c4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> @@ -309,7 +309,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
>   	ddc->regs = device_node_to_regmap(hdmi);
>   	of_node_put(hdmi);
>   	if (IS_ERR(ddc->regs))
> -		return dev_err_probe(dev, PTR_ERR(ddc->regs), "Unable to get mt8195-hdmi syscon");
> +		return dev_err_probe(dev, PTR_ERR(ddc->regs), "Unable to get hdmi syscon");

You might as well do the rename in the commit that actually introduces this file,
since you're doing that in the same series.

Please do so.

>   
>   	ddc->clk = devm_clk_get_enabled(dev, "ddc");
>   	if (IS_ERR(ddc->clk))
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> index e8457429964d..b391b22fa9f5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -211,6 +211,26 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>   		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
>   }
>   
> +static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
> +{
> +	u32 val;
> +
> +	val = mtk_hdmi_read(hdmi, AIP_CTRL, &val);
> +
> +	if (val & DSD_EN)
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN,

I think I already gave you some advice to shorten this in an earlier
series version.

Besides, you can also use the FIELD_PREP() macro here, and please use it.

P.S.:
val = FIELD_PREP(... something AUD_MUTE_FIFO_EN);
if (val & DSD_EN)
	val |= FIELD_PREP( ... something DSD_MUTE_DATA)

mtk_hdmi_mask(hdmi, AIP_TXCTRL, val, val);

> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN);
> +	else
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_FIFO_EN,
> +			      AUD_MUTE_FIFO_EN);
> +}
> +
> +static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_DIS, AUD_MUTE_FIFO_EN);
> +}
> +
>   static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
>   {
>   	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0, HDMITX_SW_RSTB);
> @@ -889,6 +909,7 @@ static void mtk_hdmi_audio_reset(struct mtk_hdmi *hdmi, bool rst)

..snip..

> @@ -935,6 +957,28 @@ static void mtk_hdmi_reset_colorspace_setting(struct mtk_hdmi *hdmi)
>   	hdmi->ycc_quantization_range = HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
>   }
>   
> +static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)

These two functions are used only in one function (each)... so you don't
need them. Just move the two lines in mtk_hdmi_audio_startup() ...

> +{
> +	mtk_hdmi_aud_enable_packet(hdmi, true);
> +	hdmi->audio_enable = true;
> +}
> +
> +static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
> +{

... and in mtk_hdmi_audio_shutdown().

> +	mtk_hdmi_aud_enable_packet(hdmi, false);
> +	hdmi->audio_enable = false;
> +}
> +
> +static void mtk_hdmi_audio_set_param(struct mtk_hdmi *hdmi,
> +				     struct hdmi_audio_param *param)
> +{
> +	if (!hdmi->audio_enable)
> +		return;
> +
> +	memcpy(&hdmi->aud_param, param, sizeof(*param));
> +	mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
> +}
> +
>   static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
>   {
>   	bool is_over_340M = false;

..snip..


> +
> +static int mtk_hdmi_audio_mute(struct device *dev, void *data, bool enable,
> +			       int direction)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	if (direction != SNDRV_PCM_STREAM_PLAYBACK)

Why aren't you returning an error here?

If this is really supposed to be like that, please add a comment in the code
explaining the reason, so that the next person reading this won't mistakenly
change that.

> +		return 0;
> +
> +	if (enable)
> +		mtk_hdmi_hw_aud_mute(hdmi);
> +	else
> +		mtk_hdmi_hw_aud_unmute(hdmi);
> +
> +	return 0;
> +}
> +

Regards,
Angelo



