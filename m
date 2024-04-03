Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17D9C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 07:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geNaRfEIOujwtBOUShY9nwBxqmYXpD+/mHRnOtbcQkE=; b=h5gSGrr5FzxTX+krcWBcv3yvV7
	VHX35nlM/s4iHF8vCXUakaJnNI+TIEVf1IPlWQ1+aUM3k+kSOdisPabtAIYKGs7WoCwJOoNdOVlk+
	f1zUbry9XDbvkHG1dw2zTtUDUDd48ZxCZimwNrb+8ByN42HMC6zm2UwveUro/zVFrMxaYhCWyGNim
	c1Z24voREKJsczVgvgCTc7XY+RRoMzDDY6PrR4UklFVCcqExtDkhcFOJ6Fn0XEcQoGzXmonwgON6z
	8Kn8DADoQjpHFDKB5MoFMSL7kse30mY322krmQtzqClIlvoxCEJGDJ8U3xPGPeXQNWIUZklpFnk6R
	i2U8+bUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvBl-0000000EZNI-1KyI;
	Wed, 03 Apr 2024 07:37:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvBf-0000000EZGu-1PoV
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Apr 2024 07:37:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3436ffe05c9so1000103f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Apr 2024 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712129853; x=1712734653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geNaRfEIOujwtBOUShY9nwBxqmYXpD+/mHRnOtbcQkE=;
        b=Cjf+4FJB9hH8EPqEbjLZgknOKuNvQ0FEA6IvthjMX0cMwWIVsU/PIM3cm4aYJoITVV
         bCDr7d419Kk2mhQKOM4klNPS/kYJtsHg+1uzXYfOxTPifyleFOsqv/uZAiI/ORYb35bh
         vbhZQWP9GTfaQLbCyc+aP8oUqteTyxXihDBOCeCteHIInm+dtnEeSQRiAh3nCqRiutdx
         jUjQE4nW7fafE6HsydeLc5iTt39MCm+crTFBShrNdqTnkkRnuhRkcYpJ5QnrY/f8n/2T
         +lPW7psOJ2ztkQ1GQysKlmtHmqjvEVtTEsH6e3rxxYtDUDCLrFt2N+qlPUFjBMtSUYd3
         wx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712129853; x=1712734653;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=geNaRfEIOujwtBOUShY9nwBxqmYXpD+/mHRnOtbcQkE=;
        b=wNSwY6SDhVkIzkKi3ni0VE3fgkiUudmfjU1X44Djoc7QFuRf96D3HJdBLR2lU7DQwd
         yP6uC5PlZWzl+YZ9INbUuQCPs8cIt65ocJE81g/bQwOvc39Xz4HmMXgv+3Ejbb64zITM
         0XTxRHAbyhaRgRyk72R+gFpwSgs+5mzPCBPn8o3OGhjWxnDKfvHe5GBm1USv3EFRoB/B
         3BbgzVGSyMYBsMLvLhj4ysWp7X80ED4pWtA67GLwpktt5o90gZCX1I19V0kxV/AsOFmp
         +AbwFadsU5p8JBf17ubevZRcND5djT5eWF/ukPJeBr1udBMXUA99EENnKHjd3lq7lZwh
         uJPg==
X-Forwarded-Encrypted: i=1; AJvYcCVx62raROFfMkNRjwhzif0F48ma/zedovCVpKm8vHP+xq0N9dTqA11T+CiWR1u5Pxf8UP2U1bYF6pZdAPkG/KpG1gwela0iejsfEJWgSxqdB45X
X-Gm-Message-State: AOJu0YypJehp8vZrqE5qfPZbYZ/EO6VT5JjPRNiy8Pd3+tx8NZ2Wi3QZ
	xrDPkeNluZVXhTqb6S6dDDVetHjYxXSDHQDnA42fTU5z7rv/UuWOooGIFaFBY7E=
X-Google-Smtp-Source: AGHT+IEbYXZQ1kBd1abb3np2eMxoOx5CTXOOtylFlOtLCsBr/9Y2EzqqkWkq5FxSgC0vZVo69UGQZg==
X-Received: by 2002:adf:ed8e:0:b0:341:abd4:a6e8 with SMTP id c14-20020adfed8e000000b00341abd4a6e8mr1366658wro.60.1712129852474;
        Wed, 03 Apr 2024 00:37:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:d6d:8d9b:bb47:c974? ([2a01:e0a:982:cbb0:d6d:8d9b:bb47:c974])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d6385000000b003437e334a4dsm2486617wru.69.2024.04.03.00.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 00:37:32 -0700 (PDT)
Message-ID: <0ca97dbb-f6dc-4e62-b292-2f7d1d590cfd@linaro.org>
Date: Wed, 3 Apr 2024 09:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v8 7/7] spmi: pmic-arb: Add multi bus support
To: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
 <20240402-spmi-multi-master-support-v8-7-ce6f2d14a058@linaro.org>
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
In-Reply-To: <20240402-spmi-multi-master-support-v8-7-ce6f2d14a058@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_003735_549454_3F9E852E 
X-CRM114-Status: GOOD (  29.71  )
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

On 02/04/2024 14:07, Abel Vesa wrote:
> Starting with HW version 7, there are actually two separate buses
> (with two separate sets of wires). So add support for the second bus.
> The first platform that needs this support for the second bus is the
> Qualcomm X1 Elite, so add the compatible for it as well.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/spmi/spmi-pmic-arb.c | 138 +++++++++++++++++++++++++++++++++++++------
>   1 file changed, 120 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> index 3db622ed80de..52b9e275a7b2 100644
> --- a/drivers/spmi/spmi-pmic-arb.c
> +++ b/drivers/spmi/spmi-pmic-arb.c
> @@ -13,6 +13,7 @@
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> +#include <linux/of_address.h>
>   #include <linux/of_irq.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> @@ -95,6 +96,8 @@ enum pmic_arb_channel {
>   	PMIC_ARB_CHANNEL_OBS,
>   };
>   
> +#define PMIC_ARB_MAX_BUSES		2
> +
>   /* Maximum number of support PMIC peripherals */
>   #define PMIC_ARB_MAX_PERIPHS		512
>   #define PMIC_ARB_MAX_PERIPHS_V7		1024
> @@ -148,6 +151,7 @@ struct spmi_pmic_arb;
>    * @min_apid:		minimum APID (used for bounding IRQ search)
>    * @max_apid:		maximum APID
>    * @irq:		PMIC ARB interrupt.
> + * @id:			unique ID of the bus
>    */
>   struct spmi_pmic_arb_bus {
>   	struct spmi_pmic_arb	*pmic_arb;
> @@ -165,6 +169,7 @@ struct spmi_pmic_arb_bus {
>   	u16			min_apid;
>   	u16			max_apid;
>   	int			irq;
> +	u8			id;
>   };
>   
>   /**
> @@ -179,7 +184,8 @@ struct spmi_pmic_arb_bus {
>    * @ee:			the current Execution Environment
>    * @ver_ops:		version dependent operations.
>    * @max_periphs:	Number of elements in apid_data[]
> - * @bus:		per arbiter bus instance
> + * @buses:		per arbiter buses instances
> + * @buses_available:	number of buses registered
>    */
>   struct spmi_pmic_arb {
>   	void __iomem		*rd_base;
> @@ -191,7 +197,8 @@ struct spmi_pmic_arb {
>   	u8			ee;
>   	const struct pmic_arb_ver_ops *ver_ops;
>   	int			max_periphs;
> -	struct spmi_pmic_arb_bus *bus;
> +	struct spmi_pmic_arb_bus *buses[PMIC_ARB_MAX_BUSES];
> +	int			buses_available;
>   };
>   
>   /**
> @@ -220,7 +227,7 @@ struct spmi_pmic_arb {
>   struct pmic_arb_ver_ops {
>   	const char *ver_str;
>   	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> -	int (*init_apid)(struct spmi_pmic_arb_bus *bus);
> +	int (*init_apid)(struct spmi_pmic_arb_bus *bus, int index);
>   	int (*ppid_to_apid)(struct spmi_pmic_arb_bus *bus, u16 ppid);
>   	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
>   	int (*offset)(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
> @@ -309,8 +316,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
>   			}
>   
>   			if (status & PMIC_ARB_STATUS_FAILURE) {
> -				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x)\n",
> -					__func__, sid, addr, status);
> +				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
> +					__func__, sid, addr, status, offset);
>   				WARN_ON(1);
>   				return -EIO;
>   			}
> @@ -326,8 +333,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
>   		udelay(1);
>   	}
>   
> -	dev_err(&ctrl->dev, "%s: %#x %#x: timeout, status %#x\n",
> -		__func__, sid, addr, status);
> +	dev_err(&ctrl->dev, "%s: %#x %#x %#x: timeout, status %#x\n",
> +		__func__, bus->id, sid, addr, status);
>   	return -ETIMEDOUT;
>   }
>   
> @@ -1006,11 +1013,17 @@ static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
>   	return 0;
>   }
>   
> -static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus)
> +static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus, int index)
>   {
>   	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
>   	u32 *mapping_table;
>   
> +	if (index) {
> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
> +			index);
> +		return -EINVAL;
> +	}
> +
>   	mapping_table = devm_kcalloc(&bus->spmic->dev, pmic_arb->max_periphs,
>   				     sizeof(*mapping_table), GFP_KERNEL);
>   	if (!mapping_table)
> @@ -1253,11 +1266,17 @@ static int pmic_arb_offset_v2(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
>   	return 0x1000 * pmic_arb->ee + 0x8000 * apid;
>   }
>   
> -static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus)
> +static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus, int index)
>   {
>   	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
>   	int ret;
>   
> +	if (index) {
> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
> +			index);
> +		return -EINVAL;
> +	}
> +
>   	bus->base_apid = 0;
>   	bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
>   					PMIC_ARB_FEATURES_PERIPH_MASK;
> @@ -1329,6 +1348,50 @@ static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
>   	return pmic_arb_get_obsrvr_chnls_v2(pdev);
>   }
>   
> +/*
> + * Only v7 supports 2 buses. Each bus will get a different apid count, read
> + * from different registers.
> + */
> +static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
> +{
> +	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
> +	int ret;
> +
> +	if (index == 0) {
> +		bus->base_apid = 0;
> +		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
> +						   PMIC_ARB_FEATURES_PERIPH_MASK;
> +	} else if (index == 1) {
> +		bus->base_apid = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
> +						  PMIC_ARB_FEATURES_PERIPH_MASK;
> +		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES1) &
> +						   PMIC_ARB_FEATURES_PERIPH_MASK;
> +	} else {
> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
> +			bus->id);
> +		return -EINVAL;
> +	}
> +
> +	if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
> +		dev_err(&bus->spmic->dev, "Unsupported APID count %d detected\n",
> +			bus->base_apid + bus->apid_count);
> +		return -EINVAL;
> +	}
> +
> +	ret = pmic_arb_init_apid_min_max(bus);
> +	if (ret)
> +		return ret;
> +
> +	ret = pmic_arb_read_apid_map_v5(bus);
> +	if (ret) {
> +		dev_err(&bus->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * v7 offset per ee and per apid for observer channels and per apid for
>    * read/write channels.
> @@ -1581,7 +1644,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
>   static const struct pmic_arb_ver_ops pmic_arb_v7 = {
>   	.ver_str		= "v7",
>   	.get_core_resources	= pmic_arb_get_core_resources_v7,
> -	.init_apid		= pmic_arb_init_apid_v5,
> +	.init_apid		= pmic_arb_init_apid_v7,
>   	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
>   	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
>   	.offset			= pmic_arb_offset_v7,
> @@ -1605,6 +1668,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   				  struct device_node *node,
>   				  struct spmi_pmic_arb *pmic_arb)
>   {
> +	int bus_index = pmic_arb->buses_available;
>   	struct spmi_pmic_arb_bus *bus;
>   	struct device *dev = &pdev->dev;
>   	struct spmi_controller *ctrl;
> @@ -1623,7 +1687,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   
>   	bus = spmi_controller_get_drvdata(ctrl);
>   
> -	pmic_arb->bus = bus;
> +	pmic_arb->buses[bus_index] = bus;
>   
>   	bus->ppid_to_apid = devm_kcalloc(dev, PMIC_ARB_MAX_PPID,
>   					 sizeof(*bus->ppid_to_apid),
> @@ -1666,12 +1730,13 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   	bus->cnfg = cnfg;
>   	bus->irq = irq;
>   	bus->spmic = ctrl;
> +	bus->id = bus_index;
>   
> -	ret = pmic_arb->ver_ops->init_apid(bus);
> +	ret = pmic_arb->ver_ops->init_apid(bus, bus_index);
>   	if (ret)
>   		return ret;
>   
> -	dev_dbg(&pdev->dev, "adding irq domain\n");
> +	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
>   
>   	bus->domain = irq_domain_add_tree(dev->of_node,
>   					  &pmic_arb_irq_domain_ops, bus);
> @@ -1684,14 +1749,53 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>   					 pmic_arb_chained_irq, bus);
>   
>   	ctrl->dev.of_node = node;
> +	dev_set_name(&ctrl->dev, "spmi-%d", bus_index);
>   
>   	ret = devm_spmi_controller_add(dev, ctrl);
>   	if (ret)
>   		return ret;
>   
> +	pmic_arb->buses_available++;
> +
>   	return 0;
>   }
>   
> +static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
> +					struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->of_node;
> +	struct device_node *child;
> +	int ret;
> +
> +	/* legacy mode doesn't provide child node for the bus */
> +	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
> +		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
> +
> +	for_each_available_child_of_node(node, child) {
> +		if (of_node_name_eq(child, "spmi")) {
> +			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
> +{
> +	int i;
> +
> +	for (i = 0; i < PMIC_ARB_MAX_BUSES; i++) {
> +		struct spmi_pmic_arb_bus *bus = pmic_arb->buses[i];
> +
> +		irq_set_chained_handler_and_data(bus->irq,
> +						 NULL, NULL);
> +		irq_domain_remove(bus->domain);
> +	}
> +}
> +
>   static int spmi_pmic_arb_probe(struct platform_device *pdev)
>   {
>   	struct spmi_pmic_arb *pmic_arb;
> @@ -1762,21 +1866,19 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>   
>   	pmic_arb->ee = ee;
>   
> -	return spmi_pmic_arb_bus_init(pdev, dev->of_node, pmic_arb);
> +	return spmi_pmic_arb_register_buses(pmic_arb, pdev);
>   }
>   
>   static void spmi_pmic_arb_remove(struct platform_device *pdev)
>   {
>   	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> -	struct spmi_pmic_arb_bus *bus = pmic_arb->bus;
>   
> -	irq_set_chained_handler_and_data(bus->irq,
> -					 NULL, NULL);
> -	irq_domain_remove(bus->domain);
> +	spmi_pmic_arb_deregister_buses(pmic_arb);
>   }
>   
>   static const struct of_device_id spmi_pmic_arb_match_table[] = {
>   	{ .compatible = "qcom,spmi-pmic-arb", },
> +	{ .compatible = "qcom,x1e80100-spmi-pmic-arb", },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

