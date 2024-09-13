Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93CDFA3723
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UD0ZRMJDFziIkPb7Qo198cjwAQhiYKjw+i6aTIIE9aM=; b=eyTprb3/utPWRisKZMeQCweljN
	ZNgA8tf9tAXNqNzftut1e9AIrxWlGEkDZK719PJK8vLN5TMbV3wFwnNoMbju0G3SgyPcYOFhwRpQA
	vK8dgPs5LqbceDxVSM08S51/xdIjeZOSvYY44hPpbFk2veoDS0Z+Y/gZW6ufJfl3/hCSBnG519qYo
	dm70lA249NB8ILAk4qSDMegtpdWqtIP+MApMhlSmS09WP8CFhEjnRzkqxq6tcl+1ovqovlT1j+ukX
	EbDKvaa/CS+GTkt1CHioXqu3uA1ujASG+VHTCt2ibQFKcBqk13MsbvdGmZ4YqoRH9hLPRuid66LJd
	gHfbciqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp12c-0000000FDzo-191I;
	Fri, 13 Sep 2024 07:48:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp0xu-0000000FCGi-1fBM
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 07:43:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso17838895e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 00:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726213416; x=1726818216; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD0ZRMJDFziIkPb7Qo198cjwAQhiYKjw+i6aTIIE9aM=;
        b=cZwiI+KUENXJJDGNaez/ySmk2xgSt4FrhaKyZMeI/nYMUUyoHB60l1c1bEEmpa8UYI
         meurCU9xRjz+8TGR7MZEX1/cIUfHSyZDXtM4BMG+dpV+crq/ehg+1dF0tAXdQLoTZgPZ
         N4N4OKIboS2AgHJDnvJXB783A6bqRIrwnQjFOsJ81nYvOrRcc4Ucq6MjckLmL7d6aZs9
         ZN5Iqs84Pcsamp95xYVTn1rVoZ5w7d8Vqs+uL02LyUW8Ad6Ju5GS6wRzyHvNUvVmLuOK
         0l4cosOd1Efly6uCvvKKu/WZXELHKAYI+qMNAVVNdeswFdX+Y02DlFAOBVJX2iAMG+qS
         VeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726213416; x=1726818216;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UD0ZRMJDFziIkPb7Qo198cjwAQhiYKjw+i6aTIIE9aM=;
        b=q/ZdGrnks/Dq3tUrJI4nchNgcqoTskcoZr5ewM3pkTeX7R2IAD8ZV5cmkThQ/QEmk7
         xFJYL2jECEDt0qplnfAyXS+q31QLIrx+Y+Grdg6gIJkgI+XNV9iEZKZcHxDCelQkplB3
         bFCb30RDn5egES5TkgJD2ZABc2lyQGTHCfBVIjKmzJNaMZoGnv/VwFDFgJVYxXRUFCXF
         2tQ2I4EeONrORuVplR8sjpggTlLGhifPMjXwc6Ris5AdJItAME1rbfsCiTgnd16puncn
         XK4gNd2CR0O9P9HPB/ygyv8lQN3CHPyjlbKNBdtf8nZFUP2XuNu8/HwIDZhOCuOmWl4c
         aaNg==
X-Forwarded-Encrypted: i=1; AJvYcCX/gxVIA5B1A+pn8Sia6DgKXT3qiZPeIfsfi1f93NBKCP7mzXv/8+exUQIoHAgv0eKuTxCc8xnOLgj2CP+0dw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yycd6fyy2JQLVdH7PevpocfMCal2RBHlh5ipSO5j6hdsOZboBV3
	5HvnKyZPT/yNgqGgQMWBZtBGjNnut21U9Q+nC163G5SyOl5tiZygb0RITQlfDEA=
X-Google-Smtp-Source: AGHT+IFQpT3+WgWnD0oEwiLVuaeMarSuiM8nnrizagehr22tYPl5NPh/54KJf2rrqFtneqlFLhXkLQ==
X-Received: by 2002:a7b:cc8c:0:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-42d5e245609mr12459585e9.10.1726213415845;
        Fri, 13 Sep 2024 00:43:35 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895649728sm16037309f8f.16.2024.09.13.00.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 00:43:35 -0700 (PDT)
Message-ID: <e455aac1-d7fe-47a3-b3ec-e382b2de9b82@linaro.org>
Date: Fri, 13 Sep 2024 09:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/5] drm/bridge: ti-dlpc3433: constify regmap_config
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
 <20240908-regmap-config-const-v1-5-28f349004811@linaro.org>
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
In-Reply-To: <20240908-regmap-config-const-v1-5-28f349004811@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_004338_908503_EA6E3F46 
X-CRM114-Status: GOOD (  12.63  )
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
>   drivers/gpu/drm/bridge/ti-dlpc3433.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
> index 6b559e071301..a0a1b5dd794e 100644
> --- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
> +++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
> @@ -94,7 +94,7 @@ static const struct regmap_access_table dlpc_volatile_table = {
>   	.n_yes_ranges = ARRAY_SIZE(dlpc_volatile_ranges),
>   };
>   
> -static struct regmap_config dlpc_regmap_config = {
> +static const struct regmap_config dlpc_regmap_config = {
>   	.reg_bits		= 8,
>   	.val_bits		= 8,
>   	.max_register		= WR_DSI_PORT_EN,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

