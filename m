Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73859C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kxiz5zm70BezbuNN8v6JP8irFq1B+lspoXHQDQtRgY8=; b=vR77KGVvc91OKr
	0ECL+hLjGgi/+E2BFDD0EgrkC+cFc3v+znlefWRQuLlAVWWstqwd4zezcH0f2piOL0gIjYALAupd8
	BLdtm7aOHc7L0U1pg1rPNHt0bCyhSXdrHOwtMzGXvPRFm6rR6N6GdtEISQwnAFsBpNhz3415Ys9Oi
	28xQh8cl50Rs6dgEdjDwpTvKQXGoeE2/JsfxM3TEcUoSn4GxIs9meAAKS78NxjIh6w/FK6ynCy3UX
	Z7kakWcTGvaAv95qE9c9Dp7hdhcBXKoU4JoMj4dNmPMxG0qTxFV3YmU9BxhH6xu7XYQnS4QxaJx9F
	FuS4hchb6bFJTjkj7jiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5i10-00BXBj-2m;
	Sun, 04 Jun 2023 07:19:02 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5i0w-00BXB6-35;
	Sun, 04 Jun 2023 07:19:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685863111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Du25Szoeq7xfXqGzr1DFoJ2H6FK1MGnor4r1Es1MjuKbi/OTLokEFgD9W8YMF8dDhi2/haKqJBQwx2Klwg9E2BcZzkrq1MMdaUPR3tMyRsZ0i7/2jBU4tZ4ApncIU97x2LB3n/tVsy3ByEqgQqbidck0MKZtElHu69xauBwRnwU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685863111; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kxiz5zm70BezbuNN8v6JP8irFq1B+lspoXHQDQtRgY8=; 
	b=IZiqA7xnNyrietBNPyKPoWFW5JgzzXWn+ffU/xeZ4iwTU0Er7pX4JSF5sommXubs/yARDCDyBx0tc3TYIUVHS5KJX3jFK4KWc+Emez4OF+lsxNB4fZdztXbE3uxvTlbGleKGe8+vtGn3Ac3LIQh1JQemQ8lutcmALSqDXlc7Xr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685863111;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=kxiz5zm70BezbuNN8v6JP8irFq1B+lspoXHQDQtRgY8=;
	b=WqnPFherLeb3ujWwy+TWDONE0esDoCe9Hni1i8msdr7WjxD3Rld6yT243QyesWW8
	FSsar+Kqm3hVIkvyFZ9VvLJXVdMsavztoFI1xafRplkHthXrzTms8qVVNNRlQc+y5eb
	i7ot0nsqDNtRoxUbjYPJY0NPDUXOaN4JjhBd/QgQ=
Received: from [192.168.83.218] (62.74.60.162 [62.74.60.162]) by mx.zohomail.com
	with SMTPS id 1685863109616710.6883935588407; Sun, 4 Jun 2023 00:18:29 -0700 (PDT)
Message-ID: <4d2bd4fb-923a-96c9-395c-5e2127695933@arinc9.com>
Date: Sun, 4 Jun 2023 10:18:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 19/30] net: dsa: mt7530: set interrupt register
 only for MT7530
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-20-arinc.unal@arinc9.com>
 <20230526132508.fxgljrpozuuzelal@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230526132508.fxgljrpozuuzelal@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_001859_054179_69C9C7A9 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26.05.2023 16:25, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:21PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Setting this register related to interrupts is only needed for the MT7530
>> switch. Make an exclusive check to ensure this.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Acked-by: Daniel Golle <daniel@makrotopia.org>
>> Tested-by: Daniel Golle <daniel@makrotopia.org>
>> ---
> 
> Why does it matter? What prompted you to make this change? I guess it's
> not needed for MT7988? Or the register is not present? Or?...

It's not needed for the switch on the MT7988 SoC. The register is also 
likely specific to the MT7530 switch.

Arınç

