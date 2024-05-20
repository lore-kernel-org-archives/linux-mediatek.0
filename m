Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016C4C25B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r7fP6jwbLyriz5hxG+6I2In6nTPxnkp7wEVQUYmslY=; b=UvofkonwWiLUDAgPhikQDOAwGJ
	o1ELl9buF1TXZC++Jw6F1FTz+ouS+14BFWBWez4VAXJJaUlbLAMqZ+wnHL2hBs6q8FvjvRcmZujci
	GXSpJLZ9e4y9YgyaPG+uaYFRzZgDBCqbQvhODZgcPXj6a/Kpfu4A2BTE4pQ63TLJEgPK98uM03ND8
	tKVUmsuuR010tGiHIDOgBAKG1a4KiwqaH3ZcXpQ1OS8lsExZ3Dbb4TTmqAaL0pjtrdSaJUEYcSCxQ
	90xq44ZVpTR302Pb8QwRfg4pZWp3dqhIFMMPqOL7DylFZ1GHZabPrRVmN4/d9/M63Cn2oLNOAR7j9
	/8y5WRBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90eI-0000000ED7q-1yOW;
	Mon, 20 May 2024 10:53:46 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90eE-0000000ED3k-2IAO;
	Mon, 20 May 2024 10:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716202409;
	bh=WQTGyraacCkp953Pb1xBtyAnVlrhrQtJheAU+E27X1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I/oDXq0uYxlX0E45oaELAZ8sisGTPoVZ3frcYvoOquOWHQAETecxFN6l6jY4sXCAy
	 z3HoFWVsDY55Je+68wcfuHbs5kbUGDm5rwngyQHkFaCTDvQBD0sAVWg7Jjv+PuWH3O
	 8PnoA4MUreTvXn5K3DFvZguFmCjNQZbRxj/A54XQcboL2eNm3UCSPgZUqbB64J98rH
	 kD/NmLNPr1/k1tHPTkOfWKE+sjMzO83jq0HeKUdZ9jOIgwoV+YnqgdCo6MeKMmeYTA
	 BMlLNvwp5paeRUbn3H6qcNxoUPYt0CT9BsO7VpAgjck0DA8S7nPmpu15tE6aTa+EZI
	 8eqQ5BnV4mBdg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A90C37821B2;
	Mon, 20 May 2024 10:53:28 +0000 (UTC)
Message-ID: <7dbe08cf-47a1-4da6-9035-6b0932cf8426@collabora.com>
Date: Mon, 20 May 2024 12:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Alexandre Mergnat <amergnat@baylibre.com>, chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
 <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_035342_738244_D8DDE0A4 
X-CRM114-Status: GOOD (  17.85  )
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

Il 19/05/24 19:18, Alexandre Mergnat ha scritto:
> Hi Angelo,
> 
> On 16/05/2024 10:11, AngeloGioacchino Del Regno wrote:
>> +    oneOf:
>> +      - required:
>> +          - endpoint@0
>> +      - required:
>> +          - endpoint@1
>> +      - required:
>> +          - endpoint@2
> 
> I'm not sure this is what you expect because I must remove this part to pass the 
> dt-validate.
> 
> I have 2 possible display at the same time (DSI and DPI), then I add this in my DTSI:
> 
>          mmsys: syscon@14000000 {
>              compatible = "mediatek,mt8365-mmsys", "syscon";
>              reg = <0 0x14000000 0 0x1000>;
>              #clock-cells = <1>;
>              port {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> 
>                  mmsys_main: endpoint@0 {
>                      reg = <0>;
>                      remote-endpoint = <&ovl0_in>;
>                  };
>                  mmsys_ext: endpoint@1 {
>                      reg = <1>;
>                      remote-endpoint = <&rdma1_in>;
>                  };
>              };
>          };
> 
> But the DTS check returns me an error:
> 
> dt-validate -s Documentation/devicetree/bindings 
> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb
> /home/*******/linux-upstream/arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: 
> syscon@14000000: port: More than one condition true in oneOf schema:
>          {'$ref': '/schemas/graph.yaml#/properties/port',
>           'oneOf': [{'required': ['endpoint@0']},
>                     {'required': ['endpoint@1']},
>                     {'required': ['endpoint@2']}],
>           'properties': {'endpoint@0': {'$ref': 
> '/schemas/graph.yaml#/properties/endpoint'},
>                          'endpoint@1': {'$ref': 
> '/schemas/graph.yaml#/properties/endpoint'},
>                          'endpoint@2': {'$ref': 
> '/schemas/graph.yaml#/properties/endpoint'}}}
>          from schema $id: 
> http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
> 
> 
> In other hand, if I use "ports" to keep only one endpoint for each port:
> 
>          mmsys: syscon@14000000 {
>              compatible = "mediatek,mt8365-mmsys", "syscon";
>              reg = <0 0x14000000 0 0x1000>;
>              #clock-cells = <1>;
>              ports {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> 
>                  port@0 {
>                      #address-cells = <1>;
>                      #size-cells = <0>;
>                      reg = <0>;
>                      mmsys_main: endpoint@0 {
>                          reg = <0>;
>                          remote-endpoint = <&ovl0_in>;
>                      };
>                  };
> 
>                  port@1 {
>                      #address-cells = <1>;
>                      #size-cells = <0>;
>                      reg = <1>;
>                      mmsys_ext: endpoint@1 {
>                          reg = <1>;
>                          remote-endpoint = <&rdma1_in>;
>                      };
>                  };
>              };
>          };
> 
> The DTS check returns another error:
> 
> dt-validate -s Documentation/devicetree/bindings 
> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb
> /home/*******/linux-upstream/arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: 
> syscon@14000000: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'
>          from schema $id: 
> http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
> 
> Additionally, with the last DTS example, displays aren't working, probably because 
> "ports" isn't well parsed.
> 
> So, I don't know how you want to manage multiple display, but IMHO there are 2 ways:
> - removing the current "oneOf".

...eh I think this should be anyOf instead :-)

I'll check later and send a v5.

Cheers,
Angelo

> - adding the "ports" support in the documentation and driver (to be parsed).
> 
> Still possible I missed something and I doing shit :)
> 



