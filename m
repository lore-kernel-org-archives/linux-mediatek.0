Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA96C30653
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hE2xd4QxwpEy7QXL+lAVyTmTgN2X6yquzmQ2NM2E7EA=; b=oWwbYd9XzIcE1d
	pdN8dB9CqYqrwpKCZHWcjW4a3n5AXmRpCDGp2aPaedbPfXCh9EQHKtM1QgQMtuf+juXQr9uOXu0QS
	OZUNsBcJUcethulyBnNKrHLmiP6H7Wub/DWbD5deqpGBtST48wbQYelWCmhnGUbY6f1sj//NzKQxG
	1zETWsrLyRghEWzQzb1J43GT6dcPy+4gez2++0dmB2v49zQg9utSQ+P/xnPaGJ4uAph47wBFTZmkx
	H7+TRLn0CyAYN3YD2sX6WwJBrv/d2WkidnxhyapLgiNkaAYuM2zQTanDAyCiy00LwTA5ttPEVPn++
	pFB56PQwRwUeVOztzyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1Mp-000000024vv-3L39;
	Tue, 25 Jun 2024 08:17:31 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1Mi-000000024uY-2V7e;
	Tue, 25 Jun 2024 08:17:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62B741BF207;
	Tue, 25 Jun 2024 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719303440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hE2xd4QxwpEy7QXL+lAVyTmTgN2X6yquzmQ2NM2E7EA=;
	b=n7r9QbigIrXH9yhC12MrdNMh8FOIviHrg/M7D7taN3J5qjffT7qhqfSij2fkEgaElePZR3
	71r0Xk6IOOK/8CuoSmrK9Y0yFTUowXl+b7Tqr4SSN+6AQbdIbEt+yYwYm8XLoSDLXuabgU
	zCmZWv7tPmeulD7/jT+hf+EUBp3Cf50uJA+kiihV4JVCf1o9oWkbQdFYTTk9AGQOSexuRg
	/4D9UWAVsbh8dgpmU2hwJWTcTzikN6MHMFN3khnQjmuNiw44LY1dox1njbN3L/vNXNyiwQ
	FLizrA4peUFyyotRF62XAfZDBigiWXY8HHecPFHSrAq1iLllTQU70zEiIJ5b4g==
Message-ID: <bb7e9cae-d627-4f38-9da2-b40fb3c349fe@arinc9.com>
Date: Tue, 25 Jun 2024 11:17:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Paolo Abeni <pabeni@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240516204847.171029-1-linux@fw-web.de>
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
 <af561268-9793-4b5d-aa0f-d09698fd6fb0@arinc9.com>
 <750a60a6-4585-4bd2-97be-cf944e51fbdb@leemhuis.info>
 <7a2ea06b-ae4e-4374-82c2-4de4184e06c3@arinc9.com>
 <40035548-c76b-4b0d-915f-c513eaadbc5d@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <40035548-c76b-4b0d-915f-c513eaadbc5d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_011724_948638_A18005AD 
X-CRM114-Status: GOOD (  31.63  )
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

On 25/06/2024 09.57, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 25.06.24 08:17, Arınç ÜNAL wrote:
>> On 25/06/2024 08.56, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 17.06.24 13:08, Arınç ÜNAL wrote:
>>>> On 17/06/2024 11:33, Linux regression tracking (Thorsten Leemhuis)
>>>> wrote:
>>>> [...]
>>>> I've submitted a patch series that fixes the regression. Angelo argued
>>>> against the way the regression is fixed. I've very clearly argued
>>>> back why
>>>> I find Angelo's approach wrong. There's been no response back. I don't
>>>> understand why reverting the patch is the likely outcome
>>>
>>> Long story short: because that how things like that are handled in the
>>> Linux kernel project, as Linus wants it like that. See some of the
>>> quotes from https://docs.kernel.org/process/handling-regressions.html
>>> for details.
>>>
>>>> whilst the
>>>> standing argument points towards applying the said patch series. If a
>>>> revert happens before this discussion with Angelo finalises, this
>>>> will set
>>>> a precedent that will tell maintainers that they can have their way
>>>> by just
>>>> not replying to the ongoing discussions.
>>>>
>>>> That said, the decision of resolving the regression by either
>>>> reverting the
>>>> patch or applying the patch series shall not depend on whether or not
>>>> Angelo is pleased but rather there're no counter-arguments left on the
>>>> points brought, meaning the decision shall be made depending on the
>>>> argument that stands.
>>>>
>>>> Therefore, I suggest that unless Angelo responds back with a
>>>> counter-argument in the window of a week or two, as you've described, my
>>>> patch series shall be applied.
>>>
>>> It looks more and more like we are stuck here (or was there progress and
>>> I just missed it?) while the 6.10 final is slowly getting closer. Hence:
>>
>> There hasn't been progress at all. I believe I have clearly described the
>> way out of this issue.
>>
>>> AngeloGioacchino, should we ask the net maintainers to revert
>>> 868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY address of switch from
>>> device tree") for now to resolve this regression? Reminder, there is
>>> nothing wrong with that commit per se afaik, it just exposes a problem
>>> that needs to be fixed first before it can be reapplied.
>>
>> Are you suggesting the patch shall be reverted first, then the DT patch
>> applied, then the reverted patch applied back?
> 
> Yeah.
> 
>> If only one of the first two
>> steps were done, it would fix the regression so I don't understand why go
>> through this tedious process when we can quite simply apply the DT patch to
>> resolve the regression.
> 
> Which DT patch do you mean here? Your series or the one from Frank at
> the start of the thread (the one you seems to be unhappy about iirc, but
> I might be wrong there)?

My series, as arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts needs to be
addressed too to resolve the regression.

> 
> Anyway, to answer the statement: because the maintainers that would have
> to accept the DT patch to resolve the problem apparently are not happy
> with it -- and nobody seems to be working on providing patches that make
> them happy which are also acceptable at this point of the devel cycle;
> so as it looks like currently to prevent the regression from entering
> 6.10 reverting the net change is the only option left.

I've already made my case regarding the situation with the DT patch. I
can't provide new patches because Angelo did not acknowledge my points yet.
I maintain the net driver and I too won't be happy with a revert on the
driver.

> 
>> Keep in mind that I maintain the MT7530 DSA subdriver and the company I
>> work with has got boards that uses the functionality the commit
>> 868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY address of switch from
>> device tree") brings.
> 
> Don't see a revert as setback at all, that's just normal for the kernel.
> I'm not the one that will decide about this anyway. And everyone
> involved afaics would like to prevent a revert. But it seems more and
> more likely that we are not getting there in time for the 6.10 release
> (or ideally -rc6 or -rc7 to allow some testing, as last-minute reverts
> can cause new problems).

I am still calling for the simple procedure of applying the DT patch to
resolve the regression.

Arınç

