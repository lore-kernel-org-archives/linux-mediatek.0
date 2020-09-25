Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E36EC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 14:04:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1C620936
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 14:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SmEw01ry";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZX5Z/hU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F1C620936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nqKY6hdS9BDPWh26oAsYcywzJsgGmW4MlVz3aHJxHZQ=; b=SmEw01ryuGcIdUNhl06qALizu
	rUZ05v2acK2E1RVw87KdXyZpTg0gWLtG3DXQPt3xzC/McUgF+nlvUHDKSMrxgkwHxmpQ5USb4vLb3
	PqOpmgC8fqe92j203zSb//NtMGysbu0sTF9U9fJv4skG6+kK8VxxDD0N0vqOc5bXRfiqKpa3uXgen
	+tG6zjvCtR7lq8SPtpVzj1x9264bGSocz3yx4hDbxAzSLpX9eQgAfUJT+r13fH4KnMHcaODMT14dI
	8M2GPDchAC790MP9IPd8ejgOT1Shpe7TbQl44AKWmLT1hB4V4LnoC6ajv4B45GgnoyW7UhpcEtuja
	x4Y6YhaDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLoKz-0002iI-R8; Fri, 25 Sep 2020 14:04:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLoKw-0002h4-UL; Fri, 25 Sep 2020 14:04:36 +0000
Received: by mail-wm1-x343.google.com with SMTP id e2so3448657wme.1;
 Fri, 25 Sep 2020 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JzMHEh8Ube79dljEkqdya1eUh9+uHB8BNvZsHGcfoPo=;
 b=RZX5Z/hUWLlZ4970yusa9NzXdDDTM0bEXWhQUIxScaseARZPFZX2wi3+rATvzx6SZ+
 Q8mKdnsOhcF5zlFYDHy6nn6yjV4OAhfOwPTKh25agDNQ/vbbm4eIe+fM2yuWHk65Qa6Z
 5GdlaXp0EalwnqUZQVt3XHvy30Bl/0j8B8xzLACd89z6/Sr9+QiND+W1UVI+YjeqOCOI
 RekXCvsLFN5ZB+XTMplpJ20irr1tF3dw7QHjHKOrKX+ZzJnpDjB0llPh588G0CJt/HB9
 pA1XAbedTSKHhWyb5cbJnatucotHiZcR5gNgbcJrkWT1RykKsQbL+6FS3sJQ4u7fRkG7
 pm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JzMHEh8Ube79dljEkqdya1eUh9+uHB8BNvZsHGcfoPo=;
 b=FnkCo0/Rg2xKfCdgtPZ4UFXvb9BdJR5rNvtdYQkYhX5znU4mK5vK/ckDZkWqsRt8z3
 /p9vei+YbW9HqMJ9AN9hif5mQHYcagf1CHROFJd041KP5SqMFM4Dx6WsR/WwFkvqpDfz
 NfZJdF2JkN16E4jLjKbUbgdYmETNHx/jeIxhEPkj/9z0cHWcaBVjs+5JJstMWnobEPAx
 hyfdkwiLDX6cWqmMCVPm0X3ofGkcpiNRJIGodavQoCb73ymmqKbpcsiBbE1El5eFlhmF
 okwGQXEufarXy1lm55oCUJh9tgq3QIZjq0w3lCahDKlSlw1zmcHxcGk3Rz6dlOMRRV++
 cacA==
X-Gm-Message-State: AOAM530uCddPMWynZ3KUfGkXZahaLxp8PqU9TwoM0FU3fVvqMY+xffF5
 wiTUM4iqu5CpLeW1RcYF2WWOigx5HWkU3Q==
X-Google-Smtp-Source: ABdhPJxeAyUCloE/hd0Mz6RZVZupL00UDeDG3zrN7h7y87RIOj0aH5w91JpDNJbdnuSnYvqtg2+njw==
X-Received: by 2002:a05:600c:221a:: with SMTP id
 z26mr3532728wml.131.1601042671950; 
 Fri, 25 Sep 2020 07:04:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id k22sm3233428wrd.29.2020.09.25.07.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 07:04:31 -0700 (PDT)
Subject: Re: [PATCH 00/12] soc: mediatek: pm-domains: Add new driver for
 SCPSYS power domains controller
To: Weiyi Lu <weiyi.lu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <1601028361.1346.38.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <19678952-e354-2067-e619-ffac28b347be@gmail.com>
Date: Fri, 25 Sep 2020 16:04:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601028361.1346.38.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_100434_987394_61892091 
X-CRM114-Status: GOOD (  32.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/09/2020 12:06, Weiyi Lu wrote:
> On Thu, 2020-09-10 at 19:28 +0200, Enric Balletbo i Serra wrote:
>> Dear all,
>>
>> This is a new driver with the aim to deprecate the mtk-scpsys driver.
>> The problem with that driver is that, in order to support more Mediatek
>> SoCs you need to add some logic to handle properly the power-up
>> sequence of newer Mediatek SoCs, doesn't handle parent-child power
>> domains and need to hardcode all the clocks in the driver itself. The
>> result is that the driver is getting bigger and bigger every time a
>> new SoC needs to be supported.
>>
> 
> Hi Enric and Matthias,
> 
> First of all, thank you for the patch. But I'm worried the problem you
> mentioned won't be solved even if we work on this new driver in the
> future. My work on the MT8183 scpsys(now v17) is to implement the new
> hardware logic. Here, I also see related patches, which means that these
> new logics are necessary. Why can't we work on the original driver?

Well the decision was to change the driver in a not compatible way to make 
device tree entries better. If we work on the old driver, we would need to find 
some creative ways to handle old bindings vs new bindings.

So I thought it would be better doing a fresh start implementing mt1873 support 
for reference and add mt8183 as new SoC. From what I have seen mt8192 and others 
fit the driver structure too.

> Meanwhile, I thought maybe we should separate the driver into general
> control and platform data for each SoC, otherwise it'll keep getting
> bigger and bigger if it need to be support new SoC.
> 

We could in a later series split the SoC depended data structures and put them 
in drivers/soc/mediatek/pm-domains-mt8183.h or something like this. Is that what 
you mean?

> And consider DVFSRC
> (dynamic voltage and frequency scaling resource collector), should we
> keep the original driver name "scpsys" instead of "pm-domains" because
> it may provide more functions than power domains?
> 

It's on my list to look deeper into this series. The thing with the new driver 
is, that the binding takes into account, that scpsys has several hardware block, 
which are represented as child nodes in DTS. The pm-domains is just one of these 
functionalities and I think DVFSRC should be a new driver with a child node of 
scpsys in DTS. Does this make sense?

Regards,
Matthias

>> All this information can be getted from a properly defined binding, so
>> can be cleaner and smaller, hence, we implemented a new driver. For
>> now, only MT8173 and MT8183 is supported but should be fairly easy to
>> add support for new SoCs.
>>
>> Best regards,
>>    Enric
>>
>> Enric Balletbo i Serra (4):
>>    dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains
>>      controller
>>    soc: mediatek: Add MediaTek SCPSYS power domains
>>    arm64: dts: mediatek: Add mt8173 power domain controller
>>    dt-bindings: power: Add MT8183 power domains
>>
>> Matthias Brugger (8):
>>    soc: mediatek: pm-domains: Add bus protection protocol
>>    soc: mediatek: pm_domains: Make bus protection generic
>>    soc: mediatek: pm-domains: Add SMI block as bus protection block
>>    soc: mediatek: pm-domains: Add extra sram control
>>    soc: mediatek: pm-domains: Add subsystem clocks
>>    soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
>>    soc: mediatek: pm-domains: Add support for mt8183
>>    arm64: dts: mediatek: Add mt8183 power domains controller
>>
>>   .../power/mediatek,power-controller.yaml      | 173 ++++
>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  78 +-
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 160 +++
>>   drivers/soc/mediatek/Kconfig                  |  13 +
>>   drivers/soc/mediatek/Makefile                 |   1 +
>>   drivers/soc/mediatek/mtk-infracfg.c           |   5 -
>>   drivers/soc/mediatek/mtk-pm-domains.c         | 952 ++++++++++++++++++
>>   include/dt-bindings/power/mt8183-power.h      |  26 +
>>   include/linux/soc/mediatek/infracfg.h         |  39 +
>>   9 files changed, 1433 insertions(+), 14 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>>   create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
>>   create mode 100644 include/dt-bindings/power/mt8183-power.h
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
