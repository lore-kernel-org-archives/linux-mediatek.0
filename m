Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF84BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxX3/rKGdXJPp2S30yrDuiPaXOKnqyqY/vywJaHSUk4=; b=FwFNnCu/iu4l73
	LfjUsUzBfT+b/Mrn84MGIgEoWRsGEugb0TN4wcKb3vDojJgr+sr9yNSqd1Qv5Oymi1HIBGG2rD+yu
	L8rK5EuAvvFfdXs4UCTja5MGRv7a5wLSOYlCtdoSS/zWbbKjVbb+LXohhtAb0feuUVP5dus+BrhlH
	AzqlLB7t6EL5RnBxG+HJjBTQXscubgx/gWrwmu8/GTo+tpPyToJ+an4ZgwOheuH7CCqP7IMlf/+5c
	Je0++oVZf1Gd2EhbPxCV8Q/3rarsmrz0o29Tt9FSUlWcc8k8SGJgdRcBeM7bfT6vOcmFXdN02bSvb
	T4zwPqD6lK4e+V15uKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nitWZ-008g6k-Da; Mon, 25 Apr 2022 07:52:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nitWW-008g5r-4f
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 07:52:45 +0000
Received: by mail-ed1-x529.google.com with SMTP id b24so17342281edu.10
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G1EEwSPV9OR3PwrucirkIopsjrE2Zt+VuxuH1o+sws0=;
 b=g4oAlia2jlJQAi6qpWUu/xsE6u6TzsW6fzAmcXqSR/a0DZEdffoSguPFsw2/59X1JQ
 GhxsVbccqmFL8GVI3lNN5/thcSv+hm4AU2JDKDO3P5ooYDuRddd7CmD37OHUgMYcTzfV
 19fp2um13sYkYrwR2LF4CJfEy0zY2mH7PtX2q4C2a9+aRWTf4or1/zDQ5UaHK6y6ddcv
 t7IyseTxXOyTIPHVo0fWC7dCTd88BRteCe57eoT/5jlNaCH/ZTKyLb0pssxspCLRuhPv
 JVi4QPs/MT/GKoSPvyL2b8gp/CqFKmycYR7Jmq9SMrWSHvJ97dC5dfl9tQmH5xBOWPKx
 OBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G1EEwSPV9OR3PwrucirkIopsjrE2Zt+VuxuH1o+sws0=;
 b=7DOcrF41vAMbygslLVO7blbySDm853zPxCp4pepi3uhIGKwVX1vq0FneBgsWDyaCib
 Fk67DalWPbxSsAUORGZm0ps1tmuek4DUKI/3m1Q+ApjqLUm2PDhn0dy6HKf5mvVhD3/5
 03ld1VmbssawrJCI1H3I9j+57GK79bDKwz3AZVUhtbY9xdzGB49DYYjdAWLcVGguSKdm
 Geog1np3sf0PTdYij7U+LT2y+JkfxEZTA0n5YL5WvKjpvWxKENCY8UcA4nl5VoO0oEJS
 kZ4u89dBbZod8c+9C2D0I1ah248dSP4LwbWF3ADAOZBISsvykY5kGHPV3jjt1ERIe33R
 TkHw==
X-Gm-Message-State: AOAM533filu0TV5AyHRRi+lT3sfHoI4T9HFfUsu+IXjDRCessCnmJ19n
 +sN0EkTHq1jBKUVJ6N+3hBfOkw==
X-Google-Smtp-Source: ABdhPJxz3kWZkDl6FSThVokLJ4bTIeDew2DPyUD21w07yOl/NVskqg/AQ1XoobmWhZKSghrmtLVXmg==
X-Received: by 2002:a05:6402:1148:b0:413:11e0:1f58 with SMTP id
 g8-20020a056402114800b0041311e01f58mr17119200edw.113.1650873162160; 
 Mon, 25 Apr 2022 00:52:42 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 n16-20020a05640204d000b0042062f9f0e1sm4154445edw.15.2022.04.25.00.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 00:52:41 -0700 (PDT)
Message-ID: <418c5f0c-5279-41f5-3705-345ec9a97ea2@linaro.org>
Date: Mon, 25 Apr 2022 09:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 12/17] dt-binding: mt8192: Add infra_ao reset bit
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?=
 <Chun-Jie.Chen@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
 =?UTF-8?B?UnVueWFuZyBDaGVuICjpmYjmtqbmtIsp?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-13-rex-bc.chen@mediatek.com>
 <e5b18654-ce83-44ee-e4c8-4cdfc4ceaa1d@linaro.org>
 <5ec37a01b0b84140a7d171b9a5cff7ad8f9fbe87.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5ec37a01b0b84140a7d171b9a5cff7ad8f9fbe87.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_005244_230154_749F5C28 
X-CRM114-Status: GOOD (  16.80  )
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

On 25/04/2022 07:01, Rex-BC Chen wrote:
> On Sat, 2022-04-23 at 18:28 +0800, Krzysztof Kozlowski wrote:
>> On 22/04/2022 08:01, Rex-BC Chen wrote:
>>> To support reset of infra_ao, add the bit definition for
>>> thermal/PCIe/SVS.
>>>
>>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>>> ---
>>>  include/dt-bindings/reset/mt8192-resets.h | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/include/dt-bindings/reset/mt8192-resets.h
>>> b/include/dt-bindings/reset/mt8192-resets.h
>>> index be9a7ca245b9..d5f3433175c1 100644
>>> --- a/include/dt-bindings/reset/mt8192-resets.h
>>> +++ b/include/dt-bindings/reset/mt8192-resets.h
>>> @@ -27,4 +27,14 @@
>>>  
>>>  #define MT8192_TOPRGU_SW_RST_NUM				23
>>>  
>>> +/* INFRA RST0 */
>>> +#define MT8192_INFRA_RST0_LVTS_AP_RST				
>>> 0
>>> +/* INFRA RST2 */
>>> +#define MT8192_INFRA_RST2_PCIE_PHY_RST				
>>> 15
>>> +/* INFRA RST3 */
>>> +#define MT8192_INFRA_RST3_PTP_RST				5
>>> +/* INFRA RST4 */
>>> +#define MT8192_INFRA_RST4_LVTS_MCU				12
>>> +#define MT8192_INFRA_RST4_PCIE_TOP				1
>>
>> These should be the IDs of reset, not some register values/offsets.
>> Therefore it is expected to have them incremented by 1.
>>
>>
> 
> Hello Krzysztof,
> 
> This is define bit.
> 
> There is serveral reset set for infra_ao while it's not serial.
> For MT8192, it's 0x120/0x130/0x140/0x150/0x730.
> We are implement #reset-cells = <2>, and we can use this reset drive
> more easier.
> 
> For example, in dts, we can define
> infra_ao: syscon {
> 	compatible = "mediatek,mt8192-infracfg", "syscon";
>  	reg = <0 0x10001000 0 0x1000>;
>  	#clock-cells = <1>;
> 	#reset-cells = <2>;
> };
> 
> thermal {
> 	...
> 	resets = <&infra_ao 0x730 MT8192_INFRA_RST4_LVTS_MCU>;
> 	...
> };
> 
> If it's acceptabel, I can update all bit difinition from 0 to 15 for
> all reset set.

Bits are not acceptable, because you embed specific device programming
model (register bits) into the binding.

These should be IDs, so decimal numbers incremented from 0, so:
#define MT8192_INFRA_RST0_LVTS_AP_RST				0
#define MT8192_INFRA_RST4_LVTS_MCU				1
#define MT8192_INFRA_RST4_PCIE_TOP				2

And what is 0x730 in your example? It does not look like ID of a reset...

Entire changeset look wrong from DT point of view.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
