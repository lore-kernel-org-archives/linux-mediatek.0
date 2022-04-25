Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E36C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeAbN2rLBgHsGjPHDrpuYipqKG+BQIMuM1XgrEhZ/z4=; b=Zfy6z4H4RXi4I/
	/HmgvOi5AGtNS5pqbJaYMeqZqWYHOmP7qbCR8sCevACfwPnX2xznjrzLYtElRP//Mg6R4cMRI6TEm
	Seoz+qUTnf2wSXYrFna0oGyWNvr5/lPP9irDVcgUc7td7/TcJhDkLlDEaUiOFqTAc+nmOaCU7lPCU
	sLlNKqxtFNWqXWX+CdiN5L+rR9H/UaeUQMmCPvvNAZaMs2qwAQDCPHTAm7vKuSzVykZ/Gsb+AP1sT
	ATlqX2bpvk+e9aZksDp6np1Aqf1hQf5+ppNDUo2X1TR4IBdWBOrw9N0R84XjSemjsYVsMWSxg3+wa
	lfPh4W7/ZmHserlvCXrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niwL3-009BvI-VJ; Mon, 25 Apr 2022 10:53:06 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niwL0-009Bts-MM
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 10:53:04 +0000
Received: by mail-ed1-x52d.google.com with SMTP id el3so13069876edb.11
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 03:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c0GtfBkRSHeFZTruOwJRlqy+Sejoq8V+8yuUoZ3jFBc=;
 b=CbbAqeWONmzWIiGLRvqkhXo3NhecQVj6nlqqLU92Lqr1pACc3YhhvLGZg1SouvWfQ+
 8sH0Gko7TaEwFe7nRdN6dyYPtVZCcL0ae9htgY8wdfKxMPswxpxdM9dhNNCzQGqzw3Z7
 0k5CRiWMlYKJiH03+Nx/K4ew/zYPywhIPfaJcrmgMkryaUAF6ksXyn4Jc+7VGXBm+3+X
 jy2XsSb0qgG8wK+a7mEBgCBxyLrQSltcTgWZIlR8+9gqM6OCZuDjnB5RlYn476VRadCE
 YwKnLkl31yV+HJI8g4PJM4SC+3OFnZngS2XtfFEO88N0Va6VH3OS/As8cr0nY00axZ9z
 q5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c0GtfBkRSHeFZTruOwJRlqy+Sejoq8V+8yuUoZ3jFBc=;
 b=jLsSG0KNojeD87WRvTfE+fKE0eDAHjsy/u0RdMP/SOKAKjm2hg9y1L+X7/qiuGmtwt
 nnAYSRLODCQZn0sIDX3hYL2a8wwckIWaV16qsHgxoeKQEldhYpb0TyV8c3LkAl0kn04/
 almYEAe94TeE40fUaAXSbN2rsga3P1yiyqt8i2WPmq9vGs7QuIvHK0eCgwisSpfeEKvN
 IU2LnOVRG09V0tCv+3p6TizplD9ETdFdgYEixUGfrKXchot9YcFeF8LfdcMGaLqS6eYu
 O/p7OI1V8eQQZ0WsM6SbbicnyaGApunrZciiAILClVtrNLhBfyFr86SuLAYTzX/HCFnV
 nUbA==
X-Gm-Message-State: AOAM532W/LRflSvtWnta/t9BINSBXnkAGMvFj7sppPfJiX3WZhGG2uzu
 KuNJtUpaQzFF9j7At6TVD6ninw==
X-Google-Smtp-Source: ABdhPJy0dgkTb52njNWz9LvzMjEGTgEAOOjcVV8QzWTIaTLpb3m5wGPLOarhcpcQDrQ3D+MMkn43tw==
X-Received: by 2002:a05:6402:27d0:b0:41a:68bf:ff26 with SMTP id
 c16-20020a05640227d000b0041a68bfff26mr18293476ede.102.1650883976805; 
 Mon, 25 Apr 2022 03:52:56 -0700 (PDT)
Received: from [192.168.0.241] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w24-20020a50d798000000b00425eb9d893asm1016799edi.79.2022.04.25.03.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 03:52:56 -0700 (PDT)
Message-ID: <9ff80bc2-d63b-14aa-5769-20bff6e3a21e@linaro.org>
Date: Mon, 25 Apr 2022 12:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 01/14] dt-bindings: cpufreq: mediatek: Add MediaTek CCI
 property
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, angelogioacchino.delregno@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-2-rex-bc.chen@mediatek.com>
 <f2e5a34b-ed02-91a1-bc7b-fecaa95e227e@linaro.org>
 <811bf944-a230-ab9b-583a-840e57af8a1e@linaro.org>
 <28f75ac2995b116af9b2accf760786d1d1798c93.camel@mediatek.com>
 <7873f0fa-25c3-191f-5096-3ceb9afd50cc@linaro.org>
 <c1b910098a0a5cbe06ec971c1bf745ac37986274.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c1b910098a0a5cbe06ec971c1bf745ac37986274.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_035302_786958_E85AF4D6 
X-CRM114-Status: GOOD (  13.69  )
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

On 25/04/2022 12:20, Rex-BC Chen wrote:
>> However I am not sure if you solved your problem... see below:
>>
>>> For example:
>>> mediatek cci set 1.2V originally. When cpufreq want to adjust lower
>>> frequency adn set voltage to 1.0V.
>>> The framework will remain using 1.2V to prevent crash of mediatek
>>> cci.
>>
>> No, regulator_set_voltage() for proc_reg says:
>> "NOTE: If the regulator is shared between several devices then the
>> lowest
>>  request voltage that meets the system constraints will be used."
>>
>> Not the highest. So when your devfreq and cpufreq boots, calling
>> regulator_set_voltage will still cause high frequency and low
>> voltage.
>>
> 
> From the driver comment, I think it still needs to match "meets the
> system constraints".
> 
> From drivers, we can trace the driver and it finally to
> regulator_get_optimal_voltage().
> In [1], the framework will get max voltage while finding each device's
> voltage.
> 
> [1]: 
> https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L3815

Right, actually in your case it's the regulator_check_consumers() above
that line, because you

I think it's quite generic problem, so would be worth solving for more
regulator consumers, but your approach is fine. At least I do not have
anything smarter, at the moment.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
