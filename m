Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301FDC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nkz3gGspeeY9dH/8hh4d0Lg8dzAyUxZH+rMD5cbi76Q=; b=SPQ9UBARWMvOTU
	230dbZ0EyBGQea4ntRmj8o9qZDpbW6/l0rA40rFrQSDuq6giPKK+K2GECd5ui23SmGYlxDssOrz9T
	At5KBq3n4fgu3VZI9HJ3x0XSJsz2nAiWXBuLTXS8PfjB92+5cW7EiwVondtHNWxY0hWBWhdiEFafP
	5MM6c7HhK0ezsnUXMlVZ3kChBUuCFIxMo8+dHWUv1xWphvf/tqkm5IKKe5Hl6Vg9H98h4TyvgwuBq
	PdpLhGiEIHG4MaaTeMeek8Te0GVRuHD+2ADhbKyF5n7MnpQv3zehhPi5oGsTI5jbcIH0IchqCKxFS
	eXLgnHYZ0/GhLjWtUZjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAke-00CrAC-JX; Mon, 06 Mar 2023 13:19:40 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAkb-00Cr7r-FZ; Mon, 06 Mar 2023 13:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678108740; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Usc3U+m036F/GJenU64yhcHJ8sB418nOyXsbOtEEUn8L3x9A+iWdTgdif8J72KUw1wKBVSaTD6A8GZuS5VUcz+EZz2an05h9z3xQQ2+G88/AJHv1zGLE3wyF7GsOMTmJECeHZJEsGyQu4DEdt4u1ETKA2iiAxAjGSTVqZ8B2TTE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678108740; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Nkz3gGspeeY9dH/8hh4d0Lg8dzAyUxZH+rMD5cbi76Q=; 
	b=eKKf8WJHxq5qUXctP7ya8cfq+YKfhDkxWk6r9ixeXhfE6asJMNPJeWRm16Q4MGuj8/NS7f3yls8UqQSV4CxMtGs0znXDeDdwjhfR6KTwCxIt7j5LVQwedVlSvsdpS4mhpqO9JvWddjboZ1yP2g/gpTnmaKKOUj1BXO7Gn6ovosY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678108740;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Nkz3gGspeeY9dH/8hh4d0Lg8dzAyUxZH+rMD5cbi76Q=;
	b=TQvFjc3Av3UVZaweaDW46VwAtfsWwzSysGoaqXS3z7xc8PFhOP9zaQ/qgb9SBGad
	3VIrQrkSsViV7yUUhAVhMxeZO8CfiHONB4D74GXLnxLxMiw0XyZfItszzBz7jX/+N/U
	3NnEv6ze6nbxOoE7LC+cdirgYtt0NnERRleCJxOY=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678108738745306.70357433678555; Mon, 6 Mar 2023 05:18:58 -0800 (PST)
Message-ID: <bdb31e6c-bb47-b637-cfbe-fc1e987d07bd@arinc9.com>
Date: Mon, 6 Mar 2023 16:18:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6
 pad configuration
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20230304125453.53476-1-arinc.unal@arinc9.com>
 <ZANBwZryFXDEVEtG@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZANBwZryFXDEVEtG@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_051938_032499_75FD6872 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4.03.2023 16:04, Russell King (Oracle) wrote:
> On Sat, Mar 04, 2023 at 03:54:54PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Move the PLL setup of the MT7530 switch out of the pad configuration of
>> port 6 to mt7530_setup, after reset.
>>
>> This fixes the improper initialisation of the switch when only port 5 is
>> used as a CPU port.
>>
>> Add supported phy modes of port 5 on the PLL setup.
>>
>> Remove now incorrect comment regarding P5 as GMAC5.
> 
> If this is what is necessary, you're taking some of the configuration
> out of phylink's control, effectively making port 6 a fixed-interface
> mode port. In that case, there should only ever be one interface
> mode set in port 6's supported_interface mask, so that phylink knows
> that no other interface modes can be selected for that port.

Thanks for the heads up Russell.

Arınç

