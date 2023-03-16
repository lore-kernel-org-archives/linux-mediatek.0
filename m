Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BF8C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 09:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USr1mcavu183aIUMW2zaakLobziUEqGaltzaDkGJe7k=; b=pcq6e6EE10EBzP7PwoFAIA9Jka
	vaVV97595wpn02ruIj1cez1qgQVIC3ONz9sfnjO8qvGb8tMZFqPWoOQ8A+jdIKoq6WX7H6YpPZ+U1
	YEIklacsMN0wfvBEtmGMvRTKTWaIigSfuuEk7AdkU7/lD6RlWUHGk7Z+182eVW44K3dRtNTG8euTS
	IuQIwupaeSmiqGZmP1IYVMwgnmwJfNBR9YAuTzdg2QevOwiK0qrM6nQO4Cdlg7xF3pyUawUdQF89w
	0xNUqUvnG2cjZO4QF1qw629uZyZvUuopIxDj5pZmwz1qUL/bIkM5uo7G8X6R09RDJd2W/j4nazHJT
	Glu0ltOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckJ5-00Fw8g-2x;
	Thu, 16 Mar 2023 09:53:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckIz-00Fw4E-35;
	Thu, 16 Mar 2023 09:53:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE59F660309E;
	Thu, 16 Mar 2023 09:53:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678960429;
	bh=U016GfVVdnxsip9oeySV3RsjrHt+GbtN8I0vEam86cw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1ZYug/Rc7GC9oaJibLCGVC1ot6HrZSJaaD6dBId+/IevQCU8BtC3krYiV1jYB1vG
	 QntG3e3/vTGxkEjKz92r3TfeVbI0b974DjcPXf4GI2j705nXTtC9lwiOAd2/AnY/F6
	 z0CXJd7cBrVcF76ENARf0NTaYVTa7yGwdM/0MVCXo3vZlYh0D5bvxoNXrF0aymJ3Zb
	 F8uYdm9tAIDz6DQWBRSVg36L9plmJGvA5FyZrNRsHMRHMDyI3PxKybudbJIEiuNwVP
	 V/QFPGh4hL2xHjhAFEFAKBm5yn+8gIYX9WiQd8Y0uE7XWaJ+xmz5ux83Th4WlKzPyS
	 T+JmIMMYGK3Ig==
Message-ID: <e5ceec9e-d51b-2aeb-1db7-b79b151bd44c@collabora.com>
Date: Thu, 16 Mar 2023 10:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?=
 <ck.hu@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
 <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
 <1d65e8b2de708db18b5f7a0faaa53834e1002d9f.camel@mediatek.com>
 <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <b04eb48e-c9aa-0404-33ec-bef623b8282f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_025354_255509_8A99F7AE 
X-CRM114-Status: GOOD (  15.58  )
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

Il 16/03/23 07:31, Krzysztof Kozlowski ha scritto:
> On 16/03/2023 07:19, Nancy Lin (林欣螢) wrote:
>> On Wed, 2023-03-15 at 08:16 +0100, Krzysztof Kozlowski wrote:
>>> On 15/03/2023 04:45, Nancy Lin (林欣螢) wrote:
>>>

..snip..

>>>>
>>>>
>>>> [1].
>>>> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.e
>>>> xamp
>>>> le.dtb
>>>> /proj/mtk19347/cros/src/third_party/kernel/v5.10/Documentation/devi
>>>> cetr
>>>> ee/bindings/display/mediatek/mediatek,ethdr.example.dtb:
>>>> hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295, 7,
>>>> 16384,
>>>> 4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
>>>> 4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295,
>>>> 7,
>>>> 45056, 4096, 4294967295, 7, 49152, 4096] is too long
>>>>          From schema:
>>>
>>> This looks like known issue with phandles with variable number of
>>> arguments. Either we add it to the exceptions or just define it in
>>> reduced way like in other cases - only maxItems: 1 without describing
>>> items.
>>>

...

>>
>> But I have several items for this vendor property in the binding
>> example.
> 
> Do you? I thought you have one phandle?
> 
>> Can I remove maxItems? Change the mediatek,gce-client-reg as [1].
>>
>> [1]
>>    mediatek,gce-client-reg:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>      description: The register of display function block to be set by
>> gce.
>>        There are 4 arguments in this property, gce node, subsys id,
>> offset and
>>        register size. The subsys id is defined in the gce header of each
>> chips
>>        include/dt-bindings/gce/<chip>-gce.h, mapping to the register of
>> display
>>        function block.
> 
> No, this needs some constraints.

Hello Krzysztof, Nancy,

Since this series has reached v29, can we please reach an agreement on the bindings
to use here, so that we can get this finally upstreamed?

I will put some examples to try to get this issue resolved.

### Example 1: Constrain the number of GCE entries to *seven* array elements (7x4!)

   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
     description: The register of display function block to be set by gce.
       There are 4 arguments in this property, gce node, subsys id, offset and
       register size. The subsys id is defined in the gce header of each chips
       include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
       function block.
     items:
       minItems: 28
       maxItems: 28
       items:                     <----- this block doesn't seem to get checked :\
         - description: phandle of GCE
         - description: GCE subsys id
         - description: register offset
         - description: register size


### Example 2: Don't care about constraining the number of arguments

   mediatek,gce-client-reg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
     description: The register of display function block to be set by gce.
       There are 4 arguments in this property, gce node, subsys id, offset and
       register size. The subsys id is defined in the gce header of each chips
       include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
       function block.


Regards,
Angelo

