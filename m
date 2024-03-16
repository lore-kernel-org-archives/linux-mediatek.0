Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5CEC54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 15:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14PPGHlwquM9FtQB61Tgvee0kwAHbcVyLM/4EWK6FbM=; b=o9g+yYYTqocbjDkwEFjbCeNcE3
	ImQ6J0Xx0ZifTYYINp9ya1OpqKTgWz9WFTWJ5s8PlFwZCfZG751SO4zXvIb3OEnjUr1npx7jnvVdn
	86DJZk5pk1QGrU28E1+hd5Y2A4A/OmVqsQVynRm08GRcXmvMfAOejcAFJ52irEMCsOpldfpZrY+jB
	6nTiJxoL0qnCZCWoQS/uG1eJIGcYxn/J4zJuBwjgMqVFxqZUlj27e9K4h3WqBjxAsOYnMi/ZCuix5
	nlS+M2RlX7zv9CWvpjZNao6qjBfVSkA6Cg5ItdvbwbrXt+p96+QKjx1fQaWnhHL34aATQogoCGQ6m
	rYvw4/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlVlw-00000003LSr-41Ox;
	Sat, 16 Mar 2024 15:16:32 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlVlq-00000003LRr-48Bt;
	Sat, 16 Mar 2024 15:16:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED03A20002;
	Sat, 16 Mar 2024 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710602182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=14PPGHlwquM9FtQB61Tgvee0kwAHbcVyLM/4EWK6FbM=;
	b=Na64/poCupl4AkKi4SN9Jsi/boYqEvF9+dFwGvZocOEI360mcfckS1l/uCZuKD95CP9QHM
	PoGaMdImfpnFIZt0rVHwUNAnhveeIOO1hFjvnMhI1hLYa6jzLvwnXl5JduiZUBfUeInfTo
	GF/Z5K47NAwqmcT/PEgr6QmEBUOsJ2506Oa4xHfpRHe2WuLDaX20pne/ebq4vgNoErrPeC
	PzUDUzsTdZul+BLmRmoiCLfPyTyUaXXXoriOL1IhuqRP8hgJYZS84ZK9iN2nsaRIIvAoX3
	PMjf8qH4rYWuEYy0qPPwRWkPuuCnaheFD3ZaP+da2AFlLMOvduFyDJCOFrsAXA==
Message-ID: <3fe558d9-e231-4015-ab7e-85eac06aa971@arinc9.com>
Date: Sat, 16 Mar 2024 18:16:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <31b3d00f-6cf4-4bf8-ad78-a8354d57c518@arinc9.com>
 <c7eb79ee77542db3a539d8bb7719dba9@risingedge.co.za>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <c7eb79ee77542db3a539d8bb7719dba9@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_081627_351786_B5438A74 
X-CRM114-Status: GOOD (  17.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16.03.2024 17:03, Justin Swartz wrote:
> On 2024-03-16 11:24, Arınç ÜNAL wrote:
>> On 16.03.2024 07:54, Justin Swartz wrote:
>>> This set of patches was created with the intention of cleaning up
>>> arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
>>> the Devicetree Sources (DTS) Coding Style [1] [2] guide.
>>>
>>> [1] Documentation/devicetree/bindings/dts-coding-style.rst
>>>
>>> [2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>>>
>>> Justin Swartz (14):
>>>    mips: dts: ralink: mt7621: reorder cpu node attributes
>>>    mips: dts: ralink: mt7621: reorder cpuintc node attributes
>>>    mips: dts: ralink: mt7621: reorder mmc regulator attributes
>>>    mips: dts: ralink: mt7621: reorder sysc node attributes
>>>    mips: dts: ralink: mt7621: reorder gpio node attributes
>>>    mips: dts: ralink: mt7621: reorder i2c node attributes
>>>    mips: dts: ralink: mt7621: reorder spi0 node attributes
>>>    mips: dts: ralink: mt7621: move pinctrl and sort its children
>>>    mips: dts: ralink: mt7621: reorder mmc node attributes
>>>    mips: dts: ralink: mt7621: reorder gic node attributes
>>>    mips: dts: ralink: mt7621: reorder ethernet node attributes and kids
>>>    mips: dts: ralink: mt7621: reorder pcie node attributes and children
>>>    mips: dts: ralink: mt7621: reorder pci?_phy attributes
>>>    mips: dts: ralink: mt7621: reorder the attributes of the root node
>>>
>>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 430 ++++++++++++++------------
>>>   1 file changed, 239 insertions(+), 191 deletions(-)
>>
>> A well done patch series. Thank you very much for doing this!
>>
>> Arınç
> 
> ++ for reviewing them all.
> 
> As you have at least one board that features an MT7621 SoC,
> please may you (and anyone else willing) take a look at a
> patch [1] that I've submitted for spi-mt7621.c which allows
> GPIO chip select lines to be used as well as the native chip
> selects.
> 
> There's already been some back and forth with Mark Brown about
> the initial version of the patch (the linked patch is v2) and,
> of course I messed up how I send v2, as you'll read in the thread.
> 
> It seems you weren't included because I rely on [2] to determine
> which people to address as maintainers when sending patches.

I'd prefer not to be involved. It's not my area of expertise.

> 
> Is there a better approach for populating git send's --to argument?

This is how I used to submit patches before I started using b4 [1].

git format-patch HEAD~X --subject-prefix "PATCH (RFC) (tree) (vX)" --cover-letter

./scripts/get_maintainer.pl --norolestats --nol --nor 00* > to.txt
./scripts/get_maintainer.pl --norolestats --nom 00* > cc.txt

git send-email --no-chain-reply-to \
--to-cmd="cat to.txt && cat > /dev/null" \
--cc-cmd="cat cc.txt && cat > /dev/null" \
00*

[1] https://b4.docs.kernel.org/en/latest/index.html

Arınç

