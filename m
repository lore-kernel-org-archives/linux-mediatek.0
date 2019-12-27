Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F7FC2D0DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 09:20:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D206520882
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 09:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+ucRi+t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D206520882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9p8eevo7Bn3YNwH49EUvSl9wd7q1u1JuDC6KeDUtxg4=; b=u+ucRi+tj5sDaI
	907mCf7yrTZA2iGygRLqUAIvLaPbweJAv0iFGG5LuxyP7P7IQsrHjI+3hAY0BVJ5vyrjspMC3tj8a
	P2dsiINPzS8Hz5tDe20JoEjSXVGxp8V7bBPKUM44V2bZx0bcs+pUSd1PE6EryOD+rr3jY2QMOj75Q
	ux5fmIB5IKuz5ipnF6nvCL0gYGRJuiiZQ91WEuoVO1y+PUv32nfin+FFqqqEt+/8athaMOPhiASrI
	kmk1aHu85YgpTiZMcbkVNKs2gj8V6ki5Gh37l6jHGwFrlpfJgpRpvpsC3MQP0BZHP815APxW/RfdI
	fg2NtaUjUd/7fz4DyhpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iklmr-0002GG-8J; Fri, 27 Dec 2019 09:20:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iklme-0001qi-8O; Fri, 27 Dec 2019 09:19:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 03D5B283C07
Subject: Re: [PATCH v22 1/2] Documentation: bridge: Add documentation for
 ps8640 DT properties
To: Ezequiel Garcia <ezequiel@collabora.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
References: <20191223143538.20327-1-enric.balletbo@collabora.com>
 <20191223143538.20327-2-enric.balletbo@collabora.com>
 <9fc5e30b8bc7e160ddc54a2056ca6e57eaebbab4.camel@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <9eee88d1-21d4-5571-038f-60bc7fa05d3f@collabora.com>
Date: Fri, 27 Dec 2019 10:19:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <9fc5e30b8bc7e160ddc54a2056ca6e57eaebbab4.camel@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_011948_561697_289AFC10 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 drinkcat@chromium.org, Jitao Shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Ulrich Hecht <uli@fpond.eu>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ezequiel,

On 26/12/19 15:27, Ezequiel Garcia wrote:
> Hi Enric, Rob,
> 
> On Mon, 2019-12-23 at 15:35 +0100, Enric Balletbo i Serra wrote:
>> From: Jitao Shi <jitao.shi@mediatek.com>
>>
>> Add documentation for DT properties supported by
>> ps8640 DSI-eDP converter.
>>
>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Ulrich Hecht <uli@fpond.eu>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> [..]
>> +
>> +  ports:
>> +    type: object
>> +    description:
>> +      A node containing DSI input & output port nodes with endpoint
>> +      definitions as documented in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt
>> +      Documentation/devicetree/bindings/graph.txt
>> +    properties:
>> +      port@0:
>> +        type: object
>> +        description: |
>> +          Video port for DSI input
>> +
>> +      port@1:
>> +        type: object
>> +        description: |
>> +          Video port for eDP output (panel or connector).
>> +
>> +    required:
>> +      - port@0
>> +
> 
> Is it correct to require port@0 ? This could be called port@1
> or port@2, and IIUC it should bind the same.
> 

My understanding is that at least the Video port for DSI input is required,
which makes sense, otherwise you have the chip connected nowhere. port@1 is
optional because it could be connected to a eDP panel or can just be a connector.

About your second question, I am not sure I understand you. You mean that have a
DT like this should work?

            ports {
                #address-cells = <1>;
                #size-cells = <0>;

                port@1 {
                    reg = <0>;
                    ps8640_in: endpoint {
                        remote-endpoint = <&dsi0_out>;
                    };
                };

                port@2 {
                    reg = <1>;
                    ps8640_out: endpoint {
                        remote-endpoint = <&panel_in>;
                   };
                };
            };


Probably yes, because the driver what really looks is the register value, but
that's odd and probably a bad practice. Also if I am not wrong the convention is
name the nodes with port@<reg property> (like we do in i2c devices for example)

port@0 is the label that has the register value to 0.
port@1 is the label that has the register value to 1.
...

Thanks,
 Enric

> Thanks,
> Ezequiel 
> 
>> +required:
>> +  - compatible
>> +  - reg
>> +  - powerdown-gpios
>> +  - reset-gpios
>> +  - vdd12-supply
>> +  - vdd33-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    i2c0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        ps8640: edp-bridge@18 {
>> +            compatible = "parade,ps8640";
>> +            reg = <0x18>;
>> +            powerdown-gpios = <&pio 116 GPIO_ACTIVE_LOW>;
>> +            reset-gpios = <&pio 115 GPIO_ACTIVE_LOW>;
>> +            vdd12-supply = <&ps8640_fixed_1v2>;
>> +            vdd33-supply = <&mt6397_vgp2_reg>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                port@0 {
>> +                    reg = <0>;
>> +                    ps8640_in: endpoint {
>> +                        remote-endpoint = <&dsi0_out>;
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    ps8640_out: endpoint {
>> +                        remote-endpoint = <&panel_in>;
>> +                   };
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> -- 
>> 2.20.1
>>
>>
> 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
