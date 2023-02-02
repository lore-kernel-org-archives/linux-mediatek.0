Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A3BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 10:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/O8m3Tu7QUrsruCqpFCy7yupD/hlwqyVYceONRYcvI=; b=AYQJgWubZzX3nanNgz7Pjtb9eu
	5baZrYEQnAeThDbRHR5UgrzLzRxttPN424cRVzLR18aIz0cFjEibkn6j1WQdEx4RectyvChnqkjXX
	n0zvvPX6ok4WIcsOZxKGwbijJw6U2aEc9jY5afm/C1luHURLC9yfy3pE8Wv4sUMinT2ZQJZmSGRJR
	VoILg9Ksh42lrZFdTeIriJdWkd507bJYPtEy9ZbUHprTWcq48NxmHdOWWyPjLkxcTpFJZ+bwnjGBL
	/FIjsuMdPS+JoHU3e6xkVPiX5Nm5VnF5O03ovDoBwCg5xmnaGGX5Y8sWxWhC6/1JcTk69+PoSQ/ZN
	xyVCvqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWZi-00FKqY-VD; Thu, 02 Feb 2023 10:12:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWZg-00FKpS-2X
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 10:12:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id m7so1189337wru.8
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 02:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/O8m3Tu7QUrsruCqpFCy7yupD/hlwqyVYceONRYcvI=;
        b=hW8BFD9Y0HleZOJn18fvxLUyprlrKHtILedP2aCNQxVNQ7lkb/QCJdzEw+Q6QGDJl2
         hrY1Ad3uUhkNbCrBTt55J3FtrhTyMqG23Xow/3UWIJb52H6XNRmF9+BAXiE3HdIEKZMS
         sNamuNi4fcEOrqO0ehj/GijImIubAM0XM295QV8XDqh8duQbfDIzVDvgtOJAOVinWGn8
         zv5E+Rs7BUDDymtHYRN9+J57u6VWEM6ITGBDvx3jURovt31FKicKWWjWpAg5E5Z9tkpE
         kzlFnbWVulhJSYXLcSPvZE1rcJTmgqziCklcEj6Yt7nmFogrmqa0j08vZRDuK6snEVCt
         Zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/O8m3Tu7QUrsruCqpFCy7yupD/hlwqyVYceONRYcvI=;
        b=VjxjL8Ir2IWCdE0xB+VYxWItsX7hJPUTq8EMaXNIfQsaNK5OPT5cgbBKdMQm73qs8i
         nCmCmbqyHKwIzNw8ZzyyaDNjQ5g4iAQCRrie+XeJJxXXIHasPbZEWHFF0GG1tfW2fjuc
         cPOrC/9awGHHj8QaVO0kaBxOYC7zOsD2Eh7bN7s5pF7OZSSGGfMmmXOBgRbFAPg9Y/Eg
         VBkA/e3WH2++40KiIcixNfqR5Q6ZCdldb3mM5DipOXjj2BLe4BbSACRX+6PtNPUUDm02
         N9Q1V5FnFFX8NsohY0R8zpwvk6PwL7vYXYtX0b1NUtGKcvFAmV4nyf1fRGKve4CRpv+y
         KXPw==
X-Gm-Message-State: AO0yUKV8c45H/LTeP8CpUKp/IXT9areUVF0Xl47dVmTPoewQeQxn8Tzu
	GsFMkkEj15wGbG66ETsrlHE=
X-Google-Smtp-Source: AK7set9qcgtdgwtBCY3bAUh8GE68YA23k6QCIv1vg30Gu+HIyXv2tpL3Z+BQyuAeCqdFXDcqDDzw0Q==
X-Received: by 2002:a05:6000:1f0f:b0:2bf:bbd1:1db3 with SMTP id bv15-20020a0560001f0f00b002bfbbd11db3mr5187356wrb.44.1675332730446;
        Thu, 02 Feb 2023 02:12:10 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v14-20020adfe4ce000000b002bfafadb22asm20143890wrm.87.2023.02.02.02.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:12:09 -0800 (PST)
Message-ID: <e938bbee-3a93-6e08-c5d7-5b5b346062b1@gmail.com>
Date: Thu, 2 Feb 2023 11:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/mediatek: Enable AR30 and BA30 overlays on MT8195
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 daniel@fooishbar.org
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-4-greenjustin@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230201170210.1253505-4-greenjustin@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_021212_141974_E67DBF60 
X-CRM114-Status: GOOD (  15.05  )
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



On 01/02/2023 18:02, Justin Green wrote:
> Tested using "modetest -P" on an MT8195 device.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index a6255e847104..7d26f7055751 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -85,6 +85,22 @@ static const u32 mt8173_formats[] = {
>   	DRM_FORMAT_YUYV,
>   };
>   
> +static const u32 mt8195_formats[] = {

I'd call it mt8195_ovl_formats, to make it explicit that it's only for the OVL.

Regards,
Matthias

> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ARGB2101010,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRA1010102,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_YUYV,
> +};
> +
>   struct mtk_disp_ovl_data {
>   	unsigned int addr;
>   	unsigned int gmc_bits;
> @@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>   	.fmt_rgb565_is_0 = true,
>   	.smi_id_en = true,
>   	.supports_afbc = true,
> -	.formats = mt8173_formats,
> -	.num_formats = ARRAY_SIZE(mt8173_formats),
> +	.formats = mt8195_formats,
> +	.num_formats = ARRAY_SIZE(mt8195_formats),
> +	.supports_clrfmt_ext = true,
>   };
>   
>   static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {

