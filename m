Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E183BC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrZd8bURUH6yJXWQuFtTxqq3uVzfiftlLP02djENBPc=; b=HCF2UBnYoyId4t
	CV6CP3np/9QMSIXQfe5iZQdDmyh6PYSxYqcotPpw1LjPfFWETdToLzdumWQg1SXisArNJTCJTWXLJ
	L0V+5FrDIEkOHqnI1Ldvafkm1aP7GTc1QRfxR14R8/3CpSvijxZ4mRQs3NIMkc/dhOtfkYZzB06T/
	BAjJSlCJIatCfvjOpwxciqF7WCd5r38uLscp8iDF/8W5RQc68PaI+qnuIhsLFe3SlQMFFv7rf/wG0
	/Chjf7ZIMkiD+E+8mEW0OFZuJUjHmgZdHK4ppiE21E5DzxUKYH3z2Prc2a5ekD5zhXd5UR3L0AXi3
	+aOmaax3rX2Delmi2JFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYlBt-0000000Ew18-1km1;
	Tue, 30 Jul 2024 11:38:53 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYlBO-0000000EvpK-0s3C;
	Tue, 30 Jul 2024 11:38:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08EADC0004;
	Tue, 30 Jul 2024 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1722339497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OrZd8bURUH6yJXWQuFtTxqq3uVzfiftlLP02djENBPc=;
	b=YPAV4rdICBvbU1vpTxZpmwwp5h/YYFLYFR9nt8t5LfoHd7Px89anwpCq/TQcpoXG550Qyd
	NzrIZIjtRuFOUT3hmjOMAmud+ep2WVz5m5MX4HxQSkU/mC5gCqYr+RFWiwhsd2Ao2Pq5MZ
	KujTY/XJQj61Tf1mKyD18WzeCllcF14ssHRNIjR9kqu/FHZsImXNT5JXAEU3qGGpbpNn+A
	saRG6DlFnN2nw6A2kFsN4yFuqckI6MUBsYq+YTeq6UKozFUIILvEBvuZtODWh5Zl1fjqvS
	Po9WT5Yq3XL+ej9z4lpmpp+jS2S8OTFxFUUoR0i5y6M/L3U486ui6GK8IMyXhw==
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 14:38:15 +0300
From: arinc.unal@arinc9.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
In-Reply-To: <2076f699540c3c9d10effdb8b55d3f89@arinc9.com>
References: <20240516204847.171029-1-linux@fw-web.de>
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
 <1aedb1d4-8dc3-4e17-aff1-7cc417465967@arinc9.com>
 <130518e2-d6dd-49ed-9cc2-ca9cdec93b98@leemhuis.info>
 <aeb255ff-3755-4f76-a8f8-cda27a67f818@arinc9.com>
 <b3fa66cc-516b-4d78-aee5-62a47b52a3b1@collabora.com>
 <2076f699540c3c9d10effdb8b55d3f89@arinc9.com>
Message-ID: <3363e07a0ba483e98414754bd4bb1e5e@arinc9.com>
X-Sender: arinc.unal@arinc9.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_043822_634142_79A202F2 
X-CRM114-Status: GOOD (  35.99  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2024-07-30 14:22, arinc.unal@arinc9.com wrote:
> On 2024-07-30 12:41, AngeloGioacchino Del Regno wrote:
>> Il 01/07/24 10:15, Arınç ÜNAL ha scritto:
>>> On 01/07/2024 11:04, Linux regression tracking (Thorsten Leemhuis) 
>>> wrote:
>>>> On 01.07.24 09:44, Arınç ÜNAL wrote:
>>>>> On 01/07/2024 09:16, Linux regression tracking (Thorsten Leemhuis) 
>>>>> wrote:
>>>>>> [CCing the other net maintainers]
>>>>>> 
>>>>>> On 25.06.24 10:51, AngeloGioacchino Del Regno wrote:
>>>>>>> Il 25/06/24 07:56, Linux regression tracking (Thorsten Leemhuis) 
>>>>>>> ha
>>>>>>> scritto:
>>>>>>>> On 17.06.24 13:08, Arınç ÜNAL wrote:
>>>>>>>>> On 17/06/2024 11:33, Linux regression tracking (Thorsten 
>>>>>>>>> Leemhuis)
>>>>>>>>> wrote:
>>>>>>>>> [...]
>>>>>>>> It looks more and more like we are stuck here (or was there 
>>>>>>>> progress
>>>>>>>> and
>>>>>>>> I just missed it?) while the 6.10 final is slowly getting 
>>>>>>>> closer.
>>>>>>>> Hence:
>>>>>>>> 
>>>>>>>> AngeloGioacchino, should we ask the net maintainers to revert
>>>>>>>> 868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY address of 
>>>>>>>> switch from
>>>>>>>> device tree") for now to resolve this regression? Reminder, 
>>>>>>>> there is
>>>>>>>> nothing wrong with that commit per se afaik, it just exposes a 
>>>>>>>> problem
>>>>>>>> that needs to be fixed first before it can be reapplied.
>>>>>>> 
>>>>>>> To be clear on this: I asked for the commit to be fixed such that 
>>>>>>> it
>>>>>>> guarantees
>>>>>>> backwards compatibility with older device trees.
>>>>>>> 
>>>>>>> If no fix comes,
>>>>>> 
>>>>>> I haven't see any since that mail, did you? If not, I think...
>>>>>> 
>>>>>>> then I guess that we should ask them to revert this commit
>>>>>>> until a fix is available.
>>>>>> 
>>>>>> ...it's time to ask them for the revert to resolve this for -rc7 
>>>>>> (and
>>>>>> avoid a last minute revert), or what do you think?
>>>>> 
>>>>> This is quite frustrating. I absolutely won't consent to a revert. 
>>>>> [...]
>>>> 
>>>> Reminder: try to not see a revert as a bad thing. It's just means 
>>>> "not
>>>> ready yet, revert and we'll try again later" -- that's actually
>>>> something Linus wrote just a few hours ago:
>>>> https://lore.kernel.org/lkml/CAHk-=wgQMOscLeeA3QXOs97xOz_CTxdqJjpC20tJ-7bUdHWtSA@mail.gmail.com/
>>> 
>>> Except it is ready and trying again is my responsibility, which means
>>> unnecessary work for me to do. I've already got a ton of things to 
>>> do.
>>> Applying the device tree patch resolves this regression; no reverts 
>>> needed.
>>> And then there's the patch in the works by Daniel that will address 
>>> all the
>>> remaining cases outside of the reported regression.
>>> 
>> 
>> The commit that fixes your breakage in a way that does *not* please me
>> (because of older devicetrees being still broken with the new driver) 
>> was
>> picked and it is in v6.11-rc1.
>> 
>> I had to do this because I value the community (in this case, the 
>> users) much
>> more than trying to make an arrogant developer to act in a 
>> community-friendly
>> manner while leaving things completely broken.
>> 
>> That said, remembering that we're humans and, as such, it's normal to 
>> get something
>> wrong during the development process, I want to remind you that:
>> 
>>  1. A series that creates regressions is *not* good and *not* ready to 
>> be
>>     upstreamed; and
>>  2. As a maintainer, you have the responsibility of not breaking the 
>> kernel,
>>     not breaking devices and not breaking currently working 
>> functionality; and
>>  3. Devicetrees being wrong (but working) since day 0 is not an excuse 
>> to break
>>     functionality; and
>>  4. Blaming the one who introduced the devicetree (you're doing that, 
>> since you
>>     are blaming the devicetree being wrong) isn't solving anything and 
>> will not
>>     magically make your code acceptable or good; and
>>  5. If you push a wrong commit, there's nothing to be ashamed of; and
>>  6. If you make a mistake, you should recognize that and find a way to
>>     make things right, that should be done for the community, not for
>>     yourself; and
>>  7. You shall respect the community: in this case, with your arrogant 
>> behavior
>>     you did *not* respect the users.
>> 
>> P.S.: The right way of making such change is to:
>>       1. Avoid breaking currently working devices by making sure that 
>> their DT
>>          still works with the new driver; and
>>       2. If breakage is unavoidable, make it so one kernel version has 
>> a fix that
>>          works with both old and new driver, and the next version 
>> introduces the
>>          breakage. N.2 should ideally never happen, anyway.
>> 
>> Let's wrap up this matter now - I don't want to spend any more word, 
>> nor time,
>> on this, as I really have nothing else to say.
>> 
>> Best regards,
>> Angelo
> 
> To be clear, I only became aware that my patch was picked by reading 
> this
> email. It is clear that we have different views. To that extend, all of
> what you have written above can be answered to by reading what I have
> already written in this thread. Therefore, I don't see any wrongdoing 
> from
> my side and invite everyone to fully read this thread to draw their own
> conclusions; something you seem not to have done. And I'm not the one,
> calling people names here. I can only offer my respect for hard working
> people.
> 
> In my view, your behaviour of not applying a devicetree patch before a
> Linux driver patch was applied, and then not replying to any arguments
> whatsoever, was keeping the devicetree files hostage until your demands
> were met. What I see is that, you failed as a maintainer to attend to 
> my
> points against this practice. It's no surprise that, after not having 
> heard
> back from you with an argument against my points, my patch was 
> eventually
> taken in by someone else.
> 
> Arınç

Funny. It turns out it was not even my patch that was picked but rather 
the
patch that spawned this thread. Picked by you, no less. An improper 
patch
whose log was loaded with incorrect logic, and the patch itself not 
fixing
all the remaining broken trees. Now someone needs to submit another 
patch
to close the remaining hole, 
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts.
I shall do that.

Arınç

