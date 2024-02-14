Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A3BC48BC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xahWjdNCi2WsslbcZiKcBqmoJZGlAV9+eeyoycvvNNo=; b=eJxoedWcIvglzgabFE3ENEv0hf
	P4ShZm0k0R1/iuVqanRVzmUy2WeJ4ARLMsOp2eJX8e6ABg0t79FHatSAMTJgegJyE9EC3iu02MMMP
	QG/6Zaz/G19h5XIljOt4ps1/Lk5JuJwXalxhEknYBq2yhI5Ir+CDa6V0OSq1z8Qolrw/wUchl7R4i
	CjvMHcyi8lkBpFj63J8v8WmQQQMlMz4Kh799rkkAvC+3sZ4E6r4OTjqfP+J+MmCbVLBFeegqCE23I
	p8IZ7+DQG3MR9PqTGC6PX5qS089Z4qzJ5sPA7+3nB/MLHilvYAkPQC7ZuLpq/a8bmqMcKPwv6p6Yw
	3CX1NITw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBYe-0000000CHsu-29vX;
	Wed, 14 Feb 2024 09:28:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBYb-0000000CHrr-2PPw;
	Wed, 14 Feb 2024 09:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707902876;
	bh=R7/bEBifI4lBAh8QUwfn+H3MAcMLkC8MOxtp6x/n10M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4uggz3V0Edxv8IP6cRbU05flDUjer1IhQ4PFjTRlQUhgVduHUEqnpHW8Yyrkwsz1z
	 sjZU2G8VmNpGDZ/ZLCnoWGrsECWcSlKn+UrXq0aJARQmubB0T9vXZNDct5ks00j1xp
	 gouKT9E02DbzrkddLKKJnCfwm0z0SmFeC6KjChIh2b5d9un4TFz7S0lAX3YDDjLi2i
	 OVDzwPrPBVsr8eHkabjEMthfceQ2mC49sVxKGSR+ts4dE2KhXN0vhmgecQXbG2csbq
	 HK3kP2gG+VcB6Dfnu6p3GxbPtxBPPvaNsRGhjGhQiq+NzvRLEa1wL08BAbxB6AA7Fc
	 pnQhu/Fs7tksg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3AD113781FEF;
	Wed, 14 Feb 2024 09:27:55 +0000 (UTC)
Message-ID: <e957b044-fe84-4b72-bdf1-cbc40c722019@collabora.com>
Date: Wed, 14 Feb 2024 10:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible for
 MT7988
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Conor Dooley <conor@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 John Crispin <john@phrozen.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213164633.25447-1-zajec5@gmail.com>
 <20240213-resource-evaluator-0754cfd5882d@spud>
 <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <d4391868-ddcd-4f66-b539-28d245fa83df@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_012757_774064_45FB022F 
X-CRM114-Status: GOOD (  22.53  )
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

Il 14/02/24 07:34, Rafał Miłecki ha scritto:
> On 13.02.2024 19:18, Conor Dooley wrote:
>> On Tue, Feb 13, 2024 at 05:46:32PM +0100, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> MT7988 has on-SoC controller that can control up to 8 PWMs.
>>
>> I see a binding and a dts patch, but no driver patch, how come?
> 
> I believe that to avoid cross-trees patchsets (which are sometimes
> tricky for maintainers) there are two ways of submiting such changes:
> 1. dt-binding + driver; then (separately) DTS
> 2. dt-binding + DTS; then (separately) driver
> 
> I chose later in this case as my personal priority right now is to deal
> with all MediaTek DTS files.
> 
> Is that wrong or unacceptable?
> 

It's not wrong but it's partially unacceptable, at least on my side.

In my opinion (and I believe many do agree with me), sending the binding along
with the driver is the right choice, and if you also want to include the dts
that is also appreciated: series can go through multiple maintainers applying
subsets - it's ok to do.

I want to put emphasis on sending the binding with the driver, as this allows
for a better review on everyone's side because we do see the full picture and
we can give better advices: in this case, I'm not sure whether adding a new
compatible for MT7988 in an enum is a good idea, as the compatible string may
be shared with one of the *eleven* SoCs that are supported in the PWM driver,
meaning that (hardware speaking!) the PWM controller in 7988 might be the same
as the one in mt1234.

Thanks for the great work that you're doing on the bindings btw.
Keep it up!
Angelo

> 
>> Also, what makes this incompatibly different with the other devices in
>> the binding, like the 8183?
> 
> It can control 8 PWMs unlike any other SoC block except for MT2712.
> It uses different registers than MT2712 thought.
> 
> 
>> Cheers,
>> Conor.
>>
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>   Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml 
>>> b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
>>> index 0fbe8a6469eb..a5c308801619 100644
>>> --- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
>>> @@ -24,6 +24,7 @@ properties:
>>>             - mediatek,mt7629-pwm
>>>             - mediatek,mt7981-pwm
>>>             - mediatek,mt7986-pwm
>>> +          - mediatek,mt7988-pwm
>>>             - mediatek,mt8183-pwm
>>>             - mediatek,mt8365-pwm
>>>             - mediatek,mt8516-pwm
>>> -- 
>>> 2.35.3
>>>
> 



