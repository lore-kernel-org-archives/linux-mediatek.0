Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DB5C3065A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0njT9GeW+qtVIoQRbIG2iSr4/dZ0hcpto7iZSwPc20I=; b=m72SfYDL90O1sj
	0EBHrcO6ESf1JbEKv75KPu/8qTmvaUWuj9rmISYA6Ech833B2W7QTQ5pKc2n5Sy0GkqBlVdpT97gv
	uHmmD9MwJHq8fKUK/l5XiADF2wA+V3jZI50P/Qh6F5XSUhody3np6IYru5o0gtmDiOmg7NG3qoX2f
	JNCxlf8/j586DY6kF4k2MG7e4OQ7/962DpRLrYGZ845I7pRMy11KGuyOkQrnI5CTh2hNxyPD6EMwy
	L+l/XDZUGNYO25hlZeQ2bNgmHQIG1thUWNiJL+gzWu+xcqer7AXBcgMC1BWdp8OQlK5XbXY0GKfgr
	pH2C71tc7BoU1lHvtUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBj0-000000026fQ-2RcH;
	Mon, 01 Jul 2024 07:45:22 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBin-000000026WA-0Ca3;
	Mon, 01 Jul 2024 07:45:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B38BD20003;
	Mon,  1 Jul 2024 07:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719819905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0njT9GeW+qtVIoQRbIG2iSr4/dZ0hcpto7iZSwPc20I=;
	b=oy8uYNN03/5jhWS0cYVP9KpgYFosPXAFBHe3bL18XfjHPY/hf/DRKSYstZRPyjZ2H4cV42
	PIa6PpENwk95OxqOTdxlou4BfBRPAgW1kOVs17TzzkLzOeL53F1RBjdH987AmwdLm55xHA
	mPv0+BrP4HWstn5w44CBEHcVFQzYRQJP3QUvi/EbUJgT8ZYplqq59rerElzhsMH/YICscr
	ocVAw8sM0Bum59vRiz3XIFpfZdHPjvyd56o8H94ON/GBz7IFS5BhspoR2Idsm7oraArUoz
	h4WkFIPlWRqcQnKeMyzmw8+tUJlTIARgJe5kP0A8CqYKPvRwAyvJONHyN6JZIw==
Message-ID: <1aedb1d4-8dc3-4e17-aff1-7cc417465967@arinc9.com>
Date: Mon, 1 Jul 2024 10:44:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <20240516204847.171029-1-linux@fw-web.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
 <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
 <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
 <714da201-654b-4183-8e5e-8ff0b64fe621@leemhuis.info>
 <2cac4cf68304e81abffbd9ff0387ee100323c2b7.camel@redhat.com>
 <b49c801c-6628-40a6-8294-0876d8871ba7@leemhuis.info>
 <e92c3ca0-c9be-44ac-a4fc-57ca5ebedbc5@leemhuis.info>
 <1807a142-1534-4fa4-ad4b-d1c03af014c2@arinc9.com>
 <58d8ddea-71cc-427a-94cc-a95f6bce61d2@collabora.com>
 <16e9c06e-9908-455d-a387-614fefe5bcf8@arinc9.com>
 <5e87d31c-b059-4f9a-93f7-dc87465ed14a@collabora.com>
 <4416ef22-78cc-4ce5-b61d-69ff0903811e@arinc9.com>
 <bd6b6929-d34d-4bd5-9cb0-bc8fe850ee46@leemhuis.info>
 <af561268-9793-4b5d-aa0f-d09698fd6fb0@arinc9.com>
 <750a60a6-4585-4bd2-97be-cf944e51fbdb@leemhuis.info>
 <9c498e37-df8b-469e-818a-9b1c9f2b1a3c@collabora.com>
 <cebb10b8-b0bf-4cb7-bba4-c3f941ba2b82@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <cebb10b8-b0bf-4cb7-bba4-c3f941ba2b82@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_004509_413943_220000C0 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/07/2024 09:16, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing the other net maintainers]
> 
> On 25.06.24 10:51, AngeloGioacchino Del Regno wrote:
>> Il 25/06/24 07:56, Linux regression tracking (Thorsten Leemhuis) ha
>> scritto:
>>> On 17.06.24 13:08, Arınç ÜNAL wrote:
>>>> On 17/06/2024 11:33, Linux regression tracking (Thorsten Leemhuis)
>>>> wrote:
>>>> [...]
>>> It looks more and more like we are stuck here (or was there progress and
>>> I just missed it?) while the 6.10 final is slowly getting closer. Hence:
>>>
>>> AngeloGioacchino, should we ask the net maintainers to revert
>>> 868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY address of switch from
>>> device tree") for now to resolve this regression? Reminder, there is
>>> nothing wrong with that commit per se afaik, it just exposes a problem
>>> that needs to be fixed first before it can be reapplied.
>>
>> To be clear on this: I asked for the commit to be fixed such that it
>> guarantees
>> backwards compatibility with older device trees.
>>
>> If no fix comes,
> 
> I haven't see any since that mail, did you? If not, I think...
> 
>> then I guess that we should ask them to revert this commit
>> until a fix is available.
> 
> ...it's time to ask them for the revert to resolve this for -rc7 (and
> avoid a last minute revert), or what do you think?

This is quite frustrating. I absolutely won't consent to a revert. I've
spent a great amount of time and effort explaining why this is neither
necessary nor a good approach in this email thread. I'm not going to accept
a revert due to the other side's failure to communicate, which will create
unnecessary work for me to do. It is ridiculous to demand a change in a
Linux driver before accepting a device tree patch.

Arınç

