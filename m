Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE967C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=se+MAs3HPFJjq3A9atUw8nuqmBuPrTQxwBOsSaeeZ/M=; b=3HvTov0ojtJHY3OMp8RaMn6E6U
	BGSYiHL0cVhgmOBdSKBb34k0nBLlqlwJIJNnng+eN/SNaU/91konCioJpF6Gam8FsefTvqy5Ax1O9
	1IVJvXfMasrD9/kEBVgxAb6eUGLQqmKoyqRIbRoIFVWSgf0xZCNAfMy9dNx1NPS8b+SgKf7foy652
	TBDiQBgx1IG5URU0933MmFwWK+dMNKKPiWlwY4CS+kBm7bBwr8pjVFMpe/8L1rSJfTNIVUWayX/zK
	vSVs5NSF3YuVyLHpOHFVzAsbi0D5pVVjbu5tcWCJc68wizEmUmh0N+nlA1tX2Bz2Mrp00NTpG3rlV
	2BgrkViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9Er-00FUey-Fo; Mon, 21 Nov 2022 16:01:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox9Eo-00FUbh-Kg; Mon, 21 Nov 2022 16:01:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id x17so7080657wrn.6;
        Mon, 21 Nov 2022 08:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=se+MAs3HPFJjq3A9atUw8nuqmBuPrTQxwBOsSaeeZ/M=;
        b=M01iq+hGiBLlhv4xo7OLt1pSkljmKcyHE42TEXpwR3fT2o7x7AqEchub097biFmD9+
         b78HOhBtRMwWoXgzFWQQwxz2rS0R/bvFz9uMUGv2kv8iOyBBpw7/y93ui20Gm950PjZX
         A5qZoypqyLlUwAGuh4qrHFv3Ds0IDnnRlN2BqB3WNYTSs3+ZoO2Ehojm/uVtcXzaGMuX
         9TPIe9Ja6pFKhH/LA2r7iNMV8sPH7IwBzsh8f0RU8Sgx3tfVFa4mx6y3vDjBJ2GTg74X
         mvGDrO9DF1EZVUEbkeuWjYtCEDBW5Wisvc+P7Sg5SRr48f3c2Rg9gHswAUK5Qg8qjID+
         Ccxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=se+MAs3HPFJjq3A9atUw8nuqmBuPrTQxwBOsSaeeZ/M=;
        b=2t9xPoObs/GXfi8kqQiTjGGZG4HmWBuhcNQddd94gDiksxjMK7pK2WT1g0HUgzAY77
         t/0GpTh6meneQwfHC+WPUmiqUr1nai6ZU98xYl7nGVZqhX9pLZCSvHP7ZhfsoAQaqwTj
         aVTO34Z4rGz9loJeeajfFdVYcBn7UKfyGEchKyOH7Wy2gwkplum51Tfz/48gA2/C+Idp
         ttg3hO6qYAZ74hBeks3VHVTkBhH2cBkqPhIkFUnu6ngHkfTtYDxRpsWtp/+cBsZiddcu
         tb/DAlCBPCfEyv8/2SuTxUoYMVdpd8YrP1E6W3VDVdegUkuBNGTseSDjC+YiwBAy7xn+
         +o0g==
X-Gm-Message-State: ANoB5plEDqkgoo4iU6etyz+OQutlPRWJWaWjpJOSlB+BqaKuZvn28PJM
	ZFefWTzL4dxWr0HOE4K9PeE=
X-Google-Smtp-Source: AA0mqf5gLA5fhDHy2H4OoFEcT5qd8QgZCyHvhnj6qkFS6raf4HRUdXRYP+KL/PjWDptXygZ6jBH97g==
X-Received: by 2002:adf:fb01:0:b0:22e:6556:da75 with SMTP id c1-20020adffb01000000b0022e6556da75mr5941260wrr.653.1669046496228;
        Mon, 21 Nov 2022 08:01:36 -0800 (PST)
Received: from [10.32.3.204] ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003cfd4cf0761sm20519888wmq.1.2022.11.21.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 08:01:35 -0800 (PST)
Date: Mon, 21 Nov 2022 19:01:25 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v5 6/7] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6735 pin controller
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Andy Teng
	<andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Message-Id: <DIGPLR.WRMNJFUPZ02P3@gmail.com>
In-Reply-To: <1d27a496-b49c-94d5-e9e6-68c81195a69a@collabora.com>
References: <20221118113028.145348-1-y.oudjana@protonmail.com>
	<20221118113028.145348-7-y.oudjana@protonmail.com>
	<1d27a496-b49c-94d5-e9e6-68c81195a69a@collabora.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_080138_744748_E89123F0 
X-CRM114-Status: GOOD (  30.49  )
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


On Mon, Nov 21 2022 at 14:48:58 +01:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 18/11/22 12:30, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> Add bindings for the pin controller found on MediaTek MT6735 and
>> MT6735M SoCs, including describing a method to manually specify
>> a pin and function in the pinmux property making defining bindings
>> for each pin/function combination unnecessary. The pin controllers
>> on those SoCs are generally identical, with the only difference
>> being the lack of MSDC2 pins (198-203) on MT6735M.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 55 
>> ++++++++++++++++++-
>>   MAINTAINERS                                   |  6 ++
>>   2 files changed, 60 insertions(+), 1 deletion(-)
>> 
> 
> ..snip..
> 
>> @@ -352,18 +391,32 @@ examples:
>>               };
>>                 /* GPIO0 set as multifunction GPIO0 */
>> -            gpio-pins {
>> +            gpio0-pins {
>>                   pins {
>>                       pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
>>                   };
>>               };
>>   +            /* GPIO1 set to function 0 (GPIO) */
>> +            gpio1-pins {
>> +                pins {
>> +                    pinmux = <(MTK_PIN_NO(1) | 0)>;
> 
> Please follow the same format that you can find in all of the
> mtXXXX-pinfunc.h.
> 
> What you wrote here (MTK_PIN_NO(x) | func) is defined in there for 
> the purpose
> of providing a definition name that actually means something (for 
> both readability
> and documentation purposes).
> 
> This means that your GPIO1 set to function 0 (gpio) should be
> 
> 			pinmux = <PINMUX_GPIO1__FUNC_GPIO1>;
> 
>> +                };
>> +            };
>> +
>>               /* GPIO52 set as multifunction SDA0 */
>>               i2c0-pins {
>>                   pins {
>>                     pinmux = <PINMUX_GPIO52__FUNC_SDA0>;
>>                   };
>>               };
>> +
>> +            /* GPIO62 set to function 1 (primary function) */
>> +            i2c1-pins {
>> +                pins {
>> +                    pinmux = <(MTK_PIN_NO(62) | 1)>;
> 
> pinmux = <PINMUX_GPIO62__FUNC_SDA1>; (is it sda1??)
> 
> This means that you should as well add a mediatek,mt6735-pinfunc.h 
> binding...

This is pretty much what I was trying to avoid by doing this. 
Originally I tried to have something similar to qualcomm pin 
controllers which use "pins" and "function" properties (but probably 
with integer values rather than strings) without making any major 
changes to pinctrl-paris or related DT bindings, but it quickly became 
obvious that it wouldn't be possible when looking at how it does things 
currently. pinctrl-moore was better in this aspect, actually making use 
of pin groups to describe how sets of pins have shared functions 
instead of making a group for each pin, and taking "groups" and 
"function" properties. However, it wasn't fully suitable for the 
hardware so I had to stick with pinctrl-paris. At that point I thought 
of this to be the simplest way of doing it. I think it is unnecessary 
to define every single pin-function combination. Yes, doing it this way 
doesn't make it clear what function is being set right away, but a 
quick look at pinctrl-mtk-mt6735.h is all it takes to find out. 
Furthermore, in most cases functions 0 (GPIO) and 1 (primary, pin named 
after it) are the only ones used so knowing the pin names is all it 
takes to figure out the functions.

With all of that being said however, I guess I don't mind following the 
current convention for the time being. The pinctrl subsystem (not just 
mediatek pin controllers) has some of the most inconsistent DT bindings 
from what I've seen, specifically when it comes to specifying pin 
functions, and I think it will end up having some major cleanup down 
the line anyway.




