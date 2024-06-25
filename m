Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D146AC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 08:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Le171/VeGpvm1hmSQylabsEhDXhqvr8P7tidIDMliq4=; b=nCoX324NXgDw5f
	DKh1I6Y23lFNPJ/K9fp88iIDOfrKVobTmu+2aLi1YfQnJ2EddbgrOszldxFHF6WmKNY5cQWkkLcaw
	O8NENBqU4hLHpSrWEC27uNp+qVROj06jrQvobMTfgxAT5RPNf+93krj84KBsQfXstOUTj/tEUqQ9W
	Grht9Q9TQtDYmkyysiL/EYd9Ui5dP8Ol9c4XzUclAYyO8+0j1r01vfGpRMrxL4VDIyyCeTeLlbmzc
	2PgzMtMWvKoyKIvOEcnCCYL8sA/2EFJdKKDW/4qdUse0Ip4ke+zSyfCuaxq3DYRwcaVoFjmrn1W46
	RDBH5bvV1dKqp8RM67uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1tt-00000002B5C-20Gl;
	Tue, 25 Jun 2024 08:51:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM1tm-00000002B40-217S;
	Tue, 25 Jun 2024 08:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719305492;
	bh=J7W6jQQOq6oMCiMWpafdMRKX7RlHQIMkt8NcZBcjKOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S2JST7Gtm+r4PcCve+QDN4GXwgH8RYiAG870eilIPav2n3x4SlVt+Lm1R+3ADFdTb
	 iSOhePfe6weu4x/WNfuo8HTjZA7EeP9PMNW9IGckoUJRWp+jksOOHjfmxD+raBBPi9
	 MaEhWi5sXVg+XKrtY5rPBKlkPPx43SSP5rx1xBvte8IjgZvBoo+5gk31oQol8rBhyq
	 lgjc6Em6c+7ARiHDEUxwSRtwk/3DFxJgikGbpaj9hb/XHBchFMCKRmZ7E/Orp6Y/y4
	 R94oswSbt3e8dBu7W5ybEe+Eq09WnWs5TRrlKHOFhQ/IUV35i82dPGiPza0aMJkBHr
	 /9pH1mbAdHrzw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A6353378045F;
	Tue, 25 Jun 2024 08:51:31 +0000 (UTC)
Message-ID: <9c498e37-df8b-469e-818a-9b1c9f2b1a3c@collabora.com>
Date: Tue, 25 Jun 2024 10:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Paolo Abeni <pabeni@redhat.com>
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
 <af561268-9793-4b5d-aa0f-d09698fd6fb0@arinc9.com>
 <750a60a6-4585-4bd2-97be-cf944e51fbdb@leemhuis.info>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <750a60a6-4585-4bd2-97be-cf944e51fbdb@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_015134_748174_E16457DD 
X-CRM114-Status: GOOD (  25.28  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/06/24 07:56, Linux regression tracking (Thorsten Leemhuis) ha scritto:
> On 17.06.24 13:08, Arınç ÜNAL wrote:
>> On 17/06/2024 11:33, Linux regression tracking (Thorsten Leemhuis) wrote:
>> [...]
>> I've submitted a patch series that fixes the regression. Angelo argued
>> against the way the regression is fixed. I've very clearly argued back why
>> I find Angelo's approach wrong. There's been no response back. I don't
>> understand why reverting the patch is the likely outcome
> 
> Long story short: because that how things like that are handled in the
> Linux kernel project, as Linus wants it like that. See some of the
> quotes from https://docs.kernel.org/process/handling-regressions.html
> for details.
> 
>> whilst the
>> standing argument points towards applying the said patch series. If a
>> revert happens before this discussion with Angelo finalises, this will set
>> a precedent that will tell maintainers that they can have their way by just
>> not replying to the ongoing discussions.
>>
>> That said, the decision of resolving the regression by either reverting the
>> patch or applying the patch series shall not depend on whether or not
>> Angelo is pleased but rather there're no counter-arguments left on the
>> points brought, meaning the decision shall be made depending on the
>> argument that stands.
>>
>> Therefore, I suggest that unless Angelo responds back with a
>> counter-argument in the window of a week or two, as you've described, my
>> patch series shall be applied.
> 
> It looks more and more like we are stuck here (or was there progress and
> I just missed it?) while the 6.10 final is slowly getting closer. Hence:
> 
> AngeloGioacchino, should we ask the net maintainers to revert
> 868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY address of switch from
> device tree") for now to resolve this regression? Reminder, there is
> nothing wrong with that commit per se afaik, it just exposes a problem
> that needs to be fixed first before it can be reapplied.
> 

To be clear on this: I asked for the commit to be fixed such that it guarantees
backwards compatibility with older device trees.

If no fix comes, then I guess that we should ask them to revert this commit
until a fix is available.

I don't like this situation, either, btw.

Ciao!
Angelo

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke


