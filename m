Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14743606A324
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CytCy218;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GjDgoT8a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=; b=CytCy218F+bYh0eyNuK9m5XFR5
	I4b32nYtJZA5uuB5YMNanoJPxPHfpnLnOQZLcesXEmq1ZKJbZI2DXlwCyF8/enSD6Qde3+dW2ijw0
	iFX3SfyIvHDFTD9OXGeznCIGbklrcXW0QpfG1xgtWrVyorLRGdN/4+mk6npMKKMVB0PfqEbJXVL3o
	pzlJgsY/JONfPbgdlofuy4LpwfiZABkb4rXVLpB2smhiX2/PQMG9F8OpAI95KkTUfZrjvyq3GSr8W
	AH/X4fjVFkOCVkrxHf+5NzTiDRg0grkTu5FsxmBFYGTJsvsx3KA3tOec//vuF6ztSzsqnpSkezauQ
	t4AR2ASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs1H-0000000Gazs-3jTu;
	Mon, 02 Nov 2026 13:24:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNs1F-0000000Gayd-0QGJ
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 13:24:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so22941695e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 05:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793625851; x=1794230651; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
        b=GjDgoT8aWmLI8tyHthUGUbInC8nFjpPiOrDBx2K+Gu/7Ue7tuDVmWy8snUhOxdLkua
         fP+r5Bmm/6/OKPO0Q7y0GgWKDaMY6GaAbvequOtVXYU6TjWLJcRKnrmQGRxjJbwTb1+c
         a44fjgUqApj4XZHevUif3Rvnvx7FLS45WINxFRPNunUvTC5sx3gR5YAxmvMKWePk+U+s
         xjYcjq3tFYVXw3RF2khKc0U5DNpY1ERkGtsde17gHW6TO4V7jp0Y6llprTLtkUuqSufX
         LFB8uTVEskUVUV/86XzjcjhrAY7Cpgqw6ytqIFz+i+0Kh7TShpu85NPs/SLwubK3AV5l
         CM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625851; x=1794230651;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrlc0uPOpWufY4Ha9PM3YaR+47hyRCDT/vlwyZbcxAs=;
        b=T3aGfn/SxGnSq0Boyp2XEGoZy3DrHdM+gIE9n0ZWTiJYb/YChpO7LuKr/650IACmWX
         V3e2HYpB1KJ7iY33sWbHl+TVyM27Rx9pxKKFj+LS/SQuw2HvcLq7O313FitIz+Hdge6x
         XGXF7H0gFsSB9kLkEZqRrl+mF8d8q+EmCRI3fOcT61U8GvELQCuN2JMaz9iv0xpYhZwn
         vwNfYmOeplEuzjJnUsEIC/2e0v7A7xkuVYw4+Q8uFYRYGq1Px4W306hYggdPyUxIxLKV
         YkPfdQj9V5UrLyaW3Ttya+bUk2M8U+W21IsMpNyg2Rl0SmtwlCX4SgIfbpzYHBJq2HQc
         Vu2w==
X-Forwarded-Encrypted: i=1; AKwUvBzdIs5jyqTqz2k0Yqq99valI8u4TZH0yg4NvarMnS6G3mmDrkoXOOuTiVDoRbpyDZpQP1u+8kFpGxPjbqKTYw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIRYXoikrABoPxUJWEGdEEEBjElN/bIKzsz2cx0YvvEQA5u+szB
	cZx/rxNaF685b/K+IvjD3Mh80A3JO52rWLqg7HJTHnR/at5yRFoLvGNOWKb/ld8DdrQ=
X-Gm-Gg: AYBFou0hvuWqT4japobV0Ji01qo6QS6THY7h1cGojJ8ltMJw1A1LtD/JyG+zYnfzmZG
	RzU5meDJl6GgT2WKTwc5iBqkbFT3jhhDnzCqz9sbbpswsQPFrBDBnU5OC89gHgNMROtsX6MEMAN
	YfBnbKMYFahlT14tGdwno3TAbqhsvXGT9OsRKJqRM2Tb4aHmMx/KN3lk7GonmDGweYhTCbzG6x+
	vjFqXUokc1UkoygLPP8S+DLdshAjW2XXlGAwoefqfNq1p5fLsaZWHlCWoabZw0rcqhQuam7pdOk
	j/tIX+3dvxqI+WQ3J25QQo0P4wt8bTVlfX3lOCnCVTPZ8W3VdFon3j7i5oNXXFRYOSrRDyFE+D0
	kN1RAjRYri5D5ezqxv+dDIJkNtZCErZloWGYqUenpLRxciqboN7GBie8345q82lrQpwqHZjfJa1
	OCBBydDJoUERJ6Vfgr0YRrHVtPpUSaVtZ/uRLvNV/QZ3F46OTb4WMqKr1JnPhjZ+/uUXfebDyj0
	AxlJl0apHir+LeEmRB4CNQKOmUOlK0lZ9LV3znacy7KMLmviuDk+n6Hw53c8Z5yncjW68U/uXRs
	Jszktz2gG01ZijVW7UUuSif5XhYiD2A0308GbiXquVUu0TkD+bBnrYRZQdXIMSMe+EgNe0gasEs
	r82Iq
X-Received: by 2002:a05:600c:4e88:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ac16bc4713mr239062835e9.6.1793625850979;
        Mon, 02 Nov 2026 05:24:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9476:5165:3a16:262? ([2a01:e0a:106d:1080:9476:5165:3a16:262])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf7146621sm276611165e9.13.2026.11.02.05.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:24:10 -0800 (PST)
Message-ID: <620eb58a-bd8a-4679-84de-0285f10e0262@linaro.org>
Date: Mon, 2 Nov 2026 14:24:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] drm/panel: himax-hx8279: add the VDDP supply
To: David Lechner <dlechner@baylibre.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
 <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
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
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_052413_170602_EDBE66A8 
X-CRM114-Status: GOOD (  18.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/6/26 22:25, David Lechner wrote:
> Get and enable the vddp-supply along with VDD and IOVCC.
> 
> The Startek KD070FHFID078 panel has a VDDP power input, which the
> MediaTek Genio 520 and 720 EVKs switch with a regulator of its own, so
> the driver has to enable it for the panel to be powered on those boards.
> 
> On boards that do not describe vddp-supply, the regulator core provides
> a dummy regulator, so they only see a "using dummy regulator" message.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index 9e443c719843..fe665cd3a3d2 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -112,7 +112,7 @@
>   struct hx8279 {
>   	struct drm_panel panel;
>   	struct mipi_dsi_device *dsi[2];
> -	struct regulator_bulk_data vregs[2];
> +	struct regulator_bulk_data vregs[3];
>   	struct gpio_desc *enable_gpio;
>   	struct gpio_desc *reset_gpio;
>   	const struct hx8279_panel_desc *desc;
> @@ -769,6 +769,7 @@ static int hx8279_init_vregs(struct hx8279 *hx, struct device *dev)
>   
>   	hx->vregs[0].supply = "vdd";
>   	hx->vregs[1].supply = "iovcc";
> +	hx->vregs[2].supply = "vddp";
>   	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->vregs),
>   				      hx->vregs);
>   	if (ret < 0)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

