Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4C6C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmUQ9AU5MTRMPEErZmQ/5DPCCW/8oUmeD0bDn1GwqDg=; b=p20/nEb830nMcW
	agdZBtiS9uF9PlffUTtSVES2OaCflv/puuDduAnIjv/sT1o3EdqInwjXdoUzXW0WMHQr9Gt7IMok9
	MUSRvg7xwzL3FkXaRleDGY0M3Z9SeaCHV9hUbAwONGOJf7fvqNCypi3viSDaTse5Jx29ZUsJkw+lD
	E76sqRHdZ8CvTLZaDyH1qGewdJqM02g+tgaJ7jp0W2yosf8vGcLW2xvyc8eerPYIOnjy2kBP9AS44
	WBG6l0wzX2VmuSg+fIzZcMHJDwWGU23akTOXwlXVpke4Sb6HJI9IMdFDbxy4PO39bgg5DSVnfmgUc
	qNHrW4kLp5LF/oJJLdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q16eO-006rIN-2a;
	Mon, 22 May 2023 14:36:40 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q16eL-006rHE-1d;
	Mon, 22 May 2023 14:36:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684766124; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=h2hzkdS2CI6Z+pFM1kk69pxUImMUae+stETe0LFWQpY3nN4k73ZS9zxQvqCUt6ejUdoaX1fEjqxjoVadSMjm2f5NdQWRitO/CN9/YtGmTMoL7gKJ62t/+PYyxjgKnMOS1MKJ223NTlKbNm+3UBBu0mmEWFiKHzVm5UCwbUMSl+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684766124; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=XmUQ9AU5MTRMPEErZmQ/5DPCCW/8oUmeD0bDn1GwqDg=; 
	b=jOmPbhFySazqUQwztCzWg1vcyKLAXA8pdLZTW50DIejvxQbpBM+zC4SS+3jkKEiqqYgyUaL82z1jxSUNJbb+yUfQZ1ZBj3Ihl3nRQqhfRev4+31o2GrUghHY3n4I959/E5yLozkP7smPit5TMig8Qa4GC0f+TbWw5pWiMSdbiFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684766124;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XmUQ9AU5MTRMPEErZmQ/5DPCCW/8oUmeD0bDn1GwqDg=;
	b=NSSwN/B8POoWFVP+y7ZKK0vvVKDrbQwLyFkWPfDkx/OnEb+XY2x5f40rD4mlqmS5
	pKkZnDbTaJYFoia/98nQHQbp9qPR86IBCR4eZdzGDC4azjLEf63GQR2wrwDgna56HLc
	uQu4OHRw1kiClzHsrUWGmSgJd5lGAmVBUttAOtuU=
Received: from [10.10.10.122] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1684766122962358.61257803096214; Mon, 22 May 2023 07:35:22 -0700 (PDT)
Message-ID: <87a5f9bc-f230-243b-e77c-9ae849008fb5@arinc9.com>
Date: Mon, 22 May 2023 17:35:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
To: Horatiu Vultur <horatiu.vultur@microchip.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522140917.er7f5ws24b2eeyvs@soft-dev3-1>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230522140917.er7f5ws24b2eeyvs@soft-dev3-1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_073637_624070_60CAA13C 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/05/2023 17:09, Horatiu Vultur wrote:
> The 05/22/2023 15:15, arinc9.unal@gmail.com wrote:
> 
> Hi,
> 
>>
>> Hello!
>>
>> This patch series simplifies the code, improves the logic of the switch
>> hardware support, traps LLDP frames and BPDUs for MT7530, MT7531, and
>> MT7988 SoC switches, and introduces the preferring local CPU port
>> operation.
>>
>> There's also a patch for fixing the port capabilities of the switch on the
>> MT7988 SoC.
>>
> 
> I have noticed that in many patches of the series you have:
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Where you also have:
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> I think you can drop Tested-by as the SoB will imply that. I think you
> got a similar comment some time ago to a different patch series.

Yes, that was for the net, therefore the stable tree. The very first 
rule for the patches going to the stable tree is that the patch must be 
tested.

I don't see a clear indication of the patches submitted to net-next 
being tested on the relevant hardware by the author. Therefore, I 
explicitly put my tag to state it. Let me know if you don't agree with this.

Arınç

