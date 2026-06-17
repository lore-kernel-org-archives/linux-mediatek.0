Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA500CD98EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSn31g58sMlTPtpgvoslQBxVvF/xSbjEuXBwWvzKaGY=; b=t6Qn4z4VLSgoSRWPRoJ9Xwb5gF
	1gkSQbyHLSVqy80rbNpaoZgPrpJ/1QImV0qp++is/8306g3VxTit0oyb750rPkdrincoccejKuW4P
	o8r9dvrmEg+V54C5FVzVkuTOL7wY9D7fi5QrXyrEvSuWiFzXUptqDaxfd0KnN/sUhVvdDwyVae001
	A1tprUlBqE6WOShMcLccAS1yYAx7Wegf4UMzF3r3uLNf7EkkqvhKVPAG6nKVBKjQ+brcBWLW2DFoj
	IIizEEF3a5maXBnKa98LUVH+CblUtGDxBpnchKLE0/V5Ckz/34RM7EDf17A74c/fQVIvfc7IrcW9/
	Ivc9C3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZly4-0000000GuaR-0MLu;
	Wed, 17 Jun 2026 08:49:52 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZly1-0000000GuZY-1fqo
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 08:49:50 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7D3744C2C37F03;
	Wed, 17 Jun 2026 10:49:41 +0200 (CEST)
Message-ID: <42de470f-21a7-464e-876f-254a60ac3637@molgen.mpg.de>
Date: Wed, 17 Jun 2026 10:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btmtk: Add MT7928 support
To: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>
Cc: =?UTF-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?UTF-8?B?U3RldmUgTGVlICjmnY7oppboqqAp?= <steve.lee@mediatek.com>,
 luiz.dentz@gmail.com, marcel@holtmann.org, =?UTF-8?B?U1MgV3UgKOW3q+aGsg==?=
 =?UTF-8?B?5qyjKQ==?= <ss.wu@mediatek.com>, linux-kernel@vger.kernel.org,
 johan.hedberg@gmail.com, Sean Wang <Sean.Wang@mediatek.com>,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20260616030132.532184-1-chris.lu@mediatek.com>
 <6b29b553-d703-448d-9275-62912a62e356@molgen.mpg.de>
 <03e0a6787272a445448a3189b4b575aa85396fb0.camel@mediatek.com>
 <4501985d-c8df-4121-89fd-0b4eb09273c6@molgen.mpg.de>
 <c983c544a39606e1468158a7b6fdc77b6ca5c8a2.camel@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <c983c544a39606e1468158a7b6fdc77b6ca5c8a2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_014949_597345_F77097F4 
X-CRM114-Status: GOOD (  14.79  )
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

Dear Chris,


Thank you for your reply.

Am 17.06.26 um 10:34 schrieb Chris Lu (陸稚泓):

> On Wed, 2026-06-17 at 08:53 +0200, Paul Menzel wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.

>> Am 17.06.26 um 04:16 schrieb Chris Lu (陸稚泓):
>>
>>> On Tue, 2026-06-16 at 12:24 +0200, Paul Menzel wrote:
>>
>>>> Am 16.06.26 um 05:01 schrieb Chris Lu:
>>>>> Add support for MT7928 (device ID 0x7935) which requires
>>>>> additional
>>>>> firmware (CBMCU firmware) loading before Bluetooth firmware.
>>>>
>>>> Please detail what CBMCU firmware is.
>>>
>>> CBMCU is a new component on MT7928 to handle common part shared across
>>> the combo chip (Wi-Fi/Bluetooth's subsystem), providing a better user
>>> experience through improved coordination between subsystems.
>>
>> Thank you, but please add it to the commit message.
>>
>>>>> Implement two-phase CBMCU firmware download: Phase 1 loads
>>>>> section with type 0x5 containing global descriptor,
>>>>> section maps and signature data; Phase 2 loads remaining
>>>>> firmware sections. Add retry mechanism for concurrent download
>>>>> protection.
>>>>
>>>> What is type 0x5? How big is the firmware, and how long does it
>>>> take?
>>>>
>>>>> After CBMCU firmware loads successfully, the driver continues
>>>>> to load corresponding BT firmware based on device ID through
>>>>> fallthrough to case 0x7922/0x7925.
>>>>
>>>> Please add the new log message to the commit message.
>>
>> Thank you for adding those. Please also mention, where to find the
>> new firmware.
>>
>> […]
> 
> Since MT7928 hasn't been deployed in any commercially available
> products yet, MediaTek currently plans to send driver patch first and
> upload firmware part after done a series of internal test to make sure
> the quality.

Understood. Also something for the commit message. ;-)

I wonder, if this should only be put into Linus’ master branch, once the 
firmware is available.


Kind regards,

Paul


>> PS: Also, Pauli’s question should be answered in the commit message
>> (internal/external name). (If questions show up during review, it’s a
>> good indicator to amend the commit message answering these
>> questions.)

