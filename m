Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645D6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Na4vn1X58UYdQ7DaCEsyE3hRP9La70uVvipAjfVmM38=; b=Ji47DtCrqjuSrQ
	m0MC7a57hpnwoGP/2h6p5giPFof4AlhcJnpISXe6hrjAfcWCRPcrFBg5e2OkpCcKROyV3lNRqnXzP
	N5Fv/uTSOWM0NjPjKJzslCrfWp3Q6Sd8hH/gX5qpAMw96r7Gr5xULb7S4FQ11zJfz2Jy+QDWkGzy7
	QKdVES8nnUDEDnuc/cEm/Kh7AXKvq57kc/xbx69rngY80kJ8+uLpKVN/PBcDMS5wotUOhHCzWO8D1
	5StnRSlR4n41WN7B1zouzT9J+MYfiyuK7VGTA8GsivyW40W+bcvfkfPs5/eCmmZ9dCmpkrMJ6TTiQ
	JOXiEGHIi00qkGtqkWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXKnB-00GE4T-IB; Thu, 24 Mar 2022 10:34:09 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXKmz-00GE1p-84; Thu, 24 Mar 2022 10:33:58 +0000
Received: by mail-wr1-f46.google.com with SMTP id h23so5949527wrb.8;
 Thu, 24 Mar 2022 03:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U5ulc81+CZD74hOwtl9LVMZIaPxcb5xETnm2apQqo1U=;
 b=ouXUMm5uwVxL0Hf7fuLAKAWOiOS/7kqCP4N4k28PlVj2yhbeGYhe/plKZDN5BHV4vH
 gOcMR8dfYnXtNw0rXDtlGezSJW5Nm8VrqM5JxvL/UNUfvfiqdoDbtYPPKnN+aZ1jEwGB
 Wwz+xou0Fwx6a1n7weED60HzBz4i1/IHp8+BQ6NQIstqHeKIrnu8F7ckUX6Vf8OcdXlW
 WeuI1tF0ac7272t6pTqpnerrhTuyTnBfgy+mgcEDfwm+RhqJzHcUmFHGQlS7wsLnvUrn
 EyGHw8nfNl1Fclvbas/IxWWUHG+rJxoo/6qB0NzIoED6C9s6vhcmgE0nO3w3jZMfJDTJ
 86yA==
X-Gm-Message-State: AOAM532XDbFgTHpAUoprUTgUTazNqCyIDn1eT+gI2XGr1HUo36flizOK
 Yj+K6GbWnDSLde2s3bJy1QQ=
X-Google-Smtp-Source: ABdhPJxhC10eRP5mCjUq+wwKnPtWMAm8ndZ1JeY7Dr2Y3ZZKY0IRdikkQwZj6yroVXBtkYVNtmQS7w==
X-Received: by 2002:a5d:6d83:0:b0:204:107d:ffe2 with SMTP id
 l3-20020a5d6d83000000b00204107dffe2mr3950270wrs.413.1648118030453; 
 Thu, 24 Mar 2022 03:33:50 -0700 (PDT)
Received: from [192.168.0.156] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm1729527wmb.22.2022.03.24.03.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 03:33:49 -0700 (PDT)
Message-ID: <96a823a2-f3b6-9fb7-c9d6-f1315f6056fd@kernel.org>
Date: Thu, 24 Mar 2022 11:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] dt-bindings: cpufreq: mediatek: transform
 cpufreq-mediatek into yaml
Content-Language: en-US
To: Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-2-jia-wei.chang@mediatek.com>
 <ee98d248-b2cd-e975-84df-448917a79287@canonical.com>
 <2cf526d400c011b5172ba4fc2c3f03b4a4f371dc.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <2cf526d400c011b5172ba4fc2c3f03b4a4f371dc.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_033357_300521_4CFF99C7 
X-CRM114-Status: GOOD (  23.08  )
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

On 24/03/2022 10:38, Jia-Wei Chang wrote:
>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-
>>> mediatek.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-
>>> mediatek.yaml
>>> new file mode 100644
>>> index 000000000000..584946eb3790
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-
>>> mediatek.yaml
>>> @@ -0,0 +1,131 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>>> https://urldefense.com/v3/__http://devicetree.org/schemas/cpufreq/cpufreq-mediatek.yaml*__;Iw!!CTRNKA9wMg0ARbw!xbKG4TgD0MRpMLyGJVBZEGpZFrNOclrcxOCx_APKo5Nmg8nF2x5PcBdE0unvL2NdpChkMA$
>>>  
>>> +$schema: 
>>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!xbKG4TgD0MRpMLyGJVBZEGpZFrNOclrcxOCx_APKo5Nmg8nF2x5PcBdE0unvL2O8T_oxCQ$
>>>  
>>> +
>>> +title: Mediatek CPUFREQ driver Device Tree Bindings
>>
>> Please remove "driver Device Tree Bindings" because the title should
>> describe the hardware. Therefore it could be something like "Mediatek
>> SoC CPU frequency and voltage scaling".
> 
> Thanks for your suggestion of title.
> Or should I use the origin title "Binding for MediaTek's CPUFreq
> driver"?

Mediatek CPUFREQ
or
Mediatek CPU frequency scaling

> 
>>
>> How is it related to cpufreq-mediatek-hw.yaml? The names/title look
>> unfortunately too similar.
> 
> No, mediatek-cpufreq is performing in kernel driver rather than on
> hardware.
> On the other hand, mediatek-cpufreq-hw is performing on hardware.
> That's why "hw" is present in its name.

Unfortunately, I do not get it. The bindings are only about hardware, so
how bindings could be about CPU frequency scaling not in hardware?

> 
>>
>> In general this does not look like proper bindings (see also below
>> lack
>> of compatible). Bindings describe the hardware, so what is exactly
>> the
>> hardware here?
> 
> Except for SoC, there's no requirement of hardware binding for
> mediatek-cpufreq.
> mediatek-cpufreq recognizes the compatible of Mediatek SoC while
> probing.

What is the hardware here? If there is no requirement for bindings for
mediate-cpufreq, why do we have this patch here?

> 
>>
>>> +
>>> +maintainers:
>>> +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
>>> +
>>> +description: |
>>> +  CPUFREQ is used for scaling clock frequency of CPUs.
>>> +  The module cooperates with CCI DEVFREQ to manage frequency for
>>> some Mediatek
>>> +  SoCs.
>>> +
>>> +properties:
>>
>> How is this schema going to be applied? I don't see here select
>> neither
>> compatible.
> 
> As mentioned above, only compatible of SoC is required for mediatek-
> cpufreq.

It does not answer my questions. How the schema is going to be applied?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
