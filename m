Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8DDC3065A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:Reply-To:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXyGQ5yDjGp7ZJaBVw0haYA/oXbMVh7sNoBQsxpRsYs=; b=PwNl641KT34ZzEekQbwgTov9xt
	23+lZxOOXD//L+q318+hrO0hIQ0l1/9Zt4HhGsVc6yZAk6zwVJavMWvERNqVV8yM+W+G/ibMf4Z/E
	DLTNg0krVgvygFzCEdVm5cPII9w1aiRGS/1LfUn/ZarOU2OQG7XXG6atsAPmo15bqWIqCCLgGxDFZ
	vxBWf+2GmXeM5N/4Y037HvrhQoE4KAMTJnxKtpXG5jUimGkNTQ2tlyHhj8BzzK88K4PaCPXoHNhqM
	uNJ4cuimePhBOgDEe0hSKoKqQkE0unLVxJ8BUNYIToWW0IpG5Oam1OWydEzXx7kVr0mXY2IhHYNOA
	BuEiadbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOALU-00000001qn0-16xq;
	Mon, 01 Jul 2024 06:17:00 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOALI-00000001qhl-0I1f;
	Mon, 01 Jul 2024 06:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=fXyGQ5yDjGp7ZJaBVw0haYA/oXbMVh7sNoBQsxpRsYs=;
	t=1719814608; x=1720246608; b=ymabvI5u7tc1eVtvjro2WyrqbNJyuhF+EsOCe3Rfk1dF+qG
	MoB0gNr2nryWy8JLMs1KJAFZ9dv+ntUSRqKtTswkwCZKfBQTALRdPIRqwLRYsK7GZbCT1zZUwQ675
	jKjiz9eET3P5apn+Ii0HIif0KVasEJUqrL152a/EmUNJf1xyu2Pgv8FfTzb80MBtqxFH5vRO03Sdi
	fiP98ce1BfyBlj+1wu+SNMimb90rmWreTMncT9H8rCBD9BuitiCNDawJ7SGtMRjKToKd1sbh/rpeg
	Qi+sl/TXAPD/eJmBMcuyfwWf/FOZthvKnh6CaNOo48nqUzEBED4IvPqSDr++3s6A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sOAL4-00045O-IX; Mon, 01 Jul 2024 08:16:34 +0200
Message-ID: <cebb10b8-b0bf-4cb7-bba4-c3f941ba2b82@leemhuis.info>
Date: Mon, 1 Jul 2024 08:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jakub Kicinski <kuba@kernel.org>
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
 <9c498e37-df8b-469e-818a-9b1c9f2b1a3c@collabora.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <9c498e37-df8b-469e-818a-9b1c9f2b1a3c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1719814608;cf262ae2;
X-HE-SMSGID: 1sOAL4-00045O-IX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_231648_281886_BD41C151 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Linux regressions mailing list <regressions@lists.linux.dev>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[CCing the other net maintainers]

On 25.06.24 10:51, AngeloGioacchino Del Regno wrote:
> Il 25/06/24 07:56, Linux regression tracking (Thorsten Leemhuis) ha
> scritto:
>> On 17.06.24 13:08, Arınç ÜNAL wrote:
>>> On 17/06/2024 11:33, Linux regression tracking (Thorsten Leemhuis)
>>> wrote:
>>> [...]
>> It looks more and more like we are stuck here (or was there progress and
>> I just missed it?) while the 6.10 final is slowly getting closer. Hence:
>>
>> AngeloGioacchino, should we ask the net maintainers to revert
>> 868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY address of switch from
>> device tree") for now to resolve this regression? Reminder, there is
>> nothing wrong with that commit per se afaik, it just exposes a problem
>> that needs to be fixed first before it can be reapplied.
> 
> To be clear on this: I asked for the commit to be fixed such that it
> guarantees
> backwards compatibility with older device trees.
> 
> If no fix comes,

I haven't see any since that mail, did you? If not, I think...

> then I guess that we should ask them to revert this commit
> until a fix is available.

...it's time to ask them for the revert to resolve this for -rc7 (and
avoid a last minute revert), or what do you think?

> I don't like this situation, either, btw.

I guess none of us does. :-/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

