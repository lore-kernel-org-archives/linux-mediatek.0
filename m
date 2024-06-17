Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69ACC2BA18
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 11:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OF6t87ZOTovWqD1drOj8KVeXWAvWWRQUUmrsihK6t5U=; b=ec0h42Vj+h0r/w
	tvEP9ug6ii9Lnkltax9utlL2iNY7pp3KTPDksYkd6WUbYQX1ETi9SUaQ0ZCXz82XP28NxUVO+fn9s
	x9js7wPCBnLnnGcjA/Dk6B0tL12VMKb1IImeJfC5Ut7GktulAjxLJx4uM1psCaWkDlIHVvXQ7lQK7
	v7l+byzlT3PUuZFpr3bSMF/eyNaHOhiRSjS99azdmQQl7ioBRMGeUcaEDthnrBWl6jmioUco6fB5o
	F9fof+tNuWjjH4dC2rFTvbe+/vnZp+bhGCSprkN73SO0kZZaMlLfTqljuZt9miz2kqwf/51KoGepa
	g2FWky0PElgF9j/pvF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJADw-0000000APlt-2cv7;
	Mon, 17 Jun 2024 11:08:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJADt-0000000APl0-09sL;
	Mon, 17 Jun 2024 11:08:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25E7B240002;
	Mon, 17 Jun 2024 11:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718622504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OF6t87ZOTovWqD1drOj8KVeXWAvWWRQUUmrsihK6t5U=;
	b=JU8tmsmgpKGRObQmaZylENnbGAygRo5IuIquYGTP5DI7rNvxJ7vh4a9Vzf0OamJXgMww/e
	JOsJvcqO5RmFTT0Bz8kj6gYsg9Pv5PInw3t6CeZtS6BrvptHCDpdnggR3GGsBoWd9iMUXE
	cyvFPrRCqw+NPLObWzekiuX6nK1In0Q7WroisE1nJVIauZa2bGDYoUg72FB+OXLOa4Ygqa
	Z3giDWFp2ZLOruLiRPKNxIacya+//YtOsyDAZs3ZTaKaOqd+uOts2Y0nxGweOOeDDRY2ra
	zfT8vy72LqZYWgqCqqYrhqyW5fhBgtOpr5JXt+XimYT48opOSMRxQxtoftZBpw==
Message-ID: <af561268-9793-4b5d-aa0f-d09698fd6fb0@arinc9.com>
Date: Mon, 17 Jun 2024 14:08:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
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
 <4416ef22-78cc-4ce5-b61d-69ff0903811e@arinc9.com>
 <bd6b6929-d34d-4bd5-9cb0-bc8fe850ee46@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <bd6b6929-d34d-4bd5-9cb0-bc8fe850ee46@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_040829_382380_0A031DEE 
X-CRM114-Status: GOOD (  31.01  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/06/2024 11:33, Linux regression tracking (Thorsten Leemhuis) wrote:
> This thread/fixing the regressions looks stalled again, let me jump in
> here with a further comment below.
> 
> On 11.06.24 20:15, Arınç ÜNAL wrote:
>> On 11/06/2024 16:03, AngeloGioacchino Del Regno wrote:
>>> Il 11/06/24 14:56, Arınç ÜNAL ha scritto:
>>>> On 11/06/2024 15:28, AngeloGioacchino Del Regno wrote:
>>>>> Il 11/06/24 13:38, Arınç ÜNAL ha scritto:
>>>>>> On 11/06/2024 14:30, Thorsten Leemhuis wrote:
>>>>>>> On 07.06.24 16:15, Thorsten Leemhuis wrote:
>>>>>>>> On 07.06.24 16:03, Paolo Abeni wrote:
>>>>>>>>> On Thu, 2024-06-06 at 10:26 +0200, Thorsten Leemhuis wrote:
>>>>>>>>>> On 31.05.24 08:10, Arınç ÜNAL wrote:
>>>>>>>>>>> On 31/05/2024 08.40, Thorsten Leemhuis wrote:
>>>>>>>>>>>> [adding Paolo, who committed the culprit]
>>>>>>>>>>
>>>>>>>>>> /me slowly wonders if the culprit should be reverted for now
>>>>>>>>>> (see below)
>>>>>>>>>> and should be reapplied later together with the matching
>>>>>>>>>> changes from
>>>>>>>>>> Arınç ÜNAL.
>>>>>>>>>
>>>>>>>>> FWIS I think a revert should be avoided, given that a fix is
>>>>>>>>> available
>>>>>>>>> and nicely small.
>>>>>>>>
>>>>>>>> Yeah, on one hand I agree; but on the other it seems that the
>>>>>>>> maintainers that would have to take care of the dt changes to fix
>>>>>>>> this
>>>>>>>> until now remained silent in this thread, apart from Rob who sent
>>>>>>>> the
>>>>>>>> mail regarding the warnings.
>>>>>>>>
>>>>>>>> I put those maintainers in the To: field of this mail, maybe that
>>>>>>>> might
>>>>>>>> lead to some reaction.
>>>>>>>
>>>>>>> Still no reply from the DRS folks or any other progress I noticed.
>>>>>>> Guess
>>>>>>> that means I will soon have no other choice than to get Linus
>>>>>>> involved,
>>>>>>> as this looks stuck. :-( #sigh
>>>>>>
>>>>>> Does it have to be Linus that needs to apply "[PATCH 0/2] Set PHY
>>>>>> address
>>>>>> of MT7531 switch to 0x1f on MediaTek arm64 boards"? Aren't there
>>>>>> any other
>>>>>> ARM maintainers that can apply the fix to their tree?
>>>>>>
>>>>>> Arınç
>>>>>
>>>>> You have feedback from two people on the series that you mentioned,
>>>>> and noone
>>>>> is going to apply something that needs to be fixed.
>>>>>
>>>>> I'm giving you the possibility of addressing the comments in your
>>>>> patch, but
>>>>> I don't want to see any mention of the driver previously ignoring
>>>>> this or that
>>>>> as this is irrelevant for a hardware description. Devicetree only
>>>>> describes HW.
>>>>>
>>>>> Adding up, in commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY
>>>>> address of switch from device tree"),
>>>>> you have created a regression.
>>>>>
>>>>> Regressions should be fixed - as in - if the driver did work before
>>>>> with the old
>>>>> devicetrees, it shall still work. You can't break ABI. Any changes
>>>>> that you do
>>>>> to your driver must not break functionality with old devicetrees.
>>>>>
>>>>> So...
>>>>>
>>>>> ------> Fix the driver that you broke <------
>>>>
>>>> The device tree ABI before the change on the driver:
>>>>
>>>> The reg value represents the PHY address of the switch.
>>>>
>>>> The device tree ABI after the change on the driver:
>>>>
>>>> The reg value represents the PHY address of the switch.
>>>>
>>>> I see no device tree ABI breakage. What I see instead is the driver
>>>> starting enforcing the device tree ABI. No change had been made on the
>>>> device tree ABI so any non-Linux driver that controls this switch
>>>> continues
>>>> to work.
>>>>
>>>> These old device tree source files in question did not abide by the
>>>> device
>>>> tree ABI in the first place, which is why they don't work anymore as the
>>>> Linux driver now enforces the ABI. Device tree source files not
>>>> conforming
>>>> to the ABI is not something to maintain but to fix. The patch series
>>>> that
>>>> fixes them are already submitted.
>>>
>>> As I said, the devicetree MUST describe the hardware correctly, and on
>>> that I do
>>> agree, and I, again, said that I want to take the devicetree fix.
>>>
>>> However, the driver regressed, and this broke functionality with old
>>> device trees.
>>> Old device trees might have been wrong (and they are, yes), but
>>> functionality was
>>> there and the switch was working.
>>>
>>> I repeat, driver changes MUST be retro-compatible with older device
>>> trees, and your
>>> driver changes ARE NOT; otherwise, this wouldn't be called *regression*.
>>
>> I'm going to argue that what caused the regression is the broken device
>> tree. The recent change on the driver only worked towards exposing the
>> broken device tree.
> 
> Well, for the kernel that does not matter much: due to our "no
> regressions" rule and how Linus handles it the author of that "recent
> change" (e.g. you) is responsible to fix regressions a change exposed --
> or that change is reverted (I might be wrong, but I think there are
> quotes from Linus in
> https://docs.kernel.org/process/handling-regressions.html to back this
> up). So in the end a revert in a week or two is likely the outcome,
> unless you or someone else fixes it in a way that pleases
> AngeloGioacchino et. at.

I've submitted a patch series that fixes the regression. Angelo argued
against the way the regression is fixed. I've very clearly argued back why
I find Angelo's approach wrong. There's been no response back. I don't
understand why reverting the patch is the likely outcome whilst the
standing argument points towards applying the said patch series. If a
revert happens before this discussion with Angelo finalises, this will set
a precedent that will tell maintainers that they can have their way by just
not replying to the ongoing discussions.

That said, the decision of resolving the regression by either reverting the
patch or applying the patch series shall not depend on whether or not
Angelo is pleased but rather there're no counter-arguments left on the
points brought, meaning the decision shall be made depending on the
argument that stands.

Therefore, I suggest that unless Angelo responds back with a
counter-argument in the window of a week or two, as you've described, my
patch series shall be applied.

Arınç

