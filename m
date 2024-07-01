Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5761C30659
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cb3ioG46MVMhJrZ+bnRLqzojpFTF/kcuuAOnVgBs574=; b=g3P8T3x0rruxiX
	dyoTJGCkTT9603RnH4e1hN4leg4AFrfqYSbJ3bc+CSZq1lMkulPB4AbOGcaHqbTEZ6sI0oMN7Pz8I
	PiMui9ytNq8ZHnKa0XwhSjAfs4uE5SZCkAEPf1QxGMASpA6Px03kvI3SVgyrk7UsTjQVP6Ww7lyKW
	edg6vO94scS0HeyEl65mTzvPu/ozHhUTp6P5PMozQOR4JWNGXFzQx75H+/4uTfp2Qtk0TNeyS6+VR
	Nkhjiw+aWq088m54Xz8QI0o3DKm8Y+9cjkPaYWwqSoPhh/L2ntIIXFfmBPwghkhMd7A/z0KbRVSWI
	3uk1VCWlTh0I8WMbHseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCCw-00000002CCW-1i7O;
	Mon, 01 Jul 2024 08:16:18 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOCCg-00000002C73-3xFX;
	Mon, 01 Jul 2024 08:16:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81A171C0005;
	Mon,  1 Jul 2024 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719821757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cb3ioG46MVMhJrZ+bnRLqzojpFTF/kcuuAOnVgBs574=;
	b=p1OdbpAWa55TrDe7itSf8E4cr/iKBsUNY3rqFxY+IFGRyCdwWsaCMtQJrgm0JlBhqN1aKZ
	jnCsJRgcY0n2Fuzsg7Z+Inbwu5BolhaMKGk4U4IDL89uJ8T+qzp3TKY99vmHthy+BvMaBa
	LxDSLHq56Ei+K2/FuU1lhYS9ve5V8ShmyuL3OLNwKfW56DV0KSgCaAgplBrKM+lo6WfWq6
	MsJ5sKrs5ukMRpFMY2KYScoXbFhGOag6G7pcW3MqznWx78+371vX6Ek47spvyUeBxfv2AB
	dxIEzGGcW78tiWAxdskUOI71OhGuPVqnWyCfu29tSchrBEsp1cuY0TpdmvX2PA==
Message-ID: <aeb255ff-3755-4f76-a8f8-cda27a67f818@arinc9.com>
Date: Mon, 1 Jul 2024 11:15:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jakub Kicinski <kuba@kernel.org>
References: <20240516204847.171029-1-linux@fw-web.de>
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
 <1aedb1d4-8dc3-4e17-aff1-7cc417465967@arinc9.com>
 <130518e2-d6dd-49ed-9cc2-ca9cdec93b98@leemhuis.info>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <130518e2-d6dd-49ed-9cc2-ca9cdec93b98@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_011603_265167_A58FC47E 
X-CRM114-Status: GOOD (  16.48  )
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

On 01/07/2024 11:04, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 01.07.24 09:44, Arınç ÜNAL wrote:
>> On 01/07/2024 09:16, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> [CCing the other net maintainers]
>>>
>>> On 25.06.24 10:51, AngeloGioacchino Del Regno wrote:
>>>> Il 25/06/24 07:56, Linux regression tracking (Thorsten Leemhuis) ha
>>>> scritto:
>>>>> On 17.06.24 13:08, Arınç ÜNAL wrote:
>>>>>> On 17/06/2024 11:33, Linux regression tracking (Thorsten Leemhuis)
>>>>>> wrote:
>>>>>> [...]
>>>>> It looks more and more like we are stuck here (or was there progress
>>>>> and
>>>>> I just missed it?) while the 6.10 final is slowly getting closer.
>>>>> Hence:
>>>>>
>>>>> AngeloGioacchino, should we ask the net maintainers to revert
>>>>> 868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY address of switch from
>>>>> device tree") for now to resolve this regression? Reminder, there is
>>>>> nothing wrong with that commit per se afaik, it just exposes a problem
>>>>> that needs to be fixed first before it can be reapplied.
>>>>
>>>> To be clear on this: I asked for the commit to be fixed such that it
>>>> guarantees
>>>> backwards compatibility with older device trees.
>>>>
>>>> If no fix comes,
>>>
>>> I haven't see any since that mail, did you? If not, I think...
>>>
>>>> then I guess that we should ask them to revert this commit
>>>> until a fix is available.
>>>
>>> ...it's time to ask them for the revert to resolve this for -rc7 (and
>>> avoid a last minute revert), or what do you think?
>>
>> This is quite frustrating. I absolutely won't consent to a revert. [...]
> 
> Reminder: try to not see a revert as a bad thing. It's just means "not
> ready yet, revert and we'll try again later" -- that's actually
> something Linus wrote just a few hours ago:
> https://lore.kernel.org/lkml/CAHk-=wgQMOscLeeA3QXOs97xOz_CTxdqJjpC20tJ-7bUdHWtSA@mail.gmail.com/

Except it is ready and trying again is my responsibility, which means
unnecessary work for me to do. I've already got a ton of things to do.
Applying the device tree patch resolves this regression; no reverts needed.
And then there's the patch in the works by Daniel that will address all the
remaining cases outside of the reported regression.

Arınç

