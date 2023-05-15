Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804F2C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4GW8H0BgnAfNN9w95JIsiknt8uIue8yyyRMsRdxtTk=; b=3HvTMbASUnqGOBHzjY+6RgVIlY
	tJbW8dW7h3viTJUgcXiusyvGVedhlc9gq1YBlwQ8BoaU3hWThwCDv7x+irb/3KO/RDQS//HmhciWM
	ip2tIPRKykMndbYLCvqjr4GRV017ZpjBT12WrfHYXz2mvCaTlueveUMRMoMGZPwt+DbV1Ui3CvkV5
	3nIkSzAHpplIkCtM1ti1NHROQqVD+inLrSs/qlgxildYVCMAgF/o453gztUchKDcVJy6vxEXg8TtE
	FNXP+pMz9dywOncW6LO1JdUgZfuPgWBZyaEUbc1i0kAfpJnwaHVSOAEe7j4vUzecjZ0XvCDMmUCoi
	kGro42KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWKy-001yIZ-0w;
	Mon, 15 May 2023 11:25:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWKu-001yHZ-2K;
	Mon, 15 May 2023 11:25:54 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 66CEA66031D7;
	Mon, 15 May 2023 12:25:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684149948;
	bh=43lCd7DbxPZwcO9IH4LOmzSa65a75ebXHssNM18hOQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k4DEO22w8ZvsvFzka7v6ra0zcazgo/zVZe4iMYMmSdXueGxDOFJsIj7B+1++9dAPK
	 xXx1eUQ5zC1IlS6nE6SahE/HhAAlyCeB/1yA09chWxLvX3EYg70bbJwsEUqKh/pjT1
	 1pHpOF9qwKAJjcF4MMdH1XBOilOHa2Yyh7fJBJlbJYFcUAmb+X06Uhscao17hGeUUq
	 kXQcLrNhw1BBuX0FCCl77lUBdn7gs2CRZIw6BuuNN7xwWUR06SRxmgfhMAozsdWvX9
	 sh8F5QTR+WqxbejUievIY8xgySJuRKT2KklLhrk7a7/NMpe3H3byJWetIzWRGnWg8Q
	 RFm3RiC6E1LWQ==
Message-ID: <7c784932-951a-65c0-c48f-bfa4c098b2e1@collabora.com>
Date: Mon, 15 May 2023 13:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] ASoC: SOF: mediatek: add mt8188 audio support
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, tinghan.shen@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230515052540.9037-1-trevor.wu@mediatek.com>
 <20230515052540.9037-2-trevor.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515052540.9037-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_042552_938677_9135D4CF 
X-CRM114-Status: GOOD (  22.01  )
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

Il 15/05/23 07:25, Trevor Wu ha scritto:
> Add mt8188 dai driver and specify of_machine to support mt8188 audio.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>   sound/soc/sof/mediatek/mt8186/mt8186.c | 61 +++++++++++++++++++++++++-
>   1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
> index 419913c8474d..3a9c81418c1f 100644
> --- a/sound/soc/sof/mediatek/mt8186/mt8186.c
> +++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
> @@ -594,7 +594,65 @@ static const struct sof_dev_desc sof_of_mt8186_desc = {
>   	.ops = &sof_mt8186_ops,
>   };
>   
> +/*
> + * DL2, DL3, UL4, UL5 are registered as SOF FE, so creating the corresponding
> + * SOF BE to complete the pipeline.
> + */
> +static struct snd_soc_dai_driver mt8188_dai[] = {
> +{
> +	.name = "SOF_DL2",
> +	.playback = {
> +		.channels_min = 1,
> +		.channels_max = 2,
> +	},
> +},
> +{
> +	.name = "SOF_DL3",
> +	.playback = {
> +		.channels_min = 1,
> +		.channels_max = 2,
> +	},
> +},
> +{
> +	.name = "SOF_UL4",
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 2,
> +	},
> +},
> +{
> +	.name = "SOF_UL5",
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 2,
> +	},
> +},
> +};
> +
> +/* mt8188 ops */
> +static struct snd_sof_dsp_ops sof_mt8188_ops;
> +
> +static int sof_mt8188_ops_init(struct snd_sof_dev *sdev)
> +{
> +	/* common defaults */
> +	memcpy(&sof_mt8188_ops, &sof_mt8186_ops, sizeof(struct snd_sof_dsp_ops));

Never use sizeof(type), always use destination var size! Anyway, there's more.

I don't think we need to perform this memcpy: we'll never see an instance of
both mt8186 and mt8188 drivers on the same machine, so you can safely just use
sof_mt8186_ops for mt8188...

> +
> +	sof_mt8188_ops.drv = mt8188_dai;

...which obviously means that this becomes

	sof_mt8186_ops.drv = mt8188_dai;

and....

> +	sof_mt8186_ops.num_drv = ARRAY_SIZE(mt8188_dai);
> +
> +	return 0;
> +}
> +
> +static struct snd_sof_of_mach sof_mt8188_machs[] = {
> +	{
> +		.compatible = "mediatek,mt8188",
> +		.sof_tplg_filename = "sof-mt8188.tplg",
> +	},
> +	{}
> +};
> +
>   static const struct sof_dev_desc sof_of_mt8188_desc = {
> +	.of_machines = sof_mt8188_machs,
>   	.ipc_supported_mask	= BIT(SOF_IPC),
>   	.ipc_default		= SOF_IPC,
>   	.default_fw_path = {
> @@ -607,7 +665,8 @@ static const struct sof_dev_desc sof_of_mt8188_desc = {
>   		[SOF_IPC] = "sof-mt8188.ri",
>   	},
>   	.nocodec_tplg_filename = "sof-mt8188-nocodec.tplg",
> -	.ops = &sof_mt8186_ops,
> +	.ops = &sof_mt8188_ops,

...this keeps being sof_mt8186_ops as well.

> +	.ops_init = sof_mt8188_ops_init,
>   };
>   
>   static const struct of_device_id sof_of_mt8186_ids[] = {

Regards,
Angelo


