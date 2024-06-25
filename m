Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4709C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQcRzQLnkaoL4wQYeJunaQ65bdPeTfuBgWQEOy5uOio=; b=rYiDbFphMrs1dN8lXJJA1NqqMk
	DhL9qj+3aB5aGj3IUb5p9OeRpEV9hA9jWaZkXYDiF+pAfuVukiEBQYUzeKCLOOwyMuPv4/2wC3n70
	I2P0H1KjnEiV973/4ieniuEw4G628sdVlsZZ2oenhiLsnKxjTGMYmXt/rYlwPF1XglPliNWPXu9He
	2g3k2zwVe0zEsY89+okEa1MFn2Vydl0umuR6jv/2TFGlqybXwv4TuPUI3qq3nIRmQaxUySI/xjEjY
	1d8p5TZZRZ1n1BLWVbYgloJ9sIdLRpN+7GyFVXB2Z503MDVlyicuGc71hPikqK05qSgghrfI2C4DZ
	rPC0M2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM97y-00000003iOk-1WXa;
	Tue, 25 Jun 2024 16:34:42 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM97q-00000003iNb-0R40;
	Tue, 25 Jun 2024 16:34:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 396D8FF803;
	Tue, 25 Jun 2024 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719333270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lQcRzQLnkaoL4wQYeJunaQ65bdPeTfuBgWQEOy5uOio=;
	b=l2EvxNj/BT8ncbykHU91+LRRiUzl33lqWsvlnnM4JkFyhh55Iftxu8T539KpXS/vCTv8np
	hLMSBio9L9ApDHU5iw9ud2Ly0lkOgG5yDaLKnwet7/1BHan6kIReJRIshUqymxxriU91fM
	RCoA6AVahsPAPVX1m8tlGpNzhugGODLwdblnhchPqbVV851VrHTpzRCWq+5AX5Fuwdrkew
	JYeeBIO7Fq+00JENHd5RrSlggUYOpK/keIpOrhfnsEYtahun4655uE5TXlggSlEcH7GdAB
	FmUQi8dNMnlWoBGzgo1A4ZBmSb8HTAeHyfBLAvKLR/Sv3YIxXw5DXaOhLguzlQ==
Message-ID: <12446d57-8a88-472d-845a-58ee603cedcc@arinc9.com>
Date: Tue, 25 Jun 2024 19:34:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Minor grammar
 fixes
To: Conor Dooley <conor@kernel.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
References: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
 <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
 <20240624-radiance-untracked-29369921c468@spud>
 <68961d4f-10d8-4769-94d3-92ce709aa00a@arinc9.com>
 <20240624-supernova-obedient-3a2ba2a42188@spud>
 <a17f35ae-5376-458a-b7b5-9dbefd843b40@arinc9.com>
 <20240625-surfboard-massive-65f7f1f61f0d@spud>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240625-surfboard-massive-65f7f1f61f0d@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_093434_318134_1F7F89E8 
X-CRM114-Status: GOOD (  11.63  )
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

On 25/06/2024 19.16, Conor Dooley wrote:
> On Mon, Jun 24, 2024 at 08:11:10PM +0300, Arınç ÜNAL wrote:
>> On 24/06/2024 20.02, Conor Dooley wrote:
>>> On Mon, Jun 24, 2024 at 07:59:48PM +0300, Arınç ÜNAL wrote:
>>>> On 24/06/2024 19.29, Conor Dooley wrote:
>>>>> On Mon, Jun 24, 2024 at 10:00:25AM +0300, Arınç ÜNAL wrote:
>>>>>> On 24/06/2024 05.58, Chris Packham wrote:
>>>
>>>>>>>        and the switch registers are directly mapped into SoC's memory map rather than
>>>>>>>        using MDIO. The DSA driver currently doesn't support MT7620 variants.
>>>>>>>        There is only the standalone version of MT7531.
>>>>>>> -  Port 5 on MT7530 has got various ways of configuration:
>>>>>>> +  Port 5 on MT7530 supports various configurations:
>>>>>>
>>>>>> This is a rewrite, not a grammar fix.
>>>>>
>>>>> In both cases "has got" is clumsy wording,
>>>>
>>>> We don't use "have/has" on the other side of the Atlantic often.
>>>
>>> Uh, which side do you think I am from?
>>
>> Who would call it clumsy to use "have" and "got" together for possession...
>> Must be an Irishman! :D
> 
> Okay, I was just making sure you weren't accusing me of being
> American...

Wouldn't be a bigger insult than calling you British anyway. :D

Arınç

