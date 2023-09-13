Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1BBEEB59A
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 06:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8My5CApiKeaXtXgjQmnhwf9UqSWZovhHM2oxjC1BrHk=; b=cr5Fh9k0TPifyAo2L+aWdPCr+q
	DVJQQFR+oOuO5kL4ULG0PFJhYl7H6QaGxkPPrkn5CH1myJcfRlSLc5cqVZ9lF6oVCowfjgXvkZAid
	HF0BpJIM1J5XiOIZXv/paRfgXOgw0q3jgbA0OkY2xxGJko/ZBdI+z1qtqmA2fP0zdJpGiy8W3mExH
	Eq00uihI5MqRFyBew9HBnpWKMp6HJeSzBalX96rixQTfReV7nXjbcoFr0WRJ1yBBXF31zk/OZEmg8
	dW7XYSxHLAK6La6XoeIykthpldzx8Ba4c9mlEMMMoYfPAE1otR05TgdAxceUlvkd2vYqBrjyhQ14P
	PlcUS+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJVp-004p1n-0z;
	Wed, 13 Sep 2023 06:38:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJVl-004ozC-2r
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 06:38:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so69614575e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 23:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694587080; x=1695191880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8My5CApiKeaXtXgjQmnhwf9UqSWZovhHM2oxjC1BrHk=;
        b=fZt8BopbEH8aG4oRdrq1WJRhj9aVALlM9xtDpL595gpR4J8Obs/dzAbIdm4Dml5LPc
         aw+G4CDPTtYG8baI4z09b/SL9b5+SxJZs8nMrJj3Yc1Niz2ojrHEjXcb+AapI7wZ2bDu
         /8bmAQ+uo4u9QHA0dmxJYS9dogqrnWxGbZMKDvWZlqGQ1ZMBObF5IER5Z6E7fLHPFOc4
         COxrFw6Q4iX5srJYs2rHcgiYxITIiJyxr6GEIuMCMJ9CE2BoyplD259HeOwi8KoaLKkX
         AKPZJD9bDmYn6J2KtkurI+n2iu4pbkRPiay18BV6i/1zGnDB3xkOknHdOpEOJjPCcH/J
         B43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694587080; x=1695191880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8My5CApiKeaXtXgjQmnhwf9UqSWZovhHM2oxjC1BrHk=;
        b=OzuIB4/7VIMNk6uLiFn1LSwYt3aDW9J91MEVpOwKb5iHIT0lN+49tmbjcQGArImUWO
         t6mU+Mt5v6p4uWbMWTd/Hpq5STiQuQFYZhRbOT51nAZqOlqXOSeLx10EoYT/L5lKgb7f
         1IVbHEGw+HnMn7RMQ8ySKGFnHdPCz/xkdgXP1coUGMHbiUsQYx6Yn6c1vIUyKExNjsw6
         uPwTIjlmzaxR0cRS00pPE6Ymw90bzKD5CFB/kA5NSh0an/KSGJX0T4JfT3gaXj+nWrRe
         uO4VAl+17K78LbNsxUXqPyikNxezSjiz6uVbzD1YRNo8Nzy/ep7wg/S8fSYq8L4HeVOT
         JHAA==
X-Gm-Message-State: AOJu0YyeviLL7c8eL5x4eXOHX9ffiXbeDSi6muEhl/9/9w04LN2nMHu4
	xJLpbk4HTZRvnFHlDFnG746dfA==
X-Google-Smtp-Source: AGHT+IEZ2F60h3ihjAJYnXxW24cqpT3tWenIsbGIseVxLMVNVbBJ9+q+xwzYR0l2cvMniL752UbZhQ==
X-Received: by 2002:a7b:c414:0:b0:402:fe6d:6296 with SMTP id k20-20020a7bc414000000b00402fe6d6296mr1282354wmi.9.1694587080118;
        Tue, 12 Sep 2023 23:38:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c294c00b003ff3b964a9asm1029639wmd.39.2023.09.12.23.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 23:37:58 -0700 (PDT)
Message-ID: <0e63b264-1023-7b97-dfc1-91dd6ecef1c0@linaro.org>
Date: Wed, 13 Sep 2023 08:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 2/3] dt-binding: mediatek: integrate MDP RDMA to one
 binding
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230912075651.10693-1-moudy.ho@mediatek.com>
 <20230912075651.10693-3-moudy.ho@mediatek.com>
 <83b3f2eb-84e3-2daa-c63c-14b6792a1db5@linaro.org>
 <69ce225d04b1ed3890365c6f684bdbdb5c540e16.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69ce225d04b1ed3890365c6f684bdbdb5c540e16.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_233805_925951_6DBC47CE 
X-CRM114-Status: GOOD (  20.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13/09/2023 05:04, Moudy Ho (何宗原) wrote:
> On Tue, 2023-09-12 at 10:16 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 12/09/2023 09:56, Moudy Ho wrote:
>>> Due to the same hardware design, MDP RDMA needs to
>>> be integrated into the same binding.
>>>
>>
>> Please use subject prefixes matching the subsystem. You can get them
>> for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the
>> directory
>> your patch is touching.
>>
>> This applies to entire patchset. It is not dt-binding, but dt-
>> bindings.
>>
>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>>> ---
>>>  .../display/mediatek/mediatek,mdp-rdma.yaml   | 88 -------------
>> ------
>>>  .../bindings/media/mediatek,mdp3-rdma.yaml    |  5 +-
>>>  2 files changed, 3 insertions(+), 90 deletions(-)
>>>  delete mode 100644
>> Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>> b/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>>> deleted file mode 100644
>>> index dd12e2ff685c..000000000000
>>> ---
>> a/Documentation/devicetree/bindings/display/mediatek/mediatek,mdp-
>> rdma.yaml
>>> +++ /dev/null
>>> @@ -1,88 +0,0 @@
>>> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> -%YAML 1.2
>>> ----
>>> -$id: 
>> http://devicetree.org/schemas/display/mediatek/mediatek,mdp-rdma.yaml#
>>> -$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> -
>>> -title: MediaTek MDP RDMA
>>> -
>>> -maintainers:
>>> -  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> -  - Philipp Zabel <p.zabel@pengutronix.de>
>>> -
>>> -description:
>>> -  The MediaTek MDP RDMA stands for Read Direct Memory Access.
>>> -  It provides real time data to the back-end panel driver, such as
>> DSI,
>>> -  DPI and DP_INTF.
>>> -  It contains one line buffer to store the sufficient pixel data.
>>> -  RDMA device node must be siblings to the central MMSYS_CONFIG
>> node.
>>> -  For a description of the MMSYS_CONFIG binding, see
>>>
>> -  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> for details.
>>> -
>>> -properties:
>>> -  compatible:
>>> -    const: mediatek,mt8195-vdo1-rdma
>>> -
>>> -  reg:
>>> -    maxItems: 1
>>> -
>>> -  interrupts:
>>> -    maxItems: 1
>>> -
>>> -  power-domains:
>>> -    maxItems: 1
>>> -
>>> -  clocks:
>>> -    items:
>>> -      - description: RDMA Clock
>>
>> This is different and you did not explain it in commit msg.
>>
>> Another difference - mboxes. Looks like you did not test your DTS...
>>
>> Best regards,
>> Krzysztof
>>
> Hi Krzysztof,
> 
> Sorry for the inconvenience.
> The property you mentioned was removed on [3/3]. This incorrect
> configuration went unnoticed because I passed the test with the entire
> series.
> It will be recified in the next version.

Please describe any differences (lost properties etc) in commit msg with
some explanation.

Best regards,
Krzysztof


