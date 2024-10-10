Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355DBCF11F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRnZRSG2eoYSDSz68/sP2zAXSgCW07pnk18DG/2+H6Y=; b=eyzwSpU5IB209xITsL1rZby+FX
	BwLesbed008ePRgVseJNu7lgzf/IxK60043Z/9GmEKK9Abmm4Mv90mxijXQwShi29ro1Va5hu6YzX
	HqDWUhxDhA4lnaTkTQ5shRM0rm3xx6g0nimWNpWhseP8LNE5TyqBVB9Q4fN7+1CTOxiAGAEefQuRS
	6Ncid2bnsN6GCkvLnhRXKvFRRW+Kp2TMIyhMDV3GrpZSBoLYjGVPgkWfCI4mxiOZDmUUNKqYCuLuc
	7Ases5cuRCUkRGEUe2bVjAIaY/iSFbfqu7p8QD4A+FhgmEK2nJ2PvuGjjrNFVnKexwbIADyqbhwMJ
	hn8mi5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syt3s-0000000Ct9w-09Dr;
	Thu, 10 Oct 2024 13:18:36 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysy7-0000000Cs2f-2bOA
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Oct 2024 13:12:40 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so864629e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Oct 2024 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728565958; x=1729170758; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRnZRSG2eoYSDSz68/sP2zAXSgCW07pnk18DG/2+H6Y=;
        b=myOr/RKXbqsFyrlzftYFZwliKYKKUQuBkfHnyzphyMzdO2NsW9rb+Bo7Q5uqBX0aau
         /LToObdMfWbrDYGAh3rvdr36qYr1CyXg9YMMSn+5MreukD7hpY/hwapIbO1/pTkOygid
         gjxSUdogUYbXwFBow0tx15yWsoXNNZQ9UFu3srrPrVm7RCFByPIvfeeFGkPkbdIcTtCT
         eEpTJHQZ5XrdUerWL+xIqxwTBGN5umPAghFJcMPdwzglMUY9Sq8eLtc5Uk3moTeJ42BV
         0MzYJN7ZgpkO1QByJ7piSIxUs6vo+AARSTKeOB/EItwH1YqJldemHzPoNdy4klXK9DjW
         gjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565958; x=1729170758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zRnZRSG2eoYSDSz68/sP2zAXSgCW07pnk18DG/2+H6Y=;
        b=H3ik7roL8KlBTd/49TAZseJZumppQMOmPFu/Cg1ueysMO1AhSXaC2A41mDvBhMVsxF
         YK9V4i0bPPoB8BWmXGgwtsB4ZY6QdbA4rMzli8g6o5aXwYE6Pp4i2Unz6te6HvPU6Ulg
         hfeclrhwpBoS3MYIvRw1o1XIVjhoHBt4smDsQhZy28RKgp37z1EX7RGkBnuIzPZG5IbO
         BkqYJAg7umrKh9ehiOsLiE5WDsZMGAo4qHMO1lG0VUcBFLK5D/U2hAv2n9A02RJEYYkK
         tL5Qxa0uEtQzyOjNNR0ds046NeBegqYNimBltmYN6GiWfQBW05ym8ncgFj1UDX/7eoFj
         WIGg==
X-Forwarded-Encrypted: i=1; AJvYcCWX6dUTZ4KGi4gV7qok5uwac6MOZnKK9b2b/cwco7ufk2pUrp8T6lIdMdSiJZmduG0kat4YRvkUatB2ASUn/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQ1LpO682wNIYOFQAm5fEJML3UipKadTPbtbzWo3NBqIh96u7
	cDHfKg6YO116PL2mzuoBQIkAS1JUREVCQzrq7XJCJ71me7T7/WygO5Eg+L0W
X-Google-Smtp-Source: AGHT+IEUkmo6BSFMfs3DhvYxndBIE+RTpexMHgWjQyytLnGrtanEQDgJwQ5jLMmGoecdNAvUv0gKiA==
X-Received: by 2002:a05:6402:5408:b0:5c8:93fe:3f7e with SMTP id 4fb4d7f45d1cf-5c933550288mr3177019a12.11.1728565946608;
        Thu, 10 Oct 2024 06:12:26 -0700 (PDT)
Received: from [10.31.18.55] ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d2560sm761734a12.17.2024.10.10.06.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 06:12:26 -0700 (PDT)
Message-ID: <02a0487d-4538-4796-b779-da059f4e6ddd@gmail.com>
Date: Thu, 10 Oct 2024 16:12:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] clk: mediatek: Add drivers for MediaTek MT6735
 main clock and reset drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Shih <sam.shih@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241010124529.78460-1-y.oudjana@protonmail.com>
 <20241010124529.78460-3-y.oudjana@protonmail.com>
 <d9bd5573-4860-4a59-b03c-2c353a9b556b@collabora.com>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <d9bd5573-4860-4a59-b03c-2c353a9b556b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_061239_685719_9CD19049 
X-CRM114-Status: GOOD (  21.83  )
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



On 10/10/2024 3:59 pm, AngeloGioacchino Del Regno wrote:
> Il 10/10/24 14:45, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> Add drivers for MT6735 apmixedsys, topckgen, infracfg and pericfg
>> clock and reset controllers. These provide the base clocks and resets
>> on the platform, enough to bring up all essential blocks including
>> PWRAP, MSDC and peripherals (UART, I2C, SPI).
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   MAINTAINERS                                  |   4 +
>>   drivers/clk/mediatek/Kconfig                 |   9 +
>>   drivers/clk/mediatek/Makefile                |   1 +
>>   drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 138 +++++++
>>   drivers/clk/mediatek/clk-mt6735-infracfg.c   | 107 +++++
>>   drivers/clk/mediatek/clk-mt6735-pericfg.c    | 124 ++++++
>>   drivers/clk/mediatek/clk-mt6735-topckgen.c   | 394 +++++++++++++++++++
>>   7 files changed, 777 insertions(+)
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixedsys.c
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-pericfg.c
>>   create mode 100644 drivers/clk/mediatek/clk-mt6735-topckgen.c
>>
> 
> You're so, so, so, so..... *so close* to get this one upstream.
> 
> Read the comments below and *please*, fix it and send a v6 *as soon as 
> you can*,
> so that we get a good chance to see this in v6.13 and so that you can 
> move on
> with upstreaming the other stuff that you got for this SoC.
> 
> ..snip...
> 
>> diff --git a/drivers/clk/mediatek/clk-mt6735-infracfg.c b/drivers/clk/ 
>> mediatek/clk-mt6735-infracfg.c
>> new file mode 100644
>> index 0000000000000..eceb13af3222a
>> --- /dev/null
>> +++ b/drivers/clk/mediatek/clk-mt6735-infracfg.c
>> @@ -0,0 +1,107 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "clk-gate.h"
>> +#include "clk-mtk.h"
>> +
>> +#include <dt-bindings/clock/mediatek,mt6735-infracfg.h>
>> +#include <dt-bindings/reset/mediatek,mt6735-infracfg.h>
>> +
>> +#define INFRA_RST0            0x30
>> +#define INFRA_GLOBALCON_PDN0        0x40
>> +#define INFRA_PDN1            0x44
>> +#define    INFRA_PDN_STA            0x48
> 
> #define<tab>INFRA_PDN_STA .... I know this is a typo, but you'll have to 
> fix it.
> 
> Please replace the tabulation with a space, so that this is consistent 
> with all
> of the other definitions that you have in here.
> 
>> +
>> +#define RST_NR_PER_BANK            32
>> +
> 
> ..snip..
> 
>> diff --git a/drivers/clk/mediatek/clk-mt6735-pericfg.c b/drivers/clk/ 
>> mediatek/clk-mt6735-pericfg.c
>> new file mode 100644
>> index 0000000000000..6f298d5538782
>> --- /dev/null
>> +++ b/drivers/clk/mediatek/clk-mt6735-pericfg.c
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +
>> +#include "clk-gate.h"
>> +#include "clk-mtk.h"
>> +
>> +#include <dt-bindings/clock/mediatek,mt6735-pericfg.h>
>> +#include <dt-bindings/reset/mediatek,mt6735-pericfg.h>
>> +
>> +#define PERI_GLOBALCON_RST0        0x00
>> +#define PERI_GLOBALCON_RST1        0x04
>> +#define PERI_GLOBALCON_PDN0_SET        0x08
>> +#define PERI_GLOBALCON_PDN0_CLR        0x10
>> +#define    PERI_GLOBALCON_PDN0_STA        0x18
> 
> same here
> 
>> +
>> +#define RST_NR_PER_BANK            32
> After which:
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

Tried so hard to catch all typos but I guess some still had to make it 
through. One quick fix coming up!

