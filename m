Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E055C25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 16:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFn5v4aZRlNAjW16cRM0lg9SWobwZE6eF9Pt1j9/ALk=; b=cPXE/RQCcg6uDFPuTfVaa9C5Wu
	mCStWv9Jg2ZVXghycIaUsKvCDeZ2zBlm0HT9yJQiKpUSbkM5l5GIWXxYyD+K+tC+PrRs/AlrQ2rsf
	H0gH8kqEbBR7DfKCWgVhUCyfzia/wzYIcIluZLOMTvho/r8+SeA8mBepQjGl+6fpIjZARdRPIRd2x
	BANBqCk0potfg+qGuEYJ3Jzh+9Vh6HJrInEMt1UQNmc2alv38xuFN8NOO4cw9ZUEJ5iafEjGHdRXJ
	3UD+CWOFaDNVv5bL/ZX6d/PIQ2cQRtSuYzirVU9bYBuFKzw3Hd62tYeki9C7ZTTz2YLDRiblCaJHA
	97NCZFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4nC-0000000Am0F-30OO;
	Fri, 31 May 2024 16:07:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4n8-0000000AlyF-0DtG;
	Fri, 31 May 2024 16:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50BA062D2D;
	Fri, 31 May 2024 16:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD16C2BD10;
	Fri, 31 May 2024 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171661;
	bh=mE0OUhJiQMMzHxfgx0IOqHje5tQRxYiF+OB7kIk7BQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmIiCxm0t+WW0oDLFbzpb97vsloCQOGygqInun3z/KqgTGXTl0X8sb6iu/GPspD+F
	 NPEMmQfMP5NPkWPOQfPn+ZR01fhntn9dZ4xZJyreUlb5Jt3XqhrOCAgx2X6+3Qar+1
	 sJl0/nS6GLx6bYMl5Q3Nq8TsaS4qvADsYam0QoK25lv4+38tki18s91Ryxs5eCPMLt
	 08S6l5f4C1YPnmOk20oswNPJxj3VLzNXpY8FiHClDIxWUsDgs51ThFWVSM4JmnzSow
	 5xhTgwGIfx6iTjLHyFhjj5oJWbEIomg04B1e5uyTuV9M8mBApgf8D8PsEm0x8SadNf
	 bNMxEUZUv5Mxg==
Date: Fri, 31 May 2024 17:07:32 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
Message-ID: <20240531160732.GT1005600@google.com>
References: <20240510123018.3902184-1-robh@kernel.org>
 <20240531134536.GK1005600@google.com>
 <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_090742_261937_4F1171B5 
X-CRM114-Status: GOOD (  16.07  )
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

On Fri, 31 May 2024, Rob Herring wrote:

> On Fri, May 31, 2024 at 8:45 AM Lee Jones <lee@kernel.org> wrote:
> >
> > On Fri, 10 May 2024, Rob Herring (Arm) wrote:
> >
> > > Add another batch of various "simple" syscon compatibles which were
> > > undocumented or still documented with old text bindings. Remove the old
> > > text binding docs for the ones which were documented.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > This batch is mostly from arm32 platforms.
> > > ---
> > >  .../bindings/arm/amlogic/analog-top.txt       | 20 -------------
> > >  .../bindings/arm/amlogic/assist.txt           | 17 -----------
> > >  .../bindings/arm/amlogic/bootrom.txt          | 17 -----------
> > >  .../devicetree/bindings/arm/amlogic/pmu.txt   | 18 ------------
> > >  .../devicetree/bindings/arm/atmel-sysregs.txt | 29 -------------------
> > >  .../devicetree/bindings/arm/axis.txt          | 16 ----------
> > >  .../arm/cpu-enable-method/al,alpine-smp       | 10 -------
> > >  .../arm/freescale/fsl,vf610-mscm-cpucfg.txt   | 14 ---------
> > >  .../bindings/arm/marvell/marvell,dove.txt     | 15 ----------
> > >  .../devicetree/bindings/arm/spear-misc.txt    |  9 ------
> > >  .../bindings/clock/ti-keystone-pllctrl.txt    | 20 -------------
> > >  .../devicetree/bindings/mfd/syscon.yaml       | 29 +++++++++++++++++++
> > >  .../devicetree/bindings/mips/mscc.txt         | 17 -----------
> > >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
> > >  .../bindings/net/hisilicon-hip04-net.txt      | 10 -------
> > >  15 files changed, 29 insertions(+), 221 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/assist.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/arm/spear-misc.txt
> > >  delete mode 100644 Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt
> >
> > No longer applies.  Please rebase and I'll promptly hoover this up.
> 
> I can't find where it doesn't. Fine on next, v6.10-rc1, your current
> branch. Maybe something you applied today and haven't pushed out?

That could well be the case.

I just pushed for-mfd-next for you.

Thanks.

-- 
Lee Jones [李琼斯]

