Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6703CCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 08:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+R+mLMFOJFLXv5vS3Pr1o1ss6hqvr1UyFoTXxVcLIo=; b=LOPBqMUG1MXmAj7+QQddiS7Igy
	vTwToNuXyppTKapH9nY2zK1rxmNk3aY1/TdMAs1CGt66sFN1ucB/RmHd18wpUjSj6Uy9RxToitKTj
	n1zSrEBhrU26OnZAErueydPc6tXt04aQGwgGMYxPmR9OQqRrQ5aT/6UpZ0+qxe+O3wXUMD5fAXO+g
	R5GdJTpYPKOB8fXgTAJrhPEltVHIju8uBvYqfBNFNgWI+N8etU5GzLvh2QdJGOQFu73vZRbyDbaHu
	vMKgNaN/sl+1Alih9cji+DdmXxN05ttFQS/4YWS43oAtiTS1cpRna601PS6GasqN6WFnH7Gx89EtV
	NZNsWpHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZvV-0000000AKVj-1yP4;
	Tue, 02 Apr 2024 08:55:29 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrZvS-0000000AKUz-0KBb
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 08:55:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e00d1e13a2so32199895ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712048125; x=1712652925; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+R+mLMFOJFLXv5vS3Pr1o1ss6hqvr1UyFoTXxVcLIo=;
        b=EKs5Ue5gFMg/5H+VJcpc67sX8RrAVye59aTVOgTk49VjSccYGrB2gYZ5Ms4TSpOgDC
         dPEumWWdCeOL8a9qfCO3BtftKYhqm0GsglYf+DhYywdl6rfZAImeMOBZmJs4dgvGpjxB
         jzaSih1WHrYvlkvYypqqWZx8wvUm/+RkgivLi76I6zHVqwmR09DNY2v3UczGCnb+XxEd
         5Ltr6Ru8x9ZDWiureRLRLOV4FQOKepAwLZnIi5HfoXVpA63m8ipbpwO1nUZ9e3BkVrGf
         my9Wze4LtYHLSF4KYsr+g5xT/3u66WLATlcTutjOkmV5RnROWuNjoCzMSgJuALRwuayU
         Hzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712048125; x=1712652925;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f+R+mLMFOJFLXv5vS3Pr1o1ss6hqvr1UyFoTXxVcLIo=;
        b=HBLL323/KuDYqfrgSJ1Q2eX3jsQzhO2sXG2IYi/iGyYWkgDxlFF8M70jktWj26ST1d
         by3IvsdtsDTAfTul0r2HH/ldEFArdA3IkDMFXhVZC50ocWpYZGlIc1bebrd3PxtBs1YI
         qu0YV6tOoZpFP/wHSzS7TpbwLYCunPmfkg5N/Nccln5gOVGrD0DredlDgn8rfsgn80OH
         QDzxp4JvAgmWeCh4Ie4PzcryY8Okpi/og2k15P32FQWCnZY4cdo5I49HYUH8YykeqyKQ
         zxHwPToxVor+ADY8OS8MeKxmuA38rBM1js5NtsuhZP6bUi1jyRccmS5tZm6dn5Fqy3NQ
         C99w==
X-Forwarded-Encrypted: i=1; AJvYcCV/9eoJwnEsYj2J+aX1kP9QKfOn3HWEY6FEJ3z7ldyiz3jU9WLcbP62G3V3UtPVe8gn+mtXm3ymIcMFmB133r0TnudRqkCsFwWURkarsAMDdbXq
X-Gm-Message-State: AOJu0Yx3oujzCnVixnJt1sQuZ9jF0KsTKbs5JHDdsatXqF9zwZc2uHif
	B11bi7r1GTEFV7UOEB7v4Ja2aBAmPo8iJWjs3dqa1C1uhMCL80jwAueeyLK9BAA=
X-Google-Smtp-Source: AGHT+IEbX9JnkqeOZsehIjP9iAc7jCIKkTip7u8M1yw8RHp8s5JujMub1rSRlFfBgRWQo0jfm3NTOg==
X-Received: by 2002:a17:902:c94f:b0:1dd:a912:2db3 with SMTP id i15-20020a170902c94f00b001dda9122db3mr12261850pla.17.1712048125006;
        Tue, 02 Apr 2024 01:55:25 -0700 (PDT)
Received: from [192.168.7.190] (82-64-249-211.subs.proxad.net. [82.64.249.211])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c10d00b001dbac604e4dsm10485159pli.146.2024.04.02.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Apr 2024 01:55:24 -0700 (PDT)
Message-ID: <d04dd893-7fd4-48a3-9b6b-19bd3b5a78f6@linaro.org>
Date: Tue, 2 Apr 2024 10:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 6/6] spmi: pmic-arb: Add multi bus support
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20240329-spmi-multi-master-support-v7-0-7b902824246c@linaro.org>
 <20240329-spmi-multi-master-support-v7-6-7b902824246c@linaro.org>
 <871bc3f2-d4c3-4c83-ad0c-04c65ed15598@linaro.org>
 <ZgvG08kfV2PvzLeb@linaro.org>
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
In-Reply-To: <ZgvG08kfV2PvzLeb@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_015526_274479_2F8E45C8 
X-CRM114-Status: GOOD (  23.24  )
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

On 02/04/2024 10:50, Abel Vesa wrote:
> On 24-04-02 10:25:52, Neil Armstrong wrote:
>> Hi Abel,
>>
>> On 29/03/2024 19:54, Abel Vesa wrote:
>>> Starting with HW version 7, there are actually two separate buses
>>> (with two separate sets of wires). So add support for the second bus.
>>> The first platform that needs this support for the second bus is the
>>> Qualcomm X1 Elite, so add the compatible for it as well.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>    drivers/spmi/spmi-pmic-arb.c | 138 +++++++++++++++++++++++++++++++++++++------
>>>    1 file changed, 120 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
>>> index 19ff8665f3d9..56f2b3190d82 100644
>>> --- a/drivers/spmi/spmi-pmic-arb.c
>>> +++ b/drivers/spmi/spmi-pmic-arb.c
>>> @@ -13,6 +13,7 @@
>>>    #include <linux/kernel.h>
>>>    #include <linux/module.h>
>>>    #include <linux/of.h>
>>> +#include <linux/of_address.h>
>>>    #include <linux/of_irq.h>
>>>    #include <linux/platform_device.h>
>>>    #include <linux/slab.h>
>>> @@ -95,6 +96,8 @@ enum pmic_arb_channel {
>>>    	PMIC_ARB_CHANNEL_OBS,
>>>    };
>>> +#define PMIC_ARB_MAX_BUSES		2
>>> +
>>>    /* Maximum number of support PMIC peripherals */
>>>    #define PMIC_ARB_MAX_PERIPHS		512
>>>    #define PMIC_ARB_MAX_PERIPHS_V7		1024
>>> @@ -148,6 +151,7 @@ struct spmi_pmic_arb;
>>>     * @min_apid:		minimum APID (used for bounding IRQ search)
>>>     * @max_apid:		maximum APID
>>>     * @irq:		PMIC ARB interrupt.
>>> + * @id:			unique ID of the bus
>>>     */
>>>    struct spmi_pmic_arb_bus {
>>>    	struct spmi_pmic_arb	*pmic_arb;
>>> @@ -165,6 +169,7 @@ struct spmi_pmic_arb_bus {
>>>    	u16			min_apid;
>>>    	u16			max_apid;
>>>    	int			irq;
>>> +	u8			id;
>>>    };
>>>    /**
>>> @@ -179,7 +184,8 @@ struct spmi_pmic_arb_bus {
>>>     * @ee:			the current Execution Environment
>>>     * @ver_ops:		version dependent operations.
>>>     * @max_periphs:	Number of elements in apid_data[]
>>> - * @bus:		per arbiter bus instance
>>> + * @buses:		per arbiter buses instances
>>> + * @buses_available:	number of buses registered
>>>     */
>>>    struct spmi_pmic_arb {
>>>    	void __iomem		*rd_base;
>>> @@ -191,7 +197,8 @@ struct spmi_pmic_arb {
>>>    	u8			ee;
>>>    	const struct pmic_arb_ver_ops *ver_ops;
>>>    	int			max_periphs;
>>> -	struct spmi_pmic_arb_bus *bus;
>>> +	struct spmi_pmic_arb_bus *buses[PMIC_ARB_MAX_BUSES];
>>> +	int			buses_available;
>>>    };
>>>    /**
>>> @@ -219,7 +226,7 @@ struct spmi_pmic_arb {
>>>    struct pmic_arb_ver_ops {
>>>    	const char *ver_str;
>>>    	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
>>> -	int (*init_apid)(struct spmi_pmic_arb_bus *bus);
>>> +	int (*init_apid)(struct spmi_pmic_arb_bus *bus, int index);
>>>    	int (*ppid_to_apid)(struct spmi_pmic_arb_bus *bus, u16 ppid);
>>>    	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
>>>    	int (*offset)(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
>>> @@ -308,8 +315,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
>>>    			}
>>>    			if (status & PMIC_ARB_STATUS_FAILURE) {
>>> -				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x)\n",
>>> -					__func__, sid, addr, status);
>>> +				dev_err(&ctrl->dev, "%s: %#x %#x: transaction failed (%#x) reg: 0x%x\n",
>>> +					__func__, sid, addr, status, offset);
>>>    				WARN_ON(1);
>>>    				return -EIO;
>>>    			}
>>> @@ -325,8 +332,8 @@ static int pmic_arb_wait_for_done(struct spmi_controller *ctrl,
>>>    		udelay(1);
>>>    	}
>>> -	dev_err(&ctrl->dev, "%s: %#x %#x: timeout, status %#x\n",
>>> -		__func__, sid, addr, status);
>>> +	dev_err(&ctrl->dev, "%s: %#x %#x %#x: timeout, status %#x\n",
>>> +		__func__, bus->id, sid, addr, status);
>>>    	return -ETIMEDOUT;
>>>    }
>>> @@ -1005,11 +1012,17 @@ static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
>>>    	return 0;
>>>    }
>>> -static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus)
>>> +static int pmic_arb_init_apid_v1(struct spmi_pmic_arb_bus *bus, int index)
>>>    {
>>>    	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
>>>    	u32 *mapping_table;
>>> +	if (index) {
>>> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
>>> +			index);
>>> +		return -EINVAL;
>>> +	}
>>
>> Shouldn't be here
>>
> 
> You're right. Since the DT bindings for HW < v7 doesn't allow multi bus
> support, this check is not needed. Will drop.
> 
>>> +
>>>    	mapping_table = devm_kcalloc(&bus->spmic->dev, pmic_arb->max_periphs,
>>>    				     sizeof(*mapping_table), GFP_KERNEL);
>>>    	if (!mapping_table)
>>> @@ -1252,11 +1265,17 @@ static int pmic_arb_offset_v2(struct spmi_pmic_arb_bus *bus, u8 sid, u16 addr,
>>>    	return 0x1000 * pmic_arb->ee + 0x8000 * apid;
>>>    }
>>> -static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus)
>>> +static int pmic_arb_init_apid_v5(struct spmi_pmic_arb_bus *bus, int index)
>>>    {
>>>    	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
>>>    	int ret;
>>> +	if (index) {
>>> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
>>> +			index);
>>> +		return -EINVAL;
>>> +	}
>>
>> Shouldn't be here
>>
> 
> Ditto.
> 
>>> +
>>>    	bus->base_apid = 0;
>>>    	bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
>>>    					   PMIC_ARB_FEATURES_PERIPH_MASK;
>>> @@ -1328,6 +1347,50 @@ static int pmic_arb_get_core_resources_v7(struct platform_device *pdev,
>>>    	return pmic_arb_get_obsrvr_chnls_v2(pdev);
>>>    }
>>> +/*
>>> + * Only v7 supports 2 buses. Each bus will get a different apid count, read
>>> + * from different registers.
>>> + */
>>> +static int pmic_arb_init_apid_v7(struct spmi_pmic_arb_bus *bus, int index)
>>> +{
>>> +	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
>>> +	int ret;
>>> +
>>> +	if (index == 0) {
>>> +		bus->base_apid = 0;
>>> +		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
>>> +						   PMIC_ARB_FEATURES_PERIPH_MASK;
>>> +	} else if (index == 1) {
>>> +		bus->base_apid = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES) &
>>> +						  PMIC_ARB_FEATURES_PERIPH_MASK;
>>> +		bus->apid_count = readl_relaxed(pmic_arb->core + PMIC_ARB_FEATURES1) &
>>> +						   PMIC_ARB_FEATURES_PERIPH_MASK;
>>> +	} else {
>>> +		dev_err(&bus->spmic->dev, "Unsupported buses count %d detected\n",
>>> +			bus->id);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (bus->base_apid + bus->apid_count > pmic_arb->max_periphs) {
>>> +		dev_err(&bus->spmic->dev, "Unsupported APID count %d detected\n",
>>> +			bus->base_apid + bus->apid_count);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	ret = pmic_arb_init_apid_min_max(bus);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = pmic_arb_read_apid_map_v5(bus);
>>> +	if (ret) {
>>> +		dev_err(&bus->spmic->dev, "could not read APID->PPID mapping table, rc= %d\n",
>>> +			ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>
>> Shouldn't be here
>>
> 
> Since the apid base and count are different between buses and since v7
> supports 2 buses, we need a v7 specific init_apid. So this one is
> needed.


I know, all those were wrongly removed in patch 5, just let them in place.

Neil

> 
>>> +
>>>    /*
>>>     * v7 offset per ee and per apid for observer channels and per apid for
>>>     * read/write channels.
>>> @@ -1580,7 +1643,7 @@ static const struct pmic_arb_ver_ops pmic_arb_v5 = {
>>>    static const struct pmic_arb_ver_ops pmic_arb_v7 = {
>>>    	.ver_str		= "v7",
>>>    	.get_core_resources	= pmic_arb_get_core_resources_v7,
>>> -	.init_apid		= pmic_arb_init_apid_v5,
>>> +	.init_apid		= pmic_arb_init_apid_v7,
>>
>> Shouldn't be here
>>
> 
> See above.
> 
>>>    	.ppid_to_apid		= pmic_arb_ppid_to_apid_v5,
>>>    	.non_data_cmd		= pmic_arb_non_data_cmd_v2,
>>>    	.offset			= pmic_arb_offset_v7,
>>> @@ -1604,6 +1667,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>>>    				  struct device_node *node,
>>>    				  struct spmi_pmic_arb *pmic_arb)
>>>    {
>>> +	int bus_index = pmic_arb->buses_available;
>>>    	struct spmi_pmic_arb_bus *bus;
>>>    	struct device *dev = &pdev->dev;
>>>    	struct spmi_controller *ctrl;
>>> @@ -1622,7 +1686,7 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>>>    	bus = spmi_controller_get_drvdata(ctrl);
>>> -	pmic_arb->bus = bus;
>>> +	pmic_arb->buses[bus_index] = bus;
>>>    	bus->ppid_to_apid = devm_kcalloc(dev, PMIC_ARB_MAX_PPID,
>>>    					 sizeof(*bus->ppid_to_apid),
>>> @@ -1665,12 +1729,13 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>>>    	bus->cnfg = cnfg;
>>>    	bus->irq = irq;
>>>    	bus->spmic = ctrl;
>>> +	bus->id = bus_index;
>>> -	ret = pmic_arb->ver_ops->init_apid(bus);
>>> +	ret = pmic_arb->ver_ops->init_apid(bus, bus_index);
>>>    	if (ret)
>>>    		return ret;
>>> -	dev_dbg(&pdev->dev, "adding irq domain\n");
>>> +	dev_dbg(&pdev->dev, "adding irq domain for bus %d\n", bus_index);
>>>    	bus->domain = irq_domain_add_tree(dev->of_node,
>>>    					  &pmic_arb_irq_domain_ops, bus);
>>> @@ -1683,14 +1748,53 @@ static int spmi_pmic_arb_bus_init(struct platform_device *pdev,
>>>    					 pmic_arb_chained_irq, bus);
>>>    	ctrl->dev.of_node = node;
>>> +	dev_set_name(&ctrl->dev, "spmi-%d", bus_index);
>>>    	ret = devm_spmi_controller_add(dev, ctrl);
>>>    	if (ret)
>>>    		return ret;
>>> +	pmic_arb->buses_available++;
>>> +
>>>    	return 0;
>>>    }
>>> +static int spmi_pmic_arb_register_buses(struct spmi_pmic_arb *pmic_arb,
>>> +					struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct device_node *node = dev->of_node;
>>> +	struct device_node *child;
>>> +	int ret;
>>> +
>>> +	/* legacy mode doesn't provide child node for the bus */
>>> +	if (of_device_is_compatible(node, "qcom,spmi-pmic-arb"))
>>> +		return spmi_pmic_arb_bus_init(pdev, node, pmic_arb);
>>> +
>>> +	for_each_available_child_of_node(node, child) {
>>> +		if (of_node_name_eq(child, "spmi")) {
>>> +			ret = spmi_pmic_arb_bus_init(pdev, child, pmic_arb);
>>> +			if (ret)
>>> +				return ret;
>>> +		}
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void spmi_pmic_arb_deregister_buses(struct spmi_pmic_arb *pmic_arb)
>>> +{
>>> +	int i;
>>> +
>>> +	for (i = 0; i < PMIC_ARB_MAX_BUSES; i++) {
>>> +		struct spmi_pmic_arb_bus *bus = pmic_arb->buses[i];
>>> +
>>> +		irq_set_chained_handler_and_data(bus->irq,
>>> +						 NULL, NULL);
>>> +		irq_domain_remove(bus->domain);
>>> +	}
>>> +}
>>> +
>>>    static int spmi_pmic_arb_probe(struct platform_device *pdev)
>>>    {
>>>    	struct spmi_pmic_arb *pmic_arb;
>>> @@ -1761,21 +1865,19 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
>>>    	pmic_arb->ee = ee;
>>> -	return spmi_pmic_arb_bus_init(pdev, dev->of_node, pmic_arb);
>>> +	return spmi_pmic_arb_register_buses(pmic_arb, pdev);
>>>    }
>>>    static void spmi_pmic_arb_remove(struct platform_device *pdev)
>>>    {
>>>    	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
>>> -	struct spmi_pmic_arb_bus *bus = pmic_arb->bus;
>>> -	irq_set_chained_handler_and_data(bus->irq,
>>> -					 NULL, NULL);
>>> -	irq_domain_remove(bus->domain);
>>> +	spmi_pmic_arb_deregister_buses(pmic_arb);
>>>    }
>>>    static const struct of_device_id spmi_pmic_arb_match_table[] = {
>>>    	{ .compatible = "qcom,spmi-pmic-arb", },
>>> +	{ .compatible = "qcom,x1e80100-spmi-pmic-arb", },
>>>    	{},
>>>    };
>>>    MODULE_DEVICE_TABLE(of, spmi_pmic_arb_match_table);
>>>
>>
>> With issues fixed, it looks fine.
>>
>> Thanks,
>> Neil


