Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F144DE7716C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=; b=RnlhUujY7UDTKLpLErmvyorm0f
	+jFt5sBFaDhD4BNbDZLEWBjJOvKlmBv9TuPyMVpmvA253AjkSVlUsFTTrRHdLO75nXXSNXBfo4yZi
	hKfeJB+OTZFluHFJ8jL9hyIHzxKWVXlrHSktEjkZRU4aT8s7MfeSPxR4t///thVosNgY3Sk1hZXg8
	RdyxoOGWv4zA84eg3lInhPKKDPAS8x5isz4fZ5XXytRvYPlZNFPNFu5SbWFciKLpoaSjlb5d714gU
	sMQhaDgIicu2yQgSKg7zMjV4uvNRoT6FH3+9QrDgx3rUjg7s70Mn4YWsYCid1yr3CFZ/YmRjjBQKt
	nWzJVfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJB48-0000000FyNx-0h7g;
	Thu, 05 Dec 2024 12:34:44 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAyj-0000000FxCf-1QQr
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 12:29:11 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53dde4f0f23so791983e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 04:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733401747; x=1734006547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=;
        b=fOXG1ThTgx/K7CbWjzoE0AkL84ippEO8UNZM0vTpOICQe1KsWhfrp9R1HIKuy2UlpR
         UBgvdcinEPD3VXssKRg8xk0w3yQ+9U4Bd4ZR7hHYuTi6tLRsky1XCQX/7lMqPdXZSqxV
         la62651vZ0wfYAjUEM98ye09pEmcU1qMLF8OaQRDUkMYb7X3okJYViLa9yIO4zR+C0IW
         FvE7adH38k6R5EnT/0OkUm8O/6i+k61gsE4YhYCjO1UqYtLK1SMP3Xth75ITIDaul/9N
         HckOODUWAc894wD+DDZ1jvizw17k7pokJDWy9gKCNfJUUGAauGyk9yqQdjfFcoNsMZZ9
         9sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401747; x=1734006547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=;
        b=vkKA+QtvrkeKfnfeYAyvN1Ne90DDCskfcfMXI1p4aiDafY6nnurpQ88QLfkSMqsu8V
         tJUBB0CtiO0TSoR2JmePMnNRuM+KNcM/kcwNiWbs1zBKSO/AFw4wpU5YO0Es7OtQ/4oq
         M4jCljuSyzlzqluZA0is5PaCRjSRfUuE4tbp9gSxz4uB92dUlVJBHnR5hjZO73G2+QEU
         eiImbdXUpNYonWv4k0zx64ABEtLqXelqxD6DN+WxsSHQ3g2WYfhf93WaI0XKPCKAKJE1
         s6WNTo7I8B/7lbFL0aXa64RHGdf47YDPw9sSBsGT0hudQzsEb2i4SnHF6JhiXa//TfA8
         8Hnw==
X-Forwarded-Encrypted: i=1; AJvYcCX30JkLrBuLH1hhctfslIPoOPpd83wW02/UeElepbAhs5uXOxgShNGEG8wRG4lfg01FSLNrh2fVLO1FMdqzdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuxkFVwDyMdQzK2pLnRGtC9325KQFVPlLkTn3yGwy5jIUVLcjE
	3z35ImADMwgaQGn/nSXMKTUgd+s49sLGwWYepXQG4xY4EU/zF5LyKaYYcjb3o+s=
X-Gm-Gg: ASbGncs1+1SW40JaNMmdUAqATGUVkU1MaJ0g5ExFBpFl7z3sqvq5/iS5NtJm6RWWvbm
	Z+SjP7LFfp8vicvwKrgXOMKmf4VnFC1sVwvKwfITWHi4HatwVzTOkpJW9J7CRcEXZv5ksUW+Ypw
	y8VVYiwTwxhz9A2YS3GSaZtKE8nd0/F9jfFZde56696bN8XkE7+WQ1+ZDBSTfHrqX1j5e0CaVXc
	phRTU/ruI2qQ9uUTFMiH28AstDgXZgbljPycUYrQLZhVnP+J9M6t61Sifk38mCPH5FHR+FJey0Q
	d5/F0paMKNilTi+13F/5DnNpRAMROQ==
X-Google-Smtp-Source: AGHT+IGWyrIJVNkXZfMk2D77Z12NxWguDqxu6KGooscExaYt6vk4bYi8IUDxyjnT5IkrNFyNFyZrTg==
X-Received: by 2002:a05:6512:3f1f:b0:53d:eefc:2b48 with SMTP id 2adb3069b0e04-53e12a01888mr5509943e87.33.1733401747192;
        Thu, 05 Dec 2024 04:29:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c1d6dsm233341e87.183.2024.12.05.04.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:29:05 -0800 (PST)
Date: Thu, 5 Dec 2024 14:29:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com, 
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Message-ID: <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_042909_369483_1B841C0F 
X-CRM114-Status: GOOD (  16.83  )
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

On Thu, Dec 05, 2024 at 12:45:14PM +0100, AngeloGioacchino Del Regno wrote:
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
> 
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>  drivers/gpu/drm/mediatek/Makefile          |   1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c        | 724 +++------------------
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 425 ++++++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 203 ++++++
>  5 files changed, 729 insertions(+), 635 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> 
> @@ -1026,19 +812,12 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>  	return 0;
>  }
>  
> -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
> +static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
> +				    u8 *buffer_avi, size_t bufsz_avi,
> +				    struct drm_display_mode *mode)
>  {
> -	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
> -
> -	hdmi->csp = HDMI_COLORSPACE_RGB;
> -	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
> -	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
> -	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
> -	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
> -	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
> -	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
> -
> -	return 0;
> +	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
> +	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");

Please use the HDMI Connector framework instead of handling everything
on your own.

>  }
>  
>  static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)

-- 
With best wishes
Dmitry

