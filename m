Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77620C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 08:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TAJBf2B8gbT67nqhACvm4EgH00WGKM6/1lZ+DcslpsE=; b=UVcZJT9xuxVd1X
	NDsIQ7lmKAYe5/lVSwD3aKzDeg370gy3GFGLMBQkSIgOAn1LClO/FSDrCvBbZW2tGaRuBj0WU9H3+
	lIUdxzqrGEywKSI+aC4A9IyC1YCbxJH0JvffvUUQOsjnt1tk/P2MUI8HeUG5BILHeslDxdFJasJuF
	h4roRpRLPw02srCCWjAgODpv+Ad1I/HXeOXOiFnQ4LhrnS5VEsvW2LL9VYAKH0pe8i2iWL4Xl7aVG
	4BYtXfy6FqODw855R8bzCiPTyUAAISLn/DBsBn8itpIEI/WFNaJkJbPrf3cEujl4Of3bFntqnFL4Q
	0MFkWjRqV7Alw/7XVpgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8Se-00000008pCy-49D3;
	Thu, 06 Jun 2024 08:27:04 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8Sb-00000008pAi-0622;
	Thu, 06 Jun 2024 08:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=TAJBf2B8gbT67nqhACvm4EgH00WGKM6/1lZ+DcslpsE=; t=1717662421;
	x=1718094421; b=lscCIxhDLoTVPz6fcfO4JMR5IzA7PCbPEXqsIzH8YqiPM6JXnU+YvrmcUUIVw
	rFymjluT7ZidNANBpG4Gb307Bx+GGUlDOo0qtKeMP2bps1UkT3Fc0R9+iC6/LP60r+xPlsWwo9sAC
	baFVVtmNktjjtDjd9XPCfqvMmuv8BM3w8DiT/HlXd9MRoPetaHC6yb0bI0YYBXVlRrlhFmN7qtHvQ
	7tqPnn9xgDMLYoQc9liVu+em0mFbPEEJiLwMk+EWLjzSdagWwUjCPWZ5hWOGeQVb9ndcinWmtCnQW
	yo/iNw0+bDANYEK/H/XzGJTAHMJPbZ6gIK1iFRcgmTQ7NGAFew==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sF8SQ-0006mK-P3; Thu, 06 Jun 2024 10:26:50 +0200
Message-ID: <714da201-654b-4183-8e5e-8ff0b64fe621@leemhuis.info>
Date: Thu, 6 Jun 2024 10:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
 <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
 <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717662421;425b7799;
X-HE-SMSGID: 1sF8SQ-0006mK-P3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_012701_238078_0614FD6C 
X-CRM114-Status: GOOD (  22.12  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31.05.24 08:10, Arınç ÜNAL wrote:
> On 31/05/2024 08.40, Thorsten Leemhuis wrote:
>> [adding Paolo, who committed the culprit]

/me slowly wonders if the culprit should be reverted for now (see below)
and should be reapplied later together with the matching changes from
Arınç ÜNAL.

>> On 23.05.24 12:44, Linux regression tracking (Thorsten Leemhuis) wrote:
>>> On 17.05.24 08:27, Frank Wunderlich wrote:
>>>> Am 17. Mai 2024 04:17:47 MESZ schrieb "Arınç ÜNAL"
>>>> <arinc.unal@arinc9.com>:
>>>>> On 16/05/2024 23:48, Frank Wunderlich wrote:
>>>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>>>
>>>>>> After commit 868ff5f4944a
>>>>>> ("net: dsa: mt7530-mdio: read PHY address of switch from device
>>>>>> tree")
>>>>>> the mt7531 switch on Bananapi-R64 was not detected.
>>>>>>
>>>>>> mt7530-mdio mdio-bus:00: reset timeout
>>>>>> mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with
>>>>>> error -110
>>>>>>
>>>>>> Fix this by adding phy address in devicetree.
>>
>> Frank, am I right assuming the regression is still present in mainline?
>> As from here it looks like for two weeks now there was no progress at
>> all to fix this (or I missed it, which is quite possible).
>>
>> Makes me wonder if the maintainers should revert the culprit or if the
>> arm64 dts folks should accept your fix despite Arınç ÜNAL's (who from a
>> quick look on lore hasn't posted anything for two weeks now) comment.
> 
> I'm not against the patch. I'm against the logic it entails on the patch
> log.

In that case: can you maybe help Frank with writing something better or
submit something based on this patch to resolve this and make everyone
happy?

> I had already submitted a patch series that would've prevented this
> issue back in 14 March 2024 [1]. I've asked numerous times for the patch
> series to be applied [2][3][4][5].
>> Eventually Daniel asked for some changes [6]. But I won't have time to do
> that anytime soon and I think the patch series is good enough to be applied
> as is.

Then I guess we need some other way to resolve this in mainline to unfix
Frank's device. The two obvious options are afaics:

* revert the culprit (868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY
address of switch from device tree")) and reapply it in a later cycle
* apply Frank's patch (or an improved one) in this thread (and if needed
revert it when some better changes emerge.

Arınç ÜNAL, could you please comment on that and ideally handle the
necessary tasks, as it's your patch that causes the regression.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

> [1]
> https://lore.kernel.org/all/20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com/
> [2]
> https://lore.kernel.org/all/ff196055-ecd8-4563-bc01-ff2533a07109@arinc9.com/
> [3]
> https://lore.kernel.org/all/a60fc16d-4236-427c-b4a8-ec6fdf62d9f0@arinc9.com/
> [4]
> https://lore.kernel.org/all/facb8204-c2b3-4084-a2e3-4fbf3a3fdc9d@arinc9.com/
> [5]
> https://lore.kernel.org/all/44e366ea-964a-4515-9027-2a2edfe12512@arinc9.com/
> [6] https://lore.kernel.org/all/ZixU287DdhvRyZBe@makrotopia.org/
> 
> Arınç
> 
> 

