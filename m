Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B896EA3F3A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xuJ5/oiqYogBObFdL4nrdhAJ9EDpplKb22GqFB6V8o=; b=SSRafanJTmculBR1A6YJDrRi0z
	l5JB/IyNqzVHuq5/HxbKC6iyPsHpg3sZq2C2yIfbxBRE9E1nWGzinbKte6Xg9fH1+xBHnEu6TfrVk
	v4nhVzrPFPNgBTq080BpCJCJYxuQUkM7Q/2rN5YmPTCxUAq46mKEfOAF/YCm/rYHhVLtWC70IPkwd
	LD4D16PqIy3Mbw8CZCbHt74T1TiRMO6Fq6oVfYMxkHsOj+seJ6EF+nDFR1CnDOcBFNH8tRAQuf1/M
	LsQMN9zBphL27r09A2v6Slx53E5miwuGA12myaSYLUscPfYpXaGsf4PXyz/fklSQY0lbSGGt7La3e
	9qYyv06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplL5-0000000GrED-28S0;
	Tue, 10 Feb 2026 10:51:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplL2-0000000GrDk-2n0w;
	Tue, 10 Feb 2026 10:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770720681;
	bh=NTDQ2z46qy9D3IuLQd4Soj1UA8t+QmePoMymLDLGHS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ORI+W7xILBNUuSSdr6XQ7zospIplxBB0gAiCi+7j+WjOg6OirC5t7D+Xl5O7l6U0P
	 0HD2maqTImAwLwopKSirmVOZeShM031FZYVVgpHLke/6jK4BxMMu0ps9IYJAiVU7mJ
	 DPkI4/W6XVDRMh6+5pcME+ypELxTR7UpIOY675gyM5/WE4WjDlffajsjni8nZUuueR
	 XxgTBnTkrlvPFnk/DRWWENPmDN+lmWYtu9LWEMdMIEYX+QtAP5kHqaevrVTBqCC3ku
	 tUTykaPPeNV8WofuxZySz/BeOHrhszS0BTziiskZQVZeGt1ORhiYtOxaHAmvupeBWQ
	 n1OUnnD1am5mQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9846417E012E;
	Tue, 10 Feb 2026 11:51:20 +0100 (CET)
Message-ID: <296b000c-5970-4668-bd42-b99ca78d598f@collabora.com>
Date: Tue, 10 Feb 2026 11:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
To: Luca Weiss <luca@lucaweiss.eu>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
 <20260207-tricky-strange-swan-6f11b0@quoll>
 <3476c51b-9293-40f1-8b5c-9ac9802d7d97@collabora.com>
 <f1e1eeea-b246-42c8-84c9-0c1203706ddc@lucaweiss.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f1e1eeea-b246-42c8-84c9-0c1203706ddc@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_025124_882164_E371ABD5 
X-CRM114-Status: GOOD (  22.82  )
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

Il 09/02/26 21:45, Luca Weiss ha scritto:
> Hi AngeloGioacchino,
> 
> On 09-02-2026 12:34, AngeloGioacchino Del Regno wrote:
>> Il 07/02/26 11:51, Krzysztof Kozlowski ha scritto:
>>> On Fri, Feb 06, 2026 at 11:20:48AM +0100, Luca Weiss wrote:
>>>> Document the Mediatek mt8516-syscfg.
>>>
>>> Which is what? What is syscfg block?
>>>
>>
>> Not sure this is really a SYSCFG block.
>>
>> This should be a GPIO controller range, which is split between IOCFG and EINT.
>> Now, the legacy drivers are declaring the EINT iospace in the pinctrl node, and
>> getting the GPIO controller (IOCFG) iospace from a regmap.
>>
>> I don't have any board with MT8516... but well, the really-right-thing to do
>> would be to migrate that SoC off of the legacy driver, to the new-style one
>> that *properly* takes two iospaces:
>> "base" -> (0x10005000)
>> "eint" -> (0x1000b000)
>>
>> Luca, if you've got such a board, could you please try to migrate this SoC out
>> of the improper (but working good) driver and bindings?
>>
>> If not... well, I think this block is IOCFG, not SYSCFG...
> 
> Thanks for the suggestions. This is essentially my first Mediatek patch and while 
> I'd say I have a good understanding of Qualcomm SoCs, Mediatek is very different, 
> so I've got no clue about anything here really ;)
> 
> I'll try to decipher your comment and see what I can do about it, hopefully soon. 
> Thanks!
> 

Oh, okay. You want to check mt6795.dtsi - that's a SoC that has "more or less" the
same generation of GPIO Controller IP as MT8516.

Also, useless to say, drivers/pinctrl/mediatek ... there's a pinctrl-moore and a
pinctrl-paris; your SoC *should* be paris, but I don't really know - you want to
definitely check if the register layout matches between the old-legacy-deprecated
driver and the Paris IP.

Check a bit; should you have any question, either reply here or shoot me an email,
I'll do anything I can (though probably with late replies, as I'm usually a bit
busy with work - but no worries about disturbing in any way!) to clarify things
for you.

Cheers,
Angelo

> Regards
> Luca
> 
>>
>> Cheers,
>> Angelo
>>
>>>>
>>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>>> ---
>>>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/ 
>>>> Documentation/devicetree/bindings/mfd/syscon.yaml
>>>> index e57add2bacd3..a67699f1faee 100644
>>>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>>>> @@ -91,6 +91,7 @@ select:
>>>>             - mediatek,mt8135-pctl-b-syscfg
>>>>             - mediatek,mt8173-pctl-a-syscfg
>>>>             - mediatek,mt8365-syscfg
>>>> +          - mediatek,mt8516-syscfg
>>>
>>> Why aren't you placing it with all others mediatek,mt8516 syscons?
>>>
>>> Why this is so generically called "syscfg", completely not looking like
>>> a real name from datasheet unlike the others in this device.
>>>
>>> You have entire commit msg to explain that.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>>
> 

