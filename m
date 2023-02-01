Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1379C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 17:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq2eN78p95kGg1hHWERLSXXwCSu24hkO+lemykEw+5o=; b=xHc1oQmI9xIaUxoNq2vS8LWXHN
	1A0Ks/4SKLm41igYc2XhLyPa+/ptcTgPEwhBMoahY78S2ZQSLMm8MHkD+DkuQVdr8yH/Pvg1UwsoC
	QHebwHVLAIuhTg8/KosV8BUQHVFxJkZpfs3G17UrKk319xWyFFCjD+2luqXW+O4CwIrEynUu5R3C1
	G7UJg1h5etLdkcyj/oTSFSlvgnphm/NzcqHUiQtxD0REjwPe2lAmdMlIfNcopDP410FYPxB/7TePP
	Yaysum6ELUUUELfSATMKduuTZZOpNuto+VAa4JqMwbeodeogTV6Gk9PeFFn6wio6k5ZXnBWm6LmEK
	wUSxVewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHF3-00D4S6-1y; Wed, 01 Feb 2023 17:49:53 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHEs-00D4PK-G2; Wed, 01 Feb 2023 17:49:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675273771; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bESEIlN1fQOVl/HoozJhsy0lIplWS/QOY0zItYgeuWGo6Ho6HDHLwXhdPua0vsSr5B2bK0UVwm27H7JY2M97CXckMbNXoNHpPxmOjazVIsqe51TcSRdZVrwKWOHlFE3y5+N8z4yDQSsKI7GnCVxplBe1QF98D//m7U1JM9hsong=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675273771; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Xq2eN78p95kGg1hHWERLSXXwCSu24hkO+lemykEw+5o=; 
	b=VDKvlPDeEEHk5L95hH91eYZEFC0o/jo0nTAJJGAQeHboxfNWZnH1L1tfSQAcdA9FOphvMCQcGdUeyN6c25uTqvKc0PuSp1iXop6EQ3tZiDeeH29ozywI4LCZze43/Ephq6odwX8l6KkMaml+UjXz4LuKGmJWYKunPhcaWQ3m6xg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675273771;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Xq2eN78p95kGg1hHWERLSXXwCSu24hkO+lemykEw+5o=;
	b=I10+d9x1Rlm7I010Mabuzs3+Atw0J8WqJwav053YtR9XBEyDBDSmUvumQf5LW11A
	HykGRxnBQ1AOMXhkW/360xJPxFfGDVDKSQPyd20pEkAiAuyvGKjJQWDBfhyGODQ7Pjn
	WShkzEpY887CXYlPJQVvHK1htY46+jSxhtgD8Hdw=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675273769829451.6386416386098; Wed, 1 Feb 2023 09:49:29 -0800 (PST)
Message-ID: <fa6dd68a-7e6f-91c5-d065-ef909b05166b@arinc9.com>
Date: Wed, 1 Feb 2023 20:49:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Aw: Re: [PATCH 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
 <20230120205318.519493-5-arinc.unal@arinc9.com>
 <9A7BD95A-F026-4EAB-96E1-12B1B0C6AAA4@public-files.de>
 <cf7d3247-4d21-98f0-819b-7653153ee4c0@arinc9.com>
 <c78e2725-0be7-caa8-40db-2f355cc2cdec@gmail.com>
 <trinity-a044d8eb-8bc2-4b96-9abf-874dcc10db54-1675183189634@3c-app-gmx-bs58>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <trinity-a044d8eb-8bc2-4b96-9abf-874dcc10db54-1675183189634@3c-app-gmx-bs58>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_094942_624017_AC0FCA1C 
X-CRM114-Status: GOOD (  15.70  )
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

On 31.01.2023 19:39, Frank Wunderlich wrote:
> Hi
>> Gesendet: Dienstag, 31. Januar 2023 um 12:55 Uhr
>> Von: "Matthias Brugger" <matthias.bgg@gmail.com>
>> An: "Arınç ÜNAL" <arinc.unal@arinc9.com>, frank-w@public-files.de, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
>> Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, erkin.bozoglu@xeront.com, "Sean Wang" <sean.wang@mediatek.com>, "DENG Qingfang" <dqfext@gmail.com>
>> Betreff: Re: [PATCH 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
>>
>>
>>
>> On 25/01/2023 17:54, Arınç ÜNAL wrote:
>>> On 25.01.2023 19:41, Frank Wunderlich wrote:
>>>> Am 20. Januar 2023 21:53:17 MEZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>>>>
>>>>>          switch@1f {
>>>>>              compatible = "mediatek,mt7530";
>>>>>              reg = <0x1f>;
>>>>> @@ -199,11 +208,6 @@ ports {
>>>>>                  #address-cells = <1>;
>>>>>                  #size-cells = <0>;
>>>>>
>>>>> -                port@0 {
>>>>> -                    reg = <0>;
>>>>> -                    label = "wan";
>>>>> -                };
>>>>> -
>>>>
>>>> This will break existing userspace setups using wan as interface name.
>>>
>>> Yup. The OS being used will have to either rename the interface or adapt to the
>>> new name, eth1.
>>>
>>
>> In that case please explain in the commit message why this is needed. We are
>> trying really hard to not break userspace by a device-tree update.
> 
> I understand the reason why Arınç wants to change it:
> 
> currently all ports including wan-port are routed via dsa over gmac0 (trgmii), Arınç enables the second gmac and port5 of switch to route wan-traffic over the other gmac. But unfortunately there is no mainline-way to rename the gmac1 interface (eth1) to wan...this would be a way to not break the userspace.
> 
> i had an older patch for mtk_eth_soc [1] which do it at driver level for mediatek ethernet driver, but afair a generic way to (re)name interfaces in dts (vendor independ) was requested as the right way.
> 
> regards Frank
> 
> [1] https://github.com/frank-w/BPI-Router-Linux/commit/5088c9c81e90014622a950fca38cfb29e0421155

I tried this [0] before. It's not going to happen on mainline, and 
that's fine. I'll just clearly mention on the patch log that the 
interface name will change with this patch.

[0] 
https://lore.kernel.org/netdev/20220404114000.3549-1-arinc.unal@arinc9.com/t/#u

Arınç

