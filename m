Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C62C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynebLUbb/OS1lEOlwmoa3g+T2Lx6tLkw2a+fsnX4QtA=; b=yEOVHJTYLh/cjavgx8g9IeSZs+
	JrmiDNzi3hd19jst3YtoGVMJ4z1sDsIzEiEigwlCRciub1AY05oGt6iaQFirhiLR7ToawyVSPFhpp
	eEhUoCyMZLFhOL7y4Nc0IdXRbYNKjDmzNWIQJsjvBql0ZYGtC/cUa/tLALBzN5yf+1PoqqttN54QU
	xoYk1sIQkUbbQliVUxTJwry2Et29pMn8y2V6bklpJWYjGTCNu8mQ82TgLFSHsoydtEzi3rFPICAsr
	KCwvkaaUj6N5XbDbHoB2UEo5iezwIGlkL2NmGzmbrD1UmIwj0k+igh2MQtn5CSfjgwS53UI2NPAhA
	b9PxWpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q14cA-006Tjd-0X;
	Mon, 22 May 2023 12:26:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q14c6-006TfG-1u;
	Mon, 22 May 2023 12:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ynebLUbb/OS1lEOlwmoa3g+T2Lx6tLkw2a+fsnX4QtA=; b=Zo
	0mV7U7BhD8XxxvKJMebwtx6HLD3gvkt0vMFsCP7adGkWT0NplBo6BIqKAoCMtpeSnyWf9yaZvV7fq
	gmJtcguGFsnGizoqQfCdy+cRwKoKhDt4pDDFs0xWVsCQ2oITy5NdsupSK/dCwjoQ0HngOY89ibkcO
	5jTS4d2Cbrzz1XM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q14ba-00DXXA-Si; Mon, 22 May 2023 14:25:38 +0200
Date: Mon, 22 May 2023 14:25:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
Message-ID: <5feba864-b792-4fe4-a58a-e1b22bb7842b@lunn.ch>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_052610_628929_B5B2725A 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:02PM +0300, arinc9.unal@gmail.com wrote:
> Hello!
> 
> This patch series simplifies the code, improves the logic of the switch
> hardware support, traps LLDP frames and BPDUs for MT7530, MT7531, and
> MT7988 SoC switches, and introduces the preferring local CPU port
> operation.

Hi Arınç

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

says:

  Avoid sending series longer than 15 patches. Larger series takes
  longer to review as reviewers will defer looking at it until they
  find a large chunk of time. A small series can be reviewed in a
  short time, so Maintainers just do it. As a result, a sequence of
  smaller series gets merged quicker and with better review coverage.

Given you description above, it sounds like this could easily be split
into smaller patch series.

     Andrew

