Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76754C61D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V7j3ZpSxxME7ipbXRrHRYlqvo9IVdbanRBNsVKZMEw=; b=afIpJkDQ+NdlbqgopGxAe+nJhk
	VhGFFYjHvnlRNcp29msYp1hu3hYyc3bR1n9xRsPszFw61EVgYbdrVaUsTKlLyhYq1qJ1Ksi00n/9t
	G8rcm62lNOL/fRFgDtvWUyF7ovKIQgNdEFF/5ADNbje93SsUCmmK25VoiYtVzr9HVVAYcQg4WvfFw
	YH0hWAhJI00FOInJMMEx3gZRZI5QfREXTEj0YV8jIkz4XGvkUPw7HUeXhgB8G0HYBYWWnnKOZ8RjW
	vTWz1IivrY/S3VyNUg7SaK9H9BOqOvgf+rh/HgxFZo6Y21nWQMfwioKzq4lnjb0C+egjoAIfbP2by
	j38AmWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QGd-00Glnp-1J;
	Tue, 21 Nov 2023 12:54:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QGZ-00GlmO-28;
	Tue, 21 Nov 2023 12:54:13 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A2106607314;
	Tue, 21 Nov 2023 12:54:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571250;
	bh=/LVVlw8gLQB6ZTo1Kr0Z/aF5RSngTPxFRD7QwxrFOpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KRoS6ryt/WYniBln8ggcPoFRpSf2hELuGwRk5vEKV57FaSF/OhaMn7pw6HATLUid0
	 t3YnB5WzEoW5hv9xLGA1oov5MuXgkxJCboyVzaIFdZmNXlUDPopGWhi2clWveC5soS
	 sw6x0W7q/qLT74sl0FnT8YQDYzuw5nhJ24a7mAR6oZfz192w6Qg1vw+9LxdxDV80ay
	 SMxxGNOnZWeWM+X9TUqpxfNfR/sp5Hkz9JQqCK4Iy+YOmYdFZKo3HEUo5nQqO4PWMv
	 exCr0IhXGrikqYZMHHAPMrV8gKlCqSQTg+JQZxtm9CVYK3/sJ5iuShaB+5REt/ovtb
	 9xAnW2PErb8Vg==
Message-ID: <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
Date: Tue, 21 Nov 2023 13:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 3/3] drm/bridge: it6505: Add audio support
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, kuninori.morimoto.gx@renesas.com,
 nfraprado@collabora.com
Cc: chunxu.li@mediatek.com, ajye_huang@compal.corp-partner.google.com,
 allen-kh.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230730180803.22570-4-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045411_825034_05452273 
X-CRM114-Status: GOOD (  19.03  )
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

Il 30/07/23 20:08, Jiaxin Yu ha scritto:
> Add audio support for it6505
> 
> 1. Bridge to hdmi-codec to support audio feature. At the same time,
>     the function of automatically detecting audio is removed.
> 2. It is observed that some DP-to-HDMI dongles will get into bad
>     states if sending InfoFrame without audio data. Defer to enable
>     it6505's audio feature when PCM triggers START or RESUME.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Hello Jiaxin,
this patch doesn't apply anymore (and it won't build anymore) upstream.

> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 81 ++++++++++++++++++++++++++---
>   1 file changed, 75 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 504d51c42f79..1cfcb0731288 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2162,7 +2162,6 @@ static void it6505_stop_link_train(struct it6505 *it6505)
>   
>   static void it6505_link_train_ok(struct it6505 *it6505)
>   {
> -	struct device *dev = &it6505->client->dev;

This is because this changed to `struct device *dev = it6505->dev;`

>   
>   	it6505->link_state = LINK_OK;
>   	/* disalbe mute enable avi info frame */
> @@ -2170,11 +2169,6 @@ static void it6505_link_train_ok(struct it6505 *it6505)
>   	it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
>   			EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
>   
> -	if (it6505_audio_input(it6505)) {
> -		DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
> -		it6505_enable_audio(it6505);
> -	}
> -
>   	if (it6505->hdcp_desired)
>   		it6505_start_hdcp(it6505);
>   }
> @@ -2846,6 +2840,45 @@ static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
>   		it6505_disable_audio(it6505);
>   }
>   
> +static int it6505_audio_hw_params(struct device *dev, void *data,
> +				  struct hdmi_codec_daifmt *daifmt,
> +				  struct hdmi_codec_params *params)
> +{
> +	struct it6505 *it6505 = dev_get_drvdata(dev);
> +
> +	return it6505_audio_setup_hw_params(it6505, params);
> +}
> +
> +static int it6505_audio_setup_trigger(struct it6505 *it6505, int cmd)
> +{
> +	struct device *dev = &it6505->client->dev;

...and because you'll have to change this one, and other occurrences of that
as well.

Can you please respin this series?

Thanks,
Angelo



