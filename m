Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1BEC54E67
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Mar 2024 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4mZE+VF+M8ZONfFOGqJtV3AqyNUe/KWOMqioYt91+Y=; b=fxcsDSEuCnd44iCRY14G0jr/0w
	1vkGvLcl0FsgYz1IqhuePJFEspXEWwADHIoYEeuRVRXo6lKeqYQE/4xXWkIz232tpp/RP8Bhijf1b
	5ZkRamcIg4a8upUh8IcP6Z8w86F1W4Ss8mhyr0Wm8dUhJ7MPRIMfT1o5hKzJylk6YUSd2fKdIIX2x
	MxsF1f83r/1dDqpy0Ll08xC5RIvRtM2bWnw/BPAPGD90urJpOXO6IDAvOMYUNtvmJcBMxr2TZKdhR
	6GvBPwhIsw9gkiC1UYEUyrOmgGCtFSTSeO/h7QsMaPT8pOv/tfhOfnUHIO//xY4dF81wlQEMn/vX1
	LC1eRTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhvV-0000000DpGi-2FLM;
	Thu, 14 Mar 2024 10:03:05 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhvR-0000000DpEV-3THK;
	Thu, 14 Mar 2024 10:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710410580;
	bh=7Te3YspK5rB2494WTdPhhCk43LasN8upRyD7Xd2ldfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2vW0+MY3gziKQl7e8yqupDfds0LLNG44VwBCObMCrLlpAmnOJylOQRzfmda8N0ZUA
	 nUDMWQsFnxXJ1WQ/BAK4C7TipPu2JeOXsWYCACkP2fLugMvGnEvwygTrIy4xqTux1I
	 LtWpR7PJ5OkeWlvrFTCiOttl81g79vJBS/siV4apVmZ6DproUihLLeT+TZhGEvsXl4
	 2n8HjfX21h0cYXlip4Eoq/hk/G8Fsc+2Ujr99aPB6deXZEZKnz9IoYadkB1aJwkCI3
	 9G6uRt5Nt5YxmrNLcBB3+FhMDHZlO/XW079tGVELuogfahNZDKtxfSTDn8S2AWQg39
	 6NYHUJKUNzQMw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9245937820A3;
	Thu, 14 Mar 2024 10:02:59 +0000 (UTC)
Message-ID: <63cdec54-8dd6-4f17-8256-bbb8cfe791be@collabora.com>
Date: Thu, 14 Mar 2024 11:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Update min voltage
 constraint for Vgpu
Content-Language: en-US
To: Pin-yen Lin <treapking@google.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
 <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org
References: <20240313135157.98989-1-treapking@chromium.org>
 <d1bdf9a6-3082-4076-99de-e49d59843244@collabora.com>
 <CAHwYsiqJBsQn73H+2VeB4N3GNH=0EZ4qznqWwYCBjt6+qwNhHw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAHwYsiqJBsQn73H+2VeB4N3GNH=0EZ4qznqWwYCBjt6+qwNhHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_030302_197931_054C9AA7 
X-CRM114-Status: GOOD (  20.48  )
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

Il 14/03/24 10:59, Pin-yen Lin ha scritto:
> Hi Angelo,
> 
> On Wed, Mar 13, 2024 at 10:36 PM AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com> wrote:
> 
>> Il 13/03/24 14:51, Pin-yen Lin ha scritto:
>>> Although the minimum voltage listed on the GPU OPP table is 606250 uV,
>>> the actual requested voltage could be even lower when the MTK Smart
>>> Voltage Scaling (SVS) driver is enabled.
>>>
>>> Set the minimum voltage to 300000 uV because it's supported by the
>>> regulator.
>>>
>>> Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI
>> regulators")
>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>>
>> Okay, that makes sense, I agree.
>>
>> ...but.
>>
>> The datasheet never mentions 0.3V as vmin - infact, it does mention that
>> the
>> vsel is selected as (0V +) 6250 * Vsel, but the brief spec says that for
>> the
>> standard configuration (in terms of HW), the Vmin is 0.4V and not 0.3.
>>
>> Reading through makes me think that it's not much about the buck providing
>> an
>> unstable output, but more about it starting to become inefficient under
>> that
>> value.
>>
>> This means that it is sensible to set, instead:
>>
>>          regulator-min-microvolt = <400000>;
>>
>> Also, this is repeated on multiple platforms: can you please perform the
>> same
>> change also on MT8183, MT8186 and MT8195?
>>
>> P.S.: For MT6358, the Vmin for VGPU is 0.5V :-)
>>
> 
> Thanks for checking! I'll update the values on other platforms as well.
> 
> I assume that we also want to update other mt6315 nodes listing 300000 uV
> as the min voltage, so I'll update them as well.
> 

Yes, didn't notice that, nice catch. Please do!

Cheers,
Angelo

>>
>>> ---
>>>
>>>    arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>> b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> index 43d80334610a..5cc5100a7c40 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> @@ -1448,7 +1448,7 @@ regulators {
>>>                        mt6315_7_vbuck1: vbuck1 {
>>>                                regulator-compatible = "vbuck1";
>>>                                regulator-name = "Vgpu";
>>> -                             regulator-min-microvolt = <606250>;
>>> +                             regulator-min-microvolt = <300000>;
>>>                                regulator-max-microvolt = <800000>;
>>>                                regulator-enable-ramp-delay = <256>;
>>>                                regulator-allowed-modes = <0 1 2>;
>>
>>
>>
> 


