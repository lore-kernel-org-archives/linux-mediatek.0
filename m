Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F20C9830E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2026 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=; b=kYCzAezfMzN1Y4ayUDcQOAeNXL
	gXT1H88NPWfVGEg2r+/cK8zaYzOU0EqhUzJ9gPUXoXGdKgThQ30/KqRMsDVTc46s2B/VEU+RNYPay
	TFyEMv0TxxUy2DIXsOsETST/Umbqm/VM+P9Hsf1TBoZ/S4npxwHdknWH1ZRX0B8tREkyrCCqQHGXQ
	YXgZf8XEBZGcntZx/FpjQXDoBuiM0iG+AAxb4ahfo8NWz9Ic7Z5iG5DNulhZi2hrSD+vykk2A046t
	UFqxuNDHQ0cgQwf3dC3E+mhbQMlixGJ6ZZyWOjPwFmly3W/DY81JesbzSVNujIWJi3oKQ92LNDByE
	fucUzzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jYg-0000000B6DI-0PjN;
	Thu, 24 Sep 2026 13:32:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jYe-0000000B6C9-1mPR
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Sep 2026 13:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=; b=n7ATsW/esAfVHg2Vqarm/pd9gt
	STmqROopUUusYQMDzC5gh6YHanfndQpGPG2/5vVtKMhzQhWsqPeRW+sPHC86j6fUoq8NZOmst9i85
	BL8tTDzPYbPr6xCzWijdZ20zUGaFo0NNJEPqopw/gtMKKJux1i/+DwYxDQqtK3LuTVUfkHhMtnZtl
	wA6j9Xtoqfvlc2jAvz7swFbjaxHP2aAPVhSE0oMFuLgc8A+QcVr+39+Au2OkJ0lkutd+233UuA0CV
	7qVOBE6ljG3AUWWV3NX7qxqZ6z3bmJsBdrCS/Nqy/uPqKnqK3moqLl+oer8BPtilgAmFomo+6MZth
	snklfdmQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9jYb-0000000G1vN-1ror
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Sep 2026 13:32:15 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3931so15947065e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256732; x=1790861532; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=A/z2Cbt7XBcgk0bg+0BMk2NJeJg57EMreskA0lidLX095oKYeN+o8sExaMxgvU5bks
         ae2TooWIkJ/Osm/yUC6TLvpm9L6ylDOfiIhHiwxDSoDsJ3ZBvi3FJUeL5w18aJ2+Jhc0
         3ifEtAbQ76JCF5LQ5bIqxmmSqRgfyUQiwOuwkIMnhWsbZSzC/9m5sFqvzDzOzBqOyQ54
         BSFeLr8fDabrpdrg54SQy4QKmlcTefSmULji326RC/6sP5PNZi5qCui5fvx+1N/Swu43
         bBnVKbmw5jX6O7aeXuJze+IKbX0zxbeg4pZUGb2usCuX81s9DGfNC6dS+lQJ84KY2UPN
         NoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256732; x=1790861532;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=ELVAbCkb43F0i8LouS0yXEkJ+jm3HnWOw2OTjnZNOF+pLsrjp325rytbbblIqputFE
         mPEnP4QUt1n1bdG/71gpLRYgPS8GPGI+79IGF7kxbYokCo8yl6gxEuPIgoyKXuBHSUN3
         vCrZmnGFuWy+Ty1HMkrLV0+/rSPfN9Cesn4O72v+YnxzM8wRWvHffTwRYpOStQSUJGDo
         bdXD4uZvdhRZt//QhhcDgpEAwJhmKloUhHSbxOMFoGqoRp80kSQ/6QHj9bs/nYVACI1+
         pyeRo2rXbV2HzQkXODPQw/xAiCLwk8UEYqZsRu3aG0iG/aRT40Y9vL1gXgKqAi3QOrzZ
         G5wg==
X-Forwarded-Encrypted: i=1; AKwUvBz6KsUymjSt97uahQ9X9j8+fTCQeituSEtoPKV3s2SnveKqt1JIn3ddMfu7CEYGBJvNcvtK9LWDtNvBkIaiEg==@lists.infradead.org
X-Gm-Message-State: AFuF++ly6pvzyYhWan7gpOK+a6IgshFKd6UlyTCv5PJ72s1uq2RvKbNP
	O6ptw2J0oxr2r7x1AQoNBiUKHM6E8EO6CZfH17jwvbHIc7WQY3xLXRTVATt61w7+1pY=
X-Gm-Gg: AYBFou1RQo94lCAGkb8IMhdGvEX6pKS27MGNKzGTJIOjjpp1yVIn7apFnP25yuWMd76
	Vp/6strU3c+GHbQhcsQSHRWcwVimDOnqNy37GTIcJ7zR3ak8atobiPBJT4kaG3vjfR1/O6kjlhW
	C69GV02WO9Anya1gIEf2MZTfRpgnIM4eG78CFhMJFwz/QcMnqS52VDSapCjwg8hCen8iUZ7DWpX
	SVfI6Vlzj8ljpYnvuw+gK9m1sbGbPrLd0rzVaJJPX7i1RXd3f08CYyIumw1ia/EnXWnW5ruCkiY
	cMRh5C5q2x0miO06XZ9Mt84e1HiHW808E2yRXUMsYTg0e+kfI96m1k1cR6ZqSt1/QABc5NGT/lV
	hXcQm//gk2XNZBlVIxBP/G+gfArHpQQJ29d4T9A7ircWg36Oy5TInCiTnLqrX/kkLdOhdhpS7gj
	XGSmIs7Bk1fQ/T8pNjPtKAHU8Eg30uf20PdoI8MusehPxhxHoSqOM0OW1uMiOdpylEik6MIuJ0R
	uea2+kyAcfhu+7pg+TfTgI2eNm/4LxncySEexA/Xm0DVGgJuT2kzg==
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr43287325e9.3.1790256731984;
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm66794335e9.6.2026.09.24.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Message-ID: <42dea883-cbbf-4835-b8f0-b27a016ec339@linaro.org>
Date: Thu, 24 Sep 2026 15:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add myself and Ryan Brue as
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
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
 <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
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
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_143213_669586_721D7406 
X-CRM114-Status: GOOD (  11.02  )
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

On 9/17/26 14:51, Nickolay Goppen wrote:
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

Send again with a commit message.

Neil

