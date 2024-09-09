Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F301ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/quyWb8vumcbT1XTiobNYayKAU49ZoNqv4TkV+Bl12Y=; b=WkSOmA1v5EZD/ehMLaV27fOHY1
	U2ozTgpr8/YaITddBni4UBrJJri/w0YZRxZwXmd3NqZY4HnF5f3TBiwJDWlP9ofJaCdK/OYgtuL+l
	l5VhAarahm+dpbjP+4VjzVoZLKSuVDx4l1avD7m9oaRiFxXY9J/G7kwFobISJGCDVe0yfOTTNbeVH
	AnjxqQq54ixCJMC1Ov6+UJornY1SCM2JIg//P7Zf71sOErnWfs+qGORzIQ6wNUJIM0+pITHF8G5qs
	i1kM5YmN+9xgYyOwAxvRCX2/PsRJiYLy2r1s2rSZkumOtOK9X8bNrFgb562+WU7wSZCo/Rqlk2wn3
	QEVN0QXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaN9-00000001EUq-2yPS;
	Mon, 09 Sep 2024 09:07:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaKA-00000001E4v-09mU
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 09:04:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso9477805e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 02:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725872680; x=1726477480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/quyWb8vumcbT1XTiobNYayKAU49ZoNqv4TkV+Bl12Y=;
        b=IJVolDTby7cpHWG3LjOstjMhyZtG7GGk20ZPXRIOlwYtJDOu7m38pQQMBWxABeeFpl
         gQNtuGK/JGsS9ukmRLnJTo14d2TeCm3OY7+6CmcHo20FvLxvXd2t8oJp4My3F+p9+7hD
         JpE1SldDtN3k8i9tWHN3KWnYC0PmbyupHH3DmCC49F87nnE/o8N3+EPoY20d/tmFNYXM
         mztHOjmqBkJ1WFtq0+oDBwBOhB7hpyKMqoBJF9GDSffbrGeL0VGJCPAw7eTJYNlAEWFL
         3F0Al0x3d0Ym48t+qbmTNdQzjwVmQfDiN1YUf5xMduLzVTF+OKnHcR473L4/Mdll4ddP
         UkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725872680; x=1726477480;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/quyWb8vumcbT1XTiobNYayKAU49ZoNqv4TkV+Bl12Y=;
        b=YSfakI9lDA1WB5kQpLlNYWMQjO4XX987dSU1FZGW3zPUV+M+eOFh5uU/cb2DY4KbL5
         OxVB9SVzJCL6mRW9cVNPnSHuvHFn+enyTfdTWFyRBOEp/UxuIMoggAm1oUM4bEFRclbC
         /6VMuJo83/WoE6gEh+eVRAfYXThX14vOPpblr1YYHTfqHnZvvEJLTYKcN5ONeK7tqKoc
         xO4H/vVgsZPhYrKG9qfQHUXQSlx/MsqImXTGjqKAcYelvZNx/QALqsMXaTFajIKNWwky
         +EKcDqWEICzzzNVAFEdNQb+FqYKFby7gSdaZvkjWEpHkly2QdfBqNqk4K2gjuBeQYNfs
         D3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzvjwDSsVxq7JfWf+6aKQtiUhAYUDg1Y0Tj9MYFf4UZwYPc4BxOyXiMUAzKWSrv5BxFmm2dCXntrnS5e3YhQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbkzFQ8m+8k+po7PU0h1vlE11NhkpcZWH1AZ180eiXrlAFlyat
	FHJRKI4zN/Lflq5bY32EWn/QPzAX7+IfmbmXj7+WwJzWQakA6FELYQgZfEVdsoI=
X-Google-Smtp-Source: AGHT+IHPyFzNJJ9CK/CbxvRhF0zXZqmiSax9i+YVPGOKwyfg6lpCSe5AQQrFB9PmBhsPgB8jUkq+yA==
X-Received: by 2002:a5d:5081:0:b0:374:c9f0:7533 with SMTP id ffacd0b85a97d-3789243fbb9mr5688124f8f.41.1725872679665;
        Mon, 09 Sep 2024 02:04:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:63a3:6883:a358:b850? ([2a01:e0a:982:cbb0:63a3:6883:a358:b850])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675c40sm5467200f8f.51.2024.09.09.02.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 02:04:39 -0700 (PDT)
Message-ID: <b4ac3e8e-1d0c-4a6e-97de-482a77a3a3aa@linaro.org>
Date: Mon, 9 Sep 2024 11:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
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
 <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
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
In-Reply-To: <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_020442_084643_9CAF8E98 
X-CRM114-Status: GOOD (  12.97  )
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
> static inline dw_hdmi_dwc_write_bits() function is not used at all:
> 
>    drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: error: unused function 'dw_hdmi_dwc_write_bits' [-Werror,-Wunused-function]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5565f7777529..b75db829b1da 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -272,20 +272,6 @@ static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
>   	writeb(data, dw_hdmi->hdmitx + addr);
>   }
>   
> -/* Helper to change specific bits in controller registers */
> -static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
> -					  unsigned int addr,
> -					  unsigned int mask,
> -					  unsigned int val)
> -{
> -	unsigned int data = dw_hdmi->data->dwc_read(dw_hdmi, addr);
> -
> -	data &= ~mask;
> -	data |= val;
> -
> -	dw_hdmi->data->dwc_write(dw_hdmi, addr, data);
> -}
> -
>   /* Bridge */
>   
>   /* Setup PHY bandwidth modes */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

