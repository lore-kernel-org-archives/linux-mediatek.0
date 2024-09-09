Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB571ECE57B
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3dhfZNbro0Q8a0edsgm4VI2lp9WiWYPxhOHG+Trz+Y=; b=fQHPOjNXWLtG5G3PWHOZolBZs+
	vLQyfMO6xWkvOm1TYotTTtUSaiGjXx6zQ5TPBUawYhkZkTo/e1X4j5L537fZW2ppAwfaDO02hrBRq
	qUrIrmSmPugvUoasSQ/Yy4660BFldBDcCDvSrRmuE/2KNpXFBdtrVil1gHwB8BoLjc2X1xWlojcr6
	UnuDMi+3dXgQqnnUtAMCOCgW1g37Qj4Mu+4swdjHSnRgvmQBYwxm2B0vcvYRZucrpEHPPTyJ4t/KJ
	2Cps+ZaUKKyd9v0X8X9K4J+U9//NVnhx6tiv0tUCbCMaruqatdUBDPlXnKKD14RypMKP7FVbj71ZJ
	7yaiGYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaNA-00000001EVL-2NY1;
	Mon, 09 Sep 2024 09:07:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaKM-00000001E7Z-0q0U
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 09:04:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so17189395e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725872692; x=1726477492; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3dhfZNbro0Q8a0edsgm4VI2lp9WiWYPxhOHG+Trz+Y=;
        b=B7iF6LlVZRQS2L9mB7nNh14dEYm0B48kxTRLxD3TiX6Nz5agDCU2cgOy+ZpOUydPGo
         FzD56zuQMx+jawVJUDLs6B0n7gqlhiUn7mEApJW/7ysOYWnU+J4eApStxh9mjo8ZljOX
         3/lI+g9u3K05X3oGewhHo6QY/YFhqu3/iczxtTfJOO8QczDKL3Fh4CLS9c7NNOVptXr/
         c5jEyvfoiu4QRjEOLz7vmI/vW6bhrGx4qx31QJZiGsJiNeQyHRekVErzpVtS4VML37AU
         FCX34hA18niNJd2Xl7KdWKH39L+/PDvi6AfCqwpq3WU2AhFdOW8x3ZSqo+qZFahWaUyX
         hMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725872692; x=1726477492;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p3dhfZNbro0Q8a0edsgm4VI2lp9WiWYPxhOHG+Trz+Y=;
        b=pFlLMhpLeUYX9r1x0XVOS987Rk7moST7nkeiNTfswRBrKLYKd7u7rYMZYOuM8itd0j
         QH5vnFaq5awLJKirBsGEIiWuBYoONgJKVrRpWws7wA2vTaqqo9LP5FiifBr+DGb0Naso
         ONSgefCvXLXgE2I9S7jGbU/ZCui+Gh8XwzFzAZqboeYZg9LnxJL6NrZvTV9i2nWq47mI
         9zzIdaG6TSzvWKFJ95zlwpeSEBZ5mULANU1TgR13IvnuKL+Dx//Iot6jhk/i+uaT1YQ9
         KOCdJUDXTvmlcGXJWKo1ZmsrjRYUnyKFRHyNfDh7PCxY6Vkgu7ThDAkCxZ6gGZrmqZUs
         iCFg==
X-Forwarded-Encrypted: i=1; AJvYcCXffB9nG5s1nNgePiEPTDIDI+rsDnj4UaILsbtQ0iXKl2w67KHP83i4X61LLw8u1cVRfYZ49bBhjz0OVtLY+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjRPzGJIc/dAoofDLvs+9u6f9OtVlR5UHvCNGCahD1PCIK80hE
	Ag9qROB9p/IvfMst7E5iYTNcNhv5zWAD8gth5lyKrfyJOJ0dhpBojF2Lmmp+WNM=
X-Google-Smtp-Source: AGHT+IFVcYzwIVmzAqMmvKKM3ciORGaJKpx4XVnUJN5ODieQEuio3vvRs+LhSli5Ag9nEDPTPH5piw==
X-Received: by 2002:adf:cf09:0:b0:374:c651:4abf with SMTP id ffacd0b85a97d-3788969feb9mr6129034f8f.52.1725872691962;
        Mon, 09 Sep 2024 02:04:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850? ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de3d4sm5457312f8f.108.2024.09.09.02.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 02:04:51 -0700 (PDT)
Message-ID: <81392013-5dda-424f-b185-c350b163c82d@linaro.org>
Date: Mon, 9 Sep 2024 11:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/5] drm/meson: constify regmap_config
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
 <20240908-regmap-config-const-v1-2-28f349004811@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240908-regmap-config-const-v1-2-28f349004811@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_020454_319647_4BF5F65F 
X-CRM114-Status: GOOD (  12.66  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08/09/2024 16:21, Krzysztof Kozlowski wrote:
> Mark local static 'struct regmap_config' as const for safer and more
> obvious code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/meson/meson_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 4bd0baa2a4f5..6c8677d1f562 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -126,7 +126,7 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
>   	return false;
>   }
>   
> -static struct regmap_config meson_regmap_config = {
> +static const struct regmap_config meson_regmap_config = {
>   	.reg_bits       = 32,
>   	.val_bits       = 32,
>   	.reg_stride     = 4,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

