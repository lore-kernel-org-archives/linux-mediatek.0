Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98478CD98EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 06:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzh2hOBvqa+Vq1hRW9h2Ss//Fmhmu+DcCPCwjT3Fqv8=; b=1mujB0KfAavbYm4M1DPeHLdJ4E
	JZu4Hw0WNjVhu92nozUpmsX4v3Q/78k/HZZDu7aNxEmXaOsCKINkFNUNNVKlA4LDMd2FTeZR/hB5V
	Bq+KGQm5yGf2m/IZINIKCRkU1cgFOERHzanjCMRG4ytfVUN52Ef7zA+qAk6K9x3Q4dJjOWTDOuIDV
	WrwniuME+Zj/AANH0yahzroJjOMPUzTg2gMOwplRc0FH+ORQUvJMZhJJIyndZIl/gD17OvEmwtnvV
	Lit8T3Se8QBcHHJSrEodWdjqSREk+/ruwlSYoBZ9KQjQKpvDBq7sBFaZV1o7C+Xyq+81YMyCMW/0G
	pLYEiOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk9s-0000000GkRV-1h97;
	Wed, 17 Jun 2026 06:53:56 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk9o-0000000GkQ7-3i9e
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 06:53:54 +0000
Received: from [192.168.2.217] (p57bd9073.dip0.t-ipconnect.de [87.189.144.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E17394C1A4F350;
	Wed, 17 Jun 2026 08:53:42 +0200 (CEST)
Message-ID: <4501985d-c8df-4121-89fd-0b4eb09273c6@molgen.mpg.de>
Date: Wed, 17 Jun 2026 08:53:41 +0200
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
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <03e0a6787272a445448a3189b4b575aa85396fb0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235353_087181_28533752 
X-CRM114-Status: GOOD (  11.99  )
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


Thank you for your answer, and sending in v2.

Am 17.06.26 um 04:16 schrieb Chris Lu (陸稚泓):

> On Tue, 2026-06-16 at 12:24 +0200, Paul Menzel wrote:

>> Am 16.06.26 um 05:01 schrieb Chris Lu:
>>> Add support for MT7928 (device ID 0x7935) which requires additional
>>> firmware (CBMCU firmware) loading before Bluetooth firmware.
>>
>> Please detail what CBMCU firmware is.
> 
> CBMCU is a new component on MT7928 to handle common part shared across
> the combo chip (Wi-Fi/Bluetooth's subsystem), providing a better user
> experience through improved coordination between subsystems.

Thank you, but please add it to the commit message.

>>> Implement two-phase CBMCU firmware download: Phase 1 loads
>>> section with type 0x5 containing global descriptor,
>>> section maps and signature data; Phase 2 loads remaining
>>> firmware sections. Add retry mechanism for concurrent download
>>> protection.
>>
>> What is type 0x5? How big is the firmware, and how long does it take?
>>
>>> After CBMCU firmware loads successfully, the driver continues
>>> to load corresponding BT firmware based on device ID through
>>> fallthrough to case 0x7922/0x7925.
>>
>> Please add the new log message to the commit message.

Thank you for adding those. Please also mention, where to find the new 
firmware.

[…]


Kind regards,

Paul


PS: Also, Pauli’s question should be answered in the commit message 
(internal/external name). (If questions show up during review, it’s a 
good indicator to amend the commit message answering these questions.)

