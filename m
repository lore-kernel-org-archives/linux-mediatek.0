Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2B9C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 15:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHZZefyYne34nwtHlmcO9279ZiTFZKklHDR4wSaraLs=; b=ds6f7Y288qarvA3NBsTvX4m2Pm
	/gvdnapv6uAYVMPrXienaxAIv3G1Hodisrr5Ac7cbBjAezWdboLNjXjyWbvsw0B/f9+mPVwc4KGEE
	dc3HtMD/a70g/6WD1kAjDlltuRUSdHd3ksAECetLSysiZBNC/85MkG97AX6SW3Di+tnuKF5zRuWpJ
	aHlBMk8iIzvUCM0tJyOl8XR2MvHMSW43X6lK/1qPqLsH9IfkZfVOzHALFDqxkLCjpN5e7CpS2kNYT
	OypG04OXITE3MVb9WO5YeVv2WcN+yhoCzN17FSISxlToLLs1+XuI3n/2gQ8pVkXmA+BfpmeoLz4NP
	RlSkQGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuPm-002PQN-Uv; Mon, 09 Jan 2023 15:50:22 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuPL-002PCG-Tn; Mon, 09 Jan 2023 15:49:57 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309FnKbk021502;
	Mon, 9 Jan 2023 09:49:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673279360;
	bh=tHZZefyYne34nwtHlmcO9279ZiTFZKklHDR4wSaraLs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MPUiZGBLs/Ku6SlSm3Fh+yFJcoGIXbBdA2icjuIIZ3bG28Lf4hxlbusjtBtW3r+j1
	 d+ESwERr6zuKSVhU4PuUTfDVFIQp3yL6qzK+Rp5rdyZvl3hNXAGClH9q8f6DuClU8d
	 KyAqikzfsRBeqcXaHluWkpbzVG7Qm/XmCoIq+OSg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309FnKl1105964
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Jan 2023 09:49:20 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 09:49:19 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 09:49:19 -0600
Received: from [10.250.234.21] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309Fn9qV038794;
	Mon, 9 Jan 2023 09:49:10 -0600
Message-ID: <784cc3a5-8b10-aed3-b151-77cedb531f25@ti.com>
Date: Mon, 9 Jan 2023 21:19:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guo Ren
	<guoren@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>,
        Devicetree List
	<devicetree@vger.kernel.org>,
        Linux Kernel List
	<linux-kernel@vger.kernel.org>,
        Linux RISC-V List
	<linux-riscv@lists.infradead.org>,
        Linux ARM Kernel List
	<linux-arm-kernel@lists.infradead.org>,
        Linux Mediatek List
	<linux-mediatek@lists.infradead.org>,
        Linux C-SKY Arch List
	<linux-csky@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar
	<devarsht@ti.com>,
        Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <85837957-f6d2-4722-7693-98c6cf932096@linaro.org>
 <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
 <30423568-df03-1d72-81fe-3a4b33214e5c@linaro.org>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <30423568-df03-1d72-81fe-3a4b33214e5c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_074956_085319_C253B420 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Krzysztof,

On 03-Jan-23 16:58, Krzysztof Kozlowski wrote:
> On 03/01/2023 12:02, Aradhya Bhatia wrote:
>> But this is throwing an error. I am confused what else could be done.
>> Can you please suggest what might be a more accurate check here?
>>
>>>
>>>> +              required:
>>>> +                - dual-lvds-odd-pixels
>>>> +        then:
>>>> +          properties:
>>>> +            port@1:
>>>> +              properties:
>>>> +                dual-lvds-even-pixels: true
>>>> +                dual-lvds-odd-pixels: false
>>>
>>> Why do you need this? Your oneOf before already solves it.
>>
>> I agree with your comment here. It makes sense to only have
>>
>> 	dual-lvds-even-pixels: true
>>
>> and have the oneOf condition take care of the other. But, I just tested
>> this and it was unable to pick-up this intentionally-added error.
>>
>> I added 'dual-lvds-odd-pixels' property to both the nodes, and
>> dt_binding_check passes successfully (which it should have not.)
>>
>> Instead, if I only keep this,
>>
>> 	dual-lvds-odd-pixels: false
>>
>> then the dt_binding_check detects the error as it should.
>>
>> Regardless, I am curious why the first method doesn't work. Will try to
>> explore more on that.
> 
> The check for presence of properties is only against required:, but you
> added there properties. Like this:
> 
> https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155
> 
> 
> Other way is to drop your both oneOf and entire allOf from ports and use:
> 
> oneOf:
>    - properties:
>        ports:
>          $ref: /schemas/graph.yaml#/properties/ports
>          properties:
>            port@0:
>              required:
>                - dual-lvds-odd-pixels
>            port@1:
>              required:
>                - dual-lvds-even-pixels
>    - properties:
>        ports:
>          $ref: /schemas/graph.yaml#/properties/ports
>          properties:
>            port@1:
>              required:
>                - dual-lvds-odd-pixels
>            port@0:
>              required:
>                - dual-lvds-even-pixels
> 

Thank you for the suggestions.
I tested the both of them, and they seem to be working as expected.

V2 will reflect all the required fixes.


Regards
Aradhya

