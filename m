Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2A9C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 21:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAwTr4O+qa08St3yRauD1SYHdR3S9sJkSbpqbDz0KMc=; b=pbeoQ0JF30RD9w
	fhchRYhmwrEwtgKHrCRariku3hv45FrPZzbrq3ClUoM4vw7rky1tE5crCYOghfdi3o/0cFqxZGKB2
	add2UUQyuq/6CUrzJv+LHo8DO24fM4Hv6/SySw8QZlEKZ+3dGKTkYKdf+/KVvwTUXlcVt56xFJSq9
	6Byd6j0lGHGHwjTMSfbVyKga1rPUKP8i6GSparQKCXJ5jgSntEKALaJg1bu5jKEcEzisCJN5mrZ8m
	m0pM52k5NrsZBIlVX9FvkThffpB/BXmaqY/t3p4/ZgpF4ax0YnrEgwFlLHa8mNPSHLqZ7ZM7YSJTg
	BTGV0q4WuFGsWCUajD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgufs-00CSHL-0P;
	Mon, 27 Mar 2023 21:46:44 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgufp-00CSGf-03;
	Mon, 27 Mar 2023 21:46:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1679953572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S8cnUlpZue2d3XspE8TCRLNnx+YWi9gHt55JRvyNyWG3JRVe4KqSRcVnGBD65NOInrMXWqMwmumZ5unboKOHfW8FTFA47dJ7v68KCKJ8TUApwV56WGXcRCxQBcjSWbbfemURsBFrxX8/krvJ4E3XdTkJtL8gJOYYXPhUl+IXScQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1679953572; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=tAwTr4O+qa08St3yRauD1SYHdR3S9sJkSbpqbDz0KMc=; 
	b=MVVXQL1aLb8AnpioAA3Jpdc8daw9YX08FkGu2+XqDi9A7Ps7KniGpd3SZMnf5xua5PLNQoqqr6FT1lt19S6rwAQCa3AgEswrqaCj0AtPbjdmulTDCzZH7+jkFXItq4cSm0B+2JeX3EIE473RKrhRXxTDU1kzus9ShWG35DTNwGc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1679953572;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tAwTr4O+qa08St3yRauD1SYHdR3S9sJkSbpqbDz0KMc=;
	b=Qt0IOQwNF4C6kbSKTMJX40pfut0MvBfMP2Lz+psriW8MmpQogvWWUJuhpjluSlmc
	KGF3Fo8rtZY/ZJYM7BCVNt9ERS5O+67cVthyTBed8QfIWH73XlQYTWP4k10dUXJLcnM
	dxGj8epl5tZAYQoYNpCMYT/m0ES/J07QkxR77Yjw=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1679953571602159.85533940011294; Mon, 27 Mar 2023 14:46:11 -0700 (PDT)
Message-ID: <0df572f4-2d8d-3c05-cf8d-d3101b223b09@arinc9.com>
Date: Tue, 28 Mar 2023 00:46:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net 3/7] net: dsa: mt7530: do not run mt7530_setup_port5()
 if port 5 is disabled
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-4-arinc.unal@arinc9.com>
 <20230326140818.246575-4-arinc.unal@arinc9.com>
 <20230327185611.gjwlrmhaiorfpj5q@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230327185611.gjwlrmhaiorfpj5q@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_144641_100284_85448E52 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27.03.2023 21:56, Vladimir Oltean wrote:
> On Sun, Mar 26, 2023 at 05:08:14PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> There's no need to run all the code on mt7530_setup_port5() if port 5 is
>> disabled. Run mt7530_setup_port5() if priv->p5_intf_sel is not P5_DISABLED
>> and remove the P5_DISABLED case from mt7530_setup_port5().
>>
>> Stop initialising the interface variable as the remaining cases will always
>> call mt7530_setup_port5() with it initialised.
>>
>> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> Again, not sure what is the problem, and how this solution addresses
> that problem. I see Fixes tags for all patches, but I don't understand
> what they fix, what didn't work before that works now?

It really depends on what you call working. Does this patch fix any 
feature of the switch that didn't work before? No.

Does it fix a bad logic introduced with the said commit? Yes.

Arınç

