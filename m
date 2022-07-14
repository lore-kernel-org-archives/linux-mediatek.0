Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 11:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6r/0m2QcaXv1KlzdMMS1f6HYpX8+yWTfgUMvSx3fuHA=; b=bVd8IMSJqLM6qua/WKU1S/sBnu
	b0swmwXtCq08BIBUuZXhb9ZauzUmIP6Mh/nr7qNTwaK4JewWFNdFXVM8fXd7pH3mCizaXgOlQ8ygJ
	rcB6iAqGExB0ueZCoTCqPXPkTbbAWIxeo1iEwsLtefGsAa03ytdM2yIYfc5QVP1RDWvRFtgMuqLPf
	Fdef+/0mHZQnwTP8xKeW6Pdgktd0hbcLaZ4FJT3E211kFEZ7O58lInOIjHtr0NAv4YZFETEmyO6qc
	w9VYz/h1fq5f5Dy2T+afri1gIDJPdNwC/s5UV2aH+TPyeU+jOFGyq2hcRvwU0ZM+8rxOGw8o9QwsJ
	xrMpGutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwmB-00DdRN-W6; Thu, 14 Jul 2022 11:13:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBwm1-00DdM9-3w; Thu, 14 Jul 2022 11:12:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 65E0E6601A3B;
	Thu, 14 Jul 2022 12:12:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657797167;
	bh=ofHlqQBpp6w/LA7oamUpNLobhMVnwMZheJEW2td7o8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hxx6klICvRWNySKOsGblV95bRhvescjpQujgbjCRX5WR8cHK8YBCFmePUXLNdZAUJ
	 8daIIbAvbjJdtaHbNLzzU0MZYK+UI12ZPzThokFgSrbD/XPnJLOBcBEsWz2ab7+7O0
	 4pGavv5mW0qgixNldFjda4Bhuu0VqYBN5qjr2v6OBe7bn4cuKsO0n01rsTVrm1omn/
	 Y3xawh772Qm9CHqZrASorTMJykvqxsrsNbXeui+7WBpStCqCyqMac4K2QWHt2cTAMj
	 Ab1AAc/1FTdxBUVEwNjnQyH81x2MyqKV8xz0t10xb7F6E8IrwW37akgsIi1RKXqAIM
	 L4WYLItI2jFKQ==
Message-ID: <67b3a842-66aa-2336-3955-d5aa760cdd4b@collabora.com>
Date: Thu, 14 Jul 2022 13:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 03/10] drm/edid: Add cea_sad helpers for freq/length
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712111223.13080-4-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_041249_329381_4317EE21 
X-CRM114-Status: GOOD (  18.79  )
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

Il 12/07/22 13:12, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds two helper functions that extract the frequency and word
> length from a struct cea_sad.
> 
> For these helper functions new defines are added that help translate the
> 'freq' and 'byte2' fields into real numbers.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/drm_edid.c | 73 ++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_edid.h     | 14 ++++++++
>   2 files changed, 87 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index bc43e1b32092..79316d7f1fd8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4916,6 +4916,79 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb)
>   }
>   EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
>   
> +/**
> + * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
> + * @sad: Pointer to the cea_sad struct
> + *
> + * Extracts the cea_sad frequency field and returns the sample rate in Hz.
> + *
> + * Return: Sample rate in Hz or a negative errno if parsing failed.
> + */
> +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
> +{
> +	switch (sad->freq) {
> +	case DRM_CEA_SAD_FREQ_32KHZ:
> +		return 32000;
> +	case DRM_CEA_SAD_FREQ_44KHZ:
> +		return 44100;
> +	case DRM_CEA_SAD_FREQ_48KHZ:
> +		return 48000;
> +	case DRM_CEA_SAD_FREQ_88KHZ:
> +		return 88200;
> +	case DRM_CEA_SAD_FREQ_96KHZ:
> +		return 96000;
> +	case DRM_CEA_SAD_FREQ_176KHZ:
> +		return 176400;
> +	case DRM_CEA_SAD_FREQ_192KHZ:
> +		return 192000;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
> +
> +static bool drm_cea_sad_is_pcm(const struct cea_sad *sad)
> +{
> +	switch (sad->format) {
> +	case HDMI_AUDIO_CODING_TYPE_PCM:
> +		return true;
> +	default:
> +		return false;
> +	}

Are you sure that you need this helper? That's used only in one function...
...if you really need this one, though, I don't think that using a switch
is the best option here.

Unless anyone is against that (please, reason?), I would be for doing it like:

	return sad->format == HDMI_AUDIO_CODING_TYPE_PCM;

Everything else looks good to me (and working, too).

Cheers,
Angelo

