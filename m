Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8C1C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BV2L6/8bPOL7cOUoC1lbeRAI9Vo72rK02ENTNfh2Nps=; b=n9qsagpfzBXrHI
	HjH8FVfatmTAUIfN053XDCjsAOlTleUm8pHTQ7X52oqBDC/Tfgd1/FB10Alji/KEd6N63Dq2ePULw
	bXLQ0hq1OmE0N1eEDmcs+YOSKDmV848Mbj/Q8Od2Ezhf1urY+ItCZInJ+ZfoSQPlGg6vgvbj3gv49
	1B098UTqi6wlE+z7aWRvEfkGLDUBMhLb6mnF9FGoBJTsuZ67o6ywP0MQx3SHc/aZGyeCCI2o1WWJW
	rB/hqvLvOgAog2WM/r/2WEW/mV7c/nbwSHvNjR/hJr5+97uMxXJUURgcqivM2rzQ770BHjSQvze8B
	MQ6vGDoMKl5gXkAJc87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGzqH-00000008gDX-16J1;
	Tue, 11 Jun 2024 11:39:09 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGzqB-00000008gAs-3Pbf;
	Tue, 11 Jun 2024 11:39:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E1451BF204;
	Tue, 11 Jun 2024 11:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718105938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BV2L6/8bPOL7cOUoC1lbeRAI9Vo72rK02ENTNfh2Nps=;
	b=LVuCUskTc/h0Xz58HncRdqc4hXrgEo0ZCzMewq1unRwEoUAYEKDRyQSbu7BLzm7P2GOvsR
	omItKbet19uhCDXXv47KrbxNffGpvVq+ykHd359A5ZqA/Tt0K6mCOyVuA+asbRVzczytb8
	KhEJj4sGwftHFuuH/d1TbnyvxXDEwUrucAva0CRyiJdy4UAYdXft8hzqNvMvcvUOGycEX4
	tC3yeJRDnwjt3lJrWMlBs/KMRJXJvy2OA+lL2ONLjM3R3F3QCCgHh/XAW49NBGlABl7B47
	f3neQZguGFuRBAv1JiZW6WeOKDAZBeMJrqy6Od8R3tfBBBLNhYAIonv28+SqMw==
Message-ID: <1807a142-1534-4fa4-ad4b-d1c03af014c2@arinc9.com>
Date: Tue, 11 Jun 2024 14:38:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
 <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
 <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
 <714da201-654b-4183-8e5e-8ff0b64fe621@leemhuis.info>
 <2cac4cf68304e81abffbd9ff0387ee100323c2b7.camel@redhat.com>
 <b49c801c-6628-40a6-8294-0876d8871ba7@leemhuis.info>
 <e92c3ca0-c9be-44ac-a4fc-57ca5ebedbc5@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <e92c3ca0-c9be-44ac-a4fc-57ca5ebedbc5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_043904_041293_96A6D5B9 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: devicetree@vger.kernel.org, Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/06/2024 14:30, Thorsten Leemhuis wrote:
> On 07.06.24 16:15, Thorsten Leemhuis wrote:
>> On 07.06.24 16:03, Paolo Abeni wrote:
>>> On Thu, 2024-06-06 at 10:26 +0200, Thorsten Leemhuis wrote:
>>>> On 31.05.24 08:10, Arınç ÜNAL wrote:
>>>>> On 31/05/2024 08.40, Thorsten Leemhuis wrote:
>>>>>> [adding Paolo, who committed the culprit]
>>>>
>>>> /me slowly wonders if the culprit should be reverted for now (see below)
>>>> and should be reapplied later together with the matching changes from
>>>> Arınç ÜNAL.
>>>
>>> FWIS I think a revert should be avoided, given that a fix is available
>>> and nicely small.
>>
>> Yeah, on one hand I agree; but on the other it seems that the
>> maintainers that would have to take care of the dt changes to fix this
>> until now remained silent in this thread, apart from Rob who sent the
>> mail regarding the warnings.
>>
>> I put those maintainers in the To: field of this mail, maybe that might
>> lead to some reaction.
> 
> Still no reply from the DRS folks or any other progress I noticed. Guess
> that means I will soon have no other choice than to get Linus involved,
> as this looks stuck. :-( #sigh

Does it have to be Linus that needs to apply "[PATCH 0/2] Set PHY address
of MT7531 switch to 0x1f on MediaTek arm64 boards"? Aren't there any other
ARM maintainers that can apply the fix to their tree?

Arınç

