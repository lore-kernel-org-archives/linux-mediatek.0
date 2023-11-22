Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B307C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 08:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niGgf0XKP2t2Zirpm3py6uN4TsslbCqBZV8swChcUGg=; b=wejBdBTe2TfFt7epNqVAJw3Fae
	xb7WzO1RiMUIoK0Jo7A9h400anjGqt7/ZH4E68JH8VRRduw8XrV7itsKBDT6CXpnIijQnxSTcffsQ
	Sikw7SXv4mHpRoNCKu4Iyvoj80CL/C0kbpJMWs0Dl1hwvC1q1pnESC35n42krCbL6Tx90sn6HHz7G
	hKavf5HnrYSiavD7+x0tAwcAIPTWfq4JsZXTryrcTeLhycXLM8XPHIovuW6/BY5jQfzjEZEcVTB+e
	HdBgjqX/ACgq45EylsxQ7OsDmQ5d0fWlQuFox5MEiBAT7qjTN0ODXHzP+JZ2cm5u5Q0vCGtF4lQG5
	0hXen46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5icQ-0013l0-1z;
	Wed, 22 Nov 2023 08:29:58 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5icL-0013j1-2D;
	Wed, 22 Nov 2023 08:29:55 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1700641789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=niGgf0XKP2t2Zirpm3py6uN4TsslbCqBZV8swChcUGg=;
	b=luqkiFNbDd6RWusGME8U43GdpWQmVFH6uGh/SeA8mjPpqqWUZjiYyAvcSlh9sV5lce7/vO
	IG7+5LekhVo61e4jR+mBvUp3MnXnsfUTKhsCcRxKG5DNecDwP4vMPtna+pTlfDgoXh6GqZ
	KK4twF/6W9Y41udae9CkgIastHp8o5IeFZxhSkVqr8StItMw0G6CXgxd5HcXuGCCaxFhw+
	K677kgapgPbS0Xm9zEfvJE0UxGKnth8RbWPlO1rCaMoqPP+/0+58Dyf2rVg9Ds6bTl3eQX
	wR8zSKh//XY965zoutJqNqDYel2x3Zt5H0gDg3exzshfTMc1ZsMCJq6l7MBjIg==
Date: Wed, 22 Nov 2023 09:29:49 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: wens@kernel.org, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof
 Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
In-Reply-To: <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com>
 <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
 <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
 <7232a48b-b9ad-44b5-ae6a-d12dad70b3c4@linaro.org>
Message-ID: <58a9caacc1226c7c3a2bdfe73ef1791f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_002954_026014_AAE885ED 
X-CRM114-Status: GOOD (  14.60  )
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

On 2023-11-22 09:21, Krzysztof Kozlowski wrote:
> On 22/11/2023 09:09, Chen-Yu Tsai wrote:
>> On Wed, Nov 22, 2023 at 4:05 PM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>> 
>>> On 21/11/2023 14:50, Rafał Miłecki wrote:
>>>>> +Order of Properties in Device Node
>>>>> +----------------------------------
>>>>> +
>>>>> +Following order of properties in device nodes is preferred:
>>>>> +
>>>>> +1. compatible
>>>>> +2. reg
>>>>> +3. ranges
>>>>> +4. Standard/common properties (defined by common bindings, e.g. 
>>>>> without
>>>>> +   vendor-prefixes)
>>>>> +5. Vendor-specific properties
>>>>> +6. status (if applicable)
>>>>> +7. Child nodes, where each node is preceded with a blank line
>>>>> +
>>>>> +The "status" property is by default "okay", thus it can be 
>>>>> omitted.
>>>> 
>>>> I think it would really help to include position of #address-cells 
>>>> and
>>>> #size-cells here. In some files I saw them above "compatible" that 
>>>> seems
>>>> unintuitive. Some prefer putting them at end which I think makes 
>>>> sense
>>>> as they affect children nodes.
>>>> 
>>>> Whatever you choose it'd be just nice to have things consistent.
>>> 
>>> This is a standard/common property, thus it goes to (4) above.
>> 
>> It's probably a mix, but AFAIK a lot of the device trees in tree have
>> #*-cells after "status". In some cases they are added in the board
>> .dts files, not the chip/module .dtsi files.
> 
> Existing DTS is not a good example :)
> 
>> 
>> +1 that it makes sense at the end as they affect child nodes.
> 
> I still insist that status must be the last, because:
> 1. Many SoC nodes have address/size cells but do not have any children
> (I2C, SPI), so we put useless information at the end.
> 2. Status should be the final information to say whether the node is
> ready or is not. I read the node, check properties and then look at the 
> end:
> a. Lack of status means it is ready.
> b. status=disabled means device still needs board 
> resources/customization

I agree with the "status" belonging to the very end, because it's both 
logical and much more readable.  Also, "status" is expected to be 
modified in the dependent DT files, which makes it kind of volatile and 
even more deserving to be placed last.

