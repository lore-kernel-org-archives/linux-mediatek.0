Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41F6C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 13:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sx7H38LVSIveFdRkRgG6Rw9Kr+iLPL95nlelpRdyIbk=; b=kJHvPLxYfUirAC
	11QlSgW9a4q89/zyJSNs2fwHgJLGGsVFU3UBjMJ0JERfJlMoxgn3Xif/GTuqc5s8koQ3DE5qak+aQ
	twefOWK/d01sjXC+zuDGlIuMW0ooYlCd2dvaeS/s7zJLPOy4wI5svQB8W2bGI4nDF3RosGfxjzsib
	LCk8cVJN60bz0AddSD6/a9RcHbRQhG6nwpCFgGjuv7hW+5GbnXGxaymK70SogNU6oDo93jcn7XB3i
	NCpJ5R6JzZ17f5MyhuthFD1RRkg13GwOko50cpBx6e0OutuYERAF6CzV6dGO9ao4ZZ/Ee0eVuad2G
	t8kf8MFSqzAmI3kFvoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1l2-00B2QK-2W;
	Wed, 03 Jan 2024 13:58:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1kz-00B2PI-2R;
	Wed, 03 Jan 2024 13:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704290284;
	bh=JO7RVJxRzIBM+hqrV3qvd0udNiqUczY+zEyxv10jhiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDiwRsJ88AmZVNG+/rWDyyDNplOitszzyj4Co+jIgdLCUc1iQFnMIDOxenHz5BiNd
	 mv/5O/f0Wx8gPLvcbzTxyy4j3oOuRj/XxYSt/Ch/4F0AWWLFiREcGIgh8VDVPtukZ7
	 D3UHu0k6T9JQMrgmmfkxBCo6YCxSYbLaJNdihpdu/VQn/zSxWAODEnXHJ0YNPuQLgJ
	 O+V6o7diItBMknlJv0xgyforFDMiVLvCTk4CRPNAlyEnq7EyuQ/sjdhqhAiaoDbZ1K
	 75GaEa9L5SuNBKQC98RMYdE7khkE3VKrjKZbim9TLo8Nli6TJP9aXHhlaevafLyP7P
	 qDqSI0Qmxt01A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AD8F737813CB;
	Wed,  3 Jan 2024 13:58:03 +0000 (UTC)
Message-ID: <76aefd7f-601e-4cc6-b66f-6e62659791a5@collabora.com>
Date: Wed, 3 Jan 2024 14:58:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan
 node
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231116130816.4932-1-zajec5@gmail.com>
 <a5113b85-e29c-454f-b776-ac7abbca771f@gmail.com>
 <d0734a8f-0b72-4609-a941-da4bdc3e323e@gmail.com>
 <ddbdec9b-f075-4c7e-9411-28baf1e68401@linaro.org>
 <e0fae82d-aa6c-4341-bc56-1370dcf733b1@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e0fae82d-aa6c-4341-bc56-1370dcf733b1@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_055805_923016_88603D20 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/01/24 12:45, Arnd Bergmann ha scritto:
> On Thu, Dec 28, 2023, at 08:14, Krzysztof Kozlowski wrote:
>> On 28/12/2023 08:03, Rafał Miłecki wrote:
>>> On 14.12.2023 07:43, Rafał Miłecki wrote:
>>>> On 16.11.2023 14:08, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> I sent those few trivial fixes weeks ago:
>>>> [PATCH] arm64: dts: mediatek: mt7986: fix reference to PWM in fan node
>>>> [PATCH 1/2] arm64: dts: mediatek: mt7986: fix SPI bus width properties
>>>> [PATCH 2/2] arm64: dts: mediatek: mt7986: fix SPI nodename
>>>> [PATCH] arm64: dts: mediatek: mt7986: drop crypto's unneeded/invalid clock name
>>>>
>>>> Could someone pick them up, please?
>>
>> This should happen some time ago but...
>>>
>>> Anyone, please?
>>
>> ... exactly now, this cannot happen. We are way past applying patches
>> for the next cycle. Please ping or resend after the merge window.
> 
> If these are bugfixes, I still take them, only new functionality
> should wait. I still need a reply from the maintainers of course.
> 
>        Arnd

I didn't notice those patches, sorry; just added my R-b's to all four.

Arnd, if you can - please pick.

Thanks,
Angelo

