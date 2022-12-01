Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A9CC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 09:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuGGx3tOaWDy+PN3z65VUP7gp75CclXZ464n7pu8XWo=; b=y3D/+rOYM8OYNfQmzFoWMXN8DW
	6I5AaPNp8kjzBO7YJ/NC4hMB1Rer6ni8enVRgQ01sy68HhozlxDeeMTfOtJomYO4638NoW1/8Km4Y
	IkQiLNfX0VKUNNccJ8V6dSWbH+Ng3ppCdLmkMhQ5rXh3Dk7Q6jfndBapdoQT86OMmOM7cDF9THEaS
	2kJUqpvuQtdum+zhStLe/au7npdkBdDb3AArPC7BlDuNTTF2kRIieJxoeqX4J0tu4lbNka7pwzVSU
	o5bpH8cBKPWd1ZO5f6VYolzZ9F39hbFnEHlDJTP9PL0LJ5YYCIkfakVvJaDzFM4Jg8WjbXbYf5BGw
	+3Hq376w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fSz-0068MD-F6; Thu, 01 Dec 2022 09:02:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fSi-0068Af-Bq; Thu, 01 Dec 2022 09:02:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A32E66602B85;
	Thu,  1 Dec 2022 09:02:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669885348;
	bh=mvonW1qN8XFIYuXJMysma7tvGyJZY/ErMeX5eIO4Yjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KoOZkEuQXXCVAp2U/25BNWa/s6K0Sv+P7ue/c1Aw1iGf5gmW6GPqzDqfZqHP0ZJg7
	 7Dml60hXarzwl7gxf9pV2CJ4gcRxFwYvjSN9j5Lf1jzH1uE2O+otoSoOLE85Oc/eVv
	 bfSFCannshPRGdDb4XTxDwP4lJwwuOZ83w7hQ2SQ1d+JVUDRZupcKcfbSvENLnA8Ec
	 9VsCmeX7vI6//1QWynmLyjucICKBz9S5Yt1hPs7wg2O38+Z4mgVLsomih4OBZ631zW
	 4vZPIclid4PxJz/5NHhAcFIEvaoVSv5alElCJbEEBGbKHeHVm9cAKqa0dzyvFccd3J
	 zy0b01URv6X9Q==
Message-ID: <8806f4cf-2141-acb8-1f9d-cd6ade64756e@collabora.com>
Date: Thu, 1 Dec 2022 10:02:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH resend] arm64: dts: mediatek: mt8192: Mark scp_adsp clock
 as broken
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
References: <20221130031741.3176853-1-wenst@chromium.org>
 <2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com>
 <CAGXv+5E=X_hwg76=B_jqWrpieo8bR-=r8NLbNz2=JzE=kBwMWQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5E=X_hwg76=B_jqWrpieo8bR-=r8NLbNz2=JzE=kBwMWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_010232_592747_6AF09F9E 
X-CRM114-Status: GOOD (  24.47  )
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

Il 01/12/22 09:56, Chen-Yu Tsai ha scritto:
> On Wed, Nov 30, 2022 at 7:10 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 30/11/22 04:17, Chen-Yu Tsai ha scritto:
>>> The scp_adsp clock controller is under the SCP_ADSP power domain. This
>>> power domain is currently not supported nor defined.
>>>
>>> Mark the clock controller as broken for now, to avoid the system from
>>> trying to access it, and causing the CPU or bus to stall.
>>>
>>> Fixes: 5d2b897bc6f5 ("arm64: dts: mediatek: Add mt8192 clock controllers")
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> ....or we can add the ADSP power domain to actually fix this properly, which looks
>> like being a generally good idea :-)
> 
> Sure, but that and any driver changes have to be backported, or anything
> touching the clocks will still break the system.
> 

I agree.

> There's no reason we can't have both. I think having this one merged and
> backported to stable first, then adding the SCP_ADSP power domain, and tying
> it to the clock controller as a follow up addition works best.
> 
> What do you think?
> 

I think that one reason to not have both is that we'd have to revert this commit
after the SCP_ADSP power domain is added (with the appropriate Fixes tags and/or
Cc stable)...

I'd expect that entire addition to be no more than 3 commits, including the dtsi
one... and if it comes out as I expect, we'd be solving that issue on all of the
affected older versions of the kernel - the right way.

Can we wait for... let's say, a day or two to check how that works, before taking
a final decision on this commit?

Cheers,
Angelo

> ChenYu
> 
>> Allen, can you please take care of that?
>>
>> Thank you,
>> Angelo
>>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> index 6b20376191a7..ef91941848ae 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
>>> @@ -575,6 +575,8 @@ scp_adsp: clock-controller@10720000 {
>>>                        compatible = "mediatek,mt8192-scp_adsp";
>>>                        reg = <0 0x10720000 0 0x1000>;
>>>                        #clock-cells = <1>;
>>> +                     /* power domain dependency not upstreamed */
>>> +                     status = "broken";
>>>                };
>>>
>>>                uart0: serial@11002000 {
>>>
>>


