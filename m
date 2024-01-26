Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AB3C47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUrHCdmHpjozJUMDzt9A7x1z29qmZ1Rmdo3GnFFquP0=; b=omDE3NPLL9PA4pa/5BibyP3uSh
	fZT1EjWfwJwX6awEkiazpWNOzmEWYPYo0ZYYeGsYS5L6nMLoMqZvTOzuQsV+iTIPb2WgZIUxatls6
	uwgZWlcoRGdexvck9X+EhfTnILmHub6Mj0+xfsjXst2FO17Zt+/uyysx5Rb2xNCFWnlvwt0biy5aV
	dZ+vnuBeuUHNW+Y5tfDJauO5rzzsItjoV36ulDkjeeGbRWYc4ZOFRpnJa+v0/Ks/XmPfzbFZyR8rJ
	WF0ObA0xEVunLojyElht9FXujox/RxkWDOgG6oo/CtXm58lEdPeNSXltmJJPZrZ4lKuDyTDMlU74o
	m49l6pCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIJc-00000003bvO-3RTi;
	Fri, 26 Jan 2024 09:16:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIJZ-00000003btQ-1FMN;
	Fri, 26 Jan 2024 09:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706260555;
	bh=cTOqvscxgkEm+jjAOeB+HwCjWsvKYRV/3IERaIp2Z6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=foaka/dbwOa4i+lCE/UY7QdaFni+nQr1DuUfGOXRTNuj4XoYTBLYYKMkQh43oJ+ln
	 5n9aZCTQb83jJXciEP2u2YGDy1QhECpdMOo1jtFaFQVucKiV6KgOP/N6wTfRaIlpy/
	 XNLe4PtzWHZG4zItC6MonC/glxP+ohhL7ONRYZypQhahrGbfUTNZYlgKcggJ+oA9I3
	 m5vmrg/2JqlACOZSUut9MqQz0IXqQcT+2F2zSOVk6DX2nDSeOiLzS1BOdCIArKbgVo
	 RYD82NiT/pxafRn6Fsq4TmvK7EL3PgE2QZV7jmlk6QqJic5YgE23GoPHo+LxiNY448
	 JN33/1GOqfw8A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D6C8A378107C;
	Fri, 26 Jan 2024 09:15:54 +0000 (UTC)
Message-ID: <27070454-09e6-422b-95f0-5d674735426b@collabora.com>
Date: Fri, 26 Jan 2024 10:15:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, heikki.krogerus@linux.intel.com, cy_huang@richtek.com,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
 <20240119-eldest-discharge-e2d3812be0a9@spud>
 <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
 <20240123-procurer-jumbo-ebbec485505d@spud>
 <4fdbc3d8-3d44-4c2c-aae6-daa0b431e1c9@collabora.com>
 <dc9773aa-690f-47b5-b60a-a79c1e2dbaf2@linaro.org>
 <abbc1135-6d32-421a-baea-123a9f761362@collabora.com>
 <20240125-disdain-delivery-ff3bf246bbe1@spud>
 <20240125-elective-sermon-32dc2cba79be@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240125-elective-sermon-32dc2cba79be@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011557_503819_C512A243 
X-CRM114-Status: GOOD (  22.93  )
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

Il 25/01/24 18:02, Conor Dooley ha scritto:
> On Thu, Jan 25, 2024 at 04:57:33PM +0000, Conor Dooley wrote:
>> On Thu, Jan 25, 2024 at 12:41:57PM +0100, AngeloGioacchino Del Regno wrote:
>>> Il 25/01/24 11:32, Krzysztof Kozlowski ha scritto:
>>>> On 24/01/2024 09:48, AngeloGioacchino Del Regno wrote:
>>>>> Il 23/01/24 18:14, Conor Dooley ha scritto:
>>>>>> On Mon, Jan 22, 2024 at 11:32:30AM +0100, AngeloGioacchino Del Regno wrote:
>>>>>>> Il 19/01/24 17:32, Conor Dooley ha scritto:
>>>>>>>> On Fri, Jan 19, 2024 at 10:41:04AM +0100, AngeloGioacchino Del Regno wrote:
>>>>>>>>> This IP has only one interrupt, hence interrupt-names is not necessary
>>>>>>>>> to have.
>>>>>>>>> Since there is no user yet, simply remove interrupt-names.
>>>>>>>>
>>>>>>>> I'm a bit confused chief. Patch 2 in this series removes a user of this
>>>>>>>> property from a driver, so can you explain how this statement is true?
>>>>>>>>
>>>>>>>> Maybe I need to drink a few cans of Monster and revisit this patchset?
>>>>>>>>
>>>>>>>
>>>>>>> What I mean with "there is no user" is that there's no device tree with any
>>>>>>> mt6360-tcpc node upstream yet, so there is no meaningful ABI breakage.
>>>>>>> Different story would be if there was a device tree using this already, in
>>>>>>> which case, you can make a required property optional but not remove it.
>>>>>>
>>>>>> Not every devicetree lives within the kernel.. If the driver is using
>>>>>> it, I'm not inclined to agree that it should be removed.
>>>>>
>>>>> I get the point, but as far as I remember, it's not the first time that this
>>>>> kind of change is upstreamed.
>>>>>
>>>>> I'm fine with keeping things as they are but, since my intention is to actually
>>>>> introduce an actual user of this binding upstream, and that actually depends on
>>>>> if this change is accepted or not (as I have to know whether I can omit adding
>>>>> the interrupt-names property or not)....
>>>>>
>>>>> ....may I ask for more feedback/opinions from Rob and/or Krzk?
>>>>
>>>> Driver is the user and this is an old binding (released!), thus there
>>>> can be out-of-kernel users already.
>>>>
>>>> Minor cleanup is not really a reason to affect ABI. You could deprecate
>>>> it, though. Driver change is fine.
>>>>
>>>
>>> Thanks for the clarification. If USB maintainers want to take the driver part only
>>> without me resending this, I'd appreciate that.
>>>
>>
>>> The interrupt-names is not a required property in this binding anyway... :-)
>>
>> Having -names properties that are not required when the base property is
>> always seem so pointless to me, except in cases where they're not
>> required for the case where there's one item but required when there are
>> more than one. Ultimately they're pointless if not required since they
>> can't be relied on. I think dropping it from the driver is required for
>> correctness.
> 
> Actually, looking at the binding again:
> 
> | required:
> |   - compatible
> |   - interrupts
> |   - interrupt-names
> 
> It looks like it is a required property after all!

Apparently my brain's binding had

required:
   - blindness

:-P

Yeah, I have no idea why I didn't see that, sorry!

Cheers,
Angelo

