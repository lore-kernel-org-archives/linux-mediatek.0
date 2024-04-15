Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6C6C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StS4x0S3//04l7wNyiAlQ2KElGTWLVjD4MZApYb4baA=; b=1SZXF3wH2AiZCo
	EmmxfBfhpSUW3Kep7sv1pZjcekgxpdObkKfGptGp+RonXHoH9Ls4sTqD93/TAMbgFtywPKm+u5FmO
	BmVrJWiOabfs+z+HLrhN57EpXu6u/uDhXLk03ruxjqDFNKsKAfplHIu8zdSK4dSDnQmIkHgi32YEp
	6nHA39wxQSlpKAs+c+K8dnq5lUp87OCrBVhjkpCCpfWS6Z6S/Qp1sB4kGDFwAwnk4q9cT+3mUY6lP
	6rD7BqkbLYZPOSqKl48zvLB76K2BGah1LVzCvPnpdRDbZLGOSRHh8AFMkbwkhr99UZ5SJFqBH1PZ7
	PrbDS3FtTt9FI6hjSMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLUL-00000008CdO-2ONG;
	Mon, 15 Apr 2024 12:31:09 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLUG-00000008Cag-1DjD
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Apr 2024 12:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=StS4x0S3//04l7wNyiAlQ2KElGTWLVjD4MZApYb4baA=;
	t=1713184264; x=1713616264; b=uQz4oN1YxH9K4PQ8f7VmDuFqxotKfgrgHOZ+3ACX0H56AAU
	NyVQ3nj9mbmioeG1JPy6ug4ZdjQYbGvicvMA9qMtxMZAF2wbqa18IOQ+XWIIOjwke0tYmKyokTGDw
	9+9/KM5qYZMHiwi0S2jKBXxX7Ch7ajWYZEKF00Bc4/HtQNsgXOIAYEh8xqlBlHSxhT735+EI6+Yyr
	bYyQ0JYaz8fV35NAWiFgNAmZ3nEW/8bPIuaxv5G13Iq2yTJNjAapkM3fZ8SOURrdJbHa/7YG6o0vW
	b1e3X7auEW3hvlEzGBKLs2k6kzzk9sMXodLpvxO4zz0BoGbZOlfqpv3ev5a4eFvA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rwLU4-0001A5-KM; Mon, 15 Apr 2024 14:30:52 +0200
Message-ID: <5c0ce057-992b-4200-bb74-b84826974860@leemhuis.info>
Date: Mon, 15 Apr 2024 14:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] Bluetooth: btusb: Add support Mediatek MT7920
To: =?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 =?UTF-8?B?UGV0ZXIgVHNhbyAo5pu554+G5b2wKQ==?= <Peter.Tsao@mediatek.com>,
 "mike@fireburn.co.uk" <mike@fireburn.co.uk>
Cc: "marcel@holtmann.org" <marcel@holtmann.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
 =?UTF-8?B?U3RldmUgTGVlICjmnY7oppboqqAp?= <steve.lee@mediatek.com>,
 Sean Wang <Sean.Wang@mediatek.com>, =?UTF-8?B?QWFyb24gSG91ICjkvq/kv4rku7Ap?=
 <Aaron.Hou@mediatek.com>, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>
References: <20240304144844.2042-1-peter.tsao@mediatek.com>
 <20240401144424.1714-1-mike@fireburn.co.uk>
 <CAHbf0-FqUqoDty81OH9_Et7MTWFikYYhEvP7SBVGyeXO-R94_A@mail.gmail.com>
 <2d822b6c-8b55-443d-ad9e-03e97ce7b99b@leemhuis.info>
 <11f098c7cc3a063fd20c02f1a66372e3444cb272.camel@mediatek.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <11f098c7cc3a063fd20c02f1a66372e3444cb272.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713184264;adc2b050;
X-HE-SMSGID: 1rwLU4-0001A5-KM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_053104_506247_18D16F7D 
X-CRM114-Status: GOOD (  16.47  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05.04.24 11:15, Deren Wu (武德仁) wrote:
> 
> Thanks for the note. We are looking for solution for this issue. Peter
> would post the new patch. :)

Anyone still working on this, as that afaics did not happen -- or was
there progress and I just missed it?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

> On Fri, 2024-04-05 at 10:34 +0200, Linux regression tracking (Thorsten
> Leemhuis) wrote:
>> [CCing the regression list, as it should be in the loop for
>> regressions:
>>
> https://urldefense.com/v3/__https://docs.kernel.org/admin-guide/reporting-regressions.html__;!!CTRNKA9wMg0ARbw!n9OQDQtfMiQdddzNLvMEOMLnnEHhw12KRY5W5YPscQJTiNQtuIVuJufNc2UYpy-rUlRtMUwZsL5NDERIf1CoGox8J2I$
>>  ]
>>
>> On 01.04.24 17:20, Mike Lothian wrote:
>>> On Mon, 1 Apr 2024 at 15:44, Mike Lothian <mike@fireburn.co.uk>
>>> wrote:
>>>>
>>>> I think this patch is causing issues with older firmware
>>>>
>>>> Bus 003 Device 002: ID 13d3:3563 IMC Networks Wireless_Device
>>>>
>>>> [    0.315064] Bluetooth: Core ver 2.22
>>>> [    0.315064] NET: Registered PF_BLUETOOTH protocol family
>>>> [    0.315064] Bluetooth: HCI device and connection manager
>>>> initialized
>>>> [    0.315064] Bluetooth: HCI socket layer initialized
>>>> [    0.315064] Bluetooth: L2CAP socket layer initialized
>>>> [    0.315064] Bluetooth: SCO socket layer initialized
>>>> [    4.670811] Bluetooth: RFCOMM TTY layer initialized
>>>> [    4.671029] Bluetooth: RFCOMM socket layer initialized
>>>> [    4.671790] Bluetooth: RFCOMM ver 1.11
>>>> [    4.673416] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
>>>> [    4.673659] Bluetooth: BNEP filters: protocol multicast
>>>> [    4.673895] Bluetooth: BNEP socket layer initialized
>>>> [    4.674125] Bluetooth: HIDP (Human Interface Emulation) ver
>>>> 1.2
>>>> [    4.674360] Bluetooth: HIDP socket layer initialized
>>>> [    5.016365] bluetooth hci0: Direct firmware load for
>>>> mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin failed with error -2
>>>> [    5.017163] Bluetooth: hci0: Failed to load firmware file (-2)
>>>> [    5.017557] Bluetooth: hci0: Failed to set up firmware (-2)
>>>> [    5.018129] Bluetooth: hci0: HCI Enhanced Setup Synchronous
>>>> Connection command is advertised, but not supported.
>>>>
>>>> The correct name should be
>>>> mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
>>>>
>>>> Reverting this patch fixes things
>>>
>>> If it helps, the device ID is 0x7961 and the fw_flavour is 24 or
>>> 0x18 in hex
>>
>> Thanks for the report!
>>
>> Peter, did you look into this?
>>
>> Anyway: To be sure the issue doesn't fall through the cracks
>> unnoticed,
>> I'm adding it to regzbot, the Linux kernel regression tracking bot:
>>
>> #regzbot report:
>>
> https://lore.kernel.org/all/20240401144424.1714-1-mike@fireburn.co.uk/
>> #regzbot introduced: 1cb63d80fff6c4
>> #regzbot title: net: Bluetooth: firmware loading problems with older
>> firmware
>> #regzbot ignore-activity
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'
>> hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>>
> https://urldefense.com/v3/__https://linux-regtracking.leemhuis.info/about/*tldr__;Iw!!CTRNKA9wMg0ARbw!n9OQDQtfMiQdddzNLvMEOMLnnEHhw12KRY5W5YPscQJTiNQtuIVuJufNc2UYpy-rUlRtMUwZsL5NDERIf1CoQcaol0s$
>>  
>> That page also explains what to do if mails like this annoy you.

