Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCEAC54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hdi1Bu8qJAQTYphKYh0CUAY3M2lu9UUVs26+inJWz9A=; b=KVNx+G2yYvwQ3LcBXjPtfzJn+n
	WJlngXrERQAcpEVg8+jadyevy4pS7Rc66U7/m7kjS9/aHDKrdR7zSzjYw4f6vjq4OIsXSTvOWP1Yu
	b4lTVyGmkIAOXSX2yM51L7fILEeLX2VLZpYyBX2kI0w6kuMqv+PEjmhzCXXAluuUbyBA6uNlHVRE3
	ZYgQ+dlxVGw3sMcqUs6jOwk0JqTcjuj7Zx2YCltVlZ2SX6NQi2jMvYG0m6WHTYjcAi00CbMHoJKK6
	+c8EjKbZUapcBM5WZXF7Szi2fktWUfYCjHpwkZ3tHkjnQShqEG0ynJZJbmEJ+Rpc6hA5cZI3/UT79
	GnkhHhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvGh-002f1X-2t; Mon, 09 Jan 2023 16:45:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvGT-002ewk-AV; Mon, 09 Jan 2023 16:44:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 309GiKXF077797;
	Mon, 9 Jan 2023 10:44:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673282660;
	bh=Hdi1Bu8qJAQTYphKYh0CUAY3M2lu9UUVs26+inJWz9A=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MiiNTw0dLTzcuchtizZJzOh55E9ef+WnQGnSEKJ4R7yFFGTusUHvtX8w5LFPuG51W
	 KVWWAUykspc+A10XBgUzMXDUbZ19f0UC3EcLluPxxkALJrdp6ncv1EUJfDph+7fvmJ
	 EUUAbmJaeU0km0p1G656RRH6Vq72I86KslvgJDuA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 309GiKER006181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Jan 2023 10:44:20 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 9
 Jan 2023 10:44:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 9 Jan 2023 10:44:20 -0600
Received: from [10.250.234.21] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 309GiA1s094256;
	Mon, 9 Jan 2023 10:44:11 -0600
Message-ID: <5206c520-1263-a5a4-8960-edd41aaf3175@ti.com>
Date: Mon, 9 Jan 2023 22:14:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg
	<sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guo Ren
	<guoren@kernel.org>,
        DRI Development List <dri-devel@lists.freedesktop.org>,
        Devicetree List <devicetree@vger.kernel.org>,
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
 <Y7ppO8nZFw7ZKdOi@pendragon.ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <Y7ppO8nZFw7ZKdOi@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_084449_524575_B6D8492F 
X-CRM114-Status: GOOD (  20.12  )
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

Hi Laurent,

Thank you for reviewing the patches!

On 08-Jan-23 12:26, Laurent Pinchart wrote:
> Hi Aradhya,
> 
> Thank you for the patch.
> 
> On Tue, Jan 03, 2023 at 12:16:14PM +0530, Aradhya Bhatia wrote:
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
> A device-specific compatible string should be required,
> "panel-dual-lvds" alone shouldn't be allowed. Otherwise it won't be
> possible to tell different models apart later should this be required.
> 

Understood! Will make the fix in the next revision.

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
>> +              required:
>> +                - dual-lvds-odd-pixels
>> +        then:
>> +          properties:
>> +            port@1:
>> +              properties:
>> +                dual-lvds-even-pixels: true
>> +                dual-lvds-odd-pixels: false
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
>> +    panel-dual-lvds {
>> +      compatible = "microtips,13-101hieb0hf0-s", "panel-dual-lvds";
>> +
>> +      width-mm = <217>;
>> +      height-mm = <136>;
>> +
>> +      data-mapping = "vesa-24";
>> +
>> +      panel-timing {
>> +        clock-frequency = <150275000>;
>> +        hactive = <1920>;
>> +        vactive = <1200>;
>> +        hfront-porch = <32>;
>> +        hsync-len = <52>;
>> +        hback-porch = <24>;
>> +        vfront-porch = <24>;
>> +        vsync-len = <8>;
>> +        vback-porch = <3>;
>> +        de-active = <1>;
>> +      };
>> +
>> +      ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +          reg = <0>;
>> +          dual-lvds-odd-pixels;
>> +          lcd_in0: endpoint {
>> +            remote-endpoint = <&oldi_out0>;
>> +          };
>> +        };
>> +
>> +        port@1 {
>> +          reg = <1>;
>> +          dual-lvds-even-pixels;
>> +          lcd_in1: endpoint {
>> +            remote-endpoint = <&oldi_out1>;
>> +          };
>> +        };
>> +      };
>> +    };
>> +
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7f86d02cb427..c13f24293ab1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -6595,6 +6595,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>>   S:	Maintained
>>   F:	drivers/gpu/drm/panel/panel-lvds.c
>>   F:	Documentation/devicetree/bindings/display/lvds.yaml
>> +F:	Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
>>   F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>>   
>>   DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
> 

Regards
Aradhya

