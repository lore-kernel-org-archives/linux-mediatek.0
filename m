Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6497C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 11:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYxboYbzJR4OvXvxpcEQ87njqCWGC/PDqKTVrCSJiAs=; b=ZXa2cyqxIWlnkEaWPUEh7N4TJ5
	rwjsX40aMYKhllDlnFSFFTQEeN5JEU3hDuOQ4JlyTlv5iGiPRBPZbXiCdp+14viMebly1kU0rypQy
	OO6Dr1BvQ6J0UVnqKMMT2lcsZFkj6+UIZ3e9bwFuleaSOP0qFrFMZnc5e8ZZhTpLOKDtWssMMct/O
	4+ddCsJbdN0VwvqZ//WID27mdUQPEA6tooFg8DuDdL/jeKjmVFbERihqoQhbLEbo3amriUC8e7WCL
	C7aQHHdmvoNiXyWtQNbzWLtu/e2OJQA7F0s6Jq0RlOxnBfec0zpJqHNDr7f6Z9iHMVTW8O2ixaJ1X
	UwnziS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfcC-000zp3-H8; Tue, 03 Jan 2023 11:37:56 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCf4Y-000slG-JG; Tue, 03 Jan 2023 11:03:15 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 303B2hbV053461;
	Tue, 3 Jan 2023 05:02:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672743763;
	bh=MYxboYbzJR4OvXvxpcEQ87njqCWGC/PDqKTVrCSJiAs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HywghCs+8v2SpbkpRvg0oUkcmi5mXNkXDrmJOorl0xHf39M19DgRxj3KWVV8vwuJD
	 dpQwDVLmUUs6mEbekQpmOHi5FU809nVcNoGCBaF/JGw6g+Cy/EEy30U1SXtB5J6f/U
	 dgzmH5JzqKi+CT2mgjCQlNx3AtfsNwsX9PoU17vw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 303B2huJ059716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Jan 2023 05:02:43 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 05:02:42 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 05:02:42 -0600
Received: from [172.24.217.116] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 303B2UDr029452;
	Tue, 3 Jan 2023 05:02:31 -0600
Message-ID: <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
Date: Tue, 3 Jan 2023 16:32:30 +0530
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
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <85837957-f6d2-4722-7693-98c6cf932096@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_030310_779651_68AA2025 
X-CRM114-Status: GOOD (  25.34  )
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

Thank you for reviewing the patches!

On 03-Jan-23 14:02, Krzysztof Kozlowski wrote:
> On 03/01/2023 07:46, Aradhya Bhatia wrote:
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
>>   .../display/panel/panel-dual-lvds.yaml        | 157 ++++++++++++++++++
>>   MAINTAINERS                                   |   1 +
>>   2 files changed, 158 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>> new file mode 100644
>> index 000000000000..88a7aa2410be
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
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
>> +  - Aradhya Bhatia <a-bhatia1@ti.com>
>> +  - Thierry Reding <thierry.reding@gmail.com>
>> +
>> +description: |
>> +  A dual-LVDS interface is a dual-link connection with the even pixels
>> +  traveling on one link, and the odd pixels traveling on the other.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +  - $ref: /schemas/display/lvds.yaml/#
> 
> Drop trailing /

Okay, will do!

> 
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - lincolntech,lcd185-101ct
>> +              - microtips,13-101hieb0hf0-s
>> +          - const: panel-dual-lvds
>> +      - const: panel-dual-lvds
> 
> You cannot have this compatible alone
Okay, will make the change!

> 
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: The sink for first set of LVDS pixels.
>> +
>> +        properties:
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-odd-pixels]
>> +          - required: [dual-lvds-even-pixels]
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: The sink for second set of LVDS pixels.
>> +
>> +        properties:
>> +          dual-lvds-even-pixels:
>> +            type: boolean
>> +
>> +          dual-lvds-odd-pixels:
>> +            type: boolean
>> +
>> +        oneOf:
>> +          - required: [dual-lvds-even-pixels]
>> +          - required: [dual-lvds-odd-pixels]
>> +
>> +    allOf:
>> +      - if:
>> +          properties:
>> +            port@0:
>> +              properties:
>> +                dual-lvds-odd-pixels: true
> 
> That's not correct clause. It has no effect.

The idea behind this is to check the presence of the boolean property.

if (dual-lvds-odd-pixels is present)
then
[..]


I tried implementing this:

	[..]
	  dual-lvds-odd-pixels:
	    - const: true
	[..]

But this is throwing an error. I am confused what else could be done.
Can you please suggest what might be a more accurate check here?

> 
>> +              required:
>> +                - dual-lvds-odd-pixels
>> +        then:
>> +          properties:
>> +            port@1:
>> +              properties:
>> +                dual-lvds-even-pixels: true
>> +                dual-lvds-odd-pixels: false
> 
> Why do you need this? Your oneOf before already solves it.

I agree with your comment here. It makes sense to only have

	dual-lvds-even-pixels: true

and have the oneOf condition take care of the other. But, I just tested
this and it was unable to pick-up this intentionally-added error.

I added 'dual-lvds-odd-pixels' property to both the nodes, and
dt_binding_check passes successfully (which it should have not.)

Instead, if I only keep this,

	dual-lvds-odd-pixels: false

then the dt_binding_check detects the error as it should.

Regardless, I am curious why the first method doesn't work. Will try to
explore more on that.

> 
>> +
>> +      - if:
>> +          properties:
>> +            port@0:
>> +              properties:
>> +                dual-lvds-even-pixels: true
>> +              required:
>> +                - dual-lvds-even-pixels
>> +        then:
>> +          properties:
>> +            port@1:
>> +              properties:
>> +                dual-lvds-odd-pixels: true
>> +                dual-lvds-even-pixels: false
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  port: false
>> +
>> +unevaluatedProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - width-mm
>> +  - height-mm
>> +  - data-mapping
>> +  - panel-timing
>> +  - ports
>> +
>> +examples:
>> +  - |+
> 
> Drop +

Okay!

> 
>> +    panel-dual-lvds {
> 
> Just "panel". Node names should be generic.

Alright. Will make the change!

> 
>> +      compatible = "microtips,13-101hieb0hf0-s", "panel-dual-lvds";
>> +
>> +      width-mm = <217>;
>> +      height-mm = <136>;
>> +
> 
Regards
Aradhya

