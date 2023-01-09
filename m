Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0DAC61DB3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pn0x0PUzOG1Nvv4uHwUprL4noTeFPolAuH0p0G35kzw=; b=n71u4XKdp+Qi66HvMSmdKWar5M
	DkZEI9wXA4OCs1AjPsD/ku2Yp7sIGt7aXCB+/v7/lnYEDmPy6pPVcgfL2WDoXwQgJLIWSHT9/tXfH
	PhbsxTIAc+Oe45Cwq5Spr2vvCxydDhTfGUXV/mmhYwXWTsaIkd6GrxCAxI+ilKkqRdrRvnjFY0/Dw
	B1bDf9PCrVUUNJXkI9riM+Gh0ZY0XHaG3W3lRMQyDjWwZJ7p/CTwpf/LUmnPhEyt92FPHoegVPmWV
	vX6oohB1buD30E9nwVgvD/BKpTgwbxLU/9fB0uowWE7X2xqte7nh5wQ8Zelyf5EQcMfGpKdtDaz/4
	oWLgJ3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuuM-002YRE-Fh; Mon, 09 Jan 2023 16:21:58 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuu6-002YL9-HZ; Mon, 09 Jan 2023 16:21:44 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309GLBjO115220;
	Mon, 9 Jan 2023 10:21:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673281271;
	bh=Pn0x0PUzOG1Nvv4uHwUprL4noTeFPolAuH0p0G35kzw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ujuLBGa8GIXkzhgLCqx5SZOW1tq6Nmo/FJklVTGE/9EpwZTkBdXF4OQuFvmuz2sxj
	 rjrZ5CraNnwmBJIMjPBZW4Z6DULfypCY2Po/yhenjCjHJkZrFSZ6RL7Gg6LzLxOXWy
	 gAilse7dcHQ9KpHfIFSx+Y/WIAFBcuw/uTWkeZvw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309GLBQ0004753
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Jan 2023 10:21:11 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 10:21:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 10:21:11 -0600
Received: from [10.250.234.21] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309GL0ut002438;
	Mon, 9 Jan 2023 10:21:01 -0600
Message-ID: <431ddd82-055b-2526-3d5e-f6563e48d264@ti.com>
Date: Mon, 9 Jan 2023 21:51:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob
 Herring <robh+dt@kernel.org>,
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
 <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_082142_688078_EEA444EA 
X-CRM114-Status: GOOD (  22.56  )
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

Hi Angelo,

Thanks for taking a look at the patches!

On 03-Jan-23 17:21, AngeloGioacchino Del Regno wrote:
> Il 03/01/23 07:46, Aradhya Bhatia ha scritto:
>> Dual-link LVDS interfaces have 2 links, with even pixels traveling on
>> one link, and odd pixels on the other. These panels are also generic in
>> nature, with no documented constraints, much like their single-link
>> counterparts, "panel-lvds".
>>
>> Add a new compatible, "panel-dual-lvds", and a dt-binding document for
>> these panels.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   .../display/panel/panel-dual-lvds.yaml        | 157 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 158 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml 
>> b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>> new file mode 100644
>> index 000000000000..88a7aa2410be
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>> @@ -0,0 +1,157 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Dual-Link LVDS Display Panel
>> +
>> +maintainers:
>> +  - Aradhya Bhatia <a-bhatia1@ti.com>
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +
>> +description: |
>> +  A dual-LVDS interface is a dual-link connection with the even pixels
>> +  traveling on one link, and the odd pixels traveling on the other.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +  - $ref: /schemas/display/lvds.yaml/#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - lincolntech,lcd185-101ct
>> +              - microtips,13-101hieb0hf0-s
>> +          - const: panel-dual-lvds
>> +      - const: panel-dual-lvds
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: The sink for first set of LVDS pixels.
>> +
>> +        properties:
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-odd-pixels]
> 
> One question: why do we need a "panel-dual-lvds" compatible?
> A Dual-LVDS panel is a LVDS panel using two ports, hence still a panel-lvds.
> 
> If you're doing this to clearly distinguish, for human readability purposes,
> single-link vs dual-link panels, I think that this would still be clear even
> if we use panel-lvds alone because dual-link panels, as you wrote in this
> binding, does *require* two ports, with "dual-lvds-{odd,even}-pixels" properties.

Yes, while they are both LVDS based panels the extra LVDS sink in these
panels, and the capability to decode and display the 2 sets of signals
are enough hardware differences that warrant for an addition of a new
compatible.

> 
> So... the devicetree node would look like this:
> 
> panel {
>      compatible = "vendor,panel", "panel-lvds";
>      ....
>      ports {
>          port@0 {
>              .....
>              -> dual-lvds-odd-pixels <-
>          }
> 
>          port@1 {
>              .....
>              -> dual-lvds-even-pixels <-
>          };
>      };
> };
> 
>> +          - required: [dual-lvds-even-pixels]
> 
> ...Though, if you expect dual-lvds panels to get other quirks in the future,
> that's a whole different story and you may actually need the panel-dual-lvds
> compatible.

Yes, exactly. Even while being non-smart, there are going to be more
quirks in future. And it would be better if they have their own
compatible/binding, and are not getting appended in an ever-growing
if-else ladder. :)


Regards
Aradhya

