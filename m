Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1FFFA372E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1xj60F/vgTipeL0hqo1HxxLaiGJUpWyE7XptNLkLY1k=; b=p0D+W3KY1F+qDZpkrsUhmHqyIF
	/b6XTlujfDUjFhTV2apTfmwi7JNMllLcfkoqw2EijZT0bFTt7zaqf04hZVXKtcqrA7wVPqxEV8j1M
	KNFCclZnbPkxPCPKYV+laD93OpDeaNUOANaV6zclzKUoHKmFY1gzWLLKQocu6l4D6tIgpzM5/b4FD
	HKqDeihvSod7NXxvFUIcLneeKs16mDxAXkvQWld3sRc8c3DyGkuMVdciez/ubOk3C4shdIMtORyKk
	9OukodlSqCu7NqTp2QCf5D7GsRxEjrxjoH0ophH6NHa9Nv3pkTgGA9CEVJLWjc+4FiOtzRSMO9vN7
	0t/3vTXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1YL-0000000FJqR-2i6d;
	Fri, 13 Sep 2024 08:21:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp1XF-0000000FJiU-14v1
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 08:20:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so16889475e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726215608; x=1726820408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xj60F/vgTipeL0hqo1HxxLaiGJUpWyE7XptNLkLY1k=;
        b=gJ2uQikIRYVTY521J5np5rUcdC8PdRbpXcYK+CqF5yPNIhHCd1MB1pAx74+EmEqVL0
         B3KLW3DqtDCFfApJrCDXuDU4Lp/gtILF9H2qGCMH1a88bLzUNvMSsbBhWWanjQhE7hiB
         lx00YqVmtVdzZ2C/QFioOytk6hRTtSnHgghfvnxIinKgPcUbWM0qfdDvfkcMtkJY0tlj
         fyn+VJki9MGLexeQme+9BeZyGJoA6nmNoPl6CXnJ+BbJyGsICyn2vfSdi4gE1pXzKmRa
         1q27ypspXkcL1ZjMRzeR2M6K+Y8snKnKnHivDJVXNUE/AD/Xpqsu8T1KNGM4je/M2Lvn
         TawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726215608; x=1726820408;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1xj60F/vgTipeL0hqo1HxxLaiGJUpWyE7XptNLkLY1k=;
        b=SVkn+PsOaqQUuRFZ2OkNcV5w7y9zq73B4CCPWqcOM7NM0YtkMy2eFSlrD5xsCaEbQQ
         jZPdSYktfF2hoka+UAIYAghRgxbhOogAu2KgDsbd5yMwdioaXMVauOS6mb9FMs4C7Hd0
         PXhLOV8dpMRL4jClONalGbi0Cx6dsz4D1kDu1wFtrIVxH2ySqogXsKaUw2Yp1NISDTbi
         69KIAb7/VCcb+6GMXsGQMkLlJJQfR2VGi1gBGBg0QqPl8tHYysOoBXm+q7a2h1Q1ZYWw
         SAhz7Qg8IQ43E55R36bL/lzuEKJ5KFC72P4hoHZbzBxO2HUFj2wYFqVTYFcGdtf529bj
         GUog==
X-Forwarded-Encrypted: i=1; AJvYcCXOa8RTAGCE9QNdC3sBq6b5om2idGqdbCPD1YydegBdl3BMQcAzvNDRmyuOz3Z0avqL56YKPE0fqOqoOLwUWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEHhd9B7ovOBIq2+rPs6XJA2E3bQeu3XBTsfkVDP7CO5svrBl+
	msfiqFkGDe9FYzpev7SQ2BdyPUR+LMMd0DRZEAgVjqGSjf+eYLKair9ZIrfp68g=
X-Google-Smtp-Source: AGHT+IFeNwe9JE6SnCZa7mE9nYY3JFjm89tRGwX5GCTUN5zeAxBdbp8mQ9PIRuX4eone/RakGWhRhw==
X-Received: by 2002:a05:600c:4e10:b0:42b:a9b4:3f59 with SMTP id 5b1f17b1804b1-42cdb529b15mr44857185e9.14.1726215607430;
        Fri, 13 Sep 2024 01:20:07 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b16c9d7sm15618395e9.30.2024.09.13.01.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 01:20:07 -0700 (PDT)
Message-ID: <fa108de3-66c3-4dc6-b241-06ee535198f1@linaro.org>
Date: Fri, 13 Sep 2024 10:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] drm/fsl-dcu: constify regmap_config
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
 <20240908-regmap-config-const-v1-3-28f349004811@linaro.org>
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
In-Reply-To: <20240908-regmap-config-const-v1-3-28f349004811@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_012009_357228_F258A042 
X-CRM114-Status: GOOD (  12.50  )
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
>   drivers/gpu/drm/fsl-dcu/fsl_tcon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
> index 9eb5abaf7d66..49bbd00c77ae 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_tcon.c
> @@ -29,7 +29,7 @@ void fsl_tcon_bypass_enable(struct fsl_tcon *tcon)
>   			   FSL_TCON_CTRL1_TCON_BYPASS);
>   }
>   
> -static struct regmap_config fsl_tcon_regmap_config = {
> +static const struct regmap_config fsl_tcon_regmap_config = {
>   	.reg_bits = 32,
>   	.reg_stride = 4,
>   	.val_bits = 32,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

