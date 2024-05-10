Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D378C25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmQ9AQITJFZy+youh/0jj+z+qY75g9ys3kkz/LOAbwo=; b=keMWajuxd5ZrWQwwfijQJrk8Rh
	dHecIuXu9SYY69vB4V+PBwvBHJmMXpkRh4aecbgZTKjQcYIL4C5X9q1MUhPDbIFsgh0VBNhcvGpZG
	b3y2jzTrbCSeJTy7jSdL8yB3GQ+bCaGWVS/Ish3uhT6L0zM1MGkiAGYefnusGpDH6HpgwsFaE9Uw4
	jL1WTyWUsSQ+JP8qkygXcyPvDJajGGL9vFQtSBAiY4fPT0OIh6jUxSb0TeC5qw/OhI8OAhc2aODCH
	Uf1bpKiw0KBlyc+mXcm81ZTJ7xd4VHvora9WflqwPBpSoXoE6YjTX/Ok0dLr9EJ/JPP3y1+5b9CaY
	2Q2tetdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Wf5-00000006Mkb-1zC8;
	Fri, 10 May 2024 20:16:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Wf2-00000006MjG-0dUx;
	Fri, 10 May 2024 20:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4347CE1EA8;
	Fri, 10 May 2024 20:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F648C113CC;
	Fri, 10 May 2024 20:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715372162;
	bh=pmQ9AQITJFZy+youh/0jj+z+qY75g9ys3kkz/LOAbwo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eq3rLu842lVFGjL//lACe/xYhdPHq7+5jm7/PIJyXOvBAhxNq1hQatlizQKAcrHbe
	 e/vEDsQZTCS/ZmxHhuTtCMzeNq79kJGrvFaTD+gRETEoufZVFr08eE9EfVestsNmcN
	 pF7shYpzPmHWAwgbLxc5ljRjOYRkx3FMfs4z/O4cMxHRWvDeT/s/mUvbTW1Bpze/5W
	 d3cYj8uwV3aLkeZrSbJOM8OkAYgmLD6mxnLbTcvY6/QSpTeFSoRW1PnSB36SwLPkTC
	 7b0Rf5HhPkPZMTsvEcCQ80Tg/FpL5PQSAQoSYqZ+iku9NbXqOOcRk89jVzxpF+DlbY
	 0S9lyaZBIk4Iw==
Message-ID: <d7ce7ea6b13f2da8e07a345365d8f2b3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240510123018.3902184-1-robh@kernel.org>
References: <20240510123018.3902184-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Conor Dooley <conor+dt@kernel.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Gregory Clement <gregory.clement@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Paolo Abeni <pabeni@redhat.com>, Richard Weinberger <richard@nod.at>, Rob Herring (Arm) <robh@kernel.org>, Salil Mehta <salil.mehta@huawei.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, UNGLinuxDriver@microchip.com, Vignesh Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>
Date: Fri, 10 May 2024 13:16:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_131608_401278_A16E94D8 
X-CRM114-Status: UNSURE (   6.60  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Rob Herring (Arm) (2024-05-10 05:30:14)
> Add another batch of various "simple" syscon compatibles which were
> undocumented or still documented with old text bindings. Remove the old
> text binding docs for the ones which were documented.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

