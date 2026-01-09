Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1577DD167FB
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jan 2026 10:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=; b=lU5Np1ZoW/960JI7WGEFlSW9o5
	UbFq6j+D519eM+xLVxOXfsyRivzG9U7Ou/KLHBSjBj3lL39aT/5l8MM30LkbvNWYwGYaC9JBYCFBo
	iWYFpbUjTxsRuGe1y/UNcSU2rlN/MSbimyjGlyo2T7qcJ0rc4FPWCtFMdNAaezuBndl9J8laiVaQj
	AReZ8iMvxRIXQ+l1NNtmjpJY/3iQzLu9rqu3p3+bV4ZBxlboVcEGwISKLb1fqU9Shvp7B3IgTYbsT
	SsLHF2bi+5AKPC4Sd/V3aytRREW+AWhS6AckxsKFGQjNmon/RKj5FIfI/bVRbrDmSRqUzwnjjzL/p
	xXK2XSNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Ur-000000026et-29yy;
	Fri, 09 Jan 2026 10:13:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9Uo-000000026dU-0KEN
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Jan 2026 10:13:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so3428036f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Jan 2026 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767953607; x=1768558407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
        b=dK92hhUSBpk1eTdTeovHqDPx80bXn/D3xQX8ashm6kWIdwYm7hdsB3pfFpV0LzJ1p5
         qchyUtmvi+U6LsHR0N+z7FVoKzIZpQzAX6jEnOsaF/3IqdheVHQZ/5bQP7diO8UHbXop
         WFvp1K3OB4Ao7Dlm4KT2fjECJLn93yQW2jbbzoLDeSGjmxZzQsVg7va6fEKlFdnlsoxq
         Gi5Yaq9nD6rpkIW05jzrNoyR2beD6A4LApBE189IgFgG9deqs0m6TjOOqwnbcNuHkLq7
         P58vAoP+Q3lhFB4Z2nvoCiu0QqrFomxsHQ2rVa/I5kygoEBvBeJ2sikbJzB7tNWq7fQ4
         SV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767953607; x=1768558407;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
        b=mTrXdDvmnX//yvgtrKLwGUFfoZByi0DQ7EhjHckhyHq681lcyqzfCPs7NSoZAWO1xQ
         HFboWDzuA4oCm55OJgLDyM0tdcTKI0SG3dBvW54zO8Wwpf/04jfmiiSjR4p6Id7u5Ys4
         uZvcaCR+M18m9QsckVhLg82YHZZjr9O9Fn5QNPExf3aDI32sDExgtNGHlRTWGCjuzsT6
         3pRhG3V9XnDxX2htopzn1XJoKxWTJuIJLTmr+VI1BW4d/DZ/FE5Ek5eUEg3fK/vuUgS5
         xu1dUemGQ2nrUDkgdVgGZBSzfhNN7JD2+pw5Zabyu/SJ+QJH6L1XXmJEwEtufSIqt5mP
         0/yg==
X-Forwarded-Encrypted: i=1; AJvYcCWOOPQVeYyp/1KQluSWnlVoVimyqiNOUKLXpD3anE5UohHjrKSnsoTTnuAqyWP+R5pM9JP5ocl7KkLj4IxcWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YytXMIJE71BAO8R0pBvqKH2OYop7BG76xKxWWnVva8ThdJ7T7ft
	PjyQG1w+3xV2pbKDpGq/Lt5qAHQkMerqwIuY3sAKyvJXnBHVoVk8fVJvGTmCkAIly7s=
X-Gm-Gg: AY/fxX6ARlTITHhnj4QjpWBZQtGn2DBQNIEYRzdLOPpW0Y8HoI2xnM9Ub6PyoaB7w74
	xB0g6OXl1Wakk1hCFSSQnMhqJTDDFwlVcC1XIh+g77BLd4cLYp1xom7C9ddxCPTarGDfHWe3a2W
	o59m3IWsI8kV/FlUBlM/kHjRg7IOvN+2LmxCtwETF6GIR7r7R6pyPMnfEu0ltRQQI9JdFBgbL17
	bCEbVf3H/4sIBsDdK/5UXWmyADr9Wphd1HBPsdIGTLIqeubZxE9tSigEfz4h0YBQ7YkU6PuR99v
	iTg9xS/yJ+05fC9A28UowHwjdtnHNBG1n0pRy+UzgY8AFEASzOGx/aYPnq0LVEL1yeSh4TdlPGG
	6Wv/DkhexQpQhzsFfpnw8j6aMYzUDsgqasbSwhwzyBXGD4JvMYVQKbKg6KbmE8hzpf/ZAWBm3mH
	xJnqoejSzJilJ9VPJOLnU19D81bBo6dLhMqCLAmayBsjTKvCBh/FB0FzLFJKuaqUY=
X-Google-Smtp-Source: AGHT+IFCikJ03J/WgyrsSQPwxIM5AkWewsU7YWY0NL1QPgGkyLNv66hXXYzshWOTAsB92VRUvv8j1A==
X-Received: by 2002:a5d:5f94:0:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-432c37c87e4mr11007824f8f.39.1767953607247;
        Fri, 09 Jan 2026 02:13:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e175csm21370007f8f.14.2026.01.09.02.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 02:13:26 -0800 (PST)
Message-ID: <ef2c22a0-3335-456c-9281-e54085c849d2@linaro.org>
Date: Fri, 9 Jan 2026 11:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
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
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_021330_135491_C86FF1E0 
X-CRM114-Status: GOOD (  17.51  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/9/26 11:02, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 0d7c68b29dff..fef1702acb14 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -778,7 +778,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(meson_dw_hdmi->hdmi))
>   		return PTR_ERR(meson_dw_hdmi->hdmi);
>   
> -	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
> +	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
>   
>   	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>   
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>   				   void *data)
>   {
>   	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	int irq = platform_get_irq(pdev, 0);
>   
> +	devm_free_irq(dev, irq, meson_dw_hdmi);
>   	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
> +	drm_bridge_put(meson_dw_hdmi->bridge);
>   }
>   
>   static const struct component_ops meson_dw_hdmi_ops = {
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

