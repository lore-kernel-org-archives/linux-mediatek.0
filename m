Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E798CC02193
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2025 15:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPHIr1AdUQXL4S8PLOw7faEqsccJFgDRWTAC+UQvuk0=; b=jx0awhKkhbd4Clzk3riQdol73S
	PcyAyqmfYrGwg2X8gVAf3Tzue+GtQS/IpsfgdTphHR93vJFYdCRRHDGZA+i4Mtykp6ApU92s2AGLH
	uCXUY8RBjSQAoy7lohZffLozArfUfgRjE9RcjU+xfuf93bcfLYTYfisRkimY4IQ7RaliKui0zEagA
	om/GkoP04ZPR+zaaBdFdkqEMNDHUbUn1AGobPNaUo5+VgyVNESxcpJoS6uE4ZzyzC6VrRb0fWa33O
	drMqzCGimI6PpM8yHI31wymMEU2sXOKhZEeVvZAkKdAXgK53h+3hPu2gffk3imSbHioeo7ujPYGG0
	fBog7coQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAEO-00000007IYS-0GwO;
	Wed, 29 Jan 2025 15:43:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAEK-00000007IUi-0BdK
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jan 2025 15:43:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43626213fffso6048665e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jan 2025 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738165430; x=1738770230; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPHIr1AdUQXL4S8PLOw7faEqsccJFgDRWTAC+UQvuk0=;
        b=GU4O8tZKLB73x9D4DI44rFdy7QCbK4kMGm2TCEOpyGcZEq2OQyo1TVm4yNkPs3HDxs
         Le17NxZbPYA4+K4cFDTttu/wr40CjYNVsPWiQshWC/8SOvbhFILK+JBiDrpFyEnfgfxy
         huRyLvnc+ufSt9kmJ8tCzde7JgFKbCj7vgSp5cmkhDco0HdB7Pju9ik3pI0FV5eynNFC
         +Q3fTXeLQPGLQtzGtuESK3UXM++DndivgHWiZNLpxi5sGYsglEBaIMsJwHeqTJeA9BA3
         i7FE4TUr52qBnSozlHg+DWc91Adw+UTrsbI4vjfMW5MNK7COJ+VlZ51oqIvqnu9ZVoRn
         SnZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165430; x=1738770230;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hPHIr1AdUQXL4S8PLOw7faEqsccJFgDRWTAC+UQvuk0=;
        b=uV3Gn2PE4HW4K6zrKqdT77LWdg2pRwrdBXPNjWLH+FyD6d9bXq9DKcOlrm08C5J+Qj
         5t87++bvgQt7qZQRF3l9lg8UvFDa4Z6EKab9Qu1N66bqm6epx7ZW9+M3xbC5Rm0yOoCx
         zPuemdJu04RLX7An6g1G4NWtxdLCKZRotPqH7BlF2l+NpUM9Tu90B0J1m7Md61tRMoHH
         gv9EQooDMxP3T+cqwS5Yopu1RYf/JR5a7bST0x8Qf2oMqNZQy6UYl6xxGX2vWNjtFaDN
         xAX1y6oZa/ELpZ2WEohvYYHS3yuUwFjOo5lzDTbdjgcfHu/zgTSIqyXo4YQ6nE5USDTL
         Oy6A==
X-Forwarded-Encrypted: i=1; AJvYcCV90aP4xlqHotduFd6gwdcywj3wrVZdW1lHPooUmprsFQyJ2s+tAC/H6HJiQwN4RxQuW2gFahpBQes+VXzLNw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp+X19xd7ebCc4SjvCFhPX5tAU5F6rC4D8O1dZbAa5n68HT/4i
	YsxAkf3NFXyTIA6kGXILrS3zo3kg/uAHmkw2ExjvbxDkBjF8pIof+CwLVdtmEwo=
X-Gm-Gg: ASbGncuQA5yxEarVxL+dr2ncbrxdTQH1/vCmXXD6nrB5lSCZ2mLf6Bn+TInLJLbtYO5
	WVLpl4G6+FwVEhcEbODx4sdiwFxYrvSifdv4YvzrvhvQQBQ0Z7DIELGWgsdBrcSRl3DjQE7tUeD
	kjB/Gt8CysASLocVZ5iHGqPMiKukRJUe/xYnDxctrN6qIAYsP/prJHG3yYRNo2Wfh1nPI3rgb6P
	ldIJYdLU83iLmPEalnZdOMQbGviyx0gs8ZG4927xpM4XUD45Oq5reNyoqdnL9vWzkhiawVkGQ2p
	8jUgtXN0jb3m3ib3IaoPjy81C4WgLizHRM9NplwepI6aAAoSIOW4pXnZWmth93oT6nRg
X-Google-Smtp-Source: AGHT+IG+AzLiMQGtSlFoPMZbCjyIVlZSwQQSJOvatG/rHgk08wCvQOFvIicCJd/sEzgRT/WR6JlERw==
X-Received: by 2002:a05:6000:1f81:b0:38a:a019:30dd with SMTP id ffacd0b85a97d-38c50fe7e90mr3136677f8f.8.1738165430293;
        Wed, 29 Jan 2025 07:43:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188689sm17390387f8f.48.2025.01.29.07.43.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 07:43:49 -0800 (PST)
Message-ID: <c7c2f630-ee9d-4427-adc4-0d982f9e7593@linaro.org>
Date: Wed, 29 Jan 2025 16:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 05/14] drm/meson: move to devm_platform_ioremap_resource()
 usage
To: Maxime Ripard <mripard@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>
 <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
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
In-Reply-To: <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_074352_905996_49064EDC 
X-CRM114-Status: GOOD (  14.05  )
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

On 29/01/2025 16:40, Maxime Ripard wrote:
> On Tue, Jan 28, 2025 at 05:29:29PM -0500, Anusha Srivatsa wrote:
>> Replace platform_get_resource_byname + devm_ioremap
>> with just devm_platform_ioremap_resource()
>>
>> Used Coccinelle to do this change. SmPl patch:
>> @rule_3@
>> identifier res;
>> expression ioremap;
>> identifier pdev;
>> constant mem;
>> expression name;
>> @@
>> -struct resource *res;
>> ...
>> -res = platform_get_resource_byname(pdev,mem,name);
>> <...
>> -if (!res) {
>> -...
>> -}
>> ...>
>> -ioremap = devm_ioremap(...);
>> +ioremap = devm_platform_ioremap_resource_byname(pdev,name);
>>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>> ---
>>   drivers/gpu/drm/meson/meson_drv.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 81d2ee37e7732dca89d02347b9c972300b38771a..6c805805b7a7f675f8bb03944318972eb4df864e 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -184,7 +184,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>   	const struct meson_drm_match_data *match;
>>   	struct meson_drm *priv;
>>   	struct drm_device *drm;
>> -	struct resource *res;
>>   	void __iomem *regs;
>>   	int ret, i;
>>   
>> @@ -220,14 +219,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>   	}
>>   
>>   	priv->io_base = regs;
>> -
>> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
>> -	if (!res) {
>> -		ret = -EINVAL;
>> -		goto free_drm;
>> -	}
>>   	/* Simply ioremap since it may be a shared register zone */
>> -	regs = devm_ioremap(dev, res->start, resource_size(res));
>> +	regs = devm_platform_ioremap_resource_byname(pdev, "hhi");
> 
> Given the comment, this one should probably be skipped.
> 
Yes please skip this one.

Thanks,
Neil

> Maxime


