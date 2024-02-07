Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5038CC4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw+ZFLUeQpB09fZ01d0Kcu51k39UdmSHJS8VA8lDgcw=; b=z4Xi0VirIIRfS02h3nhDcgsmXW
	FiciZ/kJNLDFaDFyK2B2md3Hxcp+xq0wNXRsdUwEQT2EO+Ai/PES2bHIHSkmFVOcoQttI4M2M9218
	I6LcrVKLmuA4CkGYcCMCRNh8lp5HS5YuU4n9na9srm/7zL8Np2lhNKgpaWhuB2yNY5gmUEaHrpOuJ
	P+GYBBQB7MJMvsMm7BgY0V0lchEDZjFnDVNRYEru8JeY9lZ5RhkMr7yUbT/SUHlF+J/s3eyL2YjaC
	/rcVydfsQiJbc2qoc76YcWaaeoYZJsd/Pk89LHMqGWbugYKmCbqD++rziF/Pv1ap3VPnKRTDvV/tm
	OgSwVjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjNC-0000000B0lU-4BCb;
	Wed, 07 Feb 2024 14:58:03 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjNA-0000000B0kc-0Zhj
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 14:58:01 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5114c05806eso1108037e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Feb 2024 06:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707317878; x=1707922678; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yw+ZFLUeQpB09fZ01d0Kcu51k39UdmSHJS8VA8lDgcw=;
        b=pivq//bAwslIwPYVXo96xhbbwaPnH7a7QXxcrzU5eHazD+03hfBxX4suTecqKskpMV
         g1iCWC+j2+h57Pq9/oBcds08YRWw3gf9fHT7QWNKVeQtRl+2qHfuULqJlhY5D4ooGvIi
         d3yu8Jkkxug/2Y5vyNd9Kyr6srrSEl0KP9EEyTxWHEPLYGKHrjRfXAK1AC1Y/F+k1oOf
         F6Kzi3KQXc6WTSKJ6lLv0KkforQlni9qm/eGhLHCfRLSd5t/bDaXaLA/V8VONTqrjqzh
         Uv/kAtQrS8ONl1jc1Ek1KoJ7AUUb96uF8gQxDh2dL2KQ4t+FMgUwDQrcxkF72ojiHukM
         p+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707317878; x=1707922678;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yw+ZFLUeQpB09fZ01d0Kcu51k39UdmSHJS8VA8lDgcw=;
        b=AzSgCIU+/nzquSjbno4r38y3YCnjwuk1ewgpLvo/V1ycjIPlIILtsJFUd1OPl3m3zM
         nJA8ixgM8F2auL5zRyn0pmqohH9uIxahFOvFIPIOD2vSUaOsDfOCNNbyqxep9Qj1GE3s
         wimlhgFLF8HOrSBDz7/94WW02hSukaRqBfIt3yAP1ZT+aUIE74GYdZfAM6ZHVLWWqrQP
         ISYui+j1k6P6HjSn5VXHErLklcDIOrn5vyVKHRENFRsX6bPBQhpoaAYL9CI/0bZHSQTY
         0vxzxFs7DGzr3FsW0+YJlNCUw6hKKyfbN8Xr2q3N57SF98JZXZPJ9sjzaIsUks9bIcXq
         hnqQ==
X-Gm-Message-State: AOJu0YwOqDgabPIzR+NBafRl3peOqjecUtAwFhwx95CWMDruAKyzS2NL
	7/CpHjcu4ztrjo0g/LAb5g7uDR99eqeB7MMFr1rsnKR++OY/YEIflIedWGu6D9M=
X-Google-Smtp-Source: AGHT+IEBuN+LXOLtqc7RSSzBK/j0MJWezurLCsLWC9vYUou93riQDpe07JLvts+6zF3X24MvXm+UXQ==
X-Received: by 2002:a05:6512:3084:b0:511:4cc9:33a4 with SMTP id z4-20020a056512308400b005114cc933a4mr5694360lfd.52.1707317877932;
        Wed, 07 Feb 2024 06:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlxRNSM79t9F4iAPhnvtvu9WOEBeOlCLIVOLECYq2ynGeg2l9/5JtgRkCvP/X4GN9DIUlg5exAOYRaOPaRYg+rVanDs8g8r9hqSwbo82gMnio+pkZThcC766hCsn44uJZ33WMcIwdYoGhCWdWc9p3Hveaz73ew0oU8XiXgTTsajH6iV8VFiiv9XLLFpVEUFxitAtWWYiAjBXbtPq+IE+Q+iQNJy3Ww4di1w1PBEtGAP1JlGLJ8OT2GNXTxc3/wx0WmjeylMo6WwE9DqX2KhALIaRxGDQR/MPve0qY0dvHAIy2dfzg4XZjrmTYplTylstb+zyXu7DfjXwa/I+7114TGHs+5i0/LQlPz6jUYVSui7Sy81QhU3NH+2T1iEmFbiFmcwg6Dw2oK2v0jL/3ZPrE4TwexUGHKIH8=
Received: from ?IPV6:2a01:e0a:982:cbb0:5ae7:7fdb:32ad:f6d7? ([2a01:e0a:982:cbb0:5ae7:7fdb:32ad:f6d7])
        by smtp.gmail.com with ESMTPSA id fa7-20020a05600c518700b0040ef3ae26cdsm2342311wmb.37.2024.02.07.06.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 06:57:57 -0800 (PST)
Message-ID: <cc48bced-7591-4394-a1ad-4e7cd77a7844@linaro.org>
Date: Wed, 7 Feb 2024 15:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org>
 <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
 <ZcNIddeG6VHxBEOQ@linaro.org>
 <CAA8EJpo-16u34Yc6MLmHSqFrQ0VrZAq6TwGeVc5WFwMmhruqoA@mail.gmail.com>
 <b4018932-2fcb-4a15-9ec4-e29e5761d3e0@collabora.com>
 <CAA8EJpo5bb+AWJra26MoDPKE_vF+eBAJAGoxenkMtGWz2N5Tuw@mail.gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpo5bb+AWJra26MoDPKE_vF+eBAJAGoxenkMtGWz2N5Tuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_065800_225975_A3CE5905 
X-CRM114-Status: GOOD (  21.31  )
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

On 07/02/2024 15:22, Dmitry Baryshkov wrote:
> On Wed, 7 Feb 2024 at 14:46, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 07/02/24 12:45, Dmitry Baryshkov ha scritto:
>>> On Wed, 7 Feb 2024 at 11:08, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>>
>>>> On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
>>>>> On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>>>>
>>>>>> On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
>>>>>>> On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>>>>>>
>>>>>>>> Some newer SPMI controllers support multiple bus masters.
>>>>>>>> Such a master can control multiple slave devices. The generic
>>>>>>>> framework needs to be able to pass on the master id to the
>>>>>>>> controller-specific driver. So do that. The framework will
>>>>>>>> check if the devicetree child nodes are actually bus masters
>>>>>>>> and will register the devices for each master. The legacy
>>>>>>>> approach will still be supported for backwards compatibility.
>>>>>>>
>>>>>>> Please remind me, are those two actual bus musters driving a single
>>>>>>> bus in parallel or two SPMI buses being handled by a single device? In
>>>>>>> the latter case this implementation is incorrect. There should be
>>>>>>> multiple spmi_controller instances, one for each bus. Allocate them in
>>>>>>> a loop and set ctrl->dev.of_node after allocating.
>>>>>>
>>>>>> It's two SPMI buses (two sets of wires) handled by the same controller,
>>>>>> HW-wise.
>>>>>>
>>>>>> If we register two spmi controllers with the kernel framework, it will
>>>>>> be HW inaccurate, because there is just one controller which has
>>>>>> multiple masters.
>>>>>
>>>>> struct spmi_controller is a controller for a single bus. Inside your
>>>>> device you have two SPMI buses, each can be controlled by its own
>>>>> struct spmi_controller. Just like devices that control multiple I2C,
>>>>> SPI or USB busses register a separate instance of the bus controller.
>>>>
>>>> Well, this is what this patchset is trying to do in the generic part.
>>>> The SPMI controller supports multiple buses (HW-wise) and therefore SW
>>>> implementation shouldn't be tied to single bus requirement.
>>>
>>> So, after the off-line discussion:
>>> - add new compatible string for sm8450+
>>> - register two spmi controller instances
>>
>> Well, I don't know about the actual hardware that you're trying to implement
>> but, in my opinion, the "idea" of this series does actually make sense.
>>
>> The SPMI specification says that SPMI supports up to 4 masters, and up to
>> 16 slaves.
> 
> So, that is my main question: whether this supports multiple masters
> on a same bus or multiple buses. From the SoC pins description I
> assume the latter is the case.

This is clearly 2 separate physically separate busses, not 2 masters on the same bus.

We registers separate controllers for i2c, spi, 1w, ... in this case, why not here ?

Neil

> 
>>
>> Just my two cents.
>>
>> Cheers,
>> Angelo
>>
>>> - drop the master-id from the SPMI interface
>>> - optionally: think about having a new separate driver for v7 SPMI.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> I'm not saying it might not work. But, to me, it looks more like a hack.
>>>>>>
>>>>>> Basically, we would be mapping HW bus masters to kernel controllers.
>>>>>
>>>>> Buses, not just masters.
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>>>>> ---
>>>>>>>>    drivers/spmi/spmi-mtk-pmif.c |  6 ++--
>>>>>>>>    drivers/spmi/spmi-pmic-arb.c | 10 +++---
>>>>>>>>    drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
>>>>>>>>    include/linux/spmi.h         | 10 +++---
>>>>>>>>    4 files changed, 67 insertions(+), 35 deletions(-)
>>>>>>>
>>>>>>> --
>>>>>>> With best wishes
>>>>>>> Dmitry
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> With best wishes
>>>>> Dmitry
>>>
>>>
>>>
>>
>>
> 
> 


