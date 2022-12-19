Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F21C10F1B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1ycYMYs8Igi21lZa2tXT46ShjJdIMKV5DUc/YREoqo=; b=OmlvYkM83jmr+N89U7By6Njo3j
	1TW0ZNu7PgLFH25V8lE+On+HCCHEkauqr6xBHRQBO3SRSs6D5+LWB6+Bv9csBa9PPhNsRC5qTdXxo
	MqiVC8SvUPaMBRGZJX1dUantnCm+R5J6c92KuoVJLmpiXR5nXNJ1M6o3u3kfWTEiS5H0usA2+eK8j
	9ZcV4RSc8IlWD6rw4gB7zdsUXSb9eKod8lCC6Lli0L2UuKim3ddwHHi3PI0ZhjD2XS57lcQ4VB4bQ
	xcnGalRli6fM9HPP8/9lHLpv/nxCGE4XzUYAmX4gNjdvkx4PaZOAmzoX1jnBFYdzxjHQYFD63MVx2
	9eKehKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7BtI-00Aq5Q-Pe; Mon, 19 Dec 2022 08:52:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Bsq-00AphB-EP; Mon, 19 Dec 2022 08:52:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 636EB6601615;
	Mon, 19 Dec 2022 08:52:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671439946;
	bh=6vqH3SZnQNjQYcK54MP8+xXDz66wYQbyA0JC8HY+jdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hxNPgZvIk8ReNvTQgdRoPSRHnHKlcbsmV+tgoouCH6AJv40jhQvSD/qXXzug4CrzA
	 ZomvTfovbKlmuKXucgnx/hKO53S6hogNn5ay7aRPs8wbpEcON6kq9l3xSuKf1DtmBG
	 fkrnL/X+hw+gLV2LA+vUzCKiuZ0WmirLY7WCKQ1yDhx3gESZyqEPQpszomncIpoA19
	 MIM9ZzS/KwvBDqmznjnJu7vLjkTFRn+h0KWgsHMrl1K9lJ4mEtGyVsLM750Jtp+HTL
	 XH6kNsl07tuUEmslxBfY1IxYCPSWffrQhpKZAAj21oZHbqQiCwPQmdTPMx300OidYz
	 ap8d2Kh/lfE8g==
Message-ID: <b8cd87e4-1d5d-af79-f92b-fcd4193e0bf2@collabora.com>
Date: Mon, 19 Dec 2022 09:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH resend] arm64: dts: mediatek: mt8192: Mark scp_adsp clock
 as broken
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
References: <20221130031741.3176853-1-wenst@chromium.org>
 <2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com>
 <CAGXv+5E=X_hwg76=B_jqWrpieo8bR-=r8NLbNz2=JzE=kBwMWQ@mail.gmail.com>
 <8806f4cf-2141-acb8-1f9d-cd6ade64756e@collabora.com>
 <05d6f9e6-a291-35c3-9b02-2235ad92669d@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <05d6f9e6-a291-35c3-9b02-2235ad92669d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_005228_683335_390A8583 
X-CRM114-Status: GOOD (  22.28  )
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

Il 16/12/22 14:17, Matthias Brugger ha scritto:
> 
> 
> On 01/12/2022 10:02, AngeloGioacchino Del Regno wrote:
>> Il 01/12/22 09:56, Chen-Yu Tsai ha scritto:
>>> On Wed, Nov 30, 2022 at 7:10 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 30/11/22 04:17, Chen-Yu Tsai ha scritto:
>>>>> The scp_adsp clock controller is under the SCP_ADSP power domain. This
>>>>> power domain is currently not supported nor defined.
>>>>>
>>>>> Mark the clock controller as broken for now, to avoid the system from
>>>>> trying to access it, and causing the CPU or bus to stall.
>>>>>
>>>>> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
>>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>>
>>>> ....or we can add the ADSP power domain to actually fix this properly, which looks
>>>> like being a generally good idea :-)
>>>
>>> Sure, but that and any driver changes have to be backported, or anything
>>> touching the clocks will still break the system.
>>>
>>
>> I agree.
>>
>>> There's no reason we can't have both. I think having this one merged and
>>> backported to stable first, then adding the SCP_ADSP power domain, and tying
>>> it to the clock controller as a follow up addition works best.
>>>
>>> What do you think?
>>>
>>
>> I think that one reason to not have both is that we'd have to revert this commit
>> after the SCP_ADSP power domain is added (with the appropriate Fixes tags and/or
>> Cc stable)...
>>
>> I'd expect that entire addition to be no more than 3 commits, including the dtsi
>> one... and if it comes out as I expect, we'd be solving that issue on all of the
>> affected older versions of the kernel - the right way.
>>
>> Can we wait for... let's say, a day or two to check how that works, before taking
>> a final decision on this commit?
>>
> 
> Do I understand correctly that the correct way for now is to merge this patch until 
> we have a fixed the power domain controller?
> 
> Regards,
> Matthias

I thought that the proper fix would be going in v6.2, but apparently something
went wrong with it as it contains things that aren't upstream.

At this point, let's go with this one until the proper fix gets factored in,
which I expect to be ready for v6.3.

Cheers,
Angelo

