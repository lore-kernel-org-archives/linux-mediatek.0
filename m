Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2D0C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 10:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3e7JyI7Sc7RA1ldZ6o7rlo+kxOdPEtg03Vl9i+uNNUM=; b=mlCBtbeBMQSYHb
	uhK6UZ27dep+ort4VonGXUCE2r7nDXESszKg6HfFZSI23iG3ly/ESxnXs6+OBw+vH3arM1Z81R5r6
	HwXpudr+g/rEZVFQ5duJ1u79g1Rbvi5+fZf7QBAgE41rWqYUi1BvX6qpE78fNEbDzB3LBhjhkd5AF
	cVohzkl+kkxiaYweHyHGkozT5msnY++5RFAWCEEmguf8sI9Z/qUH782P6WaDpJ4n8yI5DhRUGvk2j
	4vGSQpfSWvbmKjWUWh78a+ob/VUEYkjvfSTpRCqrZP1jG6u9w4VjkWYjjcf2Un4M+07qSZBMuai2x
	aFuDTaIe8PZnQg+sg2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwiL3-002q3K-NR; Thu, 02 Jun 2022 10:46:01 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwiL0-002q0h-RV
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 10:46:00 +0000
Received: by mail-ed1-x531.google.com with SMTP id x62so5715645ede.10
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nw6pxzn4DckQbSIrMyIKvslcoovKd9JNNcEV3M74aJU=;
        b=FVtc2GMHaMVFwBTB9n2bmkPgrxq0S/3I/jF+Z5+VjhYWNvNhdvd9FduqFd8H21CXnp
         5CoJBlRBbspU+PTFXH1VuLP74dEZNgdRy0pabuto/4CifAKSH60UJrIP/u0wDj1LjPpZ
         pwN9n0KWujb8LNQ1GokLI6aRvWoP/kuIV4CibHVrjYuCB1sg9UWKqq9nlBBb3+IcyRxM
         oG+8X0jviUubYCuFv0wHF4I2MgJIe0fOxMsZb88UZBXiUgyGXO2IBR03XgFDZDgYBVZj
         nmSUJqmu0Thut+grCufPZRhNpL1Wm/mKbJQEtEjOiUCn2fVSqMR7B0gk0OB/P3jwjSYP
         Vw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nw6pxzn4DckQbSIrMyIKvslcoovKd9JNNcEV3M74aJU=;
        b=nfLhsktwnkZUH0SWcHRNDaGPj2NiM5T7JHJH9UEyKUNxUKtsjtEeiAgB5pGwRlQ2xl
         C3wMzyGw2VvCoXJ6gk39dAG50QtQTPLI2Fbkj4pSQ4fGDg1VOOZnena7qkyeDA3HihS+
         1w2/FP1TW28vXx9Z8qKFJdItPDPIBh1Xjv+gCxIGwp/01+9pokKrIvJIIiZ3rOxDxV/v
         rMi9nSaIPsBLHHbeVwr3LDe90OvmHwxkwMvxLEuMcENbJe+NS96p8+ZlhimJ6vLXVwKQ
         ZMfqr3Q6c4v9sJqWmXtTOQlBpl28Jg7kwRLQ1dnObcuNDfKPQ7Zhv55LicI8McBXJ1DX
         xTAw==
X-Gm-Message-State: AOAM532L9HhHzXrffKBBhbTFVpk0cKAZlbPfwwl+HxEi2PGKc6K6uelT
	oT+SdMjwmDv8HU0e451TZ34ldsnY+Ki3/fgS
X-Google-Smtp-Source: ABdhPJyHBWmqVU4LKyl/2v3+gW1nAjEOcRCOkljscEs8ZrboVaNdsEU+GlslnGTpUxxoIj+RBNBgJw==
X-Received: by 2002:a05:6402:3901:b0:42d:f38f:a5c6 with SMTP id fe1-20020a056402390100b0042df38fa5c6mr4551192edb.321.1654166756552;
        Thu, 02 Jun 2022 03:45:56 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q2-20020a17090609a200b006f3ef214e63sm1600576eje.201.2022.06.02.03.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 03:45:55 -0700 (PDT)
Message-ID: <9e3f5586-59fa-42cc-770c-b8694b4f2bf3@linaro.org>
Date: Thu, 2 Jun 2022 12:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1] dt-bindings: dsp: mediatek: add mt8186 dsp document
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422071534.15653-1-tinghan.shen@mediatek.com>
 <c0a188e5-8a8c-d4a3-5a3d-9b9dd85d8f44@linaro.org>
 <eb4deff1a01c09783518bbaff8fe4e4c4ca6fa5b.camel@mediatek.com>
 <591767ee-e349-7a17-a9e9-b95d0500c7c1@linaro.org>
 <774c075ca4ad815c88be755cfb51889a171e835d.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <774c075ca4ad815c88be755cfb51889a171e835d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_034558_974547_3C575774 
X-CRM114-Status: GOOD (  22.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02/06/2022 12:19, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Thu, 2022-06-02 at 09:40 +0200, Krzysztof Kozlowski wrote:
>> On 02/06/2022 08:44, Tinghan Shen wrote:
>>>>> +  mbox-names:
>>>>> +    items:
>>>>> +      - const: mbox0
>>>>> +      - const: mbox1
>>>>
>>>> These should be rather some meaningful names, e.g. "rx" and "tx".
>>>
>>> The mbox name has to align with the adsp ipc driver.
>>> The adsp ipc driver is using 'mbox%d' for mailbox channels.
>>>
>>>
>>>
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=9db69df4bdd37eb1f65b6931ee067fb15b9a4d5c__;!!CTRNKA9wMg0ARbw!1TmempNkQhC5QuLBhyfWo_AC97MoLuWipsGV-LPaW9RKNPheU7Bgc-eboNi1JA1nC5I$
>>>  
>>>
>>> 	chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
>>>
>>> 	/* ...snip... */
>>>
>>> 	adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
>>>
>>> Is it ok to continue using these names?
>>
>> It is a bit confusing... how did that driver got merged recently without
>> bindings? Why bindings are separate?
>>
>> The bindings always come together in one patchset with the driver
>> implementing them. Bindings are though a separate patch, yet still
>> followed by the driver which uses them.
>>
>> I do not see any compatibles in that driver, which suggests there is no
>> other binding using it. If that's correct, then you need to change the
>> driver.
>>
> 
> The mtk-adsp-ipc driver's sole function is to encapsulate the operations 
> of mailbox framework from adsp ipc users. The mtk-adsp-ipc is not defined 
> in the dts file and we don't need it to be defined. The creation of mtk-adsp-ipc 
> device is requested by adsp ipc users via the use of 'platform_device_register_data'[1].
> 
> the driver implemented the mailbox framework is 'mtk-adsp-mailbox'[2]. it has 
> corresponding hardwares and a yaml file[3] to describe it.

I don't understand how is this related. We talk here about the
mbox-names for this bindings file. You replied, that these bindings are
already used by something, but now you say that they are not? So why do
you need to change anything in any driver?

Simple question - do the bindings here "add mt8186 dsp document" are
used by any specific Linux driver already?



Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
