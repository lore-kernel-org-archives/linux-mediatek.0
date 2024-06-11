Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C038C27C75
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 18:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rg+NohawaTXFK1Fhif7XHyzzS0tstlbs6exoV45k748=; b=j/SIbJEdiWPBPz
	biQwwRKOf9D4cIae/2njchCzFZsMPXdzoMpQ6Cq92d+WpX9FfDminEmjQWKYbx3uX5krEiWrtLQrP
	aMgT2mmlspVs1CWIndVBUj0HvJP5XLeM0QqYjbi9yPxKJ5/X+LczuJNianqJRAJnQlsjwZ5GaFQFm
	wPBSTwIoPOcsvQ2wpDX3x+wkcTv5XKgEM33+9tvfrNvc4Lj6cH/VwHEwn9GiyxEDLfKC7mMYeKXec
	jiRFugpO/QPFD8qpEQN80dZjH6mo4ZtuR/CrPf/dW1gSh2Kyv+LHaxGxkdv3QXipQ7sKHZ8U43EZB
	5ZwMgHH7ufCa6n7Q3rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH62U-00000009oOD-3hf7;
	Tue, 11 Jun 2024 18:16:10 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH62O-00000009oJc-3nOI;
	Tue, 11 Jun 2024 18:16:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AD7C20007;
	Tue, 11 Jun 2024 18:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718129758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rg+NohawaTXFK1Fhif7XHyzzS0tstlbs6exoV45k748=;
	b=cohNJ7ToVC/jNm/iqicKhPbz/PNrGQEIPHhKIYDkQHrpkEGTrnxRJbtoKNWrItNX1hmGSR
	kJiAdD4eaTgg4NYHz36ovV9RrM7t51okkaXVRtNvWrOrmFCf/kUq+e2yP2Xybaoa/32kDV
	hLBJgdXie0o4AqSqzhMcUWFUtiDINqUQblTDQx7noZwEUwsvGNsMZlVBgdWJWCc4Qnb/8m
	ID9lDKfgzvLHmeCM8U/LJzsVaGh+HY9HfguxTKKCOCa5CzQyGnOTKrwef75j3b5Z+1chaL
	3r+nuBdBPYnTI0krgM6l3H1ZlyJY+ZjIgdE1loo2B+P689i6B9j+e41ErgLphQ==
Message-ID: <4416ef22-78cc-4ce5-b61d-69ff0903811e@arinc9.com>
Date: Tue, 11 Jun 2024 21:15:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
 <1807a142-1534-4fa4-ad4b-d1c03af014c2@arinc9.com>
 <58d8ddea-71cc-427a-94cc-a95f6bce61d2@collabora.com>
 <16e9c06e-9908-455d-a387-614fefe5bcf8@arinc9.com>
 <5e87d31c-b059-4f9a-93f7-dc87465ed14a@collabora.com>
Content-Language: en-US
In-Reply-To: <5e87d31c-b059-4f9a-93f7-dc87465ed14a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_111605_273189_962F373C 
X-CRM114-Status: GOOD (  30.53  )
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

On 11/06/2024 16:03, AngeloGioacchino Del Regno wrote:
> Il 11/06/24 14:56, Arınç ÜNAL ha scritto:
>> On 11/06/2024 15:28, AngeloGioacchino Del Regno wrote:
>>> Il 11/06/24 13:38, Arınç ÜNAL ha scritto:
>>>> On 11/06/2024 14:30, Thorsten Leemhuis wrote:
>>>>> On 07.06.24 16:15, Thorsten Leemhuis wrote:
>>>>>> On 07.06.24 16:03, Paolo Abeni wrote:
>>>>>>> On Thu, 2024-06-06 at 10:26 +0200, Thorsten Leemhuis wrote:
>>>>>>>> On 31.05.24 08:10, Arınç ÜNAL wrote:
>>>>>>>>> On 31/05/2024 08.40, Thorsten Leemhuis wrote:
>>>>>>>>>> [adding Paolo, who committed the culprit]
>>>>>>>> 
>>>>>>>> /me slowly wonders if the culprit should be reverted for now (see below)
>>>>>>>> and should be reapplied later together with the matching changes from
>>>>>>>> Arınç ÜNAL.
>>>>>>> 
>>>>>>> FWIS I think a revert should be avoided, given that a fix is available
>>>>>>> and nicely small.
>>>>>> 
>>>>>> Yeah, on one hand I agree; but on the other it seems that the
>>>>>> maintainers that would have to take care of the dt changes to fix this
>>>>>> until now remained silent in this thread, apart from Rob who sent the
>>>>>> mail regarding the warnings.
>>>>>> 
>>>>>> I put those maintainers in the To: field of this mail, maybe that might
>>>>>> lead to some reaction.
>>>>> 
>>>>> Still no reply from the DRS folks or any other progress I noticed. Guess
>>>>> that means I will soon have no other choice than to get Linus involved,
>>>>> as this looks stuck. :-( #sigh
>>>> 
>>>> Does it have to be Linus that needs to apply "[PATCH 0/2] Set PHY address
>>>> of MT7531 switch to 0x1f on MediaTek arm64 boards"? Aren't there any other
>>>> ARM maintainers that can apply the fix to their tree?
>>>> 
>>>> Arınç
>>> 
>>> You have feedback from two people on the series that you mentioned, and noone
>>> is going to apply something that needs to be fixed.
>>> 
>>> I'm giving you the possibility of addressing the comments in your patch, but
>>> I don't want to see any mention of the driver previously ignoring this or that
>>> as this is irrelevant for a hardware description. Devicetree only describes HW.
>>> 
>>> Adding up, in commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of switch from device tree"),
>>> you have created a regression.
>>> 
>>> Regressions should be fixed - as in - if the driver did work before with the old
>>> devicetrees, it shall still work. You can't break ABI. Any changes that you do
>>> to your driver must not break functionality with old devicetrees.
>>> 
>>> So...
>>> 
>>> ------> Fix the driver that you broke <------
>> 
>> The device tree ABI before the change on the driver:
>> 
>> The reg value represents the PHY address of the switch.
>> 
>> The device tree ABI after the change on the driver:
>> 
>> The reg value represents the PHY address of the switch.
>> 
>> I see no device tree ABI breakage. What I see instead is the driver
>> starting enforcing the device tree ABI. No change had been made on the
>> device tree ABI so any non-Linux driver that controls this switch continues
>> to work.
>> 
>> These old device tree source files in question did not abide by the device
>> tree ABI in the first place, which is why they don't work anymore as the
>> Linux driver now enforces the ABI. Device tree source files not conforming
>> to the ABI is not something to maintain but to fix. The patch series that
>> fixes them are already submitted.
> 
> As I said, the devicetree MUST describe the hardware correctly, and on that I do
> agree, and I, again, said that I want to take the devicetree fix.
> 
> However, the driver regressed, and this broke functionality with old device trees.
> Old device trees might have been wrong (and they are, yes), but functionality was
> there and the switch was working.
> 
> I repeat, driver changes MUST be retro-compatible with older device trees, and your
> driver changes ARE NOT; otherwise, this wouldn't be called *regression*.

I'm going to argue that what caused the regression is the broken device
tree. The recent change on the driver only worked towards exposing the
broken device tree. The device tree files hosted on the Linux repository is
not only for use with the Linux drivers. Other projects use these device
tree files as well, as hardware description is not supposed to differ by
project. And for any non-Linux driver that would use this broken device
tree, there would be a regression.

So I don't understand why you demand a change on a Linux driver to be made
before applying the fix for a broken device tree.

That said, I don't understand the old device tree sentiment here. The
driver, after the change, still does support old device trees. Never in the
existence of this switch bindings, the PHY address was supposed to be
described a value other than the PHY address the switch listens on. Yes,
the driver now doesn't work with old and broken device trees. Which is why
we're fixing the said device trees. I don't see why it is necessary to make
the driver support broken device trees just because they used to work for a
certain range of time. This isn't about preserving ABI.

Arınç

