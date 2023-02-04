Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595FAC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Feb 2023 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Is2bS/JDlsK/QwiHcaEE4s56YD3nWP7IFxCKBI5QJk=; b=nrvic5xCqjuOtzvTaD+v70llPe
	Bj8K8TMGxsxL77ooKMVebYpq8G1JgIwVueBG/j2SjM7uZK9iKKZiFv/S+hcv3unc3FhOTquVLqyLh
	qsgBzBRIA+pWdsR3482vdlmZlNZo9N7GjUjAI++uzMs6o5H0pVoqxAEvAQdxF3sOnIy+qUwuiRsCp
	fDAafG+iwDCf+R+bXJk7syZ9jkHVdrqKJfdBi0gPhwmOxFBwBXosXLlQaXRPH5tFBk1TBro0udcY4
	ntzPrwXGmSc32SyAuNglHzloIZ/ihKCU8Qjgkit7Ys6M7fLJDh+JvRFj9LCKUoynmXARo/bmxL59u
	z6tLnLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOKp0-005LA7-M8; Sat, 04 Feb 2023 15:51:22 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOKop-005L8e-KT; Sat, 04 Feb 2023 15:51:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675525862; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mQsJipZtdQgXEqOmZ8v8pAgLCNXaekgbEJPfnORBSlu55YEfOjtCipcRU/CeU77LeRVeiFXCXbBb8ZiTHYhmsET+/3UBjl+HbvIG6vgXcY7eGXrDP47H9H4JRrDY5zW05u7XG31kR3o2F7Etfwfg/JNQOyyo6x+Isnh+OSE/S8M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675525862; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9Is2bS/JDlsK/QwiHcaEE4s56YD3nWP7IFxCKBI5QJk=; 
	b=mxxZEcvwOKoPbh2AegG2yFp2Ge53+hpycZDAeH2Ab8nNIACmvlwIPwhw5o9NH08CRop9ONiSoiJDlsnWxRXWErX8Hg+35v+YRGUh/8sxsA6a0hxjuea4RJrdqS7Pyt1K1g/WqkJYJ5b52DEPJ38piijOKerjXIbr6a9hpxuVsaE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675525862;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9Is2bS/JDlsK/QwiHcaEE4s56YD3nWP7IFxCKBI5QJk=;
	b=Wi0hFGAPunx9ZfQXgQsq7MSpgE7ResmnViNk9tEvbBHkbnG+AHyQ0S0U+151XAfy
	kTI8ltaX2YG/KSG/E4Uxz3gccbkVUMEKJ0Qhop86C3dp5aNYXAd0mP9I8Mq0UAKt2LI
	KfTawugtOlU/78fv8pxkIb97+hf7+/R9Qr+fod3A=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675525860054747.0245916605178; Sat, 4 Feb 2023 07:51:00 -0800 (PST)
Message-ID: <822f0d6e-ef25-2cb7-acd9-9e74a680c09a@arinc9.com>
Date: Sat, 4 Feb 2023 18:50:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Aw: Re: Re: [PATCH v2 4/5] arm: dts: mt7623: mux phy0 on Bananapi
 BPI-R2
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: arinc9.unal@gmail.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, erkin.bozoglu@xeront.com,
 Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
 <20230201185656.17164-5-arinc.unal@arinc9.com>
 <AC473057-266B-4403-9270-8007E0EC257C@public-files.de>
 <75d3758a-5502-03a4-b3a2-990f9339705b@arinc9.com>
 <trinity-ec3920c5-a96a-4edf-9ff1-4bf07e7b4d07-1675506452617@3c-app-gmx-bs72>
 <trinity-a01f321e-0973-417e-9a25-9350f63ece37-1675511027203@3c-app-gmx-bs72>
 <f628db9c-cf61-e1bc-2160-0c8d1caa0fbe@arinc9.com>
 <trinity-3c3b11eb-2503-4637-b8f6-05686bd1ad88-1675516042495@3c-app-gmx-bs72>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <trinity-3c3b11eb-2503-4637-b8f6-05686bd1ad88-1675516042495@3c-app-gmx-bs72>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_075111_774476_9F6DAA51 
X-CRM114-Status: GOOD (  19.19  )
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

On 4.02.2023 16:07, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Samstag, 04. Februar 2023 um 13:12 Uhr
>> Von: "Arınç ÜNAL" <arinc.unal@arinc9.com>
>> An: "Frank Wunderlich" <frank-w@public-files.de>
>> Cc: arinc9.unal@gmail.com, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, erkin.bozoglu@xeront.com, "Sean Wang" <sean.wang@mediatek.com>, "DENG Qingfang" <dqfext@gmail.com>
>> Betreff: Re: Aw: Re: [PATCH v2 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
>>
>> On 4.02.2023 14:43, Frank Wunderlich wrote:
>>>> Gesendet: Samstag, 04. Februar 2023 um 11:27 Uhr
>>>> Von: "Frank Wunderlich" <frank-w@public-files.de>
>>>> An: "Arınç ÜNAL" <arinc.unal@arinc9.com>
>>>> Cc: arinc9.unal@gmail.com, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, erkin.bozoglu@xeront.com, "Sean Wang" <sean.wang@mediatek.com>, "DENG Qingfang" <dqfext@gmail.com>
>>>> Betreff: Aw: Re: [PATCH v2 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
>>>>
>>>> Hi aranc,
>>>>
>>>> have tested this series, basicly it works, but i get only ~620 Mbits/sec (much more i will need on wan) in tx-mode of r2, rx-mode (iperf3 -c IP -R on r2) gets full 939 Mbits/sec. Both no retransmitts.
>>>>
>>>> tried with my laptop which gets 940Mbit/sec in tx mode too...other end is a R2 with 5.15 connected to lan0 (and eth1+aux enabled, dmesg clean so far...for the "kernel log flooded"-comment).
>>>>
>>>> maybe gmac1 needs to be tweaked a bit (clock-settings)?
>>>>
>>>> can you confirm this with your board?
>>>
>>> tested the vlan_aware way with 5.15.80 and got better result
>>>
>>> ip link add br0 type bridge vlan_filtering 1
>>> ip l set aux master br0
>>> ip l set wan master br0
>>> bridge vlan add vid 99 dev wan
>>> bridge vlan add vid 99 dev aux
>>> bridge vlan
>>> ip l s eth1 up
>>> ip l s wan up
>>> ip a a 192.168.0.11/24 dev eth1
>>> ip l s br0 up
>>> ip l s aux up
>>>
>>> i see traffic on eth1 increasing and iperf3 shows in both directions ~940Mbit/s, no strange mesages in dmesg while testing...where do you see these?
>>
>> You didn't put eth1 on a bridge. I suggest you read my mails with higher
>> attention so both of our time is spent efficiently.
> 
> sorry if i misseed this detail, but it was not part of the instructions i got from mtk and did not found it in our mail-conversion. why do i need to add the gmac into the bridge??

I was going to say, to put the host(s) connected to the wan port on the 
same network as other ports, but using the wan interface for that 
instead would work. Cool, we can cross this off the list.

> 
> the gmac is connected physically to mt7531 p5, and my vlan_aware bridge bridges this port (aux=p5) with wan,
> so i see no need to add eth1 to this bridge too...traffic on wan is tagged with vlan 99 and leaving untagged
> on aux which is arriving eth1...
> 
>>> tested vlan-way with 6.2 and felix' Patches to more comparable with your test...and got same result (~625Mbit/s in tx and 940Mbit/s in rx-mode=-R on r2)...so it seems anything between 5.15 and 6.2 reduced gmac1 tx bandwidth.
>>
>> I don't see an incentive to investigate unless the issue is confirmed on
>> a daily netdev/net-next.git main tree.
> 
> have same result on net-next/main with your series, no additional patches on top except adding my build-script and defconfig.

Finding the cause of reduced network performance is quite a challenging 
task. The only person I know that gives this a serious approach is Rafał 
Miłecki. There are scripts and things they share on the openwrt-devel 
mailing list along with details of their investigation, usually for 
Broadcom SoCs.

I'm no good in this so I'm not going to do anything about it. There are 
issues with the MediaTek ethernet and MT7530 DSA subdriver that 
completely break communication which I want to have them addressed.

Arınç

