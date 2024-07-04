Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0357EC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 14:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7gTBHJfFSYJTT0VfQkBw6g3HeXlI99daI/6NK+nbfg=; b=UGoor/c6u4cCn4VF8QDPNK0tHL
	RKpJoCdrhuPENiJkE3ddsIsMY718zlJAWfhwDqEobLE09v8YViqKUkITq3pUdHqPIJ4+7+72tvmj6
	wN5kEgsjFinfQQ+T4OS8o/cjKFgrkv6W8UVdpi3hr5mmqqnYFIil0xi4RhBkE7veIlNpCEW50mhWy
	GE2gV5y09rl5uZdMA6z4aeWOjA511KuzCdUBYo5QAljXOpdXQIPqHeGxWMgYaTich4sCrks5h47mI
	ZN/2P0Q9F3yW+eTtTnfDl5PFyG+Aepkp0XoUUcZgn2UnqTbDeJVfCvIiEAh2FE3/PpJHjEyhJuCeK
	AB4Fs1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNFx-0000000DPoz-2421;
	Thu, 04 Jul 2024 14:16:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNFk-0000000DPka-0aGw;
	Thu, 04 Jul 2024 14:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A0EDC6278C;
	Thu,  4 Jul 2024 14:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBB9C4AF07;
	Thu,  4 Jul 2024 14:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720102562;
	bh=L/ihgEjN6zr5GAj54jflSDxostKdn540NYuea9kyg08=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sQYI4o0RHwMW6+z/7Bkp1VyyXCl59E4+94LfYY86Ht9ygiOhLD5QN9f93eN92tKUa
	 2R0+M4zxxrWBVUz1V0DZderPRZXbg6E6/mawFZ1vlc/oF6BCg5jMzocRzKsJjRzOPe
	 QXRdGFAyaYz4ApGpvJWtUkQENiip262KVpR7i5vUfEfOkCrhgWr0E/p5Ngvte8Zptu
	 NZQgBX/LXUSHW2A+Rdk3AwMHLXrr33qdWr7voxsTtbZlXe8EHBTKkws0lzUqgm4WVK
	 eqCbCK3N4ZqJLQTY3CYc5O+4D/P5NUKKtQobXSigPXtu9Gk92sl81cfmVamjucjEhK
	 LfKULublCMPpQ==
Date: Thu, 4 Jul 2024 07:16:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Frank Wunderlich <linux@fw-web.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address
 and issue warning
Message-ID: <20240704071600.36e45294@kernel.org>
In-Reply-To: <ZoZ-ClhHUWzAPB1D@makrotopia.org>
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
	<20240703191308.3703099c@kernel.org>
	<ZoZ-ClhHUWzAPB1D@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_071604_403541_114FFF96 
X-CRM114-Status: GOOD (  16.91  )
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

On Thu, 4 Jul 2024 11:48:42 +0100 Daniel Golle wrote:
> > > +return ((((phy_addr - MT7530_NUM_PORTS) & ~MT7530_NUM_PORTS) % PHY_MAX_ADDR) +
> > > +	MT7530_NUM_PORTS) & (PHY_MAX_ADDR - 1);  
> > 
> > nit: the return statement lacks indentation  
> 
> Yes, lacks an additional space to match the level of the first open parentheses.
> I'll fix that in the next round.

To be clear I meant the line with "return", not the continuation line
starting with MT7530_NUM_PORTS

> > but also based on the comment, isn't it:
> > 
> > 	return (round_down(phy_addr, MT7530_NUM_PORTS + 1) - 1)	& (PHY_MAX_ADDR - 1);  
> 
> The original, more complicated statement covers also the correct addresses,
> ie. 31 -> 31, 7 -> 7, 15 -> 15, 23 -> 23. However, the function is never
> called if the address is deemed correct, so that doesn't actually matter.
> 
> It's kinda difficult to decide whether it is more important to return
> correct results also for values never used with the current code, or
> have a slightly more readable and shorter function but with expectations
> regarding the input values given by the caller.
> 
> Opinions?

No strong opinion, but I do think "% PHY_MAX_ADDR" is superfluous, no?
The masking at the end with "& (PHY_MAX_ADDR - 1)" will take care of
truncation.

