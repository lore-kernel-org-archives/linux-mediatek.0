Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BD1C3ABBC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIis3C4CFWwe/Nb/WYKe4dImQBx542mXba7Be46nPPk=; b=0ELcQQvNAZZ7+mjW2g5PN0u9Pn
	/ecxoBXkMVDvrgh0nQwn0KWxWK05sByE/dVHuptBRzUnKeEEk6+qNQdZbA8j8QMGPw9Po9CeLmwfF
	OIO23uiCkRVDXUsnX/NVDv6HspLsNhgtwB1PJ+ZZqVhNy11dz52oa4kwOByiYO9co2YBpBrtQTuXs
	rPUJtk+XL1W3o180l40NyubNybqfrnNB5qmiNc7fIjx1f8LHL4VakkaVFlSjLwKvuN8x4t8w8PSNt
	qNX3YQJLdkdM0ze48lry3KtbbaowPHT/sbDnMeYeRJWKXFU9iysjFHyJPAtgdIQ1jhUwfYPKDRuwr
	AvDuWKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMwP-0000000D15x-03Qn;
	Tue, 06 May 2025 18:22:53 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJEy-0000000CJTg-38nH
	for linux-mediatek@lists.infradead.org;
	Tue, 06 May 2025 14:25:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EED13E9408;
	Tue,  6 May 2025 16:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746541545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BIis3C4CFWwe/Nb/WYKe4dImQBx542mXba7Be46nPPk=;
	b=irxMbsQt3aIZkBTMYNb71ndZxm2HmV49EHtCrCq4sSmN4VC6qVpAuQcT8r6vSO/XEtW/CT
	hJSyvmpYsZwcUDDclOCyzxEx9ZpBvkOpuovMINSWZlUhmZb7ES9nDS3ZF7VnUuQb1eJTLT
	H+Jpv153lHJuk6CN8be32XLeoAfKtBAtM8vbYxZW+/jN2ZEyeJgW99NUbtylN4/OjNYyWc
	/GiO6cAF+wPBAQkkKj6CByIhE9DgqkvJoFGIcEKY+uP+tY6GV7hROBKfsug/psWVwvLrUO
	jLnCxRUI6sOzyeEYU9Z0d7v2fhlnt/HMtiHjMwokS4LsS6hazjaOthyjAxkU9w==
Message-ID: <ea17e686-68c7-463c-bb9e-bcc9e59a929d@cjdns.fr>
Date: Tue, 6 May 2025 16:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 2/7] clocksource/drivers: Add EcoNet Timer HPT driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-3-cjd@cjdns.fr> <aBjpBpJAIP89oiit@mai.linaro.org>
 <92cd3689-3409-4d43-8db1-8633d35f779a@cjdns.fr>
 <7c08cc9e-f39f-490c-85fe-5738656380e5@linaro.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <7c08cc9e-f39f-490c-85fe-5738656380e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_072548_982091_61F69481 
X-CRM114-Status: GOOD (  17.99  )
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


On 06/05/2025 10:54, Daniel Lezcano wrote:
> On 05/05/2025 20:09, Caleb James DeLisle wrote:
>>
>> On 05/05/2025 18:36, Daniel Lezcano wrote:
>>> On Wed, Apr 30, 2025 at 01:34:28PM +0000, Caleb James DeLisle wrote:
>>>> Introduce a clocksource driver for the so-called high-precision 
>>>> timer (HPT)
>>>> in the EcoNet EN751221 MIPS SoC.
>>> As a new driver, please document the timer (up - down ?, SPI/PPI, etc
>>> ...) that will help to understand the code more easily, especially the
>>> reg_* functions (purposes?).
>>
>>
>> Sure thing, I can elaborate the comment in the header of
>> timer-econet-en751221.c. Let me know if you'd like it described
>> somewhere else as well, such as the help of config 
>> ECONET_EN751221_TIMER.
>
> It is ok in the changelog, so it is possible to get the description 
> when looking for the patch introducing the new timer.


Sounds good.


>
> [ ... ]
>
>>>> +
>>>> +    cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>>>> +              "clockevents/en75/timer:starting",
>>>> +              cevt_init_cpu, NULL);
>>> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ... ) ?
>>
>> I see that Ingenic does this. This is the only timer so until it's up,
>> sleeping causes a hang. If sleeping is prior to CPUHP_AP_ONLINE_DYN is
>> considered a bug then this should be okay, but I'm not informed enough
>> to say whether that is the case so I'll follow your guidance here.
>
> Hmm, hard to say without the platform. May be just give a try with 
> CPUHP_AP_ONLINE_DYN to check if it works otherwise stick on 
> CPUHP_AP_MIPS_GIC_TIMER_STARTING as it is already defined ?


I need a little time for this because I only got SMP on this processor

some time ago in a PoC so I'll need to put that back together in order

to validate the change.


Thanks,

Caleb


>
> [ ... ]
>
>

