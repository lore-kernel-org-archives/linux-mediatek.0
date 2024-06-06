Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7225C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 09:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmeK62SoIdnIVPwJAA1ZxGyQbY0oIueNKztx6sdjWRM=; b=gmdVFyNNLTFMTA
	SAJOr9JcL/3aUehuguwEnJOgTQOylq8XAITLgcTXy43HchOjZYmuVfZsAkhe2ntC2Q4oNaHJXpRro
	kfwnCmMVblaNlItRFrtm9NWW/SXw59k72GZSenz5rIrTkaM2eCtwiLL6AlkWuoaiJb+KgP+HFJaF6
	Zp2raQv/H9nobCIlrPmr+dDLgJMCbqv+XiOUAQHez426WktgmwNlYWczNb1Kc1To30DQUVHnOfWgP
	4PZPEbIxTwLnTJ4Pdw2HnIRI1PJcf8EkQu2I38gEAWRWNdLev7ZrPxBWRf8C6o2woL2YmcUuWYW79
	0Zxt2mH6UDZlMNK4dRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9WK-00000009D7V-10aQ;
	Thu, 06 Jun 2024 09:34:56 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9WE-00000009D3H-0PBU;
	Thu, 06 Jun 2024 09:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=kmeK62SoIdnIVPwJAA1ZxGyQbY0oIueNKztx6sdjWRM=; t=1717666490;
	x=1718098490; b=z6RuvABdv2NiFpxL6aRgYsg8PRV1mvYsOp5MKs9tviuUmpgN2b4zXBQWkO5JN
	H7CDGc8joOgApt6+Ki4z1teFCz2hI5ZQsI4tsNDFmKsL8XUZBIDI9vDnshubyIYeunF2//MBjELTP
	d4K/g7/+cQQHlMpk9eCD73svkRUWnaAU+tXk9ZdmBb5waBLMa06QMLTHmc/yYjpaPNO2vEYg/MPpI
	ALwJ46p2gDLs+euhmODkXAX4f3pIMFRs5mtxMOXwUQjkRZvUOmwd5DZjz7Q5qqYyzTKrsMXJLS4o6
	gCRMU/jZ/md1sGJwYbMU8sW4Ak+MmtZmgjLUvAvApYl2NEPmZw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sF9W3-0004z8-HD; Thu, 06 Jun 2024 11:34:39 +0200
Message-ID: <cee5e4ee-3d67-4eba-a790-c0c016cee937@leemhuis.info>
Date: Thu, 6 Jun 2024 11:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Paolo Abeni <pabeni@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240516204847.171029-1-linux@fw-web.de>
 <a29dd7d1-40a8-4c88-99aa-651a3305b640@arinc9.com>
 <5AEE5668-0C8E-4EE4-A398-66CB99DF5650@public-files.de>
 <43aacd9d-b851-4100-8ccc-878ac6ae10f8@leemhuis.info>
 <698cf562-1ca9-4aa3-be7e-a1474b612c5b@leemhuis.info>
 <0cba095c-3d55-416a-a7ad-b359129731cf@arinc9.com>
 <714da201-654b-4183-8e5e-8ff0b64fe621@leemhuis.info>
 <0ae387c1-31b2-4e87-aa7d-f98e3c90e985@arinc9.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <0ae387c1-31b2-4e87-aa7d-f98e3c90e985@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1717666490;2a68f9e9;
X-HE-SMSGID: 1sF9W3-0004z8-HD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_023450_712910_05B4173D 
X-CRM114-Status: GOOD (  23.86  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Linux regressions mailing list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06.06.24 11:01, Arınç ÜNAL wrote:
> On 06/06/2024 11.26, Thorsten Leemhuis wrote:
>> On 31.05.24 08:10, Arınç ÜNAL wrote:
>>> I had already submitted a patch series that would've prevented this
>>> issue back in 14 March 2024 [1]. I've asked numerous times for the patch
>>> series to be applied [2][3][4][5].
>>>> Eventually Daniel asked for some changes [6]. But I won't have time
>>>> to do
>>> that anytime soon and I think the patch series is good enough to be
>>> applied
>>> as is.
>>
>> Then I guess we need some other way to resolve this in mainline to unfix
> 
> I don't believe we need another way to resolve it. I've already told that
> the patch series is good enough to be applied as is and I don't see any
> responses with reasons against this here.
> 
>> Frank's device. The two obvious options are afaics:
>>
>> * revert the culprit (868ff5f4944aa9 ("net: dsa: mt7530-mdio: read PHY
>> address of switch from device tree")) and reapply it in a later cycle
> 
> Sorry, no. There's nothing wrong with that patch. The actual cause of this
> issue is the patch that introduced this device tree source file with the
> wrong PHY address.

Was that also merged for 6.10? Because if not, then what matters here
afaics is what patch exposed the problem. Of course ideally we wound fix
that problem -- but if nobody takes care of that any time soon it might
come down to a revert of the patch that exposed the problem. At least
that how Linus handles these things afaics.

>> * apply Frank's patch (or an improved one) in this thread (and if needed
>> revert it when some better changes emerge.
>>
>> Arınç ÜNAL, could you please comment on that and ideally handle the
>> necessary tasks, as it's your patch that causes the regression.
> 
> I don't see any necessary tasks for me to handle. AngeloGioacchino Del
> Regno whom is the only person I know that maintains these device tree
> source files can simply apply the patch series that I have already
> submitted and we can all move on. I haven't heard from them whilst the
> patch had been waiting since March. So I'm not sure who's going to apply
> this patch, and to which tree.

AngeloGioacchino Del Regno, if you have a minute, could you please
comment if merging those changes for 6.10 is an option?

Ciao, Thorsten

