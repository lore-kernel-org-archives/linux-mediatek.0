Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E56EC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 05:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7kb86slOnjl1TVZjvP8hxkOyssEP3QytYVnpBoDrB8=; b=ASQJ34PjPVgxfLrC4hBl9GOWhk
	l411/M/1Auf5R3ewP+uo2pI0HQ/BiW4ObuVKgiOOJgyUIcZ5hqBpC/TIqbW5W6Y/wj+sZDupC88S6
	woR5LfY9m7CXyGZPmLzh8+Uff/xH7F9s5aifTESTdA7lPeZ/FYQkN1nOLzeZHN1ZqkiOtZKh4Xy+d
	CRYixNaW5IjOwYwvSZJVsC6Zhef68pKj8fKimsUKKOsg4U+U8GGBmp41drxHmYh4HX3bIHQF40qeb
	V6cKTVqghGSZCRe8jfeagR1PtvP0KFhYda0m/204pqxevE4PaK3LOqsQulOHJcX+TkFL5BLK/3nAQ
	RnSobWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCv0t-00000009IVF-1sHc;
	Fri, 31 May 2024 05:41:15 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCv0m-00000009IUV-396b;
	Fri, 31 May 2024 05:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=q7kb86slOnjl1TVZjvP8hxkOyssEP3QytYVnpBoDrB8=;
	t=1717134068; x=1717566068; b=C29aiYmBx2G11CssFEyclwpZCW51j5gIWjcACnmQHHfUqZn
	UslfC3db4Cpea+SrQWyS122a/vAuIIBrpojpl77b+AAMLgfB0Q8w9Y7Mr5VwbLyN+XeIAWIJEyyae
	v9wpxV2peST9k6gEexXIPOB+Ntw1JCqr1fBpMbmxx7g/lyOCSKMozAHUbbJvpaRMB5JQllBwBd7aI
	Emf4k+uuzeKZhZrT01BsMaNxP3JJN/XllnxWTC4WyGVEO5uihmBrU/vBIJnMN15//K9Dby3CXU+2k
	haKcDQbBsVj3KPtLJ9tMFGI4SIMYbEl9YDrxkZCPsnNB/VdoUTr7jxgK97I4nybw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sCv0b-0003Vc-RI; Fri, 31 May 2024 07:40:57 +0200
Message-ID: <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
Date: Fri, 31 May 2024 07:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717134068;afbcf654;
X-HE-SMSGID: 1sCv0b-0003Vc-RI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_224108_985349_2E3AAA07 
X-CRM114-Status: GOOD (  21.78  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Linux kernel regressions list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[adding Paolo, who committed the culprit]

On 23.05.24 12:44, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 17.05.24 08:27, Frank Wunderlich wrote:
>> Am 17. Mai 2024 04:17:47 MESZ schrieb "Arınç ÜNAL" <arinc.unal@arinc9.com>:
>>> On 16/05/2024 23:48, Frank Wunderlich wrote:
>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>
>>>> After commit 868ff5f4944a
>>>> ("net: dsa: mt7530-mdio: read PHY address of switch from device tree")
>>>> the mt7531 switch on Bananapi-R64 was not detected.
>>>>
>>>> mt7530-mdio mdio-bus:00: reset timeout
>>>> mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -110
>>>>
>>>> Fix this by adding phy address in devicetree.
>>>>

Frank, am I right assuming the regression is still present in mainline?
As from here it looks like for two weeks now there was no progress at
all to fix this (or I missed it, which is quite possible).

Makes me wonder if the maintainers should revert the culprit or if the
arm64 dts folks should accept your fix despite Arınç ÜNAL's (who from a
quick look on lore hasn't posted anything for two weeks now) comment.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

>>> I don't like the mention of the Linux kernel driver on the patch log. What
>>> you're fixing is the incorrect description of the switch's PHY address on
>>> the DTS file. Whether or not any driver from any project is actually
>>> reading it from the DTS file is irrelevant to this patch. That said, I
>>> already have a patch series I've been meaning to send the next version of
>>> that already addresses this. Please wait for that.
> 
> Did you sent this? Because from what I see with my limited experience in
> this subsystem...
> 
>> From my PoV it is a regression in next/6.10
> 
> ...I have to agree with Frank here. So it would be good to get this
> fixed before -rc1 is out to prevent more people from running into this.
> 
>> because the driver change was merged (without "broadcast" fallback) and the dts patch [1] is not.
>>
>> I agree that my patch can be dropped because there was already one.
>>
>> regards Frank
>>
>> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com/
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 

