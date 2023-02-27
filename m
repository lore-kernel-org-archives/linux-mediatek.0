Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3713AC64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+3pF92mSwYUhZy9VRH+vsVoYv/M6+lCoICkuRbVNPs=; b=Q+GnZZjKOmVOgePq1w5BBMI/g6
	6/Wb29vbPL7kjRXZV8s1AbX3cBHOponLNmoXQ0R8YDT81If0srHYMHDeZdWgegpwy93y/7u2MHJqG
	yREfJX4GU/lKFjKIiq5KJukhKcRYajCWF6v15mWfDLawhVgQn5B+0n9n+zECWoIZH8uGquofFJMEP
	5adENRQhkRGZqG2gAbYNe4I239jsuFLm8413iTMJTUfWuh//RyyEk5hMXPmkKt4Fc+bNoWloficIb
	i+/45wp6r4x73tP63A3awr1FLCEJaLccnHzrklFZYDL8V+sLWBxBYgeRDplAQJoD82cvCLY08TQzQ
	q/ShEuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZUp-008zaC-40; Mon, 27 Feb 2023 09:08:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWZUe-008zWy-Vf
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 09:08:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so6548283wmb.5
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 01:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q+3pF92mSwYUhZy9VRH+vsVoYv/M6+lCoICkuRbVNPs=;
        b=tUj0g530f3WAX6zMkiIob+nD3+znuJH4ZEokLzpC9j0yMozZ+6j4xtIysbReCzryyc
         hmmVw4LwVO+K2a0x1sTkTF1fmfE7o06O02wHgNXEbAptfuXSch+ew/MNWqFtFEqGjZME
         90gBrUhTclwaxlicifCU9E18i2aLswra3wMOB/JnZynfRBKWyhuWhcF0L9VxuOVNIjCX
         7dzuvotjWXMRGOXquSEyEZ4ZRCo9Nvr3imV6Ng+aEVPMc8H7BwkiFuARGkHaLyCkP0tc
         M3xt61M+nC6QnKYIqM1x01Kt5ENmULXB0+NHnhZv0XgFfCES6v8uQkeKHYCpfE5GMcxA
         oyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q+3pF92mSwYUhZy9VRH+vsVoYv/M6+lCoICkuRbVNPs=;
        b=MBw+qyqPDSTuZQWWG6/R6VpirRuTRKCPXhhnA0jWiNrmSdrkY3GURiMtK7bilu4tly
         iRXK5Y3HESqDRUzZUkMSD1HQ3vCDuG1IyQE9Qf52vhprv54fhnU1Lkiojy1L1Y+kfVeO
         3meI6HBfg+4daUIvRcvrQFc09hWaGCq2KBj1nTcso6VEEs+BbJunYMEuRgA3kKg/cHLM
         2utjU5CZr7HDfP5r3dJ6bNhjlkePXJ0j+BITj93C+vxwKvuXjFvn3aDDqI8+eGzR/ID7
         xiENdQxGbn/RxJ+EqMAij0DiVgR0FjAq20JT6DUlaLLunQ85pjLuEDWqXNLPGZ16HFcF
         m3NQ==
X-Gm-Message-State: AO0yUKXaaSoYhkaBzU2Cu3TkHFmVJOVGu2FEyY80WumX906fWLIbAvsa
	wNbHTu84SxIoJqcYPSKfgw8uyQ==
X-Google-Smtp-Source: AK7set+CgWk1B+qEbO2S6zEfsqUjUh/9Lug+Zx2H+A7mNnO3xd751GxZ8Zsy42rsWWaEMswByX9LgQ==
X-Received: by 2002:a05:600c:4e12:b0:3eb:3998:8bca with SMTP id b18-20020a05600c4e1200b003eb39988bcamr3861828wmq.17.1677488903422;
        Mon, 27 Feb 2023 01:08:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o25-20020a05600c511900b003dfe549da4fsm13368751wms.18.2023.02.27.01.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 01:08:23 -0800 (PST)
Message-ID: <d2e43fe8-2072-6723-dbb4-500a6ff8f719@linaro.org>
Date: Mon, 27 Feb 2023 10:08:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: Add MediaTek MT6735 clock
 bindings
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Daniel Golle
 <daniel@makrotopia.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
 <20230225094246.261697-2-y.oudjana@protonmail.com>
 <52d479ff-14c6-b65d-952b-e7753fee2dea@linaro.org>
 <2XCQQR.YSBPBN01H6D31@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2XCQQR.YSBPBN01H6D31@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_010829_642624_20EBA001 
X-CRM114-Status: GOOD (  13.06  )
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

On 27/02/2023 09:29, Yassine Oudjana wrote:
> 
> On Mon, Feb 27 2023 at 09:18:45 AM +01:00:00, Krzysztof Kozlowski 
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 25/02/2023 10:42, Yassine Oudjana wrote:
>>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>
>>>  Add clock definitions for the main clock controllers of MT6735 
>>> (apmixedsys,
>>>  topckgen, infracfg and pericfg).
>>>
>>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>  Acked-by: Rob Herring <robh@kernel.org>
>>>  ---
>>>   MAINTAINERS                                   | 10 +++
>>>   .../clock/mediatek,mt6735-apmixedsys.h        | 16 ++++
>>>   .../clock/mediatek,mt6735-infracfg.h          | 25 ++++++
>>>   .../clock/mediatek,mt6735-pericfg.h           | 37 +++++++++
>>>   .../clock/mediatek,mt6735-topckgen.h          | 79 
>>> +++++++++++++++++++
>>>   5 files changed, 167 insertions(+)
>>
>> You should squash it with other part of binding. What is the reason
>> behind splitting one binding into three patches?
> 
> It seemed logical to me that each of clock and reset bindings as well 
> as documentation would be separate parts especially since they go in 

I don't understand. All of these are bindings. What do you mean by
"documentation"?

> different paths, but if combining them is how it's done then sure, I'll 
> squash them and resend.

They cannot go different paths and your submissions creates false
impression they can. If you want to see - apply these on separate
branches and test if: driver compiles and paths to files in doc are not
broken. Answer: driver won't compile and paths will point to
non-existing files.


Best regards,
Krzysztof


