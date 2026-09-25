Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4BEC98324
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=; b=zl82pmj9IVEyFHltI48vHjL0sG
	k1KWOD2FJZ4vY2nNvaWRg2zVtrqQE2Gw03DvWSL45z4ShyyYPqT73G06PlC2m8pKaRGu7C0WUFs7a
	fY/OWx0anuh+Nygif/rSScgxb9h4Omtji1sUKB3qn3+kDICoC4PoRs4F9EqP+IUjnA8AOsNBBQVTb
	g4de0M7WnPuaVcNchivA7fe4sKLpb9IOLytBwMZ0vLaj9O1Hp29gC3+XCrMAzsyRUmWDml61D6kb4
	APtG7x5P0kH19iRalGV7xcvuZagdSCrc+DSicd1dZo+W9/JTAQ0aftl8YCadiU9q0s8aHhjgEH2ra
	Y5RKhKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1aM-0000000CvS1-3rA3;
	Fri, 25 Sep 2026 08:47:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1aL-0000000CvRX-25p2
	for linux-mediatek@bombadil.infradead.org;
	Fri, 25 Sep 2026 08:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=; b=S0tq1ws/iSJgLBRa7+0JrW7wLL
	unERD9eFTfuSCEdfLe/XGHKzdTEUJNs8+hZUukHCGNJSMG9SEa99RFxr8SDwOi7ZaY0EuldUR7QcL
	HbKeuLHfenV2PDjpak+5d9jH6E1eF1/V1Pc/bGWRgDDqTUT1D7CmTFMsDmXDerbPcF6cIuBvCoIPk
	r8Pg79AGlh6Z8ujHhOfzeshEHCLUCc5dDGjucTIsHa86k9MafjZCLaZVIsCkl7LfC1X01l95eF8ht
	4eehAY761Ck/MSHN/wMmWyBCvJn0ZmmtrK7FeTOF73eWdJv6b0x3M5iW6rypG5ly5Di35AG2YqKUr
	/kgR2piw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA1aE-0000000Gk04-3YzI
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 08:47:12 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so3961735e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790326025; x=1790930825; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=;
        b=cEa7N8aNVVMrFEubCtvXx3EfE99YdIh3I6DsiMBYfRtVcNPEy97FVH4o8t01TqsRcQ
         DmwyfYjo1qbRHnwpUyrTfqhoUpolAix0+uyl0RNdUkrOxLT7tM+5/S4duBeZK/Sz3b1v
         0juOUGUxAQoYNsDmfqufVqaYbpv5B5GPFQ1atNlGXD1lrbgoNG9zkgyZq7KPO4WOUQC4
         9rGPVbUE5IMsA7Uc1xexkE7NPgUvCj4b/t51rvcPNz3QBKsvfvuUZSLCAjISveHaSLYN
         G4r92wte9txH1j+4uIn42LG3XnUbSs6/0eMv+Y7gJI5+6lW1i6Sbh7Lc0IJYeEV4FCSC
         V1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326025; x=1790930825;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=;
        b=moDzOvaSJgAwjI9n3GHvSMChSrboLR+8qa9CaQu+xS2s+fhYv/implE6s5cxutC44E
         +UeDgapmYfW2YeyUxVOc5trq6vSeC6zYXTzSyJtQUoCaeThWHJ5hpOJuF/0n9ry5igj8
         t8qA48ypRFj7cgPzqeYFgxlawvdkYY3ct+XoHTHHgTxyscJ8nssMxqx12v84iQEjGC9q
         XGJCquSyfIrwZ/URBjHJgozbgRHaaauzLqk+vxi8VdHC9tHs5jaVkI10XnqDTp+t27r5
         ApSe/Vw62I/eM3kL9uIHHqMDCLDSr98J11wpS2u7E+Urg0OQpzaLwN8vQz0JAjLjlO8X
         LOVw==
X-Forwarded-Encrypted: i=1; AKwUvByzBjJ1wkUdr0AVQDxFMWcqXatgOiomyEntQkZjZ7fMnB7H+MyYE+O/1VVIaIvqtT3Cpla85T0EWC6zMLfvjw==@lists.infradead.org
X-Gm-Message-State: AFuF++nKD0CfzFMOyp9wN7iEc6s9krnLPJcfa3WGfuH35YOKmITyeEYL
	wtZeJQKeASjhVZIwzugcdbqzZ9EAp+kyGEjVK6Hwb94vDHaOIqIKw1sULgtFmKsUeXM=
X-Gm-Gg: AYBFou19tuXneFwE3Pqx/BZwjLMLUDIxOL4DGGHcahe6PSVFLmaZfN58CeW6SKr/S2A
	TsLUeOESRYleB19jeTNVE7By4QMtjkAS/3Q7tvbaU//s/NnAiXQe0P5Lg6FoVBakkW4RPlbBTj2
	bjYOn2ymdLsEeSBZti2ISMlIka4yC0rQ3xc9XNKLgIrSvCyD6xlxIokAfMGyH5oiBk5Jgh8w3fi
	4LDCd2OU2f+jymCPRrI3Gz8OpP0ftNzLaWy7ChS+h5qS8nCOuGa0M8snETNpugKI504KS04hm2T
	a73YYRsk9+ItBxoB91W+EYZh+yg/wpcHOJdqUnrLC8TuUVRfURdLr/FNDi9aXmvW3QRYDY6CfI8
	RyWJDcKSYthd6klSDLQRv4A4klU0LGPFNYHaM/jEwrW8ddwzn8rmk1HKHlHYEhf4tyCUPCI1whQ
	G2SOolp3OUfooA39vj8W2+IqbyhXGvBnWUnc/Qydu5N6tNl4I6Wn6SI5uVhrAwCqn6AH9euBSr6
	FwZhUPzQLweegSO6O91UO+v4LomYBnKCntrDCDGhNDGo4r2LKGy/jE=
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr87493745e9.0.1790326024865;
        Fri, 25 Sep 2026 01:47:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3151:fc9b:d41c:770b? ([2a01:e0a:106d:1080:3151:fc9b:d41c:770b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff04440e2sm41053585e9.0.2026.09.25.01.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:47:04 -0700 (PDT)
Message-ID: <6399bb18-f463-4d6c-80e1-0efca5e7768d@linaro.org>
Date: Fri, 25 Sep 2026 10:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
 <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
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
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_094708_744243_5D668B60 
X-CRM114-Status: GOOD (  11.72  )
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

On 9/24/26 17:08, Nickolay Goppen wrote:
> Add a maintainer entry for the new NT51021 panel driver
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7291238bc09f..743c785b4558 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8354,6 +8354,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>   F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
>   
> +DRM DRIVER FOR NOVATEK NT51021 PANELS
> +M:	Ryan Brue <ryanbrue.dev@gmail.com>
> +M:	Nickolay Goppen <setotau@mainlining.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
> +
>   DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>   M:	Lyude Paul <lyude@redhat.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

