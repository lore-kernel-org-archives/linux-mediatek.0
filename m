Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68114C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvDhOl1G2Z707RGHPlxQe1Kar9gOS7R/lxC7nBW4SMc=; b=ZqHhruvY5RL0Fz
	j3JtPRp0xLTlwREqxEfa87qnSUhgibwjtvU32Ovzdek3gTLd0NGgXIbFl3VEERh9GFuM5DTqhMdMC
	oJDXXZjocR08wDAuI7PmFRASRH0pPgjSs/B9woxv0q3kwhM/GupXk6nHfofAYvSWctlB0d+VBTOLK
	+8nRfa++1uHJoUoEeHpXMkHBhLCxjbAaE8GLoXlT18R7NWqHepRWgS7y2FnJxRHx60mXA0SLPurT+
	tFxtWsjH+jKv3oYxK/rqel6nb5Q16if41hBGrTw+8JJY/oHGTMohEAEt2wJ7uHbDkjH2ITe7OUgWJ
	D3PQJKdT43Jj5HnjrAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGziB-00000008dwX-11wf;
	Tue, 11 Jun 2024 11:30:47 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGzi5-00000008dte-3lNI;
	Tue, 11 Jun 2024 11:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=GvDhOl1G2Z707RGHPlxQe1Kar9gOS7R/lxC7nBW4SMc=; t=1718105441;
	x=1718537441; b=lMZW0wokCmxuyHX8LvluTbNLniPBrAZ/NwBSbnJVXjqiYRri9rrVQQnxAyaS8
	DsG6sOKhfFsQiH5UCYGaGU2iFk3l8qYYc67pJkAKjpcrdk+N+0ASAiXcV2Zy/7uRfYl7pRiI13g3b
	FTjbm0P9ogdHEYZ1p0t2m9OIbUebUSA2o6UNOzSHYKB6UQaG68UgGFhlZfXK0pURJ2QDOQCRHlibD
	lz2wcwl9XnJRq6+lyy85MXKwmmOxoZOHTowXCIaBEkUOxsbVGV0aqOojwbxkkW3sFJxtulBcWbmoj
	4vw863F2fy+HgHAnghqjD9cfBBN1Vgm0oLy+g4i6PlqtxOdtIA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sGzhu-0002Et-5s; Tue, 11 Jun 2024 13:30:30 +0200
Message-ID: <e92c3ca0-c9be-44ac-a4fc-57ca5ebedbc5@leemhuis.info>
Date: Tue, 11 Jun 2024 13:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
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
Content-Language: en-US, de-DE
In-Reply-To: <b49c801c-6628-40a6-8294-0876d8871ba7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718105441;519fbc12;
X-HE-SMSGID: 1sGzhu-0002Et-5s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_043042_351833_501F77BC 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: devicetree@vger.kernel.org, Linux regressions mailing list <regressions@lists.linux.dev>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07.06.24 16:15, Thorsten Leemhuis wrote:
> On 07.06.24 16:03, Paolo Abeni wrote:
>> On Thu, 2024-06-06 at 10:26 +0200, Thorsten Leemhuis wrote:
>>> On 31.05.24 08:10, Arınç ÜNAL wrote:
>>>> On 31/05/2024 08.40, Thorsten Leemhuis wrote:
>>>>> [adding Paolo, who committed the culprit]
>>>
>>> /me slowly wonders if the culprit should be reverted for now (see below)
>>> and should be reapplied later together with the matching changes from
>>> Arınç ÜNAL.
>>
>> FWIS I think a revert should be avoided, given that a fix is available
>> and nicely small.
> 
> Yeah, on one hand I agree; but on the other it seems that the
> maintainers that would have to take care of the dt changes to fix this
> until now remained silent in this thread, apart from Rob who sent the
> mail regarding the warnings.
> 
> I put those maintainers in the To: field of this mail, maybe that might
> lead to some reaction.

Still no reply from the DRS folks or any other progress I noticed. Guess
that means I will soon have no other choice than to get Linus involved,
as this looks stuck. :-( #sigh

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

