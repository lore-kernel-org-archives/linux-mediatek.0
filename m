Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947B0C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 21:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHEWJ62o/VJ8EVGCBg+hnZDPaMdn8ffAQGXXQugTBr0=; b=PxtKbljlRKECgX
	9PoXiEUDtyF5z6bTvd/OLdc4ODXfdtxfRdwCOKNZBGcwXbd6xZoK0C2efXscVPq/MNNSqg46n2JLV
	+u2MHSoqpq2x12O7NrSv5ze7ObRHEj9Gi/2Cf1yrhhh3WUR/+T0M/4WhdZ39GGgh9ztKb79s5l86L
	xeDjh/yM0WkMEQmc85wVYKjqmX5Q031P73eQVS4KomPd9c554AsGp9DNShO/2mOX+7tYIfkzq4JMF
	4hvvg49l4w/pT6g2Fd1QWuoXr9jEIxC5v4hzIcm+JoOqFhd59qUwF2kY/j7tW7mFkiSJTPgKbqufU
	xBQwTVs8rLKK+3P61cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZebt-002ULQ-MD; Tue, 07 Mar 2023 21:12:37 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZebi-002UKD-Ml; Tue, 07 Mar 2023 21:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678223483; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ETjq7rbMswQJ2j1BHDNrQSbH1N0d/xsSJ5KzBh6V+TDq8/uk+tq6s886s7na+VJgHcNhhyWO9Ymze0zaIarlilxPcdhaEqrYUEZLcLZiA29JQeSkhHRWcEC+Zp7iMuD2Q2koXq0x444192VBIXct068ec6CIvXCNuDHbd/MoC9I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678223483; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=nHEWJ62o/VJ8EVGCBg+hnZDPaMdn8ffAQGXXQugTBr0=; 
	b=EUGU+r+Mr1laPBXSh1EDhXrKyWSyEROMOsDE4WZJpgupQj1PHZdMilvUFe6wIP6OhLNCvqbT0ebvODEazOWFdAunGTfrvN56kI8ySDAUuebHDKdPePKgklKEwivsKbY8qEK/pJvX3Sly1fGFEnV7vbQZFWlh6AY0q+8krLnoT/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678223483;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nHEWJ62o/VJ8EVGCBg+hnZDPaMdn8ffAQGXXQugTBr0=;
	b=K0Oa55MkQsbV4Q+HVOxBLE7muKBK9hA9LJIj1RhRpXKyGhQ16Q39Sh05M6ZwnEuV
	QLVhRJiUzns3nwQMICkYURvXD5RJjuVRS5Vxfs6DxNwhfa4Yrep8qMgywCNrpRSs5U/
	tUeTQxbDUVXhKsVx7hADcQElw9GRACfQH05RpBAM=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 16782234810581014.6128349434224; Tue, 7 Mar 2023 13:11:21 -0800 (PST)
Message-ID: <2da9d544-03b8-8a8c-f7b6-f69a82310cd5@arinc9.com>
Date: Wed, 8 Mar 2023 00:11:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH net] net: dsa: mt7530: permit port 5 to work without port
 6 on MT7621 SoC
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
References: <20230307155411.868573-1-vladimir.oltean@nxp.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230307155411.868573-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131226_822394_9997AC7C 
X-CRM114-Status: GOOD (  30.73  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7.03.2023 18:54, Vladimir Oltean wrote:
> The MT7530 switch from the MT7621 SoC has 2 ports which can be set up as
> internal: port 5 and 6. Arınç reports that the GMAC1 attached to port 5
> receives corrupted frames, unless port 6 (attached to GMAC0) has been
> brought up by the driver. This is true regardless of whether port 5 is
> used as a user port or as a CPU port (carrying DSA tags).
> 
> Offline debugging (blind for me) which began in the linked thread showed
> experimentally that the configuration done by the driver for port 6
> contains a step which is needed by port 5 as well - the write to
> CORE_GSWPLL_GRP2 (note that I've no idea as to what it does, apart from
> the comment "Set core clock into 500Mhz"). Prints put by Arınç show that
> the reset value of CORE_GSWPLL_GRP2 is RG_GSWPLL_POSDIV_500M(1) |
> RG_GSWPLL_FBKDIV_500M(40) (0x128), both on the MCM MT7530 from the
> MT7621 SoC, as well as on the standalone MT7530 from MT7623NI Bananapi
> BPI-R2. Apparently, port 5 on the standalone MT7530 can work under both
> values of the register, while on the MT7621 SoC it cannot.
> 
> The call path that triggers the register write is:
> 
> mt753x_phylink_mac_config() for port 6
> -> mt753x_pad_setup()
>     -> mt7530_pad_clk_setup()
> 
> so this fully explains the behavior noticed by Arınç, that bringing port
> 6 up is necessary.
> 
> The simplest fix for the problem is to extract the register writes which
> are needed for both port 5 and 6 into a common mt7530_pll_setup()
> function, which is called at mt7530_setup() time, immediately after
> switch reset. We can argue that this mirrors the code layout introduced
> in mt7531_setup() by commit 42bc4fafe359 ("net: mt7531: only do PLL once
> after the reset"), in that the PLL setup has the exact same positioning,
> and further work to consolidate the separate setup() functions is not
> hindered.
> 
> Testing confirms that:
> 
> - the slight reordering of writes to MT7530_P6ECR and to
>    CORE_GSWPLL_GRP1 / CORE_GSWPLL_GRP2 introduced by this change does not
>    appear to cause problems for the operation of port 6 on MT7621 and on
>    MT7623 (where port 5 also always worked)
> 
> - packets sent through port 5 are not corrupted anymore, regardless of
>    whether port 6 is enabled by phylink or not (or even present in the
>    device tree)
> 
> My algorithm for determining the Fixes: tag is as follows. Testing shows
> that some logic from mt7530_pad_clk_setup() is needed even for port 5.
> Prior to commit ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK
> API"), a call did exist for all phy_is_pseudo_fixed_link() ports - so
> port 5 included. That commit replaced it with a temporary "Port 5 is not
> supported!" comment, and the following commit 38f790a80560 ("net: dsa:
> mt7530: Add support for port 5") replaced that comment with a
> configuration procedure in mt7530_setup_port5() which was insufficient
> for port 5 to work. I'm laying the blame on the patch that claimed
> support for port 5, although one would have also needed the change from
> commit c3b8e07909db ("net: dsa: mt7530: setup core clock even in TRGMII
> mode") for the write to be performed completely independently from port
> 6's configuration.
> 
> Thanks go to Arınç for describing the problem, for debugging and for
> testing.
> 
> Reported-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Link: https://lore.kernel.org/netdev/f297c2c4-6e7c-57ac-2394-f6025d309b9d@arinc9.com/
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Cheers.
Arınç

