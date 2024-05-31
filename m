Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4167DC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Htk6ueSrYtobgzY0KAFMdP/4G8njYUf6Je9n1CnJg6A=; b=RjwHHgjRm6xKZMNUb2UGh8J7ue
	4h1H834UdG6QVhN3u6OVJ2AJf4/ZmxegKwMJ19JIYCycbiJCHyAzN/Hq5AX1NaZBj4NoKqzkB1xhs
	kH4EcyyNWS+s8e2Hzxt1MtlEzrIS33PFlYGQNcgHOYMLgX8PiZIVrhnoQ1CGx9hZO7jd+acgzQakb
	ePIkLRDfC3NytjqO2nTJxWCGJQ+lVc8Z5QD2ItWnfVo53Y09Sk51kcRoAb1YSHGJTN5jKK/gSnyku
	1BnGS/N6pRuyAfktokkyii3UWJVyVRMSSw1A6rDKPrBB5jginq+UVdrvAlp7ELSv8O0lkJrQmUTIH
	DKO4KF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2Zq-0000000AON5-2hoF;
	Fri, 31 May 2024 13:45:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2Zm-0000000AOMC-2x6T;
	Fri, 31 May 2024 13:45:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE0AD62C21;
	Fri, 31 May 2024 13:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A572BC116B1;
	Fri, 31 May 2024 13:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717163145;
	bh=9bHZx7MoCQbM3wc0+T6G78EbGSWMbO1srcZcLpQFe1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdD3x3baOEE+lLJPD4j0hSwr8gdBDEPG2WDozfakC6eUwn73jRAQv66g4pSumaXxE
	 oWV1EMVpxXj011/a3sEVJL+5xVahBkX5OWLXMQfi4JBOBAqhjVWif43KBF5rQo84Ke
	 uhCtOL/HUYFN3ePGNKE9X4RKq9xPsfnFi6cGcU9m+u50koP1DtWTRls39xB9/UII0I
	 fdSTfPrd5DzgUFJktrEFJYXK3Y9SVW5d9fYRPkpx3cqoPTnj6ge+G4hDTokRCoL6pY
	 0VMFpdkJwbqnlv3qh8BqTWi5j5w+l6SDBYuUg2TaczKCRjlnFnQfVECKEzfKD8GFzm
	 itjSp5c4ci0+w==
Date: Fri, 31 May 2024 14:45:36 +0100
From: Lee Jones <lee@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
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
Message-ID: <20240531134536.GK1005600@google.com>
References: <20240510123018.3902184-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_064546_892190_43942355 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 10 May 2024, Rob Herring (Arm) wrote:

> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> This batch is mostly from arm32 platforms.
> ---
>  .../bindings/arm/amlogic/analog-top.txt       | 20 -------------
>  .../bindings/arm/amlogic/assist.txt           | 17 -----------
>  .../bindings/arm/amlogic/bootrom.txt          | 17 -----------
>  .../devicetree/bindings/arm/amlogic/pmu.txt   | 18 ------------
>  .../devicetree/bindings/arm/atmel-sysregs.txt | 29 -------------------
>  .../devicetree/bindings/arm/axis.txt          | 16 ----------
>  .../arm/cpu-enable-method/al,alpine-smp       | 10 -------
>  .../arm/freescale/fsl,vf610-mscm-cpucfg.txt   | 14 ---------
>  .../bindings/arm/marvell/marvell,dove.txt     | 15 ----------
>  .../devicetree/bindings/arm/spear-misc.txt    |  9 ------
>  .../bindings/clock/ti-keystone-pllctrl.txt    | 20 -------------
>  .../devicetree/bindings/mfd/syscon.yaml       | 29 +++++++++++++++++++
>  .../devicetree/bindings/mips/mscc.txt         | 17 -----------
>  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
>  .../bindings/net/hisilicon-hip04-net.txt      | 10 -------
>  15 files changed, 29 insertions(+), 221 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/analog-top.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/assist.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootrom.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/spear-misc.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti-keystone-pllctrl.txt

No longer applies.  Please rebase and I'll promptly hoover this up.

-- 
Lee Jones [李琼斯]

